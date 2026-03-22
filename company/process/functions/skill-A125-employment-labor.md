# Skill File: Employment & Labor Law

**Node:** A125
**Parent:** A12 Legal
**Function:** Advise on Employment Obligations and Labor Law Compliance
**Supreme Constraint:** [ADA] 42 U.S.C. §12101 | [TITLE7] 42 U.S.C. §2000e | [NLRA] 29 U.S.C. §151
**Cross-Function Interfaces:** (Inbound: IF-A1-14 from People A13) (Outbound: IF-A1-26 at A12511–A12513 → People A13)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- (A12 Legal mandatory inclusions for A125: all 7 mandatory inclusions distributed across A121–A126; A125 satisfies employment & labor law coverage per domain standard)

---

## Node Tree: A125

```
A125  Advise on Employment Obligations and Labor Law Compliance
├── A1251  Draft and Publish Employment Agreements and Handbook Policies    [→ IF-A1-26]
│   ├── A12511  Draft Offer Letter and Employment Agreement Templates
│   ├── A12512  Publish Employee Handbook Updates with Legal Review
│   └── A12513  Circulate Policy Acknowledgment and Archive Signed Records
├── A1252  Advise on WARN Act and Mass Layoff Legal Compliance
│   ├── A12521  Calculate Affected Employee Count and WARN Act Threshold
│   ├── A12522  Issue WARN Act Notices to Employees, Union, and State Agency
│   └── A12523  Produce Layoff Disparate Impact Analysis and Legal Clearance
├── A1253  Administer ADA Accommodation Interactive Process
│   ├── A12531  Receive Accommodation Request and Open Interactive Process Record
│   ├── A12532  Assess Essential Job Functions and Evaluate Requested Accommodation
│   └── A12533  Issue Accommodation Decision and Document Undue Hardship if Denied
├── A1254  Investigate Employment Complaints and EEO Matters
│   ├── A12541  Receive Complaint, Assign Investigator, and Issue Litigation Hold
│   ├── A12542  Conduct Witness Interviews and Gather Documentary Evidence
│   └── A12543  Produce Investigation Report with Findings and Recommended Remediation
├── A1255  Draft and Enforce Restrictive Covenant Agreements
│   ├── A12551  Draft Non-Compete and NDA with Jurisdiction-Specific Enforceability Analysis
│   ├── A12552  Monitor Departing Employee Obligations and Issue Breach Warning
│   └── A12553  Assess Enforceability Change Triggered by State Law Update
└── A1256  Advise on NLRA Concerted Activity and Labor Relations
    ├── A12561  Classify Employee Activity as NLRA-Protected Concerted Action
    ├── A12562  Review Proposed Policy for Facial NLRA Violation
    └── A12563  Respond to NLRB Charge and Produce Position Statement
```

---

### A125: Advise on Employment Obligations and Labor Law Compliance

**Function:** Advise on Employment Obligations and Labor Law Compliance
**Supreme Constraint:** [ADA] 42 U.S.C. §12101 | [TITLE7] 42 U.S.C. §2000e | [NLRA] 29 U.S.C. §151

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employment Transactions and HR Referrals | Hiring actions, terminations, accommodation requests, complaints, policy drafts; source: People A13 |
| I2 | Input | People A13 Disparate Impact Referrals | RIF population analyses from People A13 (IF-A1-14 inbound) requiring legal review |
| I3 | Input | Competitive Intelligence on State Law Changes | State non-compete law updates, pay equity statute changes, state WARN Act equivalents |
| C1 | Control | Anti-Discrimination Law | [TITLE7] 42 U.S.C. §2000e — race, color, religion, sex, national origin; [ADA] §12101 — disability; [ADEA] 29 U.S.C. §621 — age ≥40 |
| C2 | Control | Labor Relations | [NLRA] 29 U.S.C. §151 — concerted activity rights; §8(a)(1) employer ULP prohibition |
| C3 | Control | Mass Layoff Notification | [WARN] 29 U.S.C. §2101 — 60-day advance notice for qualifying mass layoffs |
| C4 | Control | Accommodation Obligation | [ADA] 42 U.S.C. §12112(b)(5) — reasonable accommodation unless undue hardship |
| O1 | Output | Employment Document Templates | Offer letters, employment agreements, handbook policies (→ IF-A1-26 → People A13) |
| O2 | Output | Legal Clearances and Opinions | WARN notices, accommodation decisions, EEO clearances, NLRA compliance opinions |
| O3 | Output | Restrictive Covenant Agreements | Non-compete, NDA, non-solicitation agreements for departing employees |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] Clio, eCounsel — employment matter tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI |
| M3 | Mechanism | Document Collaboration | [MECH-DOC] Google Workspace, Microsoft 365 — document drafting and archive |

