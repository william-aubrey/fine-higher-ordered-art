---
name: onboard
description: Spawn a new enterprise instance — creates C3PO-side records, full instance repo on disk, governance documents, universal skills, and onboarding exchange package. Runs only in the C3PO repo.
---

# /onboard — Instance Spawning

Create a fully governed enterprise instance from minimal input. This skill runs in the C3PO repo and writes files to both the C3PO `instances/` folder and the new instance repo on disk.

## Invocation

```
/onboard
/onboard [entity display name]
```

If the entity name is provided, skip to Step 2. Otherwise, ask for it.

---

## Step 1: Gather Inputs

Collect three required inputs and two optional inputs. Use conversation context if already provided; only ask for what's missing.

| Input | Required | Example |
|---|---|---|
| **Display name** | Yes | Fine Higher Ordered Art |
| **Product thesis** | Yes | 1 paragraph: what the business does, for whom, where |
| **Folder name** | Yes (derive from display name if not given) | `fine-higher-ordered-art` |
| **Product name** | Yes (for `company/production/[product]/`) | `auction-platform`, `platform`, `cabin` |
| **NAICS code(s)** | Optional | 453920, 454110, 711510 |
| **Geography** | Optional | Digital / national, Alleghany County NC, etc. |

**Derive automatically:**

- **Abbreviation**: First letter of each word in folder name split on `-`. Example: `fine-higher-ordered-art` → `FHOA`, `mountain-cabin-co` → `MCC`.
- **Repo path**: `G:\My Drive\A0 [Display Name]` (confirm with user if unusual).

---

## Step 2: Timestamp

Get the local timestamp for exchange folder naming:

```bash
powershell -Command "Get-Date -Format 'yyyy-MM-dd-HHmm'"
```

Fallback: `date +%Y-%m-%d-%H%M`

---

## Step 3: Create C3PO-Side Instance Records

Create the internal instance folder structure:

```
instances/[folder-name]/
├── README.md
├── model/
│   ├── instance-model.md
│   └── instance-viewpoint.md
├── exchange/
└── srs/
```

### instance-viewpoint.md

Write a concise viewpoint document:

```markdown
# [Display Name] — Instance Viewpoint

**Entity:** [Display Name]
**Abbreviation:** [ABBREV]
**NAICS:** [codes if provided]
**Geography:** [geography if provided]
**Onboarding date:** [YYYY-MM-DD]

## Purpose

[Product thesis — verbatim from user input]

## Relationship to Enterprise

[1–2 sentences: how this instance fits in the C3PO portfolio. Reference the Maslow × Lifecycle × Beneficiary framework if applicable.]
```

### instance-model.md

Write an initial model with A-0 ICOM and placeholder A2 decomposition:

```markdown
# [Display Name] — Instance Model

## A-0: [Display Name]

| Role | Arrow |
|---|---|
| **Inputs** | [list — what the instance receives/consumes] |
| **Controls** | [list — constraints: law, governance, physics, approval gates] |
| **Outputs** | [list — what the instance produces] |
| **Mechanisms** | [list — what enables the instance: people, tools, agents, infrastructure] |

## Decomposition Status

| Node | Name | Status |
|---|---|---|
| A-0 | [Display Name] | ICOM-Complete |
| A1 | Governance | Inherited from enterprise |
| A2 | Production | Awaiting instance decomposition |
| A3 | Sales | Inherited from enterprise |
```

### README.md

```markdown
# [Display Name]

C3PO internal records for the [Display Name] instance.

- `model/` — C3PO's understanding of the instance structure
- `exchange/` — Governance exchange records
- `srs/` — Historical SRS snapshots (if any)
```

---

## Step 4: Author Governance Documents

Author four governance documents. These are instance-specific — use the product thesis, NAICS codes, and domain knowledge to determine appropriate constraints, interfaces, and approval gates.

### ctrl-instance-constraints.md

Structure:

```markdown
# Instance Constraints — [Display Name]

*Hard constraints this instance must honor at the A-0 boundary.*
*Source: C3PO enterprise governance (recommendation)*
*Date: [YYYY-MM-DD]*

---

| Code | Constraint | Rationale |
|---|---|---|
| HC-01 | [constraint] | [why] |
| HC-02 | [constraint] | [why] |
| ... | ... | ... |
```

