
// TODO
// fix buttons
// add L/R buttons
// sd card cutout


// V2
// psp joystick
// L2 / R2

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
        
      translate([55,10,0])
        rotate(90)
        tiny_switch();
      
      translate([55,20,0])
        rotate(90)
        tiny_switch();    
         translate([55,30,0])
        rotate(90)
        tiny_switch();    
         translate([55,40,0])
        rotate(90)
        tiny_switch();    
         translate([55,50,0])
        rotate(90)
        tiny_switch();    
      
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
    // actual height is 2.75, but the buttons are squishy
    // h=2.75
    color("gray")
        translate([7.75/2,7.75/2,2.66])
        cylinder(d=3.5,h=2);
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
  // board_raspberrypi_model_a_plus_rev1_1();
  translate([0,0,14])
    pitft();
}

pwr_switch_offset = [98,73,4];

module hardware_back() {
     translate([64,6,2])
         battery(); 
     translate([124,72,3])
         rotate(180)
         powerboost();
    translate([60,70,0])
    rotate(180)
        board_raspberrypi_model_a_plus_rev1_1(); 
    
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

module dpad_plus(g) {
    $fn=30;
    corners = 9;
    linear_extrude(1)
    difference() {
        square(24, center=true);
        translate([g,g]) square(corners, center=true);
         rotate(90) translate([g,g]) square(corners, center=true);
        rotate(180) translate([g,g]) square(corners, center=true);
        rotate(270) translate([g,g]) square(corners, center=true);
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
        translate([0,0,0])
        cube([30,30,2], center=true);
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
        scale([1.7,1.7,0.6])
        linear_extrude(1)
        circle(button_size);
}

module button() {
     $fn=30;
    
    linear_extrude(1)
    circle(button_size);
}

module square_button(button) {
    cube([6,6,1], center=true);
}

module square_button_flex() {
     $fn=30;
     color("blue")
     translate([0,0,0])
        scale([1.6,1.6,0.6])
        cube([6,6,1], center=true);
}

module square_cutout(button) {
    translate([0,0,0.5])
    cube([8,8,2], center=true);
}


module rec_button(button) {
    cube([4,6,1], center=true);
}

module rec_button_flex(center=true) {
     $fn=30;
     color("blue")
     translate([0,0,0])
        scale([2,1.6,0.6])
        cube([4,8,1], center);
}

module rec_button_cutout(center=true) {
    translate([0,0,0.5])
    cube([6,9,4], center);
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

module option_buttons_flex() {
    translate([5,5,0]) square_button_flex();
    translate([5,25,0]) rec_button_flex();
    translate([5,35,0]) rec_button_flex();
    translate([5,55,0]) square_button_flex();
}
module option_buttons_cutout() {
    difference() {
        cube([10,60,1]);
        translate([5,5,0]) square_cutout();
        translate([5,24,0]) rec_button_cutout();
        translate([5,36,0]) rec_button_cutout();
        translate([5,55,0]) square_cutout();
        option_buttons_flex();
    }
}

module option_buttons() {
     translate([5,5,0.5]) square_button();
        translate([5,24,0.5]) rec_button();
        translate([5,36,0.5]) rec_button();
        translate([5,55,0.5]) square_button();
}

// buttons();
// buttons_cutout();

// dpad();
// dpad_cutout();

module pitft_washers() {
    
        translate([7.5,8.5,10.7])
            rotate([0,180,0])
            washer(3,6);
        translate([7.5,8.5,10])
            rotate([0,180,0])
            screw();
        
        
         translate([56.5,8.5,10.7])
            rotate([0,180,0])
            washer(3,6);
        translate([56.5,8.5,10])
            rotate([0,180,0])
            screw();
        
        
        translate([7.5,66.5,10.7])
            rotate([0,180,0])
            washer(3,6);
        translate([7.5,66.5,10])
            rotate([0,180,0])
            screw();
        
       
         translate([56.5,66.5,10.7])
            rotate([0,180,0])
            washer(3,6);
        translate([56.5,66.5,10])
            rotate([0,180,0])
            screw();
}

module pi_washers() {
    
        translate([7.5,8.5,3])
            washer(3,6);
        translate([7.5,8.5,3.7])
            screw();
        
        
         translate([56.5,8.5,3])
            washer(3,6);
        translate([56.5,8.5,3.7])
            screw();
        
        
        translate([7.5,66.5,3])
            washer(3,6);
        translate([7.5,66.5,3.7])
            screw();
        
       
         translate([56.5,66.5,3])
            washer(3,6);
        translate([56.5,66.5,3.7])
            screw();
}

dpad_offset = [80,22.5,18];
buttons_offset= [80,52.5,18];
option_buttons_offset = [95,7.5,18];

// front_case_flex();

module front_case_flex() {
     translate(dpad_offset)  dpad_flex();
        translate(buttons_offset)  buttons_flex();
        translate(option_buttons_offset) option_buttons_flex();
}

module front_case() {
    $fn=30;
    union() {
        translate(dpad_offset)  dpad_cutout();
        translate(buttons_offset)  buttons_cutout();
        translate(option_buttons_offset) option_buttons_cutout();
        
