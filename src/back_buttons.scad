use <front_buttons.scad>;

module l_button() {
    translate([74,-1,4])
    rotate([90,0,0])
    difference() {
        square_button();
        translate([-4,-3,1.3])
        rotate([45,0,0])
        cube([8,2,2]);
    }
}

module r_button() {
    translate([74,80.5,4])
    rotate([90,0,0])
    difference() {
        square_button();
        translate([-4,-3,-1.4])
        rotate([45,0,0])
        cube([8,2,2]);
    }
}

module back_buttons() {
    l_button();
    r_button();
}

back_buttons();