
// some stuff borrowed from https://github.com/RigacciOrg/openscad-rpi-library

//------------------------------------------------------------------------
// Matrix of 2.54 mm pins.
//------------------------------------------------------------------------
module pin_headers(cols, rows) {
    w = 2.54; h = 2.54; p = 0.65;
    for(x = [0 : (cols -1)]) {
        for(y = [0 : (rows  - 1)]) {
            translate([w * x, w * y, 0]) {
                union() {
                    color("black") cube([w, w, h]);
                    color("gold")  translate([(w - p) / 2, (w - p) / 2, -3]) cube([p, p, 11.54]);
                }
            }
        }
    }
}

module hdmi_connector(x, y, z) {
    color("silver") cube([x, y, z]);
}

module microusb_connector(x, y, z) {
    color("silver") cube([x, y, z]);
}

module audio_video(size_x) {
    color([58/255, 58/255, 58/255]) {
        cube([size_x, 7, 5.6]);
        translate([size_x, 7 / 2, 5.6 / 2]) rotate([0,90,0]) cylinder(d=5.6, h=2.6);
    }
}

module micro_sd_card() {
    color("silver")   translate([0,  0.0, -1.5]) cube([14, 13, 1.5]);
    color("darkblue") translate([2, -3.2, -1.0]) cube([11, 15, 1.0]);
}

module usb_connector(x, y, z) {
    f = 0.6; // Flange
    color("silver") cube([x, y, z]);
    translate([-f, y - f, -f])
        color("silver") cube([x + f * 2, f, z + f * 2]);
}

//------------------------------------------------------------------------
// Raspberry Pi Model A+ rev.1.1
//------------------------------------------------------------------------
module board_raspberrypi_model_a_plus_rev1_1() {

    $fn = 32;
    x  = 56;     y = 65;    z = 1.60;  // Measured PCB size
    hx = 11.40; hy = 15.1; hz = 6.15;  // Measured HDMI connector size
    ux = 13.25; uy = 13.8; uz = 6.0;   // Measured USB connector size
    mx =  5.60; my =  7.6; mz = 2.40;  // Measured micro USB power connector size

    // The origin is the lower face of PCB.
    translate([0, 0, z]) {
        translate([1.0, 7.1, 0])                    pin_headers(2, 20);
        translate([x - hx + 1, 32.0 - (hy / 2), 0]) hdmi_connector(hx, hy, hz);
        translate([x - mx + 1, 10.6 - (my / 2), 0]) microusb_connector(mx, my, mz);
        translate([18, y - 12, 0.8])                usb_connector(ux, uy, uz);
        translate([20.5, 0.8, -z])                  micro_sd_card();
        translate([x - 12.8, 50, 0])                audio_video(12.8);
        translate([0, 0, -z]) {
            color("green") linear_extrude(height=z)
                difference() {
                    hull() {
                        translate([  3,   3]) circle(r=3);
                        translate([x-3,   3]) circle(r=3);
                        translate([x-3, y-3]) circle(r=3);
                        translate([  3, y-3]) circle(r=3);
                    }
                    raspberrypi_model_a_plus_rev1_1_holes();
                }
        }
    }
}

//------------------------------------------------------------------------
// Holes for the Raspberry Pi Model A+ rev.1.1.
//------------------------------------------------------------------------
module raspberrypi_model_a_plus_rev1_1_holes() {
    x = 56;
    translate([3.5, 3.5])            circle(r=(2.75 / 2), $fn=16);
    translate([(x - 3.5), 3.5])      circle(r=(2.75 / 2), $fn=16);
    translate([3.5, 3.5 + 58])       circle(r=(2.75 / 2), $fn=16);
    translate([(x - 3.5), 3.5 + 58]) circle(r=(2.75 / 2), $fn=16);
}


module pitft() {
     x  = 56.5;     y = 65;    z = 1.60;
    translate([0, 0, -z]) {
            color("blue") linear_extrude(height=z)
                difference() {
                    hull() {
                        translate([  3,   3]) circle(r=3);
                        translate([x-3,   3]) circle(r=3);
                        translate([x-3, y-3]) circle(r=3);
                        translate([  3, y-3]) circle(r=3);
                    }
                    raspberrypi_model_a_plus_rev1_1_holes();
                    translate([9.25,-1])
                        square([38,12.5]);
                    
                }
        }
        
    color("black")
        translate([6.0, 7.1, -z])
        rotate([0,180,0])
        cube([5, 51.2, 8.6]);
        
     translate([12.0, 14, -2])
        rotate([0,90,270])
        pin_headers(2, 13);
        
