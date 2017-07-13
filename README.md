# Interproscan-scripts

## Interproscan command example

### Usage
    interproscan.sh -t p -pathways -goterms -i protein.fasta -T /temp/dir/path -b protein.fasta.IPROUT

## Count all protein signature identifiers from Interproscan output and place them in separate lists. Each list contains one type of protein signature (e.g. PFAM, PRINTS or SignalP). Count data in each list are in descending order. One protein can contain multiple instances of the same signature identifier, and all those occurrences are counted (if you don’t like that, please see GO_Pfam_extraction.pl). Input file for this script needs to be in the TAB format. 

### Usage 
    perl protein_signature_extraction.pl <interproscan_output.tab>

## In case you already ran Interproscan but the output is TSV, please use this script to convert the output to TAB. 

### Usage
    perl tsv2tab_IPRS.pl <interproscan.tsv>

## This script only focusses on GOterms and Pfam domains. Multiple instances of the same GOterm or Pfam domain, from a single protein, are counted as one. GOterm and Pfam domain occurrences are listed in descending order.

### Usage
    perl GO_Pfam_extraction.pl <interproscan_output.tab>