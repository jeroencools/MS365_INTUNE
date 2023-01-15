# PS_INTUNE_SCRIPTS
A collection of PS scripts that are useful for deploying through Intune.


### Set_Lockscreen.ps1

This script will set a lock screen that standard users will not be able to change. The only thing you need to change in the scripts is the "$url" value with a link to an image. This can be an online source or a shared file in the same network. The script downloads the image, places it in a folder (C:\MDM) on the device and then sets the lock screen.


### Add_URL_Shortcut.ps1

You can quickly add a shortcut (on desktop by default) to a certain website by usin this script. The only values you need to adjust is the name of the shortcut and the link to the website. Of course you can always choose another path to add a shortcut or add more than one by changing the script.
