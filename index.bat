@rem Markdown to HTML
@rem Jens Spille
@rem 2015-06-07-So 2017-12-04-Mo_17h11
@rem works with pandoc 1.13. (maked portable) and github-pandoc.css

set tempfname=%~n0

@echo off

call getisodatetime.bat

rem path to pandoc
rem ==============
SET portpath=C:\DataProg\PortProg\PortableApps
IF %computername%==JENSDELL SET portpath=C:\DataProg\PortProg\PortableApps
SET PATH=%portpath%\Pandoc\;%PATH%
Set PATH=%portpath%\UnxUtil\usr\local\wbin\;%Path%

rem replace tschuess mit Datum
rem ==========================
sed s/tschuess/%lda%-%lti%/g %tempfname%.mkd >%tempfname%.tmp

rem set pandoc options
rem ===================
set panoptions=%panoptions% -t html5
set panoptions=%panoptions% -s
set panoptions=%panoptions% -S
set panoptions=%panoptions% -c github-pandoc.css
set panoptions=%panoptions% -M date="%lda% %lti%"
rem set panoptions=%panoptions% --toc
rem set panoptions=%panoptions% --number-sections

rem run pandoc mkd to html
rem =====================
echo on
pandoc %tempfname%.tmp -o %tempfname%.html %panoptions%

start %tempfname%.html
