---
node: A116
name: Test Controls and Produce Audit Evidence
sprint: SPR-010
status: Draft
date: 2026-03-12
---

# Skill: A116 — Test Controls and Produce Audit Evidence

## ICOM

| Element | Content |
|---|---|
| **Input** | Financial reporting risk register; process narratives; prior-year audit workpapers; general ledger trial balance; loss run data by accident year |
| **Control** | COSO-ICFR (COSO Internal Control — Integrated Framework); PCAOB-AS2201 (AS 2201 Auditing Standard — SOX 404); SEC-SOX (Sarbanes-Oxley Act §302, §404); MATH-LDF (Loss Development Factors); GAAP-ASC450 (ASC 450 Contingencies — reserve adequacy) |
| **Output** | Internal control framework documentation; SOX 404 testing results; external audit evidence package; investigation findings reports; actuarial loss reserve report; internal audit reports with remediation tracking |
| **Mechanism** | MECH-ERP (Enterprise Resource Planning System); MECH-GRC (GRC Platform — Workiva, Galvanize, AuditBoard); MECH-ACTUARIAL (Actuarial Loss Modeling Software — ResQ, Milliman Arius, ICRFS); MECH-CAO (Chief Architecture Officer); MECH-CFO (Chief Financial Officer) |

---

## Decomposition

### A1161 — Design and Document Internal Control Framework

**Purpose:** Establish the enterprise COSO-based internal control structure by mapping financial reporting risks to control objectives, documenting control activities, and assigning ownership with a testing calendar.

**ICOM**

| Element | Content |
|---|---|
| Input | Financial reporting process inventory; prior risk assessments; organizational chart |
| Control | COSO-ICFR; SEC-SOX §404; PCAOB-AS2201 |
| Output | Risk-control matrix (RCM); process narratives; control owner assignments; annual testing calendar |
| Mechanism | MECH-GRC; MECH-CFO; MECH-CAO |

#### Leaf Nodes

**A11611 — Map Financial Reporting Risks to COSO Control Objectives**

| ICOM | Content |
|---|---|
| Input | Financial reporting process inventory; prior-year material weakness disclosures |
| Control | COSO-ICFR (five components: Control Environment, Risk Assessment, Control Activities, Information & Communication, Monitoring) |
| Output | Risk-control matrix with COSO component mapping and risk severity rating |
| Mechanism | MECH-GRC; MECH-CFO |

**Binary Definition of Done:**
- ✓ Risk-control matrix is produced with every financial reporting process mapped to at least one COSO component.
- ✓ Every risk entry has a severity rating (High/Medium/Low).
- ✓ Zero financial reporting processes appear without a corresponding control objective.

---

**A11612 — Document Process Narratives and Control Activities for Each Risk**

| ICOM | Content |
|---|---|
| Input | Risk-control matrix; process walkthroughs with control owners |
| Control | PCAOB-AS2201 (design effectiveness criteria); SEC-SOX §404 |
| Output | Process narratives with embedded control descriptions; control design effectiveness assessment |
| Mechanism | MECH-GRC; MECH-CFO |

**Binary Definition of Done:**
- ✓ Process narrative exists for every control in the risk-control matrix.
- ✓ Each narrative contains an embedded control description with a design effectiveness assessment (Effective/Ineffective).
- ✓ Zero controls appear in the RCM without a corresponding narrative.

---

**A11613 — Assign Control Owners and Establish Testing Calendar**

| ICOM | Content |
|---|---|
| Input | Risk-control matrix; process narratives; organizational chart |
| Control | SEC-SOX §404; [AUDIT-CHARTER] |
| Output | Control owner register; annual SOX testing calendar with milestones and deadlines |
| Mechanism | MECH-GRC; MECH-CFO; MECH-CAO |

**Binary Definition of Done:**
- ✓ Every control in the risk-control matrix has an assigned owner (name and title).
- ✓ Annual SOX testing calendar is produced with milestone dates and deadlines for all controls.
- ✓ Control owner register is loaded into MECH-GRC with all required fields populated.

---

### A1162 — Execute SOX 404 Control Testing Program

**Purpose:** Select control samples, obtain and evaluate evidence of operating effectiveness per PCAOB AS 2201, and escalate identified deficiencies to the Principal.

**ICOM**

| Element | Content |
|---|---|
| Input | Risk-control matrix; testing calendar; control owner register; prior-year deficiency log |
| Control | PCAOB-AS2201; SEC-SOX §404; GAAP-ASC270 (interim period reporting) |
| Output | Control testing workpapers; deficiency log with severity classification; management remediation plans |
| Mechanism | MECH-GRC; MECH-CFO; MECH-CAO |

