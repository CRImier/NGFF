from __future__ import division
import pcbnew
import FootprintWizardBase

# Dimensions from PCIe M.2 Specification rev 1.0 §2.3.5.2.
keying = {
    "A": {
        "KeyCenter": 6.625,  # Distance from the center of the footprint to the center of the key
        "PinMin": 8,
        "PinMax": 15,
    },
    "B": {
        "KeyCenter": 5.625,
        "PinMin": 12,
        "PinMax": 19,
    },
    "E": {
        "KeyCenter": 2.625,
        "PinMin": 24,
        "PinMax": 31,
    },
    "G": {
        "KeyCenter": -1.125,
        "PinMin": 39,
        "PinMax": 46,
    },
    "M": {
        "KeyCenter": -6.125,
        "PinMin": 59,
        "PinMax": 66,
    },
}

connectorHeight = pcbnew.FromMM(4.0)

connectorTotalWidth = pcbnew.FromMM(22.0)
connectorTongueWidth = pcbnew.FromMM(19.85)

connectorBaseArcRadius = pcbnew.FromMM(0.50)
connectorBaseLength = (connectorTotalWidth - connectorTongueWidth) / 2.0 - connectorBaseArcRadius;

padWidth = pcbnew.FromMM(0.35)
padPitch = pcbnew.FromMM(0.50)

# Pad heights include the vertical offset.
topPadHeight = pcbnew.FromMM(2.0)
bottomPadHeight = pcbnew.FromMM(2.50)
padVerticalOffset = pcbnew.FromMM(0.55)

topKeepout = pcbnew.FromMM(4.0)
bottomKeepout = pcbnew.FromMM(5.20)

keyDiameter = pcbnew.FromMM(1.20)
keyHeight = pcbnew.FromMM(3.50)