     color("white")
        translate([7,5,0])
        cube([42.5,60,2.75]);
     color("black")
        translate([8,6,2.75])
        cube([40,51,0.5]);
}

module switch() {
    color("black")
        cube([7.75,7.75,2.66]);
    $fn=10;
    color("gray")
        translate([7.75/2,7.75/2,2.66])
        cylinder(d=3.5,h=2.75);
}

module switches() {
      translate([2.5*5,2.5,0])  switch();
        translate([2.5,2.5*5,0])  switch();
        translate([2.5*5,2.5*9,0])  switch();
        translate([2.5*9,2.5*5,0])  switch();
        
        translate([2.5*12,2.5,0])  switch();
        translate([2.5*12,2.5*9,0])  switch();
}

module controller() {
    
    // 59mm across
    // 35.6 long
    
    // 2.5 between buttons
    
      x  = 40;     y = 62;    z = 1.60;
    translate([0, 0, -z]) {
            color("green") linear_extrude(height=z)
                difference() {
                    hull() {
                        translate([  3,   3]) circle(r=3);
                        translate([x-3,   3]) circle(r=3);
                        translate([x-3, y-3]) circle(r=3);
                        translate([  3, y-3]) circle(r=3);
                    }
                }
        }
       switches();
        
        translate([0,2.5*12,0])
            switches();
        
}

module top_half() {
  board_raspberrypi_model_a_plus_rev1_1();
  translate([0,0,14])
    pitft();
}

module hardware() {
 
translate([60,70,0])
rotate(180)
    top_half();
translate([64,6,15])
    controller();   
}

module dpad_plus(g) {
    $fn=30;
    corners = 10;
    linear_extrude(1)
    difference() {
        square(24, center=true);
        translate([g,g]) square(10, center=true);
         rotate(90) translate([g,g]) square(10, center=true);
        rotate(180) translate([g,g]) square(10, center=true);
        rotate(270) translate([g,g]) square(10, center=true);
    }
}

dpad_depth = -0.3;

module dpad_flex() {
    color("blue")
    // linear_extrude(1)
     translate([0,0,dpad_depth])
        scale([1.2,1.2,0.6])
        dpad_plus(10);
}

module dpad() {
   
    
    // do this part in solid plastic
    difference() {
    dpad_plus(7.5);
          translate([0,0,dpad_depth])
        scale([1.2,1.2,0.6])
        dpad_plus(10);
    }
}

module dpad_cutout() {
    difference() {
        translate([0,0,0.5])
        cube([30,30,1], center=true);
        translate([0,0,-1])
        scale([1.1,1.1,3])
        dpad_plus(8);
       translate([0,0,dpad_depth])
        scale([1.2,1.2,0.6])
        dpad_plus(10);
    }
}

button_spread=10;
button_size = 3;

module button_flex() {
     $fn=30;
     color("blue")
     translate([0,0,0])
        scale([1.6,1.6,0.6])
        circle(button_size);
}

module button() {
     $fn=30;
    
    linear_extrude(1)
    circle(button_size);
}

module button_cutout() {
     $fn=30;
    
    linear_extrude(2)
    circle(button_size * 1.4);
}

module buttons_flex() {
    translate([0,button_spread,0]) button_flex();
    translate([button_spread,0,0]) button_flex();
    translate([0,-button_spread,0]) button_flex();
    translate([-button_spread,0,0]) button_flex();
}

module buttons() {
    translate([0,button_spread,0]) button();
    translate([button_spread,0,0]) button();
    translate([0,-button_spread,0]) button();
    translate([-button_spread,0,0]) button();
}

module buttons_cutout() {
    difference() {
        translate([0,0,0.5])
            cube([30,30,1], center=true);
            
        translate([0,button_spread,0]) button_cutout();
        translate([button_spread,0,0]) button_cutout();
        translate([0,-button_spread,0]) button_cutout();
        translate([-button_spread,0,0]) button_cutout();
        buttons_flex();
    }
}

// buttons();
// buttons_cutout();

// dpad();
// dpad_cutout();


//hardware();

module front_case() {
    union() {
        translate([80,22.5,20]) {
            difference() {
                dpad();
                dpad_flex();
            }
            dpad_cutout();
            dpad_flex();
        }

        translate([80,52.5,20]) {
            difference(){
                
                buttons();
                buttons_flex();
            }
            buttons_cutout();
            buttons_flex();
        }
    }
}
front_case();




// sizes in mm

// gameboy color
// cube([ 	133.5 , 78 , 27.4]);

// #cube([ 	133.5 , 88 , 27.4]);


// #rotate(90)
//     cube([134.62, 99.06, 40]);