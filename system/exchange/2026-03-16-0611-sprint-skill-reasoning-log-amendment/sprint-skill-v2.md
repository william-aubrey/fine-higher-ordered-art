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
| Sprint narratives | `library/sprints/*.md` | Timestamped session records |
| Sprint log | `library/sprints/sprint-log.md` | Running index of all sprints |
| Task backlog | `TASKS.md` (project root) | What needs to be done |
| Reasoning log | `library/log/YYYY-MM-DD.md` | Turn-by-turn reasoning journal (see §Log) |

If `library/sprints/` or `library/log/` do not exist, create them before writing.

---

## Reasoning Log

The reasoning log is a persistent, turn-by-turn journal of the AI's internal analytical process during a sprint. It captures the reasoning that would otherwise be lost between sessions — trade-offs weighed, connections noticed, alternatives considered, concerns flagged.

### Purpose

- **During the sprint:** Forces externalization of reasoning at every turn
- **At sprint close:** Primary source material for the narrative (replaces "scan the full conversation")
- **Across sessions:** Lets a future AI instance understand HOW this project is reasoned about, not just WHAT was decided
- **For the user:** Visible, reviewable record of the AI's analytical process

### Format

One file per day: `library/log/YYYY-MM-DD.md`. Append-only. Each entry:

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

2. **Read the sprint log** (`library/sprints/sprint-log.md`). If it doesn't exist, note "No sprint history."

3. **Find the latest narrative.** List all `.md` files in `library/sprints/` (excluding `sprint-log.md`), sorted lexicographically. The last file is the most recent narrative. If none exist, note "No prior sprints."

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
# Sprint Open Brief — [DATE]

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

10. **Start the reasoning log.** Get today's date from the shell. Create `library/log/YYYY-MM-DD.md` if it doesn't exist. Write the first entry: the sprint open timestamp and topic.

11. **Activate the log in CLAUDE.md.** Append the following section to the end of `CLAUDE.md`:

```markdown
## Active Sprint
**Log:** `library/log/YYYY-MM-DD.md`
After every response, append a 1-2 line reasoning entry to the log. Get the timestamp from `powershell -Command "Get-Date -Format 'HH:mm'"` (or `date +%H:%M`). Include `[UPDATED filename]` brackets for any files changed. Write your reasoning — what you did, why, what it connects to, what concerned you. No categorization tags. See sprint skill §Log for format.
```

12. **Stop.** Do not write code, make changes, or execute tasks.

---

## Branch: Sprint Close

**Purpose:** Record what was done, update the task backlog, and check memory. Produce an immutable historical narrative that enables the next session to cold-start with full context.

### Procedure

1. **Get timestamp** for the narrative filename.

2. **Determine the session name.** Derive from the main topic of this session's work. If unclear, ask the user: "What should I call this sprint?" Convert to kebab-case for the filename slug.

3. **Collect file changes.** Run `git status` and `git diff --stat` to identify every file created, modified, or deleted during this session. If the project is not a git repo, ask the user what changed.

4. **Read the reasoning log.** Find today's log file in `library/log/`. If multiple days, read all log files created since the last sprint close. The log is the **primary source** for the narrative — it contains timestamped reasoning, file changes, and analytical process from every turn. Extract:
   - The state of the world before this session and why work was needed
   - Insights or realizations that changed understanding (not just tasks completed)
   - What was built, fixed, or decided — and the rationale for *how* it was done
   - Any questions that came up and weren't resolved
   - Any tasks that were completed or discovered
   - How this session's work connects to the larger project trajectory

   If no reasoning log exists (pre-log sprint), fall back to scanning the conversation.

5. **Write the narrative** to `library/sprints/[TIMESTAMP]-[topic-slug].md`:

```markdown
# [Session Name]

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

6. **Update the sprint log** (`library/sprints/sprint-log.md`). Add a row to the sprint table. If the file doesn't exist, create it:

```markdown
# Sprint Log

| Date | Sprint | Summary | Narrative |
|---|---|---|---|
| [YYYY-MM-DD] | [topic] | [one-line summary] | [filename.md] |
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

9. **Deactivate the log.** Remove the `## Active Sprint` section from `CLAUDE.md`. The log file in `library/log/` remains permanently — it is a historical record, not scaffolding.

10. **Report.** Show the user:
   - Narrative filename and location
   - Sprint log updated
   - TASKS.md changes (if any)
   - Memory updates (if any)
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

---

## First Sprint in a New Project

If this is the first sprint (no `library/sprints/` folder, no `sprint-log.md`, no TASKS.md):

**On open:** Create `library/sprints/`. Report "First sprint — no history to restore." Read CLAUDE.md and any README for orientation. Present whatever context is available.

**On close:** Create everything: the narrative, `sprint-log.md` (with one row), and `TASKS.md` (if tasks were identified). The first narrative establishes the project's sprint history.
