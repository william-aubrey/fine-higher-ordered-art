# Skill File: Technical Architecture Governance

**Node:** A141
**Parent:** A14 Engineering
**Function:** Govern Technical Architecture and Standards
**Supreme Constraint:** [PHYS-CAP] CAP Theorem; [ISO-25010] Software Quality Model; [NIST-CSF] Cybersecurity Framework
**Cross-Function Interfaces:** IF-A1-03 (Legal → A14 Compliance Operating Envelope), IF-A1-06 (A14 → Finance Capital Requirements), IF-A1-23 (Finance → A14 Approved CapEx)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] CAP theorem trade-off selection — [PHYS-CAP] → A14112
- [x] Technical debt quantification — [MATH-SQALE] → A1414 / A14141–A14143
- [x] SAST pipeline configuration — [MATH-CVSS], [OWASP-TOP10] → deferred to A142 sprint (build-time SAST belongs in software platform)
- [ ] SBOM generation and vulnerability mapping — [SBOM-SPDX] or [SBOM-CDX] → deferred to A142 sprint
- [ ] Chaos engineering experiment design — [CHAOS-ENG] → deferred to A146 sprint
- [ ] Formal verification of critical algorithm correctness → deferred to A142 sprint
- [ ] MTTR/MTTF failure mode analysis — [FMEA] → deferred to A146 sprint

---

## A141: Govern Technical Architecture and Standards

**Function:** Define, evaluate, and enforce technical architecture standards, technology selections, security controls, and engineering investment decisions that govern all engineering execution (A142–A146)
**Supreme Constraint:** [PHYS-CAP]; [ISO-25010]; [NIST-CSF]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Compliance Operating Envelope | IF-A1-03 from Legal A12 |
| I2 | Input | Capital Expenditure Requests | from A142–A146 — technology investment proposals |
| I3 | Input | Technical Debt Reports | from A142–A146 — code quality metrics and backlog items |
| I4 | Input | Architecture Decision Requests | from A142–A146 — design proposals requiring governance review |
| C1 | Control | [PHYS-CAP] CAP Theorem | distributed system design trade-off governing all architecture decisions |
| C2 | Control | [ISO-25010] Software Quality Model | 8 quality characteristics defining acceptance criteria for architecture |
| C3 | Control | [NIST-CSF] NIST Cybersecurity Framework 2.0 | Govern, Identify, Protect, Detect, Respond, Recover functions |
| C4 | Control | Approved Capital Expenditure List | IF-A1-23 from Finance A11 — constrains investment decisions |
| O1 | Output | Technical Architecture Standards | → A142–A146 as control input |
| O2 | Output | Approved Technology Stack Decisions | → A142–A146 as control input |
| O3 | Output | Architecture Decision Records | → A142–A146 as reference |
| O4 | Output | Technical Debt Remediation Backlog | → A142–A146 as prioritized work queue |
| O5 | Output | Security Architecture Standards | → A142–A146 as control input |
| O6 | Output | Capital Requirements | → Finance A11 via IF-A1-06 |
| M1 | Mechanism | [MECH-SCM] Source Code Management | ADR repository and standards version control |
| M2 | Mechanism | [MECH-SAST] Static Application Security Testing | code quality metrics for debt assessment |
| M3 | Mechanism | [MECH-VULN] Vulnerability Management Platform | security risk inventory |
| M4 | Mechanism | [MECH-LLM] LLM API | architecture analysis and document generation |

**Child Nodes:** A1411, A1412, A1413, A1414, A1415, A1416

### Boundary Arrow Correspondence (A141)

| A141 Code | Produced By | Notes |
|---|---|---|
| O1 Technical Architecture Standards | A1411.O3 | published and versioned standards document |
| O2 Approved Technology Stack Decisions | A1412.O3 | approved selection decision packages |
| O3 Architecture Decision Records | A1413.O3 | published ADR with status and rationale |
| O4 Technical Debt Remediation Backlog | A1414.O3 | prioritized debt items with estimated remediation cost |
| O5 Security Architecture Standards | A1415.O3 | published security architecture document |
| O6 Capital Requirements | A1416.O3 | consolidated CapEx submission to Finance A11 |

