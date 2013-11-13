//
// First example for testing a dual extrusion.
// 5/22/12	Initial Creation		-jkl
//


module block() {
	translate([0, 0, 0]) cube([20,20,5]);
}

difference()
{
	block();
	translate([20,0,0]) rotate([0,0,45]) block();
} 
color("red")
translate([20,0,0]) rotate([0,0,45]) block();
