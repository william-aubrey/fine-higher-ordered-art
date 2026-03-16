---
name: spec
description: Specification lifecycle — build a spec suite for any project through 5 phases (who, how, what, build, simulate). Tracks progress across sessions.
argument-hint: <who | how | what | build | simulate | start | next | plan | status>
user-invocable: true
---

# /spec

Universal specification lifecycle for any project. Produces a modular spec suite in `specs/` through 5 phases.

## Step 0: Modifier Detection

Parse the first argument after `/spec`. Branch accordingly.

| Argument | Branch |
|---|---|
| `start` | Initialize a new spec suite |
| `who` | Phase 1: Stakeholders |
| `how` | Phase 2: Interactions |
| `what` | Phase 3: Deliverable |
| `build` | Phase 4: Implementation |
| `simulate` | Phase 5: Validation |
| `next` | Execute the next incomplete phase |
| `plan` | View or revise the spec plan |
| `status` | Show progress dashboard |
| *(missing)* | Show status + help (same as `status`) |

---

## Conventions

| Item | Path | Purpose |
|---|---|---|
| Spec documents | `specs/spec-v1-*.md` | The deliverable — numbered spec files |
| Spec index | `specs/spec-v1-00-index.md` | Reading order + status |
| Progress tracker | `specs/spec-progress.md` | Phase completion, gap tracking |
| Spec profiles | `governance/controls/ctrl-spec-profiles.md` | Domain-specific phase guidance |

---

## Timestamp Rule

**Every timestamp MUST come from the shell.** Never guess, never use UTC.

Primary (Windows):
```
powershell -Command "Get-Date -Format 'yyyy-MM-dd'"
```

Fallback (Mac/Linux):
```
date +%Y-%m-%d
```

---

## Branch: Start

**Purpose:** Initialize the spec suite for a new project. Run once per project.

### Procedure

1. **Check for existing spec suite.** If `specs/spec-progress.md` exists, report: "Spec suite already initialized. Run `/spec status` to see progress, or `/spec plan` to revise." Stop.

2. **Read project context.** Read `CLAUDE.md` and any README, SRS seed, or governance documents at the project root. Understand what this project is.

3. **Determine the project profile.** Read `governance/controls/ctrl-spec-profiles.md`. Based on the project context, select the matching profile (software, construction, governance, events). If uncertain, present the options and ask the Principal:

   > What type of project is this?
   > - **software** — Web, mobile, API, or platform. Deliverable is running code.
   > - **construction** — Physical structure. Deliverable is a built environment.
   > - **governance** — Business entity or operating system. Deliverable is documented procedures.
   > - **events** — Live event. Deliverable is a produced experience.
   > - **other** — I'll propose a custom spec plan based on your project.

4. **Gather project thesis.** If not already clear from project context, ask:

   > In 1–3 sentences, what is this project and what does it produce?

5. **Propose the spec plan.** Using the selected profile, generate a concrete list of spec documents the project will need, mapped to the 5 phases. Include:
   - Phase assignment for each document
   - Proposed filename following the `spec-v1-{nn}-{slug}.md` convention
   - One-line description of each document's purpose
   - Dependencies between phases

   Present the plan and ask: "Does this plan look right? I can add, remove, or rename documents before we start."

6. **Write the progress tracker.** After Principal approval, create `specs/spec-progress.md`:

   ```markdown
   # Spec Progress

   **Project:** [project name]
   **Profile:** [selected profile]
   **Thesis:** [1–3 sentence project thesis]
   **Initialized:** [date from shell]

   ## Plan

   | Phase | # | Document | Status | Date |
   |---|---|---|---|---|
   | who | 01 | `spec-v1-01-[slug].md` | pending | — |
   | how | 02a | `spec-v1-02a-[slug].md` | pending | — |
   | ... | ... | ... | ... | ... |

   ## Simulation Log

   | Pass | Date | Gaps Found | Dangerous | Status |
   |---|---|---|---|---|
   | *(empty until simulate is run)* | | | | |

   ## Gap Tracker

   | # | Gap | Severity | Phase | Document | Status |
   |---|---|---|---|---|---|
   | *(empty until simulate is run)* | | | | | |
   ```

7. **Create the spec index.** Create `specs/spec-v1-00-index.md` with the planned document list, reading order, and empty sections for key decisions and supporting references.

8. **Create `specs/` folder** if it doesn't exist.

9. **Report:**

   ```
   Spec suite initialized.
     Profile: [profile]
     Documents planned: [count]
     Next phase: who

   Run /spec who to begin.
   ```

10. **Stop.** Do not begin writing specs.

---

## Branch: Phase Execution (who, how, what, build)

**Purpose:** Execute a spec phase — read prerequisites, apply profile guidance, write the spec document(s).

### Procedure

