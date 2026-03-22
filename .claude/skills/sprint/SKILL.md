---
name: sprint
description: Sprint lifecycle — open a work session with full context restoration, or close one with a historical narrative and memory check. Use at the start and end of every working session.
argument-hint: <open [topic] | close>
user-invocable: true
---

# /sprint

Universal sprint lifecycle for any project. Two modifiers: **open** and **close**.

A sprint is a body of work done in a single Claude Code chat session. Open says what we're going to do. Close says what we did.

## Step 0: Modifier Detection

Parse the first argument after `/sprint`. Branch to exactly one procedure below.

| Argument | Branch |
|---|---|
| `open` | Sprint Open (no topic — general restoration) |
| `open [topic]` | Sprint Open (targeted — topic guides the brief) |
| `close` | Sprint Close |
| *(missing or unrecognized)* | Print usage: `/sprint open [topic]`, `/sprint close` |

---

## Conventions

These paths are fixed by convention. Every project that uses `/sprint` follows them.

| Item | Path | Purpose |
|---|---|---|
| Sprint narratives | `system/sprints/*.md` | Timestamped session records |
| Sprint log | `system/sprints/sprint-log.md` | Running index of all sprints |
| Task backlog | `TASKS.md` (project root) | What needs to be done |
| Reasoning log | `system/log/YYYY-MM-DD.md` | Turn-by-turn reasoning journal (see §Log) |
| Transcripts | `system/transcripts/*.md` | Curated conversation records (see §Transcript) |
| Memory snapshot | `system/memory/*.md` | Git-tracked mirror of AI institutional memory (see §Memory Snapshot) |
| Raw transcripts | `system/transcripts/raw/*.jsonl` | Auto-captured session JSONLs (see §Raw Session Capture) |
| Config mirror | `system/config/claude/` | Git-tracked mirror of Claude Code settings and hooks (see §Config Snapshot) |

If `system/sprints/`, `system/log/`, `system/transcripts/`, `system/memory/`, `system/transcripts/raw/`, or `system/config/claude/` do not exist, create them before writing.

---

## Reasoning Log

The reasoning log is a persistent, turn-by-turn journal of the AI's internal analytical process during a sprint. It captures the reasoning that would otherwise be lost between sessions — trade-offs weighed, connections noticed, alternatives considered, concerns flagged.

### Purpose

- **During the sprint:** Forces externalization of reasoning at every turn
- **At sprint close:** Primary source material for the narrative (replaces "scan the full conversation")
- **Across sessions:** Lets a future AI instance understand HOW this project is reasoned about, not just WHAT was decided
- **For the user:** Visible, reviewable record of the AI's analytical process

### Format

One file per day: `system/log/YYYY-MM-DD.md`. Append-only. Each entry:

```
HH:MM — [UPDATED filename.md, filename2.md] Free-form reasoning about what
was done, why, what it connects to, what concerned me, what alternatives
I considered. File tags in brackets for easy extraction at sprint close.
No categorization tags (DECISION, DISCOVERY, etc.) — the sprint close
skill handles categorization. Just think on paper.
```

### Rules

1. **Every turn gets an entry.** No exceptions. No judgment about whether a turn is "important enough." Trivial turns get short entries; complex turns get longer ones.
2. **Timestamp comes from the shell** (same rule as sprint timestamps). Use `powershell -Command "Get-Date -Format 'HH:mm'"` or `date +%H:%M`.
3. **Untagged reasoning + bracketed file references.** The log reads like a journal, not a form. Only file changes get brackets.
4. **Append-only.** Never edit previous entries. Corrections are new entries.
5. **Permanent.** The log is NOT deleted after sprint close. It is a historical record.
6. **One or two calls per turn.** Get the timestamp and append. Don't let logging disrupt the primary work.

---

## Transcript

