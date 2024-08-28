
// Persistence of Vision Ray Tracer Scene Description File

#version 3.5; // current version is 3.8

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm
*/ 
 
/*
---------------------------------------------------Modeling approach---------------------------------------------- 
In this fractal a sphere is surrounded by 8 other spheres, with all these spheres fitting in one including cube. These 8 surrounding spheres again are 
surrounded by 8 spheres, also fitting into the cube and so on.

The model is achieved by a loop running over the various levels of this fractal with the number of elements increasing by the factor of 8 with each loop. 
Appropriate values can also be calculated for the relation of the radius of spheres from subsequent loops and for the angle necessary for positioning these spheres. 

For each level first the positions of the level's elements are taken from an array and elements are placed onto these positions. Then new positions for the next loop are calculated and 
stored in another array. When the loop is done, array and radius for the next loop are renamed - they are becoming array and radius for the current loop and this loop is started. 


*/
//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}

//background { 
//    color rgb <1, 1, 1> 
//}


// create a regular point light source
light_source {
  0*x                  // lights position (translated below)
  color rgb <1,1,1>    // lights color
//shadowless
  translate <20, 30, 30>
}


//The camera

#declare Hauptkamera = camera {
    location  <7.9, 7.9,7.9>
    right     x*image_width/image_height
    look_at   <0, -1.2,  0>
}

camera {
    Hauptkamera
} 

//-----------------------------------Definition of parameters--------------------------------
#declare Start = <0, 0, 0>;   
#declare Radius = 4;

#declare Factor = 0.8835*(sqrt(3) - 1)/(1 + sqrt(2));    //Factor for reduction from level to level
#declare Angle = degrees(atan(1/sqrt(2)));       //Angle for rotation around z-axis

#declare counterAlt = 1;
#declare PositionsAlt = array[counterAlt];
#declare PositionsAlt [0] = <0, 0, 0>; 
#declare RadiusNeu = Radius * Factor;//The radius of spheres in the next level


//-----------------------------------------------Loops for the levels-----------------------------------------------------

#declare Levels = 6;

#declare ticker = 0;
#while (ticker<Levels) //Loop for the various levels

    #declare ticker2 = 0; //ticker2 counts over all positions of the current level
    #declare ticker3 = 0; //ticker3 counts over all positions of the next level.

    #declare counterNeu = 8 * counterAlt; //Every sphere obtains (maximum) 8 surrounding sphere in the subsequent level
    #declare PositionsNeu = array[counterNeu]; //This array stores the positions for the next level. 

    //Loop for the various positions within the current level 
    #while (ticker2<counterAlt) 
        
        //----------------------------------------------------Calculating and positioning elements of the current level-------------------------------
        #declare Position = PositionsAlt[ticker2]; //The position of the current element

        sphere { 
            <0, 0, 0>, Radius 
            pigment {          // (---surface color---)
                color rgb <1,(ticker)/(Levels+1),0>    // lights color
            }
            finish {
                ambient 0.1          // ambient surface reflection color [0.1]
                diffuse 0.6          // amount [0.6]
                brilliance 1.0       // tightness of diffuse illumination [1.0]
                specular 0.1 + 0.15 * ticker       // amount [0.0]
            } // finish
            translate Position
        }

        #declare RadiusNeu = Radius * Factor;//The radius of spheres in the next level

        //Calculating 8 positions for the next level and storing in the array PositionsNeu
        #declare ticker4 = 0;
        #while (ticker4 < 4)

            #declare P1 = <Radius + RadiusNeu, 0, 0>; 
            #declare P1  = vrotate (P1, <0, 0, Angle>); 
            #declare P1  = vrotate (P1, <0, 45+90*(ticker4), 0>); 

            #declare P1 = P1 + Position;

            #declare PositionsNeu[ticker3] = P1;

            #declare ticker3 = ticker3 + 1;//Has to be increased by 1 for each new element in the next level

        #declare ticker4 = ticker4 +1;
        #end

        #declare ticker4 = 4;
        #while (ticker4 < 8)

            #declare P1 = <Radius + RadiusNeu, 0, 0>; 
            #declare P1  = vrotate (P1, <0, 0, -Angle>); 
            #declare P1  = vrotate (P1, <0, 45+90*(ticker4), 0>); 

            #declare P1 = P1 + Position;

            #declare PositionsNeu[ticker3] = P1;   

            #declare ticker3 = ticker3 + 1;//Has to be increased by 1 for each new element in the next level

        #declare ticker4 = ticker4 +1;
        #end

    #declare ticker2 = ticker2 + 1;  
    #end//End of loop for the current level - all elements in the current level have been positioned. 
    
//---------------------------------------------Preparations for starting the next level------------------------------------------------    

    //Before starting the next level Radius and positions are redefined. 
    #declare counterAlt = counterNeu;
    #declare PositionsAlt = PositionsNeu; 
    #declare Radius = RadiusNeu;

#declare ticker = ticker + 1;
#end //end of loop over all levels



//-------------------------------------------------------Including object------------------------------------------------------------------

box { 
    <-4, -4, -4>, <4, 4, 4> 
    pigment {          // (---surface color---)
        color rgbt <1,0,0,0.9>    // lights color
    }
}

