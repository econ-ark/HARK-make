(TeX-add-style-hook
 "HARKmanual"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("econtex" "12pt" "titlepage" "letterpaper")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "econtex"
    "econtex12"
    "econtexSetup"
    "econtexShortcuts"
    "graphicx"
    "hyperref")
   (TeX-add-symbols
    "E")
   (LaTeX-add-labels
    "sec:Introduction"
    "sec:GettingStarted"
    "sec:StructureOfHARK"
    "sec:OtherResources"
    "sec:GeneralPurposeTools"
    "sec:HARKcore"
    "sec:HARKutilities"
    "sec:HARKinterpolation"
    "sec:HARKsimulation"
    "sec:HARKestimation"
    "sec:HARKparallel"
    "sec:Microeconomics"
    "sec:AttributesOfAnAgentType"
    "sec:UniversalSolver"
    "sec:OtherMethods"
    "sec:PerfectForesight"
    "sec:Macroeconomics"
    "sec:DownOnTheFarm"
    "sec:AttributesOfAMarket"
    "sec:FashionVictim"
    "sec:ContributingToHARK"
    "sec:WhatDoesHARKWant"
    "sec:GitHub"
    "sec:SubmissionApprovalProcess"
    "sec:NamingConventions"
    "sec:DocumentationConventions"
    "sec:FutureOfHARK"
    "sec:FutureTools"
    "sec:FutureModels"
    "sec:BountyHunting"
    "sec:AllAboardTheArk"))
 :latex)

