# Spec Profiles — Domain-Specific Phase Guidance

**IDEF0 Role:** Control (governs how the `/spec` skill executes per project type)
**Authority:** C3PO enterprise standard
**Owner:** CAO-Agent (P1)
**Location:** `company/process/controls/ctrl-spec-profiles.md`

---

## Purpose

This document defines domain profiles that translate the universal 5-phase spec methodology into concrete, repeatable guidance for each project type. The `/spec` skill reads this file to determine what each phase produces, what questions to answer, and what validation looks like for the current project.

## How Profiles Work

Every project follows the same 5-phase sequence:

| Phase | Command | Question |
|---|---|---|
| 1 | `/spec who` | Who is this for and what do they need? |
| 2 | `/spec how` | How do they interact with it? |
| 3 | `/spec what` | What is the thing we're making? |
| 4 | `/spec build` | How is it built? (execution-ready precision) |
| 5 | `/spec simulate` | Walk through as if executing. Gaps route back to 1–4. |

The profile provides:
- **Phase description:** What this phase produces in this domain
- **Typical documents:** How many files and what they cover
- **Key questions:** Domain-specific prompts that guide the agent
- **Quality gate:** What must be true before proceeding to the next phase
- **Validation method:** How simulation works in this domain

---

## Profile: Software Product

**Use when:** The project builds a software application — web, mobile, API, or platform. The deliverable is running code deployed to users.

**Examples:** Trading Card Co, Fine Higher Ordered Art, SaaS products, mobile apps, developer tools.

### Phase 1 — WHO (`/spec who`)

**Produces:** Ideal Customer Profile / Jobs-to-be-Done framework

**Typical documents:** 1 file (`spec-v1-01-icp-jtbd.md`)

**Key questions:**
- Who are the distinct people who will interact with this product?
- What job is each persona hiring the product to do?
- What does success look like for each persona?
- Which personas are Phase 1 (launch) vs later phases?

**Quality gate:**
- Every persona has a code (P-01 through P-nn), name, JTBD, and phase assignment
- Use case families are defined with persona mappings
- Open questions have owners and resolution paths

### Phase 2 — HOW (`/spec how`)

**Produces:** User journey documents — one per persona or persona cluster

**Typical documents:** 4–12 files (`spec-v1-02a-journey-[name].md` through `spec-v1-02n-...`)

**Key questions:**
- How does each persona discover the product?
- What is the full arc: discovery → conversion → retention → referral?
- Where do personas interact with each other?
- What decisions must the user make at each step?

**Quality gate:**
- Every Phase 1 persona has a journey
- Cross-journey interactions are mapped
- All Phase 1 blocking questions are resolved
- Decision points are concrete (not "user browses and buys")

### Phase 3 — WHAT (`/spec what`)

**Produces:** Product format specification — what the artifact is

**Typical documents:** 1–2 files (`spec-v1-03-[product-format].md`)

**Key questions:**
- What does the product physically/digitally look like?
- What are all the variants/types?
- What data does each variant contain?
- How is it stored, accessed, and distributed?
- If physical: what are the production specs?

**Quality gate:**
- Every product variant has a defined format and parameter schema
- Storage and access tiers are defined
- Production specs validated against real vendor requirements (if physical)

### Phase 4 — BUILD (`/spec build`)

**Produces:** Technical architecture and engineering specification

**Typical documents:** 1–3 files (`spec-v1-04-technical-architecture.md`, optionally `spec-v1-05-engineering.md`)

**Key questions:**
- What cloud services and infrastructure handle each functional requirement?
- What are the API contracts (endpoints, schemas, auth, errors)?
- What is the data model for every persisted entity?
- What is the deployment model?
- What are the acceptance criteria per functional requirement?
- What is the test strategy?

**Quality gate:**
- Every journey step maps to a functional requirement
- Every FR maps to a service/component
- API contracts are complete (not "TBD")
- Acceptance criteria are testable
- Infrastructure choices are justified

### Phase 5 — SIMULATE (`/spec simulate`)

**Validation method:** Two-pass simulation

