use <util.scad>;
use <front_buttons.scad>;
use <front_case.scad>;

module front_case_flex() {
    color("blue")
    
    difference() {
        union() {
            translate([65,7,16])
                cube([40,61,0.4]);
            front_buttons();
        }
        controller_screw_mounts(screw_hole=false);
    }
    color("blue")
    union() {
        translate([2,12,16.6])
            cube([8,50,0.4]);
        pitft_buttons();
        
    }
}

front_case_flex();