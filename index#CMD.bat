:: Start CMD with some local settings
:: Jens Spille
:: 2019-09-28
:: 2019-12-18-Mi._21h10
:: 2020-02-06-Do.
::
@echo off
set "fn=index"
set /p "fn=Enter file name or just ENTER for default [%fn%.md] : "

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

doskey ed=gVimPortable %fn%.md
doskey sed=sed s/tschuess/%DT%_%TM%/g %fn%.md $g %fn%Temp.md
doskey html=pandoc -o %fn%.html %fn%Temp.md -t html5 -s -c github-pandoc.css -M date="%DT%_%TM%" --metadata pagetitle=%fn% -F mermaid-filter.cmd
doskey docx=pandoc -o %fn%.docx %fn%Temp.md
doskey pdf=pandoc -o %fn%.pdf %fn%Temp.md -f gfm -H PanDocChapter_break.tex -V geometry:a4paper -V geometry:margin=2.5cm --pdf-engine=xelatex
doskey show=%fn%.html
doskey ga=git add .
doskey gc=git commit -am $*
doskey gp=git push
doskey ex=exit

@echo on
doskey /MACROS
@cmd.exe /K
