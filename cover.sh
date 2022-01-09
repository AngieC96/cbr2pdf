#!/bin/bash

green=$'\e[32m'
red=$'\e[31m'
yellow=$'\e[33m'
blue=$'\e[34m'
reset=$'\e[0m'

for file in *.cbr
do
  cover="`7z l -ba "${file}" | awk 'NR==2 {exit} 1' | cut -b 54-`"
  7z e "${file}" "${cover}"
done
