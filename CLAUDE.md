# Fine Higher Ordered Art

Abstract expressionist acrylic paintings sold through a custom tiered-bid auction website. An enterprise instance of Ouroborotic Robotics LLC, governed by the C3PO framework.

## What This Is

Fine Higher Ordered Art (FHOA) is the Principal's art business — original acrylic paintings expressing emotional and spiritual themes, sold through a purpose-built auction platform. The artist (William Aubrey) creates the work; this instance handles everything from catalog presentation through auction execution, payment, and fulfillment.

FHOA operates under boundary-enforcement governance:

- **Process definitions** (`company/process/`) — constraints, interfaces, approval gates, enterprise context. Authored by C3PO. Never edit directly; propose changes via `/exchange write proposal`.
- **Product specifications** (`company/production/auction-platform/define/`) — product specification, auction design, user journeys. This instance owns and evolves these freely within process constraints.

## Product Thesis

FHOA is a software / website that hosts a custom site for selling a collection of paintings in a single one-time tiered-bid auction process. Additional software may support sales and financial aspects. A physical gallery may follow.

## A-0 Boundary

| Role | Arrow |
|---|---|
| **Inputs** | Original acrylic paintings, capital, art supplies |
| **Controls** | IP law, consumer protection, tax law, HC-01–HC-08 constraints, CXO approval gates |
| **Outputs** | Sold artwork (with certificate of authenticity), revenue, brand presence, financial reports |
| **Mechanisms** | CXO agent swarm, auction platform (custom software), payment processor, art-safe shipping, photography |

## Key Constraints

1. **HC-01:** Artist retains all IP rights — sale transfers physical object only, not reproduction rights
2. **HC-03:** Auction terms must be fully disclosed before bidding opens; no changes mid-auction
3. **HC-04:** Principal must approve before launching an auction, accepting bids, or entering contracts
4. **HC-05:** Customer data encrypted; PCI-compliant payment processing; no direct storage of payment credentials
5. **HC-07:** Art-safe shipping required (rigid packaging, acid-free wrapping, insured)

Full constraints: `company/process/controls/ctrl-instance-constraints.md`

## Project Structure

```
company/                  Company layer
  fhoa-soul.md            Soul document — product thesis, A-0 ICOM, constraints
  process/                Process definitions (read-only — from C3PO)
    controls/             Constraints, approval gates, enterprise context, spec profiles, IDEF0 references
    interfaces/           Boundary contracts (A-0 ICOM, intercompany interfaces)
    mechanisms/           Process guides (SDD methodology)
  production/
    auction-platform/     Product: Charlotte Collection auction website
      define/             Product specification (instance-owned, editable)
      learn/              Research, experiments, prototypes
      make/               Build artifacts (code, assets)
  sales/                  Sales materials
agents/                   Agent work products
  clo/library/            CLO deliverables (legal RFPs)
system/                   Operational records
  exchange/               Governance communication records (immutable)
  sprints/                Sprint history
  log/                    Reasoning logs
  transcripts/            Session transcripts
  archive/                Triage queue for retired files
```

## Skills

- `/sprint open [topic]` — Start a work session (restores context from last sprint)
- `/sprint close` — End a work session (writes narrative, updates tasks)
- `/exchange write` — Author an outbound governance exchange package
- `/exchange read` — Read the most recent inbound exchange
- `/spec start` — Initialize a spec suite for the project
- `/spec [who|how|what|build|simulate]` — Execute a spec phase
- `/spec status` — Show spec progress dashboard

## NAICS

- 453920 — Art Dealers
- 454110 — Electronic Shopping and Mail-Order Houses
- 711510 — Independent Artists, Writers, and Performers

## Current Status

**Onboarded:** 2026-03-15
**Stage:** A31 Product Management — Phases 1–2 complete, Phase 3 (Product Design) next
**Spec progress:** `company/production/auction-platform/define/spec-progress.md`

## Next Steps

1. Begin Phase 3 SDD with `/spec what` — detailed site design (`spec-v1-03a-site-design.md`)
2. Complete Phase 3 data and state specification (`spec-v1-03b-data-and-state.md`)
3. Phase 4 SDD: Technical Architecture
4. Phase 5: Simulate (two-pass validation)
5. Evaluate tech stack and select payment processor (Phase 4 decisions)
