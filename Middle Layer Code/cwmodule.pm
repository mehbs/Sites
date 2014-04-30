#!/usr/bin/perl
package cwmodule;
use DBI;
use strict;
use English;


#----------Database specification--------------

my $dbname = "mp001";
my $datasource = "dbi:mysql:database=$dbname";
my $dbpassword = "gksw162yr";



#----------Subroutines-------------------------


#Return a string containing html to build a table with information for all genes in the database
sub GetSummary
{
	my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
	my $sql = "SELECT gid, protein, accession, chromosome_loc FROM Gene_Summary";
	my $sth = $dbh->prepare($sql);
	my $table = "";
	if($sth->execute)
	{
		my ($gid, $protein, $accession, $chromosome_loc);
		while(($gid, $protein, $accession, $chromosome_loc) = $sth->fetchrow_array)
		{
			my $link = "http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/mp001/cw/cgi_search2.pl?accession=$accession";
			my $row = "<tr><td>$gid</td><td>$protein</td><td><a href = '$link'>$accession</a></td><td>$chromosome_loc</td></tr>\n";
			$table = $table . $row;
		}
	}
	return $table;
}

#Returns a string containing html to build a table with information on all genes
#matching a given search term and type
#(type must be one of gid, protein, accession, chromosome_loc)
sub Search
{
	my $searchType = $ARG[0];
	my $searchTerm = $ARG[1];
	my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
	my $sql = "SELECT gid, protein, accession, chromosome_loc FROM Gene_Summary WHERE $searchType LIKE '%$searchTerm%'";
	my $sth = $dbh->prepare($sql);
	my $table = "";
	if($sth->execute)
	{
		my ($gid, $protein, $accession, $chromosome_loc);
		while(($gid, $protein, $accession, $chromosome_loc) = $sth->fetchrow_array)
		{
			my $link = "http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/mp001/cw/cgi_search2.pl?accession=$accession";
			my $row = "<tr><td>$gid</td><td>$protein</td><td><a href = '$link'>$accession</a></td><td>$chromosome_loc</td></tr>\n";
			$table = $table . $row;
		}
	}
	return $table;
}


#returns summary information for the given gene using its accession number, result  is a string formatted as a 
#single table row
sub GetGeneDetail
{
	my $accession = $ARG[0];
	my($gene, $protein, $description, $chromosome_loc);
	my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
	my $sql = "SELECT gene, protein, description, chromosome_loc FROM Gene_Summary WHERE accession = '$accession' LIMIT 1";
	my $sth = $dbh->prepare($sql);	
	if($sth->execute)
	{
		($gene, $protein, $description, $chromosome_loc) = $dbh->selectrow_array($sql);
	}
	my $result = "<tr><td>$gene</td><td>$protein</td><td>$description</td><td>$chromosome_loc</td></tr>\n";
	return $result;
}
	

#returns the full DNA sequence with coding regions highlighted with html tags (bold and red),
#also contains paragraph tags
sub GetDNA
{
	my $accession = $ARG[0];
	my $DNA = "";
	my $join = "";
	my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
	my $sql = "SELECT d.dna_sequence, c.cds_str FROM CDS c, DNA d, Gene_Summary g WHERE g.accession = '$accession' AND c.dna_id = d.dna_id AND g.dna_id = d.dna_id LIMIT 1";
	my $sth = $dbh->prepare($sql);	
	if($sth->execute)
	{
		($DNA, $join) = $dbh->selectrow_array($sql);
	}
	my @breaks;
	while($join =~ /[^0-9]*([0-9]+)(.*)/)
	{
		push(@breaks,$1);
		$join = $2;
	}
	my $formattedSeq = FormatSeq($DNA,\@breaks);
	return $formattedSeq;
}


#takes a given sequence and array of breaks (even numbered in size) and formats the
#elements of the string between pairs of values (inclusive) as bold, red. Returns a
#string formatted as an html paragraph
sub FormatSeq
{
	my $sequence = $ARG[0];
	my @breaks = @{$ARG[1]};
	unless(scalar @breaks % 2 == 0)
	{
		push (@breaks,length($sequence))
	}
	my $formattedSeq = "<p>";
	my $start = 0;
	while(scalar @breaks > 0)
	{
		my $nonCoding = substr($sequence, $start, $breaks[0]-$start-1);
		my $coding = substr($sequence, $breaks[0]-1, $breaks[1]-$breaks[0]+1);
		$formattedSeq = $formattedSeq . $nonCoding . "<font color=\"red\"><b>$coding</b></font>";
		$start = $breaks[1];
		splice @breaks, 0, 2;
	}
	my $end = substr($sequence, $start, length($sequence) - $start);
	$formattedSeq = $formattedSeq . $end . "</p>";
	return $formattedSeq;
}
	

