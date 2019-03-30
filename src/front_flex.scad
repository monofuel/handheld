use <util.scad>;
use <front_buttons.scad>;

module front_case_flex() {
    color("blue")
    
    difference() {
        translate([65,7,16.6])
        cube([40,61,0.8]);
        front_buttons();
            translate([68,9,16])
            rotate([0,180,0])
            cube([6,8,4], center=true);
        translate([68,66,16])
            rotate([0,180,0])
            cube([6,8,4], center=true);
        
        translate([100,22,16])
            rotate([0,180,0])
           cube([6,8,4], center=true);
        
        translate([100,53,16])
            rotate([0,180,0])
           cube([6,8,4], center=true);
    }
    color("blue")
    difference() {
        translate([2,12,16.6])
        cube([8,50,0.8]);
        pitft_buttons();
        
    }
}

front_case_flex();