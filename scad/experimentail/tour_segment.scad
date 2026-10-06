//$fa=0.01;
//$fs=0.5;


module segment_base(x0, y0, x1, y1, height, thickness){

    //echo("segment_base: ", 
    //    x0=x0, y0=y0, x1=x1, y1=y1, 
    //    height=height, thickness=thickness);

    radius = thickness/2;

    //color([100,100, 10]/255)
    translate([x0,y0,0])
    cylinder(h=height, r=radius, center = false);

    //color([100,100, 10]/255)
    translate([x1,y1,0])
    cylinder(h=height, r=radius, center = false);   
    
    distance = sqrt((x0-x1)^2 + (y0-y1)^2);
    angle = atan2(y1-y0, x1-x0); 
    
    trans_x = x0+(x1-x0)/2;
    trans_y = y0+(y1-y0)/2;
    trans_z = height/2;
    //echo("segment_base: ", 
    //    trans_x=trans_x, trans_y=trans_y, trans_z=trans_z); 
    
    translate([trans_x, trans_y, trans_z])
    rotate(a=angle, v=[0,0,1])
    cube([distance,thickness,height], center=true);

}

////////////////////////////
// 
// Tests
//
///////////////////////

/*
Test_segment_base();
module Test_segment_base(){
    segment_base(x0=10, y0=20, x1=30, y1=40, height=10, thickness=5);
    segment_base(x0=15, y0=20, x1=35, y1=40, height=10, thickness=5);
    segment_base(x0=-15, y0=-20, x1=-35, y1=-40, height=10, thickness=5);
    segment_base(x0=15, y0=-20, x1=35, y1=-40, height=10, thickness=5);
    segment_base(x0=-15, y0=20, x1=35, y1=-40, height=10, thickness=5);
}
*/