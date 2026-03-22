# Skill File: Workforce Planning & Organizational Design

**Node:** A131
**Parent:** A13 People
**Function:** Design and govern the organizational architecture, model workforce requirements against business demand, plan workforce transitions, and maintain the canonical position data model.
**Supreme Constraint:** [WARN] WARN Act — mass layoff notification; [ADA] Americans with Disabilities Act; [NLRA] National Labor Relations Act; [TITLE7] Title VII; [ADEA] Age Discrimination in Employment Act
**Cross-Function Interfaces:** IF-A1-04, IF-A1-07, IF-A1-25
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [x] Compa-ratio analysis and salary band calibration — A13123 [MECH-COMP]; workforce cost model includes compa-ratio by band
- [x] RIF legal compliance checklist — A1314 (A13141–A13143) [WARN] [ADEA] [TITLE7] [EEOC-PROC]
- [ ] 9-box talent grid calibration — *Primary owner: A135 Performance Management. A13152 (Bench Strength) consumes 9-box outputs from A135 as inputs. Mandatory inclusion satisfied by design dependency; full calibration executed at A135 sprint.*
- [x] HRIS data model design — A1313 (A13131–A13133) [MECH-HRIS]; position schema, register, and reconciliation
- [x] Organizational network analysis — A1316 (A13161–A13163) [MECH-ONA]
- [x] Succession depth charting — A1315 (A13151–A13153)

---

## A131: Workforce Planning & Organizational Design

**Function:** Design and govern the organizational architecture, model workforce requirements against business demand, plan workforce transitions, and maintain the canonical position data model.
**Supreme Constraint:** [WARN] WARN Act; [ADA] ADA; [NLRA] NLRA; [TITLE7] Title VII; [ADEA] ADEA

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Business Strategy and Growth Plan | Principal-set annual operating plan; headcount targets by function |
| I2 | Input | Role Requirements (Headcount Requisition) | IF-A1-07 from Engineering A14 |
| I3 | Input | Compensation Budget Envelope | From Finance A11; annual approved labor cost envelope |
| I4 | Input | 9-Box Calibration Results | From A135 Performance Management (internal A13 tunnel); successor readiness grades |
| C1 | Control | WARN Act Notification Requirements | [WARN] 29 U.S.C. §2101 — 60-day notice for qualifying mass layoffs |
| C2 | Control | ADA Reasonable Accommodation | [ADA] 42 U.S.C. §12101 — org design must accommodate qualified individuals |
| C3 | Control | NLRA Concerted Activity Rights | [NLRA] 29 U.S.C. §151; [STERICYCLE] workforce changes cannot chill §7 rights |
| C4 | Control | Anti-Discrimination in Reductions | [TITLE7] [ADEA] adverse impact analysis required before executing RIF |
| C5 | Control | Pay Equity Requirements | [PAY-EQUITY-STATE] [EPA-1963] band structure must support pay equity |
| C6 | Control | Employment Law Templates | [IF-A1-25] Employment law procedures from Legal A12 |
| O1 | Output | Workforce Architecture Plan | Org topology, span standards, authorized position register → A132; IF-A1-04 |
| O2 | Output | HRIS Position Data Model | Canonical position schema and maintained register → A133, A132, IF-A1-04 |
| O3 | Output | Succession Depth Report | Critical role inventory, bench grades, risk heatmap → Principal and A135 |
| O4 | Output | Workforce Analytics Package | ONA output, capacity gap, cost model → Principal judgment layer |
| M1 | Mechanism | HRIS | [MECH-HRIS] Position master record system |
| M2 | Mechanism | Compensation Benchmarking | [MECH-COMP] Market data for workforce cost modeling |
| M3 | Mechanism | ONA Platform | [MECH-ONA] Network analysis and collaboration data |
| M4 | Mechanism | BI / Reporting | [MECH-BI] Workforce analytics dashboards |
| M5 | Mechanism | LLM / Agent | [MECH-LLM] [MECH-AGENT] AI-assisted analysis and report generation |

**Child Nodes:** A1311, A1312, A1313, A1314, A1315, A1316

---

## A1311: Design Organizational Architecture

**Function:** Define the organizational topology — reporting hierarchy, spans of control, and management layers — that maps business functions to the IDEF0 model.
**Supreme Constraint:** [NLRA] concerted activity; [ADA] accommodation obligations in role design

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Business Strategy and Growth Plan | Annual operating plan; functional scope targets |
| I2 | Input | Role Requirements | IF-A1-07; approved requisitions from A14 |
| C1 | Control | NLRA Concerted Activity | [NLRA] org structure cannot be designed to chill §7 rights |
| C2 | Control | ADA Reasonable Accommodation | [ADA] reporting design must accommodate qualified individuals without structural penalty |
| O1 | Output | Org Topology Document | Reporting hierarchy, span standards, layer count, matrix vs. functional decision |
| M1 | Mechanism | HRIS | [MECH-HRIS] Org chart module; position hierarchy |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Structural analysis and design option generation |

**Child Nodes:** A13111, A13112, A13113

---

#### A13111: Design Span-and-Layer Org Topology

