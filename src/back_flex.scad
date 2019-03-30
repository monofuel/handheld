use <util.scad>;
use <back_buttons.scad>;

module r_button_flex() {
    color("blue")
    
    difference() {
        translate([78,78.01,0])
        rotate([90,0,180])
        cube([8,8,0.9]);
        back_buttons();
        }
}

module back_case_flex() {
    // R button
    r_button_flex();
    
    // L button
    color("blue")
   
    difference() {
        translate([78,-2.01,0])
        rotate([90,0,180])
        cube([8,8,1]);
            back_buttons();
        }
}

back_case_flex();