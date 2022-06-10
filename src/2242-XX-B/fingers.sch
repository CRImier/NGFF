EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 4550 4300
NoConn ~ 4550 4200
NoConn ~ 4550 4000
NoConn ~ 4550 3900
$Comp
L power:+3.3V #PWR?
U 1 1 5DCE825A
P 3000 2050
AR Path="/5DCE825A" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5DCE825A" Ref="#PWR0304"  Part="1" 
F 0 "#PWR0304" H 3000 1900 50  0001 C CNN
F 1 "+3.3V" H 3015 2223 50  0000 C CNN
F 2 "" H 3000 2050 50  0001 C CNN
F 3 "" H 3000 2050 50  0001 C CNN
	1    3000 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2050 3000 2100
Wire Wire Line
	3000 2100 3150 2100
Wire Wire Line
	3150 2200 3000 2200
Wire Wire Line
	3000 2200 3000 2100
Connection ~ 3000 2100
Wire Wire Line
	3150 2300 3000 2300
Wire Wire Line
	3000 2300 3000 2200
Connection ~ 3000 2200
Wire Wire Line
	3150 5600 3050 5600
Wire Wire Line
	3050 5600 3050 5700
Wire Wire Line
	3050 5700 3150 5700
Wire Wire Line
	3050 5700 3050 5800
Connection ~ 3050 5700
$Comp
L power:+3.3V #PWR?
U 1 1 5DCE826D
P 2850 5800
AR Path="/5DCE826D" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5DCE826D" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 2850 5650 50  0001 C CNN
F 1 "+3.3V" H 2865 5973 50  0000 C CNN
F 2 "" H 2850 5800 50  0001 C CNN
F 3 "" H 2850 5800 50  0001 C CNN
	1    2850 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5800 3050 5800
$Comp
L power:GND #PWR?
U 1 1 5DCE8274
P 4800 5600
AR Path="/5DCE8274" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5DCE8274" Ref="#PWR0311"  Part="1" 
F 0 "#PWR0311" H 4800 5350 50  0001 C CNN
F 1 "GND" H 4805 5427 50  0000 C CNN
F 2 "" H 4800 5600 50  0001 C CNN
F 3 "" H 4800 5600 50  0001 C CNN
	1    4800 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5600 4650 5600
Wire Wire Line
	4550 5500 4650 5500
Wire Wire Line
	4650 5500 4650 5600
Connection ~ 4650 5600
Wire Wire Line
	4650 5600 4550 5600
$Comp
L power:GND #PWR?
U 1 1 5DCE82A2
P 5100 2200
AR Path="/5DCE82A2" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5DCE82A2" Ref="#PWR0313"  Part="1" 
F 0 "#PWR0313" H 5100 1950 50  0001 C CNN
F 1 "GND" H 5105 2027 50  0000 C CNN
F 2 "" H 5100 2200 50  0001 C CNN
F 3 "" H 5100 2200 50  0001 C CNN
	1    5100 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2200 4650 2200
Wire Wire Line
	4550 2100 4650 2100
Wire Wire Line
	4650 2100 4650 2200
Connection ~ 4650 2200
Wire Wire Line
	4650 2200 4550 2200
NoConn ~ 3150 2500
NoConn ~ 3150 2600
NoConn ~ 3150 2700
NoConn ~ 3150 2800
Text HLabel 4700 5400 2    50   BiDi ~ 0
USB_D+
Text HLabel 4700 5300 2    50   BiDi ~ 0
USB_D-
Wire Wire Line
	4550 5400 4700 5400
Wire Wire Line
	4700 5300 4550 5300
$Comp
L power:GND #PWR?
U 1 1 5DCEA3E4
P 4850 5000
AR Path="/5DCEA3E4" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5DCEA3E4" Ref="#PWR0312"  Part="1" 
F 0 "#PWR0312" H 4850 4750 50  0001 C CNN
F 1 "GND" H 4855 4827 50  0000 C CNN
F 2 "" H 4850 5000 50  0001 C CNN
F 3 "" H 4850 5000 50  0001 C CNN
	1    4850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5000 4650 5000
Wire Wire Line
	4650 5000 4650 5200
Wire Wire Line
	4650 5200 4550 5200
