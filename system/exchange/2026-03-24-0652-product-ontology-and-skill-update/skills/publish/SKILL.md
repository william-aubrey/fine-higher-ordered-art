# /publish

Universal publication lifecycle for taking markdown manuscripts from raw content to print-ready artifacts. Six modifiers map to six production phases.

## Step 0: Modifier Detection

Parse the first argument after `/publish`. Branch to exactly one procedure below.

| Argument | Branch |
|---|---|
| `decompose` | Create file structure, editorial inventory, archive context |
| `write` | Autonomous drafting, reader simulations, voice calibration |
| `edit` | Front/back matter, annotation system, iterative revision |
| `format` | QA gate, assemble markdown, convert to DOCX |
| `release` | KDP listing, cover, print options, publish |
| `promote` | Social media post, launch announcement |
| *(missing)* | Print usage: `/publish decompose`, `/publish write`, `/publish edit`, `/publish format`, `/publish release`, `/publish promote` |

---

## Conventions

These paths are fixed by convention relative to the publication project root.

| Item | Path | Purpose |
|---|---|---|
| Source files | `01-prompts-and-drafts/` | Numbered markdown files (NN-slug.md) |
| Working documents | `01-prompts-and-drafts/00-*.md` | Editorial inventory, story arc, timeline, research — excluded from assembly |
| Final drafts | `02-final-drafts/` | Assembled .md and .docx |
| Compilation tools | `03-compilation/` | Scripts: assemble.sh, qa-manuscript.sh, md-to-docx.py, etc. |
| Release metadata | `04-amazon-release/` | KDP description, categories, keywords, pricing |

**File naming:** `NN-slug.md` where NN is a two-digit number determining reading/assembly order. Files 01-09 are front matter. Files 10+ are body and back matter. Files prefixed `00-` are working documents excluded from assembly.

**Size targets:** 1,000-5,000 words per file. Files over 10,000 words should be split. Files under 500 words are fine for structural elements (half-title, dedication, epigraph).

---

## Branch: Decompose

**Purpose:** Create the file structure for a new publication project, produce an editorial inventory, and establish the manuscript skeleton.

### Procedure

1. **Determine project location.** Ask the user for the publication name. Create the folder structure:

```
agents/librarian/products/library/make/whitepapers/[publication-name]/
├── 01-prompts-and-drafts/
├── 02-final-drafts/
├── 03-compilation/
└── 04-amazon-release/
```

2. **Determine the manuscript structure.** Ask the user:
   - What kind of publication? (book, white paper, collected edition, standalone chapter)
   - How many parts/sections?
   - Front matter requirements? (foreword, preface, acknowledgments, etc.)
   - Back matter requirements? (glossary, bibliography, appendices, etc.)

3. **Create stub files.** Generate numbered markdown files for every section using the nonfiction section reference below. Each stub contains a heading and a `**[TK]**` marker indicating content is needed.

**Standard nonfiction front matter (adjust per project):**

| File | Section | Required? |
|---|---|---|
| 01 | Half-title | Print standard |
| 02 | Also-by | If prior publications exist |
| 03 | Title page | Yes |
| 04 | Copyright | Yes |
| 05 | Dedication | Optional |
| 06 | Epigraph | Optional |
| 07 | Table of Contents | Yes for nonfiction |
| 08 | Foreword | Optional (third party writes) |
| 09 | Preface | Expected for 2nd+ editions |
| 10 | Acknowledgments | Optional |
| 11 | Introduction | Expected |

Body files continue from 12+. Back matter follows the last body file.

4. **Create the editorial inventory.** If this is a revision of an existing work, produce `00-editorial-inventory.md`:
   - List every file with current status (accurate, needs update, new stub)
   - Identify what changed since the prior edition
   - Flag stale references, outdated terminology, structural gaps

5. **Create working documents** as needed:
   - `00-story-arc.md` — structural blueprint (for narrative works)
   - `00-timeline.md` — chronological arc of source material
   - `00-author-context.md` — voice reference, biographical context
   - `00-reader-reviews.md` — beta reader feedback tracking

