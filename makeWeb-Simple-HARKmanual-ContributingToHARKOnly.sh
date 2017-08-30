#!/bin/bash

scriptParent="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -ne 1 ]; then
  echo "usage:   ${0##*/} path-to-directory-containing-original-HARKmanual"
  echo "example: ${0##*/} HARKmanual "'"A Users Guide for HARK: Heterogeneous Agents Resources and toolKit''"'
  exit 1
fi

path=$1

if [ ! -e $path/HARKmanual ]; then
    echo 'Documentation/HARKmanual directory does not exist.  Create and rerun.'
fi

cd $path/HARKmanual

if [ ! -d ContributingToHARK ]; then
    mkdir -p ContributingToHARK
fi

rm -Rf ContributingToHARK/*.*

cp HARKmanual.tex   ContributingToHARK/ContributingToHARK.tex
cp UserGuidePic.pdf ContributingToHARK
cp econtex*         ContributingToHARK

cd ContributingToHARK

rpl '\setboolean{ContributingToHARKOnly}{false}' '\setboolean{ContributingToHARKOnly}{true}' *.tex

echo $scriptParent/makeWeb-Simple.sh $path/HARKmanual/ContributingToHARK ContributingToHARK '"'"Contributing To HARK"'"' EconARK.org

$scriptParent/makeWeb-Simple.sh $path/HARKmanual/ContributingToHARK ContributingToHARK '"'"Contributing To HARK"'"' EconARK.org

python $scriptParent/html2text-master/html2text.py ContributingToHARK.html > ContributingToHARK.md

