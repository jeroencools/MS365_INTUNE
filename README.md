# INTUNE
A collection of PS scripts, tools, settings, apps ... that are useful for deploying through Intune. The collection is a mix of materials I have created myself and others that I have found. When possibile, I always link to the original author, but this was not alwasys achievable. Be sure to DM me when credits are missing and I will make sure to update it.

## Scripts
You can deploy these by using the "scripts" section in Intune (https://learn.microsoft.com/en-us/mem/intune/apps/intune-management-extension).

However, if you want more options and control over how and when the scripts are deployed, it is better to use an Intunewin file (Win32 app)(https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-app-management). With this second option you can add requirements, detection rules, dependencies ... It is by far the better option, but it requires some more work (https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-prepare).
The detection rules are an extensive set of options you can configure (https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-add#step-4-detection-rules) when creating the Win32 app. It allows for detection scripts and manual rules (such as: does a certain file exist? Does a certain registry entry exist or does it have a certain value? ...). When your script doesn't add files or change the registry, you can always manually add it to your script. For example:

            New-Item -Path  HKCU:\PATHTONEWENTRY
            Get-Item -Path HKCU:\PATHTONEWENTRY  | New-ItemProperty -Name NEWNAME -Value 1

You can then use this new entry / value in your detection rules. If you adjust your script, you can also very easily adjust this value (and avoid conflicts in your detection rules).

Another option is to use remediations (https://learn.microsoft.com/en-us/mem/intune/fundamentals/remediations).
