---
direction: C3PO → Fine Higher Ordered Art
type: amendment
date: 2026-03-18
---

## Purpose

Updated SDD process documents and /spec skill with skeleton v1 path migrations, new `prototype/` folder standard, and versioning guidance. Originated from a TCC proposal that C3PO approved and is now cascading to all instances.

## Rationale

TCC simulated the SDD process as a fresh agent at a new instance and discovered that product-bound R&D artifacts (prototype analysis, working drafts, exploratory code) had no home in the skeleton. The simulation also found 4 dangerous path issues in the SDD documents (stale `library/` and `governance/` references).

The key distinction: **agent-portable research** (bound to the agent's expertise) goes in `agents/[agent]/library/`. **Product-bound R&D** (bound to the product's development) goes in `company/production/[product]/prototype/`. The test: if the agent moved to a different instance, would they take this file?

The `prototype/` folder is now skeleton-standard, completing the product triad:
```
company/production/[product]/
├── specs/        ← what we're making (specification)
├── prototype/    ← what we tried (R&D, drafts, exploratory work)
└── build/        ← what we shipped (source, contracts, config, assets)
```

## Contents

1. `spec-driven-development.md` — Updated SDD process guide (v2); install to `company/process/mechanisms/spec-driven-development.md`
2. `ctrl-spec-profiles.md` — Updated spec profiles control; install to `company/process/controls/ctrl-spec-profiles.md`
3. `SKILL.md` — Updated /spec skill; install to `.claude/skills/spec/SKILL.md`

## Required Actions

- [ ] Install all three files to their target paths (replacing existing versions)
- [ ] Create `company/production/[product]/prototype/` for each product (if not already present)
- [ ] Acknowledge receipt via exchange (type: acknowledgment)