**Guidance for authoring constraints:**
- Pull from the enterprise constraint library (`enterprise/process/controls/ctrl-constraint-library.md`) where applicable
- Add domain-specific constraints based on NAICS sector (e.g., art: IP rights, reproduction; construction: building codes; fintech: securities law)
- Always include: human approval before irreversible financial commitments
- Always include: secrets/credentials never in application code
- Aim for 6–10 constraints. Fewer is better if they're sharp.

### ctrl-instance-interfaces.md

Structure:

```markdown
# Instance Interfaces — [Display Name]

*Boundary contract between C3PO and [Display Name]*
*Date: [YYYY-MM-DD]*

---

## A-0 ICOM — [Display Name]

| Role | Arrow | Description |
|---|---|---|
| **I1** | [input] | [description] |
| **C1** | [control] | [description] |
| **O1** | [output] | [description] |
| **M1** | [mechanism] | [description] |

---

## Intercompany Interfaces

| Code | Name | Direction | Data/Trigger | Frequency |
|---|---|---|---|---|
| IC-[ABBREV]-01 | [name] | [direction] | [what flows] | [when] |
| IC-[ABBREV]-02 | [name] | [direction] | [what flows] | [when] |
```

**Standard intercompany interfaces (most instances need these):**
- Financial Reporting: Instance → WRA A11 (revenue, costs, tax)
- Legal Compliance: Instance → WRA A12 (terms, contracts, regulatory)
- Brand Identity: WRA A31 → Instance A2 (brand guidelines, messaging)
- Digital Infrastructure: WRA A14 → Instance A2 (hosting, domain, shared infra)

Add domain-specific interfaces as needed.

### ctrl-approval-gates.md

Structure:

```markdown
# Approval Gates — [Display Name]

*Which CXO agent approves which decision type.*
*Date: [YYYY-MM-DD]*

---

| Decision Type | Approving Agent | Trigger |
|---|---|---|
| Data model / architecture changes | CAO | Any structural change to core data or IDEF0 model |
| Financial commitments > $[threshold] | CFO | Spend above threshold |
| Legal / compliance posture changes | CLO | Terms of service, contracts, regulatory filings |
| Scope changes to gated features | CPO | Feature additions/removals that alter the A-0 boundary |
| Revenue model changes | CRO + CFO | Pricing, monetization, payment structure |
| Technical architecture decisions | CTO | Infrastructure, stack, deployment changes |
| Brand / public-facing messaging | CMO | Marketing, public communications |
| Hiring / contractor engagement | CHO | Any human resource commitment |
```

Customize thresholds and triggers for the instance's domain and scale.

### SRS Seed

Structure:

```markdown
# SRS Seed — [Display Name]

*Initial product specification — starting point, not permanent.*
*Author: C3PO (onboarding)*
*Date: [YYYY-MM-DD]*
*Status: Seed — instance owns this document after transfer*

---

## Product Thesis

[Verbatim product thesis from user input]

## Known Requirements

[3–8 initial functional requirements derived from the product thesis. Keep lightweight — the instance's A31 product management work will expand these.]

- **FR-1:** [requirement]
- **FR-2:** [requirement]
- ...

## Target Users / Agents

[Who are the agents (paying customers) for this instance?]

## Constraints

See `company/process/controls/ctrl-instance-constraints.md` for hard constraints.

## Next Steps

This SRS seed is a starting point. The instance should:
1. Execute A31 Product Management (ICP/JTBD research)
2. Expand requirements based on discovery
3. Decompose A2 Production based on the refined spec
```

---

## Step 5: Create Instance Repo on Disk

Create the Universal Instance Skeleton at the repo path:

