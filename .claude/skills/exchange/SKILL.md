---
name: exchange
description: Author or read governance exchange packages between C3PO and enterprise instances. Creates timestamped folders, writes MANIFESTs, and fulfills payload files.
---

# Exchange — Governance Package Operations

Author or read governance exchange packages following the C3PO exchange protocol defined in `ctrl-instance-governance-standard.md`.

## Invocation Forms

| Command | Behavior |
|---|---|
| `/exchange write` | Author an outbound exchange package. Detects context and asks for details. |
| `/exchange write to MCC` | Author outbound, instance pre-specified. Accepts fuzzy names. |
| `/exchange write amendment to TCC` | Author outbound with type pre-specified. |
| `/exchange read` | Read the most recent inbound exchange. |
| `/exchange read from TCC` | Read the most recent inbound exchange from a specific instance. |

Arguments are parsed loosely. All of these work:
- `/exchange write to Mountain Cabin Co`
- `/exchange write MCC amendment`
- `/exchange write amendment mcc`
- `/exchange read Trading Card Co`
- `/exchange read from tcc`

---

## Step 0: Context Detection

Determine which repo you are in:

1. **C3PO context** — `instances/` folder exists at project root.
   - Outbound exchanges are written to: `instances/[entity]/exchange/`
   - Inbound exchanges are read from: `instances/[entity]/exchange/` (where `direction` in MANIFEST points toward C3PO)

2. **Instance context** — `company/` folder exists at project root (and no `instances/` folder).
   - Outbound exchanges are written to: `system/exchange/`
   - Inbound exchanges are read from: `system/exchange/` (where `direction` in MANIFEST points toward the instance)

3. **Ambiguous** — neither signal is clear. Ask the user which context applies.

---

## Step 1: Instance Resolution (C3PO context only)

When in C3PO context, resolve the target instance from the user's input.

1. Scan `instances/*/` folder names to build the instance list.
2. Match the user's input loosely:
   - Exact folder name match: `mountain-cabin-co` → `mountain-cabin-co`
   - Abbreviation match: `MCC` → `mountain-cabin-co`, `TCC` → `trading-card-co`
   - Partial name match: `Mountain Cabin` → `mountain-cabin-co`, `Trading Card` → `trading-card-co`
   - Case-insensitive throughout
3. If zero matches → list available instances and ask the user to clarify.
4. If multiple matches → list the candidates and ask the user to clarify.
5. If exactly one match → proceed.

**Abbreviation heuristic:** Take the first letter of each word in the folder name (split on `-`). `mountain-cabin-co` → `MCC`, `trading-card-co` → `TCC`, `ouborobo` → `O`.

When in **instance context**, the target is always C3PO. No resolution needed.

### Instance Repo Registry

Maps instance folder names to their repo paths on disk. Used for delivery in Step 10.

| Instance Folder | Repo Path |
|---|---|
| `fine-higher-ordered-art` | `G:\My Drive\A0 Fine Higher Ordered Art` |
| `mountain-cabin-co` | `G:\My Drive\A0 Mountain Cabin Co` |
| `ouborobo` | `G:\My Drive\A0 Ouborobo` |
| `trading-card-co` | `G:\My Drive\A0 Trading Card Co` |

C3PO repo: `G:\My Drive\A0 C3PO`

When adding a new instance, add a row to this table.

---

## Step 2: Route to Write or Read

Parse the invocation arguments for the verb:
- `write` → go to **Write Flow** (Step 3)
- `read` → go to **Read Flow** (Step 10)
- If no verb is found → ask the user: "Are you writing an exchange or reading one?"

---

# Write Flow

## Step 3: Determine Exchange Type

Valid types: `onboarding`, `proposal`, `approval`, `amendment`, `status`, `acknowledgment`

Check if the user specified a type in the invocation (e.g., `/exchange write amendment to MCC`). If not, ask:

> What type of exchange is this?
> - **onboarding** — Initial governance package to a new instance
> - **proposal** — Proposing a change to boundary documents or reporting a structural gap
> - **approval** — Approving an instance proposal
> - **amendment** — Updating boundary documents (constraints, interfaces, approval gates)
> - **status** — Periodic status report or model update
> - **acknowledgment** — Confirming receipt and application of an exchange package

---

## Step 4: Gather Purpose and Rationale

If the conversation context does not already make the purpose and rationale clear, ask:

> What is this exchange delivering, and why?

Use the response (or existing conversation context) to draft the MANIFEST Purpose and Rationale sections.

---

## Step 5: Determine Payload Files

Based on the exchange type, purpose, and conversation context, determine what files belong in the package.

**Common patterns by type:**

