use <powerboost.scad>;
use <pi.scad>;

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

module switch() {
    color("black")
        cube([7.75,7.75,2.66]);
    $fn=10;
    // actual height is 2.75, but the buttons are squishy
    // h=2.75
    color("gray")
        translate([7.75/2,7.75/2,2.66])
        cylinder(d=3.5,h=2);
}
translate([])
    switch();


module screw() {
    // 4-40x3/8th screws
    $fn=30;
    width = 2.7;
    thread_height = 7.46;
    head_height = 2;
    head_width = 5.2;
    color("grey")
    cylinder(h=head_height, d1=width, d2=head_width, center=true);
    color("grey")
    translate([0,0,-4])
    cylinder(h=thread_height, d=width, center=true);
}


module screw_with_hole() {
    screw();
    $fn=30;
    
    translate([0,0,7.9])
    // slightly oversized screw head
    cylinder(h=15, d=5.5, center=true);
}

module screw_mount(screw_hole=true) {
    $fn=30;
    thread_height = 7.46;
    width = 2.6; // undersized
    difference() {
        cube([6,8,4], center=true);
        if (screw_hole) {
            #translate([0,0,1])
            cylinder(h=thread_height, d=width, center=true);
        }
    }
}

translate([50,16,2])
    screw_mount(screw_hole=false);

translate([50,4,2])
    screw_mount(screw_hole=true);

module battery() {
    color("grey")
    cube([37,60,7.24]);
}

module washer(h=3,d=5) {
    $fn=30;
    
    difference() {

        cylinder(h=h,d=d, center=true);
        translate([0,0,1])
        screw();
    }
}

module slide_switch() {
    color("grey")
      cube([4.2,11.7,6]);
    color("black")
      translate([1,3.6,6])
      cube([2,2,2]);
}

module dpad_plus(g, extrude=1) {
    $fn=30;
    corners = 10;
    linear_extrude(extrude)
    difference() {
        square(24, center=true);
        translate([g,g]) square(corners, center=true);
         rotate(90) translate([g,g]) square(corners, center=true);
        rotate(180) translate([g,g]) square(corners, center=true);
        rotate(270) translate([g,g]) square(corners, center=true);
    }
}


module top_half() {
  translate([0,0,14])
    pitft();
}

pwr_switch_offset = [98,73,4];

module hardware_back() {
     translate([83,6,3])
         battery(); 
     translate([145,72,3])
         rotate(180)
         powerboost();
    translate([60,70,0])
    rotate(180)
        pi_3_a_plus(); 
    
    translate(pwr_switch_offset)
        rotate([0,90,90])
        slide_switch();
       
}

module hardware_front() {
 translate([60,70,14])
    rotate(180)
        pitft();
    translate([64,6,14])
       controller();     
    
}