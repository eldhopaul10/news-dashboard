<#
  Registers a Windows scheduled task that runs Sync-TradingBrain.ps1
  2 minutes after logon and every 30 minutes while the PC is on.
  Run once from PowerShell:  powershell -ExecutionPolicy Bypass -File .\Install-SyncTask.ps1
#>
param([string]$InboxPath = 'G:\My Drive\Trading Brain Inbox')

$script = Join-Path $PSScriptRoot 'Sync-TradingBrain.ps1'
$action = New-ScheduledTaskAction -Execute 'powershell.exe' `
    -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$script`" -InboxPath `"$InboxPath`""

$atLogon = New-ScheduledTaskTrigger -AtLogOn -User $env:USERNAME
$atLogon.Delay = 'PT2M'
$every30 = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 30)

$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

Register-ScheduledTask -TaskName 'TradingBrainSync' -Action $action -Trigger $atLogon, $every30 `
    -Settings $settings -Description 'Sync Drive "Trading Brain Inbox" into the Obsidian vault' -Force
Write-Host 'Installed. Running a first sync now...'
Start-ScheduledTask -TaskName 'TradingBrainSync'
