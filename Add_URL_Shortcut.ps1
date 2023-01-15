$Shell = New-Object -ComObject ("WScript.Shell")
$Favorite = $Shell.CreateShortcut($env:USERPROFILE + "\Desktop\NAMEOFSHORTCUT.url")
$Favorite.TargetPath = "LINK TO WEBSITE"
$Favorite.Save()