6. **Install compilation tools.** Copy the standard scripts to `03-compilation/`:
   - `assemble.sh` — concatenates numbered files into assembled manuscript
   - `qa-manuscript.sh` — 9-category publication readiness scan
   - `add-pagebreaks.sh` — appends page-break divs for Kindle Create
   - `add-heading-spacing.sh` — inserts `<br>` after major headings
   - `md-to-docx.py` — converts assembled markdown to Word DOCX

   If the scripts exist at a known location in the C3PO repo, copy from there. Otherwise, create them fresh following the specifications in §Format Tools.

7. **Report** the file structure, stub count, and next steps.

---

## Branch: Write

**Purpose:** Draft manuscript content through autonomous AI writing, reader simulation, and voice calibration.

### Procedure

1. **Read the editorial inventory and story arc** (if they exist). Understand what needs writing.

2. **Establish voice.** If prior editions exist or the author has a distinct voice:
   - Analyze source text for sentence structure, argument techniques, tone markers
   - Produce a voice guide documenting positive patterns AND a negative-space catalog (AI defaults to suppress)
   - The voice guide is a Control arrow on every drafting function

3. **Draft content.** Write files one at a time or in batches. For each file:
   - Read any `**[TK]**` stub content for direction
   - Write to the target length (1,000-5,000 words)
   - Apply the voice guide
   - Use the annotation convention: `[Claude Code:]` for AI voice, leave space for `[WRA:]` author annotations

4. **Run reader simulations** after a complete draft exists. Create 2-3 reader personas:
   - Each persona evaluates on a 10-point scale
   - Personas should represent the target audience segments
   - Collect: score, reaction, severity assessment, recommended action
   - Flag structural/engagement gaps for revision before deep editing

5. **Voice calibration check.** Read the first paragraph of each chapter in sequence. Flag voice shifts between files — these indicate calibration failure.

6. **Report** files written, reader sim scores, voice calibration findings.

### Annotation Convention

Three published voices (maintained in final manuscript — they ARE the content):

| Tag | Voice | Published? |
|---|---|---|
| `[WRA:]` | Author's fresh commentary | Yes |
| `[WRA (from Nth edition):]` | Author's annotations from prior editions | Yes |
| `[Claude Code:]` | AI's projection of author perspective | Yes |

Editorial markers (stripped before publication):

| Tag | Purpose | Publication blocker? |
|---|---|---|
| `**[TK]**` | Content placeholder — MUST be filled | **Yes** |
| `**[Q:]**` | Question for author | No |
| `**[FACT-CHECK:]**` | Data verification needed | No |
| `**[VOICE:]**` | Flagged for voice calibration | No |
| `**[STET]**` | Author reviewed, keep as-is | No |
| `~~strikethrough~~` | Text being replaced | No |
| `**[NE:]**` | Edition-specific replacement marker (3E, 4E, etc.) | No |

---

## Branch: Edit

**Purpose:** Revise content through iterative conversation, produce front/back matter, and finalize the manuscript.

### Procedure

1. **Read the current manuscript state.** Check for `**[TK]**` markers, reader sim feedback, and author annotations.

