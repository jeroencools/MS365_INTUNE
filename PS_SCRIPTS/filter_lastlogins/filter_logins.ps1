<# 
This script retrieves the last logins for an Intune device. Simply enter the correct device name when running the script and enter how many recent logins you would like to export.
#>

# Install the Microsoft Graph PowerShell module if not already installed
# Install-Module Microsoft.Graph -Scope CurrentUser

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "AuditLog.Read.All"

# Input the device name
$deviceName = Read-Host -Prompt "Enter the device name"

# Input the number of logins to export or "all" for everything
$loginCount = Read-Host -Prompt "Enter the number of last logins to export or 'all' for everything"

# Retrieve all sign-in logs and filter by device name
$signIns = Get-MgAuditLogSignIn -Filter "deviceDetail/displayName eq '$deviceName'" -All

if ($signIns) {
    # If the user specified a number, take the last N logins
    if ($loginCount -ne "all") {
        $loginCount = [int]$loginCount
        $signIns = $signIns | Sort-Object CreatedDateTime -Descending | Select-Object -First $loginCount
    }

    # Export the result to a CSV file in the script's root directory
    $signIns | Select-Object UserPrincipalName, CreatedDateTime | Export-Csv -Path "$PSScriptRoot\Logins.csv" -NoTypeInformation
    Write-Host "Login records have been exported to Logins.csv"
} else {
    Write-Host "No login records found for the specified device."
}
