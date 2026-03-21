# Agent Infrastructure Inventory — Fine Higher Ordered Art

**Date:** 2026-03-20
**Instance:** Fine Higher Ordered Art
**Stage:** A31 Product Management — Phases 1–2 complete, Phase 3 next

---

## Current Agent Folders

```
agents/
└── clo/
    └── library/
        ├── fiduciary-rfp.md
        └── securities-opinion-request.md
```

**Only CLO is instantiated.** The CLO folder was created during the skeleton v1 migration to house two legal RFP documents (securities opinion request, fiduciary RFP). These are deliverables for the Principal to take to external counsel — the CLO agent did not "produce" them autonomously; they were authored during a sprint session and stored in the CLO's functional area.

No other agent folders exist. No agent task files (`cXo-tasks.md`) exist anywhere.

## Task Management — Current State

All tasks are tracked in the root `TASKS.md` file. This file contains a mix of:

- **Agent-scoped work** (should migrate to per-agent task files):
  - Phase 3-5 spec work → CPO or CTO
  - Tech stack evaluation → CTO
  - Payment processor selection → CTO + CFO
  - Open Graph / meta tag design → CMO or CTO
  - Feature roadmap → CPO
  - Certificate of authenticity design → CMO or COO

- **Principal-scoped work** (correctly in TASKS.md):
  - Find securities counsel (external action)
  - Find fiduciary lawyer (external action)
  - Inventory 52 paintings (physical action)
  - Photograph paintings (physical action)
  - Write artist statement (personal creative)
  - Write per-painting descriptions (personal creative)
  - Record video content (physical production)

- **Ambiguous:**
  - Research art-safe shipping → COO or CTO (research) + Principal (vendor selection)
  - Draft terms of service → CLO (drafting) + Principal (legal counsel review)
  - A2 Production decomposition → CAO

**Migration needed:** Agent-scoped tasks should move to per-agent task files once agents are instantiated. TASKS.md should be trimmed to Principal-only items.

## Agents to Instantiate (Priority Order)

Based on FHOA's current workload and the A31 stage:

| Priority | Agent | Why Now |
|---|---|---|
| 1 | **CTO** | Phase 3-4 spec work, tech stack evaluation, payment processor, hosting — the largest body of queued autonomous work |
| 2 | **CAO** | Intake routing (§5), A2 production decomposition, governance coordination |
| 3 | **CPO** | Product validation, simulation passes, feature roadmap — becomes critical at Phase 5 |
| 4 | **CMO** | Brand, content strategy, Open Graph, press contact — becomes critical pre-launch |
| 5 | **CLO** | Already has deliverables; needs task file. Active once counsel is engaged. |
| 6 | **CFO** | Payment processing decisions, financial controls — becomes critical at Phase 4 |
| 7 | **COO** | Shipping, fulfillment — becomes critical pre-launch |

CRO and CHO are low priority for FHOA at this stage (single-event auction, no sales pipeline; solo artist, no HR).

## Readiness Assessment

FHOA is well-positioned for the agent-directed work standard:

- **Spec-driven development** is already the operational model — agents consuming specs to produce work is the entire strategy
- **IDEF0 output locations** are already defined by the skeleton structure (`company/process/`, `company/production/auction-platform/specs/`, etc.)
- **Sprint infrastructure** provides session continuity — agent task files would complement this with cross-session task persistence per agent
- **Governance controls** are installed and current

**Primary gap:** No agent task files exist. The migration from monolithic TASKS.md to per-agent task files is the first step. This is a lightweight structural change — the tasks are already implicitly assigned by domain.
