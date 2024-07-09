$VerbosePreference = 'Continue'
Import-Module "$((Get-Location).Path)\classes.ps1" -Force



[system.Drawing.color] | Get-Member -Static -MemberType Properties | ForEach-Object {
  $color = [color]::new([System.Drawing.Color]::"$($_.Name)")
  write-host "This $($color.render("$($_.Name)",$true,$false)) a test of the color function"
}
$top = 0
$left = 0
$width = $Host.UI.RawUI.BufferSize.Width
$height = $Host.UI.RawUI.BufferSize.Height
[System.Management.Automation.Host.Rectangle]$rect = [System.Management.Automation.Host.Rectangle]::new(0,0,$Host.UI.RawUI.BufferSize.Width,$Host.UI.RawUI.BufferSize.Height)
[System.Management.Automation.Host.BufferCell[,]]$buffer = $Host.UI.RawUI.GetBufferContents($rect)
Start-Sleep -Seconds 2
Clear-Host
Start-Sleep -Seconds 2
# Restaurer le contenu capturé
$Destination = New-Object System.Management.Automation.Host.Coordinates 0, 0
$cell = [System.Management.Automation.Host.BufferCell]::new("C","White","Red","Complete")
$buffer[10,1]=$cell
$buffer[10,2]=$cell
$buffer[10,3]=$cell
$buffer[10,10].ForegroundColor = [System.ConsoleColor]::Red
$Host.UI.RawUI.SetBufferContents($Destination,$buffer)


