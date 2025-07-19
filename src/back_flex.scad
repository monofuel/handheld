use <util.scad>;
use <back_buttons.scad>;

// This is the combination of back buttons and their flexible backing
// this is all printed as one part in flexible material

module back_case_flex() {

    color("blue")
        translate([89,21,-4])
        rotate([0,180,0]) {

        translate([-2,-2,0]) cube([24,36,0.4], center=false);
        back_buttons();
    }
    
}

back_case_flex();