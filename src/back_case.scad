use <util.scad>;
use <back_buttons.scad>;

pwr_switch_offset = [98,73,4];

module slide_switch_cutout() {
    union() {
        translate([0,0,-2])
            cube([4.2,11.7,8]);
        translate([0.8,2.5,6])
        cube([2.5,6,4]);
    }
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

module back_case() {
        // right side
        difference() {
            translate([2,72,-6])
            cube([150,8,16]);
          
            // cable cutout
            translate([13,71,4])
            cube([85,6,7]);
            
            // sd card space
            translate([25,71,-3])
            cube([14,3,8]);
            
            // power switch
            translate(pwr_switch_offset)
            rotate([0,90,90])
            slide_switch_cutout();
            
            // powerboost usb charging
            translate([126,74,0])
            cube([15,10,11]);
            translate([129.5,71,2])
            cube([8.5,7,4]);
            
            // needs to match the front of case
            // TODO make module
            translate([118,76,6])
                rotate([0,180,0])
                #screw_with_hole();
            translate([8,76,6])
                rotate([0,180,0])
                screw_with_hole();
        }
        
        // back side of case
        difference() {
            translate([2,3,-6])
                cube([144,69,2]);
                
            translate([69,21,-8]) {
                lr_button_cutout();
                translate([0,20,0]) lr_button_cutout();
                translate([12,0,0]) lr_button_cutout();
                translate([12,20,0]) lr_button_cutout();
            }
        }

        // back controller mounts
        translate([70,11,-2])
            rotate([0,180,0])
            screw_mount();
        translate([70,63,-2])
            rotate([0,180,0])
            screw_mount();

        translate([100,11,-2])
            rotate([0,180,0])
            screw_mount();
        translate([100,63,-2])
            rotate([0,180,0])
            screw_mount();

        // pi 3 A+ mounts
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
        // Top
        difference() {
            translate([0,-3,-6])
            cube([2,83,16]);
        
            // audio hole
            translate([0,16.5,4.5])
            rotate([0,90,0])
            cylinder(h=15, d=7, center=true);
            // audio square cutout for bridging
            translate([0,16.5,5.5])
            cube([5,6,5], center=true);
            
            // hdmi
            translate([0,37.5,6])
                rotate([0,90,0])
                cube([10,16,10], center=true);
            
            // no micro usb hole!
            // powerboost 1000c for power
    }
    
     // left side
     difference() {
            translate([2,-3,-6])
            cube([130 + 17,6,16]);
         
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
        {
            translate([142,69,-2])
                rotate([0,180,0])
                screw_mount();
            translate([125,69,-2])
                rotate([0,180,0])
                screw_mount();
            translate([140,38.2,-2])
                rotate([0,180,0])
                screw_mount();
            translate([127.5,38.2,-2])
                rotate([0,180,0])
                screw_mount();
        }

        // bottom side
        translate([132+14,-3,-6])
            cube([3,83,16]);
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
        
        translate([142 + 13,65,-8])
        rotate(40)
        cube(30);
        translate([145 + 13,-31,-8])
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

beveled_back_case();