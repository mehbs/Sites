#!/usr/bin/perl
use strict;
use CGI;
use cwmodule;
my $cgi = new CGI;
print $cgi->header();
# Obtain parameters to populate summary table
my $table = cwmodule::GetSummary;
print <<__EOF;
<html>
   <head>
      <title>Summary page</title>
      <link href="http://student.cryst.bbk.ac.uk/~pm001/css/test2.css" rel="stylesheet" type="text/css">
   </head>
   <body>
      <div class='page'>
         <!--  ========================== HEADER ===============================     -->
         <header>
            <div class='header'>
               <div class='logo'>
                  <img src="http://student.cryst.bbk.ac.uk/~dm002/DNA.png" width="98" height="114" alt="text"/>
               </div>
               <!-- end logo div  -->
               <div class='title'>
                  <h1><small>CHROMOSOME 3</small></h1>
               </div>
               <!-- end title div  -->
               <div class='navbox'>
                  <!-- navbar and search box    -->
                  <!--  ========================== SEARCH BOX =============================== DON'T TOUCH!!!!!!!!!!!!!!    -->
                  <div class='searchbox'>
                     <form action='http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/dm002/searchYoli.pl'  method="post">
                        <select name = "searchBy">
                           <option name="searchBy" value="gid">Gene Id</option>
                           <option name="searchBy" value="protein">Protein</option>
                           <option name="searchBy" value="accession">Accession Number</option>
                           <option name="searchBy" value="chromosome_loc">Chromosome Location</option>
                        </select>
                        <input name="input" type="text" />
                        <input type="submit" value="search"/>
                     </form>
                  </div>
                  <!-- end searchbox div -->
                  <!--  ========================== NAVIGATION BAR ===============================     -->
                  <!-- Navigation bar      -->
                  <div class='navbar'>
                     <ul>
                        <li><a href='homepage.html'>Home</a></li>
                        <li><a href='summary.html'>Summary</a></li>
                        <li><a href='detail.html'>Detail</a></li>
                     </ul>
                  </div>
                  <!-- ======= end navbar div ============= -->
               </div>
               <!-- end navbox div  -->
            </div>
            <! ===end header div ====== -->
         </header>
         <!--  ========================== END HEADER ===============================     -->
         <!--  Wrapper for Table Results -->
         <div class='table'>
            <!--  Header For Table -->
            <h1>Summary</h1>
            <!--  Size For Table Column -->
            <table>
            <table width="659" border="1" id="table">
               <tr>
                  <th scope="col">Gene Identifiers</th>
                  <th scope="col">Protein Product Names</th>
                  <th scope="col">Genbank Accession Number</th>
                  <th scope="col">Chromosomal Location</th>
               </tr>
               $table
            </table>
         </div>
         <!-- === end content div ===-->
         <!--  ==== HISTORY back() Method to go back to the prevoius page ====     -->
         <script>
            function goBack()
              {
              window.history.back()
              }
         </script>
         <button onclick="goBack()"><b>Go Back</b></button>
         <!--  ====== FOOTER =============     -->
         <footer>
            <div class='footer'>
               <p class='footnote'><small>MSc/MRes Bioinformatics with Systems Biology 2013/2014: Biocomputing II</small></p>
            </div>
      </div>
      <!-- end footer div  -->
      </footer> <!-- end footer  -->
      </div>  <!-- end page div -->
   </body>
</html>
__EOF

