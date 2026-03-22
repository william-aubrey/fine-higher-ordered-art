# Instance Instantiation Process (IIP) — Process Guide

**IDEF0 Role:** Mechanism (executes the instance spawning function at the enterprise level)
**Authority:** C3PO enterprise standard. Executed by C3PO CAO only.
**Owner:** CAO
**Location:** `agents/cao/processes/instance-instantiation-process.md`
**Executable skill:** `.claude/skills/onboard/SKILL.md` (the `/onboard` command automates this process)
**Companion:** `agents/cao/processes/agent-instantiation-process.md` (AIP — what happens after the instance exists)

---

**Purpose:** A methodology for spawning a fully governed enterprise instance from minimal input. The CAO creates C3PO-side records, authors governance documents, builds the instance repo on disk with the Universal Instance Skeleton v2, delivers the enterprise IDEF0 function decomposition, and produces an immutable onboarding exchange package.

**Audience:** The C3PO CAO and Principal. This process runs in the C3PO repo and writes files to both C3PO's `instances/` folder and the new instance repo on disk.

**Relationship to AIP:** IIP creates the instance. AIP creates the agents inside the instance. IIP runs once at onboarding. AIP runs each time the instance CAO instantiates a new agent.

---

## The 9-Step Process

### Step 1: Gather Inputs

Collect from the Principal:

| Input | Required | Example |
|---|---|---|
| **Display name** | Yes | Fine Higher Ordered Art |
| **Product thesis** | Yes | 1 paragraph: what the business does, for whom, where |
| **Folder name** | Yes (derive from display name) | `fine-higher-ordered-art` |
| **Product name** | Yes (for `company/production/[product]/`) | `auction-platform` |
| **NAICS code(s)** | Optional | 453920, 454110, 711510 |
| **Geography** | Optional | Digital / national, Alleghany County NC, etc. |

Derive automatically:
- **Abbreviation:** First letter of each word in folder name. `fine-higher-ordered-art` → `FHOA`
- **Repo path:** `G:\My Drive\A0 [Display Name]`

### Step 2: Create C3PO-Side Instance Records

In the C3PO repo, create:

```
instances/[folder-name]/
├── README.md              ← Orientation for C3PO-side records
├── model/
│   ├── instance-model.md  ← C3PO's view: A-0 ICOM + decomposition status
│   └── instance-viewpoint.md ← Purpose, scope, relationship to enterprise
├── exchange/              ← Exchange records (immutable)
└── srs/                   ← Historical SRS snapshots
```

The instance model starts with A-0 ICOM-Complete, A1/A3 inherited from enterprise, A2 awaiting instance decomposition.

### Step 3: Author Governance Documents

Author four instance-specific governance documents:

1. **ctrl-instance-constraints.md** — Hard rules derived from NAICS codes, geography, domain, and enterprise constraint library. Instance-specific, not copied from another instance.
2. **ctrl-instance-interfaces.md** — A-0 ICOM boundary contract + intercompany interfaces (IC-[ABBREV]-01 through IC-[ABBREV]-XX).
3. **ctrl-approval-gates.md** — CXO approval gate matrix for this instance. Which agents approve which decision types.
4. **srs-seed-[entity].md** — Initial product specification derived from the product thesis. Starting point, not permanent — the instance evolves this freely.

### Step 4: Create Instance Repo on Disk

Build the Universal Instance Skeleton v2:

```
[instance-repo]/
├── .claude/skills/{sprint, exchange, spec}/SKILL.md
├── agents/                        ← All 10 agents instantiated at onboarding
│   ├── cao/
│   │   ├── cao-tasks.md
│   │   ├── processes/         ← CAO methodologies (AIP, SDD, PAP)
│   │   └── products/          ← CAO work products (instance model)
│   ├── cfo/
│   │   ├── cfo-tasks.md
│   │   ├── processes/
│   │   └── products/
│   ├── cho/ ... clo/ ... cmo/ ... coo/ ... cpo/ ... cro/ ... cto/
│   │   (same structure: context, tasks, processes/, products/)
│   └── librarian/
│       ├── librarian-context.md
│       ├── librarian-tasks.md
│       ├── processes/         ← Intake and cataloging procedures
│       └── products/
│           └── library/       ← Named product: the curated reference library
│               ├── build/     ← Cataloged shelves (standards/, etc.)
│               │   └── standards/
│               │       └── idef0/ ← FIPS PUB 183
│               ├── prototype/
│               │   ├── deposits/  ← Push intake queue
│               │   └── fetch/     ← Pull intake (processed immediately)
│               └── specs/     ← Shelf templates
├── company/
│   ├── [entity]-soul.md
│   ├── process/
│   │   ├── controls/          ← Governance docs (from Step 3)
│   │   ├── functions/         ← Enterprise IDEF0 decomposition (from Step 5)
│   │   └── interfaces/        ← Boundary contracts (from Step 3)
│   ├── production/
│   │   └── [product-name]/
│   │       ├── build/
│   │       ├── prototype/
│   │       └── specs/         ← SRS seed lands here
│   └── sales/
├── system/{archive, exchange, log, sprints, transcripts}/
├── CLAUDE.md
└── TASKS.md
```