#returns a string with two html paragraphs, with the amino acid sequence in the first paragraph
#and the coding DNA sequence in the second.
sub GetAA
{
	my $accession = $ARG[0];
	my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
	my $sql = "SELECT d.amino_acid_sequence, d.cds_sequence FROM DNA d, Gene_Summary g WHERE g.dna_id = d.dna_id AND g.accession = '$accession' LIMIT 1";
	my $sth = $dbh->prepare($sql);
	my ($AA, $CDS);	
	if($sth->execute)
	{
		($AA, $CDS) = $dbh->selectrow_array($sql);
	}
	my $result = "<p>$AA</p><p>$CDS</p>";
	return $result;
}


#returns a codon frequency hash table for all the genes in the database
#(codons as keys, frequencies as values)
sub GetChromFrequency
{
	my @accessions;
	my %overallFrequencies;
	my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
	my $sql = "SELECT accession FROM Gene_Summary";
	my $sth = $dbh->prepare($sql);
	if($sth->execute)
	{
		my $accession;
		while($accession = $sth->fetchrow_array)
		{
			push(@accessions,$accession)
		}
	}
	foreach my $accession (@accessions)
	{
		my %geneCodonFreq = GetCodonTotals($accession);
		foreach my $key (keys %geneCodonFreq)
		{
			$overallFrequencies{$key} += $geneCodonFreq{$key};
		}
	}
	return %overallFrequencies;
}


#returns a codon percentage hash table for all the genes in the database
#(codons as keys, percentages as values
sub GetCodonFrequency
{
	my %frequencies = GetChromFrequency();
	my %codonPercentages;
	my $total = 0;
	foreach my $key (keys %frequencies)
	{
		$total += $frequencies{$key}
	}
	foreach my $key (keys %frequencies)
	{
		$codonPercentages{$key} = 100 * ($frequencies{$key}/$total)
	}
	return %codonPercentages;
}
		
#returns a codon percentage hash table for the given gene (codons as keys, percentages as values)
sub GetGeneCodons
{
	my $accession = $ARG[0];
	my %frequencies = GetCodonTotals($accession);
	my %codonPercentages;
	my $total = 0;
	foreach my $key (keys %frequencies)
	{
		$total += $frequencies{$key}
	}
	foreach my $key (keys %frequencies)
	{
		$codonPercentages{$key} = 100 * ($frequencies{$key}/$total)
	}
	return %codonPercentages;
}



#returns a codon frequency hash table for the given gene (codons as keys, frequencies as values)
sub GetCodonTotals
{
	my $accession = $ARG[0];
	my $codingSequence;
	my $start;
	my %codonFrequencies;
	my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
	my $sql = "SELECT c.codon_start, d.cds_sequence FROM CDS c, DNA d, Gene_Summary g WHERE g.accession = '$accession' AND g.dna_id = c.dna_id AND g.dna_id = d.dna_id LIMIT 1";
	my $sth = $dbh->prepare($sql);	
	if($sth->execute)
	{
		($start, $codingSequence) = $dbh->selectrow_array($sql);
	}
	$codingSequence =~ s/T/U/g;
	while ($start > 1)
	{
		$codingSequence = substr $codingSequence, 1;
		$start --;
	}
	while(length($codingSequence) > 2)
	{
		my $codon = substr($codingSequence, 0, 3);
		$codonFrequencies{$codon}++;
		$codingSequence = substr $codingSequence, 3;
	}
	return %codonFrequencies;
}

#returns an html tagged paragraph with highlighting of regions matching a given substring
sub StickyEnds
{
	my $accession = $ARG[0];
	my $type = $ARG[1];
	my %stickyEndsHash;
	$stickyEndsHash{EcoR1}="GAATTC";
	$stickyEndsHash{BamH1}="GGATCC";
	$stickyEndsHash{BsuM1}="CTCGAG";
	if(exists $stickyEndsHash{$type})
	{
		my $DNA;
		my $string = $stickyEndsHash{$type};
		my @breaks;
		my $dbh = DBI->connect($datasource, $dbname, $dbpassword);
		my $sql = "SELECT d.dna_sequence FROM DNA d, Gene_Summary g WHERE g.accession = '$accession' AND g.dna_id = d.dna_id LIMIT 1";
		my $sth = $dbh->prepare($sql);	
		if($sth->execute)
		{
			$DNA = $dbh->selectrow_array($sql);
		}
		my $start = 0;
		while ($start < length($DNA))
		{
			my $index = index($DNA, $string, $start);
			unless($index == -1)
			{
				my $stickyStart = $index + 1;
				my $stickyEnd = $stickyStart + length($string) - 1;
				push(@breaks, $stickyStart);
				push(@breaks, $stickyEnd);
				$start = $stickyEnd;
			}
			$start++;
		}
		my $formattedSeq = FormatSeq($DNA,\@breaks);
		return $formattedSeq;
	}
	else
	{
		return "not a valid sticky end\n";
	}
}

1;