#### Leaf Nodes

**A11621 — Select SOX Control Sample and Obtain Evidence per Testing Plan**

| ICOM | Content |
|---|---|
| Input | Control population data from ERP; testing calendar; sampling guidance |
| Control | PCAOB-AS2201 (sampling methodology); MATH-STAT (statistical sampling) |
| Output | Selected sample with evidence items (screenshots, approvals, system reports) organized in testing workpapers |
| Mechanism | MECH-GRC; MECH-ERP; MECH-CFO |

**Binary Definition of Done:**
- ✓ Sample is selected per PCAOB-AS2201 sampling methodology with sample size documented.
- ✓ Every sampled item has evidence organized in testing workpapers (screenshots, approvals, or system reports attached).
- ✓ Zero sampled items appear in workpapers without supporting evidence.

---

**A11622 — Evaluate Control Design and Test Operating Effectiveness per PCAOB AS 2201**

| ICOM | Content |
|---|---|
| Input | Testing workpapers with collected evidence samples |
| Control | PCAOB-AS2201 (design vs. operating effectiveness distinction); SEC-SOX §404 |
| Output | Control effectiveness conclusions; deficiency log with classification (control deficiency, significant deficiency, material weakness) |
| Mechanism | MECH-GRC; MECH-CFO |

**Binary Definition of Done:**
- ✓ Every tested control has a documented conclusion: Effective or Deficient.
- ✓ Every deficient control is classified as control deficiency, significant deficiency, or material weakness per PCAOB-AS2201 criteria.
- ✓ Deficiency log is updated with all findings before workpapers are closed.

---

**A11623 — Escalate Significant Deficiencies and Material Weaknesses to Principal**

| ICOM | Content |
|---|---|
| Input | Deficiency log with severity classifications; management remediation plans |
| Control | SEC-SOX §302 (certification obligations); PCAOB-AS2201; SEC-SOX §404(b) |
| Output | Principal briefing memo with deficiency summary; remediation commitment register; disclosure assessment |
| Mechanism | MECH-CFO; MECH-CAO |

**Binary Definition of Done:**
- ✓ Principal briefing memo lists every significant deficiency and material weakness with a severity classification.
- ✓ Remediation commitment register is created with owner, target date, and action description for each finding.
- ✓ Disclosure assessment is documented: either "no disclosure required" or a draft disclosure is attached.

---

### A1163 — Prepare and Deliver External Audit Evidence Package

**Purpose:** Compile the Prepared-by-Client (PBC) list, deliver organized audit evidence to external auditors, respond to information requests, and accept audit adjustments through the management representation letter.

**ICOM**

| Element | Content |
|---|---|
| Input | Audited financial statements (draft); PBC request list from external auditors; SOX testing workpapers |
| Control | SEC-SOX §302 (management certification); GAAP-ASC855 (subsequent events); external audit engagement letter |
| Output | PBC evidence package; auditor information request responses; management representation letter; accepted audit adjustments |
| Mechanism | MECH-GRC; MECH-ERP; MECH-CFO |

#### Leaf Nodes

**A11631 — Prepare PBC List and Deliver Opening Materials to External Auditors**

| ICOM | Content |
|---|---|
| Input | Prior-year PBC list; trial balance; audit scope letter from external auditors |
| Control | External audit engagement letter; GAAP-ASC250 (accounting changes) |
| Output | Completed PBC package uploaded to secure auditor portal; opening meeting materials |
| Mechanism | MECH-ERP; MECH-GRC; MECH-CFO |

**Binary Definition of Done:**
- ✓ Completed PBC package is uploaded to the secure auditor portal before the auditor opening meeting.
- ✓ Opening meeting materials are delivered on the agreed date.
- ✓ PBC upload confirmation receipt is logged in MECH-GRC.

---

**A11632 — Respond to Auditor Information Requests Within Agreed Timeline**

| ICOM | Content |
|---|---|
| Input | Auditor data request list (IDR); underlying accounting records; policy documentation |
| Control | External audit engagement letter (response SLAs); SEC-SOX §302 |
| Output | Responded IDR log with evidence attached; open request tracker |
| Mechanism | MECH-GRC; MECH-ERP; MECH-CFO |

