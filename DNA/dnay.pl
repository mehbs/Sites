

#!/usr/bin/perl
use CGI;
use cwmodule;
use strict;
#Create new cgi Script
my $cgi = new CGI;
# Set Parameters to retrieve the Codon Frequency for the gene and the total number of frequency all genes 
my $cgi = new CGI;
print $cgi->header();
# Obtain parameters from link on summary page
my $accession = $cgi->param('accession');
# Calls the GetDNA routine from cwmodule and assigns it to variable 					
my $GetDNA= cwmodule::GetDNA($accession);
print <<__EOF;
<!-- Start html, head file contains the title and the link to the external CSS file -->
<html>
   <html>
      <head>
         <title>Results page - DNA sequence</title>
         <link href="http://student.cryst.bbk.ac.uk/~pm001/css/dna.css" rel="stylesheet" type="text/css">
      </head>
      <body>
         <!--Wrapper for the DNA sequence-->
         <div class='contentDetail'>
            <!--Header For DNA-->
            <h1>Results For DNA sequence</h1>
            <!--Displaying of the retrive DNA Seqeunce-->
            <p>The complete DNA sequence for <b>$accession</b> entry with coding regions highlighted in red (scroll across to see coding region in sequence): $GetDNA</p>
         </div>
         <!-- === end content div ===-->
      </body>
   </html>
   __EOF

