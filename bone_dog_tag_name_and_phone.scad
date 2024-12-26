// Adapted from the original design at https://www.thingiverse.com/thing:4787569

/* 3D printing parameters

Printer: Flashforge Adventurer 3
Infill: 50%
Raft: Yes
Support: Treelike

*/


$fa=1; // the minimum angle for a fragment.
$fs=1; // the minimum size of a fragment
bone_height = 8;// the thickness of the tag
pet_name="petname";
phone_number="999-999-9999";
phone_number2="0000000000";
font_face="Consolas";
font_thickness=3; // should be less than bone_height/2

// text transformation
module t(txt, txt_size){
 translate([-2, -len(txt)*4.5*txt_size/12.0, bone_height])
   rotate([0, 0, 90])
    linear_extrude(height = font_thickness+1)
      text(txt, size = txt_size, font = str(font_face), $fn = 16);
}

//left side of bone
module bone_left() { 
translate([-12,-40,0]) 
  {
    translate([24,0,0]) cylinder(h=bone_height, r=14);
    cylinder(h=bone_height, r=14);
  };
}

//right side of bone
module bone_right() {
  translate([-12,40,0]) 
    {
      translate([24,0,0]) cylinder(h=bone_height, r=14);
      cylinder(h=bone_height, r=14);
    };
}

//center of bone
module bone_center() {
  translate([-15,-49,0]) cube([30,98,bone_height]);
}

//tag attachment
module tag_attachement() {
  difference() {
    translate([-16,0,0]) cylinder(r=6, h=bone_height);
    //prevents non-manifold
    translate([-16,0,-1]) cylinder(r=3, h=((bone_height)+2));
  }
}

// bone without text and attachment
module bone() {
     bone_left();
     bone_right();
     bone_center();
}

// final artifact
module bone_dog_tag() {
  tag_attachement();
  difference() {
    bone();
    translate([6,0,-font_thickness]) t(pet_name, 12);
    translate([15,0,-(bone_height+1)]) mirror([0,1,0]) t(phone_number, 9);
//translate([0,0,-(bone_height+1)]) mirror([0,1,0]) t(phone_number2, 9);
  }
}

bone_dog_tag();