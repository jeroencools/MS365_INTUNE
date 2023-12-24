<#
A simple script that disables (or enables) fastboot. This was used because there were some issues with our wireless adapter drivers when fastboot was enabled.
#>

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d "0" /f
