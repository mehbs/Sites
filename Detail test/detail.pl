#!/usr/bin/perl
use strict;
use CGI;

my $cgi = new CGI;

# Obtain parameters
my $value    = $cgi->param('param');

print $cgi->header();

print <<__EOF;

<html>
<head>
<title>Sequence analysis results</title>
</head>

<body>
<h1>Sequence analysis results</h1>
<p>Data were submitted by: <b>$value</b></p>
</body>
</html>
__EOF
