# CTO Instantiation and Phase 3 Site Design

**Sprint:** SPR-007
**Date:** 2026-03-21 / 2026-03-22 (two-day session)
**Project:** Fine Higher Ordered Art

---

## Starting Point

FHOA had been idle for two days since SPR-006. The autonomy strategy session had produced a clear next step: instantiate the CTO agent and begin Phase 3 spec work. The 20:1 work-to-judgment ratio identified in SPR-006 was real — Phases 1 and 2 were complete, all inputs were ready, and the only thing missing was a session to do the work. The agent-directed work standard (`ctrl-agent-directed-work.md`) was installed but no agents had task files yet. TASKS.md still contained a mix of CTO-scoped and Principal-scoped work.

## Summary

This sprint accomplished three things: CTO agent instantiation with task migration, Phase 3 site design specification, and processing of three C3PO governance exchanges.

The CTO was instantiated as the first agent with its own task file (`agents/cto/cto-tasks.md`). All spec work, tech stack evaluation, and technical decisions were migrated from the monolithic TASKS.md, which was trimmed to Principal-only items (legal, art, content). This was the task migration that SPR-006 recommended.

The main deliverable was `spec-v1-03a-site-design.md` — the complete Phase 3 product design specification for the Charlotte Collection auction website. The spec covers 21 sections: 11 page templates (Homepage through Bid Confirmation Flow), 3 reusable components (gallery scroller, tier buttons, bid status indicators), 5 interaction flows (registration, below-threshold bidding, above-threshold lawyer-mediated bidding, WTA inquiry, bid visibility), 7 notification templates, Open Graph meta tags, responsive design across 3 breakpoints, WCAG AA accessibility, and Core Web Vitals performance targets. It synthesized all Phase 1-2 inputs — 8 personas, 6 journey documents, the auction mechanism spec, and 23 key decisions — resolving 4 open questions from Phase 2 while flagging 7 external dependencies that block launch but not spec work.

Between sessions, three C3PO exchanges arrived and were processed: Universal Skeleton v2 migration (full 10-agent folder structure, 30 enterprise skill files, CAO methodologies, agent context files, librarian infrastructure), sprint skill v5 (memory snapshot at sprint close), and sprint skill v6 (session persistence — raw JSONL capture, config snapshot). All were installed, verified, and acknowledged. The skeleton v2 brought FHOA to parity with the enterprise standard — all 10 agents now have folders, contexts, and seed task files.

## What Changed

### Files Created
| File | What it is |
|---|---|
| `agents/cto/cto-tasks.md` | CTO agent task file with migrated spec and tech tasks |
| `company/production/auction-platform/specs/spec-v1-03a-site-design.md` | Phase 3 site design spec — 21 sections, complete product design |
| `system/exchange/2026-03-22-1046-acknowledgment-skeleton-v2-migration/MANIFEST.md` | Skeleton v2 acknowledgment |
| `system/exchange/2026-03-22-1401-acknowledgment-sprint-v5-memory-snapshot/MANIFEST.md` | Sprint v5 acknowledgment |
| `system/exchange/2026-03-22-1536-acknowledgment-sprint-v6-session-persistence/MANIFEST.md` | Sprint v6 acknowledgment |
| `system/memory/*.md` (8 files) | Initial memory snapshot mirror |
| `system/log/2026-03-21.md` | Reasoning log for this sprint |
| `system/transcripts/2026-03-21-hhmm-open-sprint.md` | Conversation transcript |

### Files Modified
| File | What changed |
|---|---|
| `TASKS.md` | CTO tasks migrated out; Principal-only items remain; CLO paths updated |
| `CLAUDE.md` | Active Sprint block added/removed |
| `company/process/controls/ctrl-enterprise-context.md` | Updated to R1.2a + R5.3 (skeleton v2) |
| `company/process/controls/ctrl-instance-governance-standard.md` | New — governance standard v2 installed |
| `company/production/auction-platform/specs/spec-progress.md` | Phase 3a marked complete |
| `company/production/auction-platform/specs/spec-v1-00-index.md` | Phase 3a status updated; CLO paths updated |
| `agents/clo/clo-tasks.md` | Library migration completed; paths updated |
| `.claude/skills/sprint/SKILL.md` | Updated to v6 (memory snapshot + session persistence) |
| `.claude/skills/exchange/SKILL.md` | Updated via skeleton v2 |