class NGFF_FootprintWizard(FootprintWizardBase.FootprintWizard):
    def GetName(self):
        return "NGFF (M.2) Edge Connector"

    def GetDescription(self):
        return "NGFF (M.2) Edge Connector Wizard"

    def GetValue(self):
        first = self.GetParam("Keying", "First").value
        second = self.GetParam("Keying", "Second").value
        if first:
            if second:
                return "NGFF_%s+%s" % (first, second)
            else:
                return "NGFF_%s" % first
        elif second:
            return "NGFF_%s" % second
        else:
            return "NGFF"

    def GenerateParameterList(self):
        self.AddParam("Keying", "First", self.uString, "B")
        self.AddParam("Keying", "Second", self.uString, "M")

    def firstKey(self):
        first = self.GetParam("Keying", "First").value
        return keying.get(first, None)

    def secondKey(self):
        second = self.GetParam("Keying", "Second").value
        return keying.get(second, None)

    def omitPin(self, number):
        firstKey = self.firstKey()
        if firstKey and firstKey["PinMin"] <= number <= firstKey["PinMax"]:
            return True

        secondKey = self.secondKey()
        if secondKey and secondKey["PinMin"] <= number <= secondKey["PinMax"]:
            return True

    def createPad(self, number, name):
        top = number % 2 == 1

        if self.omitPin(number):
            return None

        padTotalHeight = topPadHeight if top else bottomPadHeight
        padHeight = padTotalHeight - padVerticalOffset

        padSize = pcbnew.wxSize(padWidth, padHeight)

        padOneCenterX = pcbnew.FromMM(18 * 0.5 + 0.25)
        padTwoCenterX = padOneCenterX + pcbnew.FromMM(0.25)

        pad = pcbnew.D_PAD(self.module)

        layerSet = pcbnew.LSET()

        if top:
            # On the top, 0.0 is centered between pads 35 and 37.
            padOffset = (number - 1) / 2
            padCenterX = padOneCenterX - pcbnew.FromMM(padOffset * 0.5)
            layerSet.AddLayer(pcbnew.F_Cu)
        else:
            # On the bottom, 0.0 is the center of pad 36.
            padOffset = (number) / 2
            padCenterX = padTwoCenterX - pcbnew.FromMM(padOffset * 0.5)
            layerSet.AddLayer(pcbnew.B_Cu)

        padCenterY = -(padVerticalOffset + padHeight / 2.0)
        padCenter = pcbnew.wxPoint(padCenterX, padCenterY)

        pad.SetSize(padSize)
        pad.SetPos0(padCenter)
        pad.SetPosition(padCenter)
        pad.SetShape(pcbnew.PAD_SHAPE_RECT)
        pad.SetAttribute(pcbnew.PAD_ATTRIB_SMD)
        pad.SetLayerSet(layerSet)
        pad.SetPadName(name)
        return pad

    def Arc(self, cx, cy, sx, sy, a):
        circle = pcbnew.EDGE_MODULE(self.module)
        circle.SetWidth(self.draw.dc['lineThickness'])

        center = self.draw.TransformPoint(cx, cy)
        start = self.draw.TransformPoint(sx, sy)

        circle.SetLayer(self.draw.dc['layer'])
        circle.SetShape(pcbnew.S_ARC)

        circle.SetAngle(a)
        circle.SetStartEnd(center, start)
        self.draw.module.Add(circle)

    def CheckParameters(self):
        first = self.GetParam("Keying", "First")
        second = self.GetParam("Keying", "Second")
        if first.value and first.value not in keying:
            msg = "Unknown first keying: %s (supported: %s)" % (first, ", ".join(sorted(keying.keys())))
            first.AddError(msg)

        if second.value and second.value not in keying:
            msg = "Unknown second keying: %s (supported: %s)" % (second, ", ".join(sorted(keying.keys())))
            second.AddError(msg)

        # if second key is "earlier" than the first key, swap them
        # otherwise, there's some funky stuff happening?
        if first.value and second.value:
            if ord(first.value) > ord(second.value):
                f, s = first.value, second.value
                second.SetValue(f)
                first.SetValue(s)

    def FilledBox(self, x1, y1, x2, y2):
        box = pcbnew.EDGE_MODULE(self.module)
        box.SetShape(pcbnew.S_POLYGON);

        corners = pcbnew.wxPoint_Vector()
        corners.append(pcbnew.wxPoint(x1, y1))
        corners.append(pcbnew.wxPoint(x2, y1))
        corners.append(pcbnew.wxPoint(x2, y2))
        corners.append(pcbnew.wxPoint(x1, y2))

        box.SetPolyPoints(corners)
        return box

    def drawSolderMaskOpening(self, x1, x2, height, layer):
        rectCenterX = pcbnew.FromMM(0.0)
        rectCenterY = -height / 2.0

        box = self.FilledBox(x1, pcbnew.FromMM(0.0), x2, -height)
        box.SetLayer(layer)
        self.draw.module.Add(box)

    def BuildThisFootprint(self):
        draw = self.draw
        draw.SetLineThickness(pcbnew.FromMM(0.05))
        draw.Value(0, pcbnew.FromMM(2.0), self.GetTextSize())
        draw.Reference(0, pcbnew.FromMM(4.0), self.GetTextSize())

        draw.SetLayer(pcbnew.Edge_Cuts)
        centerX = centerY = pcbnew.FromMM(0.0)

        bottomEndpoints = []

        # Left base
        topLeftX = -connectorTotalWidth / 2.0
        topLeftY = -connectorHeight

        topLeftArcStartX = topLeftX + connectorBaseLength
        topLeftArcStartY = topLeftY

        draw.Line(topLeftX, topLeftY, topLeftArcStartX, topLeftY)

        topLeftArcCenterX = topLeftArcStartX
        topLeftArcCenterY = topLeftArcStartY + connectorBaseArcRadius
        topLeftArcAngle = 900 # decidegrees

        self.Arc(topLeftArcCenterX, topLeftArcCenterY, topLeftArcStartX, topLeftArcStartY, topLeftArcAngle)

        topLeftArcEndX = topLeftArcStartX + connectorBaseArcRadius
        topLeftArcEndY = topLeftArcStartY + connectorBaseArcRadius

        bottomLeftX = topLeftArcEndX
        bottomLeftY = topLeftArcEndY + connectorHeight - connectorBaseArcRadius

        bottomEndpoints.append(bottomLeftX)

        draw.Line(topLeftArcEndX, topLeftArcEndY, bottomLeftX, bottomLeftY)

        KeyArcAngle = 1800 # decidegrees

        # small inline function for notch drawing
        def draw_key(KeyCenter):
            leftX = centerX + KeyCenter - keyDiameter / 2.0
            rightX = leftX + keyDiameter
            topY = centerY - keyHeight + keyDiameter / 2.0
            # left line
            draw.Line(leftX, centerY, leftX, topY)
            # right line
            draw.Line(rightX, centerY, rightX, topY)
            # arc
            self.Arc(KeyCenter, topY, leftX, topY, KeyArcAngle)

        # keys go from left to right and it's more comfortable to preserve this order
        # so, leftmost (second) key first

        for key in [self.secondKey(), self.firstKey()]:
            if key:
                KeyCenter = pcbnew.FromMM(key["KeyCenter"])
                draw_key(KeyCenter)

                leftX = centerX + KeyCenter - keyDiameter / 2.0
                rightX = leftX + keyDiameter

                bottomEndpoints += [leftX, rightX]

        bottomRightX = connectorTongueWidth / 2.0
        bottomRightY = centerY

        topRightArcStartX = bottomRightX
        topRightArcStartY = bottomRightY - connectorHeight + connectorBaseArcRadius

        bottomEndpoints.append(bottomRightX)

        draw.Line(bottomRightX, bottomRightY, topRightArcStartX, topRightArcStartY)

        topRightArcCenterX = topRightArcStartX + connectorBaseArcRadius
        topRightArcCenterY = topRightArcStartY
        topRightArcAngle = 900 # decidegrees

        self.Arc(topRightArcCenterX, topRightArcCenterY, topRightArcStartX, topRightArcStartY, topRightArcAngle)

        topRightArcEndX = topRightArcStartX + connectorBaseArcRadius
        topRightArcEndY = topRightArcStartY - connectorBaseArcRadius

        topRightX = connectorTotalWidth /2.0
        topRightY = -connectorHeight

        draw.Line(topRightArcEndX, topRightArcEndY, topRightX, topRightY)

        for endpoints in zip(bottomEndpoints[0::2], bottomEndpoints[1::2]):
            self.drawSolderMaskOpening(endpoints[0], endpoints[1], topPadHeight, pcbnew.F_Mask)
            self.drawSolderMaskOpening(endpoints[0], endpoints[1], bottomPadHeight, pcbnew.B_Mask)
            draw.Line(endpoints[0], centerY, endpoints[1], centerY) # drawing the bottom lines

        for padNumber in range(1, 76):
            pad = self.createPad(padNumber, str(padNumber))
            if pad:
                self.module.Add(pad)

NGFF_FootprintWizard().register()