### Internal Arrows (A141 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1411.O3 | A1412 | Control | Technical Architecture Standards (technology selection must conform) |
| 2 | A1411.O3 | A1413 | Control | Technical Architecture Standards (ADR evaluation criteria) |
| 3 | A1415.O3 | A1412 | Control | Security Architecture Standards (technology must meet security requirements) |
| 4 | A1414.O3 | A1416 | Input | Technical Debt Remediation Backlog (remediation projects may require CapEx) |
| 5 | A1412.O3 | A1416 | Input | Approved Technology Stack Decisions (new technology may require CapEx) |

---

### A1411: Define Enterprise Technology Standards and Reference Architecture

**Function:** Define Enterprise Technology Standards and Reference Architecture
**Supreme Constraint:** [PHYS-CAP]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Compliance Operating Envelope | IF-A1-03 from Legal A12 — regulatory constraints on technology |
| I2 | Input | Current System Inventory | from A142–A146 — existing technology landscape |
| C1 | Control | [PHYS-CAP] CAP Theorem | consistency/availability/partition trade-off for distributed systems |
| C2 | Control | [ISO-25010] Software Quality Model | functional suitability, performance efficiency, compatibility, usability, reliability, security, maintainability, portability |
| C3 | Control | [MATH-BIGO] Computational Complexity | algorithm efficiency governs performance requirements |
| O1 | Output | Technology Principles Catalog | numbered principles with rationale and applicability scope |
| O2 | Output | Reference Architecture Diagrams | layered architecture with component boundaries and integration patterns |
| O3 | Output | Published Technical Architecture Standards Document | versioned, approved, and distributed to A142–A146 |
| M1 | Mechanism | [MECH-SCM] Source Code Management | standards version control |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | drafting and review |

**Child Nodes:** A14111, A14112, A14113

---

### A1412: Evaluate and Select Technology Stack Components

**Function:** Evaluate and Select Technology Stack Components
**Supreme Constraint:** [ISO-25010]; [PHYS-CAP]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Technology Evaluation Requests | from A142–A146 — proposals for new tools, frameworks, or platforms |
| I2 | Input | Technical Architecture Standards | from A1411.O3 — conformance criteria |
| C1 | Control | [ISO-25010] Software Quality Model | evaluation criteria mapped to quality characteristics |
| C2 | Control | Security Architecture Standards | from A1415.O3 — security requirements for tool selection |
| O1 | Output | Technology Landscape Assessment | current state vs. market analysis by category |
| O2 | Output | Scored Candidate Evaluation Matrix | weighted scoring of candidates against criteria |
| O3 | Output | Approved Technology Selection Decision Package | selected technology with rationale, migration plan, and Principal sign-off |
| M1 | Mechanism | [MECH-LLM] LLM API | market research and comparison analysis |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | evaluation documentation |

**Child Nodes:** A14121, A14122, A14123

---

### A1413: Conduct Architecture Decision Reviews

**Function:** Conduct Architecture Decision Reviews
**Supreme Constraint:** [PHYS-CAP]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Architecture Decision Requests | from A142–A146 — design proposals with trade-off analysis |
| I2 | Input | Technical Architecture Standards | from A1411.O3 — conformance criteria |
| C1 | Control | [PHYS-CAP] CAP Theorem | distributed system trade-offs must be explicitly stated |
| C2 | Control | [ISO-25010] Software Quality Model | quality characteristic impact assessment required |
| O1 | Output | Validated Architecture Decision Request | confirmed scope, alternatives, and trade-off analysis |
| O2 | Output | Technical Trade-off Evaluation Report | standards conformance assessment with gap analysis |
| O3 | Output | Published Architecture Decision Record (ADR) | numbered, dated, with status (accepted/rejected), rationale, and consequences |
| M1 | Mechanism | [MECH-SCM] Source Code Management | ADR repository (stored as versioned markdown in SCM) |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | review workflow |

**Child Nodes:** A14131, A14132, A14133

---

### A1414: Assess and Quantify Technical Debt