### Files Deleted
| File | Why |
|---|---|
| `company/process/mechanisms/spec-driven-development.md` | Superseded by `agents/cao/processes/spec-driven-development.md` |
| `agents/clo/library/` (folder) | Contents moved to `agents/clo/products/` |

### Structures Created by Skeleton v2 (direct-placed by C3PO)
| Structure | Count |
|---|---|
| Agent folders (cao, cfo, cho, cmo, coo, cpo, cro, librarian + cto/clo subfolders) | 10 agents |
| Enterprise skill files (`company/process/functions/`) | 30 files |
| CAO methodologies (`agents/cao/processes/`) | 6 files |
| Agent context files | 10 files |
| Seed task files | 8 files (CTO preserved) |
| Librarian infrastructure | 3 files |
| Config snapshot (`system/config/claude/`) | 2 files |

## Key Decisions

1. **Wrote the complete Phase 3 site design in a single pass rather than incrementally.** All Phase 1-2 inputs were ready. The spec profile says WHAT phase produces 1-2 files. A single comprehensive document covering every page, component, and flow is more useful for Phase 4 and simulation than incremental page-by-page specs that would need cross-referencing.

2. **Withheld reward dollar amounts until settlement in the dashboard and outbid notification.** This resolves J02e-03. Showing reward amounts before settlement feeds the Gambler framing (securities risk). The notification says "a thank-you from the artist" — not a dollar figure. The dashboard shows "Reward at settlement if auction succeeds." This is the safer position for securities counsel review.

3. **Selected Option A for CLO library/ disposition.** Moved files to `products/` rather than renaming `library/` to `products/`. Cleaner because skeleton v2 had already created an empty `products/` folder — moving files into the standard location is simpler than juggling folder renames.

4. **Stayed in sprint across two days.** William arrived the next morning with C3PO exchanges inbound. Rather than closing and reopening (which would have been pure ceremony for the same context window), we continued processing. Precedent: SPR-005 processed two exchanges in one session.

## What This Proves

The 20:1 work-to-judgment ratio from SPR-006 is real and operational. The CTO agent's first autonomous work product — a 1,295-line site design spec synthesizing 6+ input documents — was produced in a single turn with zero blocking questions for the Principal. The spec resolved 4 open questions independently and correctly identified 7 that require external input. This is what agent-directed work looks like at the instance level: the governance framework provides the constraints, the spec methodology provides the structure, the Phase 1-2 inputs provide the content, and the agent produces the work product.

The three-exchange processing also demonstrates operational maturity. C3PO's delivery pattern has evolved: direct-place files, hash-verify, acknowledge. The instance doesn't install files manually — it verifies what was placed and confirms. This is efficient and auditable.

## Open Questions

1. **C3PO 3rd edition whitepaper** — William pointed to this document at sprint end. Not yet read in full (~44k words). May contain context relevant to FHOA's work or the Principal may want the instance to read it for alignment purposes. Follow up next sprint.
2. **Phase 3b timing** — Data and state spec is the CTO's next active task. Ready to execute.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `agents/cto/cto-tasks.md`
3. `company/production/auction-platform/specs/spec-v1-03a-site-design.md`
4. `company/production/auction-platform/specs/spec-progress.md`
5. `company/process/controls/ctrl-agent-directed-work.md`
6. `CLAUDE.md`

**Next task:** Read the C3PO 3rd edition whitepaper if William confirms, then begin Phase 3 data and state spec (`spec-v1-03b-data-and-state.md`) — schemas, auction state machine, notification events.
