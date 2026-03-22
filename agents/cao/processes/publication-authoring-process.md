# Publication Authoring Process (PAP) — Process Guide

**IDEF0 Node:** Cross-cutting (A31 Product Management × A14 Engineering)
**IDEF0 Role:** Mechanism (executes the authoring function)
**Authority:** C3PO enterprise standard. Applies to all publication projects.
**Owner:** Principal
**Location:** `agents/cao/processes/publication-authoring-process.md`

---

**Purpose:** A methodology for authoring, editing, and publishing nonfiction works through human-AI collaboration. The output is a publication-ready manuscript decomposed into independently editable files that can be assembled, reviewed, and published without loss of fidelity.

**Audience:** The C3PO Principal and AI co-authors working on any publication — books, white papers, collected editions, or standalone chapters.

**Origin:** Developed through practice during the C3PO Origin Story (1st through 3rd editions, March 2026). Every principle below was validated by actually doing it. The methodology produced a 19,769-word collected edition across three separately authored parts, and a 36-file decomposition for the 3rd edition rewrite.

---

## Philosophy

### The Core Problem

A nonfiction book co-authored by a human and an AI has three competing demands:

1. **Context limits.** AI systems have finite context windows. A 20,000-word manuscript exceeds the range where an AI can reliably make surgical edits without introducing errors. The longer the file, the higher the probability of a bad string match, a lost passage, or a context-window-induced hallucination.

2. **Editorial visibility.** When rewriting a published work, the author needs to see what changed and why. Delete-and-replace is invisible — the previous text is gone. The author cannot evaluate the new text against the old text because the old text no longer exists.

3. **Assembly integrity.** The final published artifact must be a single coherent document. Decomposition for editing must not produce a Frankenstein manuscript where chapters don't connect, voice shifts between files, or structural elements are duplicated or missing.

### The Resolution

**Decompose → Redline → Draft → Clean → Assemble.**

Break the manuscript into files small enough for precise AI editing (1,000–5,000 words each). Use visible markup conventions to track every change. Draft replacement sections as standalone files. Clean the markup in a dedicated pass. Assemble the final manuscript by concatenation in file-order.

The decomposition follows nonfiction publishing conventions: front matter, body chapters, back matter. Each file is numbered so `ls` produces the reading order.

---

## The Five Phases

### Phase 1: Decomposition

Break the manuscript into individually numbered files following nonfiction structure conventions.

**File naming:** `NN-slug.md` where NN is a two-digit number that determines reading/assembly order.

**Standard decomposition for a collected edition:**

| Range | Content |
|---|---|
| 01–11 | Front matter (half-title, also-by, title, copyright, dedication, epigraph, TOC, foreword, preface, acknowledgments, introduction) |
| 12–2X | Body chapters (one file per chapter, grouped by part) |
| 2X–3X | Back matter (afterword, appendices, bibliography, index, about author, discussion questions, postscript, colophon, disclaimer) |

**Size targets:** Each file should be 1,000–5,000 words for optimal AI editing. Files over 10,000 words should be split further. Files under 500 words are fine for structural elements (half-title, dedication, epigraph).

**New sections** get stub files with `**[3E-NOTE:]**` editorial notes describing what the section should contain, who writes it, and what decisions are pending.

**Source preservation:** The previous edition's source files are never modified. Decomposition creates copies in a new edition's `01-prompts-and-drafts/` folder.

### Phase 2: Redline

Mark every change visibly using the editorial conventions (see §Markup Conventions below). The goal is a version where the author can see old text alongside new text, evaluate the change, and approve or reject.

**Rules:**
- Never delete text silently. Use `~~strikethrough~~` for text being replaced.
- Every replacement is tagged with the edition marker (e.g., `**[3E:]**`).
- Questions for the Principal use `**[Q:]**`.
- Placeholder content uses `**[TK]**`.
- Facts that need verification use `**[FACT-CHECK:]**`.
- For sections requiring more than ~50% rewrite, replace with a pointer: `**[3E: see separate draft file NN-slug-rewrite.md]**` and draft the replacement as a standalone file in the same folder.