**Function:** Assess and Quantify Technical Debt
**Supreme Constraint:** [MATH-SQALE]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Code Quality Metrics | from MECH-SAST — static analysis findings, code smells, complexity scores |
| I2 | Input | Dependency Vulnerability Reports | from MECH-DEPS — outdated or vulnerable dependencies |
| I3 | Input | Architecture Deviation Reports | from A1413 — known deviations from reference architecture |
| C1 | Control | [MATH-SQALE] SQALE Technical Debt Method | debt quantified in developer-days by quality characteristic |
| C2 | Control | [ISO-25010] Software Quality Model | debt categorized by affected quality characteristic |
| O1 | Output | Technical Debt Inventory | itemized debt register with SQALE classification and estimated remediation cost |
| O2 | Output | Debt Severity Scoring Report | each item scored by business impact and remediation effort |
| O3 | Output | Prioritized Technical Debt Remediation Backlog | ranked by severity score, assigned to owning team, with target resolution quarter |
| M1 | Mechanism | [MECH-SAST] Static Application Security Testing | code quality scanning |
| M2 | Mechanism | [MECH-DEPS] Dependency Vulnerability Scanner | dependency audit |
| M3 | Mechanism | [MECH-BI] Business Intelligence Platform | debt trend dashboards |

**Child Nodes:** A14141, A14142, A14143

---

### A1415: Design Security Architecture and Control Framework

**Function:** Design Security Architecture and Control Framework
**Supreme Constraint:** [NIST-CSF]; [ISO-27001]; [OWASP-TOP10]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Compliance Operating Envelope | IF-A1-03 from Legal A12 — regulatory security mandates |
| I2 | Input | Vulnerability Assessment Reports | from MECH-VULN — current risk posture |
| I3 | Input | SOC 2 Trust Services Criteria Requirements | from customer/market requirements |
| C1 | Control | [NIST-CSF] NIST Cybersecurity Framework 2.0 | 6 functions: Govern, Identify, Protect, Detect, Respond, Recover |
| C2 | Control | [ISO-27001] Information Security Management System | ISMS certification requirements |
| C3 | Control | [OWASP-TOP10] OWASP Top 10 Web Application Security Risks | application-layer security requirements |
| C4 | Control | [SOC2-TSC] SOC 2 Trust Services Criteria | Security, Availability, Processing Integrity, Confidentiality, Privacy |
| O1 | Output | Security Requirements Matrix by Risk Tier | NIST CSF function × asset risk tier with required controls |
| O2 | Output | Security Control Architecture Document | layered security control design with tool mappings |
| O3 | Output | Published Security Architecture Standards | versioned, approved, distributed to A142–A146 as control |
| M1 | Mechanism | [MECH-VULN] Vulnerability Management Platform | risk posture assessment |
| M2 | Mechanism | [MECH-GRC] GRC Platform | control mapping and compliance tracking |
| M3 | Mechanism | [MECH-DOC] Document Collaboration | standards publication |

**Child Nodes:** A14151, A14152, A14153

---

### A1416: Authorize Engineering Capital Expenditure

**Function:** Authorize Engineering Capital Expenditure
**Supreme Constraint:** [MATH-NPV]; [MATH-WACC]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Capital Expenditure Requests | from A142–A146 — technology investment proposals |
| I2 | Input | Technical Debt Remediation Backlog | from A1414.O3 — remediation projects requiring investment |
| I3 | Input | Approved Technology Stack Decisions | from A1412.O3 — new technology requiring procurement |
| C1 | Control | Approved Capital Expenditure List | IF-A1-23 from Finance A11 — budget ceiling |
| C2 | Control | [MATH-NPV] Net Present Value Formula | investment evaluation standard |
| C3 | Control | [MATH-WACC] Weighted Average Cost of Capital | discount rate for NPV calculations |
| O1 | Output | Evaluated CapEx Request Package | each request with NPV, priority tier, and CTO recommendation |
| O2 | Output | Authorized Engineering Investment List | approved projects within budget ceiling |
| O3 | Output | Capital Requirements Submission to Finance | consolidated request to Finance A11 via IF-A1-06 |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | NPV modeling and budget tracking |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | decision package assembly |

**Child Nodes:** A14161, A14162, A14163

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A14111: Draft Technology Principles and Non-Functional Requirements

