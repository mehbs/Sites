#!/usr/bin/perl
#perl test script to run the GetCodonFrequency subroutine which will return the codon frequency for all the sequences in the database
use cwmodule;
use strict;
		
open(my $file, '>', 'totalfrequencytest2.txt');
my %GetCodonFrequency = cwmodule::GetCodonFrequency;

while (my($key, $value) = each %GetCodonFrequency) {
   
	print $file "Codon is $key Frequency = $value\n";

						   } 

close $file;
print "done\n";
 		       
