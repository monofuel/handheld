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
        translate([0,0,-1])
        scale([1.1,1.1,3])
        dpad_plus(10);
    }
}

module button_cutout() {
     $fn=30;
    
    linear_extrude(2)
    circle(button_size * 1.4);
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
    cube([6,9,4], center);
}

module option_buttons_case() {
    difference() {
        translate([0,0,-1])
        cube([10,60,2]);
        translate([4,5,0]) square_cutout();
        translate([4,24,0]) rec_button_cutout();
        translate([4,36,0]) rec_button_cutout();
        translate([4,55,0]) square_cutout();
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

module controller_screw_mounts() {
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

module front_case() {
    $fn=30;
    union() {
        translate(dpad_offset)  dpad_case();
        translate(buttons_offset)  buttons_case();
        translate(option_buttons_offset) option_buttons_case();
        
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
            translate([12,10,-2]) cube([40,51,5]);
            
            // pitft buttons
            translate([4,11,-3]) {
                translate([-1,-2,0.9])
                rec_button_cutout(center=false);
            }
            
           translate([4,21,-3]) {
                translate([-1,-2,0.9])
                rec_button_cutout(center=false);
            }
            translate([4,31,-3]) {
                translate([-1,-2,0.9])
                rec_button_cutout(center=false);
            }
            translate([4,41,-3]) {
                translate([-1,-2,0.9])
                rec_button_cutout(center=false);
            }
            translate([4,51,-3]) {
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
    
        controller_screw_mounts();
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
        
        
        front_case_flex();
    }
}

beveled_front_case();