# agents/librarian/products/library/prototype/deposits/ — Research Session Staging Area

This folder is the intake queue for Research sessions. Files placed here are **staged**, not canonical.

---

## Convention

| Rule | Detail |
|---|---|
| **Who writes here** | Research sessions only (`/session-start research`) |
| **Who reads here** | Sprint sessions — reviewed at start of each sprint run |
| **Who places files** | Librarian — during processing, Librarian adjudicates shelf placement per shelf specs |
| **Canonical folders** | `enterprise/`, `agents/`, `system/`, `instances/` — Research sessions do not write there |

---

## Folder Naming

Each Research session gets its own subfolder:

```
agents/librarian/products/library/prototype/deposits/YYYY-MM-DD-hhmm-[topic]/
```

Examples:
- `agents/librarian/products/library/prototype/deposits/2026-03-13-1430-tcc-srs/`
- `agents/librarian/products/library/prototype/deposits/2026-03-14-0900-a14-research/`

The topic slug comes from the `/session-start research [topic]` argument.

---

## Lifecycle of a Deposited File

1. **Research session** generates a draft and writes it to `agents/librarian/products/library/prototype/deposits/[timestamp-topic]/[file].md`
2. **session-close research** lists the file in the Staged Outputs table
3. **Next Sprint session-start** surfaces the deposit in the "Parallel Research Since Last Sprint" section
4. **Sprint execution** reviews the deposit and either:
   - Pulls it into a canonical location (with any required reformatting)
   - Leaves it in deposits/ with a note explaining why it's not yet placed
   - Discards it (documents the reason in the sprint log)
5. Once placed or discarded, the deposit subfolder may be archived or deleted

---

## What Belongs Here

- Draft skill files, process files, or data entity files not yet formally sprinted
- SRS drafts, instance design documents, exploratory frameworks
- Research notes, question-answer records, design options documents
- Any file a Research session produced that needs Principal or CAO review before becoming canonical

## What Does NOT Belong Here

- Files intended to be canonical immediately — those go directly into the sprint workflow
- Temporary scratch work with no downstream value — discard those, don't deposit them

---

*This folder is git-tracked. Empty subfolders are not committed — add a file to a subfolder to persist it.*