$Comp
L power:GND #PWR?
U 1 1 5DCEC5D6
P 4800 4400
AR Path="/5DCEC5D6" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5DCEC5D6" Ref="#PWR0310"  Part="1" 
F 0 "#PWR0310" H 4800 4150 50  0001 C CNN
F 1 "GND" H 4805 4227 50  0000 C CNN
F 2 "" H 4800 4400 50  0001 C CNN
F 3 "" H 4800 4400 50  0001 C CNN
	1    4800 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4400 4550 4400
NoConn ~ 4550 4500
Text Notes 7150 2550 0    50   ~ 0
LED_1# and W_DISABLE1 # are intended for use with the WWAN solution.\nThere are additional WWAN and GNSS related pins including W_DISABLE2#, DPR, and\nWAKE_ON_WWAN #.\n\nThe FULL_CARD_POWER_OFF# pin must be pulled low on the Adapter with a weak pull-down\nresistor of >20 kΩ. The Adapter design must ensure that the operation of this pin is asynchronous to\nany other interface operation.\n\nThe GPIO_0 to GPIO_11 pins are configurable with four different variants. These variants\nsupport the GNSS interface, second UIM/SIM, Audio interfaces, HSIC and IPC sidebands. The\nexact definition is determined by which configuration was identified by decoding the four\nConfiguration pins.\n\nThe FULL_CARD_POWER_OFF# and the RESET# pins are unique and intended to be used\nwhen the WWAN solution is plugged into Platforms that provide a direct connection to V BAT\n(and not a regulated 3.3 V) such as Tablet Platforms. They are not used in NB and very thin\nnotebooks type Platforms that provide a regulated 3.3 V power rail. But the\nFULL_CARD_POWER_OFF# signals should be tied to the 3.3 V power rail on the NB/very\nthin Platform.\n\nThe SUSCLK pin provides a Slow Clock signal of 32 kHz to enable Low Power States.
NoConn ~ 4550 2800
NoConn ~ 4550 2700
NoConn ~ 4550 2600
NoConn ~ 4550 2500
$Comp
L Device:R R301
U 1 1 5E0D4B51
P 2450 5250
F 0 "R301" H 2520 5296 50  0000 L CNN
F 1 "200K" H 2520 5205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2380 5250 50  0001 C CNN
F 3 "~" H 2450 5250 50  0001 C CNN
	1    2450 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5400 3150 5400
$Comp
L power:+3.3V #PWR?
U 1 1 5E0D5CA6
P 2450 5100
AR Path="/5E0D5CA6" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5E0D5CA6" Ref="#PWR0301"  Part="1" 
F 0 "#PWR0301" H 2450 4950 50  0001 C CNN
F 1 "+3.3V" H 2465 5273 50  0000 C CNN
F 2 "" H 2450 5100 50  0001 C CNN
F 3 "" H 2450 5100 50  0001 C CNN
	1    2450 5100
	1    0    0    -1  
$EndComp
Text HLabel 2900 5250 1    50   Output ~ 0
WWAN_LED
Wire Wire Line
	3150 5300 2900 5300
Wire Wire Line
	2900 5300 2900 5250
$Comp
L Device:R R302
U 1 1 5E0D8EEA
P 2450 5650
F 0 "R302" H 2520 5696 50  0000 L CNN
F 1 "200K" H 2520 5605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2380 5650 50  0001 C CNN
F 3 "~" H 2450 5650 50  0001 C CNN
	1    2450 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5500 3150 5500
$Comp
L power:GND #PWR?
U 1 1 5E0DA1E8
P 2450 5800
AR Path="/5E0DA1E8" Ref="#PWR?"  Part="1" 
AR Path="/5DCE3204/5E0DA1E8" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 2450 5550 50  0001 C CNN
F 1 "GND" H 2455 5627 50  0000 C CNN
F 2 "" H 2450 5800 50  0001 C CNN
F 3 "" H 2450 5800 50  0001 C CNN
	1    2450 5800
	1    0    0    -1  
$EndComp
Text Notes 900  5750 0    50   ~ 0
FULL_CARD_POWER_OFF# is an\nactive low input signal that is used\nto turn off the entire Adapter.
Text Notes 900  5400 0    50   ~ 0
W_DISABLE#1 The wireless disable\nsignals are active low signals that\nwhen asserted (driven low) by the\nsystem must disable radio operation.
$Comp
L power:GND #PWR0315
U 1 1 5E0E1DA8
P 7250 6100
F 0 "#PWR0315" H 7250 5850 50  0001 C CNN
F 1 "GND" H 7255 5927 50  0000 C CNN
F 2 "" H 7250 6100 50  0001 C CNN
F 3 "" H 7250 6100 50  0001 C CNN
	1    7250 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0317
