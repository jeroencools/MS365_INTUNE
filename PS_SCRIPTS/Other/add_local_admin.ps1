# execute on device locally by elevating a PowerShell session
$user = (Get-WmiObject -Class Win32_ComputerSystem).UserName.Split('\')[1]
net localgroup Administrators /add "AzureAD\$user"

################

# can be executed through Intune admin center
# net localgroup Administrators /add "AzureAD\<UPN>"
