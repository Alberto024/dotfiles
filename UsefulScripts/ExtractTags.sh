#!/bin/bash

filename=$1
egrep '@' "${filename}" | cut -d '{' -f 2 | tr -d ',' | awk '{printf("\\cite{%s}\n", $1)}' | tee >(xclip)
echo -e "\nOutput copied to clipboard!"
