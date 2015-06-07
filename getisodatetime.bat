@rem Get Iso Date and Time for DOS
@rem Jens Spille
@rem 2015-06-07-So

@echo off
SET PATH=c:\Windows\System32\wbem\;%PATH%

@rem ldt (LocalDateTime)
@rem see http://stackoverflow.com/questions/203090/how-to-get-current-datetime-on-windows-command-line-in-a-suitable-format-for-us
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j

rem echo %ldt%

set lda=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%
rem set lti=%ldt:~8,2%%ldt:~10,2%%ldt:~12,2%
set lti=%ldt:~8,2%h%ldt:~10,2%

echo %lda% - %lti%
