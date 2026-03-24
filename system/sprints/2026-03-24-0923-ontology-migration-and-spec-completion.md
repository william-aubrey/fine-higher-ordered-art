# Ontology Migration and Spec Completion

**Sprint:** SPR-009
**Date:** 2026-03-24
**Project:** Fine Higher Ordered Art

---

## Starting Point

SPR-008 ended after reading the C3PO whitepaper, with a flagged inbound exchange waiting and Phase 3b (data and state) as the CTO's active task. The spec suite was at 7 of 10 documents complete — Phases 1 and 2 finished, Phase 3a (site design) done, but the data layer, technical architecture, and simulation had not been started. A product-ontology-and-skill-update exchange from C3PO was waiting in `system/exchange/`, requiring folder renames across the entire repo before spec work could proceed.

## Summary

This sprint accomplished two major deliverables: a clean enterprise governance migration and the completion of the entire remaining spec suite.

The exchange renamed the product folder ontology from `{prototype, specs, build}` to `{learn, define, make}` — a verb-based naming convention that ORB discovered works across non-software projects. Six folders were renamed across two products (auction-platform and librarian/library), six skill files were installed (five updated, one new `/research` skill), eight stale path references were fixed in three live files, and an acknowledgment exchange was authored and delivered.

With the migration complete, the session drove through the remaining spec phases without pause. Phase 3b defined all entity schemas (Painting, Series, Bidder, Bid, Reward, WTABid, Auction), the auction state machine at both painting and auction levels, reward calculation formulas with integer-precision guarantees, a 12-event notification catalog, and temporal immutability rules. Phase 4 specified the full technical architecture: Next.js + Vercel + PostgreSQL + Stripe, complete database schema with atomicity constraints, 11 API endpoint contracts, authentication, real-time WebSocket system, notification delivery, deployment, security, 33 acceptance criteria, and a test strategy. Phase 5 ran a two-pass simulation (sprint-level + function-level), found 3 dangerous gaps (sales tax handling, admin bids endpoint, auction close trigger mechanism), fixed all three in-place, and validated the suite with zero dangerous gaps remaining. The spec suite is complete.

## Discoveries

### Discovery 1: Sales Tax Must Be Deferred to Settlement

During simulation, walking through the `placeBid()` function revealed that the spec never specified whether the Stripe charge is `tier_price` or `tier_price + sales_tax`. This is not a minor detail — every bidder's charge depends on the answer, and getting it wrong creates financial and legal error. The tier prices ($1/$10/$100 per sq.in.) are the published, transparent prices per HC-03. Adding tax at bid placement would create a mismatch between the displayed price and the charged amount.

**Consequence:** Tax is collected at settlement as a separate charge, not at bid placement. Tier buttons show tier price only. This required a new section (04 §6.5) and disclosure language for the How Bidding Works page.

### Discovery 2: The Auction Close Needs a Transitional State

The spec said evaluation happens "at the moment the auction close datetime is reached" and separately that in-flight bids get a 5-minute grace window. But these two rules conflict: if evaluation runs immediately at close and freezes state, in-flight bids can't complete. The interaction between close, grace, and evaluation was under-specified.

**Consequence:** Added a `closing` transitional status to the auction state machine. The sequence is now: `active` → `closing` (no new bids, in-flight bids may complete for 5 minutes) → `evaluation` (threshold check). This required updates to both 03b (state machine diagram and enum) and 04 (new §9.5 with Vercel Cron mechanism and idempotent logic).

## What Changed

### Files Created
| File | What it is |
|---|---|
| `company/production/auction-platform/define/spec-v1-03b-data-and-state.md` | Phase 3b: entity schemas, state machines, reward calculations, notification events, temporal rules |
| `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` | Phase 4: full technical blueprint — stack, DB schema, API contracts, auth, payments, real-time, security, acceptance criteria, tests |
| `company/production/auction-platform/define/simulation-v1-pass1.md` | Phase 5 Pass 1: sprint-level simulation across 12 planned development sprints |
| `company/production/auction-platform/define/simulation-v1-pass2.md` | Phase 5 Pass 2: function-level simulation across ~20 core functions |
| `.claude/skills/onboard/SKILL.md` | Updated skill from exchange |
| `.claude/skills/press/SKILL.md` | Updated skill from exchange |
| `.claude/skills/publish/SKILL.md` | Updated skill from exchange |
| `.claude/skills/research/SKILL.md` | New skill from exchange — entity research dossiers |
| `system/exchange/2026-03-24-0652-product-ontology-and-skill-update/` | Inbound C3PO exchange (read) |
| `system/exchange/2026-03-24-0733-acknowledgment-product-ontology-and-skill-update/` | Outbound acknowledgment |
| `system/log/2026-03-24.md` | Reasoning log |
| `system/transcripts/2026-03-24-hhmm-open-sprint.md` | Conversation transcript |

