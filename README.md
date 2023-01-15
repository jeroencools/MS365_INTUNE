# PS_INTUNE_SCRIPTS
A collection of PS scripts that are useful for deploying through Intune. You can deploy these by using the "scripts" section in Intune (https://learn.microsoft.com/en-us/mem/intune/apps/intune-management-extension). 
However, if you want more options and control over how and when the scripts are deployed, it is better to use an Intunewin file (Win32 app)(https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-app-management). With this second option you can add requirements, detection rules, dependencies ... It is by far the better option, but it requires some more work (https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-prepare).
The detection rules are an extensive set of options you can configure (https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-add#step-4-detection-rules) when creating the Win32 app. It allows for detection scripts and manual rules (such as: does a certain file exist? Does a certain registry entry exist or does it have a certain value? ...). When your script doesn't add files or change the registry, you can

### Set_Lockscreen.ps1

This script will set a lock screen that standard users will not be able to change. The only thing you need to change in the scripts is the "$url" value with a link to an image. This can be an online source or a shared file in the same network. The script downloads the image, places it in a folder (C:\MDM) on the device and then sets the lock screen.


### Add_URL_Shortcut.ps1

You can quickly add a shortcut (on desktop by default) to a certain website by usin this script. The only values you need to adjust is the name of the shortcut and the link to the website. Of course you can always choose another path to add a shortcut or add more than one by changing the script.


### clear_teams.ps1

This script will clear the cache and temporary files that MS Teams uses. This can be used to get a "fresh start" when some of these files are causing errors, slowdowns ... 
