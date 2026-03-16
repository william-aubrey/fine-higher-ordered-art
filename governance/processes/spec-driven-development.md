# Spec-Driven Development (SDD) — Process Guide

**IDEF0 Node:** A31 (Product Management) — governs the methodology for A312 (Product Definition) through A313 (Feature Roadmap), producing the specification that feeds A142 (Software Engineering).
**Authority:** C3PO enterprise standard. Applies to all subsidiary instances.
**Owner:** Principal
**Location:** `governance/processes/spec-driven-development.md`

---

**Purpose:** A step-by-step methodology for building a product specification that supports autonomous AI agent software development. The output is a modular, numbered spec suite that an agent can read sequentially and implement without ambiguity.

**Audience:** C3PO instances and their Principals working on new subsidiary products.

**Origin:** Extracted from the TCC (Trading Card Co) A312 product management sprint, March 2026. This process was developed through practice, not theory — every step below was validated by actually doing it.

---

## Philosophy

### The Core Idea

An autonomous AI agent can build software if — and only if — it has a specification that answers four questions completely:

1. **WHO** is this for and **WHY** do they want it?
2. **HOW** does each type of user interact with the product?
3. **WHAT** does the product look like, feel like, and contain?
4. **HOW** is it built — what services, APIs, data models, and infrastructure?

These four questions map to four spec documents, written in this order. Each document feeds the next. Skipping ahead produces specs that are internally inconsistent or disconnected from user reality.

### Why Order Matters

The most common mistake is starting with #4 (technical architecture) or #3 (product design). This produces software that is technically sound but doesn't serve anyone, or a product design that can't be built. The order is:

```
WHO/WHY → HOW THEY INTERACT → WHAT IT LOOKS LIKE → HOW IT'S BUILT
```

Each layer constrains and informs the next. User journeys reveal product requirements. Product design reveals architectural needs. Architecture reveals infrastructure choices. Working backward from infrastructure produces products that serve the technology, not the user.

### The Principal's Role

The Principal (human operator) is the **product authority**. The AI agent is the **specification author**. The agent proposes; the Principal decides. The agent should:

- Present options with tradeoffs, not single recommendations
- Ask focused questions that unblock decisions
- Capture decisions with rationale, not just outcomes
- Never proceed past a blocking question without the Principal's input

The Principal should:

