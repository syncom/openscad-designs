// OpenSCAD
// Backpack hook for kid's sports bag
// Print with infll 100%


$thickness = 5; // thickness of design

// Ring geometry
$rir=10;         // central hole in the ring
$rth=$thickness; // ring thickness
$rw=$thickness;  // ring width
$row=3;          // ring outlet width
// Hook geometry
$hw=$thickness; // hook width
$hlen=20;       // hook straight shank length
$hir=7.5;         // hook circle inner radius
$hangle=30;     // hook end angle
$th=$hw;        // hook thickness

$fa=2;$fs=0.5;

// ir: inner_radius
// w: width
// th: thickness
module ring(ir, w, th)
{
       difference(){
           cylinder(r=ir+w,h=th);           
           cylinder(r=ir,h=th+1);           
       }
}

// w: width of the ring outlet
module outlet(w)
{
    cube([w+1, w, w+1], center = true);
}

// [dx, dy] determines horizontal translation
// ir: ring inner radius
// w: ring width
// th: thickness
// ow: outlet width
module ring_with_outlet(dx, dy, ir, w, th, ow)
{ 
    translate([dx,dy,0])
    rotate([0,0,15])
    difference() {
        ring(ir, w, th);
        translate([ir+w/2, 0, th/2])
        cube([w+1, ow, th+1], center = true);
    }
}

// w: width
// len: straight shank length
// ir: inner circle radius
// ang: hook end angle
// th: thickness
module hook(w, len, ir, ang, th)
{
    translate([-ir-w,0,0])cube([w,len,th]);
    difference(){
        ring(ir, w, th);
        rotate([0,0,ang])cube([2.5*ir,2*ir,th+1]);
        translate([-2*ir,0,0])cube([ir*2,ir*2,th+1]);
    }
    rotate([0,0,ang])translate([ir+w/2,0,0])cylinder(d=w,h=th);

}

module main()
{
    ring_with_outlet(0, 0, $rir, $rw, $rth, $row);
    translate([-$hir-$hw/2, $hlen+$rir, 0])
    rotate([0, 0, 180])
    hook($hw, $hlen, $hir, $hangle, $th);
}

main();
