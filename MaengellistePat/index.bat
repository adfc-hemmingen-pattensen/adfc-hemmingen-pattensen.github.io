@rem Markdown to HTML
@rem Jens Spille
@rem 2019-09-21 11:20 
@rem works with pandoc 2.13. (maked portable) and github-pandoc.css

set tempfname=%~n0

@echo off

call ..\getisodatetime.bat

rem path to pandoc
rem ==============
SET portpath=C:\DataProg\PortProg\PortableApps
IF %computername%==JENSDELL SET portpath=C:\DataProg\PortProg\PortableApps
SET PATH=%portpath%\pandoc213\;%PATH%
Set PATH=%portpath%\UnxUtil\usr\local\wbin\;%Path%

rem replace tschuess mit Datum
rem ==========================
sed s/LetzteAenderung/%lda%-%lti%/g %tempfname%.md >%tempfname%.tmp2

rem set pandoc options
rem ===================
set panoptions=%panoptions% -t html5
set panoptions=%panoptions% -s
rem set panoptions=%panoptions% -S
set panoptions=%panoptions% -c ..\github-pandoc.css
set panoptions=%panoptions% -M date="%lda% %lti%"
rem set panoptions=%panoptions% --toc
rem set panoptions=%panoptions% --number-sections

rem run pandoc md to html
rem =====================
echo on
pandoc %tempfname%.tmp2 -o %tempfname%.html %panoptions%
del %tempfname%.tmp2 

start %tempfname%.html
