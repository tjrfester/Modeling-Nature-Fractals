
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
The basic element of this fractal consists of three boxes with the length 3 times the height and width, each of them turned by 90 degrees with respect to the others (3D-cross). 
Elements of subsequent levels are scaled down by a factor of 1/3 and arranged in all corners of the 3D-cross.This is done on 4 different layers.  


*/ 
                
//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
}


// create a regular point light source
light_source {
    0*x                  // lights position (translated below)
    color rgb <0.5,0.5,0.5>    // lights color
    shadowless
    translate <20, 4, 4>
}  


//The camera

#declare Hauptkamera = camera {
    location  <7, 7, 7>
    right     x*image_width/image_height
    look_at   <0, 0,  0.0>
}


camera {Hauptkamera}

//-----------------------------------The structural element of the fractal --------------------------------

#declare Radius = 3;  

#declare Element = union{
    box { 
        <-3*Radius, -Radius, -Radius>, <3*Radius, Radius, Radius> 
    }
    box { 
        <-3*Radius, -Radius, -Radius>, <3*Radius, Radius, Radius> 
        rotate <0, 90,0>
    }
    box { 
        <-3*Radius, -Radius, -Radius>, <3*Radius, Radius, Radius> 
        rotate <0, 0,90>
    }
}

//-----------------------------------Transformationarray needed for placing elements of the following layer around one element of the current layer--------------------------------------

#declare TransformationArray = array[20] {
    <Radius*2, Radius*2, Radius*2>, <-Radius*2, Radius*2, Radius*2>, <Radius*2, Radius*2, -Radius*2>, <-Radius*2, Radius*2, -Radius*2>, 
    <0, Radius*2, Radius*2>, <0, Radius*2, -Radius*2>, <Radius*2, Radius*2, 0>, <-Radius*2, Radius*2, 0>, 
                                          
    <Radius*2, 0, Radius*2>, <Radius*2, 0, -Radius*2>, <-Radius*2, 0, Radius*2>, <-Radius*2, 0, -Radius*2>, 
                                          
    <Radius*2, -Radius*2, Radius*2>, <-Radius*2, -Radius*2, Radius*2>, <Radius*2, -Radius*2, -Radius*2>, <-Radius*2, -Radius*2, -Radius*2>, 
    <0, -Radius*2, Radius*2>, <0, -Radius*2, -Radius*2>, <Radius*2, -Radius*2, 0>, <-Radius*2, -Radius*2, 0>
}; 

//------------------------------------------------Basic parameters for the fractal-------------------------------------------

#declare Faktor = 1/3;                      //Factor for scaling down the basic element
#declare Start = <0, 0, 0>;                 //Start position
#declare counter = 1;                       //The array storing the start position
#declare Positions = array [counter];
#declare Positions [0] = Start;  
#declare layers = 4;

//-----------------------------------Nested loops for constructing the fractal---------------------------------------------------

#declare ticker = 0;
#while (ticker<layers) //loop over all layers

    #declare counterNew = 20 * counter; //Each element guides the arrangement of 20 elements from the subsequent layer; so the number of elements is increasing by the factor of 20 from layer to layer.
    #declare PositionsNew = array[counterNew]; //PositionsNew stores the new positions for elements in the next layer.

    #declare ticker2 = 0; //ticker2 counts the elements in the current layer
    #declare ticker3 = 0; //ticker3 counts the elements in the next layer

    #while (ticker2<counter)                                                    //Loop over the various elements in the current layer 

        #declare Position = Positions [ticker2];                                //Positioning a new element

        object {
            Element 
            scale pow(Faktor, ticker+1)
            pigment {          // (---surface color---)
                color rgb <1,(ticker+1)/(layers+1),0>    
            }
            translate Position
        } 
    
        #declare ticker4 = 0;                                                       //Loop defining 20 positions of elements from the next layer, guided by the current element
        #while (ticker4 <20)
    
            #declare Transformation = TransformationArray [ticker4];
            #declare Transformation = Transformation * pow(Faktor, ticker+1) + Position; 
            #declare PositionsNew [ticker3] = Transformation; 
    
            #declare ticker3 = ticker3 + 1; 
    
        #declare ticker4 = ticker4 + 1; 
        #end

    #declare ticker2 = ticker2 + 1;                                            //End of loop over the current level
    #end
        
    #declare counter = counterNew;                                             //Before starting a loop for the next layer, the positions for the next loop defined above have to be redefined to the positions of the current loop. 
    #declare Positions = PositionsNew; 

#declare ticker = ticker + 1;

#end //end of loop over all layers. 

