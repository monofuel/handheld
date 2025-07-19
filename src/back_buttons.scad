button_height = 3;

// I had extra GPIO pins on the back half and so added an extra L2 and R2
// IMPORTANT: these buttons have to line up with the switches on the perfboard, and on the pitft
// their locations can't move

module lr_button() {
    // L1, L2, R1, R2
    cube([8,12,button_height], center=false);
}
module lr_button_cutout() {
    // how much space to carve out of the case
    translate([-0.5,-0.5,0])
        cube([9,13,5], center=false);
}

module back_buttons() {
    // All 4 buttons are identical and symmetric
    // I don't really know which is which (doesn't really matter?)

    color("blue") {
        translate([0,0,0]) lr_button();
        translate([12,0,0]) lr_button();

        translate([0,20,0]) lr_button();
        translate([12,20,0]) lr_button();
    }
    
}

back_buttons();