U 1 1 5E0E6DC0
P 8350 6100
F 0 "#PWR0317" H 8350 5850 50  0001 C CNN
F 1 "GND" H 8355 5927 50  0000 C CNN
F 2 "" H 8350 6100 50  0001 C CNN
F 3 "" H 8350 6100 50  0001 C CNN
	1    8350 6100
	1    0    0    -1  
$EndComp
Text Label 4950 4700 2    50   ~ 0
CONFIG_0
Wire Wire Line
	4950 4700 4550 4700
Text Label 6700 5900 0    50   ~ 0
CONFIG_0
Text Label 7800 5900 0    50   ~ 0
CONFIG_1
$Comp
L power:GND #PWR0319
U 1 1 5E0EB4BE
P 9450 6100
F 0 "#PWR0319" H 9450 5850 50  0001 C CNN
F 1 "GND" H 9455 5927 50  0000 C CNN
F 2 "" H 9450 6100 50  0001 C CNN
F 3 "" H 9450 6100 50  0001 C CNN
	1    9450 6100
	1    0    0    -1  
$EndComp
Text Label 8900 5900 0    50   ~ 0
CONFIG_2
Text Label 9950 5900 0    50   ~ 0
CONFIG_3
Wire Wire Line
	9950 5900 10350 5900
Text Label 5050 5950 2    50   ~ 0
CONFIG_3
Wire Wire Line
	5050 5950 4650 5950
Wire Wire Line
	4650 5950 4650 5700
Wire Wire Line
	4650 5700 4550 5700
Text Label 4950 2300 2    50   ~ 0
CONFIG_1
Text Label 4950 2000 2    50   ~ 0
CONFIG_2
Wire Wire Line
	4950 2000 4550 2000
Wire Wire Line
	4550 2300 4950 2300
Text Notes 6700 5400 0    50   ~ 0
Using Add-In Card interface of "WWAN – USB3.1 Gen1", Port Configration 0.
Text HLabel 2950 4100 0    50   BiDi ~ 0
UIM_DATA
Text HLabel 2950 4200 0    50   BiDi ~ 0
UIM_CLK
Text HLabel 2950 4300 0    50   BiDi ~ 0
UIM_RESET
Wire Wire Line
	2950 4200 3150 4200
Wire Wire Line
	3150 4300 2950 4300
Wire Wire Line
	2950 4100 3150 4100
$Comp
L M.2:M.2_NGFF_Socket2_KeyB_SSIC_Adapter U?
U 1 1 5DCE82AD
P 3850 3850
AR Path="/5DCE82AD" Ref="U?"  Part="1" 
AR Path="/5DCE3204/5DCE82AD" Ref="U301"  Part="1" 
F 0 "U301" H 3850 5965 50  0000 C CNN
F 1 "M.2_NGFF_Socket2_KeyB_SSIC_Adapter" H 3850 5874 50  0000 C CNN
F 2 "M.2:M.2_Key_B_Fingers" H 5950 4150 50  0001 C CNN
F 3 "" H 5950 4150 50  0001 C CNN
	1    3850 3850
	1    0    0    -1  
$EndComp
Text HLabel 2950 4000 0    50   BiDi ~ 0
UIM_PWR
Wire Wire Line
	2950 4000 3150 4000
NoConn ~ 4550 4600
NoConn ~ 3150 4800
NoConn ~ 3150 4700
NoConn ~ 3150 4600
NoConn ~ 3150 4500
NoConn ~ 3150 4400
NoConn ~ 3150 3800
NoConn ~ 3150 3700
NoConn ~ 3150 3600
NoConn ~ 3150 3500
NoConn ~ 3150 3400
NoConn ~ 3150 2400
Text HLabel 4650 2400 2    50   Output ~ 0
RESET#
Wire Wire Line
	4650 2400 4550 2400
NoConn ~ -3150 5500
Wire Wire Line
	7250 5900 7250 6100
Wire Wire Line
	6700 5900 7250 5900
Wire Wire Line
	8350 5900 8350 6100
Wire Wire Line
	7800 5900 8350 5900
Wire Wire Line
	9450 5900 9450 6100
Wire Wire Line
	8900 5900 9450 5900
NoConn ~ 10350 5900
NoConn ~ 4550 4100
NoConn ~ 4550 3800
NoConn ~ 4550 3200
NoConn ~ 4550 3500
NoConn ~ 4550 2900
$EndSCHEMATC
