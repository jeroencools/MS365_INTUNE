<#
This script configures an option that prompts the user (even admin) to enter his or her user name and password (or another valid admin) when an operation requires elevation of privilege.
This is by far a comprehensive security measure, but it can be useful in situations where, for example, students try to install software on unattended computers.
There are far better options to increase security, so please view this as a simple option to configure for "low-hanging fruit".
#>

# Set variables to indicate value and key to set
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
$Name = 'ConsentPromptBehaviorAdmin'
$Value = '2'

# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
New-Item -Path $RegistryPath -Force | Out-Null
}

# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force 
