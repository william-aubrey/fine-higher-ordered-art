# Decomposition Rules — Enterprise IDEF0 Model

*Constitutional governance document*
*Author: WRA | Created: 2026-03-09*
*Standard: FIPS PUB 183 — Integration Definition for Function Modeling (IDEF0)*

---

## Purpose

This document encodes the rules governing decomposition of the Enterprise IDEF0 model. Every domain sprint, skill file, and process definition produced under this framework must comply with these rules. Rules marked **[FIPS]** derive directly from the IDEF0 federal standard. Rules marked **[WRA]** are WRA-specific extensions.

---

## Rule Set 1: Structural Rules

**[FIPS] R1.1 — Box Count**
A non-context diagram shall contain a minimum of 3 and a maximum of 6 boxes. If a decomposition naturally yields more than 6 sub-functions, cluster related sub-functions until the count is within bounds.

**[FIPS] R1.2 — Box Naming**
Every box name shall be an active verb phrase. Box names shall not consist solely of the words: function, activity, process, input, output, control, or mechanism.

**[WRA] R1.2a — Active Verb Phrase Requirement (Anti-Gerund)**
Gerunds (e.g., "Payroll Computation," "Benefits Enrollment") and noun phrases (e.g., "Periodic Tax Filings," "Equity Administration") are NOT valid box names. A valid active verb phrase consists of an action verb followed by a direct object.

*Valid examples:*
- "Compute Employee Payroll and Withholdings"
- "Administer Health Benefits and Pre-Tax Accounts"
- "File Periodic Payroll Tax Returns"
- "Maintain Cap Table and Monitor SEC Compliance"

*Invalid examples:*
- "Payroll Computation" *(gerund — fails R1.2a)*
- "Benefits Enrollment" *(gerund — fails R1.2a)*
- "Periodic Tax Filings" *(noun phrase — fails R1.2a)*
- "Equity Plan Administration" *(noun phrase — fails R1.2a)*

**Audit note:** This rule is checked at sprint time. A box name that passes R1.2 (active verb phrase) but uses a gerund root fails R1.2a and must be renamed before the sprint output is accepted.

**[FIPS] R1.3 — Minimum Arrows**
Every box shall have at least one Control arrow and at least one Output arrow. Input and Mechanism arrows are optional at any level but become mandatory at leaf level if the function requires them.

**[FIPS] R1.4 — Boundary Arrow Correspondence**
Every boundary arrow on a child diagram shall correspond to an arrow connecting to its parent box, except for tunneled arrows. The union of child outputs must equal the parent output. This is the primary MECE validation mechanism.

**[FIPS] R1.5 — Node Numbering**
Node numbers are formed by appending the box number to the parent diagram number. The A-0 context box is A0. Its children are A1, A2, A3. Children of A1 are A11, A12, A13, A14. Children of A11 are A111, A112, etc.

**[FIPS] R1.6 — Feedback Arrows**
Control feedbacks shall be drawn "up and over." Input feedbacks shall be drawn "down and under."

---

## Rule Set 2: ICOM Quality Rules

**[WRA] R2.1 — Control Must Name a Specific Constraint**
The Control (C) field of every node must reference a specific named law, standard, mathematical formula, algorithm, or decision rule. General concepts (e.g., "best practices," "company policy," "industry norms") are not valid Controls. If you cannot name the constraint, the decomposition is incomplete.

*Valid examples:*
- IRC §3402 (federal income tax withholding)
- GAAP ASC 606 (revenue recognition)
- CAP theorem (distributed system design tradeoff)
- NACHA Operating Rules (ACH file format)

*Invalid examples:*
- "Best practices"
- "Company policy"
- "Industry standards"
- "Regulatory requirements"

**[WRA] R2.2 — Mechanism Must Name a Tool Category**
The Mechanism (M) field must name a specific tool category, API type, software system, or computational resource. "Software" alone is not a valid Mechanism.

*Valid examples:*
- Payroll Processor API (e.g., ADP Workforce Now, Gusto, Paychex Flex)
- HRIS Platform (e.g., Workday, BambooHR)
- LLM API (e.g., Anthropic Claude API)
- NACHA ACH Origination Gateway

*Invalid examples:*
- "Software"
- "Computer"
- "System"
- "Tool"

**[WRA] R2.3 — Output Must Be a Specific Artifact**
The Output (O) of any node must name a specific artifact, data object, document, or verifiable state change. Abstract outputs are not acceptable.

*Valid:* "Signed payroll journal entry file (GL format)" | "IRS Form 941 submitted to EFTPS" | "NACHA ACH file transmitted to originating bank"
*Invalid:* "Payroll completed" | "Employees paid" | "Financial records updated"

**[WRA] R2.4 — ICOM at All Levels**
ICOM must be specified at every node, not only at leaf nodes. At higher levels, ICOM is coarse (pipeline-level). At leaf nodes, ICOM is fully specified (field-level). Decomposition does not stop until full ICOM specification is possible.

