
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
In this fractal a sphere is filled by 10 other spheres. This pattern is repeated on 4 levels. Finally the structure is cut to show its fractal nature.

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
    location  <8.5, 0, 0>
    right     x*image_width/image_height
    look_at   <0, 0,  0.0>
}

camera {
    Hauptkamera
}

//-----------------------------------Das Objekt--------------------------------
#declare chance1 = seed(4);
#declare chance2 = seed(7);
#declare chance3 = seed(9);



#declare Start = <0, 0, 0>;   //Eigenschaften des ersten Objekts

#declare Radius = 4;

#declare RadiusAlt = Radius;



difference{

    union{

        //Das Start-Objekt
        sphere { 
            <0, 0, 0>, RadiusAlt 
            hollow
            pigment {          // (---surface color---)
                color rgb <1,1,0>    // lights color
            }
            translate Start  
        } 

        #declare Faktor1 = 2/(sqrt (3) * (1 + sqrt(5)));    //Verkleinerungsfaktor
        #declare Faktor = 0.8 * Faktor1/(1+Faktor1); 
        #declare Radius = Radius * Faktor;   //Radius der Elemente der ersten Ebene
        #declare Kreisradius = RadiusAlt-Radius;
        #declare zaehlerAlt = 32; //Diese Variable zaehlt die verschiedenen Aeste 
        #declare PunkteAlt = array[zaehlerAlt]; 
        #declare Winkel1 = degrees(asin(4 * Radius/(sqrt(3) * (1 + sqrt (5)) * 2 * sin (pi/5)))); //Winkel fuer das erste Fuenfeck
        #declare Winkel2 = degrees(asin(4 /(sqrt(3) * (1 + sqrt (5))))); 

        #declare PunkteAlt[0] = <0, Kreisradius, 0>;

        #declare ticker1 = 0;
        #while (ticker1<5)                         //6

            #declare P1 =  <0, Kreisradius, 0>;
            #declare P1 = vrotate (P1, <-58.285, 0, 0>);
            #declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
            #declare PunkteAlt[ticker1 + 1] = P1;
  
        #declare ticker1 = ticker1 + 1; 
        #end  

        #declare ticker1 = 0;
        #while (ticker1<5)                         //11

            #declare P1 =  <0, Kreisradius, 0>;
            #declare P1 = vrotate (P1, <116.57, 0, 0>);
            #declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
            #declare PunkteAlt[ticker1 + 6] = P1;
   
        #declare ticker1 = ticker1 + 1; 
        #end  

        #declare PunkteAlt[11] = <0, -Kreisradius, 0>;     //12

        #declare ticker1 = 0;
        #while (ticker1<5)                         //17

#declare P1 =  <0, Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare PunkteAlt[ticker1 + 12] = P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  


#declare ticker1 = 0;

#while (ticker1<5)                         //22

#declare P1 =  <0, Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <Winkel2, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare PunkteAlt[ticker1 + 17] = P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker1 = 0;

#while (ticker1<5)                         //27

#declare P1 =  <0, -Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <Winkel2, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare PunkteAlt[ticker1 + 22] = P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker1 = 0;

#while (ticker1<5)                         //32

#declare P1 =  <0, -Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare PunkteAlt[ticker1 + 27] = P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  





//Die weiteren Ebenen

#declare Ebenen = 3;

#declare ticker = 0;

#while (ticker<Ebenen) //Schleife ueber die verschiedenen Ebenen


#declare ticker2 = 0; //ticker2 zaehlt ueber die Startpunkte der nun folgenden Ebene
#declare ticker3 = 0; //ticker3 zaehlt ueber die in der folgenden Ebene neu geschaffenen Ansatzpunkte





#declare zaehlerNeu = 32 * zaehlerAlt; //(Maximale) Veraenderung der Elementzahl pro Ebene
#declare PunkteNeu = array[zaehlerNeu]; //PunkteNeu speichert die in dieser Ebene geschaffenen Ansatzpunkte


//Schleife ueber die verschiedenen Aeste in einer Ebene   

#while (ticker2<zaehlerAlt) 


//Berechnung und Positionieren des neuen Elements

#declare Position = PunkteAlt[ticker2];


sphere { <0, 0, 0>, Radius 
hollow
pigment {          // (---surface color---)
  color rgb <1,(Ebenen - ticker)/(Ebenen),0>    // lights color
  }
translate Position}


#if (ticker<Ebenen-1)

#declare RadiusNeu = Radius * Faktor; 
#declare Kreisradius = Radius-RadiusNeu;


#declare var1 = rand (chance1);
#declare var2 = rand (chance2);



#declare P1 =  <0, Kreisradius, 0>;
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker3] = Position + P1;


#declare ticker3 = ticker3 + 1;


#declare ticker1 = 0;

#while (ticker1<5)                         //6

#declare P1 =  <0, Kreisradius, 0>;
#declare P1 = vrotate (P1, <-58.285, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker1 + ticker3] = Position + P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker3 = ticker3 + 5;



#declare ticker1 = 0;

#while (ticker1<5)                         //11

#declare P1 =  <0, Kreisradius, 0>;
#declare P1 = vrotate (P1, <116.57, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker1 + ticker3] = Position + P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker3 = ticker3 + 5;


#declare P1 =  <0, -Kreisradius, 0>;
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker3] = Position + P1;     //12




#declare ticker3 = ticker3 + 1;



#declare ticker1 = 0;

#while (ticker1<5)                         //17

#declare P1 =  <0, Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker1 + ticker3] = Position + P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker3 = ticker3 + 5;



#declare ticker1 = 0;

#while (ticker1<5)                         //22

#declare P1 =  <0, Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <Winkel2, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker1 + ticker3] = Position + P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker3 = ticker3 + 5;




#declare ticker1 = 0;

#while (ticker1<5)                         //27

#declare P1 =  <0, -Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <Winkel2, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker1 + ticker3] = Position + P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker3 = ticker3 + 5;




#declare ticker1 = 0;

#while (ticker1<5)                         //32

#declare P1 =  <0, -Kreisradius, 0>;
#declare P1 = vrotate (P1, <Winkel1, 0, 0>);
#declare P1 = vrotate (P1, <0, 72 * ticker1, 0>);
#declare P1 =  vrotate(P1, <360*var1, 360*var2,0>);
#declare PunkteNeu[ticker1 + ticker3] = Position + P1;
  
   
#declare ticker1 = ticker1 + 1; 

#end  



#declare ticker3 = ticker3 + 5;


#else

#end



#declare ticker2 = ticker2 + 1;  

#end//Ende der Schleife ueber die Ebene


#if (ticker<Ebenen-1)



//Mit dem Ende der Schleife einer Ebene werden die neugeschaffenen Ansatzpunkte zu neuen Startpunkten

#declare zaehlerAlt = ticker3;

#declare PunkteAlt = array[zaehlerAlt];

#declare PunkteAlt = PunkteNeu; 

#declare Radius = RadiusNeu;

#else

#end





#declare ticker = ticker + 1;

#end //Ende der Schleife ueber alle Ebenen   

//rotate <45, 45, 0>
}


box { <0, -10, -10>, <10, 10, 10> 

pigment {          // (---surface color---)
  color rgbt <1,1,0, 1>    // lights color
  }
}



}