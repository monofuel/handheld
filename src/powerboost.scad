use <util.scad>;

// https://learn.adafruit.com/adafruit-powerboost-1000c-load-share-usb-charge-boost/downloads


module powerboost() {
    $fn=32;
    width=22.86;
    length=36.2;

    pcb_height = 1.5;

    color("blue")
        translate([0,0,-pcb_height])
        linear_extrude(pcb_height)
        difference() {
            hull() {
                translate([2,2]) circle(r=2);
                translate([width-2,2]) circle(r=2);
                translate([width-2,length-2]) circle(r=2);
                translate([2,length-2]) circle(r=2);
            }
            // front holes are 2.5
            translate([2.75,2.75]) circle(d=2.5);
            translate([width-2.75,2.75]) circle(d=2.5);

            // back holes are 2.4
            translate([4.8,length-2.3]) circle(d=2.4);
            translate([width-5.4,length-2.2]) circle(d=2.4);
        }

    translate([7.5, 0, 0]) micro_usb();
    color("black")
        translate([0,8,0])
        cube([6.2,8,5.5]);
}

powerboost();