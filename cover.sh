#!/bin/bash

green=$'\e[32m'
red=$'\e[31m'
yellow=$'\e[33m'
blue=$'\e[34m'
reset=$'\e[0m'

OUTDIRR="Output/"

for file in *.cbr
do
  echo -e "${blue}Processing $file file...${reset}"
  (zipinfo -2 "$file" > /dev/null)
  if [[ $? -eq 0 ]] # execute only if the previous command doen't give errors
    then
      cover="`zipinfo -2 "$file" | awk 'NR==2 {exit} 1'`"
      7z e "${file}" "${cover}"
    else
      name=$(echo $file | cut -d'.' -f 1)'.zip'
      echo $name
      mv "${file}" "${name}"
      cover="`7z l -ba ${file} | awk 'NR==2 {exit} 1' | cut -b 54-`"
      7z e "${file}" "${cover}"
  fi
  echo -e "\n"
done
