// Persistence of Vision Ray Tracer Scene Description File

#version 3.6; // current version is 3.8

/* 
Information on Pov-Ray:
 
My personal introduction into Pov-Ray was the excellent book "3D-Welten, professionelle Animationen und fotorealistische Grafiken mit Raytracing" from 
Toni Lama by Carl Hanser Verlag München Wien, 2004. Apart of that I recommend the Pov-Ray-homepage (http://www.povray.org).

Further information on Pov-Ray can be found at https://sus.ziti.uni-heidelberg.de/Lehre/WS2021_Tools/POVRAY/POVRAY_PeterFischer.pdf,  
https://wiki.povray.org/content/Main_Page, https://de.wikibooks.org/wiki/Raytracing_mit_POV-Ray or, in german language, here: https://www.f-lohmueller.de/pov_tut/pov__ger.htm

//-----------------------------------Approach----------------------------------------------------------------------------
This fractal has been produced by a so-called L-system (Lindenmayer-System). The initial string "F-F-F-F" is changed by replacing each "F" by "F-F+F+FF-F-F+F". 
This transformation is done twice by a Perl-program ("01DeriveAlgoFraktal1.pl"), to arrive at the final string which is stored as "01AlgorithmFraktal1".

The symbols in these strings represent geometric operations: "F" = "go ahead by a certain distance", "-" = "turn left", "+" = "turn right".

The final string, produced by the production steps, is transformed into a PovRay - script by another Perl-program; "01ConvertForPovFractal1.pl" The output from
this program is then copied into the script below and produces a planar fractal when executed.   


*/
 
//-----------------------------------Scene settings (Camera, light, background)-------------------------------------------------


global_settings {
	assumed_gamma 1.0
	max_trace_level 25
	// radiosity {}
}

background { 
    color rgb <1, 1, 1> 
}


#declare Kamera2 = camera {
    location  <0, 5, -40>
    //direction 1.5*z
    rotate <0, 5, 0>
    right     x*image_width/image_height
    look_at   <0.0, 5,  0.0>
}


camera {Kamera2}




light_source {
    <0, 0, 0>            // light's position (translated below)
    color rgb <1, 1, 1>  // light's color
    translate <-30, 30, 0>
} 

light_source {
    <0, 0, 0>            // light's position (translated below)
    color rgb <1, 1, 1>  // light's color
    translate <0.8, -0.3, -0.8>
}  

//-----------------------------------------------input from the Perl-script--------------------------------------------------


#declare Objekt = cylinder { <0, 0, 0>, <0, 1, 0>, 0.05}
#declare Winkel = 0;
#declare P1 = <0, 0, 0>; 
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, -90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
#declare Winkel = Winkel + <0, 0, 90>;
object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
