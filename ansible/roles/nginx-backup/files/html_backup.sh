#!/bin/bash

while getopts d:i:o: flag
do
    case "${flag}" in
        d) INPUT_DIR=${OPTARG};;
        i) INPUT_INDEX=${OPTARG};;
        o) OUTPUT_DIR=${OPTARG};;
    esac
done

_date=$(date +"%d_%m_%Y")
_hostname=$(hostname -s)
zip_filename="${_hostname}_${_date}.zip"

zip $zip_filename "$INPUT_DIR"/"$INPUT_INDEX"
mv $zip_filename "$OUTPUT_DIR"