**Agent Definition:** Produce a formal org topology document specifying the number of management layers, reporting hierarchy by function, and matrix relationship definitions, with each structural decision mapped to a named IDEF0 node in the enterprise model.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Business Strategy and Growth Plan | Annual operating plan with functional headcount targets; current org chart if existing |
| I2 | Input | Role Requirements | IF-A1-07; open requisitions and planned roles from Engineering A14 |
| C1 | Control | NLRA Concerted Activity Rights | [NLRA] 29 U.S.C. §151 — design cannot isolate or fragment employee groups in ways that chill §7 activity |
| C2 | Control | ADA Reasonable Accommodation | [ADA] 42 U.S.C. §12101 — reporting structures must permit accommodation without structural penalty |
| O1 | Output | Org Topology Document | Management layers (count), span per level, formal reporting lines, matrix reporting relationships (dotted), decision rights by level; every management layer maps to a named IDEF0 node in `enterprise/model/enterprise-model.md` |
| M1 | Mechanism | HRIS | [MECH-HRIS] Org chart hierarchy module |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Structural design option generation and tradeoff analysis |

**Definition of Done:** Org Topology Document is committed to MECH-HRIS position hierarchy AND every management layer in the document maps to a named IDEF0 node at A13 level or above in `enterprise/model/enterprise-model.md`.

---

#### A13112: Set Management Span Standards by Role Class

**Agent Definition:** Define the authorized minimum and maximum span of control (direct reports per manager) for each role class (IC, team lead, manager, director, VP, C-suite) and encode these standards as HRIS position attributes.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Org Topology Document | Output of A13111; layer count and reporting structure |
| I2 | Input | Role Class Definitions | Position types from HRIS position schema (A13131) |
| C1 | Control | FLSA Exempt Classification | [FLSA-EXEMPT] 29 CFR Part 541 — executive exemption requires authority over ≥2 employees; span standards must not inadvertently affect FLSA classification |
| C2 | Control | ADA Reasonable Accommodation | [ADA] supervisory spans must allow manager bandwidth for the interactive accommodation process |
| O1 | Output | Span-of-Control Standard Table | Per-class min/max direct reports; deviation approval process; exceptions register |
| M1 | Mechanism | HRIS | [MECH-HRIS] Position attribute field for authorized span |
| M2 | Mechanism | Compensation Benchmarking | [MECH-COMP] Market norms for span by function and seniority |

**Definition of Done:** Span-of-Control Standard Table is encoded as a HRIS position attribute for every active role class AND all current HRIS positions have a span compliance flag (within range = TRUE / outside range = FALSE with documented justification).

---

#### A13113: Approve Org Design Changes [Human Gate]

**Agent Definition:** Compile all proposed org design changes (new layers, reporting line changes, role eliminations, matrix additions) into a structured decision package and route to Principal for approval, halting org change execution until binary approve/reject is received.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed Org Design Change | Change request: affected nodes, before/after topology, headcount delta, cost delta, rationale |
| I2 | Input | NLRA Risk Assessment | [NLRA] / [STERICYCLE] preliminary assessment of whether change could chill §7 rights |
| C1 | Control | NLRA Concerted Activity | [NLRA] 29 U.S.C. §151; [STERICYCLE] 372 NLRB No. 113 (2023) — change cannot be designed to disadvantage organizing employees |
| C2 | Control | Org Change Approval Policy | [ORG-CHG-POLICY] Principal approval required for any change affecting ≥3 positions or adding/removing a management layer |
| O1 | Output | Signed Org Change Authorization | Principal approval or rejection with documented rationale; effective date |
| M1 | Mechanism | Document Management | [MECH-DOC] Authorization record storage |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Change impact summary generation |

**Definition of Done:** Principal returns signed approval or rejection with documented rationale within 48-hour SLA AND authorization record is stored in MECH-DOC with effective date before any org change is executed in MECH-HRIS.

**Cross-Function:** Principal judgment gate — no downstream org change executes without this output.

---

## A1312: Model Headcount Requirements

**Function:** Build demand-side workforce models that link authorized headcount to business output targets, compute capacity gaps, and produce the workforce cost model by band.
**Supreme Constraint:** [PAY-EQUITY-STATE] [EPA-1963] cost modeling must account for pay equity obligations; [FLSA-EXEMPT] exemption status affects role categories

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Business Strategy and Growth Plan | Revenue targets, unit volume, production throughput targets by function |
| I2 | Input | Compensation Budget Envelope | Finance A11 approved labor cost ceiling by function |
| I3 | Input | Authorized Position Register | Current filled and open positions from A13132 |
| C1 | Control | Pay Equity Requirements | [PAY-EQUITY-STATE] [EPA-1963] cost modeling must flag pay equity exposure by band |
| C2 | Control | FLSA Exempt Classification | [FLSA-EXEMPT] exemption status affects hours and overtime cost modeling |
| O1 | Output | Workforce Demand Model | Headcount-to-output ratio model; capacity targets by function |
| O2 | Output | Workforce Capacity Gap Report | Current vs. required headcount by function; surplus/deficit register |
| O3 | Output | Workforce Cost Model | Fully-loaded cost per headcount class; total labor envelope vs. budget; compa-ratio by band |
| M1 | Mechanism | FP&A | [MECH-FPA] Financial modeling for headcount cost projection |
| M2 | Mechanism | Compensation Benchmarking | [MECH-COMP] Market rates for cost modeling |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Scenario modeling and gap analysis |