### Phase 3: Review

The Principal reads the redlined files — in file-number order or by priority — and responds:

- `**[STET]**` next to a strikethrough: keep the original, reject the change.
- `[WRA:]` annotations: add context, corrections, or direction.
- Approve silently: no annotation means the change stands.
- `**[Q:]**` answers inline.

Review can happen across multiple sessions. The redline files are append-only — new annotations are added, never edited over.

### Phase 4: Clean

Strip all editorial markup to produce clean final drafts.

**Strip list (in order):**
1. All `~~strikethrough~~` text (the old text, now replaced or stetted)
2. All `**[3E:]**` tags (keep the replacement text, remove the tag)
3. All `**[3E-NOTE:]**` blocks
4. All `**[Q:]**` / `**[FACT-CHECK:]**` / `**[VOICE:]**` markers
5. All `**[STET]**` markers
6. All `<!-- HTML comments -->`
7. All `**[TK]**` markers — **if any remain, STOP. The manuscript is not ready.**

**Output:** Clean files moved to `02-final-drafts/` with the same numbering.

**QA gate:** After cleaning, run:
```
grep -rn "TK\|Q:\|FACT-CHECK\|3E-NOTE\|3E:" 02-final-drafts/
```
Zero matches = ready for assembly. Any match = go back to Phase 3.

### Phase 5: Assembly

Concatenate all clean files in number order to produce the compiled manuscript.

```bash
cat 02-final-drafts/[0-9][0-9]-*.md > 03-compilation/[title]-[edition].md
```

**Post-assembly QA:**
- Word count check (compare to target / previous edition)
- TOC rebuild (file 07 is generated from the final heading structure)
- Cross-reference check (do chapter references point to correct chapter numbers?)
- Voice consistency spot-check (read the first paragraph of each chapter sequentially)
- Final grep for editorial artifacts

**Output:** The compiled manuscript in `03-compilation/`, ready for formatting (Kindle Create, PDF, etc.).

---

## Markup Conventions

### Edition-Specific Tags

Each edition uses its own tag prefix to distinguish layers of editing:

| Tag | Purpose | Published? | Stripped in Phase 4? |
|---|---|---|---|
| `~~strikethrough~~` | Text being replaced or removed | No | Yes |
| `**[3E:]**` | 3rd Edition replacement text (change the prefix per edition: 4E, 5E, etc.) | Text yes, tag no | Tag stripped |
| `**[3E-NOTE:]**` | Editorial note — not published content | No | Yes |
| `[WRA:]` | Principal's annotation — part of the published text | **Yes** | No |
| `**[TK]**` | "To come" — placeholder that MUST be filled | No | Yes — but block publication if any remain |
| `**[Q:]**` | Question requiring Principal's answer | No | Yes |
| `**[FACT-CHECK:]**` | Data point needing verification | No | Yes |
| `**[VOICE:]**` | Passage flagged for voice calibration | No | Yes |
| `**[STET]**` | Reviewed — keep as-is (rejects a proposed change) | No | Yes |
| `<!-- comment -->` | Invisible in rendered markdown — truly internal | No | Yes |

### Usage Examples

**Simple replacement:**
```markdown
The architecture uses ~~a Layer 1 read-only model~~ **[3E:]** a boundary-enforcement model
where compliance is measured at the A-0 interface to govern instance behavior.
```

**Question for the Principal:**
```markdown
**[Q:]** The book says "sixty exchange packages." The current count is closer to 90.
Update to exact count or say "dozens"?
```

**Placeholder:**
```markdown
The third feedback loop — **[TK]** TCC's prototype folder proposal — completed the
full cycle in March 2026.
```

**Fact check:**
```markdown
540 leaf nodes **[FACT-CHECK:]** verify current count — may have changed since
A14 completion across 30 skill files.
```

