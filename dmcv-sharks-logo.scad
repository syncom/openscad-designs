/*
DMCV Sharks soccer club logo insignia

Image file "dmcv-sharks-logo.svg" is obtained from a flat PNG image
(./imports/dmcv-sharks-logo.png) using Inkscape (version 1.2).


3D Printing settings (for Flashforge Adventurer 3):

Infill: 60%
Raft: No (Need to increase platform temperature to 60 degrees and apply some
glue on bed to make the artifact hold)

*/

module insignia() {
    module sharks_logo() {
        linear_extrude(height = 9)
        import("./imports/dmcv-sharks-logo.svg", center = true, dpi =
        240);
    }

    module base() {
        translate([0, 0, 2]) cylinder(h = 4, r = 28, center = true);
    }

    base();
    sharks_logo();
}

tube_height = 2;
tube_outer_radius = 1.5;
tube_inner_radius = 0.8;
tube_distance_to_center = 6;

module tube_right() {
    fn = 30;
    translate([tube_distance_to_center, 0, tube_outer_radius]) rotate([90, 0, 90])
    difference() {
        cylinder(h = tube_height, r = tube_outer_radius, center = true, $fn = fn);
        cylinder(h = tube_height, r = tube_inner_radius, center = true, $fn = fn);
    }
}

module tube_left() {
    mirror([1, 0, 0]) tube_right();
}

module cave() {
    length = tube_distance_to_center * 2 + tube_height + 15;
    cube([length, tube_outer_radius * 2, tube_outer_radius * 2], center = true);
}

module insignia_with_pinbacks() {
    union() {
        difference() {
            insignia();
            cave();
        }
        tube_left();
        tube_right();
    }
}

insignia_with_pinbacks();