**Pass 1 — Sprint-level:** Walk through the spec as if planning development sprints. For each sprint, ask: "Does the agent know enough to start this sprint?" Finds structural gaps — missing sections, undefined schemas, unaddressed FRs.

**Pass 2 — Function-level:** Walk through the spec as if writing each function. For each function, ask: "Does the agent know enough to write this function without guessing?" Finds precision gaps — the section exists but the specific values, rules, or edge cases aren't there.

**Gap classification:**
- **Dangerous:** A reasonable guess by the agent would produce subtly wrong behavior
- **Safe:** The agent's default assumption would be correct

**Gap routing:** Each gap is tagged to the phase it belongs to (who, how, what, or build). Fix gaps by updating existing documents or creating new ones within that phase. Re-simulate after fixes until zero dangerous gaps remain.

---

## Profile: Construction

**Use when:** The project builds a physical structure — residential, commercial, or infrastructure. The deliverable is a built environment.

**Examples:** Mountain Cabin Co, residential builds, commercial renovations, infrastructure projects.

### Phase 1 — WHO (`/spec who`)

**Produces:** Program of requirements and site analysis

**Typical documents:** 1–2 files (`spec-v1-01-program-of-requirements.md`, optionally `spec-v1-02-site-analysis.md`)

**Key questions:**
- Who lives/works here? How many occupants, ages, accessibility needs?
- What lifestyle patterns drive the design (remote work, entertaining, outdoor access)?
- What is the budget and timeline?
- What are the site constraints (topography, soils, utilities, access, setbacks, orientation)?
- What is the regulatory environment (building code edition, zoning, HOA)?

**Quality gate:**
- Occupant needs are specific (not "a nice kitchen" but "kitchen with island seating for 4, gas range, pantry")
- Budget is stated with contingency percentage
- Site constraints are documented from survey, plat, or site visit
- Applicable code edition is identified (e.g., 2018 IRC, NC amendments)

### Phase 2 — HOW (`/spec how`)

**Produces:** Use patterns and spatial relationships

**Typical documents:** 1–2 files (often integrated into the program of requirements)

**Key questions:**
- How do occupants move through the space daily?
- What are the adjacency requirements (kitchen near dining, mudroom near garage)?
- What are the seasonal patterns (heating, cooling, outdoor use)?
- How do guests, deliveries, and service access work?

**Quality gate:**
- Room adjacencies are defined
- Traffic flow is described
- Seasonal use patterns are captured
- Accessibility path is defined (if applicable)

### Phase 3 — WHAT (`/spec what`)

**Produces:** Design criteria — the building's physical specification

**Typical documents:** 1–2 files (`spec-v1-03-design-criteria.md`, optionally `spec-v1-04-exterior-design.md`)

**Key questions:**
- What are the dimensions of every room?
- What structural system (timber frame, SIP, stick, steel, ICF)?
- What is the roof form and pitch?
- What are the materials for exterior and interior?
- What is the aesthetic intent?
- What are the ceiling heights, window sizes, door locations?

**Quality gate:**
- Floor plan dimensions are specified
- Structural system is chosen with rationale
- Materials palette is defined
- Ceiling heights and window rough openings are stated

### Phase 4 — BUILD (`/spec build`)

**Produces:** Systems specifications — one per trade

**Typical documents:** 4–7 files (structural, mechanical, electrical, plumbing, envelope, interior finishes, exterior finishes)

**Key questions:**
- What is the foundation type and depth?
- What are the load paths, connections, headers, and spans?
- What is the HVAC system, sizing, and ductwork layout?
- What is the electrical service, panel, circuit schedule, and lighting plan?
- What is the plumbing supply, DWV, water heater, and fixture schedule?
- What is the insulation strategy, air barrier, vapor control, and WRB?
- What are the finish materials, fixtures, and hardware?

**Quality gate:**
- Each system spec is detailed enough for a subcontractor to bid from
- Insulation R-values meet or exceed code minimums
- Electrical load calculation supports the panel sizing
- Plumbing fixture count supports DWV sizing

### Phase 5 — SIMULATE (`/spec simulate`)

