# Enterprise Model: Purpose, Viewpoint & Scope

*Constitutional document — read before all other enterprise model files*
*Author: WRA | Original framework: 2015-12-28 | Formalized: 2026-03-09*
*Standard: FIPS PUB 183 — Integration Definition for Function Modeling (IDEF0)*

---

## Model Title

**Enterprise Processes**
*Node Reference Prefix: WRA/*
*Top-level context diagram: WRA/A-0*

---

## Purpose

This model exists to produce a complete, exhaustive, MECE (Mutually Exclusive, Collectively Exhaustive) functional decomposition of The Enterprise as a closed transformation system. Its intended uses are:

1. Serve as the canonical reference architecture for an autonomous AI Agent Workforce
2. Define every atomic skill independently executable by a specialized AI agent with defined tool access and a binary Definition of Done
3. Enable any enterprise — regardless of industry, size, or technology stack — to identify the complete set of functions required for operation and assign each to the appropriate mechanism (human, software, or AI agent)
4. Provide a MECE validation mechanism: the union of all child node outputs must equal the parent node output at every level of decomposition

The model is complete when every leaf-node function has a fully specified ICOM block, a binary Definition of Done, and a named governing constraint — and when boundary arrow correspondence holds at every level.

---

## Viewpoint

**The Principal.**

This model is constructed from the perspective of the enterprise owner — the person or persons who bear ultimate fiduciary, legal, and strategic accountability for the enterprise. The Principal is the source of the Mechanism arrow at A-0 and the only entity whose judgment is explicitly preserved as non-delegatable.

### The Consequence of This Viewpoint

**Strategy is the viewpoint of this model — not a function within it.**

When the Principal examines the A-0 diagram, they are looking from the strategic vantage point: what capital shall I deploy, under what constraints, to produce what outputs? Strategic intelligence, competitive analysis, scenario planning, and M&A evaluation are not boxes in this model — they are the *lens through which the Principal reads* the model. The outputs of strategic thinking are allocation decisions, which manifest as Control and Mechanism arrows flowing into the enterprise system.

This resolves a common error in enterprise frameworks: treating "Strategy" as a co-equal function alongside Finance, Legal, or Engineering. Strategy is not a function. It is the purpose for which the model exists.

---

## Scope

### Inside the System Boundary

All functions required to transform Capital into Customer Value and Returns to Capital:
- **Governance (A1):** The rule-making, resource-allocation, and capability-building functions
- **Production (A2):** The execution of value-creating processes
- **Sales (A3):** The identification, acquisition, and retention of customers

The model covers one legal entity at the base level. Multi-entity (holding company) structures are modeled as instances of this base model, each with its own instantiation of A0 functions, connected via intercompany interface definitions in `enterprise/standards/ctrl-interface-register.md`.

### Outside the System Boundary

These elements appear as Controls or Mechanisms on the context diagram. They are not decomposed — they are obeyed.

| External Element | ICOM Role at A-0 | Description |
|---|---|---|
| Government Regulation | Control (C1) | Federal, state, and local statutory law; regulatory agency rules |
| Community Standards | Control (C2) | Social norms, cultural expectations, market conventions |
| Physics / Natural Law | Control (C3) | Physical constraints: thermodynamics, computation limits, material properties |
| Capital | Input (I1) | Financial resources deployed into the enterprise |
| Principal(s) | Mechanism (M1) | Owners/founders bearing ultimate accountability |
| Partners | Mechanism (M2) | External parties providing enabling capacity |
| Property | Mechanism (M3) | Physical and intellectual assets deployed as productive capacity |

---

## Architectural Decisions

### 1. Three Top-Level Functions, Not Nine

The enterprise has three — and only three — primary functions at A0:

- **Governance (A1):** Creates the rules, resources, and process designs that enable Production and Sales to operate
- **Production (A2):** Executes value-creating processes under Governance direction
- **Sales (A3):** Identifies customers, communicates value, converts prospects into revenue

This is not an organizational hierarchy. All employees participate in all three functions. A payroll clerk executes Governance (Finance). A software engineer executes both Governance (Engineering process design) and Production (code deployment). A founder closing a deal executes Sales.

Nine-pillar frameworks and similar flat taxonomies are category lists, not functional models. They have no causal structure — all pillars appear co-equal. This model establishes a dependency order that is structurally true: Governance precedes and constrains Production and Sales; Production enables Sales; Sales feeds back to Governance via revenue.

### 2. Governance Functions Named by Their Supreme Constraint

The four sub-functions of Governance (A1) are named for the constraint that is supreme over each:

| Node | Name | Supreme Constraint |
|---|---|---|
| A11 | Finance | Mathematical axioms: GAAP/IFRS, IRC, fiduciary law |
| A12 | Legal | Statutory law: jurisdiction-specific statutes, regulatory rules, case law |
| A13 | People | Social contract: labor law + organizational psychology + cultural norms |
| A14 | Engineering | Physical law: thermodynamics, CAP theorem, IEEE/ISO standards |

This naming is not arbitrary. It means that when a conflict arises within a function, the named constraint is the tiebreaker. Finance decisions that violate GAAP are wrong regardless of operational convenience. Engineering designs that violate physics are wrong regardless of schedule pressure. The constraint supremacy hierarchy is not negotiable.

### 3. Risk and Security are Properties of Governance — Not a Separate Function

Risk management is not a fifth Governance function. It is the *quality of constraint specification* at every ICOM node. A fully specified ICOM — with precisely named Controls — is a risk management artifact.

- Cybersecurity risk belongs to Engineering (A14)
- Regulatory compliance risk belongs to Legal (A12)
- Financial risk quantification belongs to Finance (A11)
- People / labor / culture risk belongs to People (A13)

There is no residual risk function. If a risk type cannot be assigned to an existing node, the model has an undetected gap — decompose further until the gap is closed.

### 4. Production is the Model's Variable Core

Production (A2) is intentionally the least-specified top-level function because it is the most industry-dependent. A payroll run, an automotive assembly line, a SaaS deployment pipeline, and a legal brief are all Production functions. The A2 decomposition is generated via domain sprints for each enterprise instantiation.

The universal invariants of Production across all industries:
- Receives **Process Plans** and **Financing** from Governance as Controls
- Receives **People, Property & Process** from Governance as Mechanisms
- Receives **Orders** as Input
- Produces **Products / Services** as Output to Sales

### 5. IDEF0 Applies at All Levels

ICOM (Input, Control, Output, Mechanism) specification is required at every node in the hierarchy — not only at leaf nodes. At higher levels (A0, A1), ICOM arrows are coarse and represent major data flows between functions. At leaf nodes, ICOM becomes fully specified and agent-executable. Decomposition stops at the level where the function is atomic: no further sub-functions exist, and the function can be assigned to a single agent with defined tool access.

---

*Next: [enterprise-model.md](enterprise-model.md) — canonical IDEF0 node tree*
*Then: [ctrl-decomposition-rules.md](ctrl-decomposition-rules.md) — decomposition governance*
