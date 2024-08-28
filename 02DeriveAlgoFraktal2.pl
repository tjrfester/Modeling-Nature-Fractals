#!/usr/local/bin/perl -w

use strict;

open(OUTPUT,"> LAlgo.txt")
  or die "Fehler beim Öffnen von 'Fraktal2.txt': $!\n";

my $starter = "-F";

my $replaceF = "F+F-F-F+F";



my $repeat = 4;

my $ticker = 0;

my $tickerb = 0;



while ($ticker < $repeat) {


my @fraktal = split(//,$starter);

#my $arbeitsstring = $replaceF ;

my $laenge = @fraktal;

while ($tickerb<$laenge) {

if ($fraktal[$tickerb] =~ m/F/)
{

$fraktal[$tickerb] = $replaceF;

}

else 

{}

$starter = join ('', @fraktal);





$tickerb = $tickerb + 1;

}

$tickerb = 0;


$ticker = $ticker + 1;

}

print OUTPUT $starter;


close(OUTPUT);








