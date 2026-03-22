# Instance Governance Standard

*Governing standard for the C3PO ↔ Instance relationship*
*Author: WRA | Created: 2026-03-14 | Revised: 2026-03-22*
*Applies to: All enterprise instances (subsidiaries, products, projects)*
*Governed by: ctrl-decomposition-rules.md R5.1, R5.2, R-18*

---

## Purpose

This standard defines how C3PO (the enterprise architect) relates to its instances (subsidiaries, product entities, implementation projects). C3PO produces architectural abstractions — constraint codes, interface definitions, process knowledge, and the Universal Instance Skeleton. These flow to instances as **recommendations via the exchange protocol**. Each instance adopts, adapts, or rejects them based on its own business judgment.

**Core principle:** Compliance is measured at the A-0 boundary, not inside the repo. C3PO cares that the instance produces the Outputs defined in its intercompany interfaces and honors the Constraints encoded in its boundary contract. How the instance organizes its files, names its folders, or implements its processes is the instance's own responsibility.

---

## 1. Boundary-Enforcement Authority Model

### C3PO Produces Abstractions

C3PO defines **boundary contracts**: the A-0 ICOM for each instance, constraint codes, interface definitions, approval gate matrices, and process knowledge (skill files, methodologies, spec profiles). These are architectural outputs — not commands.

| Document | Purpose | Delivery Mechanism |
|---|---|---|
| `ctrl-enterprise-context.md` | Agent personas, mandates, company soul, product thesis | Exchange package → `company/process/controls/` |
| `ctrl-instance-constraints.md` | Hard rules the instance must honor at the boundary | Exchange package → `company/process/controls/` |
| `ctrl-instance-interfaces.md` | A-0 ICOM boundary contract + intercompany interfaces | Exchange package → `company/process/interfaces/` |
| `ctrl-approval-gates.md` | CXO approval gate matrix | Exchange package → `company/process/controls/` |
| Enterprise function decomposition | IDEF0 skill files (540 leaf nodes) | Direct placement → `company/process/functions/` |
| CAO methodologies | Process guides (SDD, PAP, AIP) | Direct placement → `agents/cao/processes/` |

### Instances Own Their Repos

Every file in an instance repo is owned by that instance. The instance has full write access to everything. When C3PO delivers governance documents via exchange:

1. The exchange package arrives in `system/exchange/[timestamp-slug]/`
2. The instance reads the MANIFEST and payload files
3. The instance installs relevant files into `company/process/` subfolders
4. The instance may adapt mechanisms for its domain (a construction company operates differently than a software company)
5. The instance must honor constraints at the boundary level

This is not a direct write from C3PO into the instance's process folder. The exchange is the delivery mechanism. The instance decides what to install and how to adapt it. The exchange record in `system/exchange/` is the immutable audit trail of what was recommended.

### Compliance Is Measured at the Boundary

C3PO does not care how an instance organizes its repo or what it calls its governance folder. C3PO cares that the instance:

- **Produces the Outputs** defined in its intercompany interfaces (IC-XXX codes)
- **Honors the Constraints** encoded in `ctrl-instance-constraints.md`
- **Maintains the Interfaces** defined in the A-0 ICOM boundary contract
- **Respects approval gates** for gated decision types

### Instance-Authored vs. C3PO-Seeded

The concept of document origin remains useful:

| Origin | Description | Instance Authority |
|---|---|---|
| **C3PO-seeded** | Documents delivered from C3PO via exchange (constraints, interfaces, enterprise context) | Instance owns the installed copy. May adapt mechanisms. Must honor boundary-affecting constraints. Changes that alter the A-0 boundary should be communicated via exchange. |
| **Instance-authored** | Documents created by the instance (SRS, user journeys, design docs, internal processes) | Full ownership. No C3PO involvement unless a change crosses into a gated decision type. |

---

## 2. The Instance A-0 as Boundary Contract

Each instance is a complete IDEF0 system. C3PO defines the **A-0 context diagram** for the instance — this is the boundary contract that specifies:

