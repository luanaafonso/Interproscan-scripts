# Interproscan-scripts

## Interproscan command example

### Usage
    interproscan.sh -t p -pathways -goterms -i protein.fasta -T /temp/dir/path -b protein.fasta.IPROUT

## Count all protein signature identifiers from Interproscan output and place them in separate lists. Each list contains one type of protein signature (e.g. PFAM, PRINTS or SignalP). Count data in each list are in descending order. Input file for this script needs to be in the TAB format. 

### Usage 
    perl protein_signature_extraction.pl <interproscan_output.tab>

## In case you already ran Interproscan but the output is TSV, please use this script to convert the output to TAB. 

### Usage
    perl tsv2tab_IPRS.pl <interproscan.tsv>
