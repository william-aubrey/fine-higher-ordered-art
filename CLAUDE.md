# Fine Higher Ordered Art

Abstract expressionist acrylic paintings sold through a custom tiered-bid auction website. An enterprise instance of Ouroborotic Robotics LLC, governed by the C3PO framework.

## What This Is

Fine Higher Ordered Art (FHOA) is the Principal's art business — original acrylic paintings expressing emotional and spiritual themes, sold through a purpose-built auction platform. The artist (William Aubrey) creates the work; this instance handles everything from catalog presentation through auction execution, payment, and fulfillment.

FHOA operates under a layered authority model:

- **Layer 1 (read-only):** `governance/` — constraints, interfaces, approval gates, enterprise context. Authored by C3PO. Never edit directly; propose changes via `/exchange write proposal`.
- **Layer 2 (instance-owned):** `specs/` — product specification, auction design, user journeys. This instance owns and evolves these freely within Layer 1 constraints.

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

Full constraints: `governance/controls/ctrl-instance-constraints.md`

## Project Structure

```
governance/              Read-only Layer 1 documents (from C3PO)
  controls/              Constraints, approval gates, enterprise context, spec profiles
  mechanisms/            Process guides (SDD methodology)
specs/                   Product specification (instance-owned, editable)
  spec-progress.md         Spec lifecycle progress tracker
  spec-v1-00-index.md      Reading order + key decisions
exchange/                Governance communication records (immutable)
reference/idef0/         Enterprise IDEF0 reference library
library/sprints/         Sprint history
library/log/             Reasoning logs
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
**Spec progress:** `specs/spec-progress.md`

## Next Steps

1. Begin Phase 3 SDD with `/spec what` — detailed site design (`spec-v1-03a-site-design.md`)
2. Complete Phase 3 data and state specification (`spec-v1-03b-data-and-state.md`)
3. Phase 4 SDD: Technical Architecture
4. Phase 5: Simulate (two-pass validation)
5. Evaluate tech stack and select payment processor (Phase 4 decisions)

## Active Sprint
**Log:** `library/log/2026-03-17.md`
After every response, append a 1-2 line reasoning entry to the log. Get the timestamp from `powershell -Command "Get-Date -Format 'HH:mm'"` (or `date +%H:%M`). Include `[UPDATED filename]` brackets for any files changed. Write your reasoning — what you did, why, what it connects to, what concerned you. No categorization tags. See sprint skill §Log for format.