# Skill File: Benefits Administration

**Node:** A1332
**Parent:** A133 Compensation & Benefits → A13 People → A1 Governance
**Function:** Design, Procure, and Administer Employee Benefits Programs
**Supreme Constraint:** ERISA (plan governance, fiduciary duty); ACA employer mandate; IRC §125 (cafeteria plans); IRC §401(a) (retirement plan qualification); COBRA
**Cross-Function Interfaces:** IF-A1-15 (Pre-tax Deduction Schedule → Payroll A1333), IF-A1-16 (401(k) Contribution File → Payroll A1333), IF-A1-17 (Benefits Cost Accrual → Finance A11)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] ERISA plan document requirements → A133212
- [x] ACA employer mandate → A133213, A133221, A133261
- [x] COBRA notification obligations → A133251
- [x] 401(k) plan compliance → A133241, A133242, A133243
- [x] FSA/HSA eligibility rules → A133232
- [x] Benefits enrollment system configuration → A133213

---

## A1332: Benefits Administration (L4 — Full ICOM)

**Function:** Design, procure, and administer employee benefits programs including health insurance, retirement plans, and ancillary benefits
**Supreme Constraint:** [ERISA] plan governance and fiduciary duty; [ACA] employer mandate; [IRC-125] cafeteria plan qualification; [IRC-401K] retirement plan qualification; [COBRA] continuation coverage

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employee Benefit Elections | Enrollment forms and changes — onboarding and open enrollment events |
| I2 | Input | Benefits Invoices | Carrier billing statements for all benefit lines |
| C1 | Control | Benefits Budget | From Finance A11 via Compensation Budget — IF-A1-08 |
| C2 | Control | ERISA | [ERISA] Plan document requirements, fiduciary standards, Form 5500 filing |
| C3 | Control | ACA Employer Mandate | [ACA] Minimum essential coverage, minimum value, affordability rules |
| C4 | Control | IRC §125 / §401(a) / §223 | [IRC-125] / [IRC-401K] / [IRC-223] Pre-tax treatment qualification rules for cafeteria plans, retirement plans, and HSAs |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] Benefitfocus, PlanSource, Gusto Benefits, Rippling |
| M2 | Mechanism | Insurance Carriers | Health, dental, vision, life, disability plan sponsors |
| M3 | Mechanism | 401(k) Plan Provider | [MECH-401K] Guideline, Fidelity, Vanguard |
| O1 | Output | Benefits Coverage | Active enrollments → employees |
| O2 | Output | Pre-tax Deduction Schedule | Health, FSA/HSA amounts → Payroll A1333 — IF-A1-15 |
| O3 | Output | 401(k) Contribution File | Deferral elections and employer match → Payroll A1333 — IF-A1-16 |
| O4 | Output | Benefits Cost Accrual | Employer benefit cost GL entries → Finance A11 — IF-A1-17 |
| O5 | Output | COBRA Coverage Administration | COBRA election notices, active coverage records, and termination notices → qualified beneficiaries and carriers |
| O6 | Output | Approved Carrier Invoices | Reconciled and approved benefits invoices for payment → Finance A11 AP — IF-A1-21 |

**Child Nodes:** A13321, A13322, A13323, A13324, A13325, A13326

---

## Boundary Arrow Correspondence (A1332 → Child Phases)

| A1332 Output | Produced By | Phase |
|---|---|---|
| O1 Benefits Coverage | A13322.O1 (active enrollment records) | Administer Benefits Enrollment |
| O2 Pre-tax Deduction Schedule | A13323.O3 (deduction schedule via A133233) | Administer Health Benefits and Pre-Tax Accounts |
| O3 401(k) Contribution File | A13324.O1 (contribution file via A133241) | Administer Retirement Plan Compliance |
| O4 Benefits Cost Accrual | A13326.O2 (GL journal entry via A133262) | Prepare Benefits Reports and Cost Accruals |
| O5 COBRA Coverage Administration | A13325.O1 + O2 + O3 (election notices + coverage records + termination notices) | Execute COBRA Administration |
| O6 Approved Carrier Invoices | A13323.O1 (reconciled carrier invoices via A133231) | Administer Health Benefits and Pre-Tax Accounts |

---

## A13321: Design and Procure Benefits Plans (L5 Phase 1)

**Function:** Select carriers, draft ERISA plan documents, and configure the benefits administration system to establish the complete benefits offering
**Supreme Constraint:** [ERISA] §§102–104 plan document and SPD requirements; [ERISA-FIDUCIARY] §404 prudent expert selection standard; [ACA] minimum value and affordability

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Benefits Budget Authorization | Authorized per-FTE cost ceiling per benefits category from Finance A11 — IF-A1-08 |
| I2 | Input | Carrier RFP Responses and Market Benchmarking | Plan design details, premium schedules, network breadth, compliance attestations |
| C1 | Control | ERISA | [ERISA] 29 U.S.C. §§1022–1024 — plan document and SPD content requirements |
| C2 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404 — prudent expert selection; document RFP scoring criteria |
| C3 | Control | ACA Employer Mandate | [ACA] IRC §4980H — minimum value (≥60% actuarial value) and affordability thresholds |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] |
| M2 | Mechanism | Legal AI | [MECH-LEGAL-AI] Anthropic Claude API — SPD drafting and compliance review |
| O1 | Output | Executed Carrier Contracts + ERISA Plan Documents | Signed carrier agreements; wrap plan document; SPDs for all benefit lines |
| O2 | Output | Configured Benefits Administration Platform | All plan rules, eligibility criteria, and contribution amounts loaded and validated |

**Child Nodes:** A133211, A133212, A133213

---

#### A133211: Select and Procure Carrier Plans

