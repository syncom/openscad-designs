// This design is for holding/supporting chopsticks in my dishwasher utensil basket
$fn = 30;

// Adjust the legnth and width to suit your needs
length = 82; // in millimeters
width = 0.9 * length;
height = 1.5; 

module chopstick_base() {
    difference() {
        cube(size=[length, width, height], center=true);
        for (i = [-5:1:5], j = [-4:1:4]) {
            
            translate([i * 7, j * 7, 0])
            cylinder(h=height, r=1.5, center=true);
            }


    }
}

chopstick_base();