```bash
# Create all directories — Universal Instance Skeleton v2
mkdir -p "[repo-path]/.claude/skills/sprint"
mkdir -p "[repo-path]/.claude/skills/exchange"
mkdir -p "[repo-path]/.claude/skills/spec"
mkdir -p "[repo-path]/agents/cao/processes"
mkdir -p "[repo-path]/agents/cao/products"
mkdir -p "[repo-path]/agents/cfo/processes"
mkdir -p "[repo-path]/agents/cfo/products"
mkdir -p "[repo-path]/agents/cho/processes"
mkdir -p "[repo-path]/agents/cho/products"
mkdir -p "[repo-path]/agents/clo/processes"
mkdir -p "[repo-path]/agents/clo/products"
mkdir -p "[repo-path]/agents/cmo/processes"
mkdir -p "[repo-path]/agents/cmo/products"
mkdir -p "[repo-path]/agents/coo/processes"
mkdir -p "[repo-path]/agents/coo/products"
mkdir -p "[repo-path]/agents/cpo/processes"
mkdir -p "[repo-path]/agents/cpo/products"
mkdir -p "[repo-path]/agents/cro/processes"
mkdir -p "[repo-path]/agents/cro/products"
mkdir -p "[repo-path]/agents/cto/processes"
mkdir -p "[repo-path]/agents/cto/products"
mkdir -p "[repo-path]/agents/librarian/processes"
mkdir -p "[repo-path]/agents/librarian/products/library/make/standards/idef0"
mkdir -p "[repo-path]/agents/librarian/products/library/learn/deposits"
mkdir -p "[repo-path]/agents/librarian/products/library/learn/fetch"
mkdir -p "[repo-path]/agents/librarian/products/library/define"
mkdir -p "[repo-path]/company/process/controls"
mkdir -p "[repo-path]/company/process/functions"
mkdir -p "[repo-path]/company/process/interfaces"
mkdir -p "[repo-path]/company/production/[product-name]/make"
mkdir -p "[repo-path]/company/production/[product-name]/learn"
mkdir -p "[repo-path]/company/production/[product-name]/define"
mkdir -p "[repo-path]/company/sales"
mkdir -p "[repo-path]/system/archive"
mkdir -p "[repo-path]/system/exchange"
mkdir -p "[repo-path]/system/log"
mkdir -p "[repo-path]/system/sprints"
mkdir -p "[repo-path]/system/transcripts"
```

### Copy files to instance repo:

### Payload files (instance-specific, authored):

| Source (C3PO repo) | Target (instance repo) | Notes |
|---|---|---|
| `.claude/skills/sprint/SKILL.md` | `.claude/skills/sprint/SKILL.md` | Universal skill — copy verbatim |
| `.claude/skills/exchange/SKILL.md` | `.claude/skills/exchange/SKILL.md` | Universal skill — copy verbatim |
| `.claude/skills/spec/SKILL.md` | `.claude/skills/spec/SKILL.md` | Universal skill — copy verbatim |
| `enterprise/process/controls/ctrl-enterprise-context.md` | `company/process/controls/ctrl-enterprise-context.md` | Latest version |
| [authored] `ctrl-instance-constraints.md` | `company/process/controls/ctrl-instance-constraints.md` | From Step 4 |
| [authored] `ctrl-instance-interfaces.md` | `company/process/interfaces/ctrl-instance-interfaces.md` | From Step 4 |
| [authored] `ctrl-approval-gates.md` | `company/process/controls/ctrl-approval-gates.md` | From Step 4 |
| [authored] SRS seed | `company/production/[product]/define/srs-[folder-name].md` | From Step 4 |

### Direct placement files (universal, hash-verified):

These files are copied directly to their target locations. SHA-256 hashes are recorded in the MANIFEST (Step 6) but the files themselves are NOT duplicated in the exchange folder.

| Source (C3PO repo) | Target (instance repo) | Notes |
|---|---|---|
| `enterprise/production/eaas/make/registry/skill-*.md` (31 files) | `company/process/functions/` | Enterprise IDEF0 decomposition — read-only |
| `agents/cao/processes/agent-instantiation-process.md` | `agents/cao/processes/` | CAO methodology |
| `agents/cao/processes/spec-driven-development.md` | `agents/cao/processes/` | CAO methodology |
| `agents/cao/processes/publication-authoring-process.md` | `agents/cao/processes/` | CAO methodology |
| `agents/librarian/products/library/make/standards/idef0/idef0.md` | `agents/librarian/products/library/make/standards/idef0/` | FIPS PUB 183 (markdown) |
| `agents/librarian/products/library/make/standards/idef0/idef0.pdf` | `agents/librarian/products/library/make/standards/idef0/` | FIPS PUB 183 (PDF) |
| `agents/librarian/products/library/learn/deposits/README.md` | `agents/librarian/products/library/learn/deposits/` | Intake queue README |
| `agents/librarian/processes/process-youtube-video-analysis-v03.md` | `agents/librarian/processes/` | Librarian process (seed) |

