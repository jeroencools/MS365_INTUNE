<#
You can quickly add a shortcut (on desktop by default) to a certain website by usin this script. 
The only values you need to adjust is the name of the shortcut and the link to the website. 
Of course you can always choose another path to add a shortcut or add more than one by changing the script.
#>
 
$Shell = New-Object -ComObject ("WScript.Shell")
$Favorite = $Shell.CreateShortcut($env:USERPROFILE + "\Desktop\NAMEOFSHORTCUT.url")
$Favorite.TargetPath = "LINK TO WEBSITE"
$Favorite.Save()