**Child Nodes:** A13121, A13122, A13123

---

#### A13121: Build Workforce Demand Model

**Agent Definition:** Construct a quantitative model linking authorized headcount per function to business output targets (revenue per FTE, units per FTE, or IDEF0-node throughput metrics), with separate demand lines for each A0-level function (Governance A1, Production A2, Sales A3).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Business Strategy and Growth Plan | Annual operating plan: revenue targets, unit volume, customer acquisition targets by A0 function |
| I2 | Input | Authorized Position Register | Output of A13132; current filled and approved-open positions by function |
| C1 | Control | FLSA Exempt/Non-Exempt Classification | [FLSA-EXEMPT] 29 CFR Part 541 — exempt vs. non-exempt status affects hours-based productivity modeling assumptions |
| C2 | Control | Ordinary Business Expense | [IRC-162] IRC §162 — headcount cost deductibility standard informs cost model structure |
| O1 | Output | Workforce Demand Model | Per-function headcount targets tied to output KPIs; productivity ratio assumptions documented; model versioned in MECH-DOC |
| M1 | Mechanism | FP&A | [MECH-FPA] Financial planning model |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] KPI-to-headcount ratio analysis |

**Definition of Done:** Workforce Demand Model outputs a headcount target for every active A0-level function AND each target is traceable to a named business output KPI in the operating plan with no function target left as an undocumented carry-forward from the prior year.

---

#### A13122: Compute Workforce Capacity Gap

**Agent Definition:** Compare the current authorized position register (filled + approved-open) against the workforce demand model targets to produce a capacity gap register showing surplus and deficit by function, seniority band, and role class.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Workforce Demand Model | Output of A13121; headcount targets per function and role class |
| I2 | Input | Authorized Position Register | Output of A13132; current filled and open positions with status |
| C1 | Control | ADA Reasonable Accommodation | [ADA] 42 U.S.C. §12101 — positions with active accommodation plans cannot be counted as available surplus |
| C2 | Control | FMLA Protected Leave | [FMLA] 29 U.S.C. §2601 — employees on protected leave are not available capacity; exclude from available pool |
| O1 | Output | Workforce Capacity Gap Register | Per-function: current count, target count, delta (surplus+/deficit−), open req count, time-to-fill estimate; positions classified as filled / open-approved / open-frozen / leave-protected / accommodation-active |
| M1 | Mechanism | HRIS | [MECH-HRIS] Position status data extract |
| M2 | Mechanism | FP&A | [MECH-FPA] Gap computation and scenario modeling |

**Definition of Done:** Capacity Gap Register covers 100% of active functions in the authorized position register AND every position is classified with one of five statuses (filled / open-approved / open-frozen / leave-protected / accommodation-active) with zero unclassified positions.

---

#### A13123: Calculate Fully-Loaded Workforce Cost by Band

**Agent Definition:** Compute total fully-loaded cost per headcount by salary band (base + target bonus + employer taxes + benefits load + equity cost) and produce a workforce cost model comparing total labor envelope against the Finance-approved budget, with compa-ratio computed for every filled position.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Compensation Budget Envelope | Finance A11 approved total labor cost ceiling by function and band |
| I2 | Input | Authorized Position Register | Output of A13132; filled positions with compensation data |
| I3 | Input | Compensation Band Definitions | From A1331 Compensation Architecture; min/mid/max by band |
| C1 | Control | Pay Equity Requirements | [PAY-EQUITY-STATE] [EPA-1963] cost model must break out by gender and race/ethnicity to flag pay equity exposure |
| C2 | Control | GAAP Compensation Expense | [MATH-GAAP-AXIOMS] all compensation components follow accrual recognition |
| C3 | Control | Employer Tax Obligations | [IRC-3111] employer FICA; [IRC-3301] FUTA — included in fully-loaded cost |
| O1 | Output | Workforce Cost Model | Per-band: min/mid/max salary, target bonus %, employer tax load, benefits load, equity cost estimate, total fully-loaded cost per FTE; aggregate by function; compa-ratio per filled position (current salary ÷ band midpoint); variance vs. budget |
| M1 | Mechanism | Compensation Benchmarking | [MECH-COMP] Market data for band-level benchmarks |
| M2 | Mechanism | FP&A | [MECH-FPA] Cost model construction and budget variance |

**Definition of Done:** Workforce Cost Model total equals Finance-approved budget with ±5% variance (any variance >5% has documented explanation) AND compa-ratio is computed for every filled position expressed as a decimal (current salary ÷ band midpoint).

*Budget variance data in the Workforce Cost Model is available to the Principal for Finance FP&A alignment. Flows through A131.O4 (Workforce Analytics Package → Principal judgment layer), not as a direct A13→A11 interface.*

---

## A1313: Govern HRIS Position Data Model

