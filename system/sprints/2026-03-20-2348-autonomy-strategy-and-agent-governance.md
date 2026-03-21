# Autonomy Strategy and Agent Governance

**Sprint:** SPR-006
**Date:** 2026-03-20
**Project:** Fine Higher Ordered Art

---

## Starting Point

FHOA had been idle for two days since SPR-005 (skeleton verification). The spec work — Phases 3 through 5 — was entirely queued and ready to execute, but no session was open. The project has a December 31, 2026 auction close date. The bottleneck was not complexity or missing inputs; it was the Principal's attention, consumed by a separate writing project. Phase 3 site design was the next task, but the session took a different direction.

## Summary

The Principal arrived with a meta-question rather than a spec task: if human attention is the limiting factor in the agentic age, how do we unleash Claude's full autonomous capability? He posed the same question to all four enterprise instances simultaneously, asking each to produce an independent strategic analysis.

FHOA produced a six-part autonomy strategy document analyzing the problem from the auction platform's specific perspective. The core finding was quantitative: FHOA has a 20:1 work-to-judgment ratio — roughly 40-60 hours of autonomous-capable work (Phase 3-5 specs, tech evaluation, prototyping) queued behind 2-3 hours of William's actual judgment. The remainder of his session time is *presence*, not *judgment*, and presence is eliminable. Seven strategies were proposed, from immediately actionable (standing orders, batch approval) to infrastructure-dependent (MCP servers, peer exchange protocol). An inter-instance exchange was drafted proposing cross-instance discussion of findings.

Hours later, C3PO delivered an amendment (`ctrl-agent-directed-work.md`) formalizing three process gaps exposed by the simultaneous exercise: work was directed to "the instance" rather than specific agents, outputs landed in improvised locations, and the inter-instance exchanges bypassed C3PO's visibility. FHOA installed the governance control, moved all autonomy strategy artifacts into an acknowledgment exchange payload per instructions, produced an agent infrastructure inventory, and delivered the acknowledgment to C3PO.

## Discoveries

### Discovery 1: The governance framework IS the autonomy framework

While writing the autonomy strategy, it became clear that C3PO's boundary-enforcement governance model — where constraints define what instances *cannot* do, implicitly authorizing everything else — is precisely the trust structure needed for autonomous session-level operation. The architecture for agent autonomy already exists at the enterprise level; it had simply never been applied to the question of "what can Claude do without William present?"

**Consequence:** The proposed autonomy strategies (standing orders, green/yellow/red zones, batch approval) are not new mechanisms. They are applications of boundary enforcement at a different scale. This reframing means the solution doesn't require new infrastructure — it requires recognizing that existing infrastructure already permits autonomous operation within defined constraints.

### Discovery 2: The exercise itself proved the gap it was investigating

The Principal's request exposed exactly the process gaps C3PO identified: no agent addressing, no output standard, no inter-instance protocol. FHOA stored its strategy in `system/sprints/` (improvised), addressed an exchange to "all sibling instances" (no such address), and wrote from no agent's perspective. The very act of discussing autonomous operation demonstrated why the governance framework needs to be formalized before agents operate autonomously.

**Consequence:** C3PO's `ctrl-agent-directed-work.md` amendment was a direct result. The standard now requires: work directed to specific CXO agents, outputs stored in IDEF0-defined locations, inter-instance communication routed through C3PO, and the CAO serving as intake for unstructured requests. This is a prerequisite for the autonomy strategies proposed — you can't have autonomous agents if you don't have addressed agents.

## What Changed

