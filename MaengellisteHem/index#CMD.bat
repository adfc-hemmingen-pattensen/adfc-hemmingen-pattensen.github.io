:: Start CMD with some local settings
:: Jens Spille
:: 2019-09-28 
@cd .
@set PROMPT=$G
@SET PATH=%PATH%;C:\DataProg\PortProg\PortableApps\gVimPortable
@SET PATH=%PATH%;C:\DataProg\PortProg\PortableApps\pandoc213
@SET PATH=%PATH%;C:\DataProg\MikTexPort\texmfs\install\miktex\bin
@SET PATH=%PATH%;C:\DataProg\PortProg\PortableApps\rscg-convert
@SET PATH=%PATH%;C:\DataProg\PortProg\PortableApps\UnxUtil\usr\local\wbin
@SET DT=%date%
@SET TM=%time:~0,5%
@echo Today is %DT% %TM%
@echo .
@echo For help - lock at https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/
@echo .
@echo Use
@echo " gVimPortable index.md
@echo " sed s/LetzteAenderung/%DT%_%TM%/g index.md >indexTemp.md
@echo HTML" pandoc -o index.html indexTemp.md -t html5 -s -c ..\github-pandoc.css -M date="%DT%_%TM%" --metadata pagetitle=Maengelliste
@echo PDF_" pandoc -o index.pdf indexTemp.md -f gfm -H PanDocChapter_break.tex -V geometry:a4paper -V geometry:margin=2.5cm --pdf-engine=xelatex
@echo DOCX" pandoc -o index.docx indexTemp.md
@echo " git commit -am "
@echo " git push
@echo .
@cmd.exe /K



