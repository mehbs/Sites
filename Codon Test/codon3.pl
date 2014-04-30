#!/usr/bin/perl
use CGI;
use cwmodule;
use strict;
# Set Paramaters to retrive the Codon Frequency for the gene and the total number of frequency all genes  
my $cgi = new CGI;
my $accession = $cgi->param('accession');
my %GetGeneCodons = cwmodule::GetGeneCodons($accession);
my %GetCodonFrequency = cwmodule::GetCodonFrequency($accession);
print $cgi->header();
print <<__EOF;
<html>
   <!-- Start Header HTML head file contains the title and the link to the external CSS file -->
   <head>
      <meta charset="utf-8">
      <title>Total Codon Frequency</title>
      <link href="http://student.cryst.bbk.ac.uk/~pm001/css/codon.css" rel="stylesheet" type="text/css">
   </head>
   <!-- Body of Document -->
   <body>
      <header>
         <!-- Main Header -->
         <h2>Codon Frequency Results</h2>
      </header>
      <!-- Start of Table 1  -->
      <div id="tablesection1">
         <!-- Table 1 With Colour, Codon, AA, Total Frequency All, Frequency For accession number   -->
         <table width="100" border="1">
            <tr>
               <th scope="col">Codon</th>
               <th scope="col">Amino Acid</th>
               <th scope="col">Total Frequency (%)</th>
               <th scope="col">Frequency For $accession (%)</th>
            </tr>
            <tr bgcolor="#FF6666">
               <td>UUU</td>
               <td>Phe(F)</td>
               <td>$GetCodonFrequency{UUU}</td>
               <td>$GetGeneCodons{UUU}</td>
            </tr>
            <tr bgcolor="#FF6666">
               <td>UUC</td>
               <td>Phe(F)</td>
               <td>$GetCodonFrequency{UUC}</td>
               <td>$GetGeneCodons{UUC}</td>
            </tr>
            <tr bgcolor="#FFFF66">
               <td>UUA</td>
               <td>Leu(F)</td>
               <td>$GetCodonFrequency{UUA}</td>
               <td>$GetGeneCodons{UUA}</td>
            </tr>
            <tr bgcolor="#FFFF66">
               <td>UUG</td>
               <td>Leu(F)</td>
               <td>$GetCodonFrequency{UUG}</td>
               <td>$GetGeneCodons{UUG}</td>
            </tr>
            <tr bgcolor="#FFFF66">
               <td>CUU</td>
               <td>Leu(F)</td>
               <td>$GetCodonFrequency{CUU}</td>
               <td>$GetGeneCodons{CUU}</td>
            </tr>
            <tr bgcolor="#FFFF66">
               <td>CUC</td>
               <td>Leu(F)</td>
               <td>$GetCodonFrequency{CUC}</td>
               <td>$GetGeneCodons{CUC}</td>
            </tr>
            <tr bgcolor="#FFFF66">
               <td>CUA</td>
               <td>Leu(F)</td>
               <td>$GetCodonFrequency{CUA}</td>
               <td>$GetGeneCodons{CUA}</td>
            </tr>
            <tr bgcolor="#FFFF66">
               <td>CUG</td>
               <td>Leu(F)</td>
               <td>$GetCodonFrequency{CUG}</td>
               <td>$GetGeneCodons{CUG}</td>
            </tr>
            <tr bgcolor="#CCFF99">
               <td>AUU</td>
               <td>Ile(I)</td>
               <td>$GetCodonFrequency{AUU}</td>
               <td>$GetGeneCodons{AUU}</td>
            </tr>
            <tr bgcolor="#CCFF99">
               <td>AUC</td>
               <td>Ile(I)</td>
               <td>$GetCodonFrequency{AUC}</td>
               <td>$GetGeneCodons{AUC}</td>
            </tr>
            <tr bgcolor="#CCFF99">
               <td>AUA</td>
               <td>Ile(I)</td>
               <td>$GetCodonFrequency{AUA}</td>
               <td>$GetGeneCodons{AUA}</td>
            </tr>
            <tr bgcolor="#FFCCCC">
               <td>AUG</td>
               <td>Met(M)</td>
               <td>$GetCodonFrequency{AUG}</td>
               <td>$GetGeneCodons{AUG}</td>
            </tr>
            <tr bgcolor="#CC99FF">
               <td>GUU</td>
               <td>Val(V)</td>
               <td>$GetCodonFrequency{GUU}</td>
               <td>$GetGeneCodons{GUU}</td>
            </tr>
            <tr bgcolor="#CC99FF">
               <td>GUC</td>
               <td>Val(V)</td>
               <td>$GetCodonFrequency{GUC}</td>
               <td>$GetGeneCodons{GUC}</td>
            </tr>
            <tr bgcolor="#CC99FF">
               <td>GUA</td>
               <td>Val(V)</td>
               <td>$GetCodonFrequency{GUA}</td>
               <td>$GetGeneCodons{GUA}</td>
            </tr>
            <tr bgcolor="#CC99FF">
               <td>GUG</td>
               <td>Val(V)</td>
               <td>$GetCodonFrequency{GUG}</td>
               <td>$GetGeneCodons{GUG}</td>
            </tr>
            <tr bgcolor="#66CCFF">
               <td>UCU</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{UCU}</td>
               <td>$GetGeneCodons{UCU}</td>
            </tr>
            <tr bgcolor="#66CCFF">
               <td>UCC</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{UCC}</td>
               <td>$GetGeneCodons{UCC}</td>
            </tr>
            <tr bgcolor="#66CCFF">
               <td>UUA</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{UUA}</td>
               <td>$GetGeneCodons{UUA}</td>
            </tr>
            <tr bgcolor="#66CCFF">
               <td>UCC</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{UCC}</td>
               <td>$GetGeneCodons{UCC}</td>
            </tr>
            <tr bgcolor="#66CCFF">
               <td>UCA</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{UCA}</td>
               <td>$GetGeneCodons{UCA}</td>
            </tr>
            <tr bgcolor="#66CCFF">
               <td>UCG</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{UCG}</td>
               <td>$GetGeneCodons{UCG}</td>
            </tr>
            <tr bgcolor="#FF99FF">
               <td>CCU</td>
               <td>Pro(P)</td>
               <td>$GetCodonFrequency{CCU}</td>
               <td>$GetGeneCodons{CCU}</td>
            </tr>
            <tr bgcolor="#FF99FF">
               <td>CCC</td>
               <td>Pro(P)</td>
               <td>$GetCodonFrequency{CCC}</td>
               <td>$GetGeneCodons{CCC}</td>
            </tr>
            <tr bgcolor="#FF99FF">
               <td>CCA</td>
               <td>Pro(P)</td>
               <td>$GetCodonFrequency{CCA}</td>
               <td>$GetGeneCodons{CCA}</td>
            </tr>
            <tr bgcolor="#FF99FF">
               <td>CCG</td>
               <td>Pro(P)</td>
               <td>$GetCodonFrequency{CCG}</td>
               <td>$GetGeneCodons{CCG}</td>
            </tr>
            <tr bgcolor="#CCFF66">
               <td>ACU</td>
               <td>Thr(T)</td>
               <td>$GetCodonFrequency{ACU}</td>
               <td>$GetGeneCodons{ACU}</td>
            </tr>
            <tr bgcolor="#CCFF67">
               <td>ACC</td>
               <td>Thr(T)</td>
               <td>$GetCodonFrequency{ACC}</td>
               <td>$GetGeneCodons{ACC}</td>
            </tr>
            <tr bgcolor="#CCFF68">
               <td>ACA</td>
               <td>Thr(T)</td>
               <td>$GetCodonFrequency{ACA}</td>
               <td>$GetGeneCodons{ACA}</td>
            </tr>
            <tr bgcolor="#CCFF69">
               <td>ACG</td>
               <td>Thr(T)</td>
               <td>$GetCodonFrequency{ACG}</td>
               <td>$GetGeneCodons{ACG}</td>
            </tr>
            <tr bgcolor="#66FF66">
               <td>GCU</td>
               <td>Ala(A)</td>
               <td>$GetCodonFrequency{GCU}</td>
               <td>$GetGeneCodons{GCU}</td>
            </tr>
            <tr bgcolor="#66FF66">
               <td>GCC</td>
               <td>Ala(A)</td>
               <td>$GetCodonFrequency{GCC}</td>
               <td>$GetGeneCodons{GCC}</td>
            </tr>
            <tr bgcolor="#66FF66">
               <td>GCA</td>
               <td>Ala(A)</td>
               <td>$GetCodonFrequency{GCA}</td>
               <td>$GetGeneCodons{GCA}</td>
            </tr>
            <tr bgcolor="#66FF66">
               <td>GCG</td>
               <td>Ala(A)</td>
               <td>$GetCodonFrequency{GCG}</td>
               <td>$GetGeneCodons{GCG}</td>
            </tr>
         </table>
      </div>
      <!-- End of Table 1  -->
      <!-- Table 2 With Colour, Codon, AA, Total Frequency All, Frequency For accession number   -->
      <div id="tablesection2">
         <table width="100" border="1">
            <tr>
               <th scope="col">Codon</th>
               <th scope="col">Amino Acid</th>
               <th scope="col">Total Frequency (%)</th>
               <th scope="col">Frequency For $accession (%)</th>
            </tr>
            <tr bgcolor="#CCFF33">
               <td>UAU</td>
               <td>Tyr(Y)</td>
               <td>>
               <td>>
            </tr>
            <tr bgcolor="#CCFF34">
               <td>UAC</td>
               <td>Tyr(Y)</td>
               <td>>
               <td>>
            </tr>
            <tr bgcolor="#E60000">
               <td>UAA</td>
               <td>STOP</td
               <td>0.0774500247038872</td>
               >0.190114068441065</td>>>
            <tr bgcolor="#E60000">
               <td>UAG</td>
               <td>STOP</td
               <td>0.0787853699574025</td>
               $GetCodonFrequency{UAU}</td></td>$GetGeneCodons{UAU}</td>>
            <tr bgcolor="#FF8533">
               <td>CAU</td>
               <td>His(H)</td>
               <td>$GetCodonFrequency{UAC}</td>
               <td>$GetGeneCodons{UAC}</td>
            </tr>
            <tr bgcolor="#FF8533">
               <td>CAC</td>
               <td>His(H)</td>
               <td>
               <td>
               <td>
            </tr>
            </tr>
            <tr bgcolor="#CCCC00">
               <td>CAA</td>
               <td>Gln(G)</td>
               <td>
               <td>
               <td>
            </tr>
            </tr>
            <tr bgcolor="#CCCC00">
               <td>CAG</td>
               <td>Gln(G)</td>
               <td>$GetCodonFrequency{CAU}</td>
               <td>$GetGeneCodons{CAU}</td>
            </tr>
            <tr bgcolor="#66FF33">
               <td>AAU</td>
               <td>Asn(A)</td>
               <td>$GetCodonFrequency{CAC}</td>
               <td>$GetGeneCodons{CAC}</td>
            </tr>
            <tr bgcolor="#66FF33">
               <td>AAC</td>
               <td>Asn(A)</td>
               <td>$GetCodonFrequency{CAA}</td>
               <td>$GetGeneCodons{CAA}</td>
            </tr>
            <tr bgcolor="#CC99FF">
               <td>AAA</td>
               <td>Lys(L)</td>
               <td>$GetCodonFrequency{CAG}</td>
               <td>$GetGeneCodons{CAG}</td>
            </tr>
            <tr bgcolor="#CC99FF">
               <td>AAG</td>
               <td>Lys(L)</td>
               <td>$GetCodonFrequency{AAU}</td>
               <td>$GetGeneCodons{AAU}</td>
            </tr>
            <tr bgcolor="#C266C2">
               <td>GAU</td>
               <td>Asp(A)</td>
               <td>$GetCodonFrequency{AAC}</td>
               <td>$GetGeneCodons{AAC}</td>
            </tr>
            <tr bgcolor="#C266C2">
               <td>GAC</td>
               <td>Asp(A)</td>
               <td>$GetCodonFrequency{AAA}</td>
               <td>$GetGeneCodons{AAA}</td>
            </tr>
            <tr bgcolor="#FFCC66">
               <td>GAA</td>
               <td>Glu(G)</td>
               <td>$GetCodonFrequency{AAG}</td>
               <td>$GetGeneCodons{AAG}</td>
            </tr>
            <tr bgcolor="#FFCC66">
               <td>GAG</td>
               <td>Glu(G)</td>
               <td>$GetCodonFrequency{GAU}</td>
               <td>$GetGeneCodons{GAU}</td>
            </tr>
            <tr bgcolor="#FF9999">
               <td>UGU</td>
               <td>Cys(C)</td>
               <td>$GetCodonFrequency{GAC}</td>
               <td>$GetGeneCodons{GAC}</td>
            </tr>
            <tr bgcolor="#FF9999">
               <td>UGC</td>
               <td>Cys(C)</td>
               <td>$GetCodonFrequency{GAA}</td>
               <td>$GetGeneCodons{GAA}</td>
            </tr>
            <tr bgcolor="#E60000">
               <td>UGA</td>
               <td>STOP</td
               <td>0.134869870605045</td>
               $GetCodonFrequency{GAG}</td></td>$GetGeneCodons{GAG}</td>>
            <tr bgcolor="#E08566">
               <td>UGG</td>
               <td>Trp(T)</td>
               <td>$GetCodonFrequency{UGU}</td>
               <td>$GetGeneCodons{UGU}</td>
            </tr>
            <tr bgcolor="#CCCC52">
               <td>CGU</td>
               <td>Arg(A)</td>
               <td>$GetCodonFrequency{UGC}</td>
               <td>$GetGeneCodons{UGC}</td>
            </tr>
            <tr bgcolor="#CCCC52">
               <td>CGC</td>
               <td>Arg(A)</td>
               <td>}</td>
               <td>$GetGeneCodons{UGA>
            </tr>
            <tr bgcolor="#CCCC52">
               <td>CGA</td>
               <td>Arg(A)</td>
               <td>$GetCodonFrequency{UGG}</td>
               <td>$GetGeneCodons{UGG}</td>
            </tr>
            <tr bgcolor="#CCCC52">
               <td>CGG</td>
               <td>Arg(A)</td>
               <td>$GetCodonFrequency{CGU}</td>
               <td>$GetGeneCodons{CGU}</td>
            </tr>
            <tr bgcolor="#CCCCFF">
               <td>AGU</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{CGC}</td>
               <td>$GetGeneCodons{CGC}</td>
            </tr>
            <tr bgcolor="#CCCCFF">
               <td>AGC</td>
               <td>Ser(S)</td>
               <td>$GetCodonFrequency{CGA}</td>
               <td>$GetGeneCodons{CGA}</td>
            </tr>
            <tr bgcolor="#CCCC52">
               <td>AGA</td>
               <td>Arg(A)</td>
               <td>$GetCodonFrequency{CGG}</td>
               <td>$GetGeneCodons{CGG}</td>
            </tr>
            <tr bgcolor="#CCCC52">
               <td>AGG</td>
               <td>Arg(A)</td>
               <td>$GetCodonFrequency{AGU}</td>
               <td>$GetGeneCodons{AGU}</td>
            </tr>
            <tr bgcolor="#FF66FF">
               <td>GGU</td>
               <td>Gly(G)</td>
               <td>$GetCodonFrequency{AGC}</td>
               <td>$GetGeneCodons{AGC}</td>
            </tr>
            <tr bgcolor="#FF66FF">
               <td>GGC</td>
               <td>Gly(G)</td>
               <td>$GetCodonFrequency{AGA}</td>
               <td>$GetGeneCodons{AGA}</td>
            </tr>
            <tr bgcolor="#FF66FF">
               <td>GGA</td>
               <td>Gly(G)</td>
               <td>$GetCodonFrequency{AGG}</td>
               <td>$GetGeneCodons{AGG}</td>
            </tr>
            <tr bgcolor="#FF66FF">
               <td>GGG</td>
               <td>Gly(G)</td>
               <td>$GetCodonFrequency{GGU}</td>
               <td>$GetGeneCodons{GGU}</td>
            </tr>
         </table>
      </div>
      <!-- End of Table 2  -->	 
   </body>
   <!-- End of Document Body  -->
</html>
<!-- End of HTML Document  -->
__EOF
