---
name: brain
description: Capture a discussion, post, screenshot, report or chat insight into Chris's New Trading Brain vault. Use when Chris says "/brain", "save to brain", "brain this", "log this to my trading brain", or shares an input and asks to understand it and keep it for later. Explains the takeaway, applies the save filter, writes an Obsidian note to the Google Drive "Trading Brain Inbox", which a PC script syncs into the vault's "Discussion and Insights" folder whenever the PC is on.
---

# /brain — capture to New Trading Brain

Vault on Chris's PC: `C:\Users\admin\Desktop\New Obsidian\New Trading Brain`
Target folder in vault: `Discussion and Insights`
Cloud inbox (always reachable): Google Drive folder **`Trading Brain Inbox`** (My Drive root)

The PC may be off. Never wait for it. Write to the Drive inbox; the PC's
`Sync-TradingBrain.ps1` (scheduled at logon + every 30 min) moves notes into the vault.

## Steps

1. **Understand the input** (screenshot, X post, text, link, PDF, or the current chat discussion).
   Explain the takeaway to Chris in chat in plain language first. Re-check any numbers in the
   source and say if they don't hold up. Mark unverified claims ("reportedly", single source).

2. **Filter** using the `trading-brain-save-filter` rules. An explicit "save" / "/brain" always
   overrides the filter. If unsure, ask in one line: "Worth logging, or chat-only?"

3. **Write the note** (Markdown, Obsidian-friendly):

   ```markdown
   ---
   date: YYYY-MM-DD
   type: discussion-insight
   source: "<who / where>"
   tags: [<3-6 lowercase tags>]
   thesis-link: "<tracked thesis it touches, or none>"
   review-by: YYYY-MM-DD   # when this should be re-checked, if time-bound
   ---

   # <Short descriptive title>

   ## The input (summary)
   ## Core takeaway (plain language)
   ## Divergence to remember        # only if there is one
   ## How to use this for trading decisions
   ## Portfolio Alert
   ## Open questions
   ```

   Filename: `YYYY-MM-DD_Short-Topic-In-Title-Case.md` (no spaces, no `\ / : * ? " < > |`).

4. **Save**:
   - Find the Drive folder: `title = 'Trading Brain Inbox' and mimeType = 'application/vnd.google-apps.folder'`.
     Create it in `root` if missing.
   - `create_file` with `parentId` = that folder, `contentMimeType: text/markdown`,
     `disableConversionToGoogleType: true`, `textContent` = the note.
   - If this session can write the vault directly (Claude Code / Cowork on Chris's PC with the
     path above present), write to `<vault>\Discussion and Insights\` instead and skip Drive.

5. **Confirm in one line**:
   `Saved → Discussion and Insights/<filename> (queued in Drive inbox; syncs when PC is on)`