**Section pointer (for major rewrites):**
```markdown
~~### Layered Authority~~

~~The separation between architect and instance is enforced through a layered authority model:~~

~~**Layer 1 — C3PO-owned (read-only in instances):** ...~~

~~**Layer 2 — Instance-owned:** ...~~

**[3E: see 17-p2-ch5-blueprint-rewrite.md for full replacement of this section]**
```

---

## Folder Structure

Each publication project follows a standard folder layout:

```
library/whitepapers/[publication-name]/
├── 01-prompts-and-drafts/     ← Working files: redline drafts, rewrite drafts, prompts
│   ├── 01-half-title.md
│   ├── 02-also-by.md
│   ├── ...
│   └── NN-slug.md
│
├── 02-final-drafts/           ← Clean files after markup removal (Phase 4 output)
│   ├── 01-half-title.md
│   ├── ...
│   └── NN-slug.md
│
├── 03-compilation/            ← Assembled manuscript (Phase 5 output)
│   ├── [title]-[edition].md
│   └── assemble.sh           ← Re-runnable assembly script
│
└── 04-amazon-release/         ← Publishing metadata
    └── amazon-release.md      ← Description, categories, keywords, pricing
```

**Editions are separate folders:**
```
library/whitepapers/
├── c3po-2nd-edition/          ← Frozen — published as-is
├── c3po-3rd-edition/          ← Active editing
└── c3po-4th-edition/          ← Future
```

Previous editions are never modified after publication. They are historical artifacts.

---

## Nonfiction Section Reference

### Front Matter (Roman numerals in print)

| Section | Purpose | Who Writes | Required? |
|---|---|---|---|
| Half-title | Title only, no author — visual threshold | Designer | Print standard |
| Also-by | Other books by author | Author | Commercially valuable |
| Title page | Full title, subtitle, author | Designer | **Yes** |
| Copyright | Legal: ©, ISBN, AI co-authorship disclosure | Author | **Yes** |
| Dedication | Personal tribute | Author | Optional |
| Epigraph | Thematic quotation for the whole book | Author selects | Optional |
| Table of Contents | Navigation — built last | Author | **Yes** for nonfiction |
| Foreword | Endorsement by someone OTHER than the author | Third party | Optional |
| Preface | Why this edition exists, what changed | Author | Especially for 2nd+ editions |
| Acknowledgments | Thanks | Author | Optional |
| Introduction | Orients reader to the subject matter | Author | **Expected** |

### Body Matter (Arabic numerals)

Part openers, chapters, chapter epigraphs, sidebars/callouts if applicable.

### Back Matter (Arabic numerals, continuing)

| Section | Purpose | Who Writes | Required? |
|---|---|---|---|
| Afterword | Reflective essay — especially for collected editions | Author | Optional |
| Appendices | Supplementary detail — templates, checklists, specs | Author | Optional |
| Bibliography | Sources cited + further reading | Author | **Expected** for serious nonfiction |
| Index | Subject/name index (for print) | Indexer | Expected for print |
| About the Author | Biographical sketch, credentials | Author | KDP recommends |
| Discussion Questions | Book club / classroom use | Author | Optional |
| Postscript | Informal close, review request (KDP) | Author | Optional |
| Colophon | Production notes — tools, typefaces | Author | Optional |
| Disclaimer | Legal notices | Author | As needed |

---

## Voice Calibration

When rewriting an existing manuscript, the AI must match the established voice. The calibration process:

1. **Analyze the source text.** Identify sentence structure patterns, argument techniques, tone markers, and — critically — what the author does NOT do (anti-patterns).
2. **Produce a voice guide.** Document positive patterns and a negative-space catalog of AI writing habits to suppress.
3. **Apply during drafting.** The voice guide is a Control arrow on every drafting function.
4. **QA at assembly.** Read the first paragraph of each chapter in sequence. Voice shifts between chapters indicate a calibration failure.