| Type | Typical Payload |
|---|---|
| `onboarding` | `ctrl-enterprise-context.md`, `ctrl-instance-constraints.md`, `ctrl-instance-interfaces.md`, `ctrl-approval-gates.md`, `srs-seed-[entity].md` |
| `amendment` | Updated boundary doc(s) — constraints, interfaces, approval gates, enterprise context |
| `proposal` | Problem statement document, proposed changes |
| `approval` | Updated document(s) reflecting the approved proposal |
| `status` | Status report, model updates, sprint completion reports |
| `acknowledgment` | MANIFEST only (payload is the acknowledgment itself) |

Use the conversation context to determine the specific files. If uncertain, propose a file list and confirm with the user before proceeding.

**Source files in C3PO context:** When the payload includes enterprise documents (enterprise context, constraint library, skill files, etc.), copy from the canonical source in the C3PO repo. Source locations:
- Governance documents: `enterprise/process/controls/`, `enterprise/process/interfaces/`
- Skill files: `enterprise/production/eaas/make/registry/`
- Model files: `enterprise/production/eaas/make/model/`
- Data ontology: `enterprise/production/eaas/make/data/`

Always use the latest version.

---

## Step 6: Create the Exchange Folder

Compute the folder name: `YYYY-MM-DD-HHMM-[slug]`

- `YYYY-MM-DD` = today's date
- `HHMM` = current **local** time (24-hour, no colon). **Always include the time.**

**Timestamp acquisition:** Run this command to get the correct local date and time:
```bash
powershell -Command "Get-Date -Format 'yyyy-MM-dd-HHmm'"
```
Fallback (Git Bash): `date +%Y-%m-%d-%H%M` (without the `-u` flag — `-u` gives UTC, not local time).
**IMPORTANT:** Never use `date -u` — that returns UTC and will produce incorrect timestamps.
- `[slug]` = kebab-case description of the exchange purpose (e.g., `onboarding`, `hc05-amendment`, `acknowledgment-sdd-reference`, `enterprise-context-update`)

**Folder path:**
- C3PO context: `instances/[entity]/exchange/YYYY-MM-DD-HHMM-[slug]/`
- Instance context: `system/exchange/YYYY-MM-DD-HHMM-[slug]/`

Create the folder.

---

## Step 7: Write the MANIFEST

Write `MANIFEST.md` in the exchange folder using this format:

```markdown
---
direction: [Source] → [Target]
type: [exchange type]
date: YYYY-MM-DD
in-response-to: [folder name of the exchange this responds to, if applicable]
---

## Purpose

[1–3 sentences: what this exchange delivers and what action it requires.
Written as a precise summary — the receiving system should know exactly
what to do after reading this section.]

## Rationale

[1–3 paragraphs: why these changes are being made. What was discovered,
what evidence or implementation experience drove the recommendation,
what trade-offs were considered and why this path was chosen over
alternatives. Written for a reader who was not present for the decision.]

## Contents

1. `filename.md` — [one-line description]; install to [target path in receiving repo]
2. `filename.md` — [one-line description]; install to [target path]

## Required Actions

- [ ] [Specific action with clear target path or decision required]
- [ ] [Additional actions]
- [ ] Acknowledge receipt via exchange (type: acknowledgment) if governance documents were updated
```

**Direction format:**
- C3PO outbound: `C3PO → [Entity Name]` (e.g., `C3PO → Mountain Cabin Co`)
- C3PO inbound: `[Entity Name] → C3PO`
- Instance outbound: `[Instance Name] → C3PO`
- Instance inbound: `C3PO → [Instance Name]`

**`in-response-to`:** Include only if this exchange is a direct response to a prior exchange. Use the folder name (e.g., `2026-03-14-1600-acknowledgment`). Omit the field entirely if not applicable.

---

## Step 8: Fulfill the Manifest

Create every file listed in the MANIFEST Payload Contents section inside the exchange folder.

- **For documents that exist in the repo** (e.g., `ctrl-enterprise-context.md`): Read the canonical source and write a copy into the exchange folder. Use the filename specified in the Contents list.
- **For documents that must be authored** (e.g., amended constraints, proposals, status reports): Write them fresh based on the conversation context and the exchange purpose.
- **For reference copies with `ref-` prefix:** Copy the source document but rename with the `ref-` prefix as listed in Contents.

After writing all payload files, verify the folder contents match the Payload Contents list exactly. Report any discrepancies.

### Direct Placement Files

For files listed in the MANIFEST's "Direct Placement (hash-verified)" section:

1. **Hash the source file** before copying:
   ```bash
   sha256sum "[source-path]/[filename]"
   ```
2. **Copy the file directly** to the target location in the receiving repo (not into the exchange folder).
3. **Record the hash** in the MANIFEST table.

Direct placement is used for read-only reference files with a canonical source (e.g., enterprise skill files, FIPS standards, CAO methodologies). These files are identical across all instances — duplicating them in exchange folders is wasteful. The SHA-256 hash in the MANIFEST is the audit trail.

