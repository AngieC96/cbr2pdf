#!/usr/bin/env bash


SECONDS=0 # bash built in "timer"

# NOTE : Quote it else use array to avoid problems #
FILES="/home/angela/Documenti/Topolini/Topolini2/*"

DIRR="$(basename "${FILES}")"

OUTDIRR="Output/"
FILES2="./Output/*"

# Extract files from each archive
for f in $FILES
do
  # take action on each file. $f store current file name
  echo -e "\n\nExtracting $f file..."
  name=$(basename "${f}")  # part of the POSIX standard
  name=$(echo $name | cut -d')' -f 1)')'
  echo -e "\toutput name=${name}"
  7z e "${f}" -o"./${OUTDIRR}${name}"
done

echo -e "\n"

# Merge the .jpgs in only one pdf
for f in $FILES2
do
  echo -e "Processing $f file..."
  name=$(echo $f |cut -d'/' -f 3)
  img2pdf -o "${OUTDIRR}${name}".pdf ./"${OUTDIRR}${name}"/*.jpg
done

echo -e "\nTotal time: ${SECONDS}s"
