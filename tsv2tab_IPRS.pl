#!/usr/bin/perl

#Written by Tom de Man

use strict;

#input is .tsv file
my $file = shift;
open FILE, "$file";
open OUT, ">$file.tab";

while (<FILE>) {
        chomp;
        my @s = split('\t', $_);
        print OUT "$s[0]\tprotein\tAED\teAED\tQi:0\t$s[1]\t$s[2]\t$s[3]\t$s[4]\t$s[5]\t$s[-1]\n";
}