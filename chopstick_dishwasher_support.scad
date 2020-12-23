// This design is for holding/supporting chopsticks in my dishwasher utensil basket
$fn = 30;

// Adjust the legnth and width to suit your needs
length = 86; // in millimeters
width = 0.9 * length;
height = 6;
depth_percentage = 0.75; 

module chopstick_base() {
    difference() {
        cube(size=[length, width, height], center=true);
        union() {
            for (i = [-5:1:5], j = [-4:1:4]) {
            
                translate([i * 7, j * 7, 0])
                cylinder(h=height, r=1.5, center=true);
                };
            translate([0, 0, height * 0.5 * (1 - depth_percentage)])
            cube(size=[length * 0.95, width * 0.95, height * depth_percentage], center = true);
                
            }


    }
}

chopstick_base();