**Agent Definition:** Issue RFP to qualifying carriers for each benefits line (health, dental, vision, life, disability), score responses against ACA minimum essential coverage and affordability criteria and the Benefits Budget Authorization, and execute carrier contracts for all approved plans.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Benefits Budget Authorization | Authorized per-FTE cost ceiling per plan category (health, dental, vision, life, disability); plan year; from Finance A11 — IF-A1-08 |
| I2 | Input | Carrier RFP Responses | Plan design, premium schedules by coverage tier, network breadth, actuarial value certification, plan ID numbers |
| C1 | Control | ACA Employer Mandate | [ACA] IRC §4980H — minimum value threshold ≥60% actuarial value; affordability: employee lowest-cost self-only premium ≤ current IRC §4980H affordability safe harbor percentage of W-2 wages |
| C2 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404 — document RFP scoring matrix; retain carrier comparison records; prudent selection requires considering cost, network breadth, and participant interest |
| O1 | Output | Executed Carrier Contracts | Signed agreements for each benefits line; plan year; per-FTE premium rates by coverage tier; stored in MECH-BENEFITS |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] PlanSource, Benefitfocus — carrier contract storage and EDI setup |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] Google Workspace / Microsoft 365 — RFP scoring matrix and selection documentation |

**Definition of Done:** Executed carrier contracts for all required benefits lines (at minimum a health plan meeting ACA minimum value) are signed, dated, and stored in MECH-BENEFITS AND the ACA affordability calculation for the selected health plan confirms employee-share premium ≤ the current IRC §4980H affordability percentage applied to the lowest W-2 wage in the eligible population.

---

#### A133212: Draft ERISA Plan Documents

**Agent Definition:** Draft the wrap plan document and Summary Plan Descriptions (SPDs) for all benefit plans, incorporating all ERISA §102–104 mandatory content elements, obtain plan administrator signature, and distribute to all eligible participants within the statutory deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed Carrier Contracts | Plan terms, coverage levels, claims procedures, and effective dates for all enrolled plans |
| C1 | Control | ERISA Plan Document Requirements | [ERISA] 29 U.S.C. §§1022–1024; 29 CFR §2520.102-3 — SPD must include: plan name and number, plan administrator name/address, eligibility requirements, description of benefits, claims and appeals procedures (ERISA §503), participant rights statement, and statement of ERISA rights |
| C2 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404 — plan documents must accurately reflect actual plan terms; no provisions that could mislead participants about their rights |
| O1 | Output | ERISA Wrap Plan Document + SPDs | Signed wrap plan document; SPD for each benefit line; distribution log confirming delivery to all participants |
| M1 | Mechanism | Document Collaboration | [MECH-DOC] Google Workspace / Microsoft 365 — document drafting and version control |
| M2 | Mechanism | Legal AI | [MECH-LEGAL-AI] Anthropic Claude API — SPD drafting and ERISA compliance review |

**Definition of Done:** Wrap plan document and SPD for each benefit plan are signed by plan administrator and stored in MECH-DOC AND distribution log confirms delivery to all eligible employees within 90 days of plan adoption (or 30 days for new enrollees per ERISA §104(b)(1)).

---

#### A133213: Configure Benefits Administration System

**Agent Definition:** Load all approved benefit plans, eligibility rules, waiting periods, employee contribution schedules, and FSA/HSA elections into the benefits administration platform, then validate configuration by running a test enrollment for each plan type and confirming HRIS eligibility sync returns zero errors.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed Carrier Contracts | Plan IDs, effective dates, contribution schedules, coverage tiers for all benefit lines |
| I2 | Input | Eligibility Rules | Waiting period (≤90 days per ACA), full-time threshold (≥30 hrs/week for ACA), dependent eligibility definitions |
| C1 | Control | ACA Employer Mandate | [ACA] IRC §4980H — 30-hour/week FTE threshold for coverage offer obligation; 95% offer rate requirement for ALEs; 90-day maximum waiting period |
| C2 | Control | IRC §125 Cafeteria Plan | [IRC-125] IRC §125 — pre-tax payroll deduction configuration; Health FSA annual contribution limit (IRS indexed); plan must be formally adopted in writing before the plan year begins |
| O1 | Output | Configured Benefits Administration Platform | All plans loaded; eligibility rules active; contribution amounts set; test enrollment for each plan type passes with zero configuration errors; HRIS sync active |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] PlanSource, Benefitfocus, Rippling |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] Workday, BambooHR — eligibility data source for real-time sync |

**Definition of Done:** Test enrollment for each plan type in MECH-BENEFITS returns a confirmed coverage record with correct tier, contribution amount, and effective date AND MECH-HRIS eligibility sync returns zero error records.

---

## A13322: Administer Benefits Enrollment (L5 Phase 2)

**Function:** Execute all enrollment events — open enrollment, new hire enrollment, and qualifying life events — and produce active benefits coverage records with updated pre-tax deduction schedules
**Supreme Constraint:** [ERISA] §101 notice and disclosure timing; [ACA] offer obligation within waiting period; [HIPAA-PRIVACY] special enrollment rights

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employee Benefit Elections | Completed enrollment forms for OE, new hire, and QLE events |
| I2 | Input | Qualifying Life Event Documentation | Marriage certificate, birth certificate, loss-of-coverage notice, dependent loss-of-eligibility confirmation |
| C1 | Control | ERISA | [ERISA] Plan enrollment and disclosure timing rules; SBC distribution ≥30 days before enrollment deadline |
| C2 | Control | HIPAA Special Enrollment Rights | [HIPAA-PRIVACY] 29 CFR §2590.701-6 — special enrollment triggered by loss of other coverage, marriage, birth, adoption; 30-day enrollment window |
| C3 | Control | ACA Employer Mandate | [ACA] IRC §4980H — offer must be made to all FTEs within applicable waiting period |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — employee status and eligibility data source |
| O1 | Output | Active Benefits Coverage Records | Confirmed enrollment records per employee per plan → employees |
| O2 | Output | Enrollment-Triggered Deduction Updates | Updated deduction amounts from enrollment changes (new hires, OE, QLEs) → A13323 for deduction schedule recalculation; internal flow, not a direct Payroll transmission |

**Child Nodes:** A133221, A133222, A133223

---

#### A133221: Execute Open Enrollment

