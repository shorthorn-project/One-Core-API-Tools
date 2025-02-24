@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO                   PHASE: Mounting Boot WIM Image

if exist "Sources\DVD\sources\boot.wim" (
	REM Mount Windows PE Setup Image  
	"%imagex%" /mountrw "Sources\DVD\sources\boot.wim" 2 %~dp0Boot\teste
)

timeout 3 > NUL