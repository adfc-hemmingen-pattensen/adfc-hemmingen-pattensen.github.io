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
doskey gl=git log

rem add & commit use <gc "comment">
doskey ga=git add -A
doskey gc=git commit -am "$*"

rem push
doskey gp=git push

rem Git repository browser
doskey gk=gitk

doskey k=doskey /macros
doskey x=exit

@cmd.exe /K