**Agent Definition:** Configure and launch the annual open enrollment window in MECH-BENEFITS, distribute SBC and enrollment communications to all eligible employees ≥30 days before the deadline, collect elections before the enrollment close date, and transmit confirmed elections to each carrier for the new plan year.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Open Enrollment Configuration | Enrollment window dates; available plan options; contribution amounts by tier; deadline; from A133213 |
| I2 | Input | Eligible Employee Roster | All employees meeting eligibility threshold (≥30 hrs/week for ACA; or plan waiting period elapsed) — from MECH-HRIS |
| C1 | Control | ACA Employer Mandate | [ACA] IRC §4980H — coverage must be offered to ≥95% of full-time employees; affordability test applies to lowest-cost self-only option |
| C2 | Control | ERISA Disclosure | [ERISA] 29 U.S.C. §1022 — Summary of Benefits and Coverage (SBC) must be distributed to all eligible employees ≥30 days before the enrollment deadline |
| O1 | Output | Confirmed Open Enrollment Elections | Per-employee election records in MECH-BENEFITS; elections transmitted to carriers via EDI |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] PlanSource, Gusto Benefits |
| M2 | Mechanism | Transactional Email API | [MECH-EMAIL-API] SendGrid, AWS SES — enrollment reminder and SBC delivery |

**Definition of Done:** MECH-BENEFITS shows 100% of eligible employees have either made an active election or recorded a coverage waiver AND carrier enrollment EDI file transmitted to each carrier returns zero rejected records AND enrollment deadline has passed.

---

#### A133222: Process New Hire Enrollment

**Agent Definition:** Trigger the benefits enrollment window for each new hire within one business day of HRIS hire record creation, collect benefit elections within the 30-day HIPAA special enrollment window, and activate coverage with an effective date that does not exceed day 91 from the hire date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | New Hire Record | Employee ID; hire date; FTE status (≥30 hrs/week?); job location; from MECH-HRIS trigger |
| C1 | Control | ACA Employer Mandate | [ACA] IRC §4980H — 90-day maximum waiting period; initial and standard measurement period rules for variable-hour employees |
| C2 | Control | ERISA Waiting Period Prohibition | [ERISA] 29 CFR §2590.715-2708 — maximum 90-calendar-day waiting period from hire before coverage must be offered |
| C3 | Control | HIPAA Special Enrollment | [HIPAA-PRIVACY] 29 CFR §2590.701-6 — 30-day enrollment window for new hires; elections made after window are not retroactive |
| O1 | Output | New Hire Benefits Coverage Record | Active enrollment record in MECH-BENEFITS for each elected plan; coverage effective date ≤ day 91 from hire; carrier enrollment confirmation received |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — hire date trigger and eligibility status |

**Definition of Done:** MECH-BENEFITS contains an active coverage record (or waiver record) for the new hire AND coverage effective date is ≤ day 91 from hire date AND carrier enrollment confirmation received within 5 business days of election submission.

---

#### A133223: Process Qualifying Life Event Changes

**Agent Definition:** Verify QLE documentation submitted by the employee against the allowable event types under HIPAA special enrollment rules, confirm the event date falls within the 30-day change window, adjust coverage elections consistent with the QLE, update carrier enrollment, and generate revised pre-tax deduction schedule for the next payroll run.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | QLE Event Claim and Supporting Documentation | Event type; date of event; supporting document (marriage certificate, birth certificate, loss-of-coverage letter from prior carrier, dependent age-out notice) |
| C1 | Control | HIPAA Special Enrollment Rights | [HIPAA-PRIVACY] 29 CFR §2590.701-6 — allowable QLE types: loss of other coverage, marriage, birth, adoption, dependent acquiring eligibility; 30-day window from event date; elections outside window are not permitted |
| C2 | Control | IRC §125 Consistency Rule | [IRC-125] Pre-tax deduction changes are permissible mid-year only when consistent with the nature of the QLE election change; change must be on account of and consistent with the qualifying event |
| O1 | Output | Updated Benefits Coverage Record | Revised enrollment in MECH-BENEFITS; updated carrier record; revised pre-tax deduction schedule effective for the next payroll run |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] — QLE documentation storage and audit trail |

**Definition of Done:** MECH-BENEFITS shows updated coverage election with effective date ≤ 30 days after the QLE event date AND carrier enrollment update confirmation received AND pre-tax deduction schedule transmitted to MECH-PAYROLL reflects the revised election amount effective next payroll cycle.

---

## A13323: Administer Health Benefits and Pre-Tax Accounts (L5 Phase 3)

**Function:** Reconcile carrier invoices, administer FSA/HSA accounts, and generate the per-period pre-tax deduction schedule for transmission to payroll
**Supreme Constraint:** [ERISA-FIDUCIARY] §404 fiduciary duty in premium reconciliation; [IRC-125] FSA limits and ordering; [IRC-223] HSA eligibility and contribution limits

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Carrier Premium Invoices | Monthly billing statements from all insurance carriers |
| I2 | Input | Active Enrollment Records | Current coverage roster from MECH-BENEFITS |
| I3 | Input | Employee FSA/HSA Election Amounts | Annual election amounts from open enrollment (A133221) |
| C1 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404 — plan administrator must reconcile invoices; over-payments are a fiduciary breach requiring recovery |
| C2 | Control | IRC §125 Cafeteria Plan | [IRC-125] Pre-tax deduction ordering; Health FSA annual limit (IRS indexed) |
| C3 | Control | IRC §223 HSA Rules | [IRC-223] HDHP eligibility requirement; annual contribution limits (self-only and family); catch-up for age ≥55 |
| C4 | Control | HIPAA Privacy Rule | [HIPAA-PRIVACY] PHI handling in carrier EDI transactions; HIPAA 834 enrollment file standards |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] |
| M2 | Mechanism | Insurance Carriers | Carrier premium processing and EDI |
| O1 | Output | Reconciled Carrier Invoices | Approved invoices forwarded to Finance A11 AP, or documented dispute letters |
| O2 | Output | FSA/HSA Account Records | Active contribution schedules and limit validation |
| O3 | Output | Pre-tax Deduction Schedule | Per-pay-period deductions (health + FSA + HSA) → Payroll A1333 — IF-A1-15 |

