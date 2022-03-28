(message not sent but with useful informathion for future self)

Seb,
Now that you have removed the ancient documentation, I reworked HARK-make with the goal of putting the manual in the appropriate place and making HARK-make bit less obscure.
I succeeded in the former: https://econ-ark.github.io/HARK/Documentation/HARKmanual/
But on the latter (less obscurity) I made less progress.  It works on my machine at the moment, but relies on various quirks of my system and would not work on another machine.  
I have moved the "master" copy of HARKmanual.tex to the master branch o HARK-make/Documentation.  
Whenever we get back to the project of revising the documentation, either I'll have to modify HARK-make/makeWeb-HARKmanual-And-Contributing-To-HARK.sh to make it work on other machines, or we will have to abandon the idea of scripting a manual that works in PDF and html (probably the wiser strategy).  

Bottom line:  You don't need to do anything with HARKmanual at this point except to make sure that any links we have to it point either to the HTML version on the gh-pages branch of HARK, or to the PDF version in the master branch 