**Child Nodes:** A1251, A1252, A1253, A1254, A1255, A1256

---

#### A1251: Draft and Publish Employment Agreements and Handbook Policies

**Function:** Draft and Publish Employment Agreements and Handbook Policies
**Supreme Constraint:** [NLRA] §7 — handbook policies must not chill concerted activity | [EPA-1963] equal pay provisions

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Role Specifications and Compensation Parameters | Job titles, FLSA classifications, compensation ranges, benefits; source: People A13 |
| I2 | Input | Regulatory Update Flags | New state law requirements (pay transparency, non-compete restrictions); source: A1231 regulatory monitor |
| C1 | Control | At-Will Employment | State-specific at-will employment doctrine; exceptions: public policy, implied contract, covenant of good faith |
| C2 | Control | IP Assignment | [COPY-17] §101 work-for-hire and invention assignment clauses required; state law limits (CA Labor Code §2870 — cannot assign inventions developed on own time with own equipment) |
| O1 | Output | Employment Document Template Library | Offer letter templates, employment agreement templates, IP assignment agreement; published to People A13 (→ IF-A1-26) |
| O2 | Output | Updated Employee Handbook | Policy document with legal review, effective date, and acknowledgment form |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — document drafting |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] Google Workspace — template library and handbook |

**Child Nodes:** A12511, A12512, A12513

---

##### A12511: Draft Offer Letter and Employment Agreement Templates

**Agent Definition:** Draft standard offer letter template and employment agreement template for each employment classification (exempt / non-exempt / contractor), incorporating: at-will clause, compensation terms, FLSA classification, IP assignment, confidentiality, arbitration clause, and governing law; publish to People A13 HRIS offer workflow.

**[CROSS-FUNCTION: A12 → A13]** *Interface: IF-A1-26*

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employment Classification Parameters | FLSA classification (exempt/non-exempt), state of employment, compensation type (salary/hourly/commission), benefits eligibility |
| C1 | Control | At-Will and Classification | State at-will doctrine (exceptions by state); [FLSA-EXEMPT] 29 CFR Part 541 — exempt classification tests; [I9] employment eligibility verification obligation |
| C2 | Control | IP Assignment Scope | [COPY-17] §101 work-for-hire; invention assignment clause must comply with state carve-outs (CA, DE, IL, MN, NC, WA limit over-breadth); [DTSA] §1833(b) — whistleblower immunity notice required in confidentiality agreements |
| O1 | Output | Employment Document Templates | Per-classification offer letter + employment agreement templates with: at_will_clause, compensation_terms, flsa_classification, ip_assignment_clause, confidentiality_clause, dtsa_whistleblower_notice, arbitration_clause, governing_law; published to MECH-HRIS offer workflow |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — template drafting |
| M2 | Mechanism | Human Resource Information System | [MECH-HRIS] Workday HCM, BambooHR — offer workflow template upload |

**Binary Definition of Done:**
- ✓ Templates for each FLSA classification exist in MECH-HRIS offer workflow.
- ✓ Each template contains at_will_clause, ip_assignment_clause, and DTSA §1833(b) whistleblower immunity notice.
- ✓ governing_law is jurisdiction-appropriate.
*(IF-A1-26 output satisfied)*

---

##### A12512: Publish Employee Handbook Updates with Legal Review

**Agent Definition:** Receive proposed handbook policy updates from People A13, conduct legal review for NLRA §7 compliance (policies must not facially prohibit concerted activity), equal employment compliance, and state-specific requirements; obtain CLO approval; publish updated handbook with effective date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed Handbook Policy Drafts | HR-drafted policy language for legal review: {policy_title, policy_text, applicable_jurisdictions, effective_date_requested} |
| C1 | Control | NLRA Policy Review | [NLRA] §8(a)(1) — employer violates NLRA if policy would reasonably tend to chill employees' exercise of §7 rights (Boeing/Stericycle standard — categorize by nature and potential chilling effect) |
| C2 | Control | At-Will Preservation | Handbook disclaimer must state handbook does not create contract of employment and at-will relationship is preserved |
| O1 | Output | Published Employee Handbook Update | Handbook version with: effective_date, CLO_approval_signature, NLRA_compliance_note per policy, at_will_disclaimer, state_addendum (CA, NY, IL, etc. where applicable) |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — NLRA policy review |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] — handbook version control |