**Function:** Define and maintain the canonical HRIS position data schema, manage the authorized position register lifecycle, and ensure data integrity across HRIS, payroll, and the org chart.
**Supreme Constraint:** [FLSA-EXEMPT] correct classification in HRIS; [I9] employment eligibility; [TITLE7] data fields cannot enable discriminatory filtering

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | New Hire / Departure / Role Change Notifications | Trigger events from A132 (Talent Acquisition) and Principal |
| I2 | Input | Approved Org Design Changes | Output of A13113; authorized topology changes |
| C1 | Control | FLSA Exempt Classification | [FLSA-EXEMPT] HRIS position record must carry correct FLSA status |
| C2 | Control | I-9 Employment Eligibility | [I9] HRIS must store I-9 verification status |
| C3 | Control | Title VII | [TITLE7] data fields must not enable discriminatory filtering |
| O1 | Output | HRIS Position Schema | Canonical field definitions; entity-relationship model |
| O2 | Output | Authorized Position Register | Active positions with status (filled / open / frozen) |
| O3 | Output | Data Integrity Reconciliation Report | Three-way HRIS / payroll / org chart reconciliation |
| M1 | Mechanism | HRIS | [MECH-HRIS] Master position data system |

**Child Nodes:** A13131, A13132, A13133

---

#### A13131: Define HRIS Position Schema

**Agent Definition:** Produce and version-control the canonical HRIS position data model specifying every required field, data type, allowed values, and IDEF0 node mapping for the People & Roles entity, and publish it as the authoritative schema for all downstream consumers.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Enterprise People Entity Definition | `enterprise/data/data-entity-people.md` — current canonical People entity |
| I2 | Input | Org Topology Document | Output of A13111; hierarchy and role class definitions |
| C1 | Control | FLSA Exempt Classification | [FLSA-EXEMPT] 29 CFR Part 541 — `flsa_status` (exempt/non-exempt/TBD) is mandatory; no position may be created without a valid value |
| C2 | Control | ADA Accommodation Tracking | [ADA] 42 U.S.C. §12101 — `accommodation_flag` (boolean) is required; accommodation type cannot be stored as free text in a searchable index |
| C3 | Control | I-9 Verification | [I9] `i9_verified` (boolean) and `i9_expiry_date` fields required for all non-citizen positions |
| O1 | Output | HRIS Position Schema Document | Versioned schema: field name, data type, allowed values, IDEF0 node mapping, source system, update trigger; stored in `enterprise/data/` |
| M1 | Mechanism | HRIS | [MECH-HRIS] Schema configuration in position module |
| M2 | Mechanism | Document Management | [MECH-DOC] Version-controlled schema file |

**Definition of Done:** HRIS Position Schema Document is committed to `enterprise/data/` with a version number AND every field maps to a named IDEF0 node at A13 level or above AND MECH-HRIS position module reflects all schema fields with zero orphaned fields.

---

#### A13132: Record Position Lifecycle Events in HRIS

**Agent Definition:** Process all position lifecycle events (create, fill, freeze, unfreeze, close) in MECH-HRIS so that the authorized position register at any point reflects every approved position, its status, and its occupant if filled.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Approved Org Change Authorization | Output of A13113; signed authorization for position creation or elimination |
| I2 | Input | New Hire / Departure Notifications | Trigger: new hire onboarded (A132), departure processed, or role change approved |
| C1 | Control | FLSA Exempt Classification | [FLSA-EXEMPT] every position record must carry FLSA status before status is set to "open" |
| C2 | Control | NLRA | [NLRA] 29 U.S.C. §151 — position freeze decisions cannot target positions whose occupants have engaged in §7 activity |
| O1 | Output | Authorized Position Register | MECH-HRIS extract: position ID, title, department, band, FLSA status, status (filled/open/frozen), occupant name and ID, effective date |
| M1 | Mechanism | HRIS | [MECH-HRIS] Position management module |

**Definition of Done:** Authorized Position Register extract contains zero positions with status = NULL AND zero filled positions with occupant_id = NULL AND register was last updated within 2 business days of the most recent position lifecycle event.

---

#### A13133: Reconcile HRIS-Payroll-OrgChart Position Data

**Agent Definition:** Execute a three-way data reconciliation comparing the HRIS authorized position register, the active payroll roster, and the published org chart to identify and resolve all discrepancies (phantom payroll entries, org chart mismatches, occupant conflicts).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Authorized Position Register | Output of A13132; MECH-HRIS extract |
| I2 | Input | Active Payroll Roster | From A1333 Payroll Processing; active employee list with position IDs |
| I3 | Input | Published Org Chart | Current org chart from MECH-HRIS org chart module |
| C1 | Control | Payroll Tax Compliance | [IRS-PUB15] every employee in payroll must map to an authorized position — phantom positions create tax liability |
| C2 | Control | FLSA Classification | [FLSA-EXEMPT] classification in HRIS must match classification in payroll system |
| O1 | Output | Reconciliation Report | Discrepancy table: HRIS-vs-payroll mismatches, HRIS-vs-org-chart mismatches, orphaned payroll records; resolution status per row (resolved / escalated to Principal) |
| M1 | Mechanism | HRIS | [MECH-HRIS] Position data export |
| M2 | Mechanism | Payroll | [MECH-PAYROLL] Active employee roster extract |

**Definition of Done:** Reconciliation Report shows zero unresolved discrepancies between HRIS and payroll rosters AND report is produced on a monthly cadence triggered by the payroll close event from A1333.

