#!/usr/bin/env bash


green=$'\e[32m'
red=$'\e[31m'
yellow=$'\e[33m'
blue=$'\e[34m'
reset=$'\e[0m'

SECONDS=0 # bash built in "timer"

# NOTE : Quote it else use array to avoid problems #
FILES="/home/angela/Documenti/Topolini/Topolini2/*"

DIRR="$(basename "${FILES}")"

OUTDIRR="Output/"
FILES2="./Output/*"

for file in $FILES
do
  # take action on each file. $file store current file name
  echo -e "${blue}Processing $file file...${reset}"

  # Extract files from each archive
  name=$(basename "${file}")  # part of the POSIX standard
  name=$(echo $name | cut -d')' -f 1)')'
  echo -e "\toutput name=${name}"
  7z e "${file}" -o"./${OUTDIRR}${name}"

  # Merge the .jpgs in only one pdf
  img2pdf -o "${OUTDIRR}${name}".pdf ./"${OUTDIRR}${name}"/*.jpg

  # Delete extracted files
  rm -r "./${OUTDIRR}${name}"

  echo -e "\n\n"
done

echo -e "\nTotal time: ${SECONDS}s"
