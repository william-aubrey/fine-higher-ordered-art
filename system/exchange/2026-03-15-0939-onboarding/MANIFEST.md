---
direction: C3PO → Fine Higher Ordered Art
type: onboarding
date: 2026-03-15
authored-by: CAO
---

## Purpose

Initial governance package for Fine Higher Ordered Art. Delivers Layer 1 governance documents, SRS seed, and universal skills. This package establishes the C3PO ↔ FHOA governance relationship.

## Rationale

Fine Higher Ordered Art is a new enterprise instance of Ouroborotic Robotics LLC — an art business selling the Principal's abstract expressionist acrylic paintings through a custom tiered-bid auction website. This package establishes Layer 1 governance (constraints, interfaces, approval gates) and provides the SRS seed and universal operational skills (/sprint, /exchange). The instance owns its product specification (Layer 2) and evolves it through A31 product management.

## Contents

1. `ctrl-enterprise-context.md` — Enterprise governance context (agent personas, mandates, process knowledge catalog); copy to `governance/`
2. `ctrl-instance-constraints.md` — 8 hard constraints (IP rights, accurate representation, auction disclosure, financial approval, data protection, tax compliance, art-safe shipping, secrets security); copy to `governance/`
3. `ctrl-instance-interfaces.md` — A-0 ICOM boundary contract + 4 intercompany interfaces (IC-FHOA-01 through IC-FHOA-04); copy to `governance/`
4. `ctrl-approval-gates.md` — CXO approval gate matrix (10 decision types); copy to `governance/`
5. `srs-seed-fine-higher-ordered-art.md` — Initial product specification (7 FRs, 4 target user types); copy to `specs/srs-fine-higher-ordered-art.md`
6. `SKILL-sprint.md` — Universal sprint lifecycle skill; copy to `.claude/skills/sprint/SKILL.md`
7. `SKILL-exchange.md` — Universal exchange protocol skill; copy to `.claude/skills/exchange/SKILL.md`

## Required Actions

- [ ] Copy governance documents to `governance/`
- [ ] Copy SRS seed to `specs/srs-fine-higher-ordered-art.md`
- [ ] Copy skills to `.claude/skills/`
- [ ] Review all governance documents
- [ ] Acknowledge receipt via `/exchange write acknowledgment`
