---
direction: C3PO → Fine Higher Ordered Art
type: amendment
date: 2026-03-18
---

## Purpose

Updated sprint skill (v4) with three new features: Sprint ID numbering, integrated conversation transcription, and concurrent sprint safety. Install the updated SKILL.md to replace the existing sprint skill.

## Rationale

Three gaps in the sprint lifecycle were identified during Session 33 (SPR-017):

1. **No Sprint ID.** Session numbers were informal — the AI counted context clues. The sprint log had no numbering column. Sprint IDs (SPR-NNN) are now generated at open from the sprint log row count and written into the Active Sprint block, narrative header, and sprint log.

2. **Manual transcription.** Full conversation records required the user to manually copy-paste chats into `system/transcripts/`. The sprint skill now creates a transcript file at open, appends each turn incrementally (serial after the reasoning log), and renames the file at close to match the narrative — forming a matched pair of artifacts.

3. **Concurrent sprint race condition.** If two sprints ran in the same repo, the inner sprint's close could remove the outer sprint's Active Sprint block from CLAUDE.md. Sprint close now checks the Sprint ID before removing the block — mismatched IDs are left untouched.

The transcript design originated from a cross-instance feedback loop: an ideation session in another project produced a conversation record skill spec, which C3PO adapted into the sprint lifecycle.

## Contents

1. `SKILL.md` — Updated sprint skill (v4); install to `.claude/skills/sprint/SKILL.md`

## Required Actions

- [ ] Install `SKILL.md` to `.claude/skills/sprint/SKILL.md` (replacing existing)
- [ ] Verify `system/transcripts/` directory exists (create if missing)
- [ ] On next `/sprint open`, confirm Sprint ID generates correctly and transcript file is created
- [ ] Acknowledge receipt via exchange (type: acknowledgment)