**Validation method:** Code compliance walk-through + construction sequence review

**Pass 1 — Code compliance:** Walk through the applicable building code (IRC/IBC) chapter by chapter against the spec. Check: egress, fire separation, structural requirements, energy code, mechanical ventilation, plumbing fixture counts, electrical requirements. Flag every non-compliant or ambiguous item.

**Pass 2 — Construction sequence:** Walk through the build as if you are the general contractor scheduling trades. For each phase (site prep → foundation → framing → rough-in → insulation → drywall → finishes → final), ask: "Do I have enough information to execute this phase? What's missing?"

**Gap routing:** Code violations route to the relevant system spec (build). Missing sequence information routes to build or what. Re-review after fixes.

---

## Profile: Business / Governance

**Use when:** The project establishes or documents a business entity, operating system, or governance framework. The deliverable is documented procedures, authority structures, and process definitions — not software or physical structures.

**Examples:** C3PO operating system, Ouborobo holding company, corporate governance frameworks, compliance programs.

### Phase 1 — WHO (`/spec who`)

**Produces:** Stakeholder map — who governs, who is governed, who interfaces

**Typical documents:** 1 file (`spec-v1-01-stakeholder-map.md`)

**Key questions:**
- Who are the actors in this system (people, agents, entities, external parties)?
- What is each actor's authority and scope?
- What are the reporting and accountability relationships?
- What external parties interface with this system (regulators, partners, vendors)?

**Quality gate:**
- Every actor has a defined role and authority boundary
- Reporting relationships are explicit
- External interfaces are identified

### Phase 2 — HOW (`/spec how`)

**Produces:** Process flows — how actors interact with the system and each other

**Typical documents:** 2–5 files (`spec-v1-02a-flow-[name].md`)

**Key questions:**
- What are the recurring processes this system executes?
- Who initiates, executes, approves, and receives each process?
- What triggers each process?
- What are the decision points and escalation paths?

**Quality gate:**
- Every process has a trigger, executor, approver, and output
- Escalation paths are defined for every decision point
- Process frequencies are stated (daily, weekly, per-event)

### Phase 3 — WHAT (`/spec what`)

**Produces:** Artifact definitions — what the system produces

**Typical documents:** 1–2 files (`spec-v1-03-artifact-definitions.md`)

**Key questions:**
- What documents, decisions, reports, or deliverables does this system produce?
- What is the format and structure of each artifact?
- Where are artifacts stored and who can access them?
- What is the versioning and retention policy?

**Quality gate:**
- Every artifact has a defined format, owner, and storage location
- Versioning rules are stated
- Retention policy is defined

### Phase 4 — BUILD (`/spec build`)

**Produces:** Operating procedures and authority framework

**Typical documents:** 2–3 files (`spec-v1-04-operating-procedures.md`, `spec-v1-05-authority-framework.md`)

**Key questions:**
- Step-by-step: how does each process execute?
- What tools and systems support each process?
- What are the approval gates and who holds authority at each?
- What is the escalation protocol when authority is ambiguous?
- What compliance obligations constrain operations?

**Quality gate:**
- Procedures are detailed enough for an agent or new employee to execute without guessing
- Authority is unambiguous at every decision point
- Compliance obligations cite specific regulations or standards

### Phase 5 — SIMULATE (`/spec simulate`)

**Validation method:** Scenario walk-through

Walk through realistic scenarios that stress-test the system:
- A new entity is onboarded
- Two actors disagree on a decision
- A compliance violation is discovered
- The Principal is unavailable for 2 weeks
- An external party makes an unexpected demand

For each scenario, ask: "Does the spec tell me exactly what to do? Where does it leave me guessing?"

**Gap routing:** Ambiguities route to the relevant phase (authority gaps → build, missing stakeholder → who, undefined process → how). Re-simulate after fixes.

---

## Profile: Events

**Use when:** The project plans and executes a live event — festival, conference, exhibition, or ceremony. The deliverable is a produced experience.

**Examples:** Music festivals, trade shows, corporate events, community gatherings.

### Phase 1 — WHO (`/spec who`)

