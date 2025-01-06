/*
DMCV Sharks soccer club logo insignia

Image file "dmcv-sharks-logo.svg" is obtained from a flat PNG image
(./imports/dmcv-sharks-logo.png) using Inkscape (version 1.2).


3D Printing settings (for Flashforge Adventurer 3):

Infill: 60%
Raft: No (Need to increase platform temperature to 60 degrees and apply some
glue on bed to make the artifact hold)

*/

with_pinbacks = false;
base_height = 4;

module insignia() {
    module sharks_logo() {
        linear_extrude(height = 9)
        import("./imports/dmcv-sharks-logo.svg", center = true, dpi =
        240);
    }

    module base() {
        translate([0, 0, 2]) cylinder(h = base_height, r = 28, center = true);
    }

    base();
    sharks_logo();
}

tube_height = 2;
tube_outer_radius = 2;
tube_inner_radius = 1.25;
tube_distance_to_center = 6;
cave_length = tube_distance_to_center * 2 + tube_height + 15;
pinback_height = base_height - 1;

module tube_right() {
    fn = 30;
    translate([tube_distance_to_center, 0, pinback_height/2]) rotate([90, 0, 90])
    difference() {
        cylinder(h = tube_height, r = tube_outer_radius, center = true, $fn = fn);
        cylinder(h = tube_height, r = tube_inner_radius, center = true, $fn = fn);
    }
}

module tube_left() {
    mirror([1, 0, 0]) tube_right();
}

module cave() {
    cube([cave_length, tube_outer_radius * 2, base_height - 1], center = true);
}

module pinback() {
    cube([cave_length - 0.2, tube_outer_radius * 2 - 0.2,  pinback_height], center = true);
    tube_left();
    tube_right();
}

module insignia_with_pinback() {

    union() {
        difference() {
            insignia();
            cave();
        }
    translate([0, 32, pinback_height / 2]) pinback();
    }
}

module badge(with_pinbacks = false) {
    if (with_pinbacks) {
        insignia_with_pinback();
    }
    else {
        insignia();
    }
}

// Two parts: badge and a pinback to stick to the back of it
badge(with_pinbacks = true);
// Just the badge with a flat back
//badge(with_pinback = false);