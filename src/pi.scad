use <util.scad>;

width=56;
length=65;
pcb_height=1.5;

module pi_holes() {
	$fn=32;
	translate([3.5,3.5]) circle(d=2.75);
	translate([width - 3.5,3.5]) circle(d=2.75);
	translate([3.5,length - 3.5]) circle(d=2.75);
	translate([width - 3.5,length - 3.5]) circle(d=2.75);
}

module pi_3_a_plus() {
    $fn=32;

    color("green")
		translate([0, 0, -pcb_height]) 
		linear_extrude(pcb_height)
		difference() {
			hull() {
				translate([  3,   3]) circle(r=3);
				translate([width-3,   3]) circle(r=3);
				translate([  3, length-3]) circle(r=3);
				translate([width-3, length-3]) circle(r=3);
			}
			pi_holes();
		}

    translate([1.0, 7.25, 0]) header(2, 20);
    translate([width,7.25,0]) rotate(90) micro_usb();
    translate([22,length - (15 - 2.6),-2]) sdcard();
    translate([21.5,length - (15 - 2.6),-2.5]) sdcard_reader();
    translate([18,-2.5,0]) usb();
    translate([46,25,0]) hdmi();
    translate([43.5,length-7,0]) rotate(270) audio();
}

pi_3_a_plus();