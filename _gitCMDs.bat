:: git commads using doskey
:: Jens Spille
:: History
:: - 2020-09-17-Thu initial version
::
@echo off

cd .
set PROMPT=$G
SET PATH=%PATH%;c:\Program Files\Git

@echo on
rem Status
doskey gs=git status
doskey gl=git log --graph --pretty=format:"%%Cred%%h%%Creset -%%C(yellow)%%d%%Creset %%s %%Cgreen(%%cr) %%C(bold blue)<%%an>%%Creset" --abbrev-commit -n 16

rem add & commit use <gc with comment>
doskey ga=git add -A
doskey gc=git commit -am "$*"

rem push
doskey gp=git push

rem Git repository browser
doskey gk=gitk

doskey k=doskey /macros
doskey x=exit

@cmd.exe /K