Hash each source file before copying:
```bash
sha256sum "[source-path]/[filename]"
```
Record all hashes in the MANIFEST's Direct Placement section.

### Write company/process/README.md:

```markdown
# Process Definitions

Process definitions for [Display Name]. Some files were seeded from C3PO enterprise governance recommendations and are maintained by this instance.

Changes that affect boundary contracts (A-0 ICOM, intercompany interfaces) should be communicated via `/exchange write`.

- `controls/` — Constraints, enterprise context, approval gates
- `functions/` — Enterprise IDEF0 decomposition (C3PO read-only — 31 skill files)
- `interfaces/` — Boundary contracts and intercompany interface definitions
```

### Write company/[folder-name]-soul.md:

```markdown
# [Display Name] — Soul

*What this company is, why it exists, and what it will not compromise.*

## Mission

[1–2 sentences derived from product thesis]

## Values

[3–5 values derived from domain and product thesis]

## Product Thesis

[Verbatim from user input]

## What We Will Not Compromise

[2–3 non-negotiable principles — derived from constraints and domain]
```

### Write CLAUDE.md:

This is the most critical file. It must orient the instance's Claude to:
1. What the project is (display name, product thesis, domain)
2. How governance works (boundary-enforcement model)
3. What skills are available (/sprint, /exchange, /spec)
4. Key file locations
5. The instance's A-0 ICOM (what it produces, what constrains it)
6. Current status and immediate next steps

**Template structure:**

```markdown
# [Display Name]

[1–2 sentence project description]

## What This Is

[Display Name] is an enterprise instance governed by the C3PO framework (Ouroborotic Robotics LLC). It operates under a boundary-enforcement governance model:

- **C3PO-seeded documents** in `company/process/` — constraints, interfaces, approval gates, enterprise context. `company/process/functions/` contains the enterprise IDEF0 decomposition (C3PO read-only). Changes that affect boundary contracts should be communicated via `/exchange write`.
- **Instance-owned documents** in `company/production/` — product specification, user journeys, design docs. This instance owns and evolves these freely within boundary constraints.
- **Agents** in `agents/` — All 10 agents (9 CXO + Librarian) are pre-instantiated with context, tasks, processes/, products/. Agents activate when their domain has work.

## Product Thesis

[Product thesis]

## A-0 Boundary (What This Instance Does)

| Role | Arrow |
|---|---|
| **Inputs** | [from instance-interfaces.md] |
| **Controls** | [from instance-interfaces.md] |
| **Outputs** | [from instance-interfaces.md] |
| **Mechanisms** | [from instance-interfaces.md] |

## Key Constraints

[Top 3–5 most important constraints from ctrl-instance-constraints.md, summarized]

## Project Structure

- `agents/` — All 10 agents (9 CXO + Librarian), each with context, tasks, processes/, products/
  - `agents/cao/` — Chief Architecture Officer (processes/ has AIP, SDD, PAP)
  - `agents/librarian/` — Reference material curator (products/library/{build,prototype,specs})
  - `agents/{cfo,cho,clo,cmo,coo,cpo,cro,cto}/` — CXO agents (folders ready, activate when needed)
- `company/` — Business definition, process, and production
  - `company/process/controls/` — Governance constraints, enterprise context, approval gates
  - `company/process/functions/` — Enterprise IDEF0 decomposition (C3PO read-only)
  - `company/process/interfaces/` — Boundary contracts
  - `company/production/[product]/` — Product implementation ({build, prototype, specs})
  - `company/sales/` — Sales-related materials
- `system/` — Operational infrastructure
  - `system/exchange/` — Governance communication records (immutable)
  - `system/sprints/` — Sprint history
  - `system/log/` — Reasoning logs

## Skills

- `/sprint open [topic]` — Start a work session (restores context from last sprint)
- `/sprint close` — End a work session (writes narrative, updates tasks)
- `/exchange write` — Author an outbound governance exchange package
- `/exchange read` — Read the most recent inbound exchange
- `/spec start` — Initialize a specification lifecycle for a product
- `/spec [who|how|what|build|simulate]` — Execute spec phases

## Current Status

**Onboarded:** [YYYY-MM-DD]
**Stage:** Pre-production — SRS seed in `company/production/[product]/define/`, awaiting A31 product management

## Next Steps

1. Review SRS seed in `company/production/[product]/define/srs-[folder-name].md`
2. Begin A31 Product Management: ICP/JTBD research → feature roadmap
3. Decompose A2 Production based on refined requirements
```

