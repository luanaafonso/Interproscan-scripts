# Interproscan-scripts

## Interproscan command example

**interproscan.sh** -t p -pathways -goterms -i protein.fasta -T /temp/dir/path -b protein.fasta.IPROUT

## protein_signature_extraction.pl 

This Perl script counts all the protein signature identifiers and places them in separate lists. Each list contains one type of protein signature (e.g. PFAM, PRINTS and SignalP). Count data in each list are in descending order. 
Input file for this script needs to be in the TAB format. 

Usage: perl **protein_signature_extraction.pl** \<interproscan_output.tab\>

## tsv2tab_IPRS.pl

In case you already ran Interproscan but the output is TSV, please use this script to convert the output to TAB. 

Usage: perl **tsv2tab_IPRS.pl** \<interproscan.tsv\>
