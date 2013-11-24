#!/bin/sh

# Run as: bash add_bagside.sh <filename>

filename=$1
pages="`pdftk $filename dump_data | grep NumberOfPages | cut -d : -f2`"
numpages=`for ((a=1; a <= $pages; a++)); do echo -n "A$a B1 "; done`
pdftk A=$filename B=bagside.pdf cat $numpages output $filename-alternated.pdf
exit 0
