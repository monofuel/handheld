use <util.scad>;
use <front_buttons.scad>;
use <front_case.scad>;

// This is the combination of front buttons and their flexible backing
// this is all printed as one part in flexible material

module front_case_flex() {
    color("blue")
    
    difference() {
        union() {
            translate([65,7,16])
                cube([40,61,0.8]);
            front_buttons();
        }
        controller_screw_mounts(screw_hole=false);
    }
    color("blue")
    union() {
        translate([2,12,16.6])
            cube([8,50,0.8]);
        pitft_buttons();
        
    }
}

front_case_flex();