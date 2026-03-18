---
direction: C3PO → Fine Higher Ordered Art
type: amendment
date: 2026-03-16
---

## Purpose

Delivers three new enterprise assets: a `/spec` skill (5-phase specification lifecycle), domain-specific spec profiles (control document with a software profile directly relevant to FHOA's auction website), and a spec-driven development process guide. Also delivers an updated enterprise context with ICOM-restructured paths and recommends restructuring `governance/` into ICOM subfolders.

## Rationale

TCC developed a spec-driven development methodology over 10 sprints that produced an 11-document, 9,000-line spec suite for a digital collectibles marketplace. The methodology's key insight: simulation (walking through a spec as if executing) found 42 gaps that structural review missed — 23 of which were dangerous. C3PO evaluated the methodology for enterprise fitness and adopted it without modification. This is the second instance-to-architect feedback loop (after MCC's reasoning log).

The spec profiles control document includes a **software profile** directly applicable to FHOA's tiered-bid auction website build. When FHOA is ready to spec the auction platform, `/spec start` with the software profile provides the full framework: ICP/JTBD → user journeys → product format → technical architecture → two-pass simulation.

C3PO has restructured `enterprise/standards/` into ICOM subfolders (controls/, interfaces/, mechanisms/). The updated enterprise context reflects these new paths.

## Contents

1. `ctrl-enterprise-context-v3.md` — Updated enterprise context with ICOM-restructured paths. **Copy to `governance/ctrl-enterprise-context.md`** (replacing current version)
2. `spec-skill.md` — `/spec` skill; **copy to `.claude/skills/spec/SKILL.md`** (create folder if needed)
3. `ctrl-spec-profiles.md` — Spec profiles control document (includes software profile); **place in `governance/` or `governance/controls/`**
4. `spec-driven-development.md` — SDD process guide (mechanism); **place in `governance/` or `governance/mechanisms/`**

## ICOM Governance Folder Restructure (Recommended)

C3PO recommends restructuring instance `governance/` folders into ICOM subfolders:

```
governance/
├── controls/           ← ctrl-*.md files (constrain behavior)
├── interfaces/         ← interface/boundary docs
└── mechanisms/         ← methodology/process docs
```

This is recommended, not mandated. The flat `governance/` folder remains valid.

## Required Actions

- [ ] Replace `governance/ctrl-enterprise-context.md` with `ctrl-enterprise-context-v3.md`
- [ ] Place spec skill at `.claude/skills/spec/SKILL.md`
- [ ] Place `ctrl-spec-profiles.md` in governance
- [ ] Place `spec-driven-development.md` in governance
- [ ] Optionally restructure `governance/` into ICOM subfolders
- [ ] Acknowledge receipt via exchange