1. **Read the progress tracker** (`specs/spec-progress.md`). Verify this phase's prerequisites are met:
   - `who` — no prerequisites (first phase)
   - `how` — `who` must be complete
   - `what` — `who` and `how` must be complete
   - `build` — `who`, `how`, and `what` must be complete

   If prerequisites are not met, report which phases are missing and stop.

2. **Check for simulation gaps.** If `spec-progress.md` has gaps tagged to this phase from a prior simulation, list them prominently:

   > This phase has [N] gaps from simulation to address:
   > 1. [gap description] — [severity]
   > 2. ...
   >
   > Address these gaps while working on this phase.

3. **Read the profile.** Open `governance/controls/ctrl-spec-profiles.md` and read the guidance for this phase under the project's profile. Note:
   - What this phase produces
   - Typical document count
   - Key questions to answer
   - Quality gate criteria

4. **Read prior phase outputs.** Read all completed spec documents from earlier phases. These are the inputs to this phase.

5. **Read existing documents.** If spec documents for this phase already exist (re-entry after simulation), read them to understand current state before modifying.

6. **Execute the phase.** Work with the Principal to produce the spec document(s). Follow the profile's key questions as a guide but adapt to the project's specific needs. The profile provides guardrails, not scripts.

   During execution:
   - Present options with tradeoffs for decisions
   - Capture decisions with rationale
   - Log open questions with IDs and owners
   - Never proceed past a blocking question without Principal input

7. **Quality gate check.** When the phase feels complete, review against the profile's quality gate criteria. Report pass/fail for each criterion.

8. **Update the progress tracker.** Mark documents as complete in `specs/spec-progress.md` with the current date.

9. **Update the spec index.** Add or update entries in `specs/spec-v1-00-index.md`.

10. **Report:**

    ```
    Phase [name] complete.
      Documents written: [count] ([filenames])
      Open questions: [count]
      Quality gate: [pass/fail summary]
      Next phase: [next incomplete phase]

    Run /spec [next] to continue, or /spec simulate when ready to validate.
    ```

---

## Branch: Simulate

**Purpose:** Stress-test the spec suite by walking through it as if executing. Produce a gap report that routes fixes back to phases 1–4.

### Procedure

1. **Read the progress tracker.** Verify that at least phases 1–4 are complete (or that the Principal explicitly wants to simulate an incomplete suite for early feedback). If incomplete, warn and ask for confirmation.

2. **Read the profile's simulation method.** Open `governance/controls/ctrl-spec-profiles.md` and read the Phase 5 section for this project's profile. Note the validation method and pass structure.

3. **Read the full spec suite.** Read every spec document in order. Build a complete mental model of the project.

4. **Execute simulation passes.** Follow the profile's validation method. For each pass:

   **Software — Pass 1 (Sprint-level):**
   Walk through the spec as if planning development sprints. For each logical sprint, ask: "Does the agent know enough to start this sprint?" Record every question the spec doesn't answer.

   **Software — Pass 2 (Function-level):**
   Walk through the spec as if writing each function. For each function, ask: "Does the agent know enough to write this function without guessing?" Record every assumption the agent would need to make.

   **Construction — Pass 1 (Code compliance):**
   Walk through the applicable building code chapter by chapter. Flag non-compliant or ambiguous items.

   **Construction — Pass 2 (Construction sequence):**
   Walk through the build phase by phase. For each trade, ask: "Do I have enough information to execute?"

   **Governance — Scenario walk-through:**
   Walk through realistic stress scenarios. For each, ask: "Does the spec tell me what to do?"

   **Events — Pass 1 (Day-of) + Pass 2 (Contingency):**
   Walk through hour by hour, then walk through failure scenarios.

5. **Classify gaps.** For each gap found:
   - **Description:** What specific information is missing?
   - **Severity:** Dangerous (wrong guess likely) or Safe (default assumption OK)
   - **Phase:** Which phase does this gap belong to? (who, how, what, or build)
   - **Document:** Which existing spec document should be updated, or is a new document needed?

6. **Update the progress tracker.** Write gaps to the Gap Tracker table in `specs/spec-progress.md`. Log the simulation pass in the Simulation Log.

7. **Report:**

   ```
   Simulation complete — Pass [N]
     Total gaps: [count]
     Dangerous: [count]
     Safe: [count]

   Gaps by phase:
     who:   [count] gaps
     how:   [count] gaps
     what:  [count] gaps
     build: [count] gaps

   [If dangerous > 0:]
   Address dangerous gaps before proceeding to implementation.
   Run /spec [phase] to fix gaps in that phase, then /spec simulate to re-validate.

   [If dangerous == 0:]
   Spec suite validated. Zero dangerous gaps.
   Ready for implementation.
   ```

8. **If zero dangerous gaps,** mark the simulate phase as complete in `specs/spec-progress.md`.

---

## Branch: Next

**Purpose:** Determine and execute the next incomplete phase.

### Procedure