2. **Process author annotations.** For each `[WRA:]` annotation:
   - If it contains direction ("rewrite this section"), execute
   - If it contains a reaction, preserve as-is (it's published content)
   - If it contains a question, answer inline with `[Claude Code:]`

3. **Front matter pass.** Each front matter file typically requires 4-7 revision cycles:
   - **Preface** — frame what changed since the prior edition; state the thesis
   - **Introduction** — orient the reader; be honest about current state vs. aspiration
   - **Acknowledgments** — strip to essentials; one line per person; avoid name-dropping if association could embarrass
   - **Foreword** — if commissioning from another AI or human, use a challenge format (not direction)
   - **Epigraph** — select a quotation the reader won't understand until they finish the book

4. **Back matter pass.**
   - **Afterword** — this often becomes the book's most important section through iteration; expect 5-7 major rewrites
   - **Glossary** — scan full manuscript for specialized terms; include terms coined, given specific meaning, or used differently from common usage; add cross-references to parts/chapters
   - **Bibliography** — ego-purge test: "Can the reader find this citation in the text?" If no, cut it. Move philosophical influences to acknowledgments
   - **Discussion Questions** — one per part, plus practitioner questions
   - **Postscript** — who is this book for? Frame as filter, not megaphone
   - **Colophon** — full production narrative; credit all AI systems; explain annotation convention

5. **Cross-reference audit.** Verify all chapter/section references point to correct locations. Verify all constraint codes, mechanism codes, and interface references match current state.

6. **Report** revision status, remaining `**[TK]**` markers, and readiness for formatting.

---

## Branch: Format

**Purpose:** Run QA, assemble the manuscript, and convert to print-ready DOCX. This is the engineering phase — no content changes.

### Procedure

1. **Run the QA gate.** Execute `qa-manuscript.sh` from `03-compilation/`. The script must exit 0 (clean) before proceeding. If findings exist, fix them first.

   **QA test categories:**
   - Unfinished placeholders (`[TK]`, `[TODO]`, `[note for`, `FIXME`, `3E-NOTE`)
   - Dangling footnote references (`See footnote` without actual footnote in file)
   - Deferred-work language (`add later`, `write when ready`, `come back to`)
   - Empty sections (heading followed by heading with no content — excludes title/subtitle pairs)
   - Orphaned annotations (brackets that aren't `[WRA:]`, `[Claude Code:]`, or `[WRA (from Nth edition):]` — excludes code blocks and template examples)
   - Repeated adjacent words (`the the`, `is is`)
   - File numbering gaps (missing files in the NN sequence)
   - Assembled manuscript staleness (first/last file content present in assembled version)
   - Stale terminology (project-specific retired terms with context-aware exclusions for narrative past-tense)

2. **Apply formatting rules.** Run these scripts in order from `03-compilation/`:

   ```
   bash add-pagebreaks.sh      # Page break divs at end of every file
   bash add-heading-spacing.sh  # <br> after # and ## headings
   ```

3. **Apply manual formatting rules** (not yet automated — check each):

   | Rule | What to check | Fix |
   |---|---|---|
   | **TOC line breaks** | TOC entries on separate lines need `<br>` after each (except last in group) | Add `<br>` tags |
   | **Sign-off line breaks** | Multi-line sign-offs (name/city/date, author/org) need `<br>` | Add `<br>` tags |
   | **Poetry/verse lines** | Consecutive verse lines need `<br>` between them | Add `<br>` tags |
   | **Metadata lines** | Author/Date/Version blocks need `<br>` | Add `<br>` tags |
   | **Horizontal rules** | `---` causes Kindle Create navigation faults — standalone on a page blocks arrow-key scrolling | Remove all `---` |
   | **Short standalone paragraphs** | Kindle Create auto-promotes short lines to chapter headings | Convert annotations to blockquotes (`> `) |
   | **File trees** | Inline annotations after tree elements cause word-wrap in narrow Kindle columns | Strip annotations from tree, move to bulleted list below |
   | **File trees (tags)** | Code fences (` ``` `) render with paragraph spacing between lines in Kindle | Use `<pre>` tags instead |
   | **Tables in code fences** | Tables inside ` ```markdown ` fences render as literal pipe-character text | Remove code fence; let table render natively |
   | **Chapter headings** | `# CHAPTER N` + `## Subtitle` on separate lines splits across pages in Kindle | Merge: `# CHAPTER N: Subtitle` |
   | **Multi-line blockquotes** | Only first line gets `> ` prefix from sed; continuation paragraphs need it too | Ensure every line in the block has `> ` prefix, including blank lines (`>`) |

4. **Assemble the manuscript.**

   ```
   bash assemble.sh
   ```

   This concatenates files 01-NN (excluding 00-*) into `02-final-drafts/[title].md`.

5. **Convert to DOCX.**

   ```
   python md-to-docx.py
   ```

   The converter handles:
   - `#` → Word Heading 1 (Kindle Create: CHAPTER TITLE), centered, 22pt, page break before
   - `##` → Word Heading 2 (Kindle Create: Subheading), 16pt
   - `###` → Word Heading 3 (Kindle Create: Sub-subheading), 13pt
   - `> [annotation]` → Indented italic blockquote, 10pt
   - Markdown tables → Word tables with grid
   - `<pre>` blocks → Monospace, tight line spacing (13pt)
   - Code fences → Monospace blocks
   - `<div style="page-break-after: always;"></div>` → Word page breaks
   - `<br>` → Consumed (spacing handled by heading styles)
   - Bulleted/numbered lists → Word list styles
   - Inline `**bold**`, `*italic*`, `` `code` `` → Word formatting
   - Default: Georgia 11pt, 8pt space_after, 15pt line spacing (1.3x)

   **Critical Kindle Create import note:** After importing the DOCX into Kindle Create, **reject all auto-formatting recommendations** ("Reject All"). The Word heading styles produce correct Kindle Create element mapping without KC's heuristic overrides.

6. **Verify in Kindle Create.** Import the DOCX. Check:
   - [ ] Page breaks between every file/chapter
   - [ ] Chapter titles in nav panel match expected structure
   - [ ] Subheadings render as subheadings (not promoted to chapter titles)
   - [ ] Annotations render as indented italic text (not promoted to headings)
   - [ ] Tables render with visible borders and correct column alignment
   - [ ] File trees render with tight line spacing and preserved tree characters
   - [ ] Code blocks render in monospace
   - [ ] Front matter (half-title, copyright, dedication, epigraph) each on their own page

7. **Report** assembly stats (file count, word count, paragraph count) and Kindle Create verification status.

---

## Branch: Release

**Purpose:** Walk the user through the complete KDP publishing process — Paperback Details, Paperback Content, Paperback Rights & Pricing — and produce all required artifacts.

### Before You Start

Prepare `04-amazon-release/amazon-release.md` with draft values for every field in the KDP reference table below. Review with the user. Then walk through KDP together, screen by screen.

### Procedure

#### Phase 1: Paperback Details

Walk the user through each field. Use the KDP Field Reference (§KDP Fields) for guidance on each decision.

1. **Language** — English (or appropriate language)
2. **Book Title** — as it appears on the cover
3. **Subtitle** — put in the Subtitle field, not in the Title field (KDP auto-inserts colon)
4. **Series** — create if multiple editions exist. Series title = book title, not company/publisher name. Reading order: Ordered for sequential editions.
5. **Edition Number** — numeric (1, 2, 3...)
6. **Author** — primary author name fields
7. **Contributors** — see §Contributors below
8. **Description** — 4,000 character limit. Draft with the user. Workshop the closing line — it should evoke, not explain. Don't fill the limit; 2,000-2,500 chars reads like a book jacket, not marketing copy.
9. **Publishing Rights** — "I own the copyright" for original works
10. **Primary Audience** — Not sexually explicit. Leave reading age blank unless children's/YA.
11. **Primary Marketplace** — Amazon.com
12. **Categories** — up to 3 BISAC categories. Select subcategory placements (e.g., "Generative AI" under AI & Machine Learning).
13. **Keywords** — up to 7, each ≤50 characters. Mix specific terms (methodology names) with audience identifiers.
14. **Publication Date** — "Publication date and release date are the same" for new works
15. **Release Date** — "Release now" (live within 72 hours) or schedule for coordinated launch

#### Phase 2: Paperback Content

16. **Print Options:**

| Option | Recommendation | Rationale |
|---|---|---|
| **Ink & Paper** | B&W cream for narrative nonfiction; B&W white for technical/reference | Cream is easier on eyes, signals trade nonfiction. White signals textbook. |
| **Trim Size** | 6 x 9 in (standard nonfiction) | ~220 words/page. 45K words ≈ 200 pages. |
| **Bleed** | No Bleed (unless edge-to-edge images) | |
| **Cover Finish** | Matte | Signals serious nonfiction. Fingerprints less. Glossy = mass-market/self-help. |

17. **Manuscript upload** — upload the KPF file from Kindle Create (not the DOCX directly)
18. **DRM** — recommend **No DRM** if the book serves as advertising/credibility rather than a revenue stream. No DRM = more sharing = more reach. DRM frustrates legitimate buyers and doesn't stop determined copying.
19. **AI-Generated Content** — Amazon requires disclosure:
   - **Texts:** Select the most accurate option. "Entire work, with extensive editing" if AI contributed to every section but the author exercised editorial judgment throughout.
   - **Tools:** Name each AI system and its company: e.g., "Claude (Anthropic)", "Grok (by xAI)"
   - **Images:** "None" unless AI generated cover or interior images
   - **Translations:** "None" unless applicable

20. **Quality review** — KDP flags spelling issues after upload. Triage each:
   - Fix genuine typos in source files, reassemble, re-upload
   - Ignore false positives (acronyms, neologisms like "onboarded")

#### Phase 3: Cover

See §Cover Pipeline for the full cover creation workflow.

21. **Cover Creator** or upload custom PDF. Cover Creator is faster; custom PDF gives full control.
22. **Front cover** — title, subtitle, author name. Font: clean sans-serif (Montserrat, Raleway, Lato). White text on dark backgrounds. Avoid serif fonts that compete with ornate imagery.
23. **Back cover:**
   - Author photo (top area) — authentic > professional. Tone-setting, not identification.
   - Book description blurb (~80-100 words) — teaser version of Amazon description, not the full thing.
   - About the author (~50-60 words) — role, credentials, location. One paragraph.
   - KDP auto-places ISBN barcode on back cover — leave room.
24. **Spine** — text only appears if 79+ pages (~0.5"+ spine width). Under 79 pages, spine is too thin for text.

#### Phase 4: Rights & Pricing

25. **Territories** — "All territories" unless rights are restricted
26. **Pricing** — set per marketplace. Consider: is this book advertising or revenue? Advertising = minimum viable price ($0.99 eBook, cost+ for paperback). Revenue = market rate.
27. **Royalty** — KDP offers 35% or 70% for eBooks (70% requires $2.99-$9.99 price). Paperback is fixed at 60% minus print cost.

#### Phase 5: Publish

28. **Review all three tabs** — Paperback Details, Content, Rights & Pricing should all show green checkmarks.
29. **Submit for review** — Amazon reviews in 24-72 hours. No edits possible during review.
30. **Repeat for eBook** if publishing both formats. KDP links them automatically if title/author match.

### Prior Edition Management

If updating a prior edition on Amazon:
- Update existing listing description to redirect to new edition
- Do NOT unpublish prior editions — they are historical records
- Add "See also: [Title] (Nth Edition)" to prior listing description

### Report

Show the user: formats submitted, pricing, estimated review time, any blocking items.

---

## Branch: Promote

**Purpose:** Create launch announcements and social media posts after publication.

### Procedure

1. **Read the manuscript and release metadata.** Understand the book's thesis, structure, and unique angles.

2. **Identify the hook.** The hook is NOT "I wrote a book" or "I used AI." The hook is the story that makes this book different from every other book. Examples:
   - The velocity story: "The architecture outran its own documentation three times in one month"
   - The fictional element: "A robot forgets a birthday song because of a firmware license"
   - The methodology: "Nonfiction framework delivered through fiction, like The Goal"
   - The transparency: "Amazon listing discloses 'Entire work, with extensive editing'"

3. **Draft the post.** Target: LinkedIn (primary channel for nonfiction business books). Structure:
   - **Opening line** — the hook. First sentence must stop the scroll.
   - **The story** — what happened, why it matters, what's different about this
   - **What's inside** — structure overview (bullet points or short list)
   - **The honest part** — what the book admits about its own limitations
   - **Comp titles** — if the book uses a known format (like The Goal's fictional narrative), name it
   - **Closing line** — reuse the description closer if it's strong enough
   - **Price + link** — last line, no fanfare

4. **Workshop with the user.** The post should match the book's voice. If the book is direct and honest, the post is direct and honest. No marketing-speak. No "excited to announce." No emojis unless the author uses them.

5. **Adapt for other platforms** if requested:
   - **X/Twitter** — compress to 280 chars. Hook + link only.
   - **Email** — longer form. Include the full description.
   - **Reddit** — match subreddit norms. No self-promotion framing; lead with value.

6. **Report** post drafts by platform.

### Quality Standards for Promotion

- **Know the book.** Read the manuscript before writing about it. Getting the fictional/nonfictional distinction wrong is unacceptable.
- **Match the voice.** The post is an extension of the book, not a press release.
- **Be honest.** If the book admits it's pre-revenue, the post admits it. If the book names its falsification criteria, the post can reference that honesty.
- **No vanity metrics.** Don't promise "bestseller" or "going viral." The book either resonates or it doesn't.

---

## Cover Pipeline

Three-step process for generating book covers using AI image generation:

### Step 1: Write the Prompt (Claude)

Write a vivid image generation prompt. Key considerations:

- **Full-wrap vs front-only:** If generating for Cover Creator, generate front cover only (portrait 2:3). If generating a custom PDF, generate the full wrap (landscape 16:9) with back cover (left half, dark/simple), spine (center, narrow), and front cover (right half, main scene).
- **Text zones:** Leave clear negative space where title (top), subtitle (middle), and author name (bottom) will be placed. Tell the image generator explicitly: "clear dark space in the upper area for title text."
- **Thumbnail test:** At Amazon thumbnail size (~120px wide), the core visual must be readable. High contrast, simple focal point, avoid fine details that disappear at small scale.
- **Style match:** Ornate imagery + clean typography = productive tension. Ornate + ornate = clutter. Match the cover's visual register to the book's tone.

### Step 2: Generate the Image (Grok Imagine)

- Run the prompt through Grok Imagine (x.ai)
- Use **16:9** ratio for full-wrap covers, **2:3** for front-cover-only
- Grok generates at ~1024px on the long side
- Generate 2-3 variations and compare
- Iterate on the prompt: add specifics for composition problems (e.g., "mirror wide enough to contain the full reflection," "chair facing away from viewer")

### Step 3: Upscale (Paint)

- Open the chosen image in MS Paint
- Resize to **400%** (Resize → Percentage → 400 horizontal, 400 vertical)
- Save as JPEG or TIFF
- This produces ~4096px on the long side — sufficient for KDP's 300 DPI requirement at 6x9 trim

**Note:** Paint uses nearest-neighbor interpolation (pixel duplication), which is technically lower quality than AI upscaling (Topaz Gigapixel, Magnific, Upscayl). For dark, moody, high-contrast cover images, the pixelation is invisible in the shadows. For detailed or bright images, consider an AI upscaler.

### Cover Creator Tips

If using KDP's built-in Cover Creator instead of a custom PDF:

- **Font:** Clean sans-serif. Montserrat (geometric, architectural), Raleway (elegant thin), or Lato (warm professional). Avoid serif fonts that compete with ornate imagery, script fonts, and condensed fonts.
- **Text color:** White or light cream on dark backgrounds. Don't match gold/metallic tones in the image — it reads as romance novel.
- **Back cover layout:** Author photo (top), about-the-author (~50-60 words), book blurb (~80-100 words), leave room for ISBN barcode (auto-placed by KDP).
- **Author photo:** Authentic > professional. The photo sets tone, not identification. AI-generated stylized photos work if based on real reference.

---

## Contributors and Copyright

### AI as Contributor

When AI systems contributed to the book, the KDP contributor field requires a decision with copyright implications:

| Role | Display on Amazon | Copyright Risk |
|---|---|---|
| **Contributions by** | "Contributions by [AI Name] ([Company])" | Lowest. Acknowledges contribution without claiming authorship. |
| **Author** | "[Human] (Author), [AI] (Author)" | Highest. US Copyright Office position: AI-generated content requires human authorship for copyright protection. Listing AI as "Author" could weaken copyright claims. |
| **Foreword** | "Foreword by [AI Name] ([Company])" | None. Accurate if the AI wrote the foreword. |

**Recommendation:** Use "Contributions by" for AI co-authors and "Foreword" for AI foreword writers. This provides full transparency while preserving the human author's copyright position. The book's internal attribution (colophon, annotations, copyright page) handles detailed credit.

### Naming Convention for AI Contributors

Use the AI's name as First Name and company as Last Name:
- First: `Claude` / Last: `Anthropic`
- First: `Grok` / Last: `xAI`

KDP renders as "Claude Anthropic" — not ideal but functional. If KDP rejects blank last name fields, use parentheses: Last: `(Anthropic)`.

---

## KDP Fields

Quick-reference for every field on the KDP Paperback Details page:

| Field | Guidance |
|---|---|
| Language | English |
| Book Title | As on cover. If title contains colon, put everything before colon in Title, rest in Subtitle |
| Subtitle | Goes in separate field — KDP inserts colon automatically |
| Series | Create if multiple editions. Title = book name, not publisher. Ordered reading. |
| Edition Number | Numeric: 1, 2, 3 |
| Author | Human author's legal name |
| Contributors | See §Contributors above |
| Description | ≤4,000 chars. Don't fill the limit. 2,000-2,500 = book jacket. Closer should evoke, not explain. |
| Publishing Rights | "I own the copyright" for original works |
| Sexually Explicit | No (unless applicable) |
| Reading Age | Leave blank unless children's/YA |
| Primary Marketplace | Amazon.com |
| Categories | Up to 3. Select subcategory placement within each. |
| Low-content / Large-print | Unchecked for standard books |
| Keywords | Up to 7, ≤50 chars each. Mix methodology terms + audience identifiers |
| Publication Date | "Same as release" for new works |
| Release Date | "Now" (72h) or scheduled |
| AI-Generated Content | Yes → select scope + name tools |
| DRM | No for advertising; Yes for revenue |

---

## Format Tools Reference

### assemble.sh

Concatenates all numbered manuscript files (01-NN, excluding 00-*) into a single assembled markdown file. Separator: three blank lines between files.

### qa-manuscript.sh

9-category publication readiness scan. Exits 0 if clean, 1 if findings detected. Categories listed in §Format Step 1. Context-aware: excludes code blocks, template examples, quoted examples, and narrative past-tense from stale-terminology checks.

### add-pagebreaks.sh

Appends `<div style="page-break-after: always;"></div>` to the end of every source file. Idempotent — skips files that already have the marker.

### add-heading-spacing.sh

Inserts `<br>` on the blank line between every `#` and `##` heading and its first paragraph. Only targets L1/L2 headings; `###` and deeper left tight. Idempotent.

### md-to-docx.py

Python script converting assembled markdown to Word DOCX. Uses `python-docx` library. Handles all manuscript conventions listed in §Format Step 5. Dependencies: `pip install python-docx markdown`.

---

## Quality Standards

- **QA gate is mandatory.** Never assemble without a clean QA pass. Zero tolerance for `[TK]` markers in assembled output.
- **Formatting is engineering, not editing.** The format phase makes zero content changes. If content problems are found during formatting, return to the edit phase.
- **Assembly is deterministic.** Running `assemble.sh` twice produces identical output. The script is the single source of truth for file ordering.
- **DOCX conversion is repeatable.** Running `md-to-docx.py` after any source change regenerates the DOCX. No manual Word editing — all formatting decisions live in the Python converter.
- **Kindle Create receives, it does not direct.** Reject KC's auto-formatting. The Word heading styles are the authority. KC's heuristics produce inconsistent results.
- **Annotations are content.** `[WRA:]` and `[Claude Code:]` voices are part of the published text. They are formatted as blockquotes for visual distinction but never stripped.
- **Working documents stay working.** Files prefixed `00-` are never assembled, never published, never deleted. They are the editorial memory of the project.
- **Prior editions are immutable.** Never modify a published edition's folder. Corrections go in the next edition.

---

## Portability

This skill works in any repository with a whitepapers folder (C3PO convention: `agents/librarian/products/library/make/whitepapers/`) or can be adapted to any folder structure. The scripts assume the four-subfolder convention (`01-prompts-and-drafts/`, `02-final-drafts/`, `03-compilation/`, `04-amazon-release/`) but paths are configurable.

The annotation convention (`[WRA:]`, `[Claude Code:]`) uses the C3PO voice tags. For other projects, replace with project-appropriate voice identifiers. The QA script's annotation check must be updated to match.

Copy `.claude/skills/publish/` to any project. The format tools in `03-compilation/` are the execution layer; the skill file is the orchestration layer.
