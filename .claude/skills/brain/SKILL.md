---
name: brain
description: Discuss any input Chris shares (X post, screenshot, news, report, video, chat) in three parts — general takeaway, effect on the general market, effect on his portfolio — and save the discussion to his New Trading Brain vault only when he says "save". Use when Chris says "/brain", shares an input to understand for trading, or says "save" / "save to brain" after such a discussion. Saved notes go to the Google Drive "Trading Brain Inbox", which a PC script syncs into the vault's "Discussion and Insights" folder whenever the PC is on.
---

# /brain — discuss, then save to New Trading Brain on "save"

Vault on Chris's PC: `C:\Users\admin\Desktop\New Obsidian\New Trading Brain`
Target folder in vault: `Discussion and Insights`
Cloud inbox (always reachable): Google Drive folder **`Trading Brain Inbox`** (My Drive root)

## Phase 1 — Discussion (always, nothing is saved)

**Start straight away.** For /brain, skip any general Goal / Context / Action / Output
questions from Chris's preferences — this skill already defines them. Ask only when the input
itself is missing or unreadable (e.g. "/brain" with no post, a blurry screenshot).

Reply in chat with exactly these three sections, in plain language:

1. **General takeaway** — what the input says and why it matters. Re-check any numbers in the
   source and say if they don't hold up. Flag unverified claims ("reportedly", single source).
2. **Effect on the general market** — Nifty/Sensex, sectors, FPI/DII flows, rupee, rates,
   commodities. Separate first-order from second-order effects, and give a timeline / trigger
   to watch.
3. **Effect on my portfolio** — go holding by holding (and watchlist / tracked theses) and say
   positive / negative / neutral and why. Get the holdings list from the Drive file
   `Trading Brain Portfolio.md` (search by title). If it's missing or looks stale, say so and
   ask Chris for his current holdings instead of guessing.

End the reply with one line: `Say "save" to add this to your Trading Brain.`
Add your own view on whether it's worth saving (per `trading-brain-save-filter`), but do not save.

Continue the discussion if Chris asks follow-ups; fold anything new into the final note.

## Phase 2 — Save (only when Chris says "save", "save it", "save to brain")

1. Build the note from the discussion (including follow-ups):

   ```markdown
   ---
   date: YYYY-MM-DD
   type: discussion-insight
   source: "<who / where>"
   tags: [<3-6 lowercase tags>]
   holdings: [<affected tickers>]
   review-by: YYYY-MM-DD   # only if time-bound
   ---

   # <Short descriptive title>

   ## Source summary
   ## General takeaway
   ## Effect on the general market
   ## Effect on my portfolio
   ## What to watch / Portfolio Alert
   ```

   Filename: `YYYY-MM-DD_Short-Topic-In-Title-Case.md` (no spaces, no `\ / : * ? " < > |`).

2. Save it:
   - Find the Drive folder: `title = 'Trading Brain Inbox' and mimeType = 'application/vnd.google-apps.folder'`.
     Create it in `root` if missing.
   - `create_file` with `parentId` = that folder, `contentMimeType: text/markdown`,
     `disableConversionToGoogleType: true`, `textContent` = the note.
   - If this session can write the vault directly (Claude on Chris's PC with the vault path
     present), write to `<vault>\Discussion and Insights\` instead and skip Drive.
   - The PC may be off — never wait for it. `Sync-TradingBrain.ps1` (logon + every 30 min)
     moves inbox notes into the vault.

3. Confirm in one line:
   `Saved → Discussion and Insights/<filename> (syncs to your PC when it's on)`
