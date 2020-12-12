use <fonts/ZCOOLXiaoWei-Regular.attf>;

$fn = 30;

id = "尚";
font_name = "ZCOOL XiaoWei:style=Regular";


outer_radius = 50; // 50 millimeters
inner_radius = 0.9 * outer_radius;

module coaster(scale, z_scale) {
    difference() {
        cylinder(h=6 * z_scale, r=outer_radius * scale, center=false);
        union() {
            translate([0, 0, 4 * z_scale]) cylinder(h=2, r=inner_radius * scale, center=false);
            cylinder(h=1 * z_scale, r=inner_radius * scale, center=false);
        }
    }
}

module coaster_personalized(scale, z_scale) {

    difference() {
        coaster(scale, z_scale);
        translate([-35 * scale, -25 * scale, 3 * z_scale]) linear_extrude(height=2 * z_scale, center=false) text(text=id, font=font_name, size=50 * scale);
    }
}

coaster_personalized(0.7, 0.5);
