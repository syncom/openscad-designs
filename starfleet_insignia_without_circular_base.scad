$fn = 50;

name = "NAME";


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

// The insignia is one leaf minus another
module insignia_top(scale) {
    difference() {
        difference() {
            leaf1(scale);
            translate([-4 * scale, 22 * scale, 0 * scale]) { rotate(a=0, v=[0,0, 1]) leaf2(scale);};
            };
            
        linear_extrude(height=4, center=false) {       
            translate([3 * scale, 0 * scale, 0 * scale]) {rotate(a=180, v=[0, 0, 1]) text(text=name, size=1.5 * scale);};
        };
    }
}

// The inner part, minus a hole
module starfleet_insignia(scale) {
    difference() {
        insignia_top(scale);
        
        translate([0, -8 * scale, 0]) cylinder(h=4, r=1.0, center=false);
    }
}

starfleet_insignia(2);