**Child Nodes:** A133231, A133232, A133233

---

#### A133231: Reconcile Carrier Premium Invoices

**Agent Definition:** Compare each carrier's monthly premium invoice line-by-line against the active enrollment roster in MECH-BENEFITS, flag every variance (missing employee, wrong coverage tier, incorrect effective date, terminated employee still billed), approve zero-variance invoices for AP payment, and submit formal dispute letters for all variance items ≥$1.00 within 5 business days of invoice receipt.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Carrier Premium Invoice | Carrier ID; invoice date; billing period; per-employee premium charges by plan and coverage tier |
| I2 | Input | Active Enrollment Roster | Current enrollment records from MECH-BENEFITS: employee ID, plan, coverage tier, effective date, termination date if applicable |
| C1 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404 — plan administrator must act in participants' best interest; over-payment recovery is a fiduciary obligation; reconciliation records must be retained |
| C2 | Control | ERISA Plan Document | [ERISA] Premium amounts must match plan document premium schedule; no participant may be charged more than the plan document specifies |
| O1 | Output | Reconciled Carrier Invoice (Approved or Disputed) | Per-carrier: invoice with line-by-line variance analysis; either (a) approved and forwarded to MECH-AP for payment, OR (b) dispute letter with specific line items and supporting enrollment data |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — enrollment data source for comparison |
| M2 | Mechanism | Accounts Payable System | [MECH-AP] Bill.com, Tipalti — approved invoice routing for payment |

**Definition of Done:** Every line item on each carrier invoice is matched to an enrollment record in MECH-BENEFITS AND all variance lines ≥$1.00 are either (a) corrected by the carrier and re-invoiced before approval, OR (b) documented in a formal written dispute submitted to the carrier within 5 business days of invoice receipt.

---

#### A133232: Administer FSA/HSA Accounts

**Agent Definition:** Set up FSA and HSA accounts for all enrolled employees, validate HSA enrollees meet HDHP eligibility before activating accounts, load annual contribution elections, enforce per-period and annual contribution limits per IRC §125/§223/§129, and generate a limit validation report confirming no employee exceeds applicable annual caps.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FSA/HSA Enrollment Elections | Employee ID; election type (Health FSA / Dependent Care FSA / HSA); annual election amount; from open enrollment records |
| I2 | Input | HDHP Enrollment Confirmation | For HSA enrollees: confirmation that employee is actively enrolled in a qualified High-Deductible Health Plan and has no disqualifying coverage |
| C1 | Control | IRC §125 FSA Limits | [IRC-125] Annual Health FSA limit (IRS Publication 15-B, indexed annually); use-it-or-lose-it rule; optional grace period or $610 rollover (2024) if plan permits |
| C2 | Control | IRC §223 HSA Rules | [IRC-223] IRC §223 — HDHP enrollment required for HSA eligibility; annual contribution limits for self-only and family coverage (IRS indexed); catch-up contribution for age ≥55; employee may not contribute to both a general-purpose Health FSA and an HSA in the same plan year |
| C3 | Control | IRC §129 Dependent Care FSA | [IRC-129] IRC §129 — Dependent Care FSA annual limit $5,000 (MFJ or single) / $2,500 (married filing separately); nondiscrimination testing required; funds must be used for qualifying dependent care enabling employment |
| O1 | Output | FSA/HSA Account Records | Account IDs, enrolled employees, annual elections, per-period contribution schedules loaded in MECH-BENEFITS |
| O2 | Output | Annual Contribution Limit Validation Report | Per-employee confirmation that no election exceeds applicable IRC §125 / §223 / §129 annual limit |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — FSA/HSA plan administration |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — HDHP enrollment status for HSA eligibility verification |

**Definition of Done:** MECH-BENEFITS shows active FSA/HSA accounts for all enrolled employees AND the Annual Contribution Limit Validation Report returns zero employees with elections exceeding applicable annual limits AND every HSA enrollee has a confirmed HDHP enrollment record in MECH-HRIS.

---

#### A133233: Generate Pre-tax Deduction Schedule

**Agent Definition:** Compute the per-pay-period pre-tax deduction amounts for each active employee (health insurance employee share, Health FSA, Dependent Care FSA, and HSA contributions) in accordance with IRC §125 ordering rules, and transmit the complete deduction schedule to Payroll A1333 before each payroll run cutoff.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Active Benefits Coverage Records | Current health plan enrollment with employee contribution amount per coverage tier per employee; from MECH-BENEFITS |
| I2 | Input | FSA/HSA Account Records | Annual elections and YTD contributions per employee from A133232 |
| C1 | Control | IRC §125 Pre-tax Deduction Ordering | [IRC-125] IRC §125 — pre-tax deductions must be taken before FICA computation; ordering: (1) health insurance premium, (2) Health FSA contribution, (3) Dependent Care FSA contribution, (4) HSA contribution |
| C2 | Control | Benefits Budget | From Finance A11 — IF-A1-08; employer contribution amounts per tier establish the employee net deduction |
| O1 | Output | Pre-tax Deduction Schedule | Per-employee file: Employee ID; deduction type (health premium, FSA-health, FSA-DCAP, HSA); per-pay-period amount; effective date; YTD contribution balance; transmitted to Payroll A1333 — IF-A1-15 |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — deduction calculation and export |
| M2 | Mechanism | Payroll Processor API | [MECH-PAYROLL] ADP Workforce Now, Gusto — deduction schedule import |

**Definition of Done:** Pre-tax Deduction Schedule file transmitted to MECH-PAYROLL AND MECH-PAYROLL returns acknowledgment of successful import with zero error records AND no employee's per-period deduction results in a YTD total that exceeds the remaining annual election balance.

**[CROSS-FUNCTION: A1332 → A1333]** *Interface: IF-A1-15*

---

## A13324: Administer Retirement Plan Compliance (L5 Phase 4)

