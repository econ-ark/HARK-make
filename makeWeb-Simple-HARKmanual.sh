#!/bin/bash

scriptParent="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -ne 1 ]; then
  echo "usage:   ${0##*/} path-to-directory-containing-HARKmanual"
  echo "example: ${0##*/} HARKmanual "'"A Users Guide for HARK: Heterogeneous Agents Resources and toolKit''"'
  exit 1
fi

path=$1

cd $path

if [ ! -d HARKmanual ]; then
    mkdir HARKmanual
fi

rm HARKmanual/*.*

cp HARKmanual.tex   HARKmanual
cp UserGuidePic.pdf HARKmanual
cp econtex*         HARKmanual 

cd HARKmanual

$scriptParent/makeWeb-Simple.sh $path/HARKmanual/HARKmanual '"'"A Users Guide for HARK: Heterogeneous Agents Resources and toolKit"'"' EconARK.org






