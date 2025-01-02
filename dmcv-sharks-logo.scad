/*
DMCV Sharks soccer club logo insignia

Image file "dmcv-sharks-logo.svg" is obtained from a flat PNG image
(./imports/dmcv-sharks-logo.png) using Inkscape (version 1.2).


3D Printing settings:

Infill: 60%
Raft: No (Need to increase platform temperature to 60 degrees and apply some
glue on bed to make it hold)

*/

tube_height = 2;
tube_outer_radius = 1.5;
tube_inner_radius = 0.8;
tube_distance_to_center = 6;

module sharks_logo() {
    linear_extrude(height = 9)
    import("./imports/dmcv-sharks-logo.svg", center = true, dpi =
    240);
}

module base() {
    translate([0, 0, 2]) cylinder(h = 4, r = 28, center = true);
}

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

module rod() {
    length = tube_distance_to_center * 2 + tube_height + 20;
    translate([0, 0, 0]) rotate([90, 0, 90])
    difference() {
        cylinder(h = length, r = tube_outer_radius * 2, center = true, $fn = 30);
        translate([-tube_outer_radius * 2, tube_outer_radius, - length / 2.0]) cube([tube_outer_radius * 4, tube_outer_radius, length]);
    }
}

module insignia() {
    base();
    sharks_logo();
}

module insignia_hangable() {
    difference() {
        insignia();
        rod();
    }
    tube_left();
    tube_right();
}

insignia_hangable();
