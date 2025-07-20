use <util.scad>;
use <front_buttons.scad>;
use <front_flex.scad>;

button_spread=10;
button_size = 3;

dpad_offset = [80,22.5,18];
buttons_offset = [80,52.5,18];
option_buttons_offset = [95,7.5,18];

module dpad_case() {
    difference() {
        translate([0,0,0]) cube([30,30,2], center=true);
        translate([0,0,-2])
        scale([1.1,1.1,5])
        dpad_plus(8, curve=false);
    }
}

module button_cutout() {
     $fn=30;
    
    linear_extrude(2)
    circle(button_size * 1.5);
}

module buttons_case() {
    difference() {
        translate([-15,-15,-1])
            cube([30,30,2]);
            
        translate([0,button_spread,-1]) button_cutout();
        translate([button_spread,0,-1]) button_cutout();
        translate([0,-button_spread,-1]) button_cutout();
        translate([-button_spread,0,-1]) button_cutout();
    }
}


module square_cutout(button) {
    translate([0,0,0.5])
    cube([8,8,4], center=true);
}

module rec_button_cutout(center=true) {
    translate([0,0,0.5])
    cube([5,7,4], center);
}

module option_buttons_case() {
    difference() {
        translate([0,0,-1])
        cube([10,60,2]);
        translate([4,24,0]) rec_button_cutout();
        translate([4,36,0]) rec_button_cutout();
    }
}


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

module controller_screw_mounts(screw_hole) {
    // top left screw mount
    translate([68,9,16])
        rotate([0,180,0])
        screw_mount(screw_hole);
    // top right screw mount
    translate([68,66,16])
        rotate([0,180,0])
        screw_mount(screw_hole);
    // lower left screw mount
    translate([100,22,16])
        rotate([0,180,0])
        screw_mount(screw_hole);
    // lower right screw mount
    translate([100,53,16])
        rotate([0,180,0])
        screw_mount(screw_hole);
}

module front_case() {
    $fn=30;
    difference() {
        union() {
            // front button area
            translate(dpad_offset)  dpad_case();
            translate(buttons_offset)  buttons_case();
            translate(option_buttons_offset) option_buttons_case();
            
            // left side gap
            translate([65,3,16])
                cube([40,4.5,3]);
            // right side gap
            translate([65,67.5,16])
                cube([40,4.5,3]);
            // lower gap
            translate([105,3,16])
                cube([4,69,3]);
            
            // piTFT
            translate([0,3,18])
            difference() {
                translate([2,0,-1])
                cube([63,69,2]);
                
                // LCD cutout
                translate([12,10,-2]) cube([40,51,5]);
                
                // pitft buttons
                translate([4.5,12,-3]) {
                    translate([-1,-2,0.9])
                    rec_button_cutout(center=false);
                }
                
               translate([4.5,22,-3]) {
                    translate([-1,-2,0.9])
                    rec_button_cutout(center=false);
                }
                translate([4.5,32,-3]) {
                    translate([-1,-2,0.9])
                    rec_button_cutout(center=false);
                }
                translate([4.5,42,-3]) {
                    translate([-1,-2,0.9])
                    rec_button_cutout(center=false);
                }
                translate([4.5,52,-3]) {
                    translate([-1,-2,0.9])
                    rec_button_cutout(center=false);
                }
                
            }
            // PITFT screw mounts
            translate([7.5,8.5,16])
                rotate([0,180,0])
                 difference() {
                     screw_mount();
                     // trim some space by the standoff
                     translate([-1.5,3.5,-2.5])
                     rec_button_cutout(center=false);
                 }
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

                // primary part of the right half of the case
                translate([2,72,10])
                cube([150,8,9]);
                
                // cutout to run cables
                translate([13,71,9])
                cube([85,6,6]);
                
                // 2 screws to hold the front and back together
                // screw locations have to match back case
                color("red")
                translate([108,75,6])
                rotate([0,180,0])
                screw();
                translate([8,75,6])
                rotate([0,180,0])
                screw();
            }
            
            // left side
            difference() {
                translate([2,-3,10])
                cube([150,6,9]);
                
                translate([128,0,6])
                rotate([0,180,0])
                screw();
                
                translate([13,0,6])
                rotate([0,180,0])
                screw();
            }
            // top
            translate([0,-3,10])
                cube([2,83,9]);
            
            // bottom
            translate([146,-3,10])
                cube([3,83,9]);

            // front below controller
            translate([109,3,16])
                cube([38,69,3]);
        
            controller_screw_mounts();
        }
        
        // Extended screw holes to break through surface of mounts
        // not sure why these were needed, must have done bad math elsewhere
        translate([68,9,16])
            rotate([0,180,0])
            translate([0,0,1])
            cylinder(h=4, d=2.6, center=true);
        translate([68,66,16])
            rotate([0,180,0])
            translate([0,0,1])
            cylinder(h=4, d=2.6, center=true);
        translate([100,22,16])
            rotate([0,180,0])
            translate([0,0,1])
            cylinder(h=4, d=2.6, center=true);
        translate([100,53,16])
            rotate([0,180,0])
            translate([0,0,1])
            cylinder(h=4, d=2.6, center=true);
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
        
        translate([142 + 13,65,0])
        rotate(40)
        cube(30);
        translate([145 + 13,-31,0])
        rotate(50)
        cube(30);
        
        translate([-10,-19,0])
        rotate([45,0,0])
        cube([200,30,30]);
        
        translate([-10,96,0])
        rotate([45,0,0])
        cube([200,30,30]);
        
        
        front_case_flex();
    }
}

// flip upside down for printing (build-side-down)
rotate([180,0,0])
beveled_front_case();