**Cross-Function:** [CROSS-FUNCTION: A13 ↔ A1333 (Payroll)] Internal A13 data flow; payroll close triggers reconciliation run.

---

## A1314: Plan and Execute Workforce Reduction

**Function:** When business conditions require headcount reduction, design the RIF selection methodology, validate legal compliance through adverse impact analysis, and execute the WARN Act notification process.
**Supreme Constraint:** [WARN] 60-day mass layoff notification; [TITLE7] [ADEA] adverse impact prohibition; [NLRA] anti-retaliation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Workforce Capacity Gap Register | Surplus headcount by function from A13122 |
| I2 | Input | Business Reduction Directive | Principal authorization to reduce headcount; target count by function |
| C1 | Control | WARN Act | [WARN] 29 U.S.C. §2101 — 60-day advance notice required for plant closings or mass layoffs ≥50 employees |
| C2 | Control | ADEA OWBPA | [ADEA] 29 U.S.C. §626(f) — waiver requires 21-day consideration and 7-day revocation for employees ≥40 |
| C3 | Control | Title VII Adverse Impact | [TITLE7] 42 U.S.C. §2000e; EEOC Uniform Guidelines 29 CFR Part 1607 — 80% rule applies |
| C4 | Control | NLRA Anti-Retaliation | [NLRA] RIF cannot target employees engaged in protected concerted activity |
| C5 | Control | Employment Law Templates | [IF-A1-25] RIF notice templates and compliance procedures from Legal A12 |
| O1 | Output | RIF Selection Package | Scope, criteria, adverse impact analysis, WARN determination |
| O2 | Output | WARN Act Notice Package | Written notices to affected employees and government agencies |
| M1 | Mechanism | HRIS | [MECH-HRIS] Employee data for RIF scope |
| M2 | Mechanism | Legal AI | [MECH-LEGAL-AI] Adverse impact calculation support |

**Child Nodes:** A13141, A13142, A13143

---

#### A13141: Select RIF Scope and Criteria

**Agent Definition:** Document the business rationale for a workforce reduction, define the selection criteria (role elimination, performance-based, or seniority-based), identify the in-scope position population, and produce the preliminary RIF selection list for legal review.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Business Reduction Directive | Principal-signed authorization: target headcount reduction by function, effective date range, business rationale |
| I2 | Input | Authorized Position Register | Output of A13132; filled positions with role class, tenure, and performance tier |
| C1 | Control | WARN Act Threshold | [WARN] 29 U.S.C. §2101 — document whether RIF meets threshold (≥50 employees or ≥33% of workforce at single site); if yes, WARN notice required |
| C2 | Control | ADEA OWBPA Waiver Requirements | [ADEA] 29 U.S.C. §626(f) — if affected employees include workers ≥40, release agreement must include job title and age list of all selected and non-selected in the decisional unit; 21-day consideration; 7-day revocation |
| O1 | Output | Preliminary RIF Selection List | Affected position IDs, role titles, occupant names, selection rationale per position, WARN threshold determination (triggered: Y/N), OWBPA applicability (Y/N) |
| M1 | Mechanism | HRIS | [MECH-HRIS] Employee data extract for scope population |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Criteria documentation and WARN threshold calculation |

**Definition of Done:** Preliminary RIF Selection List contains a documented selection rationale for every affected position AND WARN threshold is explicitly determined (triggered or not triggered) with supporting headcount math AND list is routed to Legal A12 (A125) for adverse impact review before any employee notification occurs.

**Cross-Function:** [CROSS-FUNCTION: A13 → A12] RIF list routed to A125 Employment & Labor Law for adverse impact review. Interface: IF-A1-25.

---

#### A13142: Audit RIF Selection for Adverse Impact

**Agent Definition:** Conduct a statistical adverse impact analysis on the preliminary RIF selection list using the EEOC 80% (four-fifths) rule and age cohort chi-square test to determine whether the selection disproportionately affects any protected class.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Preliminary RIF Selection List | Output of A13141; affected positions with occupant demographics |
| I2 | Input | Incumbent Population Data | Full decisional unit (selected + non-selected) by protected class from MECH-HRIS |
| C1 | Control | Title VII Adverse Impact Standard | [TITLE7] 42 U.S.C. §2000e; [EEOC-PROC] 29 CFR Part 1607 — 80% rule: selection rate for any protected class < 80% of highest rate triggers adverse impact finding |
| C2 | Control | ADEA Age Cohort Analysis | [ADEA] 29 U.S.C. §621 — separate analysis for employees ≥40; Fisher's exact test or chi-square applied to age group selection rates |
| C3 | Control | EEOC Retention of Records | [EEOC-PROC] 42 U.S.C. §2000e-5 — adverse impact documentation retained for duration of any charge plus 3 years |
| O1 | Output | Adverse Impact Analysis Report | Per-class selection rates, four-fifths rule result (PASS/FAIL per class), age cohort analysis (p-value), remediation options if FAIL |
| M1 | Mechanism | HRIS | [MECH-HRIS] Demographic data extract |
| M2 | Mechanism | Legal AI | [MECH-LEGAL-AI] Statistical computation |

