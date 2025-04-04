/*
CRU Soccer Logo
    
Image file "./imports/cru-soccer-logo.svg" is obtained from a flat PNG image
(./imports/cru-soccer-logo.png) using Inkscape (version 1.2):
- Menu "Path -> Trace Bitmap -> Multicolor"
    - Set "Detection mode" to "Colors"
    - Set "Scans" to 2. Check "Stack", "Smooth" and "Remove background" checkboxes
    - Use default settings for "Details": Speckles 2; Smooth corners 1.00; Optimize 0.200.
    - Click "Apply"
    - Drag top layer aside, and remove original image at the bottom layer

- Menu "File -> Export"
    - Export to "Plan SVG (*.svg)" format

----------------
3D Printing settings (for Flashforge Adventurer 3):

Infill: 60%
Raft: No (Need to increase platform temperature to 58 degrees and apply some
glue on bed to make the artifact hold)

*/


// Increasing DPI value will make object smaller  
module cru_soccer(ht) {
linear_extrude(height=ht) import("./imports/cru-soccer-logo.svg", center = true, dpi = 450);
}

module base(ht) {
    cylinder(h=ht, r = 32, $fn = 42, center = false);
}

module logo_with_base() {

    intersection() {
        cru_soccer(8);
        base(8);
    };
    base(4);
}

logo_with_base();