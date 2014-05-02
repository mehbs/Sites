#!/usr/bin/perl

use cwmodule;
use strict;


my $results = cwmodule::GetSummary;
open(my $file, '>', 'summarytest2.txt');
print $file "$results\n";

close $file;
print "done\n";
