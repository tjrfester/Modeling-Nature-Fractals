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
In this fractal a sphere is filled by 4 other spheres. This pattern is repeated on six levels. Finally the structure is cut to show its fractal nature.

The model is achieved by a loop running over the various levels of this fractal with the number of elements increasing by the factor of 4 with each loop. 
Appropriate values can also be calculated for the relation of the radius of spheres from subsequent loops. 

For each level first the positions of the level's elements are taken from an array and elements are placed onto these positions. Then new positions for the next loop are calculated and 
stored in another array. When the loop is done, array and radius for the next loop are renamed - they are becoming array and radius for the current loop and this loop is started. 

*/

//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}

background { 
    color rgb <1, 1, 1> 
}

// create a regular point light source
light_source {
  0*x                  // lights position (translated below)
  color rgb <1,1,1>    // lights color
//shadowless
  translate <20, 4, 4>
}


//The camera

#declare Hauptkamera = camera {
    location  <9.5, 1, 1>
    right     x*image_width/image_height
    look_at   <0, 0,  0.0>
}

camera {Hauptkamera} 

//-----------------------------------Initial parameters--------------------------------
#declare chance1 = seed(4);

#declare Start = <0, 0, 0>;   //Features of the initial sphere
#declare Radius = 4;
#declare Faktor = sqrt(2)/((sqrt(6)/4) * 2 * sqrt(2) + sqrt(2));    //Factor of reduction in each level. 
#declare zaehlerAlt = 1; //Number of elements for the current level
#declare PunkteAlt = array[zaehlerAlt];//Array for the positions of elements in the current level 
#declare PunkteAlt [0] = Start; //Defining the very first element (in the first level) 
#declare Ebenen = 6; //number of levels

//------------------------------------------the object(s)--------------------------------------

difference{ //the fractal is cut to better see its structure
    union{  //union over the complete fractal

        #declare ticker = 0;                                                                     //loops over all levels (each level is built in one loop
        #while (ticker<Ebenen) 

            #declare ticker2 = 0; //ticker2 counts all elements of the current level
            #declare ticker3 = 0; //ticker3 counts all positions of elements created in this loop for the next level. 

            #declare zaehlerNeu = 4 * zaehlerAlt; //(maximum number of elements in the next level
            #declare PunkteNeu = array[zaehlerNeu]; //Array for storing positions of elements in the next level

            //loop for all elements in the current level 
            #while (ticker2<zaehlerAlt) 

                //extracting position of the element from the array and positioning the element
                #declare Position = PunkteAlt[ticker2];

                sphere { 
                    <0, 0, 0>, Radius 
                    hollow
                    pigment {          // (---surface color---)
                        color rgb <1,(Ebenen - ticker)/(Ebenen),0>    // lights color
                    }
                    translate Position
                }
                
                //Elements in the next level belonging to the current element
                
                #declare RadiusNeu = Radius * Faktor; 
                #declare tetra = RadiusNeu/sqrt(2);

                #declare var1 = rand (chance1);
                #declare var2 = rand (chance1);

                    //Calculating positions for these elements and storing positions
                #declare P1 =  <tetra, tetra, tetra>;
                #declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
                #declare PunkteNeu[ticker3] = Position + P1;
                #declare P1 =  <-tetra, tetra, -tetra>;
                #declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
                #declare PunkteNeu[ticker3+1] = Position + P1;
                #declare P1 =  <-tetra, -tetra, tetra>;
                #declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
                #declare PunkteNeu[ticker3+2] = Position + P1;
                #declare P1 =  <tetra, -tetra, -tetra>;
                #declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
                #declare PunkteNeu[ticker3+3] = Position + P1;

                #declare ticker3 = ticker3 + 4; //ticker3 counts all new positions for elements from the next layer created in this layer.

            #declare ticker2 = ticker2 + 1;  

            #end//end 

            //The loop of the next level is prepared by renaming the  array of positions, number of positions and radius of the next level to respective parameters of the current level.  

            #declare PunkteAlt = PunkteNeu; 
            #declare zaehlerAlt = zaehlerNeu;
            #declare Radius = RadiusNeu;

        #declare ticker = ticker + 1;

        #end //end of loop over all levels 

        rotate <45, 45, 0>
    }

    box {                                  //for cutting
        <1, -10, -10>, <10, 10, 10> 
        pigment {          // (---surface color---)
            color rgbt <1,1,0, 1>    // lights color
        }
    }

}


