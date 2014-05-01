#!/usr/bin/perl
#perl test script to run the GetGeneCodons subroutine which will return the codon frequency for the 9 randome accession numbers chosen 
use cwmodule;
use strict;

open(my $file, '>', 'aatest.txt');
my $GetAA  = "";
my $accession = "";
my @accession = (
        "AB007182",
	"AF193507",
	"AF195044",
	"AF195849",
	"AF411113",
	"AB182982",
	"AY734234",
	"DQ864727",
	"EU170542");

foreach (@accession) {
           
	$accession = $_;
		


$GetAA = cwmodule::GetAA($accession);


   print $file "For $accession Amino Acid and Coding Protein $GetAA \n";

						   
 		       }

close $file;
print "done\n";