### Files Created
| File | What it is |
|---|---|
| `company/process/controls/ctrl-agent-directed-work.md` | Governance control: agent addressing, output locations, task management, inter-instance rules, CAO intake |
| `system/exchange/2026-03-20-2042-agent-directed-work-amendment/` | Inbound C3PO exchange (2 files) |
| `system/exchange/2026-03-20-2045-acknowledgment-agent-directed-work/MANIFEST.md` | Acknowledgment with autonomy strategy, inter-instance proposal, and agent inventory |
| `system/exchange/2026-03-20-2045-acknowledgment-agent-directed-work/autonomy-strategy-fhoa.md` | Full 6-part autonomy strategy (moved from sprints/) |
| `system/exchange/2026-03-20-2045-acknowledgment-agent-directed-work/inter-instance-proposal-manifest.md` | Inter-instance exchange proposal (moved from original exchange folder) |
| `system/exchange/2026-03-20-2045-acknowledgment-agent-directed-work/agent-inventory-fhoa.md` | Agent infrastructure inventory: CLO only, CTO first to instantiate |
| `system/log/2026-03-20.md` | Reasoning log for this session |
| `system/transcripts/2026-03-18-hhmm-open-sprint.md` | Conversation transcript for SPR-006 |

### Files Modified
| File | What changed |
|---|---|
| `CLAUDE.md` | Active Sprint block added (will be removed at close) |
| `system/log/2026-03-18.md` | SPR-006 open entry appended (sprint opened on 2026-03-18) |

### Files Deleted
| File | Why |
|---|---|
| `system/exchange/2026-03-20-0644-proposal-autonomy-strategy/` | Contents moved into acknowledgment package per C3PO instructions |

## Key Decisions

1. **Produced the autonomy strategy as a single comprehensive document rather than incremental exploration.** The question warranted a complete answer — problem analysis, critique, strategies, action plan, timeline impact, and deeper observation — because a fragmented response would have been harder for cross-instance comparison. This turned out to be prescient: C3PO reviewed all four strategies simultaneously, and a consistent format made synthesis possible.

2. **Moved (not copied) autonomy artifacts into the acknowledgment payload.** C3PO's amendment explicitly said "move, not copy — original locations should be clean after this step." This is the right call: the strategy was authored in an improvised location (sprints/), and moving it into the exchange ledger puts it where governance artifacts belong. The reasoning log preserves the full analytical record of its creation.

3. **Prioritized CTO as first agent to instantiate.** The agent inventory recommends CTO first because Phase 3-5 spec work is the largest autonomous work queue. CAO is second (intake routing, governance coordination), CPO third (product validation). This prioritization derives from where the 20:1 ratio is most acute.

## What This Proves

The Principal's simultaneous-question exercise was a live experiment in autonomous operation — and it exposed real gaps even as it confirmed the potential. The 20:1 ratio at FHOA is genuine: the spec work is ready, the inputs are complete, and the bottleneck is purely attention scheduling. But the exercise also proved that autonomous operation without governance scaffolding produces inconsistent results. C3PO's rapid correction (agent-directed work standard within the same day) demonstrates that the governance framework can evolve quickly enough to keep pace with operational experiments.

The broader arc: the Ouborobo enterprise is approaching the point where governance design becomes the primary work — not because the product work is done, but because the product work is ready to be delegated and the delegation framework needs to be precise enough to trust.

## Open Questions

1. **Agent instantiation sequence and timing** — The inventory recommends CTO first, but should agents be instantiated incrementally (one per sprint) or all at once? C3PO may have a preference.
2. **TASKS.md migration** — When and how to split the monolithic task file into per-agent task files + Principal-only TASKS.md. Needs coordination with the agent instantiation.
3. **Standing orders mechanism** — The autonomy strategy proposed `STANDING-ORDERS.md`, but `ctrl-agent-directed-work.md` may supersede this with per-agent task files. Needs C3PO guidance on whether standing orders are a separate mechanism or are subsumed by agent task management.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `company/process/controls/ctrl-agent-directed-work.md`
3. `system/exchange/2026-03-20-2045-acknowledgment-agent-directed-work/MANIFEST.md`
4. `system/exchange/2026-03-20-2045-acknowledgment-agent-directed-work/agent-inventory-fhoa.md`
5. `company/production/auction-platform/specs/spec-progress.md`
6. `CLAUDE.md`

**Next task:** Instantiate the CTO agent (`agents/cto/cto-tasks.md`) and migrate CTO-scoped tasks from TASKS.md, then begin Phase 3 site design spec (`spec-v1-03a-site-design.md`) as the CTO's first autonomous work product.