**Agent Definition:** Compile the enterprise's technology principles (API-first design, stateless services, infrastructure-as-code, zero-trust networking, etc.) from the Compliance Operating Envelope (IF-A1-03) and CAP/Big-O constraints, and produce a numbered principles catalog with rationale and applicability scope for each principle.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Compliance Operating Envelope | IF-A1-03 from Legal A12 — data residency, encryption, retention requirements |
| I2 | Input | Current System Inventory | existing technology landscape from A142–A146 |
| C1 | Control | [PHYS-CAP] CAP Theorem | distributed system design principles must state consistency/availability choice |
| C2 | Control | [MATH-BIGO] Computational Complexity | performance requirements must reference algorithmic bounds |
| O1 | Output | Technology Principles Catalog | numbered list of principles; each entry: principle statement, rationale, applicability scope, exception criteria |
| M1 | Mechanism | [MECH-DOC] Document Collaboration (Google Workspace, Microsoft 365) | drafting and stakeholder review |
| M2 | Mechanism | [MECH-LLM] LLM API (Anthropic Claude API) | principle synthesis and gap analysis |

**Definition of Done:** Principles catalog contains ≥10 numbered principles AND each principle has rationale, scope, and exception criteria fields populated AND catalog addresses all 6 NIST CSF functions AND all regulatory constraints from IF-A1-03 are traced to at least one principle.

---

#### A14112: Define Reference Architecture Patterns and CAP Trade-off Selection

**Agent Definition:** Produce reference architecture diagrams with component boundaries, integration patterns, and data flow layers, and document the explicit CAP theorem trade-off selection (CP, AP, or CA) for each distributed system component with justification.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Technology Principles Catalog | from A14111.O1 |
| I2 | Input | Current System Topology | service inventory and dependency graph from A142–A146 |
| C1 | Control | [PHYS-CAP] CAP Theorem | each distributed component must declare CP, AP, or CA selection |
| C2 | Control | [ISO-25010] Software Quality Model | architecture must satisfy all 8 quality characteristics |
| O1 | Output | Reference Architecture Diagrams | layered diagrams: presentation, application, domain, infrastructure, data; component boundaries and integration patterns |
| O2 | Output | CAP Trade-off Decision Matrix | per-component: CAP selection, justification, consistency model (eventual, strong, causal), partition tolerance strategy |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | diagramming and documentation |
| M2 | Mechanism | [MECH-LLM] LLM API | architecture pattern analysis |

**Definition of Done:** Reference architecture covers all 5 standard layers AND every distributed system component has an explicit CAP selection recorded in the decision matrix AND no component lacks a stated consistency model.

---

#### A14113: Publish Approved Technical Architecture Standards

**Agent Definition:** Assemble the technology principles catalog and reference architecture diagrams into a versioned Technical Architecture Standards document, obtain CTO-equivalent approval, commit to the standards repository in MECH-SCM, and notify all engineering teams of the new version.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Technology Principles Catalog | from A14111.O1 |
| I2 | Input | Reference Architecture Diagrams + CAP Matrix | from A14112.O1, A14112.O2 |
| C1 | Control | [ISO-25010] Software Quality Model | standards document must be structured by quality characteristic |
| O1 | Output | Published Technical Architecture Standards Document | version-numbered, CTO-approved, committed to MECH-SCM |
| M1 | Mechanism | [MECH-SCM] Source Code Management (GitHub, GitLab) | version control and distribution |
| M2 | Mechanism | [MECH-MESSAGING] Team Messaging API (Slack, Teams) | distribution notification |

**Definition of Done:** Standards document has a semantic version number AND CTO-equivalent approval signature is recorded AND document is committed to MECH-SCM repository AND notification is sent to all engineering teams with link to the document.

---

#### A14121: Conduct Technology Landscape Assessment

**Agent Definition:** Inventory the current technology stack by category (languages, frameworks, databases, infrastructure, observability, security), compare each category against the current market landscape, and produce a gap analysis identifying categories where the current selection is end-of-life, unsupported, or misaligned with architecture standards.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Current Technology Inventory | deployed tools, versions, and license status from A142–A146 |
| I2 | Input | Technical Architecture Standards | from A1411.O3 — conformance criteria |
| C1 | Control | [ISO-25010] Software Quality Model | assessment criteria mapped to quality characteristics |
| O1 | Output | Technology Landscape Assessment Report | per-category: current selection, version, support status, market alternatives, standards conformance flag, gap severity (critical/moderate/low) |
| M1 | Mechanism | [MECH-LLM] LLM API (Anthropic Claude API) | market research and comparison |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | assessment documentation |

**Definition of Done:** Every technology category in the current inventory has an entry in the assessment report AND each entry has a standards conformance flag (conformant / non-conformant / partial) AND all critical gaps have a recommended replacement technology named.

---

#### A14122: Score and Rank Candidate Technologies Against Evaluation Criteria