---

## Rule Set 3: Atomicity and Leaf Node Rules

**[WRA] R3.1 — Definition of Atomic**
A node is atomic (a leaf node) when it cannot be decomposed into two or more independently executable sub-functions. If two agents could execute sub-parts of a function concurrently with different inputs, the function is not yet atomic.

**[WRA] R3.2 — Agent Executability**
Every leaf node must be executable by a single specialized AI agent with:
- Defined tool access (named in Mechanism)
- A binary Definition of Done (true/false evaluable)
- A governing constraint (named in Control)

If a leaf node requires unreplicable human judgment, decompose it until the judgment becomes a computable decision rule OR until it reduces to a human-approval gate. A human-approval gate is itself a valid atomic skill: "Escalate to Principal with decision package containing [specific fields]."

**[WRA] R3.3 — Definition of Done**
Every leaf node Definition of Done must be a single binary condition. It must be true/false evaluable — not qualitative.

*Valid:* "IRS EFTPS returns transaction confirmation code" | "GL debit total equals GL credit total to $0.00 variance"
*Invalid:* "High quality output produced" | "Comprehensive review completed" | "Thorough analysis done"

**[WRA] R3.4 — Banned Verbs**
The following words are prohibited in leaf node skill definitions unless immediately followed by a specific measurable action:
- manage, oversee, handle, support, facilitate, ensure, coordinate, maintain

---

## Rule Set 4: Cross-Function Interface Rules

**[WRA] R4.1 — Interface Registration**
Any arrow that crosses a function boundary at A0 or A1 (i.e., connects boxes in different Governance sub-functions, or connects Governance to Production or Sales) must have a corresponding entry in `enterprise/standards/ctrl-interface-register.md`.

**[WRA] R4.2 — CROSS-FUNCTION Notation**
Skills that span multiple functions shall be tagged: `[CROSS-FUNCTION: A1x → A2]` where the first node OWNS the skill (accountable for execution) and the second node CONSUMES the output (accountable for triggering the next step). The handoff artifact is the Output that transfers between functions.

**[WRA] R4.3 — Ownership Assignment**
Each skill is owned by exactly one function node. A skill may produce outputs consumed by multiple functions, but it has one owner. Dual ownership is a decomposition error — split the skill.

---

## Rule Set 5: Multi-Entity Rules

**[WRA] R5.1 — Universal vs. Instance**
Files in `enterprise/model/` and `enterprise/standards/` are universal — they apply to all enterprise instances. Files in `enterprise/registry/` are universal skill definitions. Entity-specific instantiation (which payroll processor, which tax jurisdictions, which GL chart of accounts) lives in entity instance files, not in the registry.

**[WRA] R5.2 — Intercompany Interface**
Functions that operate across legal entity boundaries (intercompany elimination, transfer pricing, shared services) are tagged `[INTERCOMPANY: EntityA → EntityB]` and must reference the intercompany interface definition in `ctrl-interface-register.md`.

**[WRA] R5.3 — Instance Boundary Authority**
C3PO defines the A-0 context diagram (boundary arrows) for each enterprise instance. The instance owns its internal decomposition from A0 downward. C3PO authority over instances is expressed exclusively through:

- **Control arrows** — non-negotiable constraints, approval gates, compliance rules
- **Interface definitions** — IC-XXX boundary contracts (data formats, triggers, acceptance criteria)
- **Required Outputs** — what the instance must produce (products, returns to capital)
- **Provided Mechanisms** — shared resources the parent supplies (AI workforce, CXO agents)

C3PO does not dictate internal decomposition, product specification, or implementation architecture. These are Layer 2 concerns owned by the instance. See `enterprise/standards/ctrl-instance-governance-standard.md` for the full layered authority model, exchange protocol, and onboarding sequence.

**Boundary arrow correspondence at the governance boundary:** The instance's internal decomposition must produce the Outputs defined in the A-0 ICOM. This is the MECE check at the C3PO ↔ Instance interface.

---

## Quality Assurance Checklist

Apply before finalizing any domain sprint output:

- [ ] Every leaf node has exactly one fully specified ICOM block
- [ ] No leaf node is decomposable into 2+ independently executable sub-functions
- [ ] Every Control (C) references a specific named law, standard, formula, or algorithm
- [ ] Every Mechanism (M) names a specific tool category or API type
- [ ] Every Output (O) names a specific artifact or verifiable state change
- [ ] Every DoD is binary (true/false evaluable)
- [ ] Boundary arrow correspondence holds: union of child outputs = parent output
- [ ] No skill appears under more than one function node
- [ ] All cross-function arrows are registered in ctrl-interface-register.md
- [ ] No banned verbs appear in skill definitions without a measurable qualifier
- [ ] Instance boundary authority (R5.3): C3PO defines only boundary arrows; internal decomposition is instance-owned
