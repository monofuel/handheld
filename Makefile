V=1.00
DIR=v${V}

.PHONY: all
all: front_buttons front_flex front_case back_buttons back_flex back_case washer_3mm washer_4mm
	echo done!

.PHONY: front_buttons
front_buttons: dir
	openscad -o v${V}/front_buttons.stl src/front_buttons.scad

.PHONY: front_flex
front_flex: dir
	openscad -o v${V}/front_flex.stl src/front_flex.scad

.PHONY: front_case
front_case: dir
	openscad -o v${V}/front_case.stl src/front_case.scad

.PHONY: back_buttons
back_buttons: dir
	openscad -o v${V}/back_buttons.stl src/back_buttons.scad

.PHONY: back_flex
back_flex: dir
	openscad -o v${V}/back_flex.stl src/back_flex.scad

.PHONY: back_case
back_case: dir
	openscad -o v${V}/back_case.stl src/back_case.scad

.PHONY: washer_3mm
washer_3mm: dir
	openscad -o v${V}/washer_3mm.stl src/washer_3mm.scad

.PHONY: washer_4mm
washer_4mm: dir
	openscad -o v${V}/washer_4mm.stl src/washer_4mm.scad

.PHONY: dir
dir:
	mkdir ${DIR} || true