- Make decisions when presented with options (don't defer everything)
- Share physical artifacts, prototypes, sketches, competitor examples — anything that communicates intent faster than words
- Push back when the spec feels wrong, even if they can't articulate why
- Trust the agent to handle structural and organizational concerns

---

## Phase 1: Foundation — WHO and WHY

### Goal

Produce an ICP/JTBD (Ideal Customer Profile / Jobs-to-be-Done) framework that identifies every persona who will interact with the product, what they're trying to accomplish, and why they'd choose this product over alternatives.

### Process

1. **Start with the Principal's vision.** Ask: "Who is this product for? What problem does it solve? Why would someone pay for it?" Let the Principal talk. Capture the raw vision.

2. **Identify Use Case Families.** Group the behaviors the product enables into families. A use case family is a cluster of related actions that share a context. Example: "Collecting" is a family; "buying a first card," "completing a series," and "gifting a card" are use cases within it.

3. **Define personas.** For each use case family, identify the distinct people involved. Give each a code (P-01 through P-nn) and a name. Define:
   - Who they are (demographics, knowledge level, motivation)
   - What job they're hiring the product to do (JTBD)
   - What success looks like for them
   - What phase they appear in (Phase 1 = launch, Phase 2 = growth, Phase 3 = expansion)

4. **Map personas to use cases.** Create a matrix: personas × use case families. This reveals coverage gaps (personas with no use cases) and orphan use cases (use cases with no persona).

5. **Identify open questions.** Every assumption that can't be validated from the room gets logged as an open question with an owner and resolution path. These will be resolved during later phases or through Principal decisions.

### Output

One document: `spec-v1-01-icp-jtbd.md`

### Quality Check

- Every persona has at least one JTBD
- Every JTBD has a clear success metric
- Phase assignments are realistic (not everything in Phase 1)
- Open questions have owners, not just question marks

---

## Phase 2: User Journeys — HOW They Interact

### Goal

For each persona (or logical group of personas), produce a user journey document that traces their complete interaction with the product from discovery through long-term engagement.

### Process

1. **Start with Phase 1 personas.** Don't write journeys for Phase 3 personas before Phase 1 is solid. Write journeys in priority order.

2. **For each journey, trace the full arc:**
   - How do they discover the product?
   - What is their first interaction?
   - What is the purchase/conversion flow?
   - What happens after conversion?
   - What brings them back?
   - What makes them tell someone else?

3. **Make decisions concrete.** A journey is not "user browses and buys." It's "user lands on card detail page via shared link → sees display image (public, served from Arweave) → clicks Buy → enters credit card via Stripe checkout → receives confirmation → NFT mints to custodial wallet → user sees card in collection." The level of detail should be sufficient for an engineer to implement without guessing.

4. **Identify cross-journey interactions.** Personas don't exist in isolation. A gift buyer (P-06) creates a gift recipient (P-08). A speculator (P-10) creates liquidity for a completionist (P-09). Map these interactions explicitly.

5. **Surface open questions per journey.** Each journey will reveal product decisions that haven't been made. Log them with IDs, owners, and resolution paths. Group by urgency: blocking Phase 1, pre-launch, Phase 2, Phase 3.

6. **Use prototypes and physical artifacts.** If the Principal has sketches, prototypes, competitor products, or physical examples, analyze them as part of the journey work. Extract every element — visual layers, text parameters, information architecture. These artifacts communicate design intent faster than abstract discussion.

### Output

One document per persona or persona group: `spec-v1-02a-journey-[name].md` through `spec-v1-02n-journey-[name].md`

Use letter suffixes (02a, 02b, ...) so all journeys sort together and the reading order is clear from a directory listing.

### Quality Check

- Every Phase 1 persona has a journey
- Every journey traces discovery → conversion → retention → referral
- Cross-journey interactions are mapped
- Open questions are logged with IDs and owners
- Decision points are concrete, not hand-waved

### Resolving Blocking Questions

After all journeys are written, consolidate open questions across all documents into a single tracker. Group by urgency. Work through the blocking questions with the Principal:

- Present each question with context, options, and tradeoffs
- Capture the decision and rationale
- Update the affected journey documents
- Move resolved questions to a "resolved" section with the resolution text and date

**Do not proceed to Phase 3 until all Phase 1 blocking questions are resolved.** Pre-launch and Phase 2+ questions can remain open — they don't block the spec.

---

## Phase 3: Product Design — WHAT It Looks Like

### Goal

Produce a product design specification that defines every artifact the system produces — what it looks like, what data it contains, how it's stored, and how it's accessed.

### Process

1. **Start from physical artifacts.** If the product produces tangible outputs (cards, documents, reports, images), start by examining real examples. Use image analysis to extract exact properties (dimensions, resolution, color mode, DPI). Decompose the artifact into layers, zones, and parameterized elements.

2. **Build a taxonomy.** If the product has multiple variants of its core artifact, don't design for one variant — build a taxonomy first. Ask: "What are all the different types of [artifact] this system could produce?" Map each type along dimensions:
   - What is the subject? (person, place, thing, event, concept)
   - What is the purpose? (celebrate, educate, network, commemorate, function, gift)
   - Who is the audience? (collector, student, professional, fan)

   Each combination implies a different information architecture and visual priority. **Discover the landscape before designing any single point in it.**

3. **Define the universal chassis.** Identify what's constant across ALL variants: dimensions, format, resolution, zones, constraints. These become the non-negotiable foundation. Changes to the chassis affect everything — they require the highest approval threshold.

4. **Define layout templates.** For each major visual priority class, define a template: what goes where, how much space it gets, what's required vs. optional. Use ASCII diagrams — they're unambiguous and diffable.

5. **Define parameter schemas.** For each product type, define the structured data that fills the template. Use JSON schemas. Every text element, every image zone, every data field is a named parameter with a type and constraints.

6. **Define storage and access.** Where does each output live? Who can access it? What does it cost? This is where product design meets infrastructure reality. Common pattern:
   - **Public tier:** Assets anyone can see (marketing, previews, blockchain records). Use permanent/cheap storage (Arweave, CDN).
   - **Owner tier:** Premium assets only the purchaser can access. Use auth-gated storage (S3 with signed URLs).
   - **Claim tier:** Time-limited access bridges (gift codes, transfer tokens).

7. **Define print/production specs.** If the product has a physical manifestation, research production partners and codify their requirements. Survey multiple vendors. Confirm that your digital spec produces files they can accept without modification.

### Output

One document: `spec-v1-03-[product-design-name].md`

This is typically the largest document in the spec. Use numbered sections with clear hierarchy.

### Quality Check

- Every product variant in the taxonomy has a front template + back template + parameter schema
- Physical production specs are validated against real vendor requirements
- Storage and access tiers are explicitly defined with cost implications
- ASCII diagrams are provided for every layout template
- Parameter schemas are valid JSON
- The spec accounts for all output variants (print, digital, social, thumbnail)

---

## Phase 4: Technical Architecture — HOW It's Built

### Goal

Produce a technical architecture specification that an autonomous AI agent can read and implement. This is the bridge from "what the product is" to "what the code does."

### Process

1. **Extract functional requirements from the journeys.** Each step in a user journey implies a functional requirement. "User enters credit card via Stripe checkout" → FR: Stripe payment integration. Don't invent requirements — derive them from the journeys.

2. **Map services and infrastructure.** For each functional requirement, identify:
   - What cloud service handles it (S3, SNS, Lambda, CloudFront, etc.)
   - What external integration is needed (Stripe, Arweave, blockchain RPC)
   - What data flows in and out
   - What happens on failure

3. **Define the API contract.** If the product has a frontend and backend (or multiple services), define the interface contract: endpoints, request/response schemas, authentication model, error codes. Use OpenAPI or JSON schema format — machine-readable specs are better than prose for this layer.

4. **Define the data model.** For every entity the system persists (users, products, orders, tokens), define the schema: fields, types, constraints, relationships. Specify where each entity lives (database, file system, blockchain, external service).

5. **Define the smart contract (if applicable).** For blockchain products, the smart contract is infrastructure. Define every function, event, modifier, and state variable. Include the constructor parameters, access control model, and upgrade strategy.

6. **Define deployment.** How does the system run? What's the deployment target (Lambda, EC2, ECS, local)? How is it updated? What environment variables are needed? What IAM roles are required?

7. **Define acceptance criteria.** For each functional requirement, state the conditions under which it is "done." These should be specific enough for an AI agent to write a test: "Given [precondition], when [action], then [expected result]."

### Output

One document: `spec-v1-04-technical-architecture.md`

### Quality Check

- Every user journey step maps to at least one functional requirement
- Every functional requirement maps to at least one service/component
- API contracts are complete (not "TBD" for request/response schemas)
- Data model covers every entity referenced in the product design spec
- Acceptance criteria are testable, not aspirational
- Infrastructure choices are justified (why this service, not that one)
- Security constraints from governance are addressed explicitly
- The deployment model is concrete, not "we'll figure it out later"

---

## Spec Organization

### File Naming Convention

All spec files use this pattern:

```
spec-v{version}-{number}{suffix}-{slug}.md
```

| Component | Purpose | Examples |
|---|---|---|
| `spec` | Common prefix — identifies the file as part of the spec | Always `spec` |
| `v{version}` | Spec version — increments when the spec undergoes major revision | `v1`, `v2` |
| `{number}` | Reading order — two-digit, zero-padded | `00`, `01`, `02`, `03`, `04` |
| `{suffix}` | Sub-ordering within a section — lowercase letter | `a`, `b`, `c` (for journeys) |
| `{slug}` | Human-readable description | `index`, `icp-jtbd`, `journey-collector` |

**Rule: `ls` must produce the reading order.** If someone types `ls specs/` the files appear in the order they should be read. This is non-negotiable for autonomous agent consumption.

### Index File

`spec-v1-00-index.md` serves as:
- Reading order table with links to each document
- Phase summary (what's in each release phase)
- Key decisions log (product-level decisions with dates and rationale)
- Pointers to supporting references and governance documents

### Folder Hygiene

| What goes in `specs/` | What does NOT go in `specs/` |
|---|---|
| Current, authoritative spec documents | Working drafts, analysis documents, brainstorm notes |
| The index | Open question trackers (these are process artifacts) |
| | Prototype analysis (these feed the spec, they aren't the spec) |
| | Retired/superseded documents |

Process artifacts go in `library/` (organized by work node, e.g., `library/a312/`). Retired specs go in `library/` with a supersession header. Reference materials (vendor research, templates, examples) go in `reference/`.

---

## Working with the Principal

### Decision-Making Pattern

The most effective pattern for unblocking decisions:

1. **State the question** — one sentence, specific
2. **Explain why it matters** — what does the answer affect?
3. **Present options** — 2-4 concrete choices, each with:
   - What it means
   - Pros
   - Cons
   - Your recommendation (if you have one)
4. **Ask for the call** — "What's your preference?"
5. **Capture the decision** — Record the choice, the rationale, and the date. Update every affected document.

### Prototype Analysis

Physical artifacts, mockups, and prototypes are gold. When the Principal shares one:

1. **Extract exact properties.** Use tooling (Pillow, exiftool, etc.) to get pixel dimensions, DPI, color mode, file size — don't guess from visual inspection.
2. **Decompose into layers.** Identify every visual element as a named layer. Map each layer to a pipeline stage.
3. **Parameterize text elements.** Extract every piece of text as a named parameter with type, position, font role, and example value.
4. **Identify gaps.** What does the prototype show that the current spec doesn't cover? What does the spec define that the prototype doesn't demonstrate?
5. **Write it up as an analysis document** (goes in `library/`, not `specs/`). The analysis feeds the spec — it is not the spec itself.

### When the Principal Pushes Back

If the Principal says "this doesn't feel right" but can't articulate why, don't dismiss it. Instead:

- Ask them to describe what they *do* want (even vaguely)
- Show them concrete examples of different approaches
- Offer to prototype two options so they can react to something tangible
- Treat their instinct as data — it often reveals a requirement that hasn't been articulated yet

---

## Anti-Patterns

### Things That Go Wrong

| Anti-Pattern | What Happens | How to Avoid |
|---|---|---|
| **Architecture-first** | Tech stack chosen before users are understood. Product serves the technology. | Follow the phase order: WHO → HOW → WHAT → HOW-BUILT |
| **Monolithic spec** | One 800-line document covers everything. Unmaintainable, un-navigable. | Modular files with numbered prefixes and an index |
| **Spec-as-wishlist** | Every feature for every phase in one undifferentiated list. | Phase-gate everything. Phase 1 is the minimum. |
| **Deferred decisions** | Blocking questions marked "TBD" and never revisited. Engineering starts and immediately blocks. | Consolidate questions, resolve blocking ones before proceeding to the next phase |
| **Copy-paste from conversation** | Spec text is raw conversation transcript, not synthesized. | Spec text must be written fresh — synthesized, structured, and internally consistent |
| **Missing cross-references** | Journeys reference each other but there's no way to find the connection. | Use persona codes (P-01, P-13), question IDs (ICP-OQ-04), and explicit document references |
| **Process artifacts in the spec folder** | Working trackers, brainstorm notes, and retired docs clutter the spec. | Strict folder hygiene: `specs/` for current spec only, `library/` for everything else |
| **No reading order** | Agent opens the folder and doesn't know where to start. | Numbered prefixes. `ls` = reading order. Always. |

---

## Checklist: Is the Spec Ready for Autonomous SDD?

Use this checklist before handing the spec to an autonomous agent:

### Foundation (spec-v1-01)
- [ ] Every persona has a code, name, JTBD, and phase assignment
- [ ] Use case families are defined with persona mappings
- [ ] Open questions have owners and resolution paths

### Journeys (spec-v1-02*)
- [ ] Every Phase 1 persona has a journey document
- [ ] Journeys trace the full arc: discovery → conversion → retention → referral
- [ ] Cross-journey interactions are mapped (which persona creates which)
- [ ] All Phase 1 blocking questions are resolved (zero remaining)
- [ ] Resolved questions include the decision, rationale, and date

### Product Design (spec-v1-03)
- [ ] Product taxonomy covers all variants the system produces
- [ ] Universal chassis (dimensions, format, constraints) is defined
- [ ] Layout templates have ASCII diagrams and zone allocations
- [ ] Parameter schemas are valid JSON for every product type
- [ ] Storage tiers are defined (what goes where, who can access, cost model)
- [ ] Production specs are validated against real vendor requirements
- [ ] All output variants are defined (print, digital, social, thumbnail, etc.)

### Technical Architecture (spec-v1-04)
- [ ] Every journey step maps to a functional requirement
- [ ] Every FR maps to a service/component
- [ ] API contracts are complete (endpoints, schemas, auth, errors)
- [ ] Data model covers every persisted entity
- [ ] Infrastructure choices are justified and aligned with governance constraints
- [ ] Acceptance criteria are testable per FR
- [ ] Deployment model is concrete

### Organization
- [ ] `specs/` contains only current, authoritative spec documents
- [ ] Files are numbered and `ls` produces the reading order
- [ ] Index file exists with reading order, phase summary, and key decisions log
- [ ] No process artifacts, retired docs, or working drafts in `specs/`
- [ ] All cross-references use current filenames
- [ ] CLAUDE.md (or equivalent project root guidance) points to the spec hierarchy

---

*This process was developed during the TCC A312 product management sprint (2026-03-14 to 2026-03-15). It produced a 12-file, 8,200-line spec suite covering 13 personas, 9 user journeys, 15 product types, 4 layout templates, 7 back templates, and resolved 4 blocking questions — enabling autonomous software development for Phase 1.*