The negative-space catalog (what to suppress) is typically more useful than the positive patterns. The AI already knows how to write well. It needs to learn which of its defaults to suppress.

---

## Relationship to Other Mechanisms

| Mechanism | Relationship |
|---|---|
| `spec-driven-development.md` | SDD produces product specifications. PAP produces publications. Both follow a phased methodology with simulation/QA gates. |
| Sprint lifecycle (`/sprint`) | Each editing session is a sprint. The reasoning log captures editorial decisions. The narrative records what changed and why. |
| Exchange protocol (`/exchange`) | Publications may reference exchange packages as evidence. The book IS an output of the C3PO architecture. |

---

## Anti-Patterns

| Anti-Pattern | What Happens | How to Avoid |
|---|---|---|
| **Monolithic editing** | Edit a 20,000-word file as a single unit | Decompose to 1,000–5,000 word files |
| **Silent deletion** | Old text removed without record | Always strikethrough before replacing |
| **Premature cleaning** | Strip markup before Principal reviews | Phase 4 comes AFTER Phase 3 review |
| **TK in production** | Placeholder published to readers | Grep for TK before assembly; zero tolerance |
| **Edition contamination** | Edits leak into a frozen previous edition | Each edition is a separate folder |
| **Voice drift** | Chapters written weeks apart sound different | Voice guide as Control arrow; QA at assembly |
| **Over-decomposition** | 100 files of 200 words each | Target 1,000–5,000 words per file |

---

*This methodology was developed during the C3PO collected edition project (March 2026). It was refined through three editions, 36-file decomposition, and the resolution of the corporate veil governance question that required a same-week rewrite between editions.*

---

## Print Pipeline Discoveries (SPR-022, 2026-03-21)

Findings from the markdown → Word → Kindle Create pipeline. These supplement the QA gate in Phase 5.

### Formatting Rules

| Issue | Cause | Fix |
|---|---|---|
| **No page breaks between files** | Markdown has no native page break; blank lines between concatenated files produce no breaks | Append `<div style="page-break-after: always;"></div>` to end of every source file |
| **TOC entries collapse into paragraph** | Single newlines in markdown are whitespace, not line breaks | Add `<br>` after each TOC entry; more reliable than two trailing spaces |
| **Empty section false positives in QA** | `# CHAPTER 1` / `## Subtitle` is a title/subtitle convention, not empty | QA compares heading levels; only flags same-or-higher level sequences |
| **Template examples flag as annotations** | `[1-2 sentences: ...]` in instructional text looks like a `[Note:` placeholder | QA skips lines inside code blocks and lines starting with `[digit` |
| **Stale terminology undetected** | Retired governance language (`Layer 1/2`) in narrative past-tense is valid | QA excludes past-tense verbs (`described`, `lasted`, `became`) |

### QA Tools

| Tool | Path | Purpose |
|---|---|---|
| `qa-manuscript.sh` | `03-compilation/` | 9-category scan; exit 0 = clean |
| `assemble.sh` | `03-compilation/` | Concatenates 01-47 into single manuscript |
| `add-pagebreaks.sh` | `03-compilation/` | Appends page-break divs (idempotent) |

### Open Pipeline Questions

- Does Pandoc `.md → .docx` conversion produce better Kindle Create results than direct `.md` import?
- How do markdown tables render in Kindle Create? (Observer paper + appendices have tables)
- Do fenced code blocks survive the pipeline? (Appendices D, E, F, G have code examples)
- How should `[WRA:]` / `[Claude Code:]` annotations be visually styled in print?
- Cover design workflow — separate from manuscript pipeline

### Skill Concept: `/author`

A future skill with modifiers:
- `/author format` — apply formatting rules (page breaks, line breaks, annotation styling)
- `/author publish` — run QA, assemble, convert to target format
- `/author qa` — run QA test suite standalone

Not yet built. This section captures the process knowledge that would power it.
