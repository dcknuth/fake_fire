// mount board for Raspberry Pi 4, with TV mounts and strip LED holder

// Globals
$fn = 50;
FUDGE = 0.01;
TOL = 0.3;

module NotchGuide(h=50, n=7, d=8) {
  difference() {
    cylinder(h=h, d=d);
    // Notches
    for(i=[1:n]) {
      translate([0,-d/1.8,i*(h/(n+1))])
        rotate([45,0,0])
          cube([d,d/2,d/2], center=true);
    }
  }
}

//NotchGuide();
