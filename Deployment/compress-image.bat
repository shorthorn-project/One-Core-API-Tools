@echo off

cls

if not exist "%~dp0Output\WIM\install.wim" (
	ECHO                           PHASE: Compressing Windows image	
	ECHO Install.wim is not exists on Output\WIM! Capture Image first.
	pause
)	

cls

if exist "%~dp0Output\WIM\install.wim" (
	ECHO                           PHASE: Compressing Windows image	
	"tools\WimLib\%ARCH%\wimlib-imagex.exe" optimize "%~dp0Output\WIM\install.wim" --compress=LZX:100
)

call copy-WIM.bat