### Write TASKS.md:

```markdown
# Tasks

## Backlog

### Getting Started
- [ ] Review SRS seed (`company/production/[product]/define/srs-[folder-name].md`) — validate or revise initial requirements
- [ ] Execute A31 Product Management: define ICP (Ideal Customer Profile) and JTBD (Jobs to Be Done)
- [ ] Build feature roadmap from ICP/JTBD output
- [ ] Decompose A2 Production into instance-specific sub-functions

### Governance
- [ ] Review governance documents in `company/process/` — confirm understanding of constraints and approval gates
- [ ] Acknowledge onboarding exchange via `/exchange write acknowledgment`
```

---

## Step 6: Create Onboarding Exchange Package

Create the exchange package in C3PO's instance folder:

```
instances/[folder-name]/exchange/[TIMESTAMP]-onboarding/
├── MANIFEST.md
├── ctrl-enterprise-context.md
├── ctrl-instance-constraints.md
├── ctrl-instance-interfaces.md
├── ctrl-approval-gates.md
├── srs-seed-[folder-name].md
├── SKILL-sprint.md
├── SKILL-exchange.md
└── SKILL-spec.md
```

### MANIFEST.md:

```markdown
---
direction: C3PO → [Display Name]
type: onboarding
date: [YYYY-MM-DD]
authored-by: CAO
---

## Purpose

Initial governance package for [Display Name]. Delivers boundary contract documents, SRS seed, and universal skills. The instance should review and acknowledge.

## Rationale

[Display Name] is a new enterprise instance of Ouroborotic Robotics LLC. This package establishes the governance relationship: C3PO defines boundary contracts (A-0 ICOM, constraints, interfaces, approval gates), the instance owns its product specification and internal processes. Universal skills (/sprint, /exchange, /spec) enable immediate operational capability.

## Payload Contents

1. `ctrl-enterprise-context.md` — Enterprise governance context; install to `company/process/controls/`
2. `ctrl-instance-constraints.md` — Instance-specific hard constraints; install to `company/process/controls/`
3. `ctrl-instance-interfaces.md` — A-0 ICOM boundary contract + intercompany interfaces; install to `company/process/interfaces/`
4. `ctrl-approval-gates.md` — CXO approval gate matrix; install to `company/process/controls/`
5. `srs-seed-[folder-name].md` — Initial product specification; install to `company/production/[product]/define/srs-[folder-name].md`
6. `SKILL-sprint.md` — Universal sprint lifecycle skill; install to `.claude/skills/sprint/SKILL.md`
7. `SKILL-exchange.md` — Universal exchange protocol skill; install to `.claude/skills/exchange/SKILL.md`
8. `SKILL-spec.md` — Universal spec lifecycle skill; install to `.claude/skills/spec/SKILL.md`

## Direct Placement (hash-verified)

Files placed directly into their target locations (not in this folder).
The SHA-256 hash is the audit trail — verify with `sha256sum [file]`.

| # | File | Installed to | SHA-256 |
|---|---|---|---|
| 9–38 | skill-A*.md (30 files) | `company/process/functions/` | [hashes] |
| 39 | agent-instantiation-process.md | `agents/cao/processes/` | [hash] |
| 40 | spec-driven-development.md | `agents/cao/processes/` | [hash] |
| 41 | publication-authoring-process.md | `agents/cao/processes/` | [hash] |
| 42–50 | cXo-context.md (9 CXO agents) | `agents/cXo/` | [hashes] |
| 51 | librarian-context.md | `agents/librarian/` | [hash] |
| 52 | idef0.md | `agents/librarian/products/library/make/standards/idef0/` | [hash] |
| 53 | idef0.pdf | `agents/librarian/products/library/make/standards/idef0/` | [hash] |
| 54 | README.md (deposits) | `agents/librarian/products/library/learn/deposits/` | [hash] |
| 55 | process-youtube-video-analysis-v03.md | `agents/librarian/processes/` | [hash] |

### Seeded files (authored per-instance, not hash-verified):

These files are created fresh for each instance with empty backlogs. They are NOT direct-placed from C3PO.

| # | File | Location | Notes |
|---|---|---|---|
| 56–64 | cXo-tasks.md (9 CXO agents) | `agents/cXo/` | Empty backlog, agent-specific header |
| 65 | librarian-tasks.md | `agents/librarian/` | Empty backlog |

## Required Actions

- [ ] Review all governance documents in `company/process/`
- [ ] Review SRS seed in `company/production/[product]/define/`
- [ ] Verify direct-placement files: `sha256sum [file]` matches MANIFEST hash
- [ ] Acknowledge receipt via `/exchange write acknowledgment`
```

