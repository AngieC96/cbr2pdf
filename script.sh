#!/usr/bin/env bash


SECONDS=0 # bash built in "timer"

# NOTE : Quote it else use array to avoid problems #
FILES="/home/angela/Documenti/Topolini/Topolini2/*"

DIRR="Output/"
FILES2="./Output/*"

# Extract files from each archive
for f in $FILES
do
  # take action on each file. $f store current file name
  echo -e "\n\nExtracting $f file..."
  name=$(echo $f |cut -d'/' -f 7)
  name=$(echo $name | cut -d')' -f 1)')'
  echo -e "\toutput name=${name}"
  7z e "${f}" -o"./${DIRR}${name}"
done

echo -e "\n"

# Merge the .jpgs in only one pdf
for f in $FILES2
do
  echo -e "Processing $f file..."
  name=$(echo $f |cut -d'/' -f 3)
  img2pdf -o "${DIRR}${name}".pdf ./"${DIRR}${name}"/*.jpg
done

echo -e "\nTotal time: ${SECONDS}s"