Pre-place all governance documents into their target locations. Pre-place skills.

### Step 5: Deliver Enterprise IDEF0 Decomposition

Direct-place the following files (hash-verified, not duplicated in exchange folder):

- **31 enterprise skill files** from `enterprise/production/eaas/build/registry/` → `company/process/functions/`
- **FIPS PUB 183** (idef0.md + idef0.pdf) from `agents/librarian/products/library/build/standards/idef0/` → `agents/librarian/products/library/build/standards/idef0/`
- **CAO methodologies** (AIP, SDD, PAP) from `agents/cao/processes/` → `agents/cao/processes/`

SHA-256 hash each file before copying. Record all hashes in the MANIFEST (Step 6).

### Step 6: Create Onboarding Exchange Package

Create the exchange package in C3PO's instance folder. The MANIFEST uses two delivery modes:

**Payload files** (in the exchange folder — instance-specific, authored fresh):
- ctrl-enterprise-context.md
- ctrl-instance-constraints.md
- ctrl-instance-interfaces.md
- ctrl-approval-gates.md
- srs-seed-[entity].md
- SKILL-sprint.md, SKILL-exchange.md, SKILL-spec.md

**Direct placement** (hash-verified — universal files, canonical source):
- 31 skill files → company/process/functions/
- FIPS PUB 183 → agents/librarian/products/library/build/standards/idef0/
- CAO methodologies → agents/cao/processes/

Copy the exchange package to the instance repo's `system/exchange/` as the immutable onboarding record.

### Step 7: Register in C3PO Systems

- Add row to Instance Repo Registry in `/exchange` skill
- Register IC-[ABBREV] codes in `ctrl-interface-register.md`
- Add rows to `ctrl-process-distribution-register.md` for all delivered skill files

### Step 8: Initialize Git

```bash
cd "[repo-path]" && git init && git add -A && git commit -m "Initial commit: onboarding from C3PO"
```

### Step 9: Report

Show the Principal: repo location, C3PO records, exchange package, all created files, registered interfaces, next steps (open VS Code → `/sprint open` → acknowledge with `/exchange write acknowledgment`).

---

## Relationship to Other Methodologies

| Methodology | Relationship |
|---|---|
| Agent Instantiation Process (AIP) | IIP creates the instance. AIP creates agents inside it. IIP runs once; AIP runs per agent. |
| Spec-Driven Development (SDD) | After onboarding, the instance uses SDD to build product specifications. The SRS seed from Step 3 is the starting point. |
| Publication Authoring Process (PAP) | Instances may use PAP to produce publications. Delivered via CAO methodologies in Step 5. |
| `/onboard` skill | The executable automation of this process. The skill follows this methodology step by step. |

---

## Quality Standards

- **CLAUDE.md is the priority.** It's what makes the instance's Claude immediately productive.
- **Constraints must be domain-appropriate.** Use NAICS codes and product thesis, not copy-paste from another instance.
- **A-0 ICOM must be complete.** All four roles specified with concrete arrows.
- **No manual copying required.** The process writes every file to both repos.
- **Exchange package is the audit record.** Pre-placed files + MANIFEST hashes = complete provenance.
- **Soul document is mandatory.** Every instance gets `company/[entity]-soul.md`.
- **All 10 agents are instantiated at onboarding.** All 9 CXO agents + Librarian get the standard folder structure (context, tasks, processes/, products/). Context files are direct-placed from C3PO templates. Task files are seeded fresh with empty backlogs. Agents activate when their domain has work — the folders are ready before the agent is needed.

---

*This methodology was formalized during the Universal Skeleton v2 sprint (2026-03-22) alongside the three-layer IP flow model proposed by TCC CAO. It supersedes the ad-hoc onboarding process used for the first four instances and documents what the `/onboard` skill automates.*
