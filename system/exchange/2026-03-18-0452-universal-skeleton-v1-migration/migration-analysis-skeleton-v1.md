# Migration Analysis — Fine Higher Ordered Art → Universal Instance Skeleton v1

**Date:** 2026-03-18
**Repo:** `G:\My Drive\A0 Fine Higher Ordered Art`
**Product ID:** `auction-platform`
**Product Path:** `company/production/auction-platform/`
**Agent ID:** FHOA has no deployed CXO agents yet (agents/ directory empty)

---

## Repo Overview

FHOA is the 4th enterprise instance (onboarded 2026-03-15). It is an abstract expressionist art business selling 52 original acrylic paintings through a custom tiered-bid auction website. The repo has 56 tracked files across 4 sprints. SDD Phases 1-2 are complete (8 personas, 6 journey docs). Phase 3 (Product Design) is next. The repo has an Active Sprint block in CLAUDE.md that must be removed per skeleton convention.

Current structure: governance/ (controls/ + mechanisms/), specs/, exchange/, library/ (sprints/, log/, legal/, transcripts/), reference/idef0/.

---

## Soul Document Assessment

FHOA has no standalone soul document. The product thesis and A-0 ICOM are embedded in CLAUDE.md. A `company/fhoa-soul.md` must be created extracting:
- Product thesis (CLAUDE.md line 16)
- A-0 boundary table (CLAUDE.md lines 20-26)
- Key constraints summary (CLAUDE.md lines 29-33)
- NAICS codes (CLAUDE.md lines 64-66)

---

## File-by-File Migration Table

| Current Path | Target Path | Action | Notes |
|---|---|---|---|
| `CLAUDE.md` | `CLAUDE.md` | Rewrite | Remove Active Sprint block, update paths, add /spec skill |
| `TASKS.md` | `TASKS.md` | Edit | Fix path references |
| `.claude/skills/sprint/SKILL.md` | `.claude/skills/sprint/SKILL.md` | Overwrite | Install latest from C3PO |
| `.claude/skills/exchange/SKILL.md` | `.claude/skills/exchange/SKILL.md` | Overwrite | Install latest from C3PO |
| `.claude/skills/spec/SKILL.md` | `.claude/skills/spec/SKILL.md` | Overwrite | Install latest from C3PO |
| `governance/README.md` | `company/process/README.md` | Replace | New content for process/ |
| `governance/controls/ctrl-approval-gates.md` | `company/process/controls/ctrl-approval-gates.md` | git mv | Layer 1 control |
| `governance/controls/ctrl-enterprise-context.md` | `company/process/controls/ctrl-enterprise-context.md` | git mv | Layer 1 control |
| `governance/controls/ctrl-instance-constraints.md` | `company/process/controls/ctrl-instance-constraints.md` | git mv | Layer 1 control |
| `governance/controls/ctrl-instance-interfaces.md` | `company/process/interfaces/ctrl-instance-interfaces.md` | git mv | Interface doc → interfaces/ |
| `governance/controls/ctrl-spec-profiles.md` | `company/process/controls/ctrl-spec-profiles.md` | git mv | Layer 1 control |
| `governance/mechanisms/spec-driven-development.md` | `company/process/mechanisms/spec-driven-development.md` | git mv | Mechanism |
| `exchange/` (all subdirs) | `system/exchange/` | git mv | Immutable exchange records |
| `library/sprints/sprint-log.md` | `system/sprints/sprint-log.md` | git mv | Sprint PM artifact |
| `library/sprints/2026-03-15-1310-*.md` | `system/sprints/2026-03-15-1310-*.md` | git mv | Immutable narrative |
| `library/sprints/2026-03-15-2157-*.md` | `system/sprints/2026-03-15-2157-*.md` | git mv | Immutable narrative |
| `library/sprints/2026-03-16-0921-*.md` | `system/sprints/2026-03-16-0921-*.md` | git mv | Immutable narrative |
| `library/sprints/2026-03-16-2224-*.md` | `system/sprints/2026-03-16-2224-*.md` | git mv | Immutable narrative |
| `library/log/2026-03-16.md` | `system/log/2026-03-16.md` | git mv | Reasoning log |
| `library/log/2026-03-17.md` | `system/log/2026-03-17.md` | git mv | Reasoning log |
| `library/auction-mechanism.md` | `company/production/auction-platform/specs/auction-mechanism.md` | git mv | Archived product spec |
| `library/srs-fine-higher-ordered-art.md` | `company/production/auction-platform/specs/srs-fine-higher-ordered-art.md` | git mv | Archived SRS seed |
| `library/legal/fiduciary-rfp.md` | `agents/clo/library/fiduciary-rfp.md` | git mv | CLO work product |
| `library/legal/securities-opinion-request.md` | `agents/clo/library/securities-opinion-request.md` | git mv | CLO work product |
| `library/transcripts/2026-03-15-2157.md` | `system/transcripts/2026-03-15-2157.md` | git mv | Session transcript |
| `library/transcripts/2026-03-16-0921.md` | `system/transcripts/2026-03-16-0921.md` | git mv | Session transcript |
| `library/transcripts/2026-03-16-2224.md` | `system/transcripts/2026-03-16-2224.md` | git mv | Session transcript |
| `reference/idef0/ref-decomposition-rules.md` | `company/process/controls/ref-decomposition-rules.md` | git mv | IDEF0 reference absorbed into controls/ |
| `reference/idef0/ref-enterprise-model.md` | `company/process/controls/ref-enterprise-model.md` | git mv | IDEF0 reference absorbed into controls/ |
| `reference/idef0/ref-enterprise-viewpoint.md` | `company/process/controls/ref-enterprise-viewpoint.md` | git mv | IDEF0 reference absorbed into controls/ |
| `reference/idef0/ref-skill-definition-standard.md` | `company/process/controls/ref-skill-definition-standard.md` | git mv | IDEF0 reference absorbed into controls/ |
| `specs/spec-progress.md` | `company/production/auction-platform/specs/spec-progress.md` | git mv | Active spec tracker |
| `specs/spec-v1-00-index.md` | `company/production/auction-platform/specs/spec-v1-00-index.md` | git mv | Active spec |
| `specs/spec-v1-01-icp-jtbd.md` | `company/production/auction-platform/specs/spec-v1-01-icp-jtbd.md` | git mv | Active spec |
| `specs/spec-v1-02a-*.md` | `company/production/auction-platform/specs/spec-v1-02a-*.md` | git mv | Active spec |
| `specs/spec-v1-02b-*.md` | `company/production/auction-platform/specs/spec-v1-02b-*.md` | git mv | Active spec |
| `specs/spec-v1-02c-*.md` | `company/production/auction-platform/specs/spec-v1-02c-*.md` | git mv | Active spec |
| `specs/spec-v1-02d-*.md` | `company/production/auction-platform/specs/spec-v1-02d-*.md` | git mv | Active spec |
| `specs/spec-v1-02e-*.md` | `company/production/auction-platform/specs/spec-v1-02e-*.md` | git mv | Active spec |
| `specs/spec-v1-02f-*.md` | `company/production/auction-platform/specs/spec-v1-02f-*.md` | git mv | Active spec |

