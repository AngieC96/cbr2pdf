#!/bin/bash

for file in *.cbr
do
 cover="`zipinfo -2 "$file" | awk 'NR==2 {exit} 1'`"
 unzip -j "$file" "$cover"
done;
