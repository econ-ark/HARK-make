#!/bin/bash

cd /Volumes/Data-Bak/Code/ARK/HARKive/HARK-make/
HARKmake=($realpath ../HARK-make)

#HARKDocRoot=$(realpath ../HARK/Documentation)
HARKDocRoot=$(realpath ../HARK-make/Documentation)

echo $HARKmake/makeWeb-Simple-HARKmanual.sh $HARKDocRoot 
$HARKmake/makeWeb-Simple-HARKmanual.sh $HARKDocRoot 
echo $HARKmake/makeWeb-Simple-HARKmanual-ContributingToHARKOnly.sh $HARKDocRoot
$HARKmake/makeWeb-Simple-HARKmanual-ContributingToHARKOnly.sh $HARKDocRoot

