#!/bin/bash

HARKmake=/Volumes/Data/Code/ARK/HARKive/HARK-make

HARKDocRoot=/Volumes/Data/Code/ARK/HARK/Documentation

echo $HARKmake/makeWeb-Simple-HARKmanual.sh $HARKDocRoot 
$HARKmake/makeWeb-Simple-HARKmanual.sh $HARKDocRoot 
echo $HARKmake/makeWeb-Simple-HARKmanual-ContributingToHARKOnly.sh $HARKDocRoot
$HARKmake/makeWeb-Simple-HARKmanual-ContributingToHARKOnly.sh $HARKDocRoot

