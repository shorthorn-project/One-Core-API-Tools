@echo off

cls

ECHO                               PHASE: Cleannig Drive

if "%setenv%" == "" (
	call setenv.bat
)

if "%letter%" == "" (
	call set-drive-letter.bat
)

cls

if not exist "%letter%:\Program Files" (
	cls
	ECHO                                PHASE: Clean Drive
	ECHO The drive is not mounted or not a Windows/Reactos compatible installation
	pause 	
	goto :EOF
)

cls

ECHO                               PHASE: Cleannig Drive

ECHO Cleanning some files from drive

del "%letter%:\Windows\OEWABLog.txt" >nul 2>nul
del "%letter%:\Windows\setuplog.txt" >nul 2>nul
del "%letter%:\Windows\SchedLgU.txt" >nul 2>nul
del "%letter%:\Windows\ntbtlog.txt" >nul 2>nul
del "%letter%:\Windows\System32\drivers\vmmouse.sys" >nul 2>nul
del "%letter%:\Windows\System32\drivers\vmusbmouse.sys" >nul 2>nul
del "%letter%:\Windows\System32\drivers\vmx_svga.sys" >nul 2>nul
del "%letter%:\Windows\System32\drivers\vmxnet.sys" >nul 2>nul
del "%letter%:\Windows\Prefetch\Layout.ini" >nul 2>nul

rmdir /s /q ""%letter%:\Windows\Panther" >nul 2>nul

rmdir /s /q ""%letter%:\Documents and Settings\Administrator" >nul 2>nul

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.TMP*"') do (
	del /q /s /a "%%A" >nul 2>nul
)

REM ECHO %letter%
for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.pnf*"') do (
	del /q /s /a /f "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.pf*"') do (
	del /q /s /a /f "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.log*" ^| findstr /v /c:"\assembly\"') do (
	del /q /s /a /f "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.old*"') do (
	del /q /s /a /f "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.bak*"') do (
	del /q /s /a /f "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.dmp*"') do (
	del /q /s /a /f "%%A" >nul 2>nul
)

for /f "tokens=*" %%A in ('dir /s /b /a "%letter%:\*.TMP*"') do (
	del /q /s /a /f "%%A" >nul 2>nul
)
