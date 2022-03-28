#!/bin/bash

scriptDir=/Volumes/Data/Code/ARK/HARKive/HARK-make/Documentation/NARK-make
cd $scriptDir
root=../../../HARK
nark=Documentation/NARK
file="$(realpath $root/$nark/NARK)"
cd "$root/$nark"

git branch -D gh-pages
git checkout gh-pages

[[ -e economics.bib ]] && rm -f economics.bib # Prevent distracting error messages

cmd="/Volumes/Data/Tools/makeWeb-Paper.sh $(realpath $(dirname $file)) $file" 
echo "$cmd" ; eval "$cmd"
bibexport -o "$file.bib" "$file"  ; touch economics.bib # make it LaTeX compilable    
mv "$file.css" "$file-plain.css"
cat /Volumes/Data/Code/ARK/econ-ark-tools/Web/Styling/REMARKs-HTML/econ-ark-html-theme.css "$file-plain.css" > "$file.css"
rm -f "$file-plain.css"
[[ ! -e _config.yml ]] && echo "theme: jekyll-theme-minimal" > _config.yml # SOME yaml file needed for gh-pages to work
cp -p "$file.html" index.html
open "$file.html"

# GitHub pages does not like svg graphics so forget about a NARK.md for now (20201120)
# pandoc -v -s $file.html -o $file.md -t markdown_github-raw_html-native_divs-native_spans-fenced_divs-bracketed_spans --bibliography=$file.bib

# pandoc -v -s $file.html -o $file.md -t markdown_github-raw_html-native_divs-native_spans-fenced_divs-bracketed_spans --bibliography=$file.bib

# pandoc -v -s $file.html -o $file.md -t markdown_github-raw_html-native_divs-native_spans-fenced_divs-bracketed_spans --bibliography=$file.bib

# mv NARK.md /tmp/NARK.md

find . -name '*bib-save*' -delete

/Volumes/Data/Tools/delete-Junk-Files-LaTeX.sh /Volumes/Data/Code/ARK/HARKive/HARK/Documentation/NARK

find . -name '*bib-save*' -delete
[[ -e .bib.bib ]] && rm -f .bib.bib

git add . ; git commit -m 'Update NARK.html on gh-pages'

git checkout master
git branch -D master-update-NARK
git checkout -b master-update-NARK

/Volumes/Data/Tools/makePDF-Portable-LaTeX-In-Subdir.sh /Volumes/Data/Code/ARK/HARKive/HARK/Documentation/NARK NARK public bib LaTeX

/Volumes/Data/Tools/delete-Junk-Files-LaTeX.sh /Volumes/Data/Code/ARK/HARKive/HARK/Documentation/NARK

mv texmf-local Resources/texmf-local
rm -Rf auto

cp LaTeX/NARK.pdf .

#cp /tmp/NARK.md NARK.md

git add . ; git commit -m 'Update NARK.pdf'
