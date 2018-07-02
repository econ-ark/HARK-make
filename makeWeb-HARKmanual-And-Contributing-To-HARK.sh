#!/bin/bash

HARKmake=../HARK-make

HARKDocRoot=../HARK/Documentation

echo $HARKmake/makeWeb-Simple-HARKmanual.sh $HARKDocRoot 
$HARKmake/makeWeb-Simple-HARKmanual.sh $HARKDocRoot 
echo $HARKmake/makeWeb-Simple-HARKmanual-ContributingToHARKOnly.sh $HARKDocRoot
$HARKmake/makeWeb-Simple-HARKmanual-ContributingToHARKOnly.sh $HARKDocRoot

