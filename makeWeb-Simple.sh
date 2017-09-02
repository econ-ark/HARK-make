#!/bin/bash
# For a file that has nothing in it that htlatex does not like,
# compile using htlatex

if [ $# -ne 4 ]; then
  echo "usage:   ${0##*/} <path> <file> title author"
  echo "example: ${0##*/} /Volumes/Data/Code/ARK/HARK/Documentation HARKmanual "'"A Users Guide for HARK: Heterogeneous Agents Resources and toolKit''"' Econ-ARK.org
  exit 1
fi

path=$1
textName=$2
title=$3
author=$4

if [ ! -e $path/$textName.tex ]; then
    echo $path/$textName cannot be found -- aborting
fi

cd $path

# Needs to compile as dvi once (and with bibtex -terse  once) before invoking htlatex
     echo pdflatex -halt-on-error    -output-format dvi --shell-escape $textName '1> /dev/null' 
          pdflatex -halt-on-error    -output-format dvi --shell-escape $textName  1> /dev/null
[[ $? -eq 1 ]] && pdflatex -output-format dvi --shell-escape -halt-on-error -file-line-error $textName  # If it failed, run visibly without capturing output

bibtex -terse  $textName

# The following is based on tex4htMakeCFG.sh

echo "\\Preamble{}"       > $textName.cfg
printf '\\begin{document}' >> $textName.cfg
echo "\HCode{         " >> $textName.cfg
printf "<meta name = \042Author\042      content = \042"$author"\042> \Hnewline \n" >>$textName.cfg
printf "<meta name = \042Description\042 content = \042\042" >>$textName.cfg
(cat $textName.$title | tr -d '\012') >> $textName.cfg
printf "\042> \Hnewline \n" >>$textName.cfg
printf "<$title>"  >> $textName.cfg 
(cat $textName.$title | tr -d '\012') >> $textName.cfg
printf "</$title> \Hnewline" >> $textName.cfg
echo "}" >> $textName.cfg
printf '\\EndPreamble' >> $textName.cfg
echo '' >> $textName.cfg

if [ ! -f $textName.bib ]; then # The default bibliography system expects a file with this name (even if it is empty)
   touch $textName.bib
fi

if [ ! -f $textName-Add.bib ]; then  # The default bibliography system expects a file with this name (even if it is empty)
   touch $textName-Add.bib
fi

echo htlatex $textName \"tex4ht.styOptions\" \"tex4htPostProcessorOptions\" \"t4htPostProcessorOptions\" LaTeXCompilerOptions 
echo htlatex $textName "$textName,html,pic-tabular,pic-m,pic-array,pic-eqnarray,info" "" "" --shell-escape # > /dev/null
     htlatex $textName "$textName,html,pic-tabular,pic-m,pic-array,pic-eqnarray,info" "" "" --shell-escape # > /dev/null

bibexport -o $textName.bib $textName
sudo rm -f *-save-*

cp  $textName.html index.html
open index.html
