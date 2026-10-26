<#
  Moves notes queued in the Google Drive "Trading Brain Inbox" into the
  Obsidian vault's "Discussion and Insights" folder.
  Drive is only a waiting room: each file is deleted from the inbox once a verified copy
  is in the vault, so nothing piles up in Drive. A name clash with different content
  gets a -1, -2 ... suffix instead of overwriting.
#>
param(
    [string]$InboxPath = 'G:\My Drive\Trading Brain Inbox',
    [string]$VaultPath = 'C:\Users\admin\Desktop\New Obsidian\New Trading Brain',
    [string]$TargetFolder = 'Discussion and Insights'
)

$ErrorActionPreference = 'Stop'
$logDir = Join-Path $env:LOCALAPPDATA 'TradingBrainSync'
New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$log = Join-Path $logDir 'sync.log'
function Write-Log($msg) { "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  $msg" | Add-Content -Path $log }

# Google Drive for Desktop may not be mounted yet right after logon; the next scheduled run retries.
if (-not (Test-Path -LiteralPath $InboxPath)) { Write-Log "Inbox not available: $InboxPath"; exit 0 }
if (-not (Test-Path -LiteralPath $VaultPath)) { Write-Log "Vault not found: $VaultPath"; exit 1 }

$dest = Join-Path $VaultPath $TargetFolder
New-Item -ItemType Directory -Force -Path $dest | Out-Null

# Older versions kept backups in Inbox\_synced; the vault copy is the record now.
$legacy = Join-Path $InboxPath '_synced'
if (Test-Path -LiteralPath $legacy) { Remove-Item -LiteralPath $legacy -Recurse -Force; Write-Log "Removed legacy $legacy" }

$files = Get-ChildItem -LiteralPath $InboxPath -File | Where-Object { $_.Name -notlike '~*' -and $_.Name -notlike '.*' }
foreach ($f in $files) {
    try {
        $srcHash = (Get-FileHash -LiteralPath $f.FullName).Hash
        $target = Join-Path $dest $f.Name
        $n = 1
        while (Test-Path -LiteralPath $target) {
            if ((Get-FileHash -LiteralPath $target).Hash -eq $srcHash) { break }  # already synced
            $target = Join-Path $dest ("{0}-{1}{2}" -f $f.BaseName, $n++, $f.Extension)
        }
        if (-not (Test-Path -LiteralPath $target)) { Copy-Item -LiteralPath $f.FullName -Destination $target }
        if ((Get-FileHash -LiteralPath $target).Hash -ne $srcHash) { throw "hash mismatch after copy" }

        Remove-Item -LiteralPath $f.FullName
        Write-Log "Synced $($f.Name) -> $target"
    } catch {
        Write-Log "FAILED $($f.Name): $_"
    }
}
