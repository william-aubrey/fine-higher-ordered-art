# Spec-Driven Development (SDD) — Process Guide

**IDEF0 Node:** A31 (Product Management) — governs the methodology that produces the specification feeding A142 (Software Engineering) or any execution function.
**IDEF0 Role:** Mechanism (executes the spec-building function)
**Authority:** C3PO enterprise standard. Applies to all subsidiary instances.
**Owner:** Principal
**Location:** `agents/cao/processes/spec-driven-development.md`
**Companion:** `company/process/controls/ctrl-spec-profiles.md` (domain-specific phase guidance)
**Skill:** `.claude/skills/spec/SKILL.md` (executable agent procedure)

---

**Purpose:** A methodology for building a specification suite that supports autonomous execution — by AI agents, human teams, or both. The output is a modular, numbered spec suite that someone can read sequentially and implement without ambiguity.

**Audience:** C3PO instances and their Principals working on any project type — software, construction, governance, events, or any domain with a profile in the spec profiles control document.

**Origin:** Developed through practice at TCC (Trading Card Co), March 2026. Every principle below was validated by actually doing it. The methodology produced an 11-document, 9,000+ line spec suite covering 13 personas, 9 user journeys, 15 product types, and resolved 34 blocking questions — enabling autonomous software development.

---

## Philosophy

### The Core Idea

An autonomous agent (or a disciplined human team) can execute a project if — and only if — the specification answers five questions completely:

1. **WHO** is this for and what do they need?
2. **HOW** do they interact with it?
3. **WHAT** is the thing we're making?
4. **BUILD** — how is it constructed, at execution-ready precision?
5. **SIMULATE** — have we walked through execution and found every gap?

These five phases apply to any domain. A software product, a mountain cabin, a corporate governance framework, and a music festival all follow the same arc. The domain-specific details — what "simulate" means for construction vs. software, how many documents "build" produces — are defined in the spec profiles control document.

### Why Order Matters

The most common mistake is starting with BUILD (architecture, systems, infrastructure) or WHAT (product design). This produces systems that are technically sound but don't serve anyone, or products that can't be built within constraints.

```
WHO → HOW → WHAT → BUILD → SIMULATE
                              ↑        │
                              └────────┘
                           (gaps route back)
```

Each phase constrains and informs the next:
- **WHO** reveals what interactions are needed
- **HOW** reveals what the deliverable must be
- **WHAT** reveals what must be built
- **BUILD** specifies how to construct it at execution-ready precision
- **SIMULATE** stress-tests the whole suite and routes gaps back to 1–4

Working backward from BUILD produces projects that serve the technology (or the builder, or the process) instead of the people they're for.

### The Simulation Insight

Simulation is what separates a spec that *looks* complete from one that *is* complete.

**Observation:** During TCC's spec development, a spec suite that had passed three rounds of structural review was subjected to function-level simulation — walking through each function as if writing code. The simulation discovered 30 gaps, 23 of which were dangerous (a reasonable guess by the agent would produce subtly wrong behavior). The spec *looked* complete. It was not.

**Why this happens:** Structural review asks "is everything covered?" Simulation asks "can I execute from this without guessing?" These are different questions. A section can exist, a schema can be defined, but the specific values, rules, and edge cases needed to write code (or pour concrete, or manage a crowd) might not be there.

**Two categories of gaps:**
- **Structural gaps:** Found by sprint-level simulation. Missing sections, undefined schemas, unaddressed requirements. The spec doesn't cover the topic at all.
- **Precision gaps:** Found by function-level simulation. The section exists, but the specific values needed to execute aren't there. These are the more dangerous category — they look like completeness but produce subtle errors.

**The methodology:** Simulate at two levels of granularity. Fix what you find. Simulate again. Repeat until zero dangerous gaps. This is the quality gate that makes autonomous execution trustworthy.

### The Principal's Role

The Principal (human operator) is the **product authority**. The AI agent is the **specification author**. The agent proposes; the Principal decides.

**The agent should:**
- Present options with tradeoffs, not single recommendations
- Ask focused questions that unblock decisions
- Capture decisions with rationale, not just outcomes
- Never proceed past a blocking question without the Principal's input

