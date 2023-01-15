Get-Process -ProcessName Teams -ErrorAction SilentlyContinue
Get-Process -ProcessName Teams | Stop-Process -Force
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\cache" | Remove-Item  -Recurse -Confirm:$false
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\blob_storage" | Remove-Item -Recurse -Confirm:$false
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\databases" | Remove-Item -Recurse -Confirm:$false
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\gpucache" | Remove-Item -Recurse -Confirm:$false
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\Indexeddb" | Remove-Item -Recurse -Confirm:$false
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\Local Storage" | Remove-Item -Recurse -Confirm:$false
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\tmp" | Remove-Item -Recurse -Confirm:$false
Start-Process -FilePath $env:LOCALAPPDATA\Microsoft\Teams\current\Teams.exe
  

  
  
  
  
  
  
