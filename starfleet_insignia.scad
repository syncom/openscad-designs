$fn = 50;

name = "MYS";

module insignia_base(radius, thinkness) {
    cylinder(h=thinkness, r=radius, center=false);
}

module leaf1(scale){
    intersection() {
        translate([-25 * scale, 6 * scale, 0 * scale]) cylinder(h=4, r=30 * scale, center=false);
        translate([25 * scale, 6 * scale, 0 * scale]) cylinder(h=4, r=30 * scale, center=false);
    }    
}

module leaf2(scale){
    intersection() {
        translate([-17 * scale, 3 * scale, 0 * scale]) cylinder(h=4, r=30 * scale, center=false);
        translate([35 * scale, 3 * scale, 0 * scale]) cylinder(h=4, r=40 * scale, center=false);
    }    
}

module insignia_top(scale) {
    difference() {
        difference() {
            leaf1(scale);
            translate([-4 * scale, 22 * scale, 0 * scale]) { rotate(a=0, v=[0,0, 1]) leaf2(scale);};
            };
            
        linear_extrude(height=4, center=false) {       
            translate([3 * scale, 0 * scale, 0 * scale]) {rotate(a=180, v=[0, 0, 1]) text(text=name, size=2 * scale);};
        };
    }
}

// The union of the inner part and a circular base, minus a hole
module starfleet_insignia(scale) {
    difference() {
        union() {
            insignia_base(9 * scale, 3);
            insignia_top(scale);
        }
        
        translate([0, -8 * scale, 0]) cylinder(h=4, r=0.8, center=false);
    }
}

starfleet_insignia(2);