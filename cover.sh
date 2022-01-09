#!/bin/bash

green=$'\e[32m'
red=$'\e[31m'
yellow=$'\e[33m'
blue=$'\e[34m'
reset=$'\e[0m'

FILES="/home/angela/Documenti/Topolini/Topolini2/*"

DIRR="$(basename "${FILES}")"

OUTDIRR="Output/"

for file in $FILES
do
  echo -e "${blue}Processing $file file...${reset}"
  name=$(basename "${file}")  # part of the POSIX standard
  name=$(echo $name | cut -d')' -f 1)')'
  cover="`7z l -ba "${file}" | awk 'NR==2 {exit} 1' | cut -b 54-`"
  7z e "${file}" "${cover}" -o"./${OUTDIRR}"
done