**Binary Definition of Done:**
- ✓ Published handbook version has CLO_approval_signature.
- ✓ Every policy includes NLRA_compliance_note (compliant/compliant-with-modification/removed).
- ✓ at_will_disclaimer is present on page 1.
- ✓ effective_date is populated.

---

##### A12513: Circulate Policy Acknowledgment and Archive Signed Records

**Agent Definition:** Upon handbook publication, generate acknowledgment form via MECH-HRIS for all active employees, collect electronic signatures within 30 days, and archive signed acknowledgments in each employee's MECH-HRIS record; flag employees who have not signed by deadline for People A13 follow-up.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Published Handbook Version | A12512 output — effective handbook version with acknowledgment form attached |
| C1 | Control | Acknowledgment Evidentiary Value | Signed acknowledgment establishes employee received notice of policies; required for enforcement of arbitration clause and confidentiality obligations |
| O1 | Output | Signed Acknowledgment Archive | MECH-HRIS employee record showing: handbook_version_acknowledged, acknowledgment_signature_date, electronic_signature_id per employee; unsigned employees flagged |
| M1 | Mechanism | Human Resource Information System | [MECH-HRIS] Workday HCM, BambooHR — acknowledgment workflow and record |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign API — electronic acknowledgment |

**Binary Definition of Done:**
- ✓ MECH-HRIS shows acknowledgment records for ≥95% of active employees within 30 days of handbook publication.
- ✓ Each record contains handbook_version_acknowledged and acknowledgment_signature_date.
- ✓ Unsigned employees (>30 days) are flagged in MECH-HRIS for People A13 follow-up.

---

#### A1252: Advise on WARN Act and Mass Layoff Legal Compliance

**Function:** Advise on WARN Act and Mass Layoff Legal Compliance
**Supreme Constraint:** [WARN] 29 U.S.C. §2101 — 60-day advance notice requirement

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Proposed RIF Population | List of employees proposed for termination with job titles, departments, work locations, dates; source: People A13 |
| I2 | Input | RIF Disparate Impact Analysis | People A13 (IF-A1-14 inbound) — disparate impact data requiring legal clearance before proceeding |
| C1 | Control | WARN Act Threshold | [WARN] 29 U.S.C. §2101 — employer with ≥100 employees (FTE, excl. part-time <20 hrs/wk or <6 months tenure) must give 60-day written notice to: (a) each affected worker, (b) union representative, (c) state dislocated worker unit, (d) chief local elected official |
| O1 | Output | WARN Act Compliance Determination | Written analysis: WARN required (Y/N), employee count, notice recipients, notice deadline, exceptions analysis (faltering company, unforeseen business circumstances, natural disaster) |
| O2 | Output | Issued WARN Notices | Written notices meeting statutory content requirements |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — WARN threshold and notice drafting |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — WARN compliance record |

**Child Nodes:** A12521, A12522, A12523

---

##### A12521: Calculate Affected Employee Count and WARN Act Threshold

**Agent Definition:** Receive proposed RIF population from People A13, calculate the number of affected employees meeting WARN Act counting rules (excluding part-time employees with <20 hrs/week or <6 months tenure), apply the three WARN triggering formulas (50+ employees at a single site, 33% threshold, 500+ at any site), and produce a WARN Threshold Determination.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed RIF Population | Employee list: {employee_id, hours_per_week, tenure_months, work_site_location, termination_date} |
| C1 | Control | WARN Counting Rules | [WARN] 29 U.S.C. §2101(a)(5) — "employment loss" includes termination (not for cause), layoff >6 months, hours reduction >50%; §2101(a)(8) — exclude part-time employees (<20 hrs/wk or <6 months service); 90-day aggregation rule applies |
| O1 | Output | WARN Threshold Determination | Analysis memo: affected_employee_count (WARN-counted), total_employees_at_site, triggering_formula_met (Y/N per formula), warn_required (Y/N), applicable_exception (if any), notice_deadline (if WARN required) |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — WARN calculation |
| M2 | Mechanism | Human Resource Information System | [MECH-HRIS] — employee data query |

**Binary Definition of Done:**
- ✓ Determination memo documents affected_employee_count with WARN exclusions applied.
- ✓ All 3 triggering formulas are evaluated.
- ✓ If warn_required = Y, notice_deadline (today + 60 calendar days) is calculated.
- ✓ Analysis is completed before any RIF notifications are issued to employees.

---

##### A12522: Issue WARN Act Notices to Employees, Union, and State Agency

**Agent Definition:** For RIF where WARN is required, draft WARN notices containing all statutory required content (employer name, address, date of layoff, whether termination is permanent or temporary, whether bumping rights exist, name/address of union representative or applicable parties), and transmit to: (a) each affected employee by certified mail, (b) union representative (if applicable), (c) state dislocated worker unit, (d) chief local elected official.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | WARN Threshold Determination | A12521 output confirming warn_required = Y with affected employee list and notice_deadline |
| C1 | Control | WARN Notice Content | [WARN] 29 U.S.C. §2102 — notice must contain: employer name, address, name of company official to contact, statement of whether layoff is temporary or permanent, expected date of layoff, whether bumping rights exist, name/address of union (or, for non-union: employee name, job title, social security # last 4) |
| O1 | Output | WARN Notice Transmission Records | Certified mail receipts for each employee + union rep; written submissions to state dislocated worker unit and chief elected official; all transmitted before notice_deadline |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — WARN notice log |

**Binary Definition of Done:**
- ✓ Certified mail receipt exists for every affected employee.
- ✓ State dislocated worker unit submission_date ≤ notice_deadline.
- ✓ Chief elected official submission_date ≤ notice_deadline.
- ✓ MECH-MATTER WARN compliance record is complete.

---

##### A12523: Produce Layoff Disparate Impact Analysis and Legal Clearance

**Agent Definition:** Receive disparate impact analysis from People A13 (IF-A1-14), review selection methodology for protected class adverse impact (4/5ths rule and chi-square test), assess WARN Act compliance, and issue written Legal Clearance (proceed / hold pending remediation) before any termination notices are issued.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | RIF Disparate Impact Analysis | IF-A1-14 inbound from People A13: proposed population, selection rates by protected class, 4/5ths ratio, chi-square p-value, adverse impact flags, WARN threshold assessment |
| C1 | Control | Disparate Impact Standard | [TITLE7] 42 U.S.C. §2000e-2(k) — disparate impact theory; 4/5ths (80%) rule: adverse impact if selection rate for protected class < 80% of highest group's rate; chi-square p < 0.05 indicates statistical significance |
| C2 | Control | ADEA Layoff Requirements | [ADEA] 29 U.S.C. §626(f) — older workers targeted in group RIF must receive OWBPA-compliant waiver with decisional unit data (ages of selected/non-selected), 45-day review period, 7-day revocation |
| O1 | Output | RIF Legal Clearance | Written determination: {disparate_impact_finding (adverse_impact/no_adverse_impact), adverse_impact_classes[], legal_clearance_status (CLEAR/HOLD), hold_reason (if applicable), owbpa_waiver_required (Y/N)} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — disparate impact legal analysis |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — RIF legal clearance record |

**Binary Definition of Done:**
- ✓ Legal clearance memo documents 4/5ths calculation for each protected class.
- ✓ If adverse_impact found, legal_clearance_status = HOLD.
- ✓ No termination notices are issued while status = HOLD.
- ✓ owbpa_waiver_required determination is documented.

---

#### A1253: Administer ADA Accommodation Interactive Process

**Function:** Administer ADA Accommodation Interactive Process
**Supreme Constraint:** [ADA] 42 U.S.C. §12112(b)(5) — reasonable accommodation obligation | EEOC Guidance on Reasonable Accommodation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Accommodation Request | Employee or applicant notice of disability-related limitation and request for adjustment |
| I2 | Input | Job Description and Essential Functions | Current job description with essential functions documented; source: People A13 |
| C1 | Control | Accommodation Obligation | [ADA] §12112(b)(5)(A) — employer must provide reasonable accommodation unless it imposes undue hardship; interactive process required |
| C2 | Control | Interactive Process Requirement | EEOC Enforcement Guidance on Reasonable Accommodation (2002) — both parties must engage in good faith dialogue; abandonment by either party shifts liability |
| O1 | Output | Accommodation Decision | Written decision: approved accommodation, or undue hardship denial with documented analysis |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — accommodation matter file |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — accommodation analysis |

**Child Nodes:** A12531, A12532, A12533

---

##### A12531: Receive Accommodation Request and Open Interactive Process Record

**Agent Definition:** Receive employee accommodation request (written, verbal, or conduct-based notice of limitation), open an interactive process matter record in MECH-MATTER, send written acknowledgment to employee within 5 business days, and request medical documentation if disability or limitation is not apparent.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Accommodation Request | Employee communication indicating a physical or mental impairment limiting a major life activity and requesting a workplace adjustment |
| C1 | Control | Notice Trigger | [ADA] §12102 — "disability" = physical or mental impairment substantially limiting ≥1 major life activity; employer has duty to engage interactive process once on notice, even if request is informal |
| O1 | Output | Interactive Process Matter Record | MECH-MATTER record: {employee_id, request_date, limitation_description, accommodation_requested, medical_documentation_requested (Y/N), acknowledgment_sent_date} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — accommodation matter file creation |

**Binary Definition of Done:**
- ✓ MECH-MATTER matter record created within 5 business days of request receipt.
- ✓ acknowledgment_sent_date is populated.
- ✓ medical_documentation_requested flag is set where limitation is not apparent.

---

##### A12532: Assess Essential Job Functions and Evaluate Requested Accommodation

**Agent Definition:** Review the job description essential functions (from People A13), evaluate the employee's documented limitations against each essential function, identify the range of possible accommodations (modified schedule, equipment, remote work, reassignment), and produce an Accommodation Feasibility Analysis.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Job Description and Medical Documentation | Essential functions list from People A13; medical provider documentation of functional limitations and recommended restrictions |
| C1 | Control | Essential Function Standard | [ADA] §12111(8) — essential function: fundamental duties of the position; factors: employer's judgment, written job description, amount of time spent; accommodation need not eliminate essential function |
| O1 | Output | Accommodation Feasibility Analysis | MECH-MATTER record: {essential_functions_list[], limitation_impact_per_function[], accommodation_options[] (each with: type, feasibility, cost_estimate, direct_threat_flag), recommended_accommodation} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — accommodation analysis |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — feasibility analysis record |

**Binary Definition of Done:**
- ✓ Feasibility analysis documents impact of limitation on each essential function.
- ✓ ≥2 accommodation_options are evaluated.
- ✓ direct_threat_flag is set where applicable.
- ✓ recommended_accommodation is identified.

---

##### A12533: Issue Accommodation Decision and Document Undue Hardship if Denied

**Agent Definition:** Based on the Feasibility Analysis, issue a written accommodation decision (APPROVED with specific accommodation / DENIED with undue hardship analysis / ALTERNATIVE OFFERED); if denied, document the undue hardship analysis (cost, nature of business, financial resources, type of operations) in writing to the employee.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Accommodation Feasibility Analysis | A12532 output with recommended accommodation or undue hardship indicators |
| C1 | Control | Undue Hardship Standard | [ADA] §12111(10) — undue hardship: significant difficulty or expense considering: nature/cost of accommodation, employer's financial resources, type of operations; high bar — most accommodations are not undue hardship |
| O1 | Output | Written Accommodation Decision | MECH-MATTER decision record: {decision (APPROVED/DENIED/ALTERNATIVE_OFFERED), approved_accommodation (if applicable), undue_hardship_analysis (if denied), alternative_accommodation (if offered), decision_date} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — accommodation decision record |

**Binary Definition of Done:**
- ✓ Written accommodation decision is in MECH-MATTER with decision_date.
- ✓ If DENIED, undue_hardship_analysis documents all 4 statutory factors.
- ✓ Decision is transmitted to employee within 5 business days of feasibility analysis completion.

---

#### A1254: Investigate Employment Complaints and EEO Matters

**Function:** Investigate Employment Complaints and EEO Matters
**Supreme Constraint:** [TITLE7] 42 U.S.C. §2000e | [ADEA] 29 U.S.C. §621 | [ADA] 42 U.S.C. §12101

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employment Complaint | Written or verbal complaint of discrimination, harassment, retaliation, or hostile work environment; source: employee, HR, or anonymous report |
| C1 | Control | Investigation Obligation | [TITLE7] — employer liability for supervisor harassment (Faragher-Ellerth defense requires prompt investigation); §704 — retaliation protection; EEOC investigation may follow if charge filed |
| O1 | Output | Investigation Report | Factual findings, credibility determinations, conclusions, and remedial recommendations |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — investigation file |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — findings analysis |

**Child Nodes:** A12541, A12542, A12543

---

##### A12541: Receive Complaint, Assign Investigator, and Issue Litigation Hold

**Agent Definition:** Receive employment complaint, open a matter record in MECH-MATTER, assign an independent investigator (internal HR or external counsel depending on severity and seniority of accused), issue a litigation hold notice to all relevant custodians via A1261, and notify the complainant of the investigation process within 5 business days.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employment Complaint | Complaint narrative: complainant identity, accused identity, alleged conduct, dates, witnesses, supporting documents |
| C1 | Control | Prompt Response Obligation | [TITLE7] — Faragher-Ellerth defense requires employer to exercise reasonable care to prevent and promptly correct harassment; prompt investigation is required element |
| O1 | Output | Matter Record with Investigator Assignment | MECH-MATTER record: {matter_id, complaint_date, complainant_id, accused_id (if applicable), alleged_conduct_type, assigned_investigator, litigation_hold_issued (Y/N), complainant_notified_date} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — matter file creation |

**Binary Definition of Done:**
- ✓ MECH-MATTER matter_id created within 2 business days of complaint receipt.
- ✓ assigned_investigator is identified.
- ✓ litigation_hold_issued = Y (coordinated with A12611).
- ✓ complainant_notified_date ≤ 5 business days from complaint receipt.

---

##### A12542: Conduct Witness Interviews and Gather Documentary Evidence

**Agent Definition:** Interview complainant, accused, and all identified witnesses using open-ended questions; collect and preserve relevant documents (emails, messages, performance records, attendance records); maintain interview summaries with verbatim key statements; and store all evidence in the MECH-MATTER investigation file with chain-of-custody documentation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Matter Record with Investigator Assignment | A12541 output — matter file with parties, alleged conduct, and initial evidence list |
| C1 | Control | Confidentiality and Anti-Retaliation | [TITLE7] §704 — retaliation against complainant or witnesses is prohibited; investigations should be conducted confidentially to the extent practicable |
| O1 | Output | Investigation Evidence File | MECH-MATTER records: interview_summaries[] (interviewer, witness, date, key_statements), documents_collected[], chain_of_custody_log[] |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — evidence collection and chain-of-custody |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — interview question preparation and summary drafting |

**Binary Definition of Done:**
- ✓ MECH-MATTER contains interview summaries for complainant, accused, and all named witnesses.
- ✓ Each summary has interviewer, date, and key_statements fields.
- ✓ chain_of_custody_log covers all collected documents.

---

##### A12543: Produce Investigation Report with Findings and Recommended Remediation

**Agent Definition:** Synthesize interview summaries and documentary evidence into a written Investigation Report containing: factual findings per allegation (supported/not supported/inconclusive), credibility determinations with rationale, legal conclusions (policy violation or legal violation), and recommended remedial actions; transmit to CLO and CHRO (People A13 equivalent) for implementation decision.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Investigation Evidence File | A12542 output — complete interview summaries and documentary evidence |
| C1 | Control | Faragher-Ellerth Standard | [TITLE7] — investigation report establishes the affirmative defense element of "prompt corrective action"; report must support proportionate remediation |
| O1 | Output | Investigation Report | MECH-MATTER report: {matter_id, report_date, allegations_investigated[], per_allegation_finding (supported/not_supported/inconclusive), credibility_determinations[], legal_conclusion, recommended_remediation[], confidentiality_level} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — findings synthesis and report drafting |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — investigation report filing |

**Binary Definition of Done:**
- ✓ Report contains per_allegation_finding for every allegation.
- ✓ credibility_determinations provide rationale.
- ✓ recommended_remediation is proportionate to legal_conclusion.
- ✓ Report is transmitted to CLO and CHRO within 30 days of investigation initiation.

---

#### A1255: Draft and Enforce Restrictive Covenant Agreements

**Function:** Draft and Enforce Restrictive Covenant Agreements
**Supreme Constraint:** State contract law — enforceability varies by jurisdiction; FTC Non-Compete Rule (if effective)

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employee Role and Access Profile | Seniority level, access to trade secrets and customer relationships, states of employment |
| I2 | Input | Departing Employee Notice | Employee resignation or termination triggering review of post-employment obligations |
| C1 | Control | Enforceability Standard | State-specific: CA Business & Professions Code §16600 — non-competes void (with narrow exceptions); NC G.S. §75-4 — non-competes enforceable if reasonable in scope, time, territory, and supported by adequate consideration |
| O1 | Output | Restrictive Covenant Agreements | Jurisdiction-appropriate non-compete, NDA, and non-solicitation agreements |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — enforceability analysis and drafting |
| M2 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — restrictive covenant tracking |

**Child Nodes:** A12551, A12552, A12553

---

##### A12551: Draft Non-Compete and NDA with Jurisdiction-Specific Enforceability Analysis

**Agent Definition:** For each new hire or promotion accessing trade secrets or key customer relationships, draft tailored non-compete, NDA, and non-solicitation agreements incorporating: duration (≤12 months preferred), geographic scope tied to actual business operations, legitimate business interest basis, and jurisdiction-specific enforceability analysis.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employee Profile | State of employment, seniority, access to trade secrets or key accounts, proposed restriction scope |
| C1 | Control | Enforceability Requirements | State-specific non-compete law: NC G.S. §75-4 (reasonable time/territory/scope/consideration); CA B&P §16600 (void); TX Bus. & Com. Code §15.50 (enforceable with adequate consideration and reasonable limits); FTC Non-Compete Rule (if effective) |
| C2 | Control | Trade Secret Nexus | [DTSA] §1833(b) — whistleblower immunity notice required in agreements referencing trade secrets |
| O1 | Output | Restrictive Covenant Agreement | Jurisdiction-appropriate agreement: non_compete_duration, geographic_scope, protected_activities, adequate_consideration, dtsa_whistleblower_notice, governing_law, blue_pencil_clause |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — jurisdiction analysis and drafting |
| M2 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — agreement template |

**Binary Definition of Done:**
- ✓ Agreement contains non_compete_duration and geographic_scope.
- ✓ governing_law is the employment state.
- ✓ DTSA whistleblower immunity notice is present.
- ✓ blue_pencil clause is included for states permitting reformation.

---

##### A12552: Monitor Departing Employee Obligations and Issue Breach Warning

**Agent Definition:** Upon employee departure, retrieve all restrictive covenant agreements from MECH-CLM, transmit a departure reminder letter to the employee confirming post-employment obligations, monitor publicly available sources for potential covenant violations for 6 months, and issue a written breach warning within 10 days of confirmed violation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Departing Employee Record | Employee ID, departure date, role, restrictive covenant agreement IDs from MECH-CLM |
| C1 | Control | Injunctive Relief Availability | State-specific temporary restraining order (TRO) and preliminary injunction standard; irreparable harm required; delay in enforcement weakens injunction case |
| O1 | Output | Departure Reminder Letter | Written letter to departing employee: {departure_date, covenant_obligations_summary, confidential_information_return_demand, duration_end_date, governing_law} |
| O2 | Output | Breach Warning Letter (if violation identified) | Written demand to cease violation with: specific conduct identified, contract provision violated, demand to cure within 10 business days, reservation of right to seek injunctive relief |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — covenant tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — breach analysis and letter drafting |

**Binary Definition of Done:**
- ✓ Departure reminder letter transmitted to departing employee within 5 business days of departure.
- ✓ If violation identified, breach warning transmitted within 10 days of identification.
- ✓ MECH-CLM monitoring record is active for 6 months post-departure.

---

##### A12553: Assess Enforceability Change Triggered by State Law Update

**Agent Definition:** Upon state non-compete law change (new legislation or significant case law), analyze impact on existing restrictive covenant agreements in MECH-CLM for employees in the affected state, flag agreements requiring amendment or termination, and notify People A13 of hiring restrictions in the affected state.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | State Law Change Notice | Regulatory change notification from A12312: new state non-compete statute or significant appellate decision |
| I2 | Input | Active Restrictive Covenant Portfolio | MECH-CLM query: all active non-compete agreements with {employee_id, governing_law_state, duration_end_date, scope} |
| C1 | Control | Changed Circumstance | State law changes may render existing agreements void or unenforceable prospectively; employer must assess retroactive and prospective impact |
| O1 | Output | Enforceability Impact Assessment | MECH-MATTER memo: {state, law_change_summary, agreements_affected_count, required_action per agreement (void/amend/retain), hiring_restriction_notice_to_a13} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — enforceability impact analysis |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — impact assessment record |

**Binary Definition of Done:**
- ✓ Assessment covers 100% of active agreements with governing_law_state = affected state.
- ✓ required_action is specified per agreement.
- ✓ People A13 receives hiring_restriction_notice_to_a13 within 5 business days of law change effective date.

---

#### A1256: Advise on NLRA Concerted Activity and Labor Relations

**Function:** Advise on NLRA Concerted Activity and Labor Relations
**Supreme Constraint:** [NLRA] 29 U.S.C. §151 — §7 rights; §8(a)(1) employer ULP prohibition

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employee Conduct or Policy Reports | Reports of employee activities, proposed handbook policies, communications that may implicate NLRA |
| I2 | Input | NLRB Charge Notices | Formal NLRB unfair labor practice charge served on employer |
| C1 | Control | Section 7 Rights | [NLRA] §7 — employees have right to self-organize, form/join/assist labor organizations, bargain collectively, engage in concerted activities for mutual aid and protection |
| C2 | Control | Employer ULP Prohibition | [NLRA] §8(a)(1) — ULP to interfere with, restrain, or coerce employees in exercise of §7 rights |
| O1 | Output | NLRA Compliance Opinions | Written legal opinions on policy compliance, activity classification, and NLRB response |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — NLRA matter file |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — NLRA analysis |

**Child Nodes:** A12561, A12562, A12563

---

##### A12561: Classify Employee Activity as NLRA-Protected Concerted Action

**Agent Definition:** Receive report of employee activity (group complaint, social media post about working conditions, walkout, petition), apply the NLRA concerted activity test (activity must be: (a) concerted — with or on behalf of other employees, and (b) for mutual aid or protection), and produce a written NLRA Protection Classification.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employee Activity Report | Description of employee conduct: activity type, participants count, subject matter (wages/hours/conditions), method (in-person/social media/email) |
| C1 | Control | Concerted Activity Standard | [NLRA] §7 — "concerted activity" includes: group complaints, individual action seeking to initiate or induce group action, activity on behalf of others; must be for "mutual aid or protection" (wages, hours, working conditions); protected even if disloyal unless malicious/reckless falsehoods |
| O1 | Output | NLRA Protection Classification | Written memo: {activity_description, concerted_flag (Y/N), mutual_aid_flag (Y/N), protected_flag (Y/N), rationale, recommended_action (no discipline / modified discipline / discipline permitted)} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — NLRA analysis |

**Binary Definition of Done:**
- ✓ Classification memo documents concerted_flag and mutual_aid_flag separately.
- ✓ protected_flag determination cites [NLRA] §7.
- ✓ recommended_action specifies whether discipline is permissible.
- ✓ Memo is completed within 2 business days of activity report.

---

##### A12562: Review Proposed Policy for Facial NLRA Violation

**Agent Definition:** Receive proposed handbook policy or workplace rule, apply the Stericycle categorical analysis (Category 1: policies that explicitly restrict §7 rights are presumptively unlawful; Category 2: policies with potential chilling effect require balancing; Category 3: policies that cannot reasonably chill §7 rights are lawful), and produce a written NLRA Policy Review Opinion.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed Policy Text | Handbook or workplace rule draft text to be reviewed |
| C1 | Control | Stericycle Standard | [NLRA] §8(a)(1); Stericycle, Inc. (NLRB 2023) — policies analyzed from perspective of employee reasonably likely to chill §7 rights; employer must prove legitimate business justification outweighs chilling effect for Category 2; confidentiality, social media, recording, and no-solicitation policies require careful drafting |
| O1 | Output | NLRA Policy Review Opinion | Written opinion: {policy_text, category (1/2/3), chilling_effect_analysis, business_justification (if category 2), modification_recommended (Y/N), revised_policy_language (if modification required)} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — Stericycle category analysis |

**Binary Definition of Done:**
- ✓ Opinion assigns a Stericycle category.
- ✓ For Category 2 policies, business_justification is documented.
- ✓ modification_recommended and (if Y) revised_policy_language are present.
- ✓ Opinion is completed before policy publication.

---

##### A12563: Respond to NLRB Charge and Produce Position Statement

**Agent Definition:** Receive NLRB unfair labor practice charge, open a matter in MECH-MATTER, issue litigation hold via A12611, and produce a written Position Statement (within the NLRB's requested deadline) addressing: each alleged ULP, factual and legal defenses, and relevant documentary evidence.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | NLRB Charge Notice | NLRB Form 501 with: charge_number, charging_party, charged_conduct, section_of_act_violated, date_of_charge |
| C1 | Control | NLRB Response Obligation | NLRB Rules §§101.1–101.16 — employer must submit position statement within deadline set by Regional Director (typically 7–14 days); failure to respond may result in determination on charging party's unrebutted evidence |
| O1 | Output | NLRB Position Statement | Written submission: {charge_number, factual_narrative, per_allegation_defense[], legal_defenses[], documentary_evidence_referenced[], conclusion (charge_should_be_dismissed)} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — NLRB matter file |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — position statement drafting |

**Binary Definition of Done:**
- ✓ MECH-MATTER matter record exists for charge.
- ✓ Litigation hold is issued (coordinated with A12611).
- ✓ Position statement is submitted before NLRB deadline.
- ✓ Statement addresses each alleged ULP with factual and legal defense.

---

**A125 Leaf Node Count:** 18 ✓

**Mandatory Inclusions — A125:**
- Employment & Labor Law domain — all 7 Legal mandatory inclusions distributed across A121–A126; A125 provides comprehensive employment law advisory coverage including WARN Act (A1252), ADA accommodation (A1253), EEO investigation (A1254), restrictive covenants (A1255), and NLRA compliance (A1256). IF-A1-26 satisfied at A12511.
