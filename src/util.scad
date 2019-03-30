module micro_usb() {
    color("grey")
    cube([7.7,5.5,3]);
}

micro_usb();

module header(x_max,y_max) {
    union() {
        for(x=[0:x_max-1]) {
            for(y=[0:y_max-1]) {
                translate([x*2.5,y*2.5]) {
                    color("black")
                        cube([2.5,2.5,2.5]);
                    color("gold")
                        translate([(2.5 - 0.65)/2,(2.5 - 0.65)/2,-2.5])
                        cube([0.65,0.65,11.6]);
                }
            }
        }
    }
}

translate([0,8,0])
    header(2,13);

module sdcard() {

    color("red")
        cube([11,15,0.75]);
}
translate([10,0,0])
    sdcard();

module sdcard_reader() {
    color("grey")
        cube([12,11.65,1.5]);
}
translate([9.5,-0.4,0])
    sdcard_reader();

module hdmi() {
    color("grey")
        cube([11,15,5.6]);

}

translate([30,0,0])
    hdmi();

module usb() {
    color("grey")
    cube([14,14,5.85]);

}

translate([10,20,0])
    usb();

module audio() {
    $fn=30;
    color("black")
        union() {
            cube([7,12.6,6]);
            translate([7/2,14.5,3])
                rotate([90,0,0])
                cylinder(d=6,h=2.5);
        }
}

translate([30,30,0])
    audio();