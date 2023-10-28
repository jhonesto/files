#!/bin/bash

#Definindo as variáveis
BASE="$PWD/concat"
LIST="filelist.txt"

for f in $BASE/*; do echo "file '$f'" >> $LIST; done 

#Concatenando os arquivos de acordo como quantidade passada 
ffmpeg -f concat -safe 0 -i $LIST -c copy $BASE/output.mp4

rm $LIST 
