@echo off

if "%setenv%" == "" (
	call setenv.bat
)

if "%letter%" == "" (
	if "%noMountedDrive%" == "" (
		call set-drive-letter.bat
	)
)

if "%flags%" == "" (
	call sku-selection-method.bat
)

cls

ECHO                                PHASE: Appending image
	"%imagex%" /append /flags "%flags%" %letter%: "%~dp0Output\WIM\install.wim" "%Description%" "%Description%"

call compress-image.bat
