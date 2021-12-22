#!/usr/bin/make
DEBUG=
MAK=kibot.mak
CONFIG=usb3-ngff-carrier.kibot.yaml
SCH=usb3-ngff-carrier.sch
PCB=usb3-ngff-carrier.kicad_pcb
DEST=Fabrication

all: erc_and_fab drc_and_fab

$(MAK): $(CONFIG)
	kibot -e $(SCH) -b $(PCB) -c $< -d $(DEST) -m $@

erc: $(MAK)
	$(MAKE) -f $(MAK) run_erc

drc: $(MAK)
	$(MAKE) -f $(MAK) run_drc

sch_fab: $(MAK)
	$(MAKE) -f $(MAK) out_sch

pcb_fab: $(MAK)
	$(MAKE) -f $(MAK) out_pcb

erc_and_fab: $(MAK)
	$(MAKE) -f $(MAK) all_sch

drc_and_fab: $(MAK)
	$(MAKE) -f $(MAK) all_pcb

.PHONY: erc drc sch_fab pcb_fab erc_and_fab drc_and_fab
