# Manage Tasks — Process Guide

**IDEF0 Node:** Cross-cutting (CAO operational infrastructure)
**IDEF0 Role:** Mechanism (executes the task lifecycle function)
**Authority:** C3PO enterprise standard. CAO-owned. Applies to all repos using the sprint skill.
**Owner:** CAO
**Location:** `agents/cao/processes/process-manage-tasks.md`

---

**Purpose:** A standard for managing the project task backlog. Defines how tasks are stored, structured, completed, and archived. This process can be invoked at any time — not only at sprint open/close.

**Audience:** Any AI agent operating in a repo that uses `TASKS.md`. The sprint skill's Steps 6 and 7 invoke this process at sprint boundaries, but the Principal may request task operations at any point during a session.

---

## IDEF0 Definition

| Element | Description |
|---|---|
| **Inputs** | Principal's request (add, complete, review, reorganize tasks), session work output (discovered or completed tasks) |
| **Controls** | Repo folder ontology (determines header structure), this process definition |
| **Outputs** | Updated `TASKS.md`, appended rows in `system/log/completed-tasks.csv` |
| **Mechanisms** | CAO agent (or any active agent), MECH-DOC |

---

## TASKS.md Structure

```markdown
# Tasks

All open work across the [project] repo. Headers match the repo folder ontology.
Completed tasks are archived to `system/log/completed-tasks.csv`.

## [top-level-folder]

### [subfolder]
- [ ] Task description
```

**Rules:**
- H2 headers (`##`) = top-level repo folders (e.g., `## agents`, `## enterprise`, `## system`)
- H3 headers (`###`) = subfolders (e.g., `### cao`, `### enterprise/production`)
- Only open tasks live here. No checked items (`- [x]`), no completed sections.
- No priority tags (`— priority: high`). Task importance is conveyed by the Principal's instructions, not inline metadata.
- Task IDs (e.g., `CAO-033`, `CHO-009`) are optional. Use them when a task is referenced across sprints or in narratives.
- One task per line. Keep descriptions concise but specific enough to act on without context.

---

## Procedure

### Add a Task

1. Identify the correct ontology header. The task's location is determined by which repo folder the work affects.
2. If no matching H2/H3 header exists, create one that matches the repo folder path.
3. Add the task as `- [ ] [description]` under the correct header.

### Complete a Task

1. **Remove** the `- [ ]` line from TASKS.md entirely. Do not check it off — checked items do not belong in TASKS.md.
2. **Append** a row to `system/log/completed-tasks.csv`:
   ```
   completed_date,sprint_id,area,task,narrative
   ```
   - `completed_date`: YYYY-MM-DD
   - `sprint_id`: current sprint ID if inside a sprint, empty if not
   - `area`: the TASKS.md header path (e.g., `agents/cao`, `enterprise/production`)
   - `task`: the task text (no markdown checkbox; quote if it contains commas)
   - `narrative`: sprint narrative filename if inside a sprint, empty if not

### Review Tasks

1. Read TASKS.md. Present open tasks grouped by their headers.
2. If the Principal has checked items off in the IDE (`- [x]`), treat those as completion signals: remove them from TASKS.md and archive to CSV.

### Reorganize Tasks

1. Move tasks between headers if the ontology mapping was wrong.
2. Remove empty headers (no tasks under them) to keep the file clean.
3. Merge duplicate tasks if the same work appears under different headers.

---

## Completed Tasks Archive

`system/log/completed-tasks.csv` is the append-only archive.

**Format:**
```csv
completed_date,sprint_id,area,task,narrative
2026-03-24,SPR-031,agents/cao,"CAO-033: Reprocess legacy process files",2026-03-25-HHMM-slug.md
```

**Rules:**
- Append-only. Never edit or delete previous rows.
- One row per completed task.
- The CSV is queryable (Snowflake, pandas, Excel) and produces one-line git diffs per completion.
- If `system/log/completed-tasks.csv` doesn't exist, create it with the header row.

---

## What NOT to Do

- **Don't leave checked items in TASKS.md.** `- [x]` is a transient signal, not a record. Archive and remove.
- **Don't add priority tags.** The Principal's voice is the priority system.
- **Don't create per-agent task files.** All tasks live in the single TASKS.md. Agent ownership is encoded by the ontology header.
- **Don't batch completions.** Archive each task as it's completed, not at end of session.

---

## Relationship to Other Processes

| Process | Relationship |
|---|---|
| Sprint skill (Steps 6 + 7) | Invokes this process at sprint open (read) and close (update). This process is the authoritative reference; the sprint skill's steps are triggers. |
| Instance Instantiation Process | Creates the initial TASKS.md for new instances with getting-started tasks. |

---

*Formalized 2026-03-25 after SPR-031 established the single-TASKS.md + CSV archive convention. Extracted from sprint skill to make the process invocable at any time, not only at sprint boundaries.*
