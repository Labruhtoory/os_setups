
#!/bin/bash

subl readme.txt
cp /opt/notes/pen_notes_template.ctb* .
mv pen_notes_template.ctb notes.ctb
mv pen_notes_template.ctb~ notes.ctb~
mv pen_notes_template.ctb~~ notes.ctb~~
mv pen_notes_template.ctb~~~ notes.ctb~~~
cherrytree notes.ctb
subl readme.txt
subl /opt/notes/report-template-1.0.txt
subl /opt/notes/revshells.txt
subl /opt/notes/revshellls2.0.txt
subl /opt/notes/koth-specific/metwis-lin.txt
subl /opt/notes/koth-specific/metwis-win.txt
mkdir recon
mkdir enum
mkdir exploitation