**Function:** Process 401(k) deferral elections, execute annual non-discrimination testing, and file Form 5500 to maintain plan qualification under IRC §401(a)
**Supreme Constraint:** [IRC-401K] deferral limits and ADP/ACP testing; [ERISA] fiduciary and filing obligations; [ERISA-5500] Form 5500 annual filing deadline

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employee Deferral Elections | Per-employee 401(k) deferral percentages or flat dollar amounts (traditional and Roth) |
| I2 | Input | Full-Year Payroll and Compensation Data | YTD compensation per employee for limit tracking and non-discrimination testing |
| C1 | Control | IRC §401(k) Deferral Limits | [IRC-401K] Annual elective deferral limit and catch-up (age ≥50); ADP/ACP non-discrimination testing requirements |
| C2 | Control | ERISA | [ERISA] Plan document conformance; fiduciary standards |
| C3 | Control | ERISA Form 5500 | [ERISA-5500] Annual filing deadline (7 months after plan year end); extension via Form 5558 |
| M1 | Mechanism | 401(k) Plan Provider | [MECH-401K] Guideline, Fidelity, Vanguard |
| M2 | Mechanism | Payroll Processor API | [MECH-PAYROLL] — compensation data and contribution file transmission |
| O1 | Output | 401(k) Contribution File | Per-employee deferral and employer match amounts → Payroll A1333 — IF-A1-16 |
| O2 | Output | Annual Compliance Test Results | ADP/ACP/top-heavy test results; corrective distribution or QNEC records if applicable |
| O3 | Output | Filed Form 5500 | DOL EFAST2 accepted Form 5500 annual report |

**Child Nodes:** A133241, A133242, A133243

---

#### A133241: Process 401(k) Deferrals

**Agent Definition:** Collect employee 401(k) deferral elections (traditional and Roth), validate each election does not cause the employee to exceed the IRC §401(k) annual limit (including catch-up for age ≥50) based on YTD contributions, compute per-pay-period deferral amounts, and transmit the 401(k) contribution file to Payroll A1333 before each payroll run cutoff.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employee Deferral Election | Employee ID; election type (traditional / Roth); percentage of compensation OR flat dollar amount; effective date |
| I2 | Input | YTD Compensation and Deferral Data | YTD compensation and YTD 401(k) deferrals per employee from MECH-PAYROLL for annual limit tracking |
| C1 | Control | IRC §401(k) Deferral Limits | [IRC-401K] IRC §401(k)(2)(A) — annual elective deferral limit (IRS indexed; $23,000 for 2024); catch-up contribution for age ≥50 ($7,500 for 2024); combined traditional + Roth deferrals count toward single limit |
| C2 | Control | ERISA Plan Document | [ERISA] Deferrals must conform to plan document terms; if plan includes auto-enrollment (EACA/QACA), default deferral rate and opt-out window apply |
| O1 | Output | 401(k) Contribution File | Per-employee: Employee ID; pay date; pre-tax deferral amount; Roth deferral amount; employer match amount; transmitted to Payroll A1333 — IF-A1-16 |
| M1 | Mechanism | 401(k) Plan Provider | [MECH-401K] Guideline, Fidelity — election recordkeeping and limit monitoring |
| M2 | Mechanism | Payroll Processor API | [MECH-PAYROLL] — contribution file import |

**Definition of Done:** 401(k) Contribution File transmitted to MECH-PAYROLL AND MECH-PAYROLL returns successful import confirmation AND no employee's YTD deferral amount in the contribution file exceeds the applicable IRC §401(k) annual limit for that employee.

**[CROSS-FUNCTION: A1332 → A1333]** *Interface: IF-A1-16*

---

#### A133242: Execute Annual Plan Compliance Testing

**Agent Definition:** Run the ADP (Actual Deferral Percentage), ACP (Actual Contribution Percentage), and top-heavy non-discrimination tests on the 401(k) plan for the completed plan year, using the applicable testing method (prior-year or current-year), determine pass or fail for each test, and initiate corrective distributions or QNECs within the IRS correction deadline for any failed test.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Full-Year Deferral and Compensation Data | Deferral amounts and compensation for all HCEs (Highly Compensated Employees, IRC §414(q)) and NHCEs for the plan year — from MECH-401K plan recordkeeper |
| I2 | Input | Account Balance Summary | Total account balances for key employees vs. non-key employees for top-heavy test (IRC §416) |
| C1 | Control | IRC §401(k) ADP/ACP Testing | [IRC-401K] IRC §401(k)(3) ADP test — HCE average deferral rate may not exceed NHCE average by more than 2 percentage points or 1.25×; IRC §401(m) ACP test applies same formula to employer match and after-tax contributions; HCE definition: compensation >$155,000 for 2024 or top-20% owner; correction deadline: refunds within 2.5 months of plan year end to avoid 10% excise tax |
| C2 | Control | IRC §416 Top-Heavy Rules | [ERISA] IRC §416 — plan is top-heavy if key employee account balances exceed 60% of total plan assets; minimum contribution of 3% of compensation required for non-key employees if plan is top-heavy |
| O1 | Output | Annual Compliance Test Results | ADP ratio for HCEs and NHCEs; ACP ratio; top-heavy percentage; pass/fail determination per test; corrective action type and amount (refund amounts, QNEC amounts) or confirmation of no correction required |
| M1 | Mechanism | 401(k) Plan Provider | [MECH-401K] — plan recordkeeper compliance testing module |
| M2 | Mechanism | FP&A Platform | [MECH-FPA] Anaplan, Adaptive Planning — QNEC cost modeling if correction required |

**Definition of Done:** ADP test, ACP test, and top-heavy test results are documented in MECH-401K plan recordkeeper system AND either (a) all three tests pass, OR (b) any failed test has a corrective distribution or QNEC contribution initiated and documented within 2.5 months of plan year end.

---

#### A133243: File Form 5500 Annual Report

