#!/usr/bin/perl
use CGI;
use cwmodule;
use strict;
#Create new cgi Script
my $cgi = new CGI;
# Set Parameters to retrieve the Codon Frequency for the gene and the Total Codon Frequency For All Genes 
my $accession = $cgi->param('accession');
my %GetGeneCodons = cwmodule::GetGeneCodons($accession);
my %GetCodonFrequency = cwmodule::GetCodonFrequency($accession);
#Print CGI Header
print $cgi->header();
print <<__EOF;
<!-- Start html, head file contains the title and the link to the external CSS file -->
<html>
   <head>
      <meta charset="utf-8">
      <title>Total Codon Frequency</title>
      <link href="http://student.cryst.bbk.ac.uk/~pm001/css/codon2.css" rel="stylesheet" type="text/css">
   </head>
   <!-- Body of Document -->
   <body>
      <header id="Heading">
         <!-- Main Header -->
         <h2>Codon Frequency Results</h2>
      </header>
      <!-- Start of Table 1  -->
      <div id="tablesection1">
         <!-- Table 1 With Headings Codon, AA, Total Frequency All, Frequency For accession number   -->
         <table width="100" border="1">
            <tr>
               <th scope="col">Codon</th>
               <th scope="col">Amino Acid (%)</th>
               <th scope="col">Total Frequency (%)</th>
               <th scope="col">Frequency For $accession</th>
            </tr>
            <tr>
               <td>UUU</td>
               <td>Phe (F)</td>
               <td>$GetCodonFrequency{UUU}</td>
               <td>$GetGeneCodons{UUU}</td>
            </tr>
            <tr>
               <td>UUC</td>
               <td>Phe (F)</td>
               <td>$GetCodonFrequency{UUC}</td>
               <td>$GetGeneCodons{UUC}</td>
            </tr>
            <tr>
               <td>UUA</td>
               <td>Leu (F)</td>
               <td>$GetCodonFrequency{UUA}</td>
               <td>$GetGeneCodons{UUA}</td>
            </tr>
            <tr>
               <td>UUG</td>
               <td>Leu (F)</td>
               <td>$GetCodonFrequency{UUG}</td>
               <td>$GetGeneCodons{UUG}</td>
            </tr>
            <tr>
               <td>CUU</td>
               <td>Leu (F)</td>
               <td>$GetCodonFrequency{CUU}</td>
               <td>$GetGeneCodons{CUU}</td>
            </tr>
            <tr>
               <td>CUC</td>
               <td>Leu (F)</td>
               <td>$GetCodonFrequency{CUC}</td>
               <td>$GetGeneCodons{CUC}</td>
            </tr>
            <tr>
               <td>CUA</td>
               <td>Leu (F)</td>
               <td>$GetCodonFrequency{CUA}</td>
               <td>$GetGeneCodons{CUA}</td>
            </tr>
            <tr>
               <td>CUG</td>
               <td>Leu (F)</td>
               <td>$GetCodonFrequency{CUG}</td>
               <td>$GetGeneCodons{CUG}</td>
            </tr>
            <tr>
               <td>AUU</td>
               <td>Ile (I)</td>
               <td>$GetCodonFrequency{AUU}</td>
               <td>$GetGeneCodons{AUU}</td>
            </tr>
            <tr>
               <td>AUC</td>
               <td>Ile (I)</td>
               <td>$GetCodonFrequency{AUC}</td>
               <td>$GetGeneCodons{AUC}</td>
            </tr>
            <tr>
               <td>AUA</td>
               <td>Ile (I)</td>
               <td>$GetCodonFrequency{AUA}</td>
               <td>$GetGeneCodons{AUA}</td>
            </tr>
            <tr>
               <td>AUG</td>
               <td>Met (M)</td>
               <td>$GetCodonFrequency{AUG}</td>
               <td>$GetGeneCodons{AUG}</td>
            </tr>
            <tr>
               <td>GUU</td>
               <td>Val (V)</td>
               <td>$GetCodonFrequency{GUU}</td>
               <td>$GetGeneCodons{GUU}</td>
            </tr>
            <tr>
               <td>GUC</td>
               <td>Val (V)</td>
               <td>$GetCodonFrequency{GUC}</td>
               <td>$GetGeneCodons{GUC}</td>
            </tr>
            <tr>
               <td>GUA</td>
               <td>Val (V)</td>
               <td>$GetCodonFrequency{GUA}</td>
               <td>$GetGeneCodons{GUA}</td>
            </tr>
            <tr>
               <td>GUG</td>
               <td>Val (V)</td>
               <td>$GetCodonFrequency{GUG}</td>
               <td>$GetGeneCodons{GUG}</td>
            </tr>
            <tr>
               <td>UCU</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{UCU}</td>
               <td>$GetGeneCodons{UCU}</td>
            </tr>
            <tr>
               <td>UCC</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{UCC}</td>
               <td>$GetGeneCodons{UCC}</td>
            </tr>
            <tr>
               <td>UCA</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{UUA}</td>
               <td>$GetGeneCodons{UUA}</td>
            </tr>
            <tr>
               <td>UCC</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{UCC}</td>
               <td>$GetGeneCodons{UCC}</td>
            </tr>
            <tr>
               <td>UCA</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{UCA}</td>
               <td>$GetGeneCodons{UCA}</td>
            </tr>
            <tr>
               <td>UCG</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{UCG}</td>
               <td>$GetGeneCodons{UCG}</td>
            </tr>
            <tr>
               <td>CCU</td>
               <td>Pro (P)</td>
               <td>$GetCodonFrequency{CCU}</td>
               <td>$GetGeneCodons{CCU}</td>
            </tr>
            <tr>
               <td>CCC</td>
               <td>Pro (P)</td>
               <td>$GetCodonFrequency{CCC}</td>
               <td>$GetGeneCodons{CCC}</td>
            </tr>
            <tr>
               <td>CCA</td>
               <td>Pro (P)</td>
               <td>$GetCodonFrequency{CCA}</td>
               <td>$GetGeneCodons{CCA}</td>
            </tr>
            <tr>
               <td>CCG</td>
               <td>Pro (P)</td>
               <td>$GetCodonFrequency{CCG}</td>
               <td>$GetGeneCodons{CCG}</td>
            </tr>
            <tr>
               <td>ACU</td>
               <td>Thr (T)</td>
               <td>$GetCodonFrequency{ACU}</td>
               <td>$GetGeneCodons{ACU}</td>
            </tr>
            <tr>
               <td>ACC</td>
               <td>Thr (T)</td>
               <td>$GetCodonFrequency{ACC}</td>
               <td>$GetGeneCodons{ACC}</td>
            </tr>
            <tr>
               <td>ACA</td>
               <td>Thr (T)</td>
               <td>$GetCodonFrequency{ACA}</td>
               <td>$GetGeneCodons{ACA}</td>
            </tr>
            <tr>
               <td>ACG</td>
               <td>Thr (T)</td>
               <td>$GetCodonFrequency{ACG}</td>
               <td>$GetGeneCodons{ACG}</td>
            </tr>
            <tr>
               <td>GCU</td>
               <td>Ala (A)</td>
               <td>$GetCodonFrequency{GCU}</td>
               <td>$GetGeneCodons{GCU}</td>
            </tr>
            <tr>
               <td>GCC</td>
               <td>Ala (A)</td>
               <td>$GetCodonFrequency{GCC}</td>
               <td>$GetGeneCodons{GCC}</td>
            </tr>
            <tr>
               <td>GCA</td>
               <td>Ala (A)</td>
               <td>$GetCodonFrequency{GCA}</td>
               <td>$GetGeneCodons{GCA}</td>
            </tr>
            <tr>
               <td>GCG</td>
               <td>Ala (A)</td>
               <td>$GetCodonFrequency{GCG}</td>
               <td>$GetGeneCodons{GCG}</td>
            </tr>
         </table>
      </div>
      <!-- End of Table 1  -->
      <!-- Table 2 With Colour and Headings for Codon, AA, Total Frequency All, Frequency For accession number  -->
      <div id="tablesection2">
         <table width="100" border="1">
            <tr>
               <th scope="col">Codon</th>
               <th scope="col">Amino Acid (%)</th>
               <th scope="col">Total Frequency (%)</th>
               <th scope="col">Frequency For $accession</th>
            </tr>
            <tr>
               <td>UAU</td>
               <td>Tyr (Y)</td>
               <td>$GetCodonFrequency{UAU}</td>
               <td>$GetGeneCodons{UAU}</td>
            </tr>
            <tr>
               <td>UAC</td>
               <td>Tyr (Y)</td>
               <td>$GetCodonFrequency{UAC}</td>
               <td>$GetGeneCodons{UAC}</td>
            </tr>
            <tr>
               <td>UAA</td>
               <td>STOP</td>
               <td>$GetCodonFrequency{UAA}</td>
               <td>$GetGeneCodons{UAA}</td>
            </tr>
            <tr>
               <td>UAG</td>
               <td>STOP</td>
               <td>$GetCodonFrequency{UAG}</td>
               <td>$GetGeneCodons{UAG}</td>
            </tr>
            <tr>
               <td>CAU</td>
               <td>His (H)</td>
               <td>$GetCodonFrequency{CAU}</td>
               <td>$GetGeneCodons{CAU}</td>
            </tr>
            <tr>
               <td>CAC</td>
               <td>His (H)</td>
               <td>$GetCodonFrequency{CAC}</td>
               <td>$GetGeneCodons{CAC}</td>
            </tr>
            <tr>
               <td>CAA</td>
               <td>Gln (G)</td>
               <td>$GetCodonFrequency{CAA}</td>
               <td>$GetGeneCodons{CAA}</td>
            </tr>
            <tr>
               <td>CAG</td>
               <td>Gln (G)</td>
               <td>$GetCodonFrequency{CAG}</td>
               <td>$GetGeneCodons{CAG}</td>
            </tr>
            <tr>
               <td>AAU</td>
               <td>Asn (A)</td>
               <td>$GetCodonFrequency{AAU}</td>
               <td>$GetGeneCodons{AAU}</td>
            </tr>
            <tr>
               <td>AAC</td>
               <td>Asn (A)</td>
               <td>$GetCodonFrequency{AAC}</td>
               <td>$GetGeneCodons{AAC}</td>
            </tr>
            <tr>
               <td>AAA</td>
               <td>Lys (L)</td>
               <td>$GetCodonFrequency{AAA}</td>
               <td>$GetGeneCodons{AAA}</td>
            </tr>
            <tr>
               <td>AAG</td>
               <td>Lys (L)</td>
               <td>$GetCodonFrequency{AAG}</td>
               <td>$GetGeneCodons{AAG}</td>
            </tr>
            <tr>
               <td>GAU</td>
               <td>Asp (A)</td>
               <td>$GetCodonFrequency{GAU}</td>
               <td>$GetGeneCodons{GAU}</td>
            </tr>
            <tr>
               <td>GAC</td>
               <td>Asp (A)</td>
               <td>$GetCodonFrequency{GAC}</td>
               <td>$GetGeneCodons{GAC}</td>
            </tr>
            <tr>
               <td>GAA</td>
               <td>Glu (G)</td>
               <td>$GetCodonFrequency{GAA}</td>
               <td>$GetGeneCodons{GAA}</td>
            </tr>
            <tr>
               <td>GAG</td>
               <td>Glu (G)</td>
               <td>$GetCodonFrequency{GAG}</td>
               <td>$GetGeneCodons{GAG}</td>
            </tr>
            <tr>
               <td>UGU</td>
               <td>Cys (C)</td>
               <td>$GetCodonFrequency{UGU}</td>
               <td>$GetGeneCodons{UGU}</td>
            </tr>
            <tr>
               <td>UGC</td>
               <td>Cys (C)</td>
               <td>$GetCodonFrequency{UGC}</td>
               <td>$GetGeneCodons{UGC}</td>
            </tr>
            <tr>
               <td>UGA</td>
               <td>STOP</td>
               <td>$GetCodonFrequency{UGA}</td>
               <td>$GetGeneCodons{UGA}</td>
            </tr>
            <tr>
               <td>UGG</td>
               <td>Trp (T)</td>
               <td>$GetCodonFrequency{UGG}</td>
               <td>$GetGeneCodons{UGG}</td>
            </tr>
            <tr>
               <td>CGU</td>
               <td>Arg (A)</td>
               <td>$GetCodonFrequency{CGU}</td>
               <td>$GetGeneCodons{CGU}</td>
            </tr>
            <tr>
               <td>CGC</td>
               <td>Arg (A)</td>
               <td>$GetCodonFrequency{CGC}</td>
               <td>$GetGeneCodons{CGC}</td>
            </tr>
            <tr>
               <td>CGA</td>
               <td>Arg (A)</td>
               <td>$GetCodonFrequency{CGA}</td>
               <td>$GetGeneCodons{CGA}</td>
            </tr>
            <tr>
               <td>CGG</td>
               <td>Arg (A)</td>
               <td>$GetCodonFrequency{CGG}</td>
               <td>$GetGeneCodons{CGG}</td>
            </tr>
            <tr>
               <td>AGU</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{AGU}</td>
               <td>$GetGeneCodons{AGU}</td>
            </tr>
            <tr>
               <td>AGC</td>
               <td>Ser (S)</td>
               <td>$GetCodonFrequency{AGC}</td>
               <td>$GetGeneCodons{AGC}</td>
            </tr>
            <tr>
               <td>AGA</td>
               <td>Arg (A)</td>
               <td>$GetCodonFrequency{AGA}</td>
               <td>$GetGeneCodons{AGA}</td>
            </tr>
            <tr>
               <td>AGG</td>
               <td>Arg (A)</td>
               <td>$GetCodonFrequency{AGG}</td>
               <td>$GetGeneCodons{AGG}</td>
            </tr>
            <tr>
               <td>GGU</td>
               <td>Gly (G)</td>
               <td>$GetCodonFrequency{GGU}</td>
               <td>$GetGeneCodons{GGU}</td>
            </tr>
            <tr>
               <td>GGC</td>
               <td>Gly (G)</td>
               <td>$GetCodonFrequency{GGC}</td>
               <td>$GetGeneCodons{GGC}</td>
            </tr>
            <tr>
               <td>GGA</td>
               <td>Gly (G)</td>
               <td>$GetCodonFrequency{GGA}</td>
               <td>$GetGeneCodons{GGA}</td>
            </tr>
            <tr>
               <td>GGG</td>
               <td>Gly (G)</td>
               <td>$GetCodonFrequency{GGG}</td>
               <td>$GetGeneCodons{GGG}</td>
            </tr>
         </table>
      </div>
      <!-- End of Table 2  -->	 
   </body>
   <!-- End of Document Body  -->
</html>
<!-- End of HTML Document  -->
__EOF

