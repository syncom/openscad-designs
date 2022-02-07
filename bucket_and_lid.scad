/*
  Bucket and lid
*/

thickness = 5; // 5mm
outer_radius = 50; // 50mm
inner_radius = outer_radius - thickness;
half_drum_height = 0.6 * outer_radius;
drum_height = 2 * half_drum_height;
// use Pythagorean theorem here
bottom_radius = 0.8 * outer_radius;
/* lid measurements */
lid_outer_radius = bottom_radius;
// make inner radius slightly smaller to account for error
lid_inner_radius = 0.8 * inner_radius - 1;
lid_outer_height = 5;
lid_inner_height = 5;
lid_text_depth = 3;
lid_text_id = "SHANG";
lid_text_size = 10;
font_name = "Liberation Sans";

module hollow_ball() {
    difference() {
        sphere(r = outer_radius, $fa = 6);
        sphere(r = inner_radius, $fa = 6);
    }
}

module drum() {
    intersection() {
        hollow_ball();
        cylinder(h = drum_height, r = outer_radius, center = true);
    }
}

module bottom() {
    translate([0, 0, -half_drum_height])
      cylinder(h = thickness, r = bottom_radius);
}

module bucket_without_lid() {
    union() {
        drum();
        bottom();
    }
}

module bucket_lid() {
    difference() {
        union() {
            cylinder(h = lid_outer_height, r = lid_outer_radius, center = false);
            translate([0, 0, -lid_inner_height])
              cylinder(h = lid_inner_height, r = lid_inner_radius, center = false);
        };
        translate([-lid_text_size * 2.5, -lid_text_size * 0.5, lid_outer_height - lid_text_depth]) linear_extrude(height = lid_text_depth, center = false) text(text = lid_text_id, font = font_name, size = lid_text_size);
    }
}

module bucket_and_lid() {
    // bucket without lid
    translate([0, 0, half_drum_height]) bucket_without_lid();

    // lid
    translate([inner_radius * 2, 0, lid_inner_height]) bucket_lid();
}

// show bucket and lid
bucket_and_lid();