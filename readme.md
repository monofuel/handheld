# Portable Handheld

## Printing Instructions
- prototype STLs are available in the v0.9 folder (v1 is pending some improvements listed in `main.scad`)
- needs to be printed in 2 halves, a front half and back half.
  - no supports needed!

- print 12 `washer_4mm.stl` if using `4-40 x 3/8"` screws (these were the screws I had on hand, and were recommended for the pigrrl 2
)
### Multi Material Instructions

Front half is one print and back half is the second print

- Front Half
  - front_case.stl preferably in PETG or PLA (ABS is likely to warp)
  - front_buttons.stl in any non-flexible plastic (preferably colorful!)
  - front_flex.stl in flexible plastic
- Back Half
  - back_case.stl preferably in PETG or PLA (ABS is likely to warp)
  - MM_back_buttons.stl in any non-flexible plastic (preferably colorful!)
  - MM_LR_flex.stl in flexible plastic

### Single Material Instructions

- PETG/PLA preferable:
  - front_case.stl
  - back_case.stl
- any non-flexible plastic:
  - LR_button.stl 2x
  - front_buttons.stl
- flexible plastic
  - LR_flex.stl 2x
  - front_flex.stl

  print all the parts, glue the buttons into the holes on the flexible parts, and then glue the flexible parts to the case.

## TODO

- come up with a good name
- make a BoM
- address fixes for model
- automate building stl's for individual parts of model
- polish and share software setup scripts

## Design Goals
- must fit in pocket
- must be sturdy
- expose audio and hdmi on side of case
- must be modular and easy to replace parts

## Parts

- TODO this list is not complete
- [Raspberry pi 3 A+](https://www.adafruit.com/product/4027)
- [Adafruit PITFT 2.4" touchscreen](https://www.adafruit.com/product/2455)
- perfboard
- [#4-40 3/8 screws](https://www.amazon.com/Machine-Screws-Phillips-Stainless-Quantity/dp/B01LY5VW6Q)
  - possibly substitute with `M3` and modify screws in `main.scad`
  - depending on length, printed washer_4mm may not be needed
- [slim tactile buttons](https://www.adafruit.com/product/1489) for PITFT
- [soft tactile buttons](https://www.adafruit.com/product/3101)
  - can substitute with (clicky switches)[https://www.adafruit.com/product/367]