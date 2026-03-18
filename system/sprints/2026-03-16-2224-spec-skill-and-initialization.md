# Spec Skill Delivery and Suite Initialization

**Date:** 2026-03-16
**Project:** Fine Higher Ordered Art

---

## Starting Point

The previous sprint (repo-setup-and-governance-sync, earlier today) had established version control and processed two C3PO exchanges but left a third exchange unprocessed: `2026-03-16-0920-spec-skill-icom-amendment`. That exchange delivered the TCC-originated `/spec` skill, spec profiles with a software profile directly applicable to FHOA's auction website, an updated SDD process guide, and enterprise context v3 with ICOM-restructured paths. The last sprint's bootstrap prompt explicitly stated: "If the TCC spec-driven development skill has arrived via exchange, read and apply it first." It had arrived. Meanwhile, FHOA's existing spec suite — 7 complete documents covering Phases 1–2 of the SDD methodology — had no formal progress tracker or phase mapping. The spec suite was ready for Phase 3 (Product Design) but lacked the infrastructure to execute it under the new `/spec` lifecycle.

## Summary

This sprint accomplished two things: processing the inbound C3PO exchange and initializing the `/spec` lifecycle against FHOA's existing spec work.

The exchange delivered four files — enterprise context v3, the `/spec` skill, spec profiles, and an updated SDD process guide. All were applied without modification. FHOA adopted C3PO's recommended ICOM governance folder restructure, moving `ctrl-*.md` files into `governance/controls/` and the SDD process guide into `governance/mechanisms/`. The old flat `governance/` structure and `governance/processes/` subfolder were retired. CLAUDE.md was updated with the new paths and the `/spec` skill was added to the skills list. An acknowledgment was written and delivered to C3PO.

With the `/spec` skill installed, `/spec start` was run to initialize the progress tracker. Because FHOA predated the skill, a pre-initialization simulation was run first — a three-pass validation (phase assignment, quality gate, forward dependency) against the software profile. Both Phases 1 and 2 passed their quality gates. The simulation identified 8 specific gaps that Phase 3 must resolve (Art Auction page, How Bidding Works page, post-auction state, gallery scroller component, About the Artist, outbid notification reward display, data formatting, responsive design). The Principal directed that the auction mechanism spec and SRS seed be archived to `library/` (their content to be absorbed into Phases 3–4), that Phase 3 should exhaustively detail every website element, and confirmed that Stripe's NFT issues are crypto-specific and don't apply to physical art sales. Phase 3 was split into two documents: 03a (site design) and 03b (data and state).

## Discoveries

### Discovery 1: The auction mechanism document straddles phases

The `auction-mechanism.md` was written before the phase model existed and naturally contains WHO content (the mechanism itself as product context), WHAT content (§9 website presentation), and BUILD content (escrow flows, settlement math, real-time contention). Treating it as a "supporting spec" created ambiguity about which document was authoritative for any given topic.

**Consequence:** Archived to `library/`. Its content becomes the raw material absorbed into Phase 3 (how the mechanism is explained to users) and Phase 4 (how the mechanism is implemented). The numbered spec suite becomes the single source of truth.

### Discovery 2: External blockers don't block spec work

The three hard prerequisites (securities counsel, fiduciary lawyer, painting inventory) are tagged as "blocks launch" but were initially categorized alongside spec-blocking questions. The pre-initialization simulation clarified that these block the *product*, not the *specification*. Phase 3 page templates can be designed with placeholder dimensions. Phase 4 can specify escrow integration patterns without knowing which lawyer. The spec proceeds in parallel with William's external actions.

**Consequence:** The progress tracker explicitly separates "External Blockers (Do Not Block Spec Work)" from the phase plan, preventing future sessions from stalling on external dependencies.

## What Changed

### Files Created
| File | What it is |
|---|---|
| `governance/controls/ctrl-enterprise-context.md` | Enterprise context v3 (from exchange) |
| `governance/controls/ctrl-spec-profiles.md` | Spec profiles with software profile (from exchange) |
| `governance/controls/ctrl-approval-gates.md` | Moved from flat governance/ |
| `governance/controls/ctrl-instance-constraints.md` | Moved from flat governance/ |
| `governance/controls/ctrl-instance-interfaces.md` | Moved from flat governance/ |
| `governance/mechanisms/spec-driven-development.md` | Updated SDD process guide (from exchange, replaces governance/processes/) |
| `.claude/skills/spec/SKILL.md` | /spec skill (from exchange) |
| `exchange/2026-03-16-1043-acknowledgment-spec-skill-icom/MANIFEST.md` | Acknowledgment of spec-skill-icom-amendment exchange |
| `specs/spec-progress.md` | Spec lifecycle progress tracker — Phases 1–2 complete, 3–5 pending |
| `library/auction-mechanism.md` | Archived from specs/ |
| `library/srs-fine-higher-ordered-art.md` | Archived from specs/ |

