// mount board for Raspberry Pi 4, with TV mounts and strip LED holder

use <notch_guide.scad>;
use <hook.scad>;

// Globals
$fn = 50;
FUDGE = 0.01;
TOL = 0.3;
// TV Mounts
tvMountSideX = 200;
tvMountSideY = 100;
tvMountD = 6.6; // clearance hole for M6
tvMountSpace = 5;
thickZ = 3;
// Pi mounts
piMountX = 58;
piMountY = 49;
piMountD = 2.7;
piRiser = 5.0;
piRiserD = 6.0;
piOver = 20.0;
piThick = 1.8;
piFromOX = (tvMountSideX-piMountX)/2;
piFromOY = (tvMountSideY-piMountY)/2;

module BottomPlate(x=tvMountSideX, y=tvMountSideY, piX=piMountX, piY=piMountY,
          space=tvMountSpace, z=thickZ, hole=tvMountD, piD=piRiserD) {
  difference() {
    union() {
      hull() {
        cylinder(h=z, d=hole*1.7);
        translate([tvMountSideX,tvMountSideY,0])
          cylinder(h=z, d=hole*1.7);
      }
      hull() {
        translate([tvMountSideX,0,0])
          cylinder(h=z, d=hole*1.7);
        translate([0,tvMountSideY,0])
          cylinder(h=z, d=hole*1.7);
      }
      hull() {
        translate([piFromOX-space,piFromOY-space,0])
          cylinder(h=z, d=piD*2);
        translate([piFromOX+piX+space,piFromOY-space,0])
          cylinder(h=z, d=hole*2);
        translate([piFromOX+piX+space,piFromOY+piY+space,0])
          cylinder(h=z, d=hole*2);
        translate([piFromOX-space,piFromOY+piY+space,0])
          cylinder(h=z, d=hole*2);
      }
    }
    translate([0,0,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=hole);
    translate([tvMountSideX,0,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=hole);
    translate([tvMountSideX,tvMountSideY,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=hole);
    translate([0,tvMountSideY,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=hole);
    // Save some print time / plastic
    translate([tvMountSideX/2,tvMountSideY/11,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=52);
    translate([tvMountSideX/2,tvMountSideY-tvMountSideY/11,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=52);
    translate([tvMountSideX/4,tvMountSideY/2,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=34);
    translate([tvMountSideX-tvMountSideX/4,tvMountSideY/2,-FUDGE/2])
      cylinder(h=thickZ+FUDGE, d=34);
  }
}

union() {
  BottomPlate();
  translate([piFromOX,piFromOY,thickZ+FUDGE/2])
    cylinder(h=piRiser+FUDGE, d=piRiserD);
  translate([piFromOX+piMountX,piFromOY,thickZ+FUDGE/2])
    cylinder(h=piRiser+FUDGE, d=piRiserD);
  translate([piFromOX+piMountX,piFromOY+piMountY,thickZ+FUDGE/2])
    cylinder(h=piRiser+FUDGE, d=piRiserD);
  translate([piFromOX+piMountX,piFromOY+piMountY,thickZ+piRiser])
    Hook();
  translate([piFromOX,piFromOY+piMountY,thickZ+FUDGE/2])
    cylinder(h=piRiser+FUDGE, d=piRiserD);
  translate([piFromOX,piFromOY+piMountY,thickZ+piRiser])
    Hook();
  // Now some guides for LED strip to wrap around
  translate([20,10,thickZ-FUDGE])
    rotate([0,0,-65])
      NotchGuide(h=150, n=14);
  translate([180,10,thickZ-FUDGE])
    rotate([0,0,65])
      NotchGuide(h=150, n=14);
  translate([180,90,thickZ-FUDGE])
    rotate([0,0,155])
      NotchGuide(h=150, n=14);
  translate([20,90,thickZ-FUDGE])
    rotate([0,0,-155])
      NotchGuide(h=150, n=14);
}
