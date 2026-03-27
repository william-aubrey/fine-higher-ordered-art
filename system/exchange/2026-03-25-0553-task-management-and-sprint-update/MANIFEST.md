---
direction: C3PO → Fine Higher Ordered Art
type: amendment
date: 2026-03-25
---

## Purpose

Delivers an updated sprint skill and a new task management process definition. The sprint skill's Step 6 (Sprint Open) has been corrected to match the current task convention: TASKS.md contains only open tasks with ontology-matched headers — no completed items, no priority tags. The task management process formalizes the full task lifecycle as a standalone, anytime-invocable process.

## Rationale

SPR-031 (2026-03-24) redesigned C3PO's task management: all tasks consolidated into a single TASKS.md with headers matching the repo folder ontology, completed tasks archived to an append-only CSV (`system/log/completed-tasks.csv`), and per-agent task files retired. The sprint skill's Step 6 still referenced the old convention (checked items, priority markers). This exchange corrects that and provides the process definition so instances can adopt the same pattern.

The task management process is extracted from the sprint skill into a standalone CAO process because task operations happen at any time — not only at sprint boundaries. The sprint skill's Steps 6 and 7 invoke this process at open/close, but the Principal can request task operations mid-session.

## Contents

1. `SKILL-sprint.md` — Updated sprint skill (Step 6 corrected for new task convention); install to `.claude/skills/sprint/SKILL.md`
2. `ref-process-manage-tasks.md` — Task management process definition (reference copy); install to `agents/cao/processes/process-manage-tasks.md`

## Required Actions

- [ ] Install `SKILL-sprint.md` to `.claude/skills/sprint/SKILL.md` (overwrite existing)
- [ ] Install `ref-process-manage-tasks.md` to `agents/cao/processes/process-manage-tasks.md`
- [ ] If per-agent task files exist (`agents/cXo/cXo-tasks.md`), consolidate all open tasks into TASKS.md under ontology-matched headers (H2 = top-level folders, H3 = subfolders), then delete the per-agent files
- [ ] If TASKS.md contains completed items (`- [x]`), move them to `system/log/completed-tasks.csv` (create if needed: `completed_date,sprint_id,area,task,narrative` header) and remove from TASKS.md
- [ ] If TASKS.md contains priority tags (`— priority: high/medium/low`), strip them
- [ ] Acknowledge receipt via `/exchange write acknowledgment`