**The Principal should:**
- Make decisions when presented with options (don't defer everything)
- Share physical artifacts, prototypes, sketches — anything that communicates intent faster than words
- Push back when the spec feels wrong, even if they can't articulate why
- Trust the agent to handle structural and organizational concerns

---

## The Five Phases

### Phase 1: WHO

**Question:** Who is this for and what do they need?

Define every person (or entity) who will interact with the project's output. Understand their needs, motivations, and definition of success before designing anything.

**Software:** Ideal Customer Profiles, Jobs-to-be-Done, persona codes, use case families.
**Construction:** Program of requirements — occupants, lifestyle, budget, site constraints.
**Governance:** Stakeholder map — who governs, who is governed, who interfaces.
**Events:** Audience segments, performers, vendors, sponsors, regulators, neighbors.

**Key discipline:** Don't design for abstract users. Name them, code them (P-01 through P-nn), and define what success looks like for each. Phase assignments (Phase 1 = launch, Phase 2 = growth) prevent scope creep.

**Prerequisite:** None. This is always the first phase.

### Phase 2: HOW

**Question:** How do they interact with it?

For each stakeholder identified in WHO, trace their complete interaction arc. This reveals every touchpoint, decision point, and edge case from the user's perspective.

**Software:** User journey documents — discovery → conversion → retention → referral.
**Construction:** Use patterns — daily movement, adjacency needs, seasonal patterns.
**Governance:** Process flows — who initiates, executes, approves, and receives each process.
**Events:** Participant journeys — discover → arrive → experience → depart → share.

**Key discipline:** Journeys must be concrete. Not "user browses and buys" but "user lands on card detail page via shared link → sees card front with flip animation → clicks Buy → selects Digital+Print → enters credit card via Stripe embedded form → receives SMS confirmation within 10 seconds." The level of detail should be sufficient for someone to implement without guessing.

**Prerequisite:** WHO must be complete.

### Phase 3: WHAT

**Question:** What is the thing we're making?

Define the deliverable itself — what it looks like, what it contains, what variants exist, how it's stored/accessed/distributed. This is the product specification, not the implementation specification.

**Software:** Product format — dimensions, types, templates, parameter schemas, storage tiers.
**Construction:** Design criteria — floor plan, materials, structural system, aesthetics.
**Governance:** Artifact definitions — what documents/decisions/reports the system produces.
**Events:** Event format — schedule grid, zones, capacity, ticket tiers, site map.

**Key discipline:** Discover the landscape before designing any single point in it. If the product has variants (card types, room types, document types), build a taxonomy first. Each variant implies different information architecture and priorities. A taxonomy prevents designing for one variant and discovering the design breaks for others.

**Prerequisite:** WHO and HOW must be complete.

### Phase 4: BUILD

**Question:** How is it built, at execution-ready precision?

Specify how the deliverable is constructed — infrastructure, systems, procedures, and engineering details. The level of precision must be sufficient for someone to execute without guessing. This phase may produce multiple documents depending on the domain.

**Software:** Technical architecture (1–2 docs) — infrastructure, APIs, data model, deployment, acceptance criteria. Engineering spec — API schemas, error handling, test strategy.
**Construction:** Systems specs (4–7 docs) — one per trade (structural, mechanical, electrical, plumbing, envelope, finishes).
**Governance:** Operating procedures (2–3 docs) — step-by-step processes, authority framework, compliance obligations.
**Events:** Production specs (3–5 docs) — site/infrastructure, production/technical, operations, safety/compliance.

**Key discipline:** The test for completeness is "can someone execute this phase of the build without asking me a question?" If they'd need to guess, the spec is underspecified. If they'd need to ask, there's a missing decision.

**Prerequisite:** WHO, HOW, and WHAT must be complete.

### Phase 5: SIMULATE

**Question:** Have we walked through execution and found every gap?

Stress-test the spec suite by walking through it as if executing. Simulation is not optional — it is the quality gate that makes the spec trustworthy.

**Software:** Two-pass simulation — sprint-level ("can the agent plan this sprint?") then function-level ("can the agent write this function?").
**Construction:** Code compliance walk-through + construction sequence review.
**Governance:** Scenario walk-through with realistic stress cases.
**Events:** Day-of walk-through + contingency stress test.

**Key discipline:** Simulation produces a gap report, not a new spec phase. Each gap is tagged to the phase it belongs to (who, how, what, or build). Gaps are fixed by updating existing specs or creating new specs within that phase. Then simulate again. Repeat until zero dangerous gaps.

**Prerequisite:** All prior phases should be complete, though early simulation for feedback is permitted.

---

## Spec Organization

### File Naming Convention

```
spec-v{version}-{number}{suffix}-{slug}.md
```

| Component | Purpose | Examples |
|---|---|---|
| `spec` | Common prefix | Always `spec` |
| `v{version}` | Spec version — major revision | `v1`, `v2` |
| `{number}` | Reading order (two-digit) | `01`, `02`, `03` |
| `{suffix}` | Sub-ordering (lowercase letter) | `a`, `b`, `c` |
| `{slug}` | Human-readable description | `icp-jtbd`, `journey-collector` |

**Rule: `ls` must produce the reading order.**

### Versioning

The version number (`v1`, `v2`, ...) increments on a **major product pivot** — a fundamental change to who the product serves, what it is, or how it works. Within a version, specs are edited in place; simulation gaps update existing `v1` documents, not `v2`. Incrementing to `v2` means the previous spec suite is retired to `system/archive/` and a new suite is authored from scratch (though it may reference `v1` as prior art). Minor refinements, added detail, and gap fixes never trigger a version increment.

### Index File

`spec-v1-00-index.md` is the entry point. It contains:
- Reading order table with links to each document
- Phase summary (what's in each release phase, if applicable)
- Key decisions log (product-level decisions with dates and rationale)
- Pointers to supporting references and governance documents

### Folder Hygiene

| Goes in `specs/` | Does NOT go in `specs/` |
|---|---|
| Current, authoritative spec documents | Working drafts, analysis, brainstorm notes |
| The index and progress tracker | Open question trackers (process artifacts) |
| | Retired/superseded documents |
| | Reference materials |

Working drafts, prototype analysis, and exploratory code → `company/production/[product]/prototype/`. Retired specs → `system/archive/`. Reference materials → `company/process/mechanisms/`. Agent-portable research (not product-bound) → `agents/[agent]/library/`.

---

## Working with the Principal

### Decision-Making Pattern

1. **State the question** — one sentence, specific
2. **Explain why it matters** — what does the answer affect?
3. **Present options** — 2–4 concrete choices with pros, cons, and recommendation
4. **Ask for the call** — "What's your preference?"
5. **Capture the decision** — Record choice, rationale, date. Update all affected documents.

### Prototype Analysis

Physical artifacts, mockups, and prototypes are gold. When the Principal shares one:

1. Extract exact properties using tooling (dimensions, DPI, color mode)
2. Decompose into layers — every visual element as a named layer
3. Parameterize text elements — name, type, position, font role
4. Identify gaps between prototype and current spec
5. Write analysis to `company/production/[product]/prototype/` (feeds the spec but is not the spec)

### When the Principal Pushes Back

If the Principal says "this doesn't feel right" but can't articulate why:
- Ask what they *do* want, even vaguely
- Show concrete examples of different approaches
- Offer to prototype two options
- Treat their instinct as data — it often reveals an unarticulated requirement

---

## Anti-Patterns

| Anti-Pattern | What Happens | How to Avoid |
|---|---|---|
| **Build-first** | Tech/systems chosen before users are understood | Follow the phase order: WHO → HOW → WHAT → BUILD |
| **Monolithic spec** | One 800-line document covers everything | Modular files with numbered prefixes and an index |
| **Spec-as-wishlist** | Every feature for every phase in one list | Phase-gate everything. Phase 1 is the minimum. |
| **Deferred decisions** | Blocking questions marked "TBD" forever | Resolve blockers before proceeding to the next phase |
| **Copy-paste from conversation** | Spec text is raw transcript | Spec text must be synthesized, structured, internally consistent |
| **Skipping simulation** | Spec "looks" complete but has 30 gaps | Simulation is mandatory. Always. |
| **Gaps as a separate phase** | Gap specs become their own pile | Gaps route back to the phase they belong to |
| **Process artifacts in specs/** | Trackers and drafts clutter the spec folder | `specs/` for current spec only; working drafts and prototypes → `company/production/[product]/prototype/` |

---

## Case Study: Trading Card Co

TCC's spec suite was built over 8 sprints (March 14–16, 2026) following this methodology. The results:

| Metric | Result |
|---|---|
| Personas defined | 13 (P-01 through P-13) |
| User journeys written | 9 documents |
| Product types specified | 15 card types, 4 front templates, 7 back templates |
| Functional requirements | 16 FRs, 73 acceptance criteria |
| Blocking questions resolved | 34 (all before build phase) |
| Sprint-level simulation gaps | 12 found, 12 fixed |
| Function-level simulation gaps | 30 found (23 dangerous), 30 fixed |
| Module specs from simulation | 4 new documents |
| Final spec documents | 11 (+ index) |
| Total spec lines | ~9,000 |

**Key insight:** The function-level simulation discovered an entirely different category of gap than structural review. Sprint-level simulation found missing sections. Function-level simulation found underspecified values within existing sections. Both passes are necessary; neither is sufficient alone.

**What simulation caught that review missed:**
- Purchase flows with multi-system transactions (Stripe + blockchain + database) had no failure recovery specs — an agent would wrap everything in try/catch and refund, which is wrong when you can't un-mint an NFT
- Card compositing pipeline had no prompt templates — an agent would write generic prompts producing generic output
- Web design system had no color palette, typography scale, or component specs — 50+ micro-decisions left to the agent's taste

Each of these would have produced software that works but is wrong — the hardest bugs to find.

---

## Relationship to the SDLC

This process produces the **input** to the Autonomous Agent SDLC (`company/process/mechanisms/autonomous-sdlc.md`). The spec suite is the reading list for Sprint 0 and all subsequent development sprints. The SDLC consumes the spec; this process produces it.

```
SDD (this process)              →  Spec Suite                        →  SDLC (autonomous-sdlc.md)
company/process/mechanisms/        company/production/[product]/specs/   company/process/mechanisms/
spec-driven-development.md                                              autonomous-sdlc.md
```

The SDD process ends when simulation produces zero dangerous gaps. The SDLC begins with Sprint 0: project scaffold.

---

*This methodology was developed during the TCC A312 product management sprint (2026-03-14 to 2026-03-16). It was refined through 10 sprints, 3 simulation passes, and the resolution of 34 blocking questions. The five-phase model and domain profile system were designed for cross-instance reuse via the C3PO enterprise governance layer.*
