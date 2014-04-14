#!/usr/bin/perl
use strict;
use CGI;
my $cgi = new CGI;

my $dbname = "biodb";
my $dbhost = "fortuna";
my $dbsource = "dbi:mysql:database=$dbname;host=$dbhost";
my $username = "biodb_user";
my $password = "biodb_p";

my $sql = "select pdb_code, resolution, name, date from protein";

use DBI;
my $dbh = DBI->connect($dbsource, $username, $password);
if($dbh)
{
    my $sth = $dbh->prepare($sql);
    if($sth->execute)
    {
        

print $cgi->header();
print <<__EOF;
<html>

<head>
<link rel="stylesheet" href="Summary.css" type="text/css" media="screen" />

<meta charset="utf-8">
<title>Summary</title>

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
	 
__EOF

        while((my $pdb, my $resol, my $date, my $name) = $sth->fetchrow_array)
        {
            print <<__EOF;
<tr><td><a href="#top">$pdb</a></td><td>$resol</td><td>$date</td><td>$name</td></tr>
__EOF
        }
            print <<__EOF;
</table> 	 
 </div>
 <footer><a href="#top">Back to top</a></footer>
</div>
</body>
</html>
__EOF
    }
}

