#!/usr/bin/perl
use CGI;
use cwmodule2;
use strict;

my $cgi = new CGI;


my $accession = $cgi->param('accession');
print $cgi->header();
print <<__EOF

<html>
<head>
<meta charset="utf-8">
<title>Detail Page</title>
<link href="http://student.cryst.bbk.ac.uk/~pm001/css/mdetail.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
 <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
 <script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.js"></script>

</head>

<body>

  <div id="wrapper">

  <div id="logo">
<img src="http://student.cryst.bbk.ac.uk/~pm001/css/images/DNA.png" width="155" height="125" alt=""/>
</div>
  <header id="top">
    <h1>Detail Page</h1>
  </header>
  <nav id="mainnav">
    <ul>
      <li><a rel="external" href="http://student.cryst.bbk.ac.uk/~pm001/mhome.html">Home</a></li>
      <li><a rel="external" href="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/msummary.pl">Summary</a></li>
      <li><a rel="external" href="about.html">About</a></li>
      <li class='active'><a href="#">Detail</a></li>
    
    </ul>
  </nav>
  
  <header id="sub">
    <h2>Results For $accession</h2>
  </header>
  
<iframe id="complete" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/mdna.pl?accession=$accession">
  	 <p>Your browser does not support iframes.</p>
  </iframe>

  <iframe id="amino" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/maa.pl?accession=$accession">
    <p>Your browser does not support iframes.</p>
  </iframe>

  <iframe id="codon" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/mcodon.pl?accession=$accession">
    <p>Your browser does not support iframes.</p>
  </iframe>


<iframe id="sticky" src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/msticky.pl?accession=$accession">
    <p>Your browser does not support iframes.</p>
      </iframe>


  <div id="completefull">
      Complete Sequence
       <a href="#popup1" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup1" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    
  <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/mdna.pl?accession=$accession" seamless height="600" width="1200"></iframe>
  </div>

   <div id="aminofull">
 
      Full Amino Acid Sequence
    <a href="#popup2" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup2" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    
    <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/maa.pl?accession=$accession" seamless height="600" width="1200"></iframe>
  </div>
     
   <div id="codonfull">
      Codon Usage
      <a href="#popup3" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup3" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    
    <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/mcodon.pl?accession=$accession" seamless height="600" width="1200"></iframe>
</div>
     
 <div id="stickyfull">
      Sticky Ends
      <a href="#popup4" data-rel="popup" data-position-to="window" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-up-c  ui-icon ui-icon-plus"></a>
<div data-role="popup" id="popup4" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    <a href="#" data-rel="back" class="ui-btn ui-btn-b ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
    
    <iframe src="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/msticky.pl?accession=$accession" seamless height="600" width="1200"></iframe>
</div>      
    
<footer id="footer">
 
   <a href="#top">Back to top</a>
   
 </footer>

</div>

</body>
</html>

__EOF
