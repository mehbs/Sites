#!/usr/bin/perl

use CGI;
use cwmodule;
use strict;

my $cgi = new CGI;

my $searchType = $cgi->param('search_type');
my $searchTerm = $cgi->param('input');
my $table = cwmodule::Search($searchType,$searchTerm);

print $cgi->header();
print <<__EOF;
<html>

<head>
<style type='text/css'>
<!--

body {
	color: #151515;
	font-family: "Gill Sans", "Gill Sans MT", "Myriad Pro", "DejaVu Sans Condensed", Helvetica, Arial, sans-serif;
	background-color: #EFF5F8;
}
#wrapper {
	width: 100%;
}
#top {
	color: #1662B1;
	text-align: center;
	font-size: xx-large;

	text-shadow:0px 0px 0 rgb(163,163,165),1px 1px 0 rgb(134,134,136),2px 2px 0 rgb(105,105,107),3px 3px 0 rgb(76,76,78),4px 4px 0 rgb(47,47,49),5px 5px 0 rgb(18,18,20), 6px 6px 0 rgb(-11,-11,-9),7px 7px 6px rgba(0,0,0,0.4),7px 7px 1px rgba(0,0,0,0.5),0px 0px 6px rgba(0,0,0,.2);
}



#mainnav ul,
#mainnav ul li,
#mainnav ul li a {
  padding: 0;
  margin: 0;
  line-height: 1;
  font-family: 'Capriola', sans-serif;
}
#mainnav:before,
#mainnav:after,
#mainnav > ul:before,
#mainnav > ul:after {
  content: '';
  display: table;
}
#mainnav:after,
#mainnav > ul:after {
  clear: both;
}
#mainnav {
  zoom: 1;
  height: 69px;
  background: url(images/bottom-bg.png) repeat-x center bottom;
  border-radius: 2px;
  width: auto;
}
#mainnav ul {
  background: url(images/nav-bg.png) repeat-x 0px 4px;
  height: 69px;
}
#mainnav ul li {
  float: left;
  list-style: none;
}
#mainnav ul li a {
  display: block;
  height: 37px;
  padding: 22px 30px 0;
  margin: 4px 2px 0;
  border-radius: 2px 2px 0 0;
  text-decoration: none;
  font-size: 15px;
  color: white;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.75);
  font-weight: 400;
  opacity: .9;
}
#mainnav ul li:first-child a {
  margin: 4px 2px 0 0;
}
#mainnav ul li a:hover,
#mainnav ul li.active a {
  background: url(images/color.png) center bottom;
  display: block;
  height: 37px;
  margin-top: 0px;
  padding-top: 26px;
  color: #004f7c;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.55);
  opacity: 1;
}
-->
</style>
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
	 $table
</table> 	 
    
 </div>
 <footer><a href="#top">Back to top</a></footer>
</div>
</body>
</html>
__EOF
    


