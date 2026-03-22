# process-cao-build-process.md

**Document Type**       : Process – Meta-Protocol
**Owner**               : CAO (Chief Architecture Officer) – Shared Across All Agents
**Version**             : 2.0 (2026-03-10) – Unified Architecture Edition
**Purpose**             : Standardized, repeatable method for defining new **IDEF0-compatible process definitions** that become reusable building blocks in the OUBOROBO nervous system. Every new process must be clear, queryable, ontology-consistent, and executable by one or more agents while adhering to vault governance (`[[ctrl-vault-governance]]`). CAO owns both the process definition and the entity definitions for all I/O artifacts — no separate ontology handoff required.

**Trigger Phrases (Non-Negotiable)**
CAO will ONLY build a new process definition if the user's message begins with one of:
- `build process`
- `create process`
- `define process`

(case-insensitive). If the message does not start with one of these, treat as normal conversation — never mention process building.

**Core Rules (Non-Negotiable)**
- **File Naming**: Always `process-[verb-phrase].md` in **kebab-case** (lowercase, hyphens only)
  - Good: `process-build-process.md`, `process-lead-to-cash.md`, `process-ingest-log.md`
  - Bad: `SKILL_build_process.md`, `processBuildProcess.md`, `process_build_process.md`
- Every process file **must** include a complete IDEF0 block (Inputs, Controls, Outputs, Mechanisms)
- Every Input and Output artifact named in a process **must** have a corresponding entity definition in `enterprise/production/eaas/build/data/` — CAO creates or updates the entity file as part of the same process birth
- Maintain precise, protocol-heavy tone without unnecessary flourish
- Never invent structure or sections without explicit C3PO approval

**IDEF0 Structure Requirement (Mandatory in Every Process File)**

Every process file must contain a clearly labeled IDEF0 section with **all four elements**:

- **Inputs** — data, material, information, or signals required to start the process
- **Controls** — rules, standards, policies, constraints that govern how the process runs (usually point to `ctrl-` files)
- **Outputs** — deliverables, artifacts, updated states, or signals produced
- **Mechanisms** — agents, tools, infrastructure, people, or systems that perform or enable the process

Use this exact table format for clarity:

```markdown
### IDEF0 Definition

| Element     | Description                                                                 | Examples / References                          |
|-------------|-----------------------------------------------------------------------------|------------------------------------------------|
| Inputs      |                                                                             |                                                |
| Controls    |                                                                             | `[[ctrl-vault-governance]]`, `[[ctrl-tasking]]` |
| Outputs     |                                                                             | Updated entity definition, artifact file       |
| Mechanisms  |                                                                             | CAO-Agent, Obsidian Dataview                   |
```

**Step-by-Step Process to Build a New Process Definition**

1. **Identify the need**
   Confirm a repeatable function is missing or poorly defined. Name it using verb-first kebab-case (e.g., "ingest-per-agent-log").

2. **Define purpose & rationale**
   One-sentence purpose + one-sentence rationale tied to swarm goals (ontology freshness, velocity, sovereignty, etc.).

3. **Name the file**
   `process-[verb-phrase].md` — get C3PO confirmation if borderline.

4. **Write the IDEF0 core**
   Fill in Inputs, Controls, Outputs, Mechanisms first — this anchors everything.

5. **Verify or create entity definitions**
   For every Input and Output artifact named: check `enterprise/production/eaas/build/data/` for an existing entity definition. If missing, create `data-entity-[name].md` as part of this same step. CAO owns this — no handoff.

6. **Detail the procedure**
   Numbered steps, trigger rules, exact response formats, success criteria, examples.

7. **Add governance links**
   Reference relevant `ctrl-` files.

8. **Review & finalize**
   Present draft → C3PO approval → save as new process file.

**Success Criteria**
- Filename follows `process-[verb-phrase].md` exactly
- Full IDEF0 section present and complete
- Every I/O artifact has a corresponding entity definition in `enterprise/production/eaas/build/data/`
- Process is atomic, repeatable, and ontology-consistent
- C3PO approves final version

**Related Files**
- `[[ctrl-vault-governance]]` (naming & structure rules)
- `[[ctrl-tasking]]` (task-related process patterns)
- `enterprise/production/eaas/build/data/` (entity definitions — CAO-owned)
