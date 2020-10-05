:: git commads using doskey
:: Jens Spille
:: History
:: - 2020-09-17-Thu initial version
::
@echo off

:: utf-8
chcp 65001

:: UNIX variables like LC_ALL in order to display Polish (or other UTF-8 characters) correctly.
set LC_ALL=C.UTF-8
title gitCMDs
color 0b &:: 0Black 1Blue 2Green 3Aqua 4Red 5Purple 6Yellow 7White 8Gray 9Light blue a:Light green b:Light aqua c:Light red d:Light purple e:Light yellow f:Bright white
mode con cols=140 lines=50
cd .
set PROMPT=$G
SET PATH=%PATH%;c:\Program Files\Git

rem Status 
doskey gs==echo %CD% $t git status
doskey gl=git log --graph --pretty=format:"%%Cred%%h%%Creset -%%C(yellow)%%d%%Creset %%s %%Cgreen(%%cr) %%C(bold blue)<%%an>%%Creset" --abbrev-commit -n 16

doskey ga=git add -A
doskey gc=git commit -am "$*" $t:: use gc with comment

doskey gp=git push

doskey gk=gitk $t:: Git repository browser

doskey k=doskey /macros $B sort
doskey x=exit

doskey f=C:\DataProg\PortProg\FirefoxPortable\FirefoxPortable.exe https://adfc-hemmingen-pattensen.github.io/

@echo on
doskey /macros | sort &:: Sortierte Ausgabe

@cmd.exe /K
