
# Remotely Invoke:
# $ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/VonKrieghoff/Powershell-0365/main/Mouse%20Mover.ps1
# Invoke-Expression $($ScriptFromGithHub.Content)
# $ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/VonKrieghoff/Powershell-0365/main/Mouse%20Mover.ps1; Invoke-Expression $($ScriptFromGithHub.Content)

# Known issues:
# - On Linux Nano editor it opens when triggers SCROLLLOCK key



cls
    Write-Output "










              __     __
             /  \~~~/  \
       ,----(     ..    )
      /      \__     __/
     /|         (\  |(       Mouse is Running 
    ^ \   /___\  /\_|        I am Hiding 
       |__|   |__|           https://github.com/VonKrieghoff/

    "




Add-Type -AssemblyName System.Windows.Forms

while ($true)
{
  #Get position
  $Positon = [System.Windows.Forms.Cursor]::Position
  #Edit Position
  $x = $Positon.X + 1
  $y = $Positon.Y + 1
  #Send Mouse to new position
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  #Write where is mouse
  $date = Get-Date
  Write-Progress -CurrentOperation "Waiting for new mouse position" ("   $date - Mouse is now in position X: $X | Y: $Y")
  #Write-Output "   $date - Mouse is now in positon X: $X | Y: $Y"
  
  # Pressign ScrollLock on Keyboard:
  $WShell = New-Object -com "Wscript.Shell"
  $WShell.sendkeys("{SCROLLLOCK}")
  #$WShell.sendkeys("{CAPSLOCK}")  #Will blink more lights on Keyboard, but is litTle bit annoying :)   
  # Waiting 100ms and pressing again:
  Start-Sleep -Milliseconds 100
  $WShell.sendkeys("{SCROLLLOCK}")
  #$WShell.sendkeys("{CAPSLOCK}")  #Will blink more lights on Keyboard, but is litTle bit annoying :)    
  
  
# Change Settings
# Set default Browser Edge
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice' -Name ProgId -Value 'MSEdgeHTM'
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -Name ProgId -Value 'MSEdgeHTM'
  
  
  
  
  
  # Waiting 5s and doing everything all over.  
  Start-Sleep -Seconds 15
}
