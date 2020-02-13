#!/bin/bash
# Make the standalone "Contributing to HARK" document; will become obsolete when docs are rationalized
# Allows a 'single source of truth' for Contributing info

scriptParent="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -ne 1 ]; then
  echo "usage:   ${0##*/} path-to-directory-containing-original-HARKmanual"
  echo "example: ${0##*/} /V/Data/Code/ARK/HARK/Documentation"
  exit 1
fi

path=$1
# path=/V/Data/Code/ARK/HARK/Documentation
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
rpl -Rf 'scrartcl' 'scrreprt' * # Due to the \|temp{rm} bug, scartcl does not work as of 20180521 -- can't figure out why


rpl '\setboolean{ContributingToHARKOnly}{false}' '\setboolean{ContributingToHARKOnly}{true}' *.tex

echo $scriptParent/makeWeb-Simple.sh $path/HARKmanual/ContributingToHARK ContributingToHARK '"'"Contributing To HARK"'"' EconARK.org

$scriptParent/makeWeb-Simple.sh $path/HARKmanual/ContributingToHARK ContributingToHARK '"'"Contributing To HARK"'"' EconARK.org

python $scriptParent/html2text-master/html2text.py ContributingToHARK.html > ContributingToHARK.md

