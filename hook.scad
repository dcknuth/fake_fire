$fn = 50;

module Hook(d=2.5) {
  union() {
    translate([0,d*4,0])
      rotate([-135,0,0])
        rotate([0,90,0])
          rotate_extrude(angle=45, convexity = 10)
            translate([d*4, 0, 0])
              circle(d = d);
    translate([0,d*4-sqrt(((d*4)*(d*4))/2),sqrt(((d*4)*(d*4))/2)])
      sphere(d=d);
  }
}

//Hook();
