use <util.scad>;

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
	
	x  = 40;
	y = 62;
	z = 1.60;
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