### Files Modified
| File | What changed |
|---|---|
| `CLAUDE.md` | Updated project structure (ICOM paths), added /spec to skills list, Active Sprint section |
| `specs/spec-v1-00-index.md` | Updated reading order (03a/03b split), archived references section, governance paths, decisions #21–23 |
| `library/log/2026-03-16.md` | Reasoning log entries for this session |

### Files Deleted
| File | Why |
|---|---|
| `governance/ctrl-enterprise-context.md` | Replaced by v3 in governance/controls/ |
| `governance/ctrl-approval-gates.md` | Moved to governance/controls/ |
| `governance/ctrl-instance-constraints.md` | Moved to governance/controls/ |
| `governance/ctrl-instance-interfaces.md` | Moved to governance/controls/ |
| `governance/processes/spec-driven-development.md` | Replaced by updated version in governance/mechanisms/ |
| `specs/auction-mechanism.md` | Archived to library/ — content absorbed into Phases 3–4 |
| `specs/srs-fine-higher-ordered-art.md` | Archived to library/ — superseded by spec suite |

## Key Decisions

1. **Adopted ICOM governance folder restructure.** C3PO recommended but didn't mandate it. Adopted because FHOA is early enough that path references are minimal — three files needed updating (CLAUDE.md, spec index, spec profiles reference path). The structure (`controls/`, `mechanisms/`) maps cleanly to IDEF0 ICOM arrows and will scale as governance documents accumulate.

2. **Split Phase 3 into 03a (site design) and 03b (data and state).** The Principal requested exhaustive detail on every website element. A single document covering page templates, component specs, responsive behavior, URL structure, notification templates, AND data schemas would be unwieldy. The split keeps site-facing design separate from the underlying data model — different readers (designer vs. engineer) can focus on their document.

3. **Archived auction mechanism and SRS rather than keeping them as "supporting specs."** The hybrid nature of `auction-mechanism.md` created ambiguity about source-of-truth for topics it shared with journey docs. Archiving eliminates the ambiguity — the numbered spec suite is authoritative, the archived documents are historical references.

4. **Stripe assessed as viable for physical art sales.** The Principal's concern about Stripe stemmed from NFT-related account suspensions. Those issues are specific to crypto/blockchain volatility and chargeback risk on digital assets. Physical painting sales through escrow are standard e-commerce. Final payment processor selection deferred to Phase 4 and fiduciary lawyer input.

## What This Proves

This sprint completes the tooling and infrastructure layer for FHOA's spec-driven development. The project now has:
- A complete governance stack (ICOM-structured, v3 enterprise context)
- The `/spec` lifecycle skill with a software profile mapped to the auction platform
- A progress tracker showing exactly where the spec stands (Phases 1–2 done, 3–5 pending)
- 8 identified gaps ready to drive Phase 3 work

The pre-initialization simulation validated that TCC's methodology transfers cleanly to a different domain — the software profile's quality gates applied without modification to FHOA's art auction spec, and the phase model correctly classified all existing documents. This is a data point for C3PO's design thesis: the architecture transfers across instantiations without significant rework.

## Open Questions

1. **Payment processor selection** — Stripe likely viable for physical art. Square also an option. Decision deferred to Phase 4 / fiduciary input. No dual development path needed.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `specs/spec-progress.md`
3. `specs/spec-v1-00-index.md`
4. `specs/spec-v1-02a-journey-collector-connoisseur.md`
5. `library/auction-mechanism.md`
6. `governance/controls/ctrl-spec-profiles.md`
7. `CLAUDE.md`

**Next task:** Begin Phase 3 with `/spec what`. Start with `spec-v1-03a-site-design.md` — walk through every page of the website from homepage to post-auction gallery, specifying layout, content, components, responsive behavior, and UX for each. Use the 8 identified gaps from the pre-initialization simulation as the starting agenda. Read the archived `library/auction-mechanism.md` §9 for existing website presentation notes to absorb.
