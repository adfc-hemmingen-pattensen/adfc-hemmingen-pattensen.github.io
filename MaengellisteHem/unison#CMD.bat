:: Start CMD with some local settings
:: Jens Spille
:: 2019-09-29 
@cd .
@set PROMPT=$G
@SET PATH=%PATH%;c:\DataProg\PortProg\Unison\bin\unison
@SET PATH=%PATH%;c:\DataProg\PortProg\Unison\Lib\GTK\bin
@SET PATH=%PATH%;C:\DataProg\PortProg\gVimPortable
@SET UNISON=%~dp0.\unison
@SET DT=%date%
@SET TM=%time:~0,5%
@echo UNISON Path is set to: %UNISON%
@echo Today is %DT% %TM% 
@echo .
@echo 1. Create unison\default.prf e.g.
@echo ## roots
@echo root = %~dp0.
@echo root = remote\path
@echo #
@echo ## for mirroring
@echo #force=%~dp0. 
@echo #
@echo ## ignore
@echo ignore = Path unison/*
@echo ignore = Name unison#CMD.bat
@echo ignore = Name .git
@echo #
@echo ## ignornot
@echo ignorenot = Path unison/{default.prf}
@echo #
@echo ## For FAT systems set perms=0, ignorecase=true, links=false, never use
@echo ## chmod: Use this when syncing against a FAT-disk.
@echo #fat = true
@echo #fastcheck=true
@echo # 
@echo ## place new files at the top of the list
@echo sortnewfirst = true
@echo #
@echo ## prevent unison from prompting the user
@echo #batch=true
@echo .
@echo 2. Use
@echo - mkdir unison
@echo - gVimPortable unison\default.prf
@echo - unison default
@echo .
doskey uu=unison default
@cmd.exe /K



