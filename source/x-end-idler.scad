// PRUSA Mendel  
// X-end with idler mount
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 

/**
 * @id x-end-idler
 * @name X end idler
 * @category Printed
 * @using 1 m8spring
 * @using 3 m8nut
 * @using 3 m8washer
 * @using 3 m8washer-big
 * @using 2 m8x30
 */ 
use <x-end.scad>
support_beam_offset=(linear==true) ? 3:0;

module xendmotor() {
  difference() {
    union() { 
        translate([-2,5,6]) cube([10,10,10]);
        translate([-2,-25,6]) cube([10,10,10]);
     }
     translate([-2,-26,16]) rotate([0,45,0]) cube([15,46,15]);
   }

  translate([23,-5, 3]) difference() {
    cube([50,43,6], center=true);
    translate([5,0,-4]) cylinder(d=14, h=10);
    translate([20.5,15.5,-4]) cylinder(d=4, h=10);
    translate([20.5,-15.5,-4]) cylinder(d=4, h=10);
    translate([-10.5,15.5,-4]) cylinder(d=4, h=10);
    translate([-10.5,-15.5,-4]) cylinder(d=4, h=10);
   
  }
}

module xendidler(linear){

	xend(true,linear);
	translate(v = [0, 0, 12.5]){
		mirror(){
			difference(){
				union(){
					//translate(v = [23, -21.5, 25.3]) cube(size = [14,7,4.4], center = true);
					
					translate(v = [17, 12.5-support_beam_offset, 25.3]) cube(size = [11,5,4.4], center = true);
					translate(v = [25.5, -5, 7.5]) cube(size = [6,40,40], center = true);
				}
				translate(v = [42.5, -11, 28-3-4.7]) rotate(a=[0,90,0]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
			}
		}
	}
	translate([-5,-30,0])scale([2,1,2]) rotate(a=[90,0,0]) linear_extrude(file = "this-way-up.dxf", layer = "r",
  height = 2, center = true, convexity = 10, twist = -fanrot);
    translate([44.8,0,-0]) xendmotor();
}
xendidler(linear);
//xendidler(linear=true, lme8uu=false);