The transcript is a curated, readable record of the full conversation during a sprint. It complements the reasoning log (AI's internal analytical process) and the narrative (synthesized summary). A third party can read the transcript and understand not just what was produced, but how the ideas evolved through dialogue.

### Purpose

- **During the sprint:** Captures the actual conversation incrementally — no end-of-session reconstruction needed
- **At sprint close:** Renamed to match the narrative, forming a matched pair of artifacts
- **Across sessions:** Lets a future reader understand the full intellectual arc — what was said, by whom, and how ideas changed
- **For the user:** Eliminates manual copy-paste of conversations into `system/transcripts/`

### Format

One file per sprint: starts as `system/transcripts/YYYY-MM-DD-hhmm-open-sprint.md` (placeholder timestamp), renamed at close to `YYYY-MM-DD-HHmm-slug.md` (matching the narrative filename). Append-only during the sprint. Each turn:

```
## Turn N: [Descriptive Title]

**William:**

[User's message — near-verbatim, noise stripped]

**Claude:**

[Intellectual content of Claude's response, tool mechanics stripped]

---
```

### What to Strip (noise)

- `<system-reminder>` tags and their contents
- `<ide_selection>` tags and their contents (unless the user explicitly referenced the selection)
- `<ide_opened_file>` notifications
- Tool call results (file contents, bash output, glob results)
- "Let me read/write/check..." preamble before tool calls
- "File created successfully" / "File updated successfully" confirmations
- Todo/task management mechanics
- Permission prompts and approvals
- Skill invocation boilerplate (the `/sprint`, `/exchange` command expansions)

### What to Keep (signal)

- The user's full message text (their actual words — sacred, don't clean up grammar or formalize tone)
- Claude's reasoning, frameworks, arguments, recommendations
- All tables, code blocks, data models, schemas
- Key phrases, coined terms, metaphors that shaped the conversation
- Structural summaries (file trees, architecture diagrams)
- Design decisions and their rationale
- Pivots, corrections, and redirections — these are valuable
- Humor, personality, tone — the conversation is between humans (and human-like agents), not machines

### Fidelity Targets

- User messages: ~95% verbatim (short, distinctive, easy to retain)
- Claude structural content (tables, code, lists): ~95% accurate
- Claude prose content: ~85-90% faithful (compressed but intellectually honest)
- Idea evolution and turn sequence: 100% accurate (never reorder or retroactively edit)

### Rules

1. **Every turn gets an entry.** No exceptions. Trivial turns get short entries.
2. **Serial with reasoning log — AFTER, never before.** The reasoning log is fast and unencumbered. The transcript runs after it.
3. **Append-only.** Never edit previous turns. Corrections appear in the turn where they happened.
4. **Permanent.** The transcript is NOT deleted after sprint close. It is a historical record.
5. **One append call per turn.** Write the full turn entry in a single append. Don't let transcription disrupt primary work.

---

## Memory Snapshot

Claude's auto-memory lives in a local directory outside the git repo (e.g., `C:\Users\[user]\.claude\projects\[project-slug]\memory\`). This is the only piece of AI institutional knowledge that is not version-controlled, not portable across machines, and not visible to C3PO or other instances.

### Purpose

- **At sprint close:** Creates a git-tracked snapshot of the AI's memory state, so memory evolution is visible in version history
- **Across machines:** If the local `.claude/` directory is lost, the repo snapshot can be used to rebuild it
- **For C3PO:** Enables visibility into instance AI memory when reviewing exchange packages or sprint narratives
- **For the user:** The memory is no longer invisible — `git diff system/memory/` shows exactly what the AI learned

### Format

`system/memory/` mirrors the local memory directory exactly. Same filenames, same content. The snapshot is a full replacement — every file is overwritten, not merged.

### Rules

1. **Snapshot at sprint close only.** Not continuous sync. The sprint close procedure copies all `.md` files from the local memory directory to `system/memory/`.
2. **Full replacement.** Every copy overwrites the previous snapshot. Deleted memories are removed from the snapshot too (delete files in `system/memory/` that no longer exist in the local directory).
3. **Git tracks the history.** The snapshot itself is just the latest state. `git log system/memory/` shows how memory evolved over time.
4. **The local copy is authoritative.** Claude loads memory from the local `.claude/` path, not from `system/memory/`. The repo copy is a mirror, not a source.
5. **Portable rebuild.** If the local memory directory is empty or missing, the repo snapshot can be copied back: `cp system/memory/*.md [local-memory-path]/`

