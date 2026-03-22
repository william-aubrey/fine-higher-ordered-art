# Spec Index — Fine Higher Ordered Art

*Version 1 — Charlotte Collection Auction Platform*
*Last updated: 2026-03-16*

---

## Reading Order

The numbered spec documents follow the Spec-Driven Development methodology (see `company/process/mechanisms/spec-driven-development.md`). Read them in order — each phase feeds the next. Progress tracked in `spec-progress.md`.

| # | Document | Phase | Status |
|---|---|---|---|
| 00 | `spec-v1-00-index.md` | — | This file |
| 01 | `spec-v1-01-icp-jtbd.md` | WHO: Personas and use cases | Complete |
| 02a | `spec-v1-02a-journey-collector-connoisseur.md` | HOW: Collector & Connoisseur | Complete |
| 02b | `spec-v1-02b-journey-patron.md` | HOW: Patron | Complete |
| 02c | `spec-v1-02c-journey-champion.md` | HOW: Champion | Complete |
| 02d | `spec-v1-02d-journey-magnate.md` | HOW: Magnate (WTA) | Complete |
| 02e | `spec-v1-02e-journey-gambler.md` | HOW: Gambler (anti-journey) | Complete |
| 02f | `spec-v1-02f-journey-spectator-journalist.md` | HOW: Spectator & Journalist | Complete |
| 03a | `spec-v1-03a-site-design.md` | WHAT: Site design — every page and component | Complete |
| 03b | `spec-v1-03b-data-and-state.md` | WHAT: Data schemas and auction state | Not started |
| 04 | `spec-v1-04-technical-architecture.md` | BUILD: Infrastructure, APIs, deployment | Not started |

### Archived References

These documents were foundational to the spec suite. Their content is absorbed into the numbered specs. Originals preserved as historical references alongside active specs.

| Document | What it is |
|---|---|
| `auction-mechanism.md` | Complete tiered-bid auction mechanism — tiers, thresholds, reward mechanic, WTA, settlement. Content absorbed into Phases 3–4. |
| `srs-fine-higher-ordered-art.md` | SRS seed from C3PO onboarding — superseded by the spec suite |

### Process Artifacts

| Document | What it is |
|---|---|
| `agents/clo/products/securities-opinion-request.md` | RFP for securities counsel — Howey test review of reward mechanic |
| `agents/clo/products/fiduciary-rfp.md` | RFP for fiduciary lawyer — escrow, payments, contracts, terms of service |

---

## Phase Summary

### Phase 1 (Launch)

All eight personas are present from day one. The auction is a single one-time event — there is no phased user rollout.

| Personas | P-01 through P-08 (Magnate, Champion, Connoisseur, Collector, Patron, Gambler, Spectator, Journalist) |
|---|---|
| Use Case Families | UCF-1 through UCF-8 (Discovery, Bidding, Getting Outbid, Winning, Settlement & Reward, Following, Scrutinizing, Auction Failure) |
| Target launch | Spring/Summer 2026 |
| Auction close | December 31, 2026 |
| Domain | `fhoa.org` (owned) |

---

## Key Decisions Log

