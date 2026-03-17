# Spec Progress

**Project:** Fine Higher Ordered Art — Charlotte Collection Auction Platform
**Profile:** Software Product
**Thesis:** FHOA builds a custom auction website to sell 52 original acrylic paintings through a single one-time tiered-bid auction with three price tiers ($1/$10/$100 per sq.in.), outbid rewards, and a Winner Takes All option, closing December 31, 2026.
**Initialized:** 2026-03-16
**Domain:** fhoa.org

## Plan

| Phase | # | Document | Status | Date |
|---|---|---|---|---|
| who | 01 | `spec-v1-01-icp-jtbd.md` | complete | 2026-03-15 |
| how | 02a | `spec-v1-02a-journey-collector-connoisseur.md` | complete | 2026-03-15 |
| how | 02b | `spec-v1-02b-journey-patron.md` | complete | 2026-03-15 |
| how | 02c | `spec-v1-02c-journey-champion.md` | complete | 2026-03-15 |
| how | 02d | `spec-v1-02d-journey-magnate.md` | complete | 2026-03-15 |
| how | 02e | `spec-v1-02e-journey-gambler.md` | complete | 2026-03-15 |
| how | 02f | `spec-v1-02f-journey-spectator-journalist.md` | complete | 2026-03-15 |
| what | 03a | `spec-v1-03a-site-design.md` | pending | — |
| what | 03b | `spec-v1-03b-data-and-state.md` | pending | — |
| build | 04 | `spec-v1-04-technical-architecture.md` | pending | — |
| simulate | — | — | pending | — |

## Supporting Documents (Archived)

These documents predate the spec suite. Their content is authoritative and will be absorbed into Phase 3 and Phase 4 specs. Originals archived in `library/`.

| Document | Original Location | Archived To | What It Covers |
|---|---|---|---|
| `auction-mechanism.md` | `specs/` | `library/auction-mechanism.md` | Tier structure, bidding rules, outbid rewards, WTA, settlement, thresholds |
| `srs-fine-higher-ordered-art.md` | `specs/` | `library/srs-fine-higher-ordered-art.md` | C3PO onboarding seed — superseded by spec suite |

## Phase 3 Scope — Site Design (03a)

Detailed specification of every website element. Page-by-page walkthrough covering:

- **Homepage** — layout, gallery scroller, Charlotte Collection branding, auction statistics display, WTA section
- **Art Auction page** — full content spec (distinct from homepage), bidding entry points, rules summary
- **Image Page** — painting detail, scale diagram, narrative, video, tier buttons, bid status, shipping estimate
- **Theme Series Page** — Grief Series layout, series narrative, individual painting links
- **Winner Takes All page** — what you get, price display, Arrange Purchase CTA, gallery scroller
- **How Bidding Works page** — mechanism explanation, terms, FAQ structure
- **About the Artist page** — artist story, portfolio, press contact (resolves J02f-01, J02f-03)
- **Bidder Dashboard** — active bids, bid status, outbid rewards, auction progress
- **Registration flow** — screens, fields, redirect behavior
- **Bid flow** — confirmation screens, terms acknowledgment, payment entry, real-time contention display
- **Post-auction gallery** — transition from active auction to permanent archive
- **Global navigation** — nav bar, footer, responsive behavior
- **Gallery scroller component** — dimensions, scrolling behavior, responsive, performance with 52 items
- **Notification templates** — outbid, win, auction milestone, failure (resolves J02e-03)
- **URL structure** — clean, shareable URLs for every page type
- **Open Graph / social meta tags** — link preview content per page type
- **Responsive design** — mobile vs. desktop behavior for all pages and components

## Phase 3 Scope — Data and State (03b)

- **Painting data schema** — fields, types, constraints for each painting record
- **Auction state machine** — painting states (Open → Tier 1 Held → Tier 2 Held → Tier 3 Held), transitions, events
- **Bidder data schema** — registration fields, preferences, bid history
- **Bid data schema** — bid record, escrow reference, status lifecycle
- **Reward calculation schema** — spread formulas, settlement disbursement, contingency on auction success
- **WTA price calculation** — real-time aggregation, Tier 4 ceiling rule
- **Threshold calculation** — aggregate sum, evaluation at close
- **Notification event schema** — triggers, channels, templates, delivery rules
- **Content management** — painting narratives, video references, artist statement, series metadata

## Phase 4 Scope — Technical Architecture (04)

- Infrastructure and hosting (static site + serverless vs. full web app)
- Payment processor selection and integration (Stripe, Square, or other — fiduciary to advise)
- Escrow flow implementation
- Real-time bid contention system
- Authentication and authorization
- API contracts (endpoints, schemas, auth, errors)
- Data model (database schema mapping to 03b)
- Notification delivery system
- Deployment model
- Security requirements (PCI compliance per HC-05, data encryption)
- Acceptance criteria per functional requirement
- Test strategy

## External Blockers (Do Not Block Spec Work)

These are hard prerequisites for *launch*, not for spec writing. Phase 3 and 4 work proceeds in parallel with William resolving these externally.

| ID | Blocker | Owner | Impact |
|---|---|---|---|
| AM-OQ-01 | Securities counsel review of reward mechanic | William (external) | Blocks launch; may affect terms copy in 03a |
| AM-OQ-02 | Fiduciary lawyer selection | William (external) | Blocks launch; affects payment threshold in 03a, escrow design in 04 |
| AM-OQ-04 | Painting inventory — 52 paintings with dimensions | William (physical) | Blocks launch; affects exact pricing in examples but not template design |

## Simulation Log

| Pass | Date | Gaps Found | Dangerous | Status |
|---|---|---|---|---|
| *(empty until simulate is run)* | | | | |

## Gap Tracker

| # | Gap | Severity | Phase | Document | Status |
|---|---|---|---|---|---|
| *(empty until simulate is run)* | | | | | |
