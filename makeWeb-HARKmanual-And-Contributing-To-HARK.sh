#!/bin/bash

cd ../HARKive/HARK/
HARKmake=($realpath ../HARK-make)

HARKDocRoot=$(realpath ../HARK/Documentation)
#HARKDocRoot=$(realpath ../HARK-make/Documentation)

# makeWeb-Simple-HARKmanual.sh assumes that HARK and HARK-make are both in the same directory
cmd="$HARKmake/makeWeb-Simple-HARKmanual.sh $HARKDocRoot"
echo "$cmd"
eval "$cmd"
eval "$cmd" # Second evaluation may be necessary to build auxiliary files correctly
