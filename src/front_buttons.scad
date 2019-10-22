use <util.scad>;
button_spread=10;
button_size = 4;
button_height = 4;

dpad_offset = [80,22.5,18];
buttons_offset = [80,52.5,18];
option_buttons_offset = [95,7.5,18];

module button() {
     $fn=30;
    translate([0,0,-1.5])
    linear_extrude(button_height)
    circle(button_size);
}

module square_button() {
    translate([-3,-3])
    cube([6,6,button_height], center=false);
}

module rec_button() {
    translate([-2,-3])
    cube([4,6,button_height], center=false);
}

module buttons() {
    translate([0,button_spread,0]) button();
    translate([button_spread,0,0]) button();
    translate([0,-button_spread,0]) button();
    translate([-button_spread,0,0]) button();
}

module option_buttons() {
     translate([4,5,0.5]) square_button();
        translate([4,24,0.5]) rec_button();
        translate([4,36,0.5]) rec_button();
        translate([4,55,0.5]) square_button();
}

module front_buttons() {
    
    translate([0,0,-1.5])
    translate(dpad_offset) dpad_plus(7.8,button_height);
    translate([0,0,-2])
    translate(option_buttons_offset) option_buttons();
    translate([0,0,0])
    translate(buttons_offset) buttons();
    
    pitft_buttons();
    
}

module pitft_buttons() {
    translate([6,16.5,16.5])  rec_button();
    translate([6,26.5,16.5])  rec_button();
    translate([6,36.5,16.5])  rec_button();
    translate([6,46.5,16.5])  rec_button();
    translate([6,56.5,16.5])  rec_button();
}

front_buttons();