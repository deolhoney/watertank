include<values.scad>


//coloum of a Water-tank
col_width=col_height*0.0133;
//col no=8;
//col 


for(i = [ [col_height*0.2,   col_height*0.18  ,col_height*-0.03],
          [col_height*-0.2, col_height*0.18 , col_height*-0.03],
          [col_height*0.2, col_height*-0.18 ,col_height*-0.03],
          [col_height*-0.2, col_height*-0.18, col_height*-0.03],
          [col_height*0.28, 0, col_height*-0.03],
          [col_height*-0.28,0,  col_height*-0.03],
          [0,      col_height*0.27, col_height*-0.03],
          [0, col_height*-0.27, col_height*-0.03],])
{
   translate(i )
  color("silver")
 cylinder(r=col_width,h=col_height, center = true);
}
module bracing() {
    //brace of a Water Tank
$fn=8;
    //bracing width
bracing_width=col_height*0.28;
//bracing height
bracing_height=col_height*0.033;
//bracing no=4
for(i = [ [ 0,  0,bracing_width*-1.06],  
          [0, 0, bracing_width*-0.35],
          [0, 0, bracing_width*0.3],
          [0, 0,bracing_width*0.99 ],
           ])
{
	  	translate(i)
   	 
 		difference(){
		color("silver")
     cylinder(r=bracing_width,h=bracing_height, center = true);   
	 cylinder(r=col_height*0.25, h=col_height*0.07, center = true);
		}
}
}
bracing();







//foundation beam of a "Water-tank"


//plinth height
plinth_height=col_height*0.04;


$fn=150;
translate([0,0,col_height*-0.6])
color("silver")
cylinder(r1=plinth_width,r2=col_height*0.3,h=col_height*0.08);



//supportable part of Water-tank

//support beam height
beam_height=col_height*0.09;

translate([0,0,col_height*0.51])
color("silver")
cylinder(r1=beam_width,r2=beam_width*1.2,h=beam_height,center=true);




//cylinder upper Tank 
//cylinder height
cylinder_height=col_height*0.37;


translate([0,0,col_height*0.74])
difference(){
color("silver")
cylinder(r=cylinder_diameter,h=cylinder_height,center=true);
cylinder(r=cylinder_diameter*0.9,h=col_height*0.4,center=true);
}

//roof of a water tank

t=col_height*0.4;
roof_height=col_height*0.2;
f=col_height*0.07;


translate([0,0,col_height*1.02])
color("grey")
difference(){
cylinder(r1=roof_diameter,r2=F,h=roof_height,center=true);
cylinder(r1=roof_diameter*0.83,r2=f,h=col_height*0.4,center=true);
}


//lid of a water tank
//lid height
lid_height=col_height*0.03;



translate([0,0,col_height*1.02])
color("black")
cylinder(r=lid_diameter,h=lid_height,center=true);
