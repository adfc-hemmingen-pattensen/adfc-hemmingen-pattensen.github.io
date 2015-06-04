@rem Markdown to HTML
@rem Jens Spille
@rem 2015-03-01-So
@rem works with pandoc 1.13. (maked portable) and github-pandoc.css
@rem with pathes in TCC to 

@echo off
SET PATH=c:\Windows\System32\wbem\;%PATH%

IF %computername%==JENSDELL SET portpath=c:\DataJob\PortProg
IF %computername%==HANVL1134NT6164 SET portpath=c:\DataJSp\PortProg

SET PATH=%portpath%\Pandoc\;%PATH%

@rem ldt (LocalDateTime)
@rem see http://stackoverflow.com/questions/203090/how-to-get-current-datetime-on-windows-command-line-in-a-suitable-format-for-us
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j

rem echo %ldt%

set lda=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%
set lti=%ldt:~8,2%%ldt:~10,2%%ldt:~12,2%

set tempfname=index

if "%2"=="pdf" goto pdf
if exist "%~dp1z-pdf.pandoc" goto pdf

set panoptions=%panoptions% -t html5
set panoptions=%panoptions% -s
set panoptions=%panoptions% -S
set panoptions=%panoptions% -c %portpath%\Pandoc\github-pandoc.css
set panoptions=%panoptions% -M date="%lda% %lti%"
if exist "%~dp1z-toc.pandoc" set panoptions=%panoptions% --toc
if exist "%~dp1z-num.pandoc" set panoptions=%panoptions% --number-sections
if exist "%~dp1biblio.bib" set panoptions=%panoptions% --biblio  %~dp1%biblio.bib

rem  mathjax does not work together with self-contained and webtex
if not exist "%~dp1z-math.pandoc" set panoptions=%panoptions% --self-contained

rem webtex online OK with self-contained results in timeout - limited in paragraph mode
rem if not exist "%~dp1z-math.pandoc" set panoptions=%panoptions% --webtex

rem katex is newer than mathjax but still unter test
rem http://www.intmath.com/blog/mathematics/comparison-math-web-publishing-options-9915
rem if not exist "%~dp1z-math.pandoc" set panoptions=%panoptions% --katex=%portpath%\Pandoc\katex\katex.min.js

rem see more configs on http://docs.mathjax.org/en/latest/config-files.html
if exist "%~dp1z-math.pandoc" set panoptions=%panoptions% --mathjax="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

echo on

pandoc index.md -o %tempfname%.html %panoptions%

%tempfname%.html

goto end


:pdf
rem
rem PDF part
rem ========

SET PATH=%portpath%\..\PortProgFix\miktex_port\miktex\bin\;%PATH%

set panoptions=%panoptions% -s

set panoptions=%panoptions% -S
set panoptions=%panoptions% -M date="%lda% %lti%"
if exist "%~dp1z-chap.pandoc" set panoptions=%panoptions% --chapters
set panoptions=%panoptions% --number-sections
set panoptions=%panoptions% --latex-engine=xelatex
set panoptions=%panoptions% -V geometry=a4paper,left=4cm,right=3cm,top=3cm,bottom=3cm
if exist "%~dp1z-toc.pandoc" set panoptions=%panoptions% --toc
if exist "%~dp1z-num.pandoc" set panoptions=%panoptions% --number-sections
if exist "%~dp1biblio.bib" set panoptions=%panoptions% --biblio  %~dp1%biblio.bib

echo on

pandoc %1 -o %tempfname%%lda%.%lti%.pdf %panoptions%

%tempfname%%lda%.%lti%.pdf


:end

pause "WhereIsTheAnyKey"
