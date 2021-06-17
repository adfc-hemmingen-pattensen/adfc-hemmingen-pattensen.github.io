:: Start CMD with some local settings
:: Jens Spille
:: 2019-09-28
:: 2019-12-18-Mi._21h10
::
@echo off
set "fn=index"
set /p "fn=Enter file name or just ENTER for default [%fn%] : "

cd .
set PROMPT=$G
SET PATH=%PATH%;C:\DataProg\PortProg\gVimPortable
SET PATH=%PATH%;C:\DataProg\PortProg\pandoc213
SET PATH=%PATH%;C:\DataProg\PortProg\MikTexPort\texmfs\install\miktex\bin
SET PATH=%PATH%;C:\DataProg\PortProg\rscg-convert
SET PATH=%PATH%;C:\DataProg\PortProg\UnxUtil\usr\local\wbin
set PROMPT=$G

SET DT=%date%
SET TM=%time:~0,5%
for /F "delims=" %%L in ('git rev-parse --short HEAD') do (set "GID=%%L")
echo File to convert is %fn%.md. Today is %DT% %TM% with Git-ID: %GID%

:: For help - lock at https://learnbyexample.github.io/tutorial/ebook-generation/customizing-pandoc/

sed s/LetzteAenderung/%DT%_%TM%/g %fn%.md > %fn%Temp.md

@echo on
doskey s=sed s/LetzteAenderung/%DT%_%TM%/g %fn%.md $g %fn%Temp.md
doskey h=pandoc -o %fn%Temp.html %fn%Temp.md  -t html5 -s -c github-pandoc.css -M date="%DT%_%TM%" --metadata pagetitle=%fn%
doskey m=sed "s/<\/\?code>//g" %fn%Temp.html $g %fn%.html
doskey d=pandoc -o %fn%.docx %fn%Temp.md 
doskey r=pandoc -o %fn%.rst %fn%Temp.md 
doskey p=pandoc -o %fn%.pdf %fn%Temp.md -f gfm -V geometry:a4paper -V geometry:margin=2.5cm --pdf-engine=xelatex
doskey q=pandoc -o %fn%.pdf %fn%Temp.md -f gfm -V geometry:a4paper -V geometry:margin=2.5cm --pdf-engine=xelatex -H PanDocChapter_break.tex 
doskey f=%fn%.html
doskey x=exit

@cmd.exe /K