| # | Decision | Rationale | Date | Source |
|---|---|---|---|---|
| 1 | Three-tier pricing at $1/$10/$100 per sq.in. | 10x progression balances accessibility with premium commitment. Scales naturally with painting size. | 2026-03-15 | auction-mechanism.md |
| 2 | Single aggregate threshold (sum of all Tier 1 prices) | Simpler than multiple rules. Protects the artist without constraining individual painting sales. Grief Series constraint removed. | 2026-03-15 | auction-mechanism.md |
| 3 | Outbid reward: 50% of tier spread | Creates a story for every participant. Early bidders become stakeholders. | 2026-03-15 | auction-mechanism.md |
| 4 | WTA with implicit Tier 4 at $1,000/sq.in. | Consistent 10x progression. Makes WTA appropriately expensive when Tier 3 bids exist. | 2026-03-15 | auction-mechanism.md |
| 5 | US buyers only | Scope control — avoid international shipping, tax, currency, and legal complexity for a one-time auction. | 2026-03-15 | auction-mechanism.md |
| 6 | December 31, 2026 close date, fixed | Symbolic deadline. Creates natural urgency. No extensions. | 2026-03-15 | auction-mechanism.md |
| 7 | Eight personas, all Phase 1 | Single one-time event — any persona could appear from day one. | 2026-03-15 | spec-v1-01 |
| 8 | The Gambler is a threat persona — design against | Reward mechanic risks Howey test. Bids must be framed as art purchases, not investments. | 2026-03-15 | spec-v1-01 |
| 9 | Collectors split: Collector (accessible) and Connoisseur (serious money) | Decision process, trust needs, and UX at $16 vs $34,560 are fundamentally different. | 2026-03-15 | spec-v1-01 |
| 10 | Patrons split: Patron (community) and Gambler (financial return) | Same tier, opposite motivations. Central tension of the auction's legal and UX design. | 2026-03-15 | spec-v1-01 |
| 11 | Sequential tier progression — no direct high-tier bidding | Every painting must progress T1->T2->T3. Self-outbidding earns own rewards (~50% back). Creates visible activity. | 2026-03-15 | spec-v1-02a |
| 12 | Open gallery, register to bid | Gallery is the best marketing. No gates until committing money. | 2026-03-15 | spec-v1-02a |
| 13 | Artist does not self-promote | Discovery via press, auction house, social sharing. Artist stays aloof. | 2026-03-15 | spec-v1-02a |
| 14 | Homepage: scroller -> Charlotte Collection -> auction stats -> WTA | Art first. Title as Fine^(Higher Ordered) Art. Two main CTAs: Art Auction page, WTA page. | 2026-03-15 | spec-v1-02a |
| 15 | Gallery is a scroller component, not a separate page | Appears on homepage, Art Auction page, WTA page. No dedicated gallery page. | 2026-03-15 | spec-v1-02a |
| 16 | All three tier buttons visible, only lowest available active | Shows full price spectrum. Enforces sequential progression. Higher tiers grayed out. | 2026-03-15 | spec-v1-02a |
| 17 | Above-threshold bids: lawyer-mediated with formal contract | "Arrange Purchase" CTA replaces "Place Bid." Buyer engages fiduciary lawyer, signs contract, pays by wire. | 2026-03-15 | spec-v1-02c |
| 18 | Fiduciary is a bar-member attorney, credentials on website | Verifiable trust for high-value buyers. Handles escrow, contracts, buyer communication. | 2026-03-15 | spec-v1-02c |
| 19 | Shipping: platform-facilitated with art-safe boxes (FedEx/UPS) | Research needed on options and pricing by painting size. | 2026-03-15 | spec-v1-02a |
| 20 | Certificate of authenticity: physical (hand-signed) + digital (PDF) | Physical ships with painting. Digital at settlement. | 2026-03-15 | spec-v1-02a |
| 21 | Auction mechanism archived to library/ | Hybrid document straddling phases. Content absorbed into Phase 3 (user-facing explanation) and Phase 4 (settlement logic, escrow flows). Spec suite becomes single source of truth. | 2026-03-16 | spec-progress.md |
| 22 | SRS seed archived to library/ | Superseded by the spec suite. Preserved as historical reference. | 2026-03-16 | spec-progress.md |
| 23 | Phase 3 split into 03a (site design) and 03b (data and state) | Site design covers every page template, component, and UX element in detail. Data/state covers schemas, the auction state machine, and what data each component needs. Separation keeps each document focused. | 2026-03-16 | spec-progress.md |

---

## Open Questions — Consolidated

### Hard Prerequisites (blocks launch)

| ID | Question | Owner |
|---|---|---|
| AM-OQ-01 | Securities counsel review of reward mechanic | William (external) |
| AM-OQ-02 | Fiduciary lawyer selection | William (external) |
| AM-OQ-04 | Painting inventory — 52 paintings with dimensions | William (physical) |

### Depends on Fiduciary/Counsel

| ID | Question |
|---|---|
| J02a-04 | Pre-bid inquiry channel |
| J02a-08 | Wire transfer threshold / payment methods |
| J02c-01 | Credit card vs. lawyer-mediated threshold |
| J02e-02 | Terms of service — coordinated bidding provisions |

### Resolving in Phase 3

| ID | Question |
|---|---|
| J02d-01 | WTA page copy for mystery prize |
| J02e-03 | Outbid notification — show reward amount? |
| J02f-01 | Dedicated press contact |
| J02f-02 | Image usage rights for press |
| J02f-03 | About the Artist page |

### Pre-Launch (Phase 3/4)

| ID | Question |
|---|---|
| J02a-11 | Art-safe shipping options and pricing |
| J02c-02 | In-person viewing for high-tier bidders |

---

## Governance References

| Document | Location |
|---|---|
| Instance constraints (HC-01 through HC-08) | `company/process/controls/ctrl-instance-constraints.md` |
| Approval gates | `company/process/controls/ctrl-approval-gates.md` |
| Enterprise context | `company/process/controls/ctrl-enterprise-context.md` |
| Instance interfaces | `company/process/interfaces/ctrl-instance-interfaces.md` |
| Spec profiles (domain phase guidance) | `company/process/controls/ctrl-spec-profiles.md` |
| Spec-Driven Development process | `company/process/mechanisms/spec-driven-development.md` |
