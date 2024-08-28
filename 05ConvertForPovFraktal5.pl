#!/usr/local/bin/perl -w

use strict;

open(OUTPUT,"> ForPov.txt")
  or die "Fehler beim Öffnen von 'Fraktal3.txt': $!\n";

my $rw = open(INPUT,"LAlgo.txt");
if(not defined($rw)) {
    die "Fehler beim Öffnen der Datei: $!\n";
}


my $replaceF = "object {Objekt
rotate Winkel
translate P1
}
#declare PObjekt = <0, 1, 0>;
#declare PObjekt = vrotate (PObjekt, Winkel);
#declare P1 = P1 + PObjekt;
";

my $replaceMinus = "#declare Winkel = Winkel + <0, 0, -90>;
";

my $replacePlus = "#declare Winkel = Winkel + <0, 0, 90>;
";

while(defined(my $i = <INPUT>)) { 

my $tickerb = 0;




my @fraktal = split(//,$i);

my $laenge = @fraktal;

while ($tickerb<$laenge) {

if ($fraktal[$tickerb] =~ m/F/)
{

$fraktal[$tickerb] = $replaceF;

}

elsif ($fraktal[$tickerb] =~ m/\-/)
{

$fraktal[$tickerb] = $replaceMinus;

}

elsif  ($fraktal[$tickerb] =~ m/\+/)


{

$fraktal[$tickerb] = $replacePlus;

}

else

{}




$tickerb = $tickerb + 1;

}


my $output= join ('', @fraktal);


print OUTPUT '//Kamera aus der z-Richtung
#declare Objekt = cylinder { <0, 0, 0>, <0, 1, 0>, 0.25}
#declare Winkel = 0;
#declare P1 = <0, 0, 0>; 
';
print OUTPUT $output;
}


close(OUTPUT);