**Binary Definition of Done:**
- ✓ Every IDR item has a response logged in the IDR tracker with evidence attached or a documented status reason.
- ✓ No IDR item is overdue past the engagement-letter SLA without a documented extension agreement.
- ✓ Open request tracker reflects current status for all outstanding items as of the response date.

---

**A11633 — Review and Accept Audit Adjustments; Obtain Management Representation Letter**

| ICOM | Content |
|---|---|
| Input | Proposed audit adjusting journal entries; draft management representation letter template |
| Control | SEC-SOX §302; GAAP-ASC855 (subsequent events cutoff) |
| Output | Accepted/rejected audit adjustment log; signed management representation letter |
| Mechanism | MECH-ERP; MECH-CFO; MECH-CAO |

**Binary Definition of Done:**
- ✓ Accepted/rejected determination is documented for every proposed audit adjusting journal entry.
- ✓ Management representation letter is signed by the CEO/CFO-equivalent and delivered to external auditors.
- ✓ Any accepted adjustment is posted to MECH-ERP before final financial statements are issued.

---

### A1164 — Investigate Financial Irregularities and Anomalies

**Purpose:** Detect anomalies through variance and trend analysis, conduct root cause investigations of flagged transactions, and produce findings reports with prioritized remediation recommendations.

**ICOM**

| Element | Content |
|---|---|
| Input | General ledger transaction detail; budget-to-actual variance reports; whistleblower reports; control failure alerts |
| Control | COSO-ICFR (monitoring component); SOX-WB (SOX §301 whistleblower protections); [INVESTIGATION-POLICY] |
| Output | Anomaly detection log; root cause investigation reports; findings report with remediation recommendations |
| Mechanism | MECH-ERP; MECH-GRC; MECH-CFO; MECH-CAO |

#### Leaf Nodes

**A11641 — Detect Financial Anomalies via Variance and Trend Analysis**

| ICOM | Content |
|---|---|
| Input | General ledger transaction detail; prior-period comparatives; budget-to-actual reports |
| Control | COSO-ICFR (monitoring activities); MATH-STAT (outlier detection thresholds) |
| Output | Anomaly detection log with flagged transactions ranked by materiality and pattern type |
| Mechanism | MECH-ERP; MECH-GRC; MECH-CFO |

**Binary Definition of Done:**
- ✓ Anomaly detection log is produced covering 100% of GL accounts for the review period.
- ✓ Every flagged item has a materiality ranking and pattern type classification.
- ✓ Detection log is delivered within 5 business days of period-end actuals lock.

---

**A11642 — Conduct Root Cause Investigation of Flagged Transactions**

| ICOM | Content |
|---|---|
| Input | Anomaly detection log; source documents (invoices, approvals, system logs) for flagged items |
| Control | COSO-ICFR; SOX-WB §301; [INVESTIGATION-POLICY] |
| Output | Root cause determination for each flagged item; evidence file; escalation decision |
| Mechanism | MECH-GRC; MECH-CFO; MECH-CAO |

**Binary Definition of Done:**
- ✓ Root cause determination is documented for every flagged item in the anomaly detection log.
- ✓ Evidence file exists for each investigated item with source documents attached.
- ✓ Escalation decision (escalate / no further action) is recorded for every item before investigation is closed.

---

**A11643 — Produce Findings Report with Prioritized Remediation Recommendations**

| ICOM | Content |
|---|---|
| Input | Root cause determinations; evidence files; escalation decisions |
| Control | COSO-ICFR; [IIA-STANDARDS] |
| Output | Findings report with risk-rated issues, root cause summary, and prioritized remediation action plan |
| Mechanism | MECH-GRC; MECH-CFO; MECH-CAO |

**Binary Definition of Done:**
- ✓ Findings report contains one entry per investigated item with risk rating, root cause, and remediation recommendation.
- ✓ Every High-rated finding has an owner-assigned remediation action with a target date.
- ✓ Report is delivered to the CFO-equivalent within 10 business days of investigation closure.

---

### A1165 — Construct Actuarial Loss Development Triangle

**Purpose:** Compile historical loss data by accident and development year, apply loss development factors to project ultimate losses, and report reserve adequacy versus actuarially projected ultimate loss. *(Mandatory inclusion per Finance skill standard.)*

**ICOM**

| Element | Content |
|---|---|
| Input | Historical loss run data by accident year and development year; prior reserve estimates; claims payment history |
| Control | MATH-LDF (Loss Development Factors — chain-ladder method); GAAP-ASC450 (contingency reserve adequacy); [ASOP-43] |
| Output | Loss development triangle; projected ultimate losses by accident year; reserve adequacy report |
| Mechanism | MECH-ACTUARIAL (ResQ, Milliman Arius, ICRFS); MECH-CFO |

