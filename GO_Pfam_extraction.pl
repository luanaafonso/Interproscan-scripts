#!/usr/bin/perl

#Written by Tom de Man

use strict; 

my $interpro_input = $ARGV[0];
open FILE, "$interpro_input";

my %go_ids;
my %pfam_ids;
my %count;
my @signatures;
my $gene_domain;

while (<FILE>) {
	chomp;
	my @split_list = split('\t', $_);
	if ($split_list[-1] =~ /^GO/ && $split_list[-1] =~ /|/)  {
		my @GO_split = split('\|', $split_list[-1]);
		foreach my $l (@GO_split){
			#print "$l \n";
			$gene_domain = "$split_list[0]"."_"."$l";
			$go_ids{$gene_domain} = 1;
		}
	}
	elsif ($split_list[-1] =~ /^GO/) {
		#print "$split_list[-1] \n";
		$gene_domain = "$split_list[0]"."_"."$split_list[-1]";
		$go_ids{$gene_domain} = 1;
	}
	if ($split_list[7] =~ /Pfam/) {
		#print "$_\n";
		$gene_domain = "$split_list[0]"."_"."$split_list[8]";
		$pfam_ids{$gene_domain} = 1;
	}
}
close FILE;

open GOFILE, ">$interpro_input.GO_terms.txt";
open PFAMFILE, ">$interpro_input.PFAM_terms.txt";

my @signature_dbs_keys = keys(%go_ids);
foreach my $key (@signature_dbs_keys) {
	#print $key."\n";
	@signatures = split('_', $key);
	$count{$signatures[1]}++;	
}
undef @signatures;

foreach my $el (sort hashValueDescendingNum (keys(%count))) {
	print GOFILE "$count{$el}\t$el\n";
}
undef %count;

my @signature_dbs_keys_pfam = keys(%pfam_ids);
foreach my $key (@signature_dbs_keys_pfam) {
	@signatures = split('_', $key);
	$count{$signatures[1]}++;
}

foreach my $el (sort hashValueDescendingNum (keys(%count))) {
	print PFAMFILE "$count{$el}\t$el\n";
}

sub hashValueDescendingNum {
	$count{$b} <=> $count{$a};
}