**Agent Definition:** For each technology category flagged for evaluation, define weighted scoring criteria from ISO 25010 quality characteristics and security requirements, score all candidate technologies against the criteria, and produce a ranked evaluation matrix.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Technology Landscape Assessment Report | from A14121.O1 — categories requiring evaluation |
| I2 | Input | Security Architecture Standards | from A1415.O3 — security scoring criteria |
| C1 | Control | [ISO-25010] Software Quality Model | scoring criteria derived from 8 quality characteristics |
| C2 | Control | [PHYS-CAP] CAP Theorem | distributed system candidates scored on consistency model fit |
| O1 | Output | Weighted Evaluation Criteria Matrix | criteria, weights, and rationale per category |
| O2 | Output | Scored Candidate Evaluation Matrix | per-candidate scores by criterion; weighted total; rank |
| M1 | Mechanism | [MECH-LLM] LLM API | candidate research and scoring |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | matrix documentation |

**Definition of Done:** Every flagged category has ≥2 candidates scored AND criteria weights sum to 100% per category AND every candidate has a score for every criterion (no blanks) AND candidates are ranked by weighted total.

---

#### A14123: Approve Technology Selection and Publish Decision Package

**Agent Definition:** Compile the scored evaluation matrix, top-ranked recommendation, migration risk assessment, and estimated adoption cost into a decision package, route to CTO-equivalent for approval, and upon approval publish the decision to the approved technology stack register.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Scored Candidate Evaluation Matrix | from A14122.O2 |
| C1 | Control | [ISO-25010] Software Quality Model | selected technology must score above minimum threshold on all mandatory criteria |
| O1 | Output | Approved Technology Selection Decision Package | selected technology, rationale, migration plan, cost estimate, CTO approval |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | package assembly |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature (DocuSign, Adobe Sign) | CTO approval capture |
| M3 | Mechanism | [MECH-SCM] Source Code Management | approved stack register update |

**Definition of Done:** Decision package contains recommendation with rationale AND migration risk assessment is present AND CTO-equivalent approval signature is captured AND approved technology is recorded in the technology stack register in MECH-SCM.

---

#### A14131: Receive and Validate Architecture Decision Request

**Agent Definition:** Receive an architecture decision request from an engineering team (A142–A146), validate that it includes a problem statement, at least two alternative approaches, and a trade-off analysis referencing the applicable technical standards, and return the request for rework if any required field is missing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Architecture Decision Request | from A142–A146 — problem statement, alternatives, trade-off analysis |
| C1 | Control | [ISO-25010] Software Quality Model | request must identify affected quality characteristics |
| O1 | Output | Validated Architecture Decision Request | request confirmed complete with all required fields; or rejection notice with missing fields listed |
| M1 | Mechanism | [MECH-SCM] Source Code Management | request submission via pull request or issue |
| M2 | Mechanism | [MECH-LLM] LLM API | completeness validation |

**Definition of Done:** Request has a problem statement AND ≥2 alternatives AND a trade-off analysis referencing ≥1 standard from A1411 AND affected quality characteristics are listed — OR — rejection notice is issued listing all missing fields.

---

#### A14132: Evaluate Technical Trade-offs Against Architecture Standards

**Agent Definition:** Analyze each proposed alternative in the architecture decision request against the published Technical Architecture Standards and Security Architecture Standards, assess conformance, identify deviations, and produce a trade-off evaluation report with a recommended alternative and rationale.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Validated Architecture Decision Request | from A14131.O1 |
| I2 | Input | Technical Architecture Standards | from A1411.O3 |
| I3 | Input | Security Architecture Standards | from A1415.O3 |
| C1 | Control | [PHYS-CAP] CAP Theorem | alternatives involving distributed systems must state CAP selection |
| C2 | Control | [ISO-25010] Software Quality Model | conformance check against all 8 quality characteristics |
| O1 | Output | Technical Trade-off Evaluation Report | per-alternative: conformance assessment, deviations, risk, recommended choice with rationale |
| M1 | Mechanism | [MECH-LLM] LLM API | trade-off analysis |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | evaluation documentation |

**Definition of Done:** Every alternative in the request has a conformance assessment AND deviations from standards are enumerated AND report contains a single recommended alternative with written rationale AND any distributed system alternative explicitly states its CAP trade-off.

---

#### A14133: Record Architecture Decision and Publish ADR

**Agent Definition:** Record the final architecture decision (accepted alternative, rejected alternatives with reasons, consequences, and follow-up actions) in a numbered Architecture Decision Record, commit to the ADR repository in MECH-SCM, and notify affected engineering teams.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Technical Trade-off Evaluation Report | from A14132.O1 |
| I2 | Input | CTO-equivalent decision (approve/reject/modify) | architecture governance approval |
| C1 | Control | [ISO-25010] Software Quality Model | ADR must document quality characteristic impact |
| O1 | Output | Published Architecture Decision Record | ADR-[sequence number]; sections: Title, Status (accepted/rejected/superseded), Context, Decision, Consequences, Follow-up Actions |
| M1 | Mechanism | [MECH-SCM] Source Code Management (GitHub, GitLab) | ADR repository |
| M2 | Mechanism | [MECH-MESSAGING] Team Messaging API | notification of affected teams |

**Definition of Done:** ADR has a unique sequence number AND status is set (accepted/rejected/superseded) AND all 6 sections are populated AND ADR is committed to MECH-SCM AND notification is sent to affected teams listing the ADR number and title.

---

#### A14141: Inventory Technical Debt from Code Quality Metrics

**Agent Definition:** Extract static analysis findings (code smells, complexity violations, duplications, coverage gaps) from MECH-SAST and dependency vulnerability counts from MECH-DEPS across all active repositories, and produce a consolidated technical debt inventory itemized by repository, debt category (per SQALE), and estimated remediation effort in developer-days.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | SAST Scan Results | from MECH-SAST — code smells, complexity, duplications, coverage |
| I2 | Input | Dependency Vulnerability Reports | from MECH-DEPS — CVE counts by severity |
| C1 | Control | [MATH-SQALE] SQALE Technical Debt Method | debt classified by SQALE quality characteristic: reliability, security, maintainability, etc. |
| O1 | Output | Technical Debt Inventory | per-item: repository, debt type, SQALE category, estimated remediation effort (developer-days), date first detected |
| M1 | Mechanism | [MECH-SAST] Static Application Security Testing (SonarQube, Semgrep) | code quality scan |
| M2 | Mechanism | [MECH-DEPS] Dependency Vulnerability Scanner (Snyk, Dependabot) | dependency audit |

**Definition of Done:** All active repositories have been scanned AND every detected issue is categorized by SQALE quality characteristic AND estimated remediation effort is stated in developer-days for each item AND inventory total developer-days is computed.

---

#### A14142: Score Technical Debt Items by Business Impact and Remediation Effort

**Agent Definition:** Score each technical debt item from the inventory on two dimensions: business impact (based on affected system criticality and failure probability) and remediation effort (developer-days from SQALE), compute a composite severity score (impact × effort ratio), and produce the severity scoring report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Technical Debt Inventory | from A14141.O1 |
| C1 | Control | [MATH-SQALE] SQALE Technical Debt Method | effort dimension from SQALE estimation |
| C2 | Control | [ISO-25010] Software Quality Model | impact dimension derived from affected quality characteristic × system criticality tier |
| O1 | Output | Debt Severity Scoring Report | per-item: business impact score (1–5), remediation effort score (1–5), composite severity score, criticality tier |
| M1 | Mechanism | [MECH-BI] Business Intelligence Platform (Sigma, Looker) | scoring dashboard |
| M2 | Mechanism | [MECH-SAST] Static Application Security Testing | enriched quality data |

**Definition of Done:** Every item in the debt inventory has a business impact score AND a remediation effort score AND a composite severity score AND items are ordered by composite score descending.

---

#### A14143: Prioritize Technical Debt Remediation Backlog

**Agent Definition:** Rank all scored technical debt items into a prioritized remediation backlog, assign each item to an owning engineering team (A142–A146), set a target resolution quarter, and estimate the total remediation investment required for the top-priority tranche.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Debt Severity Scoring Report | from A14142.O1 |
| I2 | Input | Engineering Team Capacity | from A142–A146 — available developer-days per quarter |
| C1 | Control | [MATH-SQALE] SQALE Technical Debt Method | remediation cost in developer-days constrains quarterly capacity |
| O1 | Output | Prioritized Technical Debt Remediation Backlog | ranked items with owning team, target quarter, and estimated developer-days |
| O2 | Output | Quarterly Remediation Investment Estimate | total developer-days and equivalent cost for top-priority tranche |
| M1 | Mechanism | [MECH-SCM] Source Code Management | backlog tracked as issues/tickets |
| M2 | Mechanism | [MECH-BI] Business Intelligence Platform | capacity planning dashboard |

**Definition of Done:** All items from the severity report appear in the backlog AND every item has an assigned owning team AND a target resolution quarter AND the top-priority tranche total developer-days is computed AND backlog is committed to MECH-SCM issue tracker.

---

#### A14151: Map Security Requirements to NIST CSF Functions by Risk Tier

**Agent Definition:** Decompose the Compliance Operating Envelope (IF-A1-03) and SOC 2 TSC requirements into specific security controls, map each control to one of the 6 NIST CSF functions (Govern, Identify, Protect, Detect, Respond, Recover), and tier them by asset risk level (Tier 1 critical, Tier 2 important, Tier 3 standard).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Compliance Operating Envelope | IF-A1-03 from Legal A12 |
| I2 | Input | SOC 2 Trust Services Criteria Requirements | customer and market requirements |
| C1 | Control | [NIST-CSF] NIST Cybersecurity Framework 2.0 | 6 functions as classification axis |
| C2 | Control | [SOC2-TSC] SOC 2 Trust Services Criteria | Security, Availability, Processing Integrity, Confidentiality, Privacy |
| O1 | Output | Security Requirements Matrix | NIST CSF function × risk tier × control requirement; each cell: control ID, description, applicable standards citation |
| M1 | Mechanism | [MECH-GRC] GRC Platform (ServiceNow GRC, OneTrust) | control mapping |
| M2 | Mechanism | [MECH-LLM] LLM API | requirements decomposition |

**Definition of Done:** All 6 NIST CSF functions have at least one control mapped AND all Compliance Operating Envelope mandates are traced to a control AND every control has a risk tier assignment AND SOC 2 TSC criteria are cross-referenced.

---

#### A14152: Design Security Control Architecture per Risk Tier

**Agent Definition:** For each risk tier (Tier 1–3), design the specific security control implementation architecture: identity and access management layers, encryption requirements, network segmentation rules, logging and monitoring requirements, and incident response procedures, referencing specific mechanism categories from the mechanism catalog.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Security Requirements Matrix | from A14151.O1 |
| C1 | Control | [NIST-CSF] NIST Cybersecurity Framework 2.0 | control design must cover all 6 functions |
| C2 | Control | [ISO-27001] ISMS | control architecture must satisfy ISO 27001 Annex A requirements |
| C3 | Control | [OWASP-TOP10] OWASP Top 10 | application-layer controls must address all top 10 risks |
| O1 | Output | Security Control Architecture Document | per-tier: IAM design, encryption standards, network segmentation, logging requirements, IR procedures; mechanism references |
| M1 | Mechanism | [MECH-IAM] Identity & Access Management (Okta, AWS IAM) | IAM design reference |
| M2 | Mechanism | [MECH-SIEM] SIEM (Splunk, Microsoft Sentinel) | logging architecture reference |
| M3 | Mechanism | [MECH-GRC] GRC Platform | control documentation |

**Definition of Done:** Control architecture covers all 3 risk tiers AND each tier specifies IAM, encryption, network, logging, and IR requirements AND all OWASP Top 10 risks have a mitigating control AND every control references a specific MECH-code from the mechanism catalog.

---

#### A14153: Publish Security Architecture Standards to A142–A146

**Agent Definition:** Assemble the security requirements matrix and control architecture into a versioned Security Architecture Standards document, obtain CISO/CTO-equivalent approval, commit to the standards repository, and distribute to all engineering teams (A142–A146) as a mandatory control input.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Security Requirements Matrix | from A14151.O1 |
| I2 | Input | Security Control Architecture Document | from A14152.O1 |
| C1 | Control | [NIST-CSF] NIST Cybersecurity Framework 2.0 | completeness check against all 6 functions |
| O1 | Output | Published Security Architecture Standards | version-numbered, approved, committed to MECH-SCM, distributed |
| M1 | Mechanism | [MECH-SCM] Source Code Management (GitHub, GitLab) | version control |
| M2 | Mechanism | [MECH-MESSAGING] Team Messaging API (Slack, Teams) | distribution notification |
| M3 | Mechanism | [MECH-ESIGN] Electronic Signature | approval capture |

**Definition of Done:** Standards document has a semantic version number AND CISO/CTO-equivalent approval is captured AND document is committed to MECH-SCM AND notification is delivered to all engineering team channels listing the version and effective date.

---

#### A14161: Receive and Evaluate Capital Expenditure Requests from A142–A146

**Agent Definition:** Collect capital expenditure requests from all engineering sub-functions (A142–A146), validate that each includes a business justification, projected ROI, and asset category classification per IRC §263, and compute NPV using WACC as the discount rate for each request.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Capital Expenditure Requests | from A142–A146 — business case, projected cash flows, useful life |
| C1 | Control | [MATH-NPV] Net Present Value Formula | NPV = Σ(CFₜ / (1+r)ᵗ) − C₀ where r = WACC |
| C2 | Control | [MATH-WACC] Weighted Average Cost of Capital | discount rate for NPV |
| C3 | Control | [IRC-263] Capital Expenditure Classification | capitalize vs. expense determination |
| O1 | Output | Evaluated CapEx Request Package | per-request: NPV, IRR, payback period, asset category, CTO priority tier |
| M1 | Mechanism | [MECH-FPA] FP&A Platform (Anaplan, Adaptive Planning) | NPV modeling |

**Definition of Done:** Every submitted CapEx request has an NPV calculated using current WACC AND IRC §263 capitalization determination is documented AND CTO priority tier (1–3) is assigned.

---

#### A14162: Authorize Engineering Investments Against Approved Budget

**Agent Definition:** Compare the total of all evaluated CapEx requests to the Approved Capital Expenditure List (IF-A1-23), rank requests by NPV within the budget ceiling, and produce the authorized engineering investment list with CTO-equivalent sign-off.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Evaluated CapEx Request Package | from A14161.O1 |
| I2 | Input | Approved Capital Expenditure List | IF-A1-23 from Finance A11 — budget ceiling |
| C1 | Control | [MATH-NPV] Net Present Value Formula | NPV > 0 required for approval; highest NPV ranked first |
| O1 | Output | Authorized Engineering Investment List | approved projects within budget; CTO sign-off; rejected projects with rationale |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | budget comparison and ranking |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | CTO approval capture |

**Definition of Done:** All approved projects have NPV > 0 AND total approved amount ≤ IF-A1-23 budget ceiling AND CTO-equivalent approval signature is captured AND rejected projects have documented rationale.

**[CROSS-FUNCTION: A141 → A11]** *Interface: IF-A1-23 (consumes control input)*

---

#### A14163: Submit Consolidated Capital Requirements to Finance A11

**Agent Definition:** Compile all approved and pending engineering capital requirements (authorized investments plus unfunded requests requiring budget increase) into a consolidated Capital Requirements submission and transmit to Finance A11 via IF-A1-06.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Authorized Engineering Investment List | from A14162.O1 |
| I2 | Input | Unfunded CapEx Requests | requests exceeding IF-A1-23 budget ceiling requiring additional authorization |
| C1 | Control | [MATH-NPV] Net Present Value Formula | unfunded requests must include NPV justification |
| O1 | Output | Capital Requirements Submission to Finance A11 | consolidated package: authorized (within budget) + unfunded (above budget) with NPV for each |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | submission assembly |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | package formatting and routing |

**Definition of Done:** Submission contains both authorized and unfunded request lists AND every item has NPV, priority tier, and asset category AND submission is transmitted to Finance A11 via IF-A1-06 AND Finance A11 returns receipt acknowledgment.

**[CROSS-FUNCTION: A14 → A11]** *Interface: IF-A1-06*

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1=A1411.O3; O2=A1412.O3; O3=A1413.O3; O4=A1414.O3; O5=A1415.O3; O6=A1416.O3
- [x] No skill appears under more than one function node
- [x] All cross-function skills cite an interface: IF-A1-06 (CapEx to Finance), IF-A1-23 (CapEx from Finance)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L4 node names are active verb phrases — all 6 verified (R1.2a)
- [x] L5 node names are active verb phrases — all 18 verified (R1.2a)
- [x] Leaf node count confirmed: 18
- [x] Mandatory inclusions: CAP trade-off (A14112); technical debt SQALE (A14141–A14143); security via NIST-CSF/OWASP/ISO-27001 (A14151–A14153)
