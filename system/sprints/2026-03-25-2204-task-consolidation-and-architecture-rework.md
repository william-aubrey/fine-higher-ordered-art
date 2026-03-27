# Task Consolidation and Architecture Rework

**Sprint:** SPR-012
**Date:** 2026-03-25
**Project:** Fine Higher Ordered Art

*Note: This narrative was written retroactively during SPR-013 (2026-03-26). SPR-012 was opened but the session ended before formal close. The reasoning log and transcript were captured in real-time and serve as the primary source.*

---

## Starting Point

The spec suite was complete (10 documents, 0 dangerous gaps), and William had approved the 03a site design. The major discovery from SPR-011 — that the painting gallery is static content that doesn't need a database — was unresolved, sitting as open question #1 in the SPR-011 narrative. Three TECH decisions remained open: TECH-03 (CMS vs markdown), TECH-04 (real-time infrastructure), and the gallery/auction-engine architectural split. A new inbound C3PO exchange (task management amendment) was waiting to be processed.

## Summary

A four-part session that transformed both the project's task infrastructure and its technical architecture. First, processed the C3PO task management amendment — installed an updated sprint skill and task management process, consolidated per-agent task files (cto-tasks.md, cao-tasks.md) into a unified TASKS.md with ontology-matched headers, and archived 31 completed items to a new completed-tasks.csv. Second, added stable task IDs to all 28 open items (PROD-nnn, SALES-nnn, CAO-nnn, CLO-nnn) at William's request. Third, resolved TECH-03 — William chose markdown edited in VS Code, no CMS, everything in this repo. Fourth, executed the largest architectural change in the project's history: rewrote Phase 4 to separate gallery (static markdown, build-time rendering) from auction engine (Neon Postgres, serverless API, Stripe). The paintings table shrank from 22 columns to 8, the Series table was removed, WebSocket infrastructure was replaced with simple polling, and the cost estimate dropped to $20-30/month.

## Discoveries

### Discovery 1: The Simplification Cascade

Resolving TECH-03 (markdown, no CMS) didn't just close one question — it unlocked the entire architecture rework. Once painting content was definitively files-in-repo rather than database rows, the gallery/auction-engine split became obvious: the gallery layer is a static site generator reading markdown, the auction engine is the only thing that touches Postgres. This cascaded through the spec: the paintings table lost 14 columns (all content fields moved to frontmatter), the Series table disappeared (series is a frontmatter field, not a relational entity), the `/api/paintings` endpoint became `/api/bid-status` (a thin overlay, not a content source), and the real-time infrastructure question (TECH-04) resolved itself — you don't need WebSockets to push bid status updates that happen a few times per day.

**Consequence:** Three open TECH decisions collapsed into one architectural rework. The Phase 4 spec went from v1 to v2 with fundamental changes to §2 (architecture), §3 (schema), §4 (API), §7 (polling replaces real-time), and §13.1 (content structure). The project's monthly cost estimate dropped from ~$50-70 to $20-30.

## What Changed

### Files Created
| File | What it is |
|---|---|
| `agents/cao/processes/process-manage-tasks.md` | Task management process definition (from C3PO exchange) |
| `system/exchange/2026-03-25-0553-task-management-and-sprint-update/` | Inbound exchange from C3PO |
| `system/exchange/2026-03-25-0707-acknowledgment-task-management-and-sprint-update/` | Acknowledgment exchange to C3PO |
| `system/log/completed-tasks.csv` | Append-only archive of completed tasks (31 initial + 4 this session) |
| `system/log/2026-03-25.md` | SPR-012 reasoning log |
| `system/transcripts/2026-03-25-hhmm-open-sprint.md` | SPR-012 conversation transcript |

### Files Modified
| File | What changed |
|---|---|
| `.claude/skills/sprint/SKILL.md` | Updated sprint skill from C3PO exchange (Steps 6/7 reference new task convention) |
| `CLAUDE.md` | Active Sprint block, Next Steps updated |
| `TASKS.md` | Consolidated from per-agent files, restructured with ontology headers, task IDs added, 4 tasks closed |
| `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` | v1 → v2: gallery/auction-engine split, paintings table 22→8 columns, Series table removed, polling replaces WebSocket, markdown content structure |
| `company/production/auction-platform/define/spec-progress.md` | SIM-11, SIM-14 resolved |

### Files Deleted
| File | Why |
|---|---|
| `agents/cto/cto-tasks.md` | Consolidated into TASKS.md per task management amendment |
| `agents/cao/cao-tasks.md` | Consolidated into TASKS.md per task management amendment |

## Key Decisions

1. **Ontology-matched task headers over flat list.** TASKS.md headers mirror the repo folder structure (## company → ### company/production, ## agents → ### agents/cao). Makes task ownership visible and scales naturally as the repo grows. Driven by the C3PO task management process definition.

2. **Stable task IDs with area prefixes.** PROD-nnn, SALES-nnn, CAO-nnn, CLO-nnn. William requested this for cross-sprint referenceability. The prefix scheme maps to ontology headers, so IDs are self-locating.

3. **Painting slug as primary key instead of UUID.** The thin paintings table uses `painting_slug VARCHAR(100)` as PK rather than a synthetic UUID. Since paintings are identified by their markdown filename (which is the slug), using slug as PK eliminates a mapping layer. All foreign keys reference slug directly.

4. **30/15/60-second polling intervals.** Gallery pages poll bid status every 30s, image pages every 15s, auction stats every 60s. Implementation is ~10 lines of `useEffect` + `setInterval`. Worst-case latency is imperceptible for an auction where bids arrive hours apart.

## What This Proves

William's instinct to simplify is architecturally sound. The CTO agent's original Phase 4 spec was technically correct but over-engineered for the actual product: 52 paintings, occasional bids, one auction, six months. Three TECH decisions that seemed independent (CMS choice, real-time infrastructure, database scope) collapsed into a single architectural insight once the static-vs-dynamic boundary was drawn correctly. The resulting system is simpler to build, cheaper to run, and degrades naturally to a permanent static archive when the auction ends.

## Open Questions

1. **PROD-005: Tech stack evaluation.** The spec assumes Next.js + Vercel + Neon, but this hasn't been formally evaluated against alternatives. May be resolved implicitly when scaffolding begins.
2. **PROD-006/007: Payment processor and hosting.** Spec says Stripe and Vercel — needs formal selection before build.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` — §2 (two-layer architecture), §3 (thin paintings table), §13.1 (markdown content structure)
3. `company/production/auction-platform/define/spec-progress.md`

**Next task:** PROD-004 — Begin build. Scaffold the Next.js project with the two-layer structure: `content/paintings/` directory for markdown catalog, API routes for auction engine, Neon database connection.