        translate([65,3,16])
        cube([40,4.5,3]);
        translate([65,67.5,16])
        cube([40,4.5,3]);
        
        translate([105,3,16])
        cube([4,69,3]);
        
        translate([0,3,18])
        difference() {
            translate([2,0,-1])
            cube([63,69,2]);
            
            // LCD cutout
            translate([12,10,-2])
            cube([40,51,5]);
            
            // buttons
            translate([4,10,-2]) {
                translate([-1,-2,0.9])
                rec_button_flex(center=false);
                rec_button_cutout(center=false);
            }
            
           translate([4,20,-2]) {
                translate([-1,-2,0.9])
                rec_button_flex(center=false);
                rec_button_cutout(center=false);
            }
            translate([4,30,-2]) {
                translate([-1,-2,0.9])
                rec_button_flex(center=false);
                rec_button_cutout(center=false);
            }
            translate([4,40,-2]) {
                translate([-1,-2,0.9])
                rec_button_flex(center=false);
                rec_button_cutout(center=false);
            }
            translate([4,50,-2]) {
                translate([-1,-2,0.9])
                rec_button_flex(center=false);
                rec_button_cutout(center=false);
            }
            
        }
        // PITFT screw mounts
        translate([7.5,8.5,16])
            rotate([0,180,0])
            screw_mount();
        translate([56.5,8.5,16])
            rotate([0,180,0])
            screw_mount();
         translate([7.5,66.5,16])
            rotate([0,180,0])
            screw_mount();
         translate([56.5,66.5,16])
            rotate([0,180,0])
            screw_mount();
        
        width = 2.7;
        thread_height = 7.46;
        
        // right side with cutout
        difference() {
            translate([2,72,10])
            cube([130,8,9]);
          
            translate([13,71,9])
            cube([105,6,6]);
            
            translate([128,76,6])
            rotate([0,180,0])
            screw();
            
            // Has to match top case
            translate([8,76,6])
            rotate([0,180,0])
            screw();
        }
        
        // left side
        difference() {
            translate([2,-3,10])
            cube([130,6,9]);
            
            translate([128,0,6])
            rotate([0,180,0])
            screw();
            
            translate([13,0,6])
            rotate([0,180,0])
            screw();
        }
        translate([0,-3,10])
        cube([2,83,9]);
        

        translate([132,-3,10])
        cube([3,83,9]);
        translate([109,3,16])
        cube([23,69,3]);
     
        // controller board screw mounts
        translate([68,9,16])
            rotate([0,180,0])
            screw_mount();
        translate([68,66,16])
            rotate([0,180,0])
            screw_mount();
        
        translate([100,22,16])
            rotate([0,180,0])
            screw_mount();
        
        translate([100,53,16])
            rotate([0,180,0])
            screw_mount();
    }
}

module back_case() {
        difference() {
            translate([2,72,-6])
            cube([130,8,16]);
          
            // cable cutout
            translate([13,71,4])
            cube([85,6,7]);
            
            translate(pwr_switch_offset)
            rotate([0,90,90])
            slide_switch_cutout();
            
            // powerboost usb charging
            translate([105,74,0])
            cube([15,10,11]);
            translate([108.5,71,2])
            cube([8.5,7,4]);
            
            // needs to match the front of case
            // TODO make module
            translate([128,76,6])
                rotate([0,180,0])
                screw_with_hole();
            translate([8,76,6])
                rotate([0,180,0])
                screw_with_hole();
        }
        
        translate([2,3,-6])
        cube([130,69,2]);
        // TODO cutout for sd card space
        translate([7.5,8.5,-2])
            rotate([0,180,0])
            screw_mount();
        translate([56.5,8.5,-2])
            rotate([0,180,0])
            screw_mount();
         translate([7.5,66.5,-2])
            rotate([0,180,0])
            screw_mount();
        translate([56.5,66.5,-2])
            rotate([0,180,0])
            screw_mount();
        $fn=30;
        difference() {
            translate([0,-3,-6])
            cube([2,83,16]);
        
            // audio hole
            translate([0,16.5,4.5])
            rotate([0,90,0])
            cylinder(h=15, d=7, center=true);
            // hdmi
            translate([0,38,5.5])
            rotate([0,90,0])
            cube([11,18,10], center=true);
            
            // no micro usb hole!
            // powerboost 1000c for power
    }
    