### Files Modified
| File | What changed |
|---|---|
| `CLAUDE.md` | Product description path, spec progress path, project structure tree updated for ontology migration; active sprint block added/removed |
| `agents/cto/cto-tasks.md` | Output locations updated; Phase 3b, 4, 5 completed; build tasks now active |
| `.claude/skills/exchange/SKILL.md` | Updated paths from exchange |
| `.claude/skills/spec/SKILL.md` | Updated paths from exchange |
| `company/production/auction-platform/define/spec-progress.md` | Phase 3b, 4, simulate marked complete; simulation log and gap tracker populated |
| `company/production/auction-platform/define/spec-v1-00-index.md` | 03b and 04 marked Complete |

### Files Renamed (Ontology Migration)
| Old Path | New Path |
|---|---|
| `company/production/auction-platform/specs/` | `company/production/auction-platform/define/` |
| `company/production/auction-platform/prototype/` | `company/production/auction-platform/learn/` |
| `company/production/auction-platform/build/` | `company/production/auction-platform/make/` |
| `agents/librarian/products/library/specs/` | `agents/librarian/products/library/define/` |
| `agents/librarian/products/library/prototype/` | `agents/librarian/products/library/learn/` |
| `agents/librarian/products/library/build/` | `agents/librarian/products/library/make/` |

## Key Decisions

1. **Tax at settlement, not bid placement.** The tier price IS the charge. Tax is a separate settlement item. Driven by HC-03 (transparent terms) and UX clarity — the displayed price must match the charged price. The fiduciary handles tax as part of settlement.

2. **`closing` as a transitional auction state.** Rather than a binary active/evaluation switch, the auction passes through a 5-minute closing window. This resolves the tension between "no new bids after close" and "in-flight bids get a grace period." Implemented via Vercel Cron running every minute with idempotent logic.

3. **Static site + serverless API (Next.js + Vercel).** The auction serves ~52 products over 6 months with low bid volume. A full backend framework would add operational burden disproportionate to the workload. The site naturally degrades to a static archive post-auction. Estimated cost: $25-50/month during auction, near-zero after.

4. **Painting state derived from bids, not stored separately.** No `status` column on the paintings table. The current state is computed from the set of active bids. This eliminates state synchronization bugs — the bids table is the single source of truth.

5. **Rewards calculated at settlement only, never displayed before.** No reward amounts visible to bidders until the auction succeeds. This is the legally safest framing for securities risk (Gambler persona) — the reward is an incidental benefit discovered at settlement, not a displayed incentive.

6. **All money in cents (integer), never floats.** Tier pricing math guarantees exact division at every step. The 50% reward split is always an exact cent amount because of the 10x tier progression.

## What This Proves

The spec suite is now a complete, validated blueprint — from personas through database schemas through acceptance criteria. An autonomous agent reading these 10 documents could plan and execute 12 development sprints without asking a single clarifying question about the core auction mechanics. The simulation validated this claim and surfaced only 3 gaps, all of which were addressable within the existing document structure.

This is exactly the outcome the spec-driven development methodology targets: a specification complete enough that implementation becomes a translation exercise rather than a design exercise. The remaining 14 safe gaps are all standard engineering choices (which ORM, which real-time provider) — not product decisions.

The external blockers (securities counsel, fiduciary lawyer, painting inventory) remain unchanged. None of them blocked spec work — they block launch. William's review of 03a and cascading changes through 03b/04 is the next intellectual work; everything else is either William's external action items or build execution.

## Open Questions

1. **William's review of 03a (site design)** — flagged during the session as something he wants to walk through. Changes may cascade to 03b and 04.
2. **TECH-04: Supabase vs Neon + Ably** — bundled DB+realtime vs. separate services. Affects Sprint 1 scaffolding.
3. **TECH-03: Headless CMS vs markdown for site content** — depends on whether William needs to edit copy without developer involvement.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `agents/cto/cto-tasks.md`
3. `company/production/auction-platform/define/spec-progress.md`
4. `company/production/auction-platform/define/spec-v1-03a-site-design.md` (header — first 50 lines)
5. `company/production/auction-platform/define/spec-v1-03b-data-and-state.md` (header — first 50 lines)
6. `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` (header — first 50 lines)

**Next task:** Review 03a (site design) with William — walk through page by page, identify changes, then cascade edits to 03b and 04.