---

## Raw Session Capture

A global `SessionEnd` hook automatically copies the raw session JSONL to `system/transcripts/raw/` when any Claude Code session ends. The hook is installed once at `~/.claude/hooks/export-transcript.sh` and configured in `~/.claude/settings.json`. It fires for every project that has a `system/transcripts/` directory — no per-project setup needed.

### Key Behaviors

- **Project-aware:** Only fires if `system/transcripts/` exists in the project root. Silently skips non-sprint projects.
- **Dedup with overwrite-if-larger:** If a session ID already exists in `raw/`, compares file sizes. Overwrites if source is larger (session grew after resume). Skips if same or smaller.
- **No dependencies:** Pure bash, no `jq`. Works on Windows (Git Bash), macOS, and Linux.
- **Naming:** `YYYY-MM-DD-HHMM-session-[short-id].jsonl` where `short-id` is the first 8 characters of the session UUID.

### Rules

1. **The hook is global.** Installed once per machine at `~/.claude/hooks/export-transcript.sh`. All projects with `system/transcripts/` benefit automatically.
2. **`system/transcripts/raw/` must exist.** The hook creates it if missing, but the sprint skill should ensure it exists at sprint open.
3. **Raw files are append-only history.** Never delete raw JSONLs. They are the full-fidelity session record.
4. **Scale:** ~1.5MB per full sprint session. At ~3-4 sessions/day, ~150MB/month. The `raw/` subfolder makes cold storage migration a one-folder operation.

---

## Config Snapshot

Claude Code's settings (`~/.claude/settings.json`) and hooks (`~/.claude/hooks/`) live outside the git repo. A new machine, corrupted profile, or OS reinstall would lose all AI customizations. The config snapshot mirrors these to `system/config/claude/` at sprint close.

### Purpose

- **At sprint close:** Creates a git-tracked snapshot of Claude Code configuration
- **Across machines:** If `~/.claude/` is lost, the repo snapshot provides a rebuild path
- **For C3PO:** Enables visibility into instance AI configuration via `system/config/`

### Format

```
system/config/claude/
  settings.json                ← full ~/.claude/settings.json
  hooks/
    export-transcript.sh       ← all hook scripts
```

### Rules

1. **Snapshot at sprint close only.** Not continuous sync. Paired with the memory snapshot.
2. **Full replacement.** Every copy overwrites the previous snapshot.
3. **Git tracks the history.** `git log system/config/` shows configuration evolution.
4. **The local copy is authoritative.** Claude loads config from `~/.claude/`, not from `system/config/`. The repo copy is a mirror.
5. **Portable rebuild.** If `~/.claude/` is empty or missing:
   ```bash
   cp system/config/claude/settings.json ~/.claude/settings.json
   mkdir -p ~/.claude/hooks
   cp system/config/claude/hooks/*.sh ~/.claude/hooks/
   chmod +x ~/.claude/hooks/*.sh
   ```

---

## Timestamp Rule

**Every timestamp MUST come from the shell.** Never guess, never use UTC.

Primary (Windows):
```
powershell -Command "Get-Date -Format 'yyyy-MM-dd-HHmm'"
```

Fallback (Mac/Linux):
```
date +%Y-%m-%d-%H%M
```

The result is used in narrative filenames: `YYYY-MM-DD-HHMM-[topic-slug].md`

---

## Branch: Sprint Open

**Purpose:** Restore context from the last session, read the task backlog, and produce a Sprint Open Brief. **Do not execute any work.**

### Procedure

1. **Get timestamp** (for the brief header).

2. **Read the sprint log and generate Sprint ID.** Read `system/sprints/sprint-log.md`. If it doesn't exist, note "No sprint history." Count the data rows in the sprint log table (exclude the header and separator rows). The next Sprint ID is `SPR-` + zero-padded three-digit number (row count + 1). Example: 16 existing rows → `SPR-017`. If no sprint log exists, start at `SPR-001`.

