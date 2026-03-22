# Migration Guide — Fine Higher Ordered Art (FHOA)

**Date:** 2026-03-22
**Migration:** Universal Skeleton v1 → v2
**Direction:** C3PO → FHOA
**Executed by:** C3PO CAO

---

## What Changed

### Structures Created

| Structure | Purpose |
|---|---|
| `agents/cao/` | CAO agent folder with context, tasks, processes/, products/ |
| `agents/cfo/` | CFO agent folder with context, tasks, processes/, products/ |
| `agents/cho/` | CHO agent folder with context, tasks, processes/, products/ |
| `agents/clo/processes/` | CLO processes subfolder (CLO folder existed) |
| `agents/clo/products/` | CLO products subfolder (CLO folder existed) |
| `agents/cmo/` | CMO agent folder with context, tasks, processes/, products/ |
| `agents/coo/` | COO agent folder with context, tasks, processes/, products/ |
| `agents/cpo/` | CPO agent folder with context, tasks, processes/, products/ |
| `agents/cro/` | CRO agent folder with context, tasks, processes/, products/ |
| `agents/cto/processes/` | CTO processes subfolder (CTO folder existed) |
| `agents/cto/products/` | CTO products subfolder (CTO folder existed) |
| `agents/librarian/` | Librarian agent folder with full product triad for library |
| `company/process/functions/` | Enterprise IDEF0 function decomposition (30 skill files) |

### Files Direct-Placed

| Count | Category | Target |
|---|---|---|
| 30 | Enterprise skill files | `company/process/functions/` |
| 6 | CAO methodologies | `agents/cao/processes/` |
| 10 | Agent context files | `agents/[cxo]/` |
| 1 | Librarian context | `agents/librarian/` |
| 1 | FIPS PUB 183 (IDEF0 standard) | `agents/librarian/products/library/build/standards/idef0/` |
| 1 | Deposits README | `agents/librarian/products/library/prototype/deposits/` |
| 1 | YouTube analysis process | `agents/librarian/processes/` |
| 1 | Exchange skill | `.claude/skills/exchange/` |
| 8 | Seed task files | `agents/[cxo]/` |

### Files NOT Modified

No existing files were modified. The migration is purely additive.

---

## Mechanisms Adjudication

| Current file | Classification | Action |
|---|---|---|
| `company/process/mechanisms/spec-driven-development.md` | C3PO methodology | **Delete** — superseded by direct-placed `agents/cao/processes/spec-driven-development.md`. The CAO processes/ copy is the canonical location under Skeleton v2. |

---

## CLO library/ Subfolder

CLO has `agents/clo/library/` containing two files:
- `fiduciary-rfp.md`
- `securities-opinion-request.md`

These are **CLO work products** (legal documents the CLO produced), not library reference items. They belong in the products/ folder by content type.

**Recommended action (FHOA decides):**

**Option A:** Move the two files to `agents/clo/products/` and remove the `library/` subfolder.

**Option B:** Rename `library/` to `products/` (it already IS the products folder by content). This requires removing the now-empty `agents/clo/products/` folder created by this migration.

Either option is valid. The migration created `agents/clo/products/` as the standard location. The `library/` subfolder was not modified or removed.

---

## Agent Task File Seeding

Task files were seeded for all agents that did not already have them. CTO already had `cto-tasks.md` — it was not overwritten.

| Agent | Task file | Status |
|---|---|---|
| CAO | `cao-tasks.md` | Seeded (new) |
| CFO | `cfo-tasks.md` | Seeded (new) |
| CHO | `cho-tasks.md` | Seeded (new) |
| CLO | `clo-tasks.md` | Seeded (new) |
| CMO | `cmo-tasks.md` | Seeded (new) |
| COO | `coo-tasks.md` | Seeded (new) |
| CPO | `cpo-tasks.md` | Seeded (new) |
| CRO | `cro-tasks.md` | Seeded (new) |
| CTO | `cto-tasks.md` | **Existing — not modified** |
| Librarian | `librarian-tasks.md` | Seeded (new) |

---

## Next Steps

1. **Delete** `company/process/mechanisms/spec-driven-development.md` (superseded)
2. **Decide** CLO library/ subfolder disposition (Option A or B above)
3. **Acknowledge** receipt via `/exchange write acknowledgment to C3PO`
4. **Instantiate agents** as needed using `agents/cao/processes/agent-instantiation-process.md` — folders are ready, agents activate when their domain has work
