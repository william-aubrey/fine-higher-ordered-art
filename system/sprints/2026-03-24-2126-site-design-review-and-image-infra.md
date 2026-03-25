# Site Design Review and Image Infrastructure

**Sprint:** SPR-011
**Date:** 2026-03-24
**Project:** Fine Higher Ordered Art

---

## Starting Point

The spec suite was complete — 10 documents, 0 dangerous gaps after Phase 5 simulation. SPR-010 had discovered that the product-ontology acknowledgment was stranded locally, undelivered to C3PO. A new inbound exchange (exchange skill bugfix) was waiting in `system/exchange/`. The project was at the threshold between specification and build, with the 03a site design review as the next recommended task before scaffolding could begin.

## Summary

A four-part session. First, processed the inbound exchange skill bugfix from C3PO — a patch to the `/exchange` skill's Step 10 delivery logic that independently diagnosed the same bug SPR-010 found. Hash verified, acknowledged, delivered using the fixed skill itself. Second, walked through the full 03a site design spec (1,296 lines, 21 sections) page by page with William. He approved the design — "your descriptions of the pages all sound pretty good." Third, wrote a complete image infrastructure specification (§13.2 in Phase 4, 7 subsections) covering Vercel Blob storage, Next.js Image on-demand optimization, OG generation, upload workflow, color accuracy, and performance targets. This simplified the database schema from 4 image URL columns to 2 and closed SIM-05. Fourth, and most significant: William's questions about TECH-04 and database necessity led to a fundamental architectural insight — the painting gallery is static content that doesn't need a database or API. Only the bidding layer does. The spec as written conflates these. Tomorrow's session should rework the architecture around this gallery-vs-auction-engine split.

## Discoveries

### Discovery 1: The Gallery Doesn't Need a Database

William asked why serving images requires a database or an API. The answer: it doesn't. The painting catalog — 52 images, titles, dimensions, narratives, series assignments — is static content. A static site generator reads a data file at build time and produces HTML pages. The database and API are only needed for the transactional bidding layer: recording bids, processing payments, tracking state, calculating thresholds, managing accounts. The current spec conflates gallery content and auction state into the same Postgres tables and API endpoints, creating unnecessary complexity in the content-serving path.

**Consequence:** The Phase 4 architecture should be reworked around a clean separation: gallery layer (static content, markdown + images, build-time rendering) and auction engine (database, API, Stripe, auth). This also simplifies or eliminates TECH-04 (the real-time infrastructure question was about pushing bid status updates via WebSocket, which is overkill — simple polling suffices for updates that happen a few times per day).

## What Changed

### Files Created
| File | What it is |
|---|---|
| `system/exchange/2026-03-24-1518-acknowledgment-exchange-skill-bugfix/MANIFEST.md` | Acknowledgment of exchange skill bugfix from C3PO |

### Files Modified
| File | What changed |
|---|---|
| `.claude/skills/exchange/SKILL.md` | Exchange skill bugfix applied by C3PO (direct placement — reverse-lookup in Step 10) |
| `CLAUDE.md` | Active Sprint block for SPR-011 |
| `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` | Added §13.2 Image Infrastructure (7 subsections); updated tech stack table (R2 → Vercel Blob); simplified DB schema (4 image columns → 2); updated API responses |
| `company/production/auction-platform/define/spec-v1-03b-data-and-state.md` | Painting entity schema updated to match 04's 2-column image model |
| `company/production/auction-platform/define/spec-progress.md` | SIM-05 marked resolved |
| `system/log/2026-03-24.md` | SPR-011 reasoning log entries |
| `system/sprints/sprint-log.md` | SPR-010 row (from previous sprint close) |

## Key Decisions

1. **Vercel Blob + Next.js Image over pre-processed image pipeline.** Store one full-resolution source per painting, let the framework handle resizing and format conversion on demand. Eliminates manual Sharp/build-time processing. Rationale: 52 source images is trivially within free optimization tier; on-demand generation is simpler than maintaining a 4-file-per-painting pipeline; CDN caching means variants are generated once then served from edge.

2. **2 image columns instead of 4.** `image_source_url` (original) and `image_og_url` (pre-generated for meta tags) replace `image_thumbnail_url`, `image_primary_url`, `image_full_url`, and `image_og_url`. OG images must be pre-generated because meta tags can't use the Image component. Everything else is on-demand.

3. **Skip real-time, use polling.** Proposed eliminating WebSocket infrastructure (Supabase Realtime / Ably) in favor of simple polling. Bid status changes a few times per day — 30-second polling intervals are more than adequate. Defers real-time to a future enhancement if viewer experience demands it.

## What This Proves

William's instinct to simplify is architecturally correct. The spec suite was written by a CTO agent optimizing for completeness and best practices — WebSocket real-time, 4 pre-processed image sizes, painting catalog in Postgres. But the actual product is 52 paintings on a website where someone can occasionally place a bid. The gallery layer is a static site. The auction engine is the only part that needs server infrastructure. Separating these two concerns produces a system that's simpler to build, simpler to maintain, and degrades naturally to a pure static archive post-auction. This validates the project's "meaning over optimization" principle from the enterprise context — build the simplest thing that serves the art.

## Open Questions

1. **Rework Phase 4 architecture around gallery/auction-engine split.** The painting catalog should live as markdown + images in the codebase, rendered at build time. Only bid status, accounts, payments, and rewards live in Postgres. This is a significant restructuring of §2-§4 in the tech architecture spec.
2. **TECH-04 resolution.** Likely "neither" — skip real-time infrastructure, use polling. Needs to be formally resolved and written into the spec.
3. **TECH-03 (CMS vs markdown).** Still needs William's input — does he want to edit site copy without touching code?
4. **William's 03a review.** He approved the page designs but the session ended before discussing individual page details. May revisit specific pages if the architecture rework surfaces design implications.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` — focus on §2 (architecture pattern), §3 (database schema), §13.2 (image infrastructure)
3. `company/production/auction-platform/define/spec-v1-03a-site-design.md` — §2 (site map), §4 (homepage) for gallery-layer context
4. `company/production/auction-platform/define/spec-progress.md`
5. `agents/cto/cto-tasks.md`

**Next task:** Rework the Phase 4 technical architecture around the gallery/auction-engine separation — painting catalog as static content (markdown + images, build-time rendering), auction state as the only database-backed layer. Resolve TECH-04 as "polling, no real-time infrastructure."
