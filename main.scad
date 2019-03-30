// models for preview
use <src/pitft.scad>;
use <src/powerboost.scad>;
use <src/pi.scad>
use <src/controller.scad>;
ues <src/util.scad>;

// printed parts
use <src/front_case.scad>;
use <src/front_flex.scad>;
use <src/front_buttons.scad>;
use <src/back_case.scad>;
use <src/back_flex.scad>;
use <src/back_buttons.scad>;

module handheld() {
    hardware_front();
    hardware_back();
    pitft_washers();
    pi_washers();
    front_case_flex();
    back_buttons();
    back_case_flex();
    front_buttons();
    beveled_front_case();
    beveled_back_case();
}
handheld();

// What's good
// power switch is usable
// power jack works
// pi outputs are good
// sd card has enough space
// both halves come together great
// PITFT buttons function!

// TODO
// V1 fixes

// gap between buttons and case could be smaller
//   d-pad could be bigger and closer to case
//   ab/xy buttons could be bigger (don't feel super great)
// I think the flexible backing to the buttons is too thick, and doesn't work with soft buttons
// back 2 screw holes for powerboost need to be closer together (not in corners)
// front 2 powerboot screws are too far apart (slightly off)
// fix thin bridge over power switch
// power switch hole needs to be a little bigger
// more support behind R button to stop it from moving
// L and R buttons probably need more room, way too close to outside of case for soft buttons
// model shows 3mm washers for each screw, but actaully use 4mm. I think the screw mounts need to be 1mm deeper
// hdmi cutout can be smaller (while still working with hdmi cables)
// usb cutout can be smaller
// screw holes could be bigger
// some screw holes too close to edge of case
// case screws should probably only thread into the top half of the case
// back case could be 2mm instead of 3mm (hefty!)

// V2
// psp joystick
// L2 / R2
// flexible plastic for grips on sides
// better L/R placement?
// alternative batteries?
