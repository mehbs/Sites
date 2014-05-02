#!/usr/bin/perl

use CGI;
use cwmodule2;
use strict;

my $cgi = new CGI;

# Obtain parameters

my $searchTerm    = $cgi->param('input');
my $searchType = $cgi->param('searchBy');
					
#need to tell cwmodule what to search by
my $search= cwmodule::Search($searchType, $searchTerm);	#cwmodule::Search takes these two parameters

print $cgi->header();
print <<__EOF;
<html>

<head>
<meta charset="utf-8">
<title>Detail Page</title>
<link href="http://student.cryst.bbk.ac.uk/~pm001/css/mresults.css" rel="stylesheet" type="text/css">
</head>

<body>
  
  <div id="logo">
<img src="http://student.cryst.bbk.ac.uk/~pm001/css/images/DNA.png" width="155" height="125" alt=""/>
</div>
<header id="top">
    <h1>Results Page</h1>
  </header>
  <nav id="mainnav">
    <ul>
      <li><a href="http://student.cryst.bbk.ac.uk/~pm001/mhome.html">Home</a></li>
      <li><a href="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/msummary.pl">Summary</a></li>
      <li><a href="about.html">About</a></li>
      <li class='active'><a href="#">Result</a></li>
      
    
     </ul>
  </nav>
  
  
<header id="sub">
 <h2>Search Results For Term: $searchTerm</h2>
  </header>
 <table width="659" border="1" id="table">
     <tr>
       <th scope="col">Gene Identifiers</th>
       <th scope="col">Protein Product Names</th>
       <th scope="col">Genbank Accession Number</th>
       <th scope="col">Chromosomal Location</th>
     </tr>
    
     $search
              
   </table>
 
 <footer id="footer">
   <p>MSc/MRes Bioinformatics with Systems Biology 2013/2014: Biocomputing II Project</p> 
   
   <a href="#top">Back to top</a>
 </footer>
 
</div>
</body>
</html>

__EOF
    