| ICOM Role | What C3PO Defines | What the Instance Owns |
|---|---|---|
| **Inputs** | What the instance receives from the parent (Capital, raw materials, data feeds) | How it processes those inputs internally |
| **Controls** | Non-negotiable constraints (legal requirements, compliance rules, approval gates, physics) | Internal controls that don't cross the boundary |
| **Outputs** | What the instance must produce (products, returns to capital, compliance artifacts) | How it produces those outputs |
| **Mechanisms** | What shared resources the parent provides (AI workforce, CXO agents, infrastructure) | Instance-specific mechanisms it acquires independently |

The A-0 ICOM is delivered in `ctrl-instance-interfaces.md` as part of the onboarding exchange. The instance's internal decomposition (A0 → leaf nodes) is the instance's own work. C3PO does not dictate internal decomposition — it defines what crosses the boundary.

**Boundary arrow correspondence still holds:** the instance's internal decomposition must produce the Outputs defined in the A-0 ICOM. This is the MECE check at the governance boundary.

---

## 3. C3PO-Internal Instance Records

C3PO maintains internal records about each instance in `instances/[entity]/`. These are not sent to the instance — they are C3PO's own understanding.

```
instances/[entity]/
├── README.md
├── model/                          ← C3PO's internal IDEF0 record
│   ├── instance-model.md           ← C3PO's view of the instance's node tree
│   └── instance-viewpoint.md       ← Instance purpose and scope
├── exchange/                       ← THE copy-paste interface (see §4)
├── migration-analysis-skeleton-v1.md  ← Skeleton migration record (if migrated)
└── srs/                            ← DEPRECATED after SRS transfer
    └── srs-[entity].md             ← Snapshot retained for historical reference
```

The `model/` directory is C3PO's reference. When the instance evolves its internal model, it may send updates through the exchange. C3PO updates its internal records accordingly.

---

## 4. The Exchange Protocol

### Structure

Both C3PO and the instance repo maintain exchange directories. Each exchange event is a dated, immutable subfolder. The Principal copies the subfolder between projects to transfer communications (or the `/exchange` skill delivers automatically when repo paths are registered).

**In C3PO:**
```
instances/[entity]/exchange/
└── YYYY-MM-DD-hhmm-[descriptive-slug]/
    ├── MANIFEST.md
    └── [payload files]
```

**In instance repo:**
```
system/exchange/
└── YYYY-MM-DD-hhmm-[descriptive-slug]/
    ├── MANIFEST.md
    └── [payload files]
```

### Naming Convention

`YYYY-MM-DD-hhmm-[descriptive-slug]/`

- Timestamp is **authorship date** (when the package was written, not when it was transferred)
- Slug is a kebab-case description of the exchange purpose (e.g., `onboarding`, `governance-proposal`, `constraint-amendment`)
- Sorts chronologically by creation date

### Immutability

Exchange folders are immutable records — like historical narratives. Once created, they are never edited. This preserves:

1. **Institutional memory** — the evolution of the C3PO ↔ Instance relationship
2. **Auditability** — what recommendations were delivered and when
3. **Pattern consistency** — same model as historical narratives and sprint logs

### Transfer Mechanism

The Principal copies the dated subfolder from one project to the other, or the `/exchange` skill delivers automatically when the Instance Repo Registry has the target path. Both copies are identical and immutable.

---

## 5. MANIFEST Format

Every exchange folder contains a `MANIFEST.md` that tells the receiving system what it's looking at.