     difference() {
            translate([2,-3,-6])
            cube([130,6,16]);
            
            translate([128,0,6])
            rotate([0,180,0])
            screw_with_hole();
            
            translate([13,0,6])
            rotate([0,180,0])
            screw_with_hole();
         
            // usb hole
            translate([27,-4,1])
            cube([17,9,10]);
            translate([35.5,-6,6])
            cube([27,15,12], center=true);
        }
        
        // powerboost mount
        translate([120.5,68.5,-2])
            rotate([0,180,0])
            screw_mount();
        translate([104.5,68.5,-2])
            rotate([0,180,0])
            screw_mount();
        translate([120.5,39.5,-2])
            rotate([0,180,0])
            screw_mount();
        translate([104.5,39.5,-2])
            rotate([0,180,0])
            screw_mount();
        
        translate([132,-3,-6])
            cube([3,83,16]);
}

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

module screw_mount() {
    $fn=30;
    thread_height = 7.46;
    width = 2.6; // undersized
    difference() {
        cube([6,8,4], center=true);
        translate([0,0,1])
        cylinder(h=thread_height, d=width, center=true);
    }
}
module battery() {
    color("grey")
    cube([37,60,7.24]);
}
module powerboost() {
     
    x  = 23;     y = 36;    z = 1.60;
    translate([0, 0, -z]) {
            color("blue") linear_extrude(height=z)
                difference() {
                    hull() {
                        translate([  3,   3]) circle(r=3);
                        translate([x-3,   3]) circle(r=3);
                        translate([x-3, y-3]) circle(r=3);
                        translate([  3, y-3]) circle(r=3);
                    }
        translate([3.5, 3.5])            circle(r=(2.75 / 2), $fn=16);
        translate([(x - 3.5), 3.5])      circle(r=(2.75 / 2), $fn=16);
        translate([3.5, y-3.5])       circle(r=(2.75 / 2), $fn=16);
        translate([(x - 3.5), y-3.5]) circle(r=(2.75 / 2), $fn=16);
                    
                }
        }
        mx =  5.60; my =  7.6; mz = 2.40;  // Measured micro USB power connector size
        translate([15, 0, 0])
        rotate(90)microusb_connector(mx, my, mz);
        
        color("black")
        translate([0,8,0])
            cube([6.2,8,5.5]);
}

module washer(h=3,d=5) {
    $fn=30;
    
    difference() {

        cylinder(h=h,d=d, center=true);
        translate([0,0,1])
        screw();
    }
}

module beveled_front_case() {
    difference() {
        front_case();
        translate([-10,65,0])
        rotate(45)
        cube(30);
        translate([-10,-31,0])
        rotate(45)
        cube(30);
        
        translate([142,65,0])
        rotate(40)
        cube(30);
        translate([145,-31,0])
        rotate(50)
        cube(30);
        
        translate([-10,-19,0])
        rotate([45,0,0])
        cube([200,30,30]);
        
        translate([-10,96,0])
        rotate([45,0,0])
        cube([200,30,30]);
    }
}

module beveled_back_case() {
    difference() {
        back_case();
        translate([-10,65,-8])
        rotate(45)
        cube(30);
        translate([-10,-31,-8])
        rotate(45)
        cube(30);
        
        translate([142,65,-8])
        rotate(40)
        cube(30);
        translate([145,-31,-8])
        rotate(50)
        cube(30);
        
        translate([-10,-19,-28])
        rotate([45,0,0])
        cube([200,30,30]);
        
        translate([-10,96,-28])
        rotate([45,0,0])
        cube([200,30,30]);
    }
}

module tiny_switch() {
       color("grey")
        cube([6,3.4,3.63]);
    translate([3,1.6,4.13])
    color("white")
        cube([3,1.5,1], center=true);
}

module slide_switch() {
    color("grey")
      cube([4.2,11.7,6]);
    color("black")
      translate([1,3.6,6])
      cube([2,2,2]);
}

module slide_switch_cutout() {
    union() {
    translate([0,0,-2])
     cube([4.2,11.7,8]);
    translate([0.8,2.5,6])
      cube([2.5,6,4]);
    }
}

 // tiny_switch();
// washer(3,6);


// hardware_front();
// hardware_back();
//pitft_washers();
//pi_washers();

//beveled_front_case();
beveled_back_case();

// sizes in mm

// gameboy color
// cube([ 	133.5 , 78 , 27.4]);

// #cube([ 	133.5 , 88 , 27.4]);


// #rotate(90)
//     cube([134.62, 99.06, 40]);