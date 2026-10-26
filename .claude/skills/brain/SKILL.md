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
   positive / negative / neutral and why, biggest allocation first. Use the "Holdings source"
   section below; never guess holdings.

### Holdings source (combined family portfolio, live prices)

Google Sheet **"For Chris - Combined Portfolio Tracker (Sunisha + Ancy + Chris)"**,
ID `1n9HApwLwpA2ZcP4Yfbr40a7YuXqD8fj5qZen8c0kiFs`, tab `Portfolio Tracker`.

- Read `'Portfolio Tracker'!A4:K17` — the COMBINED PORTFOLIO table (% Allocation, Stock Code,
  Qty, Avg Price, Invested, Current Rate, Current Value, Days Held, Net Change %, P&L, Sector).
  Rows labelled `Total ...` are totals, not holdings. URNJ is a US ETF (USD).
- To label whose account a stock sits in, read `'Portfolio Tracker'!A19:K60` (sections
  "Chris - Geojit", "Chris US HOLDINGS", "ANCY (PLN487)", "SUNISHA (IFX877)") and tag each
  stock, e.g. `ENTERO (Ancy + Sunisha)`.
- Exclude the `Swing & Satellite` tab unless Chris asks about those stocks.
- Also weigh tracked theses (commodity super-cycle, Water/Energy, ENTERO/URBANCO moat,
  Rally-Attempt phase, cross-border liquidity flow).
- If the sheet can't be read, say so and ask Chris for holdings.
- **No one in the family uses MTF / margin.** All holdings are fully paid, so margin-call or
  forced-selling risk never applies to them; leverage news matters only through market-wide
  price pressure. Don't ask about margin.

### Thesis scorecard check (every discussion)

Google Sheet **"Trading Brain Thesis Scorecard"**, ID `1wmIqDvaLSC78lIUS290qimsc1szqVBZ46xJi07BYbt0`.
- `Summary!A1:F6` — per thesis: Positives (90d), Negatives (90d), Net, All-time, Status
  (OK / WATCH / WARN). `Evidence!A:G` — Date, Thesis, Signal, Evidence, Affects, Source, Vault note.
- After section 3, add a short **Thesis check** block: for each thesis this input touches, list
  the new evidence as Positive or Negative, and show the current tally and status *including*
  this input (e.g. `Commodity super-cycle: 2+ / 2- -> WATCH`).
- **Warn loudly** at the top of the reply (`⚠ Thesis warning: ...`) if this input would push any
  thesis to WATCH or WARN, or if a thesis it touches already is. Any thesis at WARN is always
  mentioned, even if unrelated. Say which holdings ride on that thesis.
- **Per-stock check:** `Summary!A10:F19` tallies each holding (rows whose `Affects` column names
  the ticker). Status: OK / `WATCH - repeated negatives` (2+ negatives, >= positives) /
  `REVIEW - check thesis, consider cutting` (3+ negatives, more than positives, 90 days).
  A single negative never triggers. If this input would push a holding to WATCH or REVIEW, say
  so at the top (`⚠ Stock review: LATENTVIEW ...`), list its recent negatives, and ask Chris
  whether the original buy thesis still holds — run the **Fall check** below first, then
  present "hold / trim / exit" as options with reasons, never as an instruction. If a holding in the portfolio sheet has no row here,
  suggest adding one.
- Thesis names must match the Summary column A exactly. Evidence that hits one stock but no
  tracked thesis uses the thesis `Stock-specific`. If the input supports a new thesis,
  propose it to Chris instead of adding it silently.

### Fall check — before any exit (Chris's rule: find the reason for the fall first)

Run this whenever the input is about a market or stock fall, Chris asks about exiting or
trimming, or a holding hits WATCH/REVIEW. Big players can use leverage unwinds and fear to
shake out holders, so classify the fall before suggesting any exit:

| Cause | Signs to look for | Default stance |
|---|---|---|
| **Forced / leverage selling** (MTF unwind, margin calls) | MTF book shrinking (NSE/BSE daily MTF data; last known peak ~₹1.6L cr Sep 2026, warning < ₹1.4L cr); smallcaps falling much faster than Nifty; lower circuits / heavy volume with no company news; stock is a known MTF-heavy name | Don't exit on fear. Hold if thesis intact; watchlist to add once the MTF book stops shrinking |
| **Macro / flow** (FII selling, rupee, oil, rates) | Broad fall across quality names; FII daily selling (warning ₹5,000 cr+/day); USD/INR, Brent, yields moving | Check the thesis scorecard; exit only if the thesis this stock rides on is at WARN |
| **Stock-specific** (earnings miss, guidance cut, governance, order loss, moat erosion) | Stock falls while its sector/index doesn't; negative company news | Real reason — re-check the buy thesis; hold / trim / exit decision |

Say which bucket(s) apply, with the evidence, then give hold / trim / exit as options.
Honest caveat to keep in view: a forced-selling cascade can still go deeper before it ends,
and in a confirmed market correction (see `oneil-market-trend-check`) cutting exposure can be
right even when the cause is technical — so "it's only MTF selling" is a reason not to panic,
not a reason to ignore price.

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
   ## Thesis evidence (Positive / Negative)
   ## What to watch / Portfolio Alert
   ```

   Filename: `YYYY-MM-DD_Short-Topic-In-Title-Case.md` (no spaces, no `\ / : * ? " < > |`).

   **Source files (PDFs, reports, images) never go into the note's folder or the Drive inbox.**
   Chris keeps them for later reading in `<vault>\assets\`. The note only links to them under
   the frontmatter title: `Source: [[assets/<file name as Chris saved it>]]` — a plain link,
   not an `![[embed]]`. If you don't know the file name, ask, or leave the link out.

2. Save it:
   - Find the Drive folder: `title = 'Trading Brain Inbox' and mimeType = 'application/vnd.google-apps.folder'`.
     Create it in `root` if missing.
   - `create_file` with `parentId` = that folder, `contentMimeType: text/markdown`,
     `disableConversionToGoogleType: true`, `textContent` = the note.
   - If this session can write the vault directly (Claude on Chris's PC with the vault path
     present), write to `<vault>\Discussion and Insights\` instead and skip Drive.
   - The PC may be off — never wait for it. `Sync-TradingBrain.ps1` (logon + every 30 min)
     moves inbox notes into the vault.

3. Log the thesis evidence: `append_values` to `Evidence!A1` of the scorecard, one row per
   item — `[YYYY-MM-DD, <thesis exactly as in Summary>, "Positive"|"Negative", <evidence>,
   <affected tickers, comma-separated, exact codes from the portfolio sheet>, <source>,
   <note filename without .md>]`. Write the signal as the word,
   never `+`/`-` (Sheets parses those as formulas). Then re-read `Summary!A1:F19` and report any
   thesis at WATCH/WARN and any stock at WATCH/REVIEW.

4. Confirm in one line:
   `Saved → Discussion and Insights/<filename> (syncs to your PC when it's on)`
