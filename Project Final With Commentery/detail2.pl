#!/usr/bin/perl
use CGI;
use cwmodule;
use strict;

my $cgi = new CGI;
# Obtain accession number from summary table
my $accession = $cgi->param('accession');
print $cgi->header();
print <<__EOF

<html>
<head>
<meta charset="utf-8">
<!-- Start html, head file contains the title and the link to the external CSS file created by me and extrenal CSS file and Java File From jquery Required to allow popup of frames  -->
<title>Detail Page</title>
<link href="http://student.cryst.bbk.ac.uk/~pm001/css/detail2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
 <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
 <script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.js"></script>

</head>


 <!-- Body of Document -->
<body>
 <!-- Wrapper to Contain Document -->
  <div id="wrapper">

  <div id="logo">
<img src="http://student.cryst.bbk.ac.uk/~pm001/css/images/DNA.png" width="155" height="125" alt=""/>
</div>
 <!--  Header -->
  <header id="top">
    <h1>Detail Page</h1>
  </header>
  <!--  Menu Bar -->
  <nav id="navbar">
<ul>
   <li><a rel="external" href='http://student.cryst.bbk.ac.uk/~dm002/homepage.html'>Home</a></li>
   <li><a rel="external" href='http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/summary2.pl'>Summary</a></li>
   <li><a rel="external" href='http://student.cryst.bbk.ac.uk/~dm002/detail.html'>Detail</a></li>
</ul>

   </nav>   <!-- end navbox div  -->

  <!--  Sub Heading -->
  <header id="sub">
    <h2>Results For $accession</h2>
  </header>
  
   <!--  Frame Section Containing Link to Webpage For Complete DNA Sequence to Display on Webpage -->
<iframe id="complete" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/dna2.pl?accession=$accession">
  	 <p>Your browser does not support iframes.</p>
  </iframe>
   <!--  Frame Section Containing Link to Webpage For Complete Amino Acid Sequence with the coding DNA sequence to Display on Webpage  -->
  <iframe id="amino" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/aa2.pl?accession=$accession">
    <p>Your browser does not support iframes.</p>
  </iframe>
<!--  Frame Section Containing Link to Webpage For Codon Usage Frequencies Within The Coding Region to Display on Webpage   -->
  <iframe id="codon" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/codon2.pl?accession=$accession">
    <p>Your browser does not support iframes.</p>
  </iframe>
<!--  Frame Section Containing Link to Webpage To Identify Sticky-End Restriction Enzyme Sites To Codon Usage Frequencies To Display on Webpage   -->

<iframe id="sticky" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/sticky2.pl">
    <p>Your browser does not support iframes.</p>
      </iframe>

 <!--  Section Containing Link to Webpage For Complete DNA Sequence and Ref to Java module To Allow Section To Maximise. Contains Java Code for Max Symbol  -->
  <div id="completefull">
      Complete Sequence
       <a href="#popup1" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup1" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
  <!--  Section Containing Link to Webpage For Complete DNA Sequence For PopUp Frame With the Size Of The Frame To Stated-->  
  <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/dna2.pl?accession=$accession" seamless height="600" width="1200"></iframe>
  </div>
 <!--  Section Containing Link to Webpage For Amino Acid Sequence and Ref to Java module To Allow Section To Maximise. Contains Java Code for Max Symbol  -->
   <div id="aminofull">
 
      Full Amino Acid Sequence
    <a href="#popup2" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup2" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    <!--  Section Containing Link to Webpage Amino Acid Sequence For PopUp Frame With the Size Of The Frame To Stated-->    
    <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/aa2.pl?accession=$accession" seamless height="600" width="1200"></iframe>
  </div>
  <!--  Section Containing Link to Webpage For For Codon Usage Frequencies and Ref to Java module To Allow Section To Maximise. Contains Java Code for Max Symbol  -->    
   <div id="codonfull">
      Codon Usage
      <a href="#popup3" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup3" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
   <!--  Section Containing Link to Webpage For Codon Usage Frequencies For PopUp Frame With the Size Of The Frame To Stated-->     
    <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/codon2.pl?accession=$accession" seamless height="600" width="1200"></iframe>
</div>
  <!--  Section Containing Link to Webpage For Sticky End and Ref to Java module To Allow Section To Maximise. Contains Java Code for Max Symbol  -->  
 <div id="stickyfull">
      Sticky Ends
      <a href="#popup4" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup4" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    <!--  Section Containing Link to Webpage For Sticky End For PopUp Frame With the Size Of The Frame To Stated-->    
    <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/sticky2.pl" seamless height="600" width="1200"></iframe>
</div>      
    
<!-- Footer Section --> 
<footer id="footer">
 
   <a href="#top">Back to top</a>
   
 </footer><!-- end footer div -->

</div><!-- end page wrapper div -->

</body><!-- end page body div -->
</html><!-- end page html div -->

__EOF
