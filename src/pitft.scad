use <util.scad>;

width=56;
length=65;
pcb_height=1.65;

module tiny_switch() {
	   color("grey")
		cube([6,3.4,3.63]);
	translate([3,1.6,4.13])
	color("white")
		cube([3,1.5,1], center=true);
}

module pitft_holes() {
	$fn=32;
	translate([3.5,3.5]) circle(d=2.75);
	translate([width - 3.5,3.5]) circle(d=2.75);
	translate([3.5,length - 3.5]) circle(d=2.75);
	translate([width - 3.5,length - 3.5]) circle(d=2.75);
}

module pitft() {
	color("blue")
		translate([0, 0, -pcb_height]) 
		linear_extrude(pcb_height)
		difference() {
			hull() {
				translate([  3,   3]) circle(r=3);
				translate([width-3,   3]) circle(r=3);
				translate([  3, length-3]) circle(r=3);
				translate([width-3, length-3]) circle(r=3);
			}
			pitft_holes();

			// cutout for 26 pin GPIO
			translate([9.25,-1])
				square([38,12.5]);
			
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
		translate([6.0, 7.1, -pcb_height])
		rotate([0,180,0])
		cube([5, 51.2, 8.6]);
		
	 translate([12.0, 14, -2])
		rotate([0,90,270])
		header(2, 13);
		
	 color("white")
		translate([7,5,0])
		cube([42.5,60,2.75]);
	 color("black")
		translate([8,6,2.75])
		cube([40,51,0.5]);
}


pitft();