The receiving instance can verify any directly-placed file at any time:
```bash
sha256sum "[target-path]/[filename]"
# Compare output to MANIFEST hash — must match exactly
```

---

## Step 9: Quality Check and Report

Run through this checklist (derived from `ctrl-instance-governance-standard.md` §QA):

- [ ] MANIFEST.md includes all required sections (Purpose, Rationale, Contents, Required Actions)
- [ ] Direction is clearly stated
- [ ] Exchange type is valid
- [ ] Folder name follows `YYYY-MM-DD-HHMM-[slug]` convention with timestamp
- [ ] Every file listed in Payload Contents exists in the folder
- [ ] Every file listed in Direct Placement exists at its target path with matching SHA-256 hash
- [ ] Boundary documents define constraints and interfaces, not product specification
- [ ] Constraints reference specific codes from the constraint library
- [ ] Acknowledgment request is included in Required Actions (if governance docs updated)

Report the exchange package summary:

```
Exchange package ready:
  Path: [full folder path]
  Type: [type]
  Direction: [direction]
  Files: [count] ([list filenames])

Transfer action: Principal copies this folder to [target repo path].
```

---

## Step 10: Deliver to Target Repo

After the Principal reviews and approves the package, deliver it automatically.

**C3PO context (outbound to instance):**
1. Look up the instance's repo path from the Instance Repo Registry (Step 1).
2. Verify the target repo's `system/exchange/` folder exists. If not, create it.
3. Copy the entire exchange folder:
   ```bash
   cp -r "instances/[entity]/exchange/[folder-name]/" "[repo-path]/system/exchange/[folder-name]/"
   ```
4. Verify the copy by listing the delivered folder contents.
5. Report:
   ```
   Delivered to: [repo-path]/system/exchange/[folder-name]/
   Files: [count] ([list filenames])

   The instance can process this with: /exchange read
   ```

**Instance context (outbound to C3PO):**
1. **Determine your C3PO identity.** Get the current repo path (project root / working directory). Find the matching row in the Instance Repo Registry (Step 1) by comparing against the Repo Path column. The corresponding Instance Folder value is `[this-instance]`. If no match is found, ask the Principal for the C3PO folder name.
2. Copy the exchange folder to C3PO:
   ```bash
   cp -r "system/exchange/[folder-name]/" "G:\My Drive\A0 C3PO\instances\[this-instance]\exchange\[folder-name]/"
   ```
3. Verify and report as above.

**If the target repo path is not in the registry**, report the package as ready and ask the Principal to deliver manually (fallback to old behavior).

**The local copy is the permanent record.** The delivered copy is for the receiving repo to process. Both copies are identical and immutable.

---

# Read Flow

## Step 10: Locate Exchange Folders

**C3PO context:**
- If instance specified: scan `instances/[entity]/exchange/` for all exchange folders.
- If no instance specified: scan all `instances/*/exchange/` folders.

**Instance context:**
- Scan `system/exchange/` for all exchange folders.

Sort folders chronologically (lexicographic sort on folder names handles this since they are timestamp-prefixed).

---

## Step 11: Identify the Target Exchange

Find the most recent exchange folder. If the user specified a direction constraint (e.g., "from TCC"), filter to folders where the MANIFEST `direction` points inbound.

If no exchange folders exist, report: "No exchange folders found in [path]."

---

## Step 12: Read and Summarize

Read the MANIFEST.md in full. Read all payload files in the folder.

If the MANIFEST contains a "Direct Placement (hash-verified)" section, verify each file:

```bash
sha256sum "[installed-path]/[filename]"
```

Compare the output to the hash in the MANIFEST. Report:
- ✓ Hash matches — file verified
- ✗ Hash mismatch — file may have been modified after delivery
- ✗ File not found — direct placement may not have been executed

Present a summary:

```
## Exchange: [folder name]

**Direction:** [direction]
**Type:** [type]
**Date:** [date]
**In response to:** [if applicable]

### Purpose
[Summary of Purpose section]

### Contents
[List each file with one-line description]

### Required Actions
[List required actions with their status]

### Recommended Response
[Based on the exchange type and contents, suggest what action to take next:
- For proposals: evaluate and respond with approval/amendment/counter-proposal
- For amendments: apply the changes to company/process/ and acknowledge
- For acknowledgments: update tracking tasks (close CAO-XXX)
- For status: note any items requiring action]
```

---

## Governing Convention

This skill implements the exchange protocol defined in `ctrl-instance-governance-standard.md` §4–§5.

**Immutability rule:** Exchange folders are never modified after creation. If a correction is needed, create a new exchange folder.

**Timestamp rule:** Every exchange folder name MUST include the time component (`HHMM`). Folder names without timestamps are non-compliant.

**Portability:** This skill works in both C3PO and instance repos. Copy `.claude/skills/exchange/` to any instance project. Context detection (Step 0) handles the rest.
