#!/usr/bin/perl
use strict;
use CGI;
my $cgi = new CGI;

   

print $cgi->header();

print <<__EOF;

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Summary</title>
<link href="http://student.cryst.bbk.ac.uk/~pm001/css/Summary.css" rel="stylesheet" type="text/css">





</head>

<body>
<div id="wrapper">
  <header id="top">
    <h1>Protein 3 Summary</h1>
  </header>
    <nav id="mainnav">
      <ul>
        <li><a href="home.html">Home</a></li>
        <li class='active'><a href="summry.html">Summary</a></li>
        <li class='last'><a href="about.html">About</a></li>
      </ul>
    </nav>
  
  
  <header id="sub">
 <h2>Protein Summary Results</h2>
  </header>
 <div id="table">
   <table width="659" border="1">
     <tr>
       <th scope="col">Genbank Accession Number</th>
       <th scope="col">Protein Product Names</th>
       <th scope="col">Gene Identifiers</th>
       <th scope="col">Chromosomal Location</th>
     </tr>
     <tr>
       <td><a href="http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/test1.pl?param=value">Query</a></td>

       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
     </tr>
         
   </table>
 </div>
 <footer><a href="#top">Back to top</a></footer>
</div>
</body>
</html>


__EOF
 
