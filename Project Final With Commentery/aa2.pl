#!/usr/bin/perl
use CGI;
use cwmodule;
use strict;
my $cgi = new CGI;
my $accession = $cgi->param('accession');
my $GetAA = cwmodule::GetAA($accession);
print $cgi->header();
print <<__EOF;
<html>
   <!-- Start Header HTML head file contains the title and the link to the external CSS file -->
   <head>
      <meta charset="utf-8">
      <title>Amino Acid Sequence</title>
      <link href="http://student.cryst.bbk.ac.uk/~pm001/css/aa2.css" rel="stylesheet" type="text/css">
   </head>
   <!-- Body to contain web page -->
   <body>
      <!-- Top Header wrapper-->
      <header id="top">
         <!-- Heading -->
         <h1>Amino Acid Sequence & Coding DNA Sequence </h1>
      </header>
      <!-- Wrapper for Article -->
      <article id="Script">
         <!-- Title for Article -->
         <p1> Protein Sequence </p1>
         <!-- Variable to retrieve the code using middle layer -->
         <p>$GetAA</p>
      </article>
   </body>
__EOF