**Produces:** Audience and stakeholder map

**Typical documents:** 1 file (`spec-v1-01-audiences-and-stakeholders.md`)

**Key questions:**
- Who attends and what segments exist (age, interest, ticket tier)?
- Who performs, presents, or exhibits?
- Who provides services (food, merchandise, production)?
- Who sponsors and what do they expect?
- Who regulates (fire marshal, health dept, police, ABC)?
- Who is affected (neighbors, local businesses)?

**Quality gate:**
- Every stakeholder group has defined needs and expectations
- Capacity targets are stated per segment
- Regulatory contacts are identified

### Phase 2 — HOW (`/spec how`)

**Produces:** Participant journeys — one per stakeholder type

**Typical documents:** 3–5 files (`spec-v1-02a-journey-attendee.md`, etc.)

**Key questions:**
- How does each participant discover, arrive, experience, and depart?
- What is the performer/vendor load-in, execute, settle-out arc?
- How do sponsors activate and measure their investment?
- What communication channels reach each group (before, during, after)?

**Quality gate:**
- Every stakeholder type has a complete journey
- Arrival and departure flows handle peak load
- Communication plan covers pre-event, day-of, and post-event

### Phase 3 — WHAT (`/spec what`)

**Produces:** Event format specification

**Typical documents:** 1–2 files (`spec-v1-03-event-format.md`)

**Key questions:**
- What is the schedule grid (stages × time slots)?
- What are the zones and their capacity?
- What ticket tiers exist and what do they include?
- What is the site map (stages, vendor areas, facilities, parking, medical)?
- What is the visual identity and signage plan?

**Quality gate:**
- Schedule grid is complete with all slots filled or marked TBD
- Zone capacities are stated and sum to total site capacity
- Ticket tiers are defined with pricing and access levels
- Site map accounts for all infrastructure (power, water, fencing, ADA)

### Phase 4 — BUILD (`/spec build`)

**Produces:** Production specifications — one per operational domain

**Typical documents:** 3–5 files (site/infrastructure, production/technical, operations/logistics, safety/compliance)

**Key questions:**
- What is the power distribution plan (generator sizing, drop locations)?
- What is the sound, lighting, and staging spec per venue?
- What is the ticketing/access control system?
- What is the food service plan (vendors, health permits, water)?
- What is the crowd management plan (capacity monitoring, flow, barriers)?
- What is the weather contingency plan?
- What are the emergency procedures (medical, evacuation, severe weather)?

**Quality gate:**
- Production specs are detailed enough for a production company to bid from
- Safety plan meets local fire marshal and health department requirements
- Weather contingency has specific trigger points and actions
- Emergency procedures have clear chain of command

### Phase 5 — SIMULATE (`/spec simulate`)

**Validation method:** Day-of walk-through + contingency stress test

**Pass 1 — Day-of walk-through:** Walk through the event hour by hour from gates-open to load-out. For each hour, ask: "Do I know what's happening on every stage, at every gate, in every vendor area? What decisions would I need to make that the spec doesn't answer?"

**Pass 2 — Contingency stress test:** Walk through failure scenarios: headliner cancels 2 hours before set, thunderstorm warning issued, medical emergency in the crowd, power failure to main stage, ticket system goes down. For each, ask: "Does the spec tell me exactly what to do?"

**Gap routing:** Gaps route to the relevant build spec or event format. Re-simulate after fixes.

---

## Adding New Profiles

When a project type doesn't fit any existing profile:

1. **Check if an existing profile is close enough.** A corporate training program might use the Events profile with minor adaptation. A data pipeline might use the Software profile.

2. **If genuinely new,** author a new profile section following the same structure: one entry per phase (who, how, what, build, simulate) with description, typical documents, key questions, quality gate, and validation method.

3. **Propose upstream.** New profiles should be proposed to C3PO via exchange so they're available to all instances. Include the project that motivated the profile as a case study.

---

*This document is a Control in the IDEF0 sense — it governs how the `/spec` mechanism executes without performing the work itself. Changes require CAO approval and distribution via exchange protocol.*
