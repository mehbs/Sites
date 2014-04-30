#!/usr/bin/perl
use CGI;
use strict;
use cwmodule;
my $cgi = new CGI;
print $cgi->header();
# Obtain parameters Using Search terms and Restriction Sites
my $accession = $cgi->param('accession');
my $string	= $cgi->param('enzyme');
my $StickyEnds= cwmodule::StickyEnds($accession, $string);
print <<__EOF;
<!-- Start html, head file contains the title and the link to the external CSS file -->
<html>
   <head>
      <title>Results page - Restriction Enzyme Cutting Sites</title>
      <link href="http://student.cryst.bbk.ac.uk/~pm001/css/stickyend.css" rel="stylesheet" type="text/css">
   </head>
   <!-- Body of Document -->
   <body>
      <!-- Restriction Enzymes Cutting Sites Section Choose Cutting Site -->
      <section class='restriction'>
         <form action='http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/sticky2.pl'  method='post'>
            <fieldset class='chooseEnzyme'>
               <legend><b>Restriction Enzyme Cutting Sites</b></legend>
               <p >
                  Choose a restriction enzyme:
                  <select name="enzyme">
                     <option value="EcoRI">EcoRI</option>
                     <option value="BamHI">BamHI</option>
                     <option value="BsuMI">BsuMI</option>
                  </select>
               </p>
               <!--Section to write accession number -->
               <p>Type Accession Number:            
                  <input name="accession"/>
               </p>
               <p class='find'><b>Find the sticky-end restriction enzyme sites:</b>
                  <input type="submit" value="Submit" />&nbsp;&nbsp;
                  <input type="reset" value="Clear" />
               </p>
            </fieldset>
            <!-- end fieldset chooseEnzyme -->  
         </form>
      </section>
      <!-- end section restriction -->
      <!--Start of content area for results -->
      <div class='contentDetail'>
         <!--Header for results -->
         <h1>Results</h1>
         <!--Results of Search -->
         <p>The Restriction Enzyme Cutting Sites, with sites highlighted in red, for <b>$accession</b> entry and the restriction enzyme <b>$string</b>:
            $StickyEnds
         </p>
      </div>
      <!-- === end content div ===-->
   </body>
   <!-- End of Document Body  -->
</html>
<!-- End of HTML Document  -->
__EOF
