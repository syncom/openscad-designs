/*
North Shore Girls Softball 2025 Team Blue Waves Logo
    
Image file "blue_waves_logo.svg" is obtained from a flat JPG image
(./imports/blue_waves_log.JPG) using Inkscape (version 1.2):
- Menu "Path -> Trace Bitmap -> Multicolor"
    - Set "Detection mode" to "Colors"
    - Set "Scans" to 2. Check "Stack", "Smooth" and "Remove background" checkboxes
    - Use default settings for "Details": Speckles 2; Smooth corners 1.00; Optimize 0.200.
    - Click "Apply"
    - Drag top layer aside, and remove original image at the bottom layer
- Menu "Path -> Trace Bitmap -> Single scan"
    - Set "Detection mode" to "Brightness cutoff"
    - Adjust "Threshold" accordingly (0.806)
    - Use default settings for "Details"
    - Click "Apply"
    - Drag top layer aside, and remove original image at the bottom layer
    - The resulting image should be a black-and-white

- Menu "File -> Export"
    - Export to "Plan SVG (*.svg)" format

----------------
3D Printing settings (for Flashforge Adventurer 3):

Infill: 60%
Raft: No (Need to increase platform temperature to 58 degrees and apply some
glue on bed to make the artifact hold)

*/

// Increasing DPI value will make object smaller  
module waves() {
linear_extrude(height=4) import("./imports/blue_waves_logo.svg", center = true, dpi = 240);
}

module base() {
    cylinder(h=2, r = 28, $fn = 30, center = false);
}

module waves_with_base() {
    waves();
    base();
}

waves_with_base();