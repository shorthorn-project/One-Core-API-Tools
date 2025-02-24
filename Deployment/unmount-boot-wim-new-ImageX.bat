@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

ECHO                     PHASE: UnMounting Boot WIM Image

if exist "Sources\DVD\sources\boot.wim" (
	REM Unmount and commit changes Windows PE Setup Image  	
	"%imagex%" /unmount /commit Boot\teste
)