button_height = 3;

module lr_button() {
    cube([8,12,button_height], center=false);
}
module lr_button_cutout() {
    translate([-0.5,-0.5,0])
        cube([9,13,5], center=false);
}

module back_buttons() {
    color("blue") {

        translate([0,0,0]) lr_button();
        translate([12,0,0]) lr_button();

        translate([0,20,0]) lr_button();
        translate([12,20,0]) lr_button();
    }
    
}

back_buttons();