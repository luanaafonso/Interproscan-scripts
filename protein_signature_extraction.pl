#!/usr/bin/perl

#Written by Tom de Man

use strict; 

my $interpro_input = $ARGV[0];
my %signature_dbs;
my %count;

open FILE, "$interpro_input";

while (<FILE>) {
        chomp;
        my @split_list = split(' ', $_);
	$signature_dbs{$split_list[7]} = 1;
}
close FILE;

sub hashValueDescendingNum {
   $count{$b} <=> $count{$a};
}

my @signature_dbs_keys = keys(%signature_dbs);
foreach my $value (@signature_dbs_keys) {
	#print "$value \n";
        my @signature_counter;
        open FILE2, "$interpro_input";
        open FILE3, ">$value.txt";

        while (<FILE2>) {
                chomp;
                my @split_list = split(' ', $_);
                if ($split_list[7] eq $value) {
                        push (@signature_counter, $split_list[8]);
                }
        }
        close FILE2;
        
        foreach my $element (@signature_counter) {
                $count{$element}++;
        }
	
	foreach my $key (sort hashValueDescendingNum (keys(%count))) {
   		print FILE3 "$count{$key}\t$key\n";
	}
	undef %count;
}	
