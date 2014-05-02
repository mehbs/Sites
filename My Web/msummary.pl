#!/usr/bin/perl

use CGI;
use cwmodule2;
use strict;

my $cgi = new CGI;

my $table = cwmodule::GetSummary;

print $cgi->header();
print <<__EOF;
<html>

<head>
<meta charset="utf-8">
<title>Summary Page</title>
<link href="http://student.cryst.bbk.ac.uk/~pm001/css/msummary.css" rel="stylesheet" type="text/css">
</head>

<body>
  
  <div id="logo">
<img src="http://student.cryst.bbk.ac.uk/~pm001/css/images/DNA.png" width="155" height="125" alt=""/>
</div>
   <header id="top">
    <h1>Summary Page</h1>
  </header>
  <nav id="mainnav">
    <ul>
      <li><a href="http://student.cryst.bbk.ac.uk/~pm001/mhome.html">Home</a></li>
      <li class='active'><a href="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/msummary.pl">Summary</a></li>
      <li><a href="about.html">About</a></li>
      
    
     </ul>
  </nav>
  
  
  <header id="sub">
 <h2>Protein Summary Results</h2>
  </header>
 <table width="659" border="1" id="table">
     <tr>
       <th scope="col">Gene Identifiers</th>
       <th scope="col">Protein Product Names</th>
       <th scope="col">Genbank Accession Number</th>
       <th scope="col">Chromosomal Location</th>
     </tr>
    
    $table
         
   </table>
 
 <footer id="footer">
 <p>MSc/MRes Bioinformatics with Systems Biology 2013/2014: Biocomputing II Project</p> 
   
   <a href="#top">Back to top</a>
 </footer>


</body>
</html>
__EOF
    


