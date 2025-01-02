/*
DMCV Sharks soccer club logo insignia

Image file "dmcv-sharks-logo.svg" is obtained from a flat PNG image
(./imports/dmcv-sharks-logo.png) using Inkscape (version 1.2).

*/

module sharks_logo() {
    linear_extrude(height = 9)
    import("./imports/dmcv-sharks-logo.svg", center = true, dpi =
    240);
}

module base() {
    translate([0, 0, 2]) cylinder(h = 4, r = 28, center = true);
}

module insignia() {
    base();
    sharks_logo();
}

insignia();
