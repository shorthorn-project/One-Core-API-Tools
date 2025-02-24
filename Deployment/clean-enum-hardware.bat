@echo off

cls

if "%setenv%" == "" (
	call setenv.bat
)

if "%letter%" == "" (
	call set-drive-letter.bat
)

ECHO                     PHASE: Cleannig Hardware Infomation Drive

reg load HKLM\TempSytem "%letter%:\Windows\System32\config\system" >nul
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum" -ot reg -actn setowner -ownr n:Administrators
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum" -ot reg -actn ace -ace "n:Administrators;p:full"
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum" -ot reg -actn setowner -ownr n:Administrators
REM "%~dp0tools\SetAcl\SetACL.exe" -on "HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum" -ot reg -actn ace -ace "n:Administrators;p:full"
REM "%~dp0tools\SetAcl\subinacl\subinacl.exe" /keyreg HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum /grant=Administrators

reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\ACPI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\BTH /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\HID /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\HTREE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\IDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\ISAPNP /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\LEGACY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\PCI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\PCIIDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\Root\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\Root\COMPOSITE_BATTERY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\STORAGE /f
REM reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\SW /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Enum\USB /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\ACPI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\BTH /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\HID /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\HTREE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\IDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\ISAPNP /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\LEGACY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\PCI /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\PCIIDE /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\Root\ACPI_HAL /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\Root\COMPOSITE_BATTERY /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\STORAGE /f
REM reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\SW /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Enum\USB /f

REM Delete vmware services
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Services\VMAUDIO /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Services\vmci /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Services\vmmouse /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Services\vmusbmouse /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Services\vmx_svga /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Services\vmxnet /f

reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Services\VMAUDIO /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Services\vmci /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Services\vmmouse /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Services\vmusbmouse /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Services\vmx_svga /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Services\vmxnet /f

REM Delete entire Video Key
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet001\Video /f
reg delete HKEY_LOCAL_MACHINE\TempSytem\ControlSet002\Video /f

REM Add defaults keys to Video
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "vga\0framebuf\0vga256\0vga64k" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\0000" /v "VgaCompatible" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\0000" /v "HardwareInformation.Crc32" /t REG_BINARY /d "47dc94b9" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\Video" /v "Service" /t REG_SZ /d "VgaSave" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "mnmdd" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "Device Description" /t REG_SZ /d "NetMeeting driver" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "VgaCompatible" /t REG_DWORD /d "0" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "MirrorDriver" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0001" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\Video" /v "Service" /t REG_SZ /d "mnmdd" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "vga\0framebuf\0vga256\0vga64k" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "VgaCompatible" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "Acceleration.Level" /t REG_DWORD /d "5" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "Device Description" /t REG_SZ /d "Standard VGA Graphics Adapter" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "DefaultSettings.XResolution" /t REG_DWORD /d "1024" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "DefaultSettings.YResolution" /t REG_DWORD /d "768" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.Crc32" /t REG_BINARY /d "47dc94b9" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.ChipType" /t REG_BINARY /d "56004500530041002f0053005600470041000000" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.DacType" /t REG_BINARY /d "49006e007400650072006e0061006c000000" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.MemorySize" /t REG_BINARY /d "00004000" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.AdapterString" /t REG_BINARY /d "56004500530041002d0043006f006d00700061007400690062006c006500200044006900730070006c0061007900200041006400610070007400650072000000" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.BiosString" /t REG_BINARY /d "560045005300410074006d002000420049004f0053000000" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0001" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\Video" /v "Service" /t REG_SZ /d "vga" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "Device Description" /t REG_SZ /d "RDPDD Chained DD" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "RDPDD" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "MirrorDriver" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "VgaCompatible" /t REG_DWORD /d "0" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0001" /f
reg add "HKLM\TempSytem\ControlSet001\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\Video" /v "Service" /t REG_SZ /d "RDPCDD" /f

reg add "HKLM\TempSytem\ControlSet002\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "vga\0framebuf\0vga256\0vga64k" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\0000" /v "VgaCompatible" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\0000" /v "HardwareInformation.Crc32" /t REG_BINARY /d "47dc94b9" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{23A77BF7-ED96-40EC-AF06-9B1F4867732A}\Video" /v "Service" /t REG_SZ /d "VgaSave" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "mnmdd" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "Device Description" /t REG_SZ /d "NetMeeting driver" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "VgaCompatible" /t REG_DWORD /d "0" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0000" /v "MirrorDriver" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\0001" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{8B6D7859-A639-4A15-8790-7161976D057A}\Video" /v "Service" /t REG_SZ /d "mnmdd" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "vga\0framebuf\0vga256\0vga64k" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "VgaCompatible" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "Acceleration.Level" /t REG_DWORD /d "5" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "Device Description" /t REG_SZ /d "Standard VGA Graphics Adapter" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "DefaultSettings.XResolution" /t REG_DWORD /d "1024" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "DefaultSettings.YResolution" /t REG_DWORD /d "768" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.Crc32" /t REG_BINARY /d "47dc94b9" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.ChipType" /t REG_BINARY /d "56004500530041002f0053005600470041000000" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.DacType" /t REG_BINARY /d "49006e007400650072006e0061006c000000" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.MemorySize" /t REG_BINARY /d "00004000" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.AdapterString" /t REG_BINARY /d "56004500530041002d0043006f006d00700061007400690062006c006500200044006900730070006c0061007900200041006400610070007400650072000000" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0000" /v "HardwareInformation.BiosString" /t REG_BINARY /d "560045005300410074006d002000420049004f0053000000" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\0001" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{C43A72E8-3C1E-11EF-9581-806D6172696F}\Video" /v "Service" /t REG_SZ /d "vga" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "Device Description" /t REG_SZ /d "RDPDD Chained DD" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "InstalledDisplayDrivers" /t REG_MULTI_SZ /d "RDPDD" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "MirrorDriver" /t REG_DWORD /d "1" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "VgaCompatible" /t REG_DWORD /d "0" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0001" /f
reg add "HKLM\TempSytem\ControlSet002\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\Video" /v "Service" /t REG_SZ /d "RDPCDD" /f


reg unload HKLM\TempSytem >nul	