3. **Find the latest narrative.** List all `.md` files in `system/sprints/` (excluding `sprint-log.md`), sorted lexicographically. The last file is the most recent narrative. If none exist, note "No prior sprints."

4. **Read the latest narrative** (if it exists). Extract:
   - Session summary (what was done)
   - Open questions (Part IV)
   - Bootstrap file list (Part V — numbered list of files to read)
   - "Next task" line (Part V)

5. **Read bootstrap files.** For each file in the Part V list:
   - If found: read it, note ✓
   - If not found: note ✗, flag in the brief. Continue — do not abort.

6. **Read TASKS.md.** If it exists, extract:
   - Open tasks (unchecked items)
   - Recently completed tasks (checked items — for awareness)
   - Any priority markers or groupings the user has set up

   If TASKS.md does not exist, note "No task backlog found."

7. **Read project orientation.** Check for `CLAUDE.md` at the project root. If it exists, scan for any open items, current status notes, or flagged issues. Do not read the entire file if it's long — look for status/context sections.

8. **If a `[topic]` was provided,** use it to filter: highlight tasks related to the topic, note which bootstrap files are relevant, and frame the brief around that topic.

9. **Produce the Sprint Open Brief:**

```
# Sprint Open Brief — SPR-NNN — [DATE]

## Last Sprint
**Date:** [date from latest narrative]
**Topic:** [topic/name from filename]

[2–3 sentences synthesizing what was done — written fresh, not copied]

## Context Restored
| # | File | Status |
|---|---|---|
| 1 | `path/to/file` | ✓ Read |
| 2 | `path/to/missing` | ✗ Not found |

## Task Backlog
[Open tasks from TASKS.md, grouped if the user has groups. If a topic was specified, highlight tasks related to that topic.]

## Open Questions
[From the latest narrative's Part IV, in priority order. If none: "No open questions from last sprint."]

## Recommended Next Task
> [Verbatim "Next task:" line from the latest narrative, or a recommendation based on TASKS.md priority]

---
Awaiting your instruction.
```

