# Install the Microsoft Graph module if not already installed
# Install-Module Microsoft.Graph

# Define device

$deviceName = "DEVICENAME"

# Authenticate
Connect-MgGraph -Scopes "DeviceManagementServiceConfig.ReadWrite.All", "DeviceManagementManagedDevices.PrivilegedOperations.All", "Device.ReadWrite.All"

# Get the device from Intune to find serial number
$intuneDevices = Get-MgDeviceManagementManagedDevice
$intuneDevice = $intuneDevices | Where-Object { $_.DeviceName -eq $deviceName }

if ($intuneDevice) {
    $serialNumber = $intuneDevice.SerialNumber

    # Get the device from Autopilot using serial number
    $autopilotDevices = Get-MgDeviceManagementWindowsAutopilotDeviceIdentity
    $autopilotDevice = $autopilotDevices | Where-Object { $_.SerialNumber -eq $serialNumber }

    if ($autopilotDevice) {
        $autopilotDeviceId = $autopilotDevice.Id
        # Remove the device from Autopilot
        Remove-MgDeviceManagementWindowsAutopilotDeviceIdentity -WindowsAutopilotDeviceIdentityId $autopilotDeviceId -Confirm:$false
        Write-Host "Device removed from Autopilot"
    } else {
        Write-Host "Device not found in Autopilot"
    }

    $intuneDeviceId = $intuneDevice.Id
    # Remove the device from Intune
    Remove-MgDeviceManagementManagedDevice -ManagedDeviceId $intuneDeviceId -Confirm:$false
    Write-Host "Device removed from Intune"

    # Get the device from Entra ID using serial number
    $entraDevices = Get-MgDevice
    $entraDevice = $entraDevices | Where-Object { $_.DisplayName -eq $deviceName }

    if ($entraDevice) {
        $entraDeviceId = $entraDevice.Id
        # Remove the device from Entra ID
        Remove-MgDevice -DeviceId $entraDeviceId -Confirm:$false
        Write-Host "Device removed from Entra ID"
    } else {
        Write-Host "Device not found in Entra ID"
    }
} else {
    Write-Host "Device not found in Intune"
}

# Disconnect the session
Disconnect-MgGraph
