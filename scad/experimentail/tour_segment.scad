//$fa=0.01;
//$fs=0.5;


module segment_with_overhang(x0, y0, x1, y1, height, thickness, 
                             overhang_height_max, overhang_height_min, oberhang_width){

    radius = thickness/2;

    color([100,100, 10]/255)
    translate([x0,y0,0])
    cylinder(h=height, r=radius, center = false);

    color([100,100, 10]/255)
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
               
              
    oh_h_max = overhang_height_max;                   
    oh_h_min = overhang_height_min;                   
    oh_y     = thickness + oberhang_width;
    l = distance;      
    t = thickness;   
    
    CubePoints = [
        [  0,  0,     0 ],  //0
        [  l,  0,     0 ],  //1
        [  l,  t,     0 ],  //2
        [  0,  t,     0 ],  //3
        [  0,  0,     oh_h_max ],  //4                                 
        [  l,  0,     oh_h_max ],  //5
        [  l,  oh_y,  oh_h_max ],  //6  
        [  0,  oh_y,  oh_h_max ],  //7  
        [  l,  oh_y,  oh_h_max-oh_h_min ],  //8  
        [  0,  oh_y,  oh_h_max-oh_h_min ]   //9  
      ]; 
  
CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,8,2,1],  // right
  [6,7,9,8],  // back1
  [8,9,3,2],  // back2
  [7,4,0,3,9]]; // left
    
    translate([x0, y0, height-0.1])
   rotate(a=angle, v=[0,0,1])
    translate([0, -radius, 0])
  polyhedron( CubePoints, CubeFaces );

}

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


/*Test_segment_base();
module Test_segment_base(){
    segment_base(x0=10, y0=20, x1=30, y1=40, height=10, thickness=5);
    segment_base(x0=15, y0=20, x1=35, y1=40, height=10, thickness=5);
    segment_base(x0=-15, y0=-20, x1=-35, y1=-40, height=10, thickness=5);
    segment_base(x0=15, y0=-20, x1=35, y1=-40, height=10, thickness=5);
    segment_base(x0=-15, y0=20, x1=35, y1=-40, height=10, thickness=5);
}
*/

Test_segment_with_overhang();
module Test_segment_with_overhang(){
    segment_with_overhang(x0=10, y0=20, x1=30, y1=40, 
                          height=10, thickness=5, 
                          overhang_height_max=3, overhang_height_min=1, oberhang_width=5);


    segment_with_overhang(x0=30, y0=40, x1=40, y1=55, 
                          height=10, thickness=5, 
                          overhang_height_max=3, overhang_height_min=1, oberhang_width=5);


    segment_with_overhang(x0=-10, y0=-20, x1=-30, y1=-40, 
                          height=10, thickness=5, 
                          overhang_height_max=3, overhang_height_min=1, oberhang_width=5);
/*    segment_with_overhang(x0=-30, y0=-40, x1=-10, y1=-20, 
                          height=10, thickness=5, 
                          overhang_height_max=3, overhang_height_min=1, oberhang_width=9);
*/


}
