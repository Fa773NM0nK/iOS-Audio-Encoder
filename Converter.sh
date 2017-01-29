#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    output="Converted/"${line#*/}
    
    outputFolder=${output%/*}
    
    mkdir -p "$outputFolder"
    
    ffmpeg -fflags +genpts -i "$line" -vcodec copy -acodec libmp3lame -ab 320k "$output"
done < ./Converter-Input.txt
