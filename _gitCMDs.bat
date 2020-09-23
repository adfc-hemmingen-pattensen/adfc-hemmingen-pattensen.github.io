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

@echo on
doskey /macros | sort

@cmd.exe /K