**Definition of Done:** Adverse Impact Analysis Report covers all six protected class categories (age, race, sex, national origin, disability, religion) AND four-fifths rule result is documented as PASS or FAIL for each class AND any FAIL result is accompanied by a documented remediation option (substitute selection, expand pool, or defer RIF) before the RIF list is finalized.

**Cross-Function:** [CROSS-FUNCTION: A13 ↔ A12] Employment law review coordination. Interface: IF-A1-25.

---

#### A13143: Issue WARN Act Notification

**Agent Definition:** Draft and deliver required WARN Act written notices to affected employees, union representatives (if applicable), and state/local government agencies no fewer than 60 calendar days before the first termination effective date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Finalized RIF Selection List | Adverse-impact-cleared list from A13142; termination effective dates |
| I2 | Input | WARN Threshold Determination | From A13141; confirmation that ≥50 employee or 33% threshold is met |
| C1 | Control | WARN Act Notice Requirements | [WARN] 29 U.S.C. §2101; 20 CFR Part 639 — notice must be: in writing; delivered to each affected employee or representative, state dislocated worker unit, and chief elected official of local government; minimum 60 calendar days before first separation |
| C2 | Control | WARN Exceptions | [WARN] §2102(b) — faltering company, unforeseeable business circumstances, or natural disaster exceptions may shorten notice; exception must be documented with specific facts |
| C3 | Control | Employment Law Notice Template | [IF-A1-25] WARN notice template from Legal A12 A125 |
| O1 | Output | WARN Notice Package | Written notices (employee, union if applicable, state agency, local government); certified delivery confirmation records; exception documentation if applicable |
| M1 | Mechanism | Document Management | [MECH-DOC] Notice drafting, version control, and delivery record |
| M2 | Mechanism | HRIS | [MECH-HRIS] Affected employee address and notification data |

**Definition of Done:** WARN Notice Package contains delivery confirmation for 100% of required recipients AND earliest termination effective date is ≥60 calendar days after last notice delivery date (or WARN exception is documented with specific factual basis and stored in MECH-DOC).

**Cross-Function:** [CROSS-FUNCTION: A13 → A12] Uses employment law notice templates. Interface: IF-A1-25.

---

## A1315: Chart Succession Depth

**Function:** Identify the organization's critical roles, assess successor bench strength and readiness for each, and produce a succession risk heatmap to inform talent development and hiring priorities.
**Supreme Constraint:** [ADA] accommodation in succession assessment; [TITLE7] succession pool composition cannot exclude protected classes; [ADEA] readiness assessment cannot penalize employees ≥40

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Authorized Position Register | Critical role candidates from A13132 |
| I2 | Input | 9-Box Calibration Results | From A135 Performance Management (internal A13 tunnel); performance + potential grades |
| I3 | Input | Workforce Capacity Gap Register | Deficit functions from A13122; highest-risk gap areas |
| C1 | Control | Title VII | [TITLE7] succession pool composition cannot systematically exclude protected classes |
| C2 | Control | ADA | [ADA] performance-based succession assessment must accommodate known disabilities |
| C3 | Control | ADEA | [ADEA] 29 U.S.C. §621 — readiness assessment cannot penalize employees ≥40 based on age assumptions |
| O1 | Output | Critical Role Inventory | Roles whose vacancy creates operational risk above threshold |
| O2 | Output | Bench Strength Register | Per-critical-role: successors, readiness grades, assessment date |
| O3 | Output | Succession Risk Heatmap | Function-level heatmap: bench depth score, critical roles with No Successor, risk tier |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Successor readiness data; 9-box inputs |
| M2 | Mechanism | HRIS | [MECH-HRIS] Role and competency data |

**Child Nodes:** A13151, A13152, A13153

---

#### A13151: Identify Critical Role Inventory

**Agent Definition:** Apply the organization's criticality criteria (operational outage risk if vacant >30 days, revenue impact threshold, regulatory license requirement, or single-incumbent knowledge concentration) to the authorized position register and tag all qualifying positions in MECH-HRIS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Authorized Position Register | Output of A13132; all filled positions with role class, function, tenure |
| I2 | Input | Criticality Threshold Definition | Principal-set criteria: vacancy risk threshold, revenue impact floor, regulatory dependency flag |
| C1 | Control | Title VII | [TITLE7] 42 U.S.C. §2000e — criticality designation process cannot systematically exclude roles predominantly occupied by protected classes |
| C2 | Control | ADA | [ADA] criticality is a function attribute, not a person attribute; accommodation status does not affect designation |
| O1 | Output | Critical Role Inventory | HRIS-tagged positions: position ID, role title, function, criticality criteria met (checkboxes), vacancy risk score, incumbent name, tenure |
| M1 | Mechanism | HRIS | [MECH-HRIS] Position data; criticality flag field |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Criteria application and inventory generation |

**Definition of Done:** Critical Role Inventory is tagged in MECH-HRIS for 100% of positions reviewed AND every tagged position has at least one documented criticality criterion AND inventory is validated by Principal sign-off within the annual planning cycle.

---

#### A13152: Assess Successor Bench Strength

