use <util.scad>;
use <back_buttons.scad>;

module back_case_flex() {

    color("blue")
        translate([89,21,-4])
        rotate([0,180,0]) {

        translate([-2,-2,-1]) cube([24,36,0.8], center=false);
        back_buttons();
    }
    
}

back_case_flex();