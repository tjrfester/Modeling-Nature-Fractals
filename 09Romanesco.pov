// Persistence of Vision Ray Tracer Scene Description File

#version 3.6; // current version is 3.8

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm
*/ 
 
/*
---------------------------------------------------Modeling approach---------------------------------------------- 
This case deviates from my usual approach of modeling the complete fractal in nested loops, since there are so many elements in one single layer. Therefore 
I am first modeling one single structural element, a rosette. These rosettes are then arranged in a spiral way constituting the main plant body. The outer-most layer of 
rosettes is the surrounded by one ring of main plant bodies. 

That's not perfect however - feel free to build a more uniform model... 
*/ 
                

//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}

background { 
    color rgb <1, 1, 1> 
}


#declare Hauptkameray = camera {
    location  <0, 110, 0>
    right     x*image_width/image_height
    look_at   <0, 0,  0>
}

camera {
    Hauptkameray
}

// create a regular point light source
light_source {
    0*x                  // light's position (translated below)
    color rgb <1,1,1>    // light's color
    translate <-100, 100, 300>
}
light_source {
    0*x                  // light's position (translated below)
    color rgb <1,1,1>    // light's color
    translate <0, 100, 300>
}
light_source {
     0*x                  // light's position (translated below)
    color rgb <1,1,1>    // light's color
    translate <-400, 20, -400>
}

//-----------------------Definition of initial parameters------------------------------------------------


#declare P0 = <0, 5, 0>;                //Central start position
#declare Anglexy = 0;                  //Rotation around z-axis
#declare Anglez = 0;                   //Rotation around y-axis
#declare Distance = 0.7;

//------------------------------------------------Definition of main structural element (rosette)--------------------------

#declare Rosette = union {

    #declare Angle0 = 0;

    #declare ticker2 = 1;               //The first loop defines 12 repetitions of a given spiral arm
    #while ( ticker2 <13)

        #declare ticker = 1;            //The second loop defines the length of a spiral arm (6 elements). 
        #while ( ticker <6)
            
            #declare Distance = 0.9 * ticker; 
            #declare Anglez = Angle0 +  11 * ticker;
            #declare P1=<P0.x + (Distance * (cos(radians(Anglez)))), P0.y - ticker * 0.7 - ticker * ticker * 0.05, P0.z + (sin(radians(Anglez)) * Distance)>;

            sphere {
                <0, 0, 0> 0.3       // radius of sphere
                scale <0.25 + ticker *0.35 - ticker * ticker *0.005, 0.25 + ticker *0.35- ticker * ticker *0.005, 0.25 + ticker *0.35- ticker * ticker *0.005>
                translate P1
                texture {
                    pigment {
                        color rgb <0.01 * ticker, 0.9,0>     // solid color pigment
                    }
                    normal { 
                        bumps 1 scale 0.05 
                    }
                    finish {
                        ambient 0.4          // ambient surface reflection color [0.1]
                        diffuse 0.9          // amount [0.6]
                        brilliance 1.0       // tightness of diffuse illumination [1.0]
                        phong 0.5          // amount [0.0]
                    } // finish
                }
            } 

        #declare ticker = ticker + 1; 
        #end

        #declare Angle0 = Angle0 + 30;

    #declare ticker2 = ticker2 + 1; 
    #end

    #declare Anglez = 0;
    #declare Angle0 = 20;

    #declare ticker2 = 1;                    //The first loop defines 12 repetitions of a given spiral arm
    #while ( ticker2 <13)

        #declare ticker = 0;                //The second loop defines the length of a spiral arm (6 elements). 
        #while ( ticker <6)
        
            #declare Distance = 0.8 * ticker; 
            #declare Anglez = Angle0 +  11 * ticker;

            #declare P1=<P0.x + (Distance * (cos(radians(Anglez)))), P0.y - 0.8 - ticker * 0.6 - ticker * ticker * 0.095, P0.z + (sin(radians(Anglez)) * Distance)>;
            sphere {
                <0, 0, 0> 0.3       // radius of sphere
                scale <2 + ticker *0.55 - ticker * ticker *0.005, 2 + ticker *0.55- ticker * ticker *0.005, 2 + ticker *0.55- ticker * ticker *0.005>
                translate P1
                texture {
                    pigment {
                        color rgb <0,0.9- 0.09 * ticker, 0.1>     // solid color pigment
                    }
                    normal { 
                        bumps 0.5 scale 0.05 
                    }
                    finish {
                        ambient 0.2          // ambient surface reflection color [0.1]
                        diffuse 0.6          // amount [0.6]
                        brilliance 1.0       // tightness of diffuse illumination [1.0]
                        phong 0.1          // amount [0.0]
                    } // finish
                }
            } 

        #declare ticker = ticker + 1; 
        #end

        #declare Angle0 = Angle0 + 30;

    #declare ticker2 = ticker2 + 1; 
    #end
 
} 

//------------------------------------arrangement of rosettes into the main plant body---------------------------------------------
    
#declare Kohl = union {
    object {Rosette
    translate <0, 2.5, 0>
    }


    #declare Angle0 = 0;
    #declare Anglez = 0;

    #declare ticker2 = 1;               //The first loop defines 12 repetitions of a given spiral arm
    #while ( ticker2 <13)

        #declare ticker = 1;            //The second loop defines the length of a spiral arm (6 elements). 
        #while ( ticker <9)
        
            #declare Distance = 3.5 * ticker + 0.5 * ticker* ticker; 
            #declare Anglez = Angle0 +  9 * ticker;
            #declare P1=<P0.x + (Distance * (cos(radians(Anglez)))), P0.y  - ticker * 4.9- ticker * ticker*0.61, P0.z + (sin(radians(Anglez)) * Distance)>;

            object {
                Rosette
                scale <0.65 + ticker *0.35 - ticker * ticker *0.005, 0.65 + ticker *0.35- ticker * ticker *0.005, 0.65 + ticker *0.35- ticker * ticker *0.005>
                rotate <0, 0, 35>
                rotate <0, 180 - Anglez, 0>
                translate P1
            } 
 
  

        #declare ticker = ticker + 1; 
        #end

        #declare Angle0 = Angle0 + 30;

    #declare ticker2 = ticker2 + 1; 
    #end
}


object {
    Kohl
    translate <0, 0, 0>
}

//------------------------------The outer layer of rosettes is followed by an outer level of the complete plant bodies reduced in size--------------------------

//Basically it should also be possible to use these "complete plant bodies to build up the complete model. 

#declare Angle0 = 15;
#declare Anglez = 0;

#declare ticker2 = 1;                     //The first loop defines 12 repetitions of a given spiral arm
#while ( ticker2 <13)

    #declare ticker = 1;                  //The second loop defines the length of a spiral arm (1 element). 
    #while ( ticker <2)
 
        #declare Distance = 87.5 * ticker + 1.5 * ticker* ticker; 
        #declare Anglez = Angle0 +  9 * ticker;
        #declare P1=<P0.x + (Distance * (cos(radians(Anglez)))), P0.y  - ticker * 90- ticker * ticker*1.2, P0.z + (sin(radians(Anglez)) * Distance)>;

        object {
            Kohl
            scale <0.65 + ticker *0.35 - ticker * ticker *0.005, 0.65 + ticker *0.35- ticker * ticker *0.005, 0.65 + ticker *0.35- ticker * ticker *0.005>
            rotate <0, 0, 35>
            rotate <0, 180 - Anglez, 0>
            translate P1
        } 

    #declare ticker = ticker + 1; 
    #end

    #declare Angle0 = Angle0 + 30;

#declare ticker2 = ticker2 + 1; 
#end