**Agent Definition:** For each role in the Critical Role Inventory, identify up to three named internal successors, grade each successor's readiness (Ready Now / 1–2 Years / 2+ Years / No Internal Successor) using 9-box calibration inputs from A135, and record the bench strength in the HRIS succession module.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Critical Role Inventory | Output of A13151; critical positions requiring bench assessment |
| I2 | Input | 9-Box Calibration Results | From A135 Performance Management: performance rating (1–3) × potential rating (1–3) grid; employee placement coordinates |
| C1 | Control | Title VII | [TITLE7] 42 U.S.C. §2000e — successor identification cannot exclude protected classes from high-potential pools |
| C2 | Control | ADEA | [ADEA] 29 U.S.C. §621 — readiness grade cannot be set lower based on age-related assumptions about career horizon or learning velocity |
| O1 | Output | Bench Strength Register | Per critical role: incumbent name, up to 3 successor names, readiness grade per successor, 9-box source data reference, assessment date |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] 9-box calibration data; succession planning module |
| M2 | Mechanism | HRIS | [MECH-HRIS] Succession record storage |

**Definition of Done:** Bench Strength Register contains an entry for 100% of Critical Role Inventory positions AND every entry has at least one readiness grade (including "No Internal Successor" as a valid grade) AND no readiness grade field is blank or marked TBD.

---

#### A13153: Generate Succession Risk Heatmap

**Agent Definition:** Aggregate bench strength data by function to compute a succession risk score per function and produce a visual heatmap assigning each function a risk tier (Red / Amber / Green) based on the proportion of critical roles with no internal successor.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Bench Strength Register | Output of A13152; per-role successor counts and readiness grades |
| I2 | Input | Critical Role Inventory | Output of A13151; total critical roles per function |
| C1 | Control | Succession Risk Thresholds | [ORG-SUCC-POLICY] Principal-set thresholds: Red = ≥33% of critical roles have No Internal Successor; Amber = 15–32%; Green = <15% |
| O1 | Output | Succession Risk Heatmap | Function-level grid: total critical roles, # Ready Now, # No Successor, bench depth score (normalized 0–1), risk tier (Red/Amber/Green) |
| M1 | Mechanism | BI / Reporting | [MECH-BI] Heatmap visualization |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Score aggregation and tier classification |

**Definition of Done:** Succession Risk Heatmap covers 100% of functions with at least one critical role AND every function is assigned exactly one risk tier (Red/Amber/Green) with supporting numeric data AND heatmap is delivered to Principal within 5 business days of Bench Strength Register completion.

---

## A1316: Analyze Organizational Networks

**Function:** Map informal influence and collaboration networks within the organization, detect structural bottlenecks and communication single points of failure, and produce the consolidated workforce analytics dashboard.
**Supreme Constraint:** [NLRA] ONA data collection cannot be used to identify or chill concerted activity; [TITLE7] analytics cannot enable discriminatory workforce decisions

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | HRIS Position and Hierarchy Data | Reporting lines and role metadata from MECH-HRIS |
| I2 | Input | Collaboration Metadata | Aggregated communication/calendar data from MECH-ONA source systems |
| C1 | Control | NLRA Concerted Activity | [NLRA] 29 U.S.C. §151; [STERICYCLE] 372 NLRB No. 113 (2023) — ONA data collection cannot monitor or identify employees engaged in protected concerted activity |
| C2 | Control | Title VII | [TITLE7] network analysis outputs cannot be used as a proxy for protected class selection |
| O1 | Output | Influence Network Map | Centrality scores by employee; broker identification; collaboration heatmap |
| O2 | Output | Bottleneck Risk Report | Over-relied-upon brokers; single-point-of-failure communication nodes; mitigation options |
| O3 | Output | Workforce Analytics Dashboard | Headcount, turnover, capacity utilization, bench depth, org health KPIs in MECH-BI |
| M1 | Mechanism | ONA Platform | [MECH-ONA] Network analysis tool |
| M2 | Mechanism | BI / Reporting | [MECH-BI] Dashboard |
| M3 | Mechanism | HRIS | [MECH-HRIS] Headcount and turnover data |

**Child Nodes:** A13161, A13162, A13163

---

#### A13161: Map Workforce Influence and Collaboration Networks

**Agent Definition:** Ingest aggregated organizational communication and calendar metadata into the ONA platform, compute network centrality metrics (degree, betweenness, eigenvector) for all employees, and produce the Influence Network Map.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Collaboration Metadata | Aggregated (non-content) communication patterns from MECH-ONA: message frequency, meeting co-attendance, collaboration intensity by dyad |
| I2 | Input | HRIS Reporting Hierarchy | Formal org structure from A13111 for overlay on informal network |
| C1 | Control | NLRA Concerted Activity | [NLRA] 29 U.S.C. §151; [STERICYCLE] 372 NLRB No. 113 (2023) — ONA program must be disclosed to employees as an organizational effectiveness tool; cannot be designed to identify protected activity |
| C2 | Control | Title VII | [TITLE7] 42 U.S.C. §2000e — network centrality scores cannot be used as employment selection criteria without validation as a job-related criterion |
| O1 | Output | Network Centrality Report | Per-employee: degree centrality, betweenness centrality, eigenvector centrality; function-level averages; top 10% most central individuals flagged as key influencers |
| M1 | Mechanism | ONA Platform | [MECH-ONA] Worklytics / Microsoft Viva Insights / Cognitive Talent Solutions |

