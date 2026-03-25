---
direction: C3PO → Fine Higher Ordered Art
type: amendment
date: 2026-03-24
---

## Purpose

Exchange skill bugfix: adds explicit reverse-lookup step to Step 10 instance-context delivery. Previously, instances writing acknowledgments to C3PO could not resolve their own C3PO folder name, causing acks to be stranded in the instance's `system/exchange/` without delivery to `C3PO/instances/[name]/exchange/`.

## Rationale

All 4 instances processed the product ontology + skill update package (2026-03-24-0652) and wrote acknowledgments, but none were delivered to C3PO. Root cause: Step 10's instance-context delivery block referenced `[this-instance]` without instructing the instance how to resolve it. The Instance Repo Registry maps C3PO folder → repo path, but the instance needed the inverse (repo path → C3PO folder name). The fix adds one step: "Get your repo path, find the matching row in the registry, use the Instance Folder value."

## Direct Placement (hash-verified)

| File | Source | Target | SHA-256 |
|---|---|---|---|
| `SKILL.md` | `.claude/skills/exchange/SKILL.md` | `.claude/skills/exchange/SKILL.md` | `64aeb032495422396817d85ee02f4cb8d3556903a2cc822917a1718ee36a8e2f` |

## Required Actions

- [ ] Verify exchange skill hash matches
- [ ] Acknowledge receipt via exchange (type: acknowledgment)
