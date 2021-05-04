#!/usr/bin/bash

nlines=$(wc -l $1| awk '{print $1;}')

echo "int nlines = ${nlines};" > $2
