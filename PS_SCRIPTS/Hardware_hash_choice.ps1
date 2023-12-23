Write-Host "This script automatically collects the necessary info (Serial number, Windows product ID, Hardware hash, group tag) and add a device to autopilot."
Write-Host "When executed, you need to login using an account that has Intune Administrator or Policy and Profile Manager permissions."

$choice1 = "GROUPTAG1 - replace with own"
$choice2 = "GROUPTAG2 - replace with own"
$choice3 = "GROUPTAG3 - replace with own"

Write-Host ""`n""`n"1 = $choice1 "`n"2 = $choice2 "`n"3 = $choice3"
$grouptag = Read-Host "Group tag to use?"

switch ($grouptag)
{
    1 {$grouptag = "$choice1"}
    2 {$grouptag = "$choice2"}
    3 {$grouptag = "$choice3"}
}

Write-Host = "Collecting the necessary information... Adding the device with the following group tag:" $grouptag

Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
Install-Script -Name Get-WindowsAutopilotInfo
Get-WindowsAutopilotInfo -GroupTag $grouptag -Online 