```markdown
---
direction: C3PO → [Entity]          # or [Entity] → C3PO
type: [onboarding | proposal | approval | amendment | status | acknowledgment]
date: YYYY-MM-DD
authored-by: [who wrote this package]
---

## Purpose

[1–3 sentences: what this exchange delivers and what action it requires.
Written as a precise summary — the receiving system should know exactly
what to do after reading this section.]

## Rationale

[1–3 paragraphs: why these changes are being made. What was discovered,
what evidence or implementation experience drove the recommendation,
what trade-offs were considered and why this path was chosen over
alternatives. Written for a reader who was not present for the decision.
This section is what makes the exchange inclusive rather than directive —
both sides deserve to understand the reasoning.]

## Payload Contents

Files included in this exchange folder. The instance reviews and installs them.

1. `filename.md` — [one-line description]; install to [target path in receiving repo]
2. `filename.md` — [one-line description]; install to [target path]

## Direct Placement (hash-verified)

Files placed directly into their target locations (not in this folder).
The SHA-256 hash is the audit trail — verify with `sha256sum [file]`.

| # | File | Installed to | SHA-256 |
|---|---|---|---|
| 1 | `filename.md` | `target/path/` | `a1b2c3...` |

## Required Actions

- [ ] [Specific action with clear target path or decision required]
- [ ] Verify direct-placement files: `sha256sum [file]` matches MANIFEST hash
- [ ] [Acknowledge receipt — mechanism TBD per instance]
```

### Exchange Types

| Type | Direction | Purpose |
|---|---|---|
| `onboarding` | C3PO → Instance | Initial governance package: A-0 ICOM, constraints, interfaces, approval gates, SRS seed |
| `proposal` | Instance → C3PO | Instance proposes a change to boundary-affecting documents or reports a structural gap |
| `approval` | C3PO → Instance | C3PO approves an instance proposal; may include updated documents |
| `amendment` | C3PO → Instance | C3PO updates boundary documents (constraint change, interface change, approval gate change) |
| `status` | Either direction | Periodic status report; instance model updates; sprint completion reports |
| `acknowledgment` | Either direction | Confirms receipt and application of an exchange package |

---

## 6. Instance Onboarding Sequence

When a new instance is created, C3PO produces an onboarding exchange package:

### Step 1: Define the Instance A-0 ICOM

C3PO and the Principal define the instance's boundary contract:
- What inputs the instance receives
- What constraints govern it (from enterprise constraint library + instance-specific)
- What outputs it must produce
- What mechanisms the parent provides

This becomes the `ctrl-instance-interfaces.md` document.

### Step 2: Extract Instance-Specific Constraints

From the enterprise constraint library and from domain knowledge, identify the hard rules this specific instance must obey. These go into `ctrl-instance-constraints.md`.

### Step 3: Define Approval Gates

Determine which CXO agents have authority over which decision types for this instance. This may be the standard matrix or a subset. This goes into `ctrl-approval-gates.md`.

### Step 4: Author SRS Seed

C3PO authors an initial SRS based on:
- The instance A-0 ICOM
- The Principal's product thesis for this instance
- Known functional requirements from the instance model

This SRS seed is the **starting point**, not the permanent specification. It is transferred to the instance as an editable document.

### Step 5: Assemble Onboarding Exchange Package

```
YYYY-MM-DD-hhmm-onboarding/
├── MANIFEST.md
├── ctrl-enterprise-context.md        ← Install to company/process/controls/
├── ctrl-instance-constraints.md      ← Install to company/process/controls/
├── ctrl-instance-interfaces.md       ← Install to company/process/interfaces/
├── ctrl-approval-gates.md            ← Install to company/process/controls/
└── srs-seed-[entity].md             ← Install to company/production/[product]/specs/
```

### Step 6: Transfer and Instantiate

The `/onboard` skill creates the full instance repo on disk with the Universal Instance Skeleton structure, pre-installs all files in their target locations, and delivers the exchange package as the immutable onboarding record.

---

## 7. Instance Repo Structure (Universal Instance Skeleton v2)

After onboarding, the instance repo follows the Universal Instance Skeleton:

```
[instance-repo]/
├── .claude/
│   └── skills/
│       ├── sprint/SKILL.md
│       ├── exchange/SKILL.md
│       └── spec/SKILL.md
│
├── agents/                         ← WHO: all 10 agents instantiated at onboarding
│   ├── cao/                       ← Chief Architecture Officer
│   │   ├── cao-context.md
│   │   ├── cao-tasks.md
│   │   ├── processes/             ← CAO methodologies (SDD, PAP, AIP)
│   │   └── products/              ← CAO work products (instance model, ownership docs)
│   ├── cfo/ ... cho/ ... clo/ ... cmo/ ... coo/ ... cpo/ ... cro/ ... cto/
│   │   ├── cXo-context.md         ← Agent mandate (direct-placed from C3PO templates)
│   │   ├── cXo-tasks.md           ← Empty backlog (seeded fresh per instance)
│   │   ├── processes/             ← Agent's leaf-node execution procedures
│   │   └── products/              ← Agent's work products
│   └── librarian/                 ← Reference material curator
│       ├── librarian-context.md
│       ├── librarian-tasks.md
│       ├── processes/             ← Intake and cataloging procedures
│       └── products/
│           └── library/           ← Named product: the curated reference library
│               ├── build/         ← Cataloged shelves (standards/, voices/, etc.)
│               ├── prototype/     ← Intake queue (deposits/, fetch/)
│               └── specs/         ← Shelf templates (per-type metadata schemas)
│
├── company/                        ← WHAT: the business and its products
│   ├── [entity]-soul.md           ← Mission, values, product thesis
│   ├── process/                    ← Process definitions
│   │   ├── controls/              ← Constraints, enterprise context, approval gates
│   │   ├── functions/             ← Enterprise IDEF0 decomposition (C3PO read-only)
│   │   └── interfaces/            ← Boundary contracts
│   ├── production/
│   │   └── [product-name]/
│   │       ├── build/             ← Domain-specific implementation
│   │       ├── prototype/         ← Working drafts, experiments
│   │       └── specs/             ← Product specification
│   └── sales/                     ← Sales-related materials
│
├── system/                         ← HOW: operational infrastructure
│   ├── archive/                   ← Triage queue
│   ├── exchange/                  ← Governance communication records (immutable)
│   ├── log/                       ← Reasoning logs
│   ├── sprints/                   ← Sprint narratives
│   └── transcripts/               ← Conversation transcripts
│
├── CLAUDE.md                       ← Project orientation
└── TASKS.md                        ← Task backlog
```

**Principles:**

- `company/process/functions/` contains the enterprise IDEF0 function decomposition — C3PO-owned, read-only in instances. Delivered at onboarding, updated via amendment exchange. The instance CAO reads these to derive agent ownership and work products.
- `company/process/controls/` and `company/process/interfaces/` contain governance documents. C3PO-seeded, instance-owned after delivery.
- `agents/` contains all 10 agents (9 CXO + Librarian), all instantiated at onboarding with context, tasks, processes/, and products/. Context files are direct-placed from C3PO templates. Task files are seeded fresh per instance. Agents activate when their domain has work — the folders are ready before the agent is needed.
- `company/production/[product]/` follows a three-part structure: build/, prototype/, specs/. Build contains finished implementation. Prototype is the workbench. Specs define what to build.
- `system/exchange/` folders are immutable. Both repos retain all exchange records.
- The skeleton is a **recommendation**. Instances may adapt the structure for their domain. Compliance is measured at the boundary, not in the filesystem.

---

## 8. SRS Seed and Transfer

### What Is an SRS Seed?

An SRS seed is an initial product specification authored by C3PO during instance onboarding. It is derived from the instance model and the Principal's product thesis. It follows the format defined in `ctrl-srs-standard.md` but is explicitly marked as a seed — a starting point, not a permanent governance artifact.

### Transfer Process

1. C3PO authors the SRS seed in `instances/[entity]/srs/srs-[entity].md`
2. The seed is included in the onboarding exchange package
3. The instance receives it and installs it to `company/production/[product]/specs/srs-[entity].md`
4. C3PO marks its copy as a historical snapshot (not the living document)
5. From this point, the instance owns the SRS and evolves it

