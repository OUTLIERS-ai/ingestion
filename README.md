# Outliers Ingestion

Five agents that get information **into** your second brain and keep it usable once it is there.

This is the ingestion layer and nothing else. There is no content writing in here, no sales, no
planning. Those are separate concerns and mixing them is how these systems get abandoned. Every
agent here does one job: take something from the outside world and turn it into notes your
business can use.

---

## What each one does

| Agent | Feed it | You get back |
|---|---|---|
| **the-archivist** | Contracts, reports, proposals, articles, any long document | Clean structured notes, filed and linked, with the source recorded |
| **the-librarian** | Books and courses | The frameworks and models, captured on the author's terms first, then translated into how they apply to your business |
| **the-scribe** | A call recording, transcript or rough notes | A clean record: summary, decisions, and action items with owners and dates |
| **the-researcher** | A question | A structured, cited dossier saved back into the vault, not a chat answer you lose |
| **the-curator** | Nothing, run it weekly | Contradictions reconciled, duplicates pruned, broken links fixed, memory kept lean |

**The first four are the four channels material arrives through.** The fifth stops the whole
thing rotting once volume goes up, which it will faster than you expect.

## Install

Requires [Claude Code](https://claude.com/claude-code) and a vault, which is just a folder of
Markdown files. Obsidian is optional but recommended.

**Download the repo** (green *Code* button, then *Download ZIP*, or clone it), then from inside
the downloaded folder point the installer at your vault:

**Windows**
```powershell
.\install.ps1 "C:\Users\you\Documents\My Vault"
```

**macOS / Linux**
```bash
./install.sh ~/Documents/My\ Vault
```

That does three things: copies the five agents into `.claude/agents/`, creates the folders they
expect if they are missing, and adds a starter `_CLAUDE.md` operating manual if you do not
already have one. **It never overwrites an existing `_CLAUDE.md` and never touches your notes**,
so it is safe to run again when the agents are updated.

No vault yet? Make an empty folder and run the installer at it — you will get the structure and
the manual, ready to start filling.

**Prefer to do it by hand?** Copy `.claude/agents/*.md` into your vault's `.claude/agents/`
folder, and `_CLAUDE.md` into the vault root. That is all the installer does.

Then open Claude Code in your vault and call one by name, for example:

```
run the-scribe on this transcript
run the-librarian on Resources/Books/some-book.pdf
run the-archivist on this contract
run the-curator
```

## The order that works

1. **the-archivist and the-librarian first.** Volume is the point in week one. Put more in than
   feels sensible and tidy none of it.
2. **the-scribe on every call from now on.** The highest-value material in most businesses is
   spoken and never written down. It is gone in a fortnight.
3. **the-researcher when you have a real question**, not to browse.
4. **the-curator every Friday.** Ten minutes. It is what stops a growing vault turning into a
   pile.

## What is deliberately not in here

Content drafting, sales, offers, planning, bookkeeping, dashboards, and anything that creates or
edits other agents. All real, all separate. This repo stays small so it stays reliable, and so
that adding it to a vault you already have cannot break anything you have already built.

## Notes

- These agents read and write **your** vault, on your machine. Nothing is sent anywhere except
  what your AI subscription already sends.
- They assume folders roughly along the lines of `Projects / Areas / People / Meetings /
  Resources / Ideas / Wiki / Archive`. They will cope with different names; tell them once.
- Nothing here reproduces source material. Ingestion is so you can think with something. What
  you publish has to be yours.

---

*Distributed to Outliers members. Not for redistribution.*