---

## Cross-Reference Table

Files referencing paths that will change and need updating:

| File | References To Update |
|---|---|
| `CLAUDE.md` | governance/ → company/process/, specs/ → company/production/auction-platform/specs/, exchange/ → system/exchange/, library/ → system/ and agents/ |
| `TASKS.md` | library/legal/ → agents/clo/library/, specs/ → company/production/auction-platform/specs/ |
| `specs/spec-progress.md` | library/ references (auction-mechanism.md, srs) |
| `specs/spec-v1-00-index.md` | governance/ paths, library/ paths |
| Sprint narratives | Bootstrap prompt paths — DO NOT EDIT (immutable records) |
| Journey docs | governance/ refs in text — DO NOT EDIT (immutable authored specs) |

---

## Ambiguous Files

| File | Decision | Rationale |
|---|---|---|
| `reference/idef0/*.md` | → `company/process/controls/` | IDEF0 reference material is governance/process knowledge, not product-specific. Controls/ is the correct home since these are read-only C3PO-sourced references. |
| `library/legal/*.md` | → `agents/clo/library/` | Legal RFPs are CLO work products. The agents/ folder is the correct home for agent-specific work products. |
| `library/transcripts/*.md` | → `system/transcripts/` | Session transcripts are operational records, not product artifacts. |

---

## New Files to Create

| File | Purpose |
|---|---|
| `company/fhoa-soul.md` | Soul document extracted from CLAUDE.md |
| `company/process/README.md` | Process folder orientation (replaces governance/README.md) |

---

## Folders to Delete After Migration

| Folder | Condition |
|---|---|
| `governance/` | After all files moved out |
| `library/` | After all files moved out |
| `exchange/` | After git mv to system/exchange/ |
| `specs/` | After all files moved to company/production/auction-platform/specs/ |
| `reference/` | After all files moved out |

---

## Summary

- **56 tracked files** in the repo
- **3 files** to overwrite (skills from C3PO)
- **~40 files** to git mv
- **2 files** to create (soul doc, process README)
- **1 file** to rewrite (CLAUDE.md)
- **1 file** to edit (TASKS.md)
- **5 top-level folders** to remove after migration (governance/, library/, exchange/, specs/, reference/)
- **Active Sprint block** in CLAUDE.md must be removed
- **No immutable records edited** (sprint narratives, exchange packages)