### Post-Transfer Governance

After transfer, the SRS is governed by:
- **Boundary constraints** — the SRS must not violate any rule in `ctrl-instance-constraints.md`
- **Approval gates** — changes touching gated decision types require CXO approval per `ctrl-approval-gates.md`
- **Boundary arrow correspondence** — the instance's product must still produce the Outputs defined in the A-0 ICOM

The instance does **not** need C3PO permission to:
- Add new functional requirements (e.g., "FR-9: Collector Web Interface")
- Add new user journeys or personas
- Change architecture decisions
- Adjust non-gated product details

The instance **does** need approval (via exchange) to:
- Change the revenue model (CRO-Agent + CFO-Agent)
- Alter data models that cross intercompany interfaces (CAO-Agent)
- Modify legal compliance posture (CLO-Agent)
- Change technical architecture in ways that affect shared infrastructure (CTO-Agent)
- Any decision that alters the A-0 boundary (C3PO Principal)

---

## 9. Feedback and Amendment Flow

### Instance → C3PO (Proposal)

When the instance discovers a gap, needs a constraint change, or wants to renegotiate an interface:

1. Instance authors a proposal document with problem statement, root cause analysis, and proposed change
2. Instance packages it as an exchange folder (type: `proposal`)
3. Principal transfers the folder to C3PO's `instances/[entity]/exchange/`
4. C3PO reviews against the enterprise model, constraint library, and decomposition rules
5. C3PO responds with an `approval` or `amendment` exchange, or a counter-proposal

### C3PO → Instance (Amendment)

When C3PO needs to update boundary documents (new constraint, interface change, approval gate adjustment):

1. C3PO authors the updated document(s)
2. C3PO packages them as an exchange folder (type: `amendment`)
3. The `/exchange` skill delivers to the instance repo's `system/exchange/`
4. Instance reviews the recommendation, installs updated files into `company/process/`
5. Instance sends an `acknowledgment` exchange confirming application

### Principle: No Silent Drift

Neither side should silently deviate from the agreed interface. If the instance needs to change something that affects the boundary, it proposes through the exchange. If C3PO needs to update constraints, it sends an amendment through the exchange. The exchange history is the audit trail.

---

## 10. Relationship to Other Standards

| Standard | Relationship |
|---|---|
| `ctrl-decomposition-rules.md` | R-18 (Instance Boundary Authority) formalizes boundary-enforcement as a decomposition rule |
| `ctrl-srs-standard.md` | Defines the SRS seed format and transfer protocol |
| `ctrl-interface-register.md` | IC-XXX interfaces define the business-level data flows between C3PO and instances; the exchange protocol is the governance-level communication channel |
| `ctrl-enterprise-context.md` | Governance bridge; travels in every onboarding package; provides agent context and enterprise orientation |
| `ctrl-constraint-library.md` | Instance constraints reference codes from this library |
| `ctrl-mechanism-catalog.md` | Instance mechanisms reference codes from this catalog |

---

## Quality Assurance Checklist

Apply when creating or reviewing an exchange package:

- [ ] MANIFEST.md includes all required sections (Purpose, Rationale, Contents, Required Actions)
- [ ] Direction is clearly stated (C3PO → Instance or Instance → C3PO)
- [ ] Exchange type is valid (onboarding, proposal, approval, amendment, status, acknowledgment)
- [ ] Folder name follows `YYYY-MM-DD-hhmm-[slug]` convention with authorship date
- [ ] Boundary documents define constraints and interfaces, not product specification
- [ ] Constraints reference specific codes from `ctrl-constraint-library.md`
- [ ] Instance A-0 ICOM is complete (all four roles specified) in `ctrl-instance-interfaces.md`
- [ ] Approval gates cite specific CXO agents with clear decision type boundaries
- [ ] SRS seed (if included) follows `ctrl-srs-standard.md` format and is marked as seed
- [ ] No exchange folder has been modified after initial creation (immutability check)

---

*End of Instance Governance Standard.*
