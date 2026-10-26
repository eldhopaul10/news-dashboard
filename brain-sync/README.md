# Trading Brain sync

```
Phone / web / any Claude chat ──/brain──▶ Google Drive "Trading Brain Inbox"
                                                  │  (waits while PC is off)
PC logon / every 30 min ── Sync-TradingBrain.ps1 ─┘
        ▼
C:\Users\admin\Desktop\New Obsidian\New Trading Brain\Discussion and Insights\
```

## One-time PC setup (Windows)

1. Install **Google Drive for Desktop** and sign in as chrispaul292@gmail.com.
   Check the inbox shows up at `G:\My Drive\Trading Brain Inbox`
   (if your Drive letter or folder differs, pass `-InboxPath` below).
   Right-click the folder → **Offline access → Available offline** (optional, makes sync faster).
2. Copy the `brain-sync` folder somewhere permanent, e.g. `C:\Users\admin\TradingBrainSync\`.
3. In PowerShell, from that folder:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\Install-SyncTask.ps1
   # or with a custom inbox path:
   powershell -ExecutionPolicy Bypass -File .\Install-SyncTask.ps1 -InboxPath 'H:\My Drive\Trading Brain Inbox'
   ```
4. Log: `%LOCALAPPDATA%\TradingBrainSync\sync.log`.

Synced originals are kept in `Trading Brain Inbox\_synced` on Drive as a backup.

## Using /brain everywhere

- **Claude Code in this repo:** `/brain` is available from `.claude/skills/brain/SKILL.md`.
- **Claude app (phone / web):** zip the `.claude/skills/brain` folder and upload it in
  claude.ai → Settings → Capabilities → Skills. Share any input with "/brain" to get takeaway / market effect / portfolio effect, then say "save" to store it.
  Google Drive must be connected (it already is).