#### Leaf Nodes

**A11651 — Compile Historical Loss Data by Accident Year and Development Year**

| ICOM | Content |
|---|---|
| Input | Claims payment history from insurer loss runs; prior-year development triangles |
| Control | MATH-LDF (data organization convention: accident year rows × development year columns); GAAP-ASC450 |
| Output | Completed loss development triangle matrix with cumulative paid losses by accident year × development age |
| Mechanism | MECH-ACTUARIAL; MECH-ERP; MECH-CFO |

**Binary Definition of Done:**
- ✓ Loss development triangle matrix is complete with cumulative paid losses for every accident year × development age combination in the data set.
- ✓ Zero accident years or development ages in the data set are missing from the triangle.
- ✓ MECH-ACTUARIAL confirms data import with zero reconciliation errors vs. loss run source.

---

**A11652 — Apply Loss Development Factors to Project Ultimate Losses**

| ICOM | Content |
|---|---|
| Input | Loss development triangle; selected LDF factors (volume-weighted, simple average, or judgment-based) |
| Control | MATH-LDF (chain-ladder projection method); [ASOP-43] (property/casualty unpaid claim estimates) |
| Output | Ultimate loss projections by accident year; tail factor selection with documentation |
| Mechanism | MECH-ACTUARIAL; MECH-CFO |

**Binary Definition of Done:**
- ✓ Ultimate loss projections are produced for every accident year in the triangle.
- ✓ Tail factor selection is documented with a written rationale per [ASOP-43].
- ✓ LDF method used (volume-weighted, simple average, or judgment) is documented for each development age.

---

**A11653 — Report Reserve Adequacy vs. Actuarially Projected Ultimate Loss**

| ICOM | Content |
|---|---|
| Input | Ultimate loss projections; current booked reserves from balance sheet |
| Control | GAAP-ASC450 (probable and estimable reserve recognition threshold); MATH-LDF |
| Output | Reserve adequacy report: booked reserve vs. actuarial central estimate with deficiency/(redundancy) by accident year; management recommendation |
| Mechanism | MECH-ACTUARIAL; MECH-ERP; MECH-CFO; MECH-CAO |

**Binary Definition of Done:**
- ✓ Reserve adequacy report shows booked reserve vs. actuarial central estimate for every accident year.
- ✓ Deficiency or redundancy amount is calculated at both the accident year and aggregate level.
- ✓ Management recommendation (strengthen, release, or maintain reserves) is documented with supporting rationale.

---

### A1166 — Issue Internal Audit Reports with Findings Tracking

**Purpose:** Draft internal audit reports with risk ratings and management responses, track remediation commitments to closure with evidence, and escalate overdue items to the Principal.

**ICOM**

| Element | Content |
|---|---|
| Input | Findings reports from A1164; control testing results from A1162; remediation commitment log |
| Control | [IIA-STANDARDS]; COSO-ICFR (monitoring component); [AUDIT-CHARTER] |
| Output | Issued internal audit reports; remediation tracking register with closure evidence; Principal escalation memos for overdue items |
| Mechanism | MECH-GRC; MECH-CFO; MECH-CAO |

#### Leaf Nodes

**A11661 — Draft Internal Audit Report with Risk Rating and Management Response**

| ICOM | Content |
|---|---|
| Input | Findings report (from A11643); control deficiency log (from A11622); management remediation plans |
| Control | [IIA-STANDARDS]; COSO-ICFR |
| Output | Internal audit report: executive summary, risk-rated findings (High/Medium/Low), root cause, management response, target remediation date |
| Mechanism | MECH-GRC; MECH-CFO |

**Binary Definition of Done:**
- ✓ Internal audit report contains: executive summary, risk-rated findings (High/Medium/Low), root cause per finding, management response, and target remediation date.
- ✓ Every finding is rated with a risk classification.
- ✓ Issued report is loaded into MECH-GRC with a report ID and issuance date.

---

**A11662 — Track Remediation Commitments to Closure with Evidence Collection**

| ICOM | Content |
|---|---|
| Input | Issued internal audit reports; management response commitments with target dates |
| Control | [IIA-STANDARDS]; [AUDIT-CHARTER] |
| Output | Remediation tracking register: commitment status (Open/In-Progress/Closed), closure evidence, re-test results |
| Mechanism | MECH-GRC; MECH-CFO |