10. **Create the transcript file.** Write the following header to `system/transcripts/YYYY-MM-DD-hhmm-open-sprint.md` (where `YYYY-MM-DD` is today's date and `hhmm` is literal placeholder text — not a real time):

```markdown
# [Topic or "Sprint Session"] — Conversation Record

> *This is a curated conversation record, not a raw transcript. User messages are near-verbatim (~95%). Claude's responses preserve intellectual content but strip tool-call mechanics. Structural elements (tables, code, data models) are reproduced faithfully. Fidelity: ~85-90%.*

**Sprint:** SPR-NNN
**Date:** YYYY-MM-DD
**Participants:** William, Claude
**Context:** [Brief description from sprint topic or "General context restoration and work session"]

---
```

If `system/transcripts/` does not exist, create it.

11. **Start the reasoning log.** Get today's date from the shell. Create `system/log/YYYY-MM-DD.md` if it doesn't exist. Write the first entry: the sprint open timestamp, sprint ID, and topic.

12. **Activate the sprint in CLAUDE.md.** Append the following section to the end of `CLAUDE.md`:

```markdown
## Active Sprint
**Sprint:** `SPR-NNN`
**Log:** `system/log/YYYY-MM-DD.md`
**Transcript:** `system/transcripts/YYYY-MM-DD-hhmm-open-sprint.md`

### Per-Turn Protocol (after every response)

**Step 1 — Reasoning Log** (fast, 1-2 calls)
Append a 1-2 line entry to the log file. Get timestamp from `powershell -Command "Get-Date -Format 'HH:mm'"` (or `date +%H:%M`). Include `[UPDATED filename]` brackets for any files changed. Write reasoning — what you did, why, what it connects to, what concerned you. No categorization tags. See sprint skill §Log for format.

**Step 2 — Transcript** (after log, 1 append call)
Append the current turn to the transcript file. Format:

    ## Turn N: [Descriptive Title]

    **William:**
    [User's message — near-verbatim. Strip <system-reminder>, <ide_selection> (unless explicitly referenced), <ide_opened_file>, tool metadata, permission prompts, skill invocation boilerplate. Preserve voice, punctuation, style.]

    **Claude:**
    [Your response — intellectual content only. Keep: reasoning, frameworks, arguments, tables, code blocks, data models, key phrases, design decisions, pivots, humor. Strip: "Let me read/write/check..." preamble, tool call results, file confirmations, todo mechanics.]

    ---

Increment turn number sequentially from 1. To find the current count, check the last `## Turn N` heading in the transcript file.

**Do not let the per-turn protocol disrupt primary work.** Both steps together should be 2-3 tool calls appended at the end of your response.
```

13. **Stop.** Do not write code, make changes, or execute tasks.

---

## Branch: Sprint Close

**Purpose:** Record what was done, update the task backlog, and check memory. Produce an immutable historical narrative that enables the next session to cold-start with full context.

### Procedure

1. **Get timestamp** for the narrative filename.

2. **Determine the session name.** Derive from the main topic of this session's work. If unclear, ask the user: "What should I call this sprint?" Convert to kebab-case for the filename slug.

3. **Collect file changes.** Run `git status` and `git diff --stat` to identify every file created, modified, or deleted during this session. If the project is not a git repo, ask the user what changed.

4. **Read the reasoning log.** Find today's log file in `system/log/`. If multiple days, read all log files created since the last sprint close. The log is the **primary source** for the narrative — it contains timestamped reasoning, file changes, and analytical process from every turn. Extract:
   - The state of the world before this session and why work was needed
   - Insights or realizations that changed understanding (not just tasks completed)
   - What was built, fixed, or decided — and the rationale for *how* it was done
   - Any questions that came up and weren't resolved
   - Any tasks that were completed or discovered
   - How this session's work connects to the larger project trajectory

   If no reasoning log exists (pre-log sprint), fall back to scanning the conversation.

5. **Write the narrative** to `system/sprints/[TIMESTAMP]-[topic-slug].md`:

```markdown
# [Session Name]

**Sprint:** SPR-NNN
**Date:** [YYYY-MM-DD]
**Project:** [project name from CLAUDE.md or repo name]

---

## Starting Point
[What was the state before this session? What was broken, incomplete, or unresolved that motivated the work? Name the specific problems. A future reader should understand what needed fixing before reading what was fixed. Omit only if the session was purely exploratory with no prior state to describe.]

## Summary
[2–3 paragraphs: what was the goal, what was done, what was the outcome. Written for a future reader — human or AI — who was not present. Synthesize, don't copy.]

## Discoveries
[Named insights that changed understanding during this session. A Discovery is not a task completed — it is a realization that altered what was built or how the system is understood. Each entry follows the causal chain: what was observed → what it meant → what changed as a result.

### Discovery N: [Name]
[What we saw or realized, and why it matters.]

**Consequence:** [What changed in the design, architecture, or approach as a direct result.]

Omit this section entirely if no genuine insights occurred. Do not fabricate discoveries from routine work. A pure execution sprint with no surprises has no discoveries — that's fine.]

## What Changed

### Files Created
| File | What it is |
|---|---|
| `path/to/file` | [brief description] |

### Files Modified
| File | What changed |
|---|---|
| `path/to/file` | [brief description] |

### Files Deleted
| File | Why |
|---|---|
| `path/to/file` | [brief reason] |

[Omit any section (Created/Modified/Deleted) if empty.]

## Key Decisions
[Numbered list of execution choices made this session. Each entry: the decision, the rationale, and any constraints that drove it. These are choices about *how* to do the work — distinct from Discoveries, which are about *what we learned*. Omit if no significant decisions were made.]

## What This Proves
[How this session's work connects to the broader project thesis. What does it validate, enable, or challenge? This section prevents tunnel vision — it forces the narrative to zoom out from "what we did today" to "why it matters." Omit for routine execution sprints where the connection is obvious.]

## Open Questions
[Unresolved items from this session, prioritized. Each must be specific enough to act on. Include any new questions discovered. Omit if none.]

## Bootstrap Prompt
Read these files in order to restore context for the next session:

1. `TASKS.md`
2. [specific files that were the focus of this session]
3. [any config, data, or governance files relevant to current state]

**Next task:** [One sentence — what the next session should do first]
```

6. **Update the sprint log** (`system/sprints/sprint-log.md`). Add a row to the sprint table. If the file doesn't exist, create it. If the existing sprint log has no `#` column, add it to the header and separator rows. Existing data rows get an empty `#` cell — do not backfill IDs for historical sprints.

```markdown
# Sprint Log

| # | Date | Sprint | Summary | Narrative |
|---|---|---|---|---|
| SPR-NNN | [YYYY-MM-DD] | [topic] | [one-line summary] | [filename.md] |
```

7. **Update TASKS.md.** Mark any tasks completed during this session. Add any new tasks discovered. If TASKS.md doesn't exist and tasks were identified, create it:

```markdown
# Tasks

## Backlog
- [ ] [task 1]
- [ ] [task 2]

## Completed
- [x] [task 3] — [sprint date]
```

8. **Memory check.** Review the session for anything worth persisting to memory. Ask yourself:
   - Did the user correct my approach or give feedback? → `feedback` memory
   - Did I learn something about the user's role, preferences, or knowledge? → `user` memory
   - Did a project-level decision or context emerge that future sessions need? → `project` memory
   - Did we discover an external resource worth bookmarking? → `reference` memory

   If any memory candidates exist, write them to the memory system following the memory protocol (frontmatter + MEMORY.md index). If nothing is memory-worthy, move on — don't force it.

9. **Memory snapshot.** Copy all memory files from the local Claude memory directory to `system/memory/` in the repo. This creates a git-tracked mirror of the AI's institutional knowledge.

   **Locate the source directory:** The memory path is machine-specific. Find it by checking the system prompt for the `auto memory` section, which contains the path (e.g., `C:\Users\aubrew\.claude\projects\g--My-Drive-A0-C3PO\memory\`). Alternatively, check for `.claude/projects/*/memory/` relative to the user's home directory.

   ```bash
   # Copy all memory files (overwrite existing — the snapshot is a full replacement)
   cp [local-memory-path]/*.md system/memory/
   ```

   Verify the count matches. Report: "Memory snapshot: [N] files → `system/memory/`"

   If `system/memory/` does not exist, create it. If the local memory directory cannot be found or is empty, skip this step and note it in the report.

10. **Config snapshot.** Copy Claude Code's settings and hooks to `system/config/claude/` in the repo. This creates a git-tracked mirror of AI configuration, paired with the memory snapshot.

   ```bash
   mkdir -p system/config/claude/hooks
   cp ~/.claude/settings.json system/config/claude/settings.json
   cp ~/.claude/hooks/*.sh system/config/claude/hooks/ 2>/dev/null
   ```

   Verify the copy. Report: "Config snapshot: settings.json + [N] hook scripts → `system/config/claude/`"

   If `~/.claude/hooks/` does not exist or is empty, copy only `settings.json`. If `~/.claude/settings.json` cannot be found, skip this step and note it in the report.

11. **Final transcript entry.** Append the sprint close turn to the transcript file — this is the last entry. Include the narrative content in the Claude response section (compressed to key sections: Summary, Discoveries, Key Decisions).

12. **Rename the transcript file.** The file was created as `system/transcripts/YYYY-MM-DD-hhmm-open-sprint.md`. Rename it to match the narrative:
   - Narrative: `system/sprints/YYYY-MM-DD-HHmm-slug.md`
   - Transcript: `system/transcripts/YYYY-MM-DD-HHmm-slug.md`

   Use `mv` to rename. The timestamp uses the close time (same as the narrative), not the open time.

13. **Deactivate (concurrent-safe).** Read the `## Active Sprint` section from CLAUDE.md. Extract the `**Sprint:**` value.
   - **Matches this sprint's ID:** Remove the entire `## Active Sprint` section.
   - **Different ID:** Leave the block untouched — another sprint owns it.
   - **Block absent:** No action needed.

   The log and transcript files remain permanently — they are historical records, not scaffolding.

14. **Report.** Show the user:
   - Narrative filename and location
   - Transcript filename and location
   - Sprint log updated (with Sprint ID)
   - TASKS.md changes (if any)
   - Memory updates (if any)
   - Memory snapshot (file count to `system/memory/`)
   - Config snapshot (files to `system/config/claude/`)
   - Any uncommitted git changes

---

## Quality Standards

- **Synthesize, don't copy.** Narrative sections must be written fresh — not pasted from the conversation.
- **Every file change accounted for.** The "What Changed" section must match `git status`. No silent omissions.
- **Discoveries are insights, not tasks.** "Completed A11 sprint" is not a discovery. "We realized that constraint-supremacy naming makes the framework scale-invariant" is. If nothing surprised you, the section should be omitted — not padded.
- **Causal chains in discoveries.** Each discovery must show: observation → meaning → consequence. The consequence is what changed as a result. Without a consequence, it's an observation, not a discovery.
- **Key Decisions explain execution choices.** Why *this* approach and not alternatives? What constraints drove the choice? Decisions without rationale are just a changelog.
- **Starting Point names the problem.** Not "we continued work on X" — what specifically was broken, missing, or unresolved? A future reader should feel the tension that motivated the session.
- **Bootstrap prompt must be functional.** A future session reading only those files must be able to understand current state.
- **"Next task" must be actionable.** Not "continue working" — a specific, concrete next step.
- **Omit, don't pad.** Every conditional section (Starting Point, Discoveries, Key Decisions, What This Proves, Open Questions) should be omitted when empty rather than filled with filler. A short narrative with genuine content beats a long one with forced sections.
- **Memory check is a review, not a dump.** Only persist genuinely useful information. Most sprints won't produce memory writes.
- **Sprint log is append-only.** Never edit previous rows.
- **Narratives are immutable.** Never edit a narrative after it's written. Corrections go in the next sprint's narrative.
- **Tone:** Past tense for what was done. Present tense for current state. Direct. No filler.

### Transcript Quality
- **User messages are sacred.** Near-verbatim (~95%). Don't clean grammar, fix typos, or formalize tone.
- **Structural content is exact.** Tables, code blocks, data models — reproduce faithfully.
- **Claude prose is faithful.** ~85-90%. Compress verbosity but preserve key phrases and distinctive formulations.
- **Sequence is inviolable.** Never reorder turns or retroactively edit earlier entries.
- **Every turn recorded.** No judgment about importance. Trivial turns get short entries.
- **Transcript is immutable.** Never edit after sprint close. Like narratives.

---

## Concurrent Sprint Safety

Multiple sprints may run in the same repo (e.g., two VS Code windows). The Sprint ID prevents interference:

- **Sprint open** always writes a new Active Sprint block to CLAUDE.md. If one exists, it is overwritten — the newer sprint takes CLAUDE.md ownership.
- **Sprint close** only removes the Active Sprint block if the Sprint ID matches. A mismatched ID means another sprint owns the block.
- Reasoning logs (daily files) and transcripts (per-sprint files) never collide across concurrent sprints.
- The Sprint ID collision risk (two sprints reading the same row count simultaneously) is negligible given human timing. If detected, increment the ID.

---

## First Sprint in a New Project

If this is the first sprint (no `system/sprints/` folder, no `sprint-log.md`, no TASKS.md):

**On open:** Create `system/sprints/`, `system/log/`, `system/transcripts/`, `system/transcripts/raw/`, `system/memory/`, and `system/config/claude/`. The first Sprint ID is `SPR-001`. Report "First sprint — no history to restore." Read CLAUDE.md and any README for orientation. Present whatever context is available.

**On close:** Create everything: the narrative, the transcript, `sprint-log.md` (with the `#` column and one row), and `TASKS.md` (if tasks were identified). The first narrative establishes the project's sprint history.
