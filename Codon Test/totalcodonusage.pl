#!/usr/bin/perl
use CGI;
use cwmodule;
use strict;

my $cgi = new CGI;
print $cgi->header();
my $accession = $cgi->param('accession');

my $StickyEnds = cwmodule::StickyEnds($accession);
my $GetDNA = cwmodule::GetDNA($accession);
my $GetAA = cwmodule::GetAA($accession);
my %GetCodonFrequency = cwmodule::GetCodonFrequency($accession);
my %GetGeneCodons = cwmodule::GetGeneCodons($accession);


my $key ="";
my $value ="";
my $codons ="";


print $cgi->header();

print <<__EOF;
<html>

<head>
 

<meta charset="utf-8">
<title>Total Codon Frequency</title>

</head>

<body>
<div id="wrapper">
  <header id="top">
    <h1>Total Codon Frequency</h1>
  </header>
    <nav id="mainnav">
      <ul>
        <li><a href="home.html">Home</a></li>
        <li class='active'><a href="summry.html">Summary</a></li>
        <li class='last'><a href="about.html">About</a></li>
      </ul>
    </nav>
  
  
  <header id="sub">
 <h2>Codon Frequency Results</h2>
  </header>
 <div id="table">
   <table width="100" border="1">
     <tr>
       <th scope="col">Codon</th>
       <th scope="col">Amino Acid</th>
       <th scope="col">Frequency</th>
     </tr>

 
	<tr><td>UUU</td><td>Phe (F)</td><td>$GetCodonFrequency{UUU}</td></tr>
	<tr><td>UUC</td><td>Phe (F)</td><td>$GetCodonFrequency{UUC}</td></tr>
	<tr><td>UUA</td><td>Leu (F)</td><td>$GetCodonFrequency{UUA}</td></tr>
	<tr><td>UUG</td><td>Leu (F)</td><td>$GetCodonFrequency{UUG}</td></tr>
	<tr><td>CUU</td><td>Leu (F)</td><td>$GetCodonFrequency{CUU}</td></tr>
	<tr><td>CUC</td><td>Leu (F)</td><td>$GetCodonFrequency{CUC}</td></tr>
	<tr><td>CUA</td><td>Leu (F)</td><td>$GetCodonFrequency{CUA}</td></tr>
	<tr><td>CUG</td><td>Leu (F)</td><td>$GetCodonFrequency{CUG}</td></tr>
	<tr><td>AUU</td><td>Ile (I)</td><td>$GetCodonFrequency{AUU}</td></tr>
	<tr><td>AUC</td><td>Ile (I)</td><td>$GetCodonFrequency{AUC}</td></tr>
	<tr><td>AUA</td><td>Ile (I)</td><td>$GetCodonFrequency{AUA}</td></tr>
	<tr><td>AUG</td><td>Met (M)</td><td>$GetCodonFrequency{AUG}</td></tr>
	<tr><td>GUU</td><td>Val (V)</td><td>$GetCodonFrequency{GUU}</td></tr>
	<tr><td>GUC</td><td>Val (V)</td><td>$GetCodonFrequency{GUC}</td></tr>
	<tr><td>GUA</td><td>Val (V)</td><td>$GetCodonFrequency{GUA}</td></tr>
	<tr><td>GUG</td><td>Val (V)</td><td>$GetCodonFrequency{GUG}</td></tr>
	<tr><td>UCU</td><td>Ser (S)</td><td>$GetCodonFrequency{UCU}</td></tr>
	<tr><td>UCC</td><td>Ser (S)</td><td>$GetCodonFrequency{UCC}</td></tr>
	<tr><td>UCA</td><td>Ser (S)</td><td>$GetCodonFrequency{UUA}</td></tr>
	<tr><td>UCC</td><td>Ser (S)</td><td>$GetCodonFrequency{UCC}</td></tr>
	<tr><td>UCA</td><td>Ser (S)</td><td>$GetCodonFrequency{UCA}</td></tr>
	<tr><td>UCG</td><td>Ser (S)</td><td>$GetCodonFrequency{UCG}</td></tr>
	<tr><td>CCU</td><td>Pro (P)</td><td>$GetCodonFrequency{CCU}</td></tr>
	<tr><td>CCC</td><td>Pro (P)</td><td>$GetCodonFrequency{CCC}</td></tr>
	<tr><td>CCA</td><td>Pro (P)</td><td>$GetCodonFrequency{CCA}</td></tr>
	<tr><td>CCG</td><td>Pro (P)</td><td>$GetCodonFrequency{CCG}</td></tr>
	<tr><td>ACU</td><td>Thr (T)</td><td>$GetCodonFrequency{ACU}</td></tr>
	<tr><td>ACC</td><td>Thr (T)</td><td>$GetCodonFrequency{ACC}</td></tr>
	<tr><td>ACA</td><td>Thr (T)</td><td>$GetCodonFrequency{ACA}</td></tr>
	<tr><td>ACG</td><td>Thr (T)</td><td>$GetCodonFrequency{ACG}</td></tr>
	<tr><td>GCU</td><td>Ala (A)</td><td>$GetCodonFrequency{GCU}</td></tr>
	<tr><td>GCC</td><td>Ala (A)</td><td>$GetCodonFrequency{GCC}</td></tr>
	<tr><td>GCA</td><td>Ala (A)</td><td>$GetCodonFrequency{GCA}</td></tr>
	<tr><td>GCG</td><td>Ala (A)</td><td>$GetCodonFrequency{GCG}</td></tr>
	<tr><td>UAU</td><td>Tyr (Y)</td><td>$GetCodonFrequency{UAU}</td></tr>
	<tr><td>UAC</td><td>Tyr (Y)</td><td>$GetCodonFrequency{UAC}</td></tr>
	<tr><td>UAA</td><td>STOP</td><td>$GetCodonFrequency{UAA}</td></tr>
	<tr><td>UAG</td><td>STOP</td><td>$GetCodonFrequency{UAG}</td></tr>
	<tr><td>CAU </td><td> His(H)</td><td>$GetCodonFrequency{CAU }</td></tr>
	<tr><td>CAC </td><td> His(H)</td><td>$GetCodonFrequency{CAC }</td></tr>
	<tr><td>CAA </td><td> Gln(G)</td><td>$GetCodonFrequency{CAA }</td></tr>
	<tr><td>CAG </td><td> Gln (G)</td><td>$GetCodonFrequency{CAG }</td></tr>
	<tr><td>AAU </td><td> Asn(A)</td><td>$GetCodonFrequency{AAU }</td></tr>
	<tr><td>AAC </td><td> Asn(A)</td><td>$GetCodonFrequency{AAC }</td></tr>
	<tr><td>AAA </td><td> Lys(L)</td><td>$GetCodonFrequency{AAA }</td></tr>
	<tr><td>AAG </td><td> Lys (L)</td><td>$GetCodonFrequency{AAG }</td></tr>
	<tr><td>GAU </td><td> Asp(A)</td><td>$GetCodonFrequency{GAU }</td></tr>
	<tr><td>GAC </td><td> Asp(A)</td><td>$GetCodonFrequency{GAC }</td></tr>
	<tr><td>GAA </td><td> Glu(G)</td><td>$GetCodonFrequency{GAA }</td></tr>
	<tr><td>GAG </td><td> Glu (G)</td><td>$GetCodonFrequency{GAG }</td></tr>
	<tr><td>UGU </td><td> Cys(C)</td><td>$GetCodonFrequency{UGU }</td></tr>
	<tr><td>UGC </td><td> Cys(C)</td><td>$GetCodonFrequency{UGC }</td></tr>
	<tr><td>UGA </td><td>STOP</td><td>$GetCodonFrequency{UGA }</td></tr>
	<tr><td>UGG </td><td> Trp(T)</td><td>$GetCodonFrequency{UGG }</td></tr>
	<tr><td>CGU </td><td> Arg(A)</td><td>$GetCodonFrequency{CGU }</td></tr>
	<tr><td>CGC </td><td> Arg(A)</td><td>$GetCodonFrequency{CGC }</td></tr>
	<tr><td>CGA </td><td> Arg(A)</td><td>$GetCodonFrequency{CGA }</td></tr>
	<tr><td>CGG </td><td> Arg(A)</td><td>$GetCodonFrequency{CGG }</td></tr>
	<tr><td>AGU </td><td> Ser(S)</td><td>$GetCodonFrequency{AGU }</td></tr>
	<tr><td>AGC </td><td> Ser(S)</td><td>$GetCodonFrequency{AGC }</td></tr>
	<tr><td>AGA </td><td> Arg(A)</td><td>$GetCodonFrequency{AGA }</td></tr>
	<tr><td>AGG </td><td> Arg(A)</td><td>$GetCodonFrequency{AGG }</td></tr>
	<tr><td>GGU </td><td> Gly(G)</td><td>$GetCodonFrequency{GGU }</td></tr>
	<tr><td>GGC </td><td> Gly(G)</td><td>$GetCodonFrequency{GGC }</td></tr>
	<tr><td>GGA </td><td> Gly(G)</td><td>$GetCodonFrequency{GGA }</td></tr>
	<tr><td>GGG </td><td> Gly (G)</td><td>$GetCodonFrequency{GGG }</td></tr>
</table> 	 
    
 </div>
 <footer><a href="#top">Back to top</a></footer>
</div>
</body>
</html>
__EOF