**Also copy the exchange package to the instance repo:**

```bash
cp -r "instances/[folder-name]/exchange/[TIMESTAMP]-onboarding" "[repo-path]/system/exchange/"
```

Since the skill already places all files in their correct locations (Step 5), the exchange package in the instance repo serves as the immutable onboarding record — the instance doesn't need to re-apply the Required Actions manually.

---

## Step 7: Register in C3PO Systems

### 7a: Update Instance Repo Registry

Add a row to the Instance Repo Registry table in `.claude/skills/exchange/SKILL.md`:

```markdown
| [folder-name] | [repo-path] |
```

### 7b: Register Intercompany Interfaces

Add IC codes to `enterprise/process/interfaces/ctrl-interface-register.md`:
- Add entries to the Intercompany Interfaces section
- Add rows to the Summary Index table
- Follow the existing format (see IC-TCC-01 through IC-MCC-04 for examples)

### 7c: Update Process Distribution Register (if skill files distributed)

If any enterprise skill files were included in the onboarding package (beyond the universal sprint/exchange/spec skills), add rows to `enterprise/process/interfaces/ctrl-process-distribution-register.md`.

---

## Step 8: Initialize Git

```bash
cd "[repo-path]" && git init && git add -A && git commit -m "Initial commit: onboarding from C3PO"
```

---

## Step 9: Report

Show the user:

```
## Onboarding Complete: [Display Name]

**Instance repo:** [repo-path]
**C3PO records:** instances/[folder-name]/
**Exchange package:** instances/[folder-name]/exchange/[TIMESTAMP]-onboarding/

### Created in C3PO
- instances/[folder-name]/README.md
- instances/[folder-name]/model/instance-model.md
- instances/[folder-name]/model/instance-viewpoint.md
- instances/[folder-name]/exchange/[TIMESTAMP]-onboarding/ (8 files)

### Created in Instance Repo
- CLAUDE.md
- TASKS.md
- company/ (soul doc, process/{controls,functions,interfaces}, production/)
- agents/ (10 agents: cao, cfo, cho, clo, cmo, coo, cpo, cro, cto, librarian — each with context, tasks, processes/, products/)
- system/ (archive, exchange, log, sprints, transcripts)
- .claude/skills/ (sprint + exchange + spec)
- system/exchange/[TIMESTAMP]-onboarding/ (onboarding record)

### Registered
- Instance Repo Registry: [folder-name] → [repo-path]
- Interface Register: IC-[ABBREV]-01 through IC-[ABBREV]-XX
- Git initialized with initial commit

### Next Steps for Principal
1. Open VS Code at `[repo-path]`
2. Start a Claude conversation
3. Run `/sprint open` — Claude will read CLAUDE.md and be immediately oriented
4. The instance can acknowledge onboarding with `/exchange write acknowledgment`
```

---

## Quality Standards

- **CLAUDE.md is the priority.** If nothing else is perfect, get CLAUDE.md right. It's what makes the instance's Claude immediately productive.
- **Constraints must be domain-appropriate.** Don't copy TCC's constraints for a construction company. Use the NAICS code and product thesis to determine what matters.
- **A-0 ICOM must be complete.** All four roles (I, C, O, M) specified with concrete arrows.
- **No manual copying required.** The skill writes every file to both C3PO and the instance repo. The Principal's only action is opening a new VS Code window.
- **Exchange package is the audit record.** Pre-placed files + MANIFEST hashes = complete provenance.
- **Git must be initialized.** The instance repo starts clean with one initial commit.
- **Soul document is mandatory.** Every instance gets a soul document at `company/[entity]-soul.md`.
- **All 10 agents are instantiated at onboarding.** All 9 CXO agents + Librarian get the standard folder structure (context, tasks, processes/, products/). Context files are direct-placed from C3PO templates. Task files are seeded fresh. Agents activate when their domain has work.
