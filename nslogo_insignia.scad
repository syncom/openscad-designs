/*
North Shore Girls Softball logo insignia
    
Image file "nslogo.svg" is obtained from a flat PNG image (./imports/nslogo.png) using Inkscape (version 1.2):
- Menu "Path -> Trace Bitmap -> Multicolor"
    - Set "Detecton mode" to "Colors".
    - Set "Scans" to 2. Check "Smooth" and "Remove background" checkboxes.
    - Use default settings for "Details": Speckles 2; Smooth corners 1.00; Optimize 0.200.
- Menu "File -> Export"
    - Export to "Plan SVG (*.svg)" format
    

*/
// Increasing DPI value will make object smaller  
module flower() {
linear_extrude(height=4) import("./imports/nslogo.svg", center = true, dpi = 165);
}

module base() {
    cylinder(h=2, r = 22.5, $fn = 30, center = false);
}

module flower_with_base() {
    flower();
    base();
}

flower_with_base();