**Agent Definition:** Compile plan financial data, participant counts, investment information, and compliance test results required for Form 5500 (or Form 5500-SF for plans with fewer than 100 participants), complete all applicable schedules, and file with the DOL/IRS EFAST2 electronic filing system on or before the applicable deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Plan Year Financial Data | Total plan assets at start and end of year; employer contributions; employee contributions; distributions; forfeitures; investment income — from MECH-401K plan recordkeeper |
| I2 | Input | Participant Count | Active participants; terminated vested; total at plan year start and end — from MECH-HRIS and MECH-401K |
| I3 | Input | Annual Compliance Test Results | ADP/ACP/top-heavy test results from A133242 |
| C1 | Control | ERISA Form 5500 | [ERISA-5500] ERISA §104; 29 CFR Part 2520; DOL/IRS Form 5500 instructions — filing deadline: last day of 7th month after plan year end (July 31 for calendar-year plans); 2.5-month extension via Form 5558 available before deadline; EFAST2 electronic filing required for all filers; large plans (≥100 participants) require independent CPA audit (Schedule H); small plans (<100) use Form 5500-SF |
| C2 | Control | ERISA | [ERISA] 29 U.S.C. §1024 — annual report must be filed with the DOL; participants have the right to receive a summary annual report (SAR) within 9 months of plan year end |
| O1 | Output | Filed Form 5500 | EFAST2 submission acknowledgment with accepted filing status and confirmation number; filing date; all required schedules (Schedule A for insurance contracts, Schedule C for service providers, Schedule H/I for financial information, Schedule R for retirement plan information) |
| M1 | Mechanism | 401(k) Plan Provider | [MECH-401K] — plan data export and Form 5500 preparation tools |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — participant count data |

**Definition of Done:** DOL EFAST2 system returns acknowledgment with accepted filing status and confirmation number AND the filing date is on or before the plan year filing deadline (or the extended deadline if Form 5558 was filed before the original deadline).

---

## A13325: Execute COBRA Administration (L5 Phase 5)

**Function:** Detect qualifying events, issue election notices, process elections and premium payments, and terminate COBRA coverage upon expiration or a disqualifying event
**Supreme Constraint:** [COBRA] 29 U.S.C. §1161–1168; 29 CFR §§2590.606-1 through 2590.606-4 — notice timing, premium limits, coverage periods

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Qualifying Event Notifications | Termination, reduction in hours, divorce, dependent age-out, Medicare entitlement, death — from MECH-HRIS |
| I2 | Input | COBRA Premium Payments | Checks or EFT payments from COBRA participants during election and coverage periods |
| C1 | Control | COBRA Notice Timing | [COBRA] 29 U.S.C. §1166; 29 CFR §2590.606-2/606-4 — employer notifies plan administrator within 30 days of qualifying event; plan administrator issues election notice within 14 days; 60-day election window for qualified beneficiary |
| C2 | Control | COBRA Premium Limits | [COBRA] 29 U.S.C. §1162(3) — 102% of applicable premium (100% plan cost + 2% administration fee); 150% of applicable premium permitted for disability extension months 19–29 |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — COBRA module or integrated third-party COBRA TPA |
| M2 | Mechanism | Transactional Email API | [MECH-EMAIL-API] SendGrid, AWS SES — notice delivery with confirmation |
| O1 | Output | COBRA Election Notices | Individualized notices issued to all qualified beneficiaries within the 14-day issuance window |
| O2 | Output | COBRA Coverage Records | Active COBRA enrollments with coverage periods, elections, and premium payment status |
| O3 | Output | COBRA Termination Notices | Coverage termination notifications with termination date and reason |

**Child Nodes:** A133251, A133252, A133253

---

#### A133251: Issue COBRA Election Notices

**Agent Definition:** Detect qualifying events from MECH-HRIS (termination, reduction in hours, divorce, dependent age-out, Medicare entitlement, death of covered employee), generate an individualized COBRA election notice for each qualified beneficiary containing all required content elements, and deliver the notice with a delivery confirmation within the plan administrator's 14-day issuance deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Qualifying Event Record | Employee ID; qualifying event type (termination, reduced hours, divorce, dependent age-out, Medicare, death); date of event; list of qualified beneficiaries (employee + each covered dependent); current plan enrollments |
| C1 | Control | COBRA Notice Timing and Content | [COBRA] 29 CFR §§2590.606-1 through 2590.606-4 — election notice must include: name of the plan; qualifying event type and date; identity of qualified beneficiaries; coverage period available (18 or 36 months); per-beneficiary premium amount at 102%; premium payment procedures; election deadline (60 days from notice or coverage loss date, whichever is later); address for election; conversion rights if any; ERISA rights statement; DOL model notice satisfies content requirements |
| O1 | Output | COBRA Election Notice Package | Individualized notice per qualified beneficiary; delivery confirmation (certified mail return receipt or email read receipt); notice issuance date and beneficiary ID recorded in MECH-BENEFITS |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — COBRA notice generation; or dedicated COBRA TPA (e.g., Businessolver, WEX Health) |
| M2 | Mechanism | Transactional Email API | [MECH-EMAIL-API] — electronic delivery with delivery confirmation logging |

**Definition of Done:** MECH-BENEFITS contains a COBRA election notice record for every qualified beneficiary from the qualifying event AND delivery confirmation is recorded for each notice AND notice issuance date is ≤ 14 days after the employer's receipt of qualifying event notification from HRIS.

---

#### A133252: Process COBRA Elections and Premiums

**Agent Definition:** Track the 60-day election window for each qualified beneficiary, record timely elections, activate COBRA coverage retroactive to the qualifying event date, collect 102% premiums within the 45-day initial grace period and subsequent 30-day monthly grace periods, and maintain active enrollment records for each covered period.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | COBRA Election Form | Qualified beneficiary ID; plan elections; signature; election date; desired coverage effective date |
| I2 | Input | COBRA Premium Payment | Payment amount; period covered; payment date; method (check / EFT) |
| C1 | Control | COBRA Election and Payment Rules | [COBRA] 29 U.S.C. §§1162–1163; 29 CFR §2590.606-4 — 60-day election window from later of notice date or coverage loss date; coverage effective date is retroactive to date of qualifying event; 45-day grace period for initial premium payment; 30-day grace period for subsequent monthly premiums; coverage terminates automatically if premium not received by end of grace period |
| O1 | Output | COBRA Enrollment Record | Active COBRA coverage per beneficiary per plan; coverage effective date (retroactive to qualifying event date); monthly premium amount due and due date |
| O2 | Output | COBRA Premium Payment Record | Per-payment receipt; period covered; cumulative YTD premium payments |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — COBRA enrollment and payment tracking |
| M2 | Mechanism | Accounts Payable System | [MECH-AP] — premium receipt processing and reconciliation |

**Definition of Done:** MECH-BENEFITS shows active COBRA enrollment for each electing beneficiary with coverage effective date = qualifying event date AND first premium payment is received and recorded within 45 days of election AND carrier enrollment update confirming COBRA activation is received within 5 business days of election.

---

#### A133253: Terminate COBRA Coverage

**Agent Definition:** Detect COBRA coverage termination triggers (maximum coverage period exhaustion, non-payment after grace period, enrollment in other group coverage, Medicare entitlement, employer plan termination), process termination on the applicable date, issue written termination notice to the beneficiary, and update carrier enrollment records to remove the terminated COBRA participant.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | COBRA Termination Trigger | Trigger type (period exhaustion / non-payment / other group coverage / Medicare / employer plan termination); trigger date; beneficiary ID |
| C1 | Control | COBRA Coverage Period and Termination Rules | [COBRA] 29 U.S.C. §1162(2) — maximum coverage periods: 18 months (termination or reduced hours); 36 months (divorce, death, dependent age-out, Medicare); disability extension to 29 months requires SSA determination notified by beneficiary within 60 days; non-payment: coverage terminates after the 30-day monthly grace period expires without payment receipt |
| C2 | Control | COBRA Disability Extension | [COBRA] 29 U.S.C. §1162(2)(A)(v) — disability extension to 29 months if SSA disability determination issued within the first 18 months; beneficiary must notify plan within 60 days of SSA determination date; premium during months 19–29 may be charged at 150% |
| O1 | Output | COBRA Termination Notice | Individualized written notice with: termination effective date; termination reason; any remaining conversion rights or marketplace alternatives notice |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — COBRA termination processing and carrier notification |
| M2 | Mechanism | Transactional Email API | [MECH-EMAIL-API] — termination notice delivery with confirmation |

**Definition of Done:** MECH-BENEFITS shows COBRA coverage terminated on the legally correct date for the applicable trigger type AND carrier enrollment record reflects termination within 5 business days AND written termination notice delivered to beneficiary with delivery confirmation.

---

## A13326: Prepare Benefits Reports and Cost Accruals (L5 Phase 6)

**Function:** Produce ACA employer reporting, benefits GL cost accrual entries, and annual benefits audit reconciliation to satisfy regulatory obligations and Finance accounting requirements
**Supreme Constraint:** [ACA-1095C] IRC §§6055–6056 employer reporting; [ERISA-FIDUCIARY] fiduciary accuracy; [MATH-GAAP-AXIOMS] zero-balanced journal entries

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Annual Enrollment and Coverage Data | Full-year month-by-month coverage records per employee; offer codes and safe harbor codes |
| I2 | Input | Premium and Contribution Data | Employer and employee costs per plan per period; 401(k) employer match per period |
| I3 | Input | Finance Period Close Calendar | GL posting deadlines and cost center codes from Finance A11 |
| C1 | Control | ACA Employer Reporting | [ACA-1095C] IRC §§6055–6056; Form 1094-C/1095-C instructions; ALE threshold 50+ FTE equivalents; January 31 employee distribution; March 31 IRS electronic filing deadline |
| C2 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404 — plan costs must be accurately reported; over-deductions from employees constitute fiduciary violations requiring correction |
| C3 | Control | MATH-GAAP-AXIOMS | [MATH-GAAP-AXIOMS] Double-entry accounting identity — benefits cost accrual journal entries must be zero-balanced |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — FTE count for ALE determination |
| M3 | Mechanism | ERP / General Ledger | [MECH-ERP-GL] NetSuite, SAP S/4HANA — GL journal entry posting |
| O1 | Output | Filed Forms 1094-C / 1095-C | IRS FIRE system acceptance confirmation; employee 1095-C delivery confirmation |
| O2 | Output | Benefits Cost Accrual Journal Entry | Zero-balanced GL entry (debit Benefits Expense, credit Benefits Payable) → Finance A11 — IF-A1-17 |
| O3 | Output | Annual Benefits Audit Report | Three-way reconciliation (MECH-BENEFITS vs. carrier vs. MECH-PAYROLL); discrepancy log with corrections |

**Child Nodes:** A133261, A133262, A133263

---

#### A133261: Prepare and File ACA Employer Reporting

**Agent Definition:** Determine ALE status by computing the prior-year average monthly FTE count, generate Form 1095-C for each full-time employee with the correct offer-of-coverage codes (Line 14) and applicable safe harbor codes (Line 16), aggregate into a Form 1094-C authoritative transmittal, distribute employee copies, and file with the IRS FIRE system by the applicable deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Full-Year Monthly FTE Count | Average monthly full-time employee count + FTE equivalents of part-time employees for prior calendar year; from MECH-HRIS (ALE threshold: average ≥50 FTE equivalents) |
| I2 | Input | Monthly Coverage Offer Records | Per-employee by month: offer code (Series 1A–1J indicating type of coverage offered); safe harbor code (Series 2A–2I); employee share of lowest-cost self-only premium for affordability calculation |
| C1 | Control | ACA Employer Reporting | [ACA-1095C] IRC §6056; 26 CFR §301.6056-1; IRS Forms 1094-C and 1095-C instructions — ALE determination; Line 14 offer codes; Line 16 safe harbor codes; W-2 wages, rate of pay, and federal poverty level affordability safe harbors; employee copies due January 31; IRS electronic filing due March 31 |
| C2 | Control | ACA Employer Mandate | [ACA] IRC §4980H(a) — §4980H(a) penalty triggered if coverage not offered to ≥95% of full-time employees; §4980H(b) penalty triggered if coverage offered but not affordable or not minimum value; ALE must offer coverage to substantially all full-time employees and their dependents |
| O1 | Output | Filed Forms 1094-C + 1095-C | IRS FIRE system acceptance confirmation with submission ID; employee 1095-C copies delivered (postmarked or electronically transmitted by January 31) |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — 1095-C generation and offer code assignment module |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — monthly FTE count and employment status data |

**Definition of Done:** IRS FIRE system returns accepted filing status with submission confirmation ID for the Form 1094-C transmittal AND employee 1095-C copies are delivered or postmarked on or before January 31 AND zero full-time employees coded in MECH-HRIS for one or more months of the reporting year are missing a Form 1095-C.

---

#### A133262: Compute Benefits Cost Accrual

**Agent Definition:** Calculate the employer's total benefits cost (health/dental/vision premiums, FSA employer contributions if any, 401(k) employer match, and COBRA administration costs) for each accounting period, prepare the zero-balanced GL journal entry debiting Benefits Expense by cost center and crediting Benefits Payable accounts, and transmit to Finance A11 before the period close deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Approved Carrier Premium Invoices | Employer share of premiums per plan per period; from A133231 |
| I2 | Input | 401(k) Employer Match Data | Employer match amounts per pay period per employee; from MECH-401K |
| I3 | Input | Finance Period Close Calendar | GL account codes, cost center codes, and period close deadline; from Finance A11 |
| C1 | Control | MATH-GAAP-AXIOMS | [MATH-GAAP-AXIOMS] Double-entry accounting identity — total debit (Benefits Expense by cost center and type) must equal total credit (Health Insurance Payable, 401(k) Payable, Dental Payable, etc.) to $0.00 variance |
| C2 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404; DOL regulations — 401(k) deferrals deposited by earliest practicable date; DOL safe harbor: 7 business days after payroll for plans with <100 participants; 15th business day of following month absolute deadline |
| O1 | Output | Benefits Cost Accrual Journal Entry | Journal entry ID; accounting period; GL debit lines (Benefits Expense by cost center and benefit type); GL credit lines (Benefits Payable by benefit type); debit/credit balance = $0.00; transmitted to Finance A11 — IF-A1-17 |
| M1 | Mechanism | ERP / General Ledger | [MECH-ERP-GL] NetSuite, SAP S/4HANA — GL journal entry posting |
| M2 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — benefits cost export |

**Definition of Done:** Journal entry is zero-balanced (debit total = credit total to $0.00 variance) AND all cost center codes resolve in Finance A11 chart of accounts AND journal entry is posted in MECH-ERP-GL before the Finance period close deadline AND Finance A11 confirms receipt.

**[CROSS-FUNCTION: A1332 → A11]** *Interface: IF-A1-17*

---

#### A133263: Conduct Annual Benefits Audit

**Agent Definition:** Reconcile full-year enrollment records in MECH-BENEFITS against (a) carrier-confirmed member rosters and (b) MECH-PAYROLL deduction records for each benefit line, identify every discrepancy (phantom enrollees, incorrect deduction amounts, missing coverage records), document findings in the audit report, and initiate corrections for all discrepancies before the start of the next plan year.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Full-Year MECH-BENEFITS Enrollment Records | All employee benefit elections, coverage periods, coverage tiers, and deduction amounts per plan for the plan year |
| I2 | Input | Carrier Enrollment Confirmations | Carrier-confirmed active member rosters for each plan (health, dental, vision, life, disability) at plan year end |
| I3 | Input | Payroll Deduction Records | Employee deduction amounts from MECH-PAYROLL for each benefits line per pay period for the full year |
| C1 | Control | ERISA Fiduciary Duty | [ERISA-FIDUCIARY] ERISA §404 — plan administrator must audit for over-billing and phantom coverage; over-deductions from employee paychecks are fiduciary violations requiring prompt correction and reimbursement |
| C2 | Control | ERISA | [ERISA] 29 U.S.C. §1109 — breach of fiduciary duty; plan participants must not bear the cost of administrative errors; plan administrator is personally liable for losses arising from fiduciary breach |
| O1 | Output | Annual Benefits Audit Report | Three-way reconciliation results: MECH-BENEFITS vs. carrier vs. MECH-PAYROLL; complete discrepancy list (employee ID, benefit line, discrepancy type, dollar amount, correction action and target date); confirmation of zero phantom enrollees at audit close |
| M1 | Mechanism | Benefits Administration Platform | [MECH-BENEFITS] — enrollment data source |
| M2 | Mechanism | Business Intelligence | [MECH-BI] Tableau, Looker, Sigma — three-way reconciliation query and discrepancy flagging |

**Definition of Done:** Annual Benefits Audit Report documents every discrepancy identified AND every discrepancy with a dollar value ≥$1.00 has a documented correction action with a target completion date AND the carrier confirmation roster shows zero phantom enrollees (employees covered by carrier but not in MECH-BENEFITS as active) after the correction window closes.

---

## Post-Sprint QA Checklist

- [x] Every L5 and L6 node has exactly one complete IDEF0 block
- [x] No L6 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md (R2.1)
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md (R2.2)
- [x] Every Output (O) names a specific artifact or verifiable state change (R2.3)
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1=A13322.O1; O2=A13323.O3; O3=A13324.O1; O4=A13326.O2; O5=A13325.O1+O2+O3 [added post-audit F2]; O6=A13323.O1 [added post-audit F3]
- [x] No skill appears under more than one function node (R4.3)
- [x] All cross-function skills cite IF-A1-15, IF-A1-16, IF-A1-17 (R4.1/R4.2)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L5 node names are active verb phrases (R1.2) — all six phases verified
- [x] Leaf node count confirmed: 18 (3 per phase × 6 phases)
- [x] All mandatory inclusions verified (see Domain Header Block)
- [x] New constraint codes (ERISA-5500, ERISA-FIDUCIARY, ACA-1095C, IRC-223, IRC-129) added to ctrl-constraint-library.md
- [x] New mechanism code (MECH-401K) added to ctrl-mechanism-catalog.md
- [x] New interfaces (IF-A1-15, IF-A1-16, IF-A1-17) registered in ctrl-interface-register.md
