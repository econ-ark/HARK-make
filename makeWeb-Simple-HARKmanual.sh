#!/bin/bash
# Tweak HARKmanual so it will compile as html

scriptParent="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -ne 1 ]; then
  echo "usage:   ${0##*/} path-to-directory-containing-HARKmanual"
  echo "example: ${0##*/} /Volumes/Data/Code/ARK/HARK/Documentation"
  exit 1
fi

path=$1

# path=/Volumes/Data/Code/ARK/HARK/Documentation
# scriptParent=/Volumes/Data-Bak/Code/ARK/HARK-make; path=$scriptParent/../HARK-make/Documentation
cd $path
git checkout gh-pages

if [ ! -d HARKmanual ]; then
    mkdir HARKmanual
fi

#rm HARKmanual/*.*

pushd . 
cd ../../HARK/Documentation/HARKmanual/
cp HARKmanual.tex   $path/HARKmanual
cp HARKmanual.tex   $path/HARKmanual
cp UserGuidePic.*   $path/HARKmanual
cp econtex*         $path/HARKmanual 

cd $path/HARKmanual

ebb -x *.png

pdflatex HARKmanual
bibtex   HARKmanual
pdflatex HARKmanual
pdflatex HARKmanual

ditto HARKmanual.pdf ../HARKmanual.pdf
rpl -Rf 'scrartcl' 'scrreprt' * # Due to the \|temp{rm} bug, scartcl does not work for html as of 20180521 -- can't figure out why


$scriptParent/makeWeb-Simple.sh $path/HARKmanual HARKmanual '"'"A Users Guide for HARK: Heterogeneous Agents Resources and toolKit"'"' EconARK.org

echo ''
echo ''

pwd
echo python $scriptParent/html2text-master/html2text.py HARKmanual.html '> HARKmanual.md'

python $scriptParent/html2text-master/html2text.py HARKmanual.html  > HARKmanual.md

ditto HARKmanual.md ../HARKmanual.md
