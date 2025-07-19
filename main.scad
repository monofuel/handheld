// models for preview
use <src/pitft.scad>;
use <src/pi.scad>
use <src/controller.scad>;
use <src/util.scad>;

// printed parts
use <src/front_case.scad>;
use <src/front_flex.scad>;
use <src/front_buttons.scad>;
use <src/back_case.scad>;
use <src/back_flex.scad>;
use <src/back_buttons.scad>;

module handheld() {
    // hardware_front();
    hardware_back();
    // pitft_washers();
    // pi_washers();
    // front_case_flex();
    // back_case_flex();
    // beveled_front_case();
    beveled_back_case();
}
handheld();

// TODO

// the 2 powerboost 1000c screw posts on the right side of the case are good
// the 2 on the left side are not positioned properly

// some screw holes too close to edge of case