**Definition of Done:** Network Centrality Report contains a centrality score for ≥90% of active employees AND scores are computed using at least two centrality metrics (betweenness + degree at minimum) AND the ONA data collection methodology is documented in MECH-DOC and available for employee disclosure.

---

#### A13162: Detect Network Bottlenecks and Single Points of Failure

**Agent Definition:** Identify employees with betweenness centrality scores >2 standard deviations above the function mean ("brokers"), simulate broker absence scenarios, and produce a Bottleneck Risk Report flagging functions at structural communication risk.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Network Centrality Report | Output of A13161; betweenness centrality by employee and function |
| I2 | Input | Bench Strength Register | Output of A13152; succession depth for high-centrality individuals |
| C1 | Control | NLRA Anti-Retaliation | [NLRA] 29 U.S.C. §151 — broker identification cannot be used punitively or to restructure around §7-active employees |
| C2 | Control | ADA / FMLA Leave | [ADA] [FMLA] broker absence simulation must account for planned accommodation and protected leave separately from unplanned absence |
| O1 | Output | Bottleneck Risk Report | Flagged brokers: function, betweenness Z-score, absence simulation result (critical path impact Y/N), recommended mitigation (cross-training / knowledge transfer / succession acceleration) |
| M1 | Mechanism | ONA Platform | [MECH-ONA] Network simulation |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Mitigation recommendation generation |

**Definition of Done:** Bottleneck Risk Report identifies all individuals with betweenness centrality Z-score >2.0 in their function AND every flagged individual has a documented mitigation action (or explicit Principal notification if no mitigation is currently feasible) AND report is cross-referenced with the Succession Risk Heatmap (A13153) to flag overlap between high-centrality brokers and No-Successor critical roles.

---

#### A13163: Produce Workforce Analytics Dashboard

**Agent Definition:** Aggregate headcount, turnover, capacity utilization, bench depth, and org health metrics into a structured workforce analytics dashboard published to MECH-BI, updated monthly on the payroll close trigger.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Authorized Position Register | Output of A13132; headcount by function and status |
| I2 | Input | Workforce Capacity Gap Register | Output of A13122; surplus/deficit by function |
| I3 | Input | Succession Risk Heatmap | Output of A13153; bench depth tier by function |
| I4 | Input | Bottleneck Risk Report | Output of A13162; broker and structural risk flags |
| I5 | Input | Payroll Roster | From A1333; active employee count, terminations, new hires in period |
| C1 | Control | Internal Reporting Policy | [REPORTING-POLICY] workforce metrics are Principal-confidential; MECH-BI access control required |
| C2 | Control | Pay Equity Reporting | [PAY-EQUITY-STATE] dashboard must include median pay by protected class where jurisdiction requires |
| O1 | Output | Workforce Analytics Dashboard | MECH-BI dashboard: headcount by function (actual vs. authorized), voluntary/involuntary turnover rate (annualized), capacity utilization %, bench depth by function (Green/Amber/Red), open requisition count and aging, avg. time-to-fill |
| M1 | Mechanism | BI / Reporting | [MECH-BI] Dashboard publication |
| M2 | Mechanism | HRIS | [MECH-HRIS] Data source |

**Definition of Done:** Workforce Analytics Dashboard is published to MECH-BI within 5 business days of monthly payroll close AND all 6 required metric categories are present (headcount, turnover, capacity utilization, bench depth, open requisitions, pay equity summary) AND access control restricts view to Principal and authorized agent roles.

**Cross-Function:** [CROSS-FUNCTION: A13 ↔ A1333] Monthly payroll close triggers dashboard refresh.

---

## Boundary Arrow Correspondence (A131 → Parent A13)

| A131 Output | Routes To | Notes |
|---|---|---|
| O1: Workforce Architecture Plan | IF-A1-04 (A13 → A14/A2/A3); A132 input | Org topology and position model consumed by Talent Acquisition and downstream functions |
| O2: HRIS Position Data Model | A13 internal; A132 and A133 input | Canonical schema; consumed by all A13 sub-functions |
| O3: Succession Depth Report | Principal (judgment layer) | Management information; not an operational artifact |
| O4: Workforce Analytics Package | Principal (judgment layer) | Dashboard and ONA output; management information |

*The Authorized Headcount Register flows from A131 to A132 as an internal A13 tunnel. It does not cross the A13 boundary and does not require an IF-A1-XX designation.*

---

## Leaf Node Count Verification

| L4 Node | Leaf Nodes |
|---|---|
| A1311: Design Organizational Architecture | A13111, A13112, A13113 = 3 |
| A1312: Model Headcount Requirements | A13121, A13122, A13123 = 3 |
| A1313: Govern HRIS Position Data Model | A13131, A13132, A13133 = 3 |
| A1314: Plan and Execute Workforce Reduction | A13141, A13142, A13143 = 3 |
| A1315: Chart Succession Depth | A13151, A13152, A13153 = 3 |
| A1316: Analyze Organizational Networks | A13161, A13162, A13163 = 3 |
| **Total** | **18** |