**Binary Definition of Done:**
- ✓ Remediation tracking register is updated for every open finding with current status (Open/In-Progress/Closed).
- ✓ Every Closed item has closure evidence attached and a re-test result documented.
- ✓ Zero findings are marked Closed without supporting closure evidence.

---

**A11663 — Escalate Overdue Remediation Items to Principal with Risk Impact**

| ICOM | Content |
|---|---|
| Input | Remediation tracking register; overdue items flagged by target date breach |
| Control | [IIA-STANDARDS]; [AUDIT-CHARTER]; COSO-ICFR (monitoring escalation) |
| Output | Principal escalation memo: overdue item list, days past due, residual risk impact, recommended enforcement action |
| Mechanism | MECH-CFO; MECH-CAO |

**Binary Definition of Done:**
- ✓ Principal escalation memo lists every overdue finding with days past due and residual risk impact.
- ✓ Recommended enforcement action is specified for each overdue item.
- ✓ Escalation memo is delivered to the Principal within 2 business days of target date breach.

---

## Leaf Node Summary

| Node | Name | L4 Parent |
|---|---|---|
| A11611 | Map Financial Reporting Risks to COSO Control Objectives | A1161 |
| A11612 | Document Process Narratives and Control Activities for Each Risk | A1161 |
| A11613 | Assign Control Owners and Establish Testing Calendar | A1161 |
| A11621 | Select SOX Control Sample and Obtain Evidence per Testing Plan | A1162 |
| A11622 | Evaluate Control Design and Test Operating Effectiveness per PCAOB AS 2201 | A1162 |
| A11623 | Escalate Significant Deficiencies and Material Weaknesses to Principal | A1162 |
| A11631 | Prepare PBC List and Deliver Opening Materials to External Auditors | A1163 |
| A11632 | Respond to Auditor Information Requests Within Agreed Timeline | A1163 |
| A11633 | Review and Accept Audit Adjustments; Obtain Management Representation Letter | A1163 |
| A11641 | Detect Financial Anomalies via Variance and Trend Analysis | A1164 |
| A11642 | Conduct Root Cause Investigation of Flagged Transactions | A1164 |
| A11643 | Produce Findings Report with Prioritized Remediation Recommendations | A1164 |
| A11651 | Compile Historical Loss Data by Accident Year and Development Year | A1165 |
| A11652 | Apply Loss Development Factors to Project Ultimate Losses | A1165 |
| A11653 | Report Reserve Adequacy vs. Actuarially Projected Ultimate Loss | A1165 |
| A11661 | Draft Internal Audit Report with Risk Rating and Management Response | A1166 |
| A11662 | Track Remediation Commitments to Closure with Evidence Collection | A1166 |
| A11663 | Escalate Overdue Remediation Items to Principal with Risk Impact | A1166 |

**Total leaf nodes: 18** ✓

---

## Mandatory Inclusion Checklist

| Requirement | Node | Status |
|---|---|---|
| Actuarial loss development triangle | A1165 (A11651–A11653) | ✓ |

---

## New Codes Required

### Constraint Codes
| Code | Name | Standard |
|---|---|---|
| `COSO-ICFR` | COSO Internal Control — Integrated Framework | Committee of Sponsoring Organizations, 2013 edition |
| `PCAOB-AS2201` | PCAOB AS 2201 — Auditing ICFR | PCAOB Auditing Standard No. 2201 |
| `MATH-LDF` | Loss Development Factors | Chain-ladder actuarial projection method |

### Mechanism Codes
| Code | Name | Tools |
|---|---|---|
| `MECH-ACTUARIAL` | Actuarial Loss Modeling Software | ResQ, Milliman Arius, ICRFS |
| `MECH-GRC` | GRC Platform | Workiva, Galvanize, AuditBoard |

---

## Cross-Function Interfaces

*No new cross-function interfaces identified. All flows are internal to A11 or already registered.*

- A116 receives deficiency escalations from A1162 → A1163 (internal flow)
- A116 produces findings to Principal (A-0 level) — not a cross-function interface; escalation is a control feedback loop

---

## Audit Status

- [ ] R1.2a check: all box names are active verb phrases (no gerunds)
- [ ] R1.4 check: all L5 outputs are named in parent L4 ICOM
- [ ] R2.1 check: ICOM complete at every level
- [ ] R4.3 check: no upstream internal flows misclassified as registered interfaces
- [ ] Mandatory inclusion: actuarial loss development triangle ✓
- [ ] Leaf count: 18 ✓
- [ ] New codes documented above ✓