1. Read `specs/spec-progress.md`.
2. Find the first phase that is not complete, in order: who → how → what → build → simulate.
3. If all phases are complete, report: "Spec suite complete. All phases validated."
4. If a phase is found, execute it (branch to the corresponding phase procedure).

---

## Branch: Plan

**Purpose:** View or revise the spec plan.

### Procedure

1. Read `specs/spec-progress.md`.
2. Display the full plan table with current status.
3. Ask: "Would you like to add, remove, rename, or reorder any documents?"
4. If changes are requested, update `specs/spec-progress.md` and `specs/spec-v1-00-index.md`.

---

## Branch: Status

**Purpose:** Show current progress. Also the default when `/spec` is invoked with no arguments.

### Procedure

1. **Check for spec suite.** If `specs/spec-progress.md` does not exist:

   ```
   No spec suite initialized.

   /spec start          Initialize a new spec suite
   /spec who            Phase 1: Who is this for?
   /spec how            Phase 2: How do they interact?
   /spec what           Phase 3: What are we making?
   /spec build          Phase 4: How is it built?
   /spec simulate       Phase 5: Validate the spec suite
   /spec next           Execute the next incomplete phase
   /spec plan           View or revise the spec plan
   /spec status         Show this dashboard

   Run /spec start to begin.
   ```

2. **If spec suite exists,** read `specs/spec-progress.md` and display:

   ```
   # Spec Status — [Project Name]

   **Profile:** [profile]
   **Initialized:** [date]

   ## Phase Progress
   | Phase | Status | Documents |
   |---|---|---|
   | who | [complete/in progress/pending] | [count] |
   | how | [complete/in progress/pending] | [count] |
   | what | [complete/in progress/pending] | [count] |
   | build | [complete/in progress/pending] | [count] |
   | simulate | [complete/pending/N gaps remaining] | — |

   ## Simulation
   [Last simulation date, gaps found, dangerous count, or "Not yet run"]

   ## Outstanding Gaps
   [List any unresolved gaps from simulation, grouped by phase]

   ## Next Action
   > [Recommended next step]

   ---
   Commands: /spec [who|how|what|build|simulate|next|plan]
   ```

---

## File Naming Convention

All spec files use this pattern:

```
spec-v{version}-{number}{suffix}-{slug}.md
```

| Component | Purpose | Examples |
|---|---|---|
| `spec` | Common prefix | Always `spec` |
| `v{version}` | Spec version | `v1`, `v2` |
| `{number}` | Reading order (two-digit, zero-padded) | `01`, `02`, `03` |
| `{suffix}` | Sub-ordering (lowercase letter) | `a`, `b`, `c` |
| `{slug}` | Human-readable description | `icp-jtbd`, `journey-collector` |

**Rule: `ls` must produce the reading order.** If someone types `ls specs/` the files appear in the order they should be read.

---

## Quality Standards

- **Profile guides, agent adapts.** The profile provides key questions and quality gates. The agent applies them to the specific project context. Don't mechanically answer a checklist — reason about what this project needs.
- **Decisions need rationale.** Every decision captured in the spec must include why, not just what. Rationale is what lets a future reader (or agent) understand trade-offs.
- **Open questions block or don't.** Every open question must be classified: blocking (prevents the next phase) or non-blocking (can be resolved later). Never proceed past a blocker.
- **Simulation is not optional.** Every spec suite must be simulated before it's considered ready for execution. Skipping simulation is how subtle-but-wrong specs reach implementation.
- **Gaps route to phases, not to new "gap phases."** Simulation findings are addressed by updating existing specs or creating new specs within the appropriate phase. There is no separate "gaps" phase.
- **The Principal directs.** The agent proposes, the Principal decides. Never proceed past a decision point without Principal input. Present options with tradeoffs, not single recommendations.
- **Spec folder hygiene.** `specs/` contains only current, authoritative spec documents. Working drafts, analysis docs, and retired specs go in `library/`. Process artifacts go in `library/`. Reference materials go in `reference/`.

---

## Working with Existing Spec Suites

If a project already has spec documents but no `spec-progress.md` (predates the skill):

1. Run `/spec start`. The skill will detect existing `specs/` files.
2. During initialization, map existing documents to phases.
3. Mark completed phases based on what exists.
4. The Principal confirms the mapping.
5. Continue from the first incomplete phase.

---

## Relationship to Other Skills

- **`/sprint`** manages the session (this chat). `/spec` manages the specification lifecycle (multi-session). They are complementary — a typical sprint opens, does spec work via `/spec [phase]`, then closes. The sprint narrative captures what happened; the spec progress tracker captures where the spec suite stands.
- **`/exchange`** delivers governance documents between C3PO and instances. The spec profiles control document and SDD process guide are delivered via exchange. Spec documents themselves are instance-owned (Layer 2) and don't flow through exchange unless they affect governance.
