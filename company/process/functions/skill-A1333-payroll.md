---
type: skill
node: A1333
domain: Payroll Processing
version: 1.0
sprint-date: 2026-03-11
status: complete
---

# Skill File: Payroll Processing

**Node:** A1333
**Parent:** A133 Compensation & Benefits → A13 People → A1 Governance
**Function:** Execute periodic pay runs by computing all earnings, withholdings, and deductions, disbursing net pay, and filing all required tax returns and deposits
**Supreme Constraint:** [FLSA-OT] 29 U.S.C. §207; [IRC-3402] IRC §3402; [IRC-3111] IRC §3111; [NACHA-ACH] NACHA Operating Rules; [IRS-EFTPS] IRS Publication 15 §11
**Cross-Function Interfaces:** IF-A1-11 (A13 → A11 Payroll Journal Entry); IF-A1-12 (A13 → A11 Quarterly Tax Liability Reconciliation)
**Sprint Date:** 2026-03-11
**Leaf Node Count:** 18 (confirmed at sprint close)
**Hierarchy Depth:** L6 (A1333 = L4; A13331–A13335 = L5; A133311–A133353 = L6)

**Mandatory Inclusions Verified:**
- [x] Gross pay computation — [FLSA-OT] → A133311
- [x] Federal income tax withholding — [IRC-3402] → A133313
- [x] Social Security withholding — [IRC-3101] → A133314
- [x] Medicare withholding — [IRC-3102] → A133315
- [x] Employer FICA computation — [IRC-3111] → A133331
- [x] FUTA computation — [IRC-3301] → A133332
- [x] Pre-tax deduction ordering — [IRC-125] → A133312
- [x] 401(k) deferral application — [IRC-401K] → A133321
- [x] Garnishment processing — [CCPA-GARNISH] → A133322
- [x] Direct deposit file generation — [NACHA-ACH] → A133323
- [x] EFTPS tax deposit — [IRS-EFTPS] → A133333
- [x] Quarterly Form 941 filing — [FORM-941] → A133341
- [x] Annual FUTA Form 940 filing — [FORM-940] → A133342
- [x] W-2 generation and IRS e-file — [FORM-W2] → A133343
- [x] GL journal entry construction — [MATH-GAAP-AXIOMS] → A133351
- [x] Payroll three-way reconciliation — [MATH-GAAP-AXIOMS] → A133352
- [x] Off-cycle payroll run — termination, correction → A133353
- [x] State income tax withholding — [STATE-WH] → A133316

---

## Scale Independence Note

All Mechanism fields in this skill file reference [MECH-CODE] categories, not specific vendors. Instance-specific configuration — payroll processor selection, active state jurisdictions, GL chart of accounts, bank routing, deposit schedule classification — is defined in `instances/[entity]/` and does not alter this universal skill file. The governing constraints (federal and state laws) apply identically regardless of company size or headcount.

---

## Node Tree

```
A1333  Payroll Processing (L4)
├── A13331  Compute Payroll and Withholdings (L5)
│   ├── A133311  Gross Pay Calculation (L6)
│   ├── A133312  Pre-Tax Deduction Ordering (L6)
│   ├── A133313  Federal Income Tax Withholding (L6)
│   ├── A133314  Social Security Withholding (L6)
│   ├── A133315  Medicare Withholding (L6)
│   └── A133316  State Income Tax Withholding (L6)
├── A13332  Process Deductions and Disburse Pay (L5)
│   ├── A133321  401(k) Deferral Application (L6)
│   ├── A133322  Garnishment Processing (L6)
│   └── A133323  Direct Deposit File Generation (L6)
├── A13333  Compute Employer Tax Obligations (L5)
│   ├── A133331  Employer FICA Computation (L6)
│   ├── A133332  FUTA Computation (L6)
│   └── A133333  EFTPS Tax Deposit (L6)
├── A13334  File Periodic Payroll Tax Returns (L5)
│   ├── A133341  Quarterly Form 941 Filing (L6)
│   ├── A133342  Annual Form 940 Filing (L6)
│   └── A133343  W-2 Generation & IRS e-File (L6)
└── A13335  Reconcile and Control Payroll (L5)
    ├── A133351  GL Journal Entry Construction (L6)
    ├── A133352  Three-Way Payroll Reconciliation (L6)
    └── A133353  Off-Cycle Payroll Run (L6)

```

---

## A1333: Payroll Processing — ICOM (L4)

**Parent:** A133 (box 3)
**Function:** Execute periodic pay runs by computing all earnings, withholdings, and deductions, disbursing net pay, and filing all required tax returns and deposits
**Supreme Constraint:** [FLSA-OT] FLSA overtime rules; [IRC-3402] federal withholding; [IRC-3111] employer FICA; [NACHA-ACH] ACH standards; [IRS-EFTPS] deposit rules; [STATE-WH] state wage laws

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Approved Time & Attendance Records | Hours, OT, leave per employee — from [MECH-HRIS] |
| I2 | Input | Compensation Framework | Pay rates and grades from A1331 |
| I3 | Input | Pre-tax Deduction Schedule | Health, FSA, 401k amounts from A1332 |
| I4 | Input | Garnishment Orders | Court-issued withholding orders on file |
| C1 | Control | [FLSA-OT] FLSA Overtime Rules | 1.5× regular rate for hours >40/week; non-exempt employees |
| C2 | Control | [IRC-3402] Federal Withholding | IRS Pub 15 withholding tables; W-4 elections |
| C3 | Control | [IRC-3101/3102] Employee FICA | 6.2% SS; 1.45% Medicare |
| C4 | Control | [IRC-3111] Employer FICA | Employer matches employee SS and Medicare |
| C5 | Control | [IRC-125] Pre-Tax Ordering | Benefits deducted before FICA and FIT computation |
| C6 | Control | [CCPA-GARNISH] Garnishment Caps | 25% disposable earnings or 30×MW floor, whichever less |
| C7 | Control | [NACHA-ACH] ACH Standards | PPD entry class; 2-day settlement; return code handling |
| C8 | Control | [IRS-EFTPS] Deposit Schedule | Monthly vs. semi-weekly; next-day rule for ≥$100K |
| C9 | Control | [STATE-WH] State Wage Laws | Withholding tables, pay frequency, final pay rules — per jurisdiction |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | ADP Workforce Now, ADP RUN, Gusto, Paychex Flex, Rippling |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | Workday, BambooHR, ADP, UKG, Rippling |
| M3 | Mechanism | [MECH-EFTPS] IRS EFTPS | Electronic Federal Tax Payment System |
| M4 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | SAP, Oracle, NetSuite, QuickBooks |
| O1 | Output | Employee Net Pay | ACH deposit file → NACHA network → employees |
| O2 | Output | Payroll Journal Entry | GL debit/credit pairs, zero-balanced → Finance A11 |
| O3 | Output | EFTPS Tax Deposit | FIT + FICA → IRS; confirmation number |
| O4 | Output | Quarterly Form 941 | Employer's quarterly federal tax return → IRS |
| O5 | Output | Annual Form 940 / W-2 | FUTA return; wage statements → IRS/SSA/employees |
| O6 | Output | State Tax Filings | Withholding deposits + returns → state agencies |

**Child Diagrams:** A13331, A13332, A13333, A13334, A13335

---

## A13331: Compute Payroll and Withholdings — ICOM (L5)

**Parent:** A1333 (box 1)
**Function:** Compute employee gross pay, apply all pre-tax deductions in statutory order, and calculate all employee tax withholdings to produce a net taxable wages schedule and withholding register per employee
**Supreme Constraint:** [FLSA-OT] overtime; [IRC-125] deduction ordering; [IRC-3402] FIT tables; [IRC-3101/3102] FICA rates; [STATE-WH] state withholding

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Time & Attendance Records | Hours by type (regular, OT, PTO, holiday) per employee from [MECH-HRIS] |
| I2 | Input | Compensation Framework | Hourly/salary rates per employee from A1331 |
| I3 | Input | Pre-Tax Deduction Elections | Health, FSA, HSA, 401k amounts from A1332 |
| I4 | Input | Employee Withholding Forms | W-4 and state equivalent — filing status, allowances on file in [MECH-HRIS] |
| C1 | Control | [FLSA-OT] Overtime Rules | 1.5× regular rate; hours >40 in workweek; non-exempt only |
| C2 | Control | [IRC-125] Pre-Tax Ordering | §125 elections reduce FICA and FIT taxable wages; applied before tax computation |
| C3 | Control | [IRC-3402] FIT Withholding Tables | IRS Pub 15; supplemental rate 22% |
| C4 | Control | [IRC-3101/3102] Employee FICA Rates | SS 6.2% up to wage base; Medicare 1.45% + 0.9% above $200K |
| C5 | Control | [STATE-WH] State Withholding Rules | Per-jurisdiction withholding tables; instance-configured |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | |
| O1 | Output | Gross Pay Register | Per-employee: regular pay, OT pay, total gross |
| O2 | Output | Taxable Wages Schedule | Per-employee: FICA taxable wages, FIT taxable wages, pre-tax deduction total |
| O3 | Output | Employee Tax Withholding Register | Per-employee: FIT withheld, SS withheld, Medicare withheld, state withheld |

**Child Nodes:** A133311, A133312, A133313, A133314, A133315, A133316

---

#### A133311: Gross Pay Calculation

**Agent Definition:** Compute total gross pay for each active employee for the pay period by applying [FLSA-OT] overtime rules to HRIS time records and multiplying by the applicable rate from the Compensation Framework, producing a per-employee gross pay register.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Time & Attendance Records | Clocked hours by employee, period, and type (regular, OT, PTO, holiday) — exported from [MECH-HRIS] for the pay period |
| I2 | Input | Compensation Framework | Hourly rate or salary amount per employee from A1331; exempt/non-exempt classification |
| C1 | Control | [FLSA-OT] FLSA Overtime Requirements | 29 U.S.C. §207; 29 CFR Part 778 — 1.5× regular rate for hours >40/workweek for non-exempt employees; exempt employees receive salary regardless of hours |
| C2 | Control | [FLSA-MW] FLSA Minimum Wage | 29 U.S.C. §206 — effective hourly rate must meet or exceed federal or applicable state minimum, whichever is higher |
| O1 | Output | Gross Pay Register | Per-employee row: Employee ID, pay period dates, regular hours, OT hours, regular pay, OT pay, other pay types, total gross pay |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | ADP Workforce Now / Gusto / Paychex Flex — imports HRIS time data and applies rate × hours |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | Source of time & attendance records and compensation data |

**Definition of Done:** Gross Pay Register contains one row for every active employee in the pay period; OT pay = 0 for all exempt-classified employees; effective hourly rate ≥ applicable minimum wage for all non-exempt employees; sum of regular + OT + supplemental = total gross per employee.

---

#### A133312: Pre-Tax Deduction Ordering

**Agent Definition:** Apply all eligible §125 and 401(k) pre-tax elections to each employee's gross pay in the statutory sequence to compute separate FICA taxable wages and FIT taxable wages, reducing them from gross pay before any tax computation occurs.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Gross Pay Register | Per-employee total gross pay from A133311 |
| I2 | Input | Pre-Tax Deduction Schedule | Per-employee elections: health premium, dental, vision, FSA, HSA, traditional 401(k) amounts — from A1332 |
| C1 | Control | [IRC-125] Cafeteria Plan Pre-Tax Deductions | IRC §125 — §125 plan elections (health, dental, FSA, HSA) reduce both FICA and FIT taxable wages; applied before SS and FIT computation |
| C2 | Control | [IRC-401K] 401(k) Deferral Treatment | IRC §401(k) traditional deferrals reduce FIT taxable wages only; not exempt from FICA |
| O1 | Output | Taxable Wages Schedule | Per-employee: total pre-tax deductions, FICA taxable wages (gross − §125), FIT taxable wages (gross − §125 − 401k traditional) |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Plan type configuration drives deduction order and taxability |

**Definition of Done:** Taxable Wages Schedule produced for all active employees; FICA taxable wages ≤ gross pay; FIT taxable wages ≤ FICA taxable wages; sum of all pre-tax deductions reconciles to benefits enrollment records in [MECH-HRIS] with $0 variance.

---

#### A133313: Federal Income Tax Withholding

**Agent Definition:** Calculate the federal income tax withholding amount for each employee by applying the IRS Publication 15 percentage method or wage bracket method to FIT taxable wages using the employee's W-4 filing status and allowances.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Taxable Wages Schedule | FIT taxable wages per employee from A133312 |
| I2 | Input | W-4 Elections | Employee's current W-4: filing status (Single/MFJ/HoH), Step 3 dependents credit, Step 4 additional withholding or exemption claim — on file in [MECH-HRIS] |
| C1 | Control | [IRC-3402] Federal Income Tax Withholding | IRC §3402; IRS Publication 15 (Circular E) — percentage method tables; supplemental wage rate 22% (2024); flat rate for exempt supplemental over $1M: 37% |
| O1 | Output | FIT Withholding Register | Per-employee: FIT taxable wages, withholding method applied, FIT withheld this period |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | W-4 data and current-year IRS withholding tables maintained in payroll system |

**Definition of Done:** FIT Withholding Register produced for all active employees; withholding = 0 for employees claiming exempt (valid W-4 on file); supplemental payments use 22% flat rate unless aggregate method elected; no employee has negative FIT withholding.

---

#### A133314: Social Security Withholding

**Agent Definition:** Calculate the employee Social Security tax withholding by applying the statutory 6.2% rate to FICA taxable wages, capping at zero for employees whose year-to-date SS wages have already reached or exceeded the annual SS wage base.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Taxable Wages Schedule | FICA taxable wages per employee this period from A133312 |
| I2 | Input | Year-to-Date SS Wages | Cumulative SS-subject wages per employee in the calendar year — from [MECH-HRIS] |
| C1 | Control | [IRC-3101] Employee Social Security Tax | IRC §3101 — 6.2% on wages up to the annual SS wage base ($168,600 for 2024; indexed annually by SSA); no SS withholding once wage base is reached |
| O1 | Output | SS Withholding Register | Per-employee: SS-subject wages this period, SS withheld this period, YTD SS wages, YTD SS withheld |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Tracks YTD wages and applies wage base cap per employee |

**Definition of Done:** SS Withholding Register produced for all employees; SS withheld = 0 for any employee whose YTD SS wages equaled or exceeded the annual wage base before this period; YTD SS wages for no employee exceed the annual wage base after this period.

---

#### A133315: Medicare Withholding

**Agent Definition:** Calculate the employee Medicare tax withholding by applying 1.45% to all FICA taxable wages, plus the Additional Medicare Tax of 0.9% on wages exceeding $200,000 in the calendar year, with no wage base cap.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Taxable Wages Schedule | FICA taxable wages per employee this period from A133312 |
| I2 | Input | Year-to-Date Medicare Wages | Cumulative Medicare-subject wages per employee in the calendar year — from [MECH-HRIS] |
| C1 | Control | [IRC-3102] Employee Medicare Tax | IRC §3102 — 1.45% on all wages (no cap); Additional Medicare Tax 0.9% on wages >$200,000 per employee per year; employer must begin withholding in the pay period wages exceed $200K |
| O1 | Output | Medicare Withholding Register | Per-employee: Medicare wages this period, standard Medicare withheld (1.45%), additional Medicare withheld (0.9%), YTD Medicare wages, YTD Medicare withheld |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Tracks YTD wages; applies additional Medicare threshold automatically |

**Definition of Done:** Medicare Withholding Register produced for all employees; standard rate 1.45% applied to all FICA wages with no cap; additional 0.9% applied starting the period cumulative wages cross $200K; total Medicare = standard + additional for each employee.

---

#### A133316: State Income Tax Withholding

**Agent Definition:** Calculate state income tax withholding for each employee in every jurisdiction where services were performed during the period by applying the applicable state withholding tables and the employee's state tax elections on file.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Taxable Wages Schedule | FIT taxable wages per employee from A133312 — baseline; state taxable income may differ per state rules |
| I2 | Input | State Tax Withholding Elections | State equivalent of W-4 per active jurisdiction — filing status, allowances on file in [MECH-HRIS] |
| I3 | Input | Work Location Records | State(s) in which each employee performed services this period — from [MECH-HRIS] |
| C1 | Control | [STATE-WH] State Income Tax Withholding Laws | Each active state's current withholding tables, rates, and rules — instance-configured per jurisdiction; no withholding for employees in states with no income tax (TX, FL, WA, NV, WY, AK, SD) |
| O1 | Output | State Tax Withholding Register | Per-employee, per state: state taxable wages, state income tax withheld, jurisdiction code |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Multi-state withholding tables configured per instance jurisdictions |

**Definition of Done:** State Tax Withholding Register produced for all employees in all active jurisdictions; $0 withholding for employees in no-income-tax states produces no error; multi-state employees produce one row per jurisdiction; total state withholding per employee reconciles across all active states.

---

## A13332: Process Deductions and Disburse Pay — ICOM (L5)

**Parent:** A1333 (box 2)
**Function:** Apply post-tax deductions (401k deferral transmission, garnishments), finalize employee net pay, and generate and submit the NACHA ACH direct deposit file for the pay period
**Supreme Constraint:** [IRC-401K] deferral limits; [CCPA-GARNISH] maximum garnishment caps; [NACHA-ACH] ACH origination rules

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Taxable Wages Schedule | From A133312 — basis for net pay computation |
| I2 | Input | Employee Tax Withholding Register | FIT, SS, Medicare, state withheld from A13331 |
| I3 | Input | 401(k) Contribution File | Employee deferral amounts from A1332 |
| I4 | Input | Garnishment Orders | Active court-issued withholding orders from [MECH-HRIS] |
| I5 | Input | Employee Bank Accounts | Routing number, account number, account type — from [MECH-HRIS] |
| C1 | Control | [IRC-401K] 401(k) Deferral Limits | Annual elective deferral limit; catch-up for age 50+ |
| C2 | Control | [CCPA-GARNISH] Garnishment Maximum | 25% disposable earnings or 30×federal MW/week, whichever less; child support priority |
| C3 | Control | [NACHA-ACH] ACH Origination Rules | PPD entry class; 2-banking-day settlement; 8-character company entry description |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | |
| M2 | Mechanism | [MECH-BENEFITS] Benefits Administration | 401(k) plan provider integration |
| O1 | Output | Net Pay Register | Per-employee: gross, total deductions, net pay |
| O2 | Output | 401(k) Contribution File | Aggregated deferrals → plan provider |
| O3 | Output | Garnishment Remittance Schedule | Per order: amount, creditor payee |
| O4 | Output | NACHA ACH File | Formatted direct deposit file → originating bank |
| O5 | Output | Bank Transmission Confirmation | Bank acknowledgment of ACH file receipt |

**Child Nodes:** A133321, A133322, A133323

---

#### A133321: 401(k) Deferral Application

**Agent Definition:** Deduct each enrolled employee's elective 401(k) deferral from net pay after verifying the contribution does not cause the employee to exceed the annual IRS deferral limit, and transmit the aggregated contribution file to the plan provider.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | 401(k) Contribution File | Per-employee deferral election amounts from A1332 |
| I2 | Input | Year-to-Date 401(k) Deferrals | Cumulative employee elective deferrals for the calendar year — from [MECH-HRIS] |
| C1 | Control | [IRC-401K] Annual Deferral Limit | IRC §401(k) — $23,000 employee elective deferral limit for 2024; $30,500 with catch-up for participants age 50+; IRS Notice updates limit annually |
| O1 | Output | 401(k) Deduction Confirmation | Per-employee: deferral amount deducted from gross, applied to net pay calculation |
| O2 | Output | Plan Provider Contribution File | Aggregated file: Employee ID, deferral amount, pay period end date → 401(k) plan provider for funding |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Tracks YTD deferrals; flags and blocks contributions that would exceed annual limit |
| M2 | Mechanism | [MECH-BENEFITS] Benefits Administration | Plan provider EDI/API for contribution file transmission |

**Definition of Done:** 401(k) deduction applied for all enrollees; no employee's YTD deferral exceeds the annual IRS limit after this period; plan provider returns contribution file acknowledgment; deferral amounts reconcile to benefits enrollment records.

---

#### A133322: Garnishment Processing

**Agent Definition:** Apply all active court-issued garnishment orders to employee net pay in legally mandated priority sequence, enforce the CCPA maximum withholding cap, and produce a remittance schedule for each creditor.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Garnishment Orders | Active orders on file: creditor name, withholding amount or percentage, order type (child support, tax levy, creditor), priority, expiration date — maintained in [MECH-HRIS] |
| I2 | Input | Disposable Earnings | Net pay after mandatory deductions (taxes) per employee — from this period's withholding register |
| C1 | Control | [CCPA-GARNISH] Consumer Credit Protection Act Garnishment Cap | 15 U.S.C. §1673 — maximum withholding: lesser of 25% disposable earnings or amount by which earnings exceed 30× federal MW/week; priority: child support/alimony > federal/state tax levy > creditor garnishments |
| O1 | Output | Garnishment Withholding Applied | Per-employee, per order: amount withheld this period, YTD withheld, remaining balance (if fixed amount order) |
| O2 | Output | Garnishment Remittance Schedule | Per active order: creditor payee, remittance address, amount due this period |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Garnishment module with priority sequencing and CCPA cap enforcement |

**Definition of Done:** Withholding applied for all employees with active orders; total garnishment withheld does not exceed CCPA cap for any employee; remittance schedule produced for all active orders; no expired orders processed.

---

#### A133323: Direct Deposit File Generation

**Agent Definition:** Aggregate all employee net pay amounts with their bank account details and generate a NACHA-compliant ACH credit file, submit it to the originating bank with sufficient lead time to settle on the pay date, and obtain a transmission confirmation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Net Pay Register | Per-employee: net pay amount, bank routing number (9-digit ABA), account number, account type (checking/savings) — from [MECH-HRIS] |
| I2 | Input | Company Bank Account Details | Originating DFI routing number, company account number, ODFI ID — instance configuration |
| C1 | Control | [NACHA-ACH] NACHA ACH Origination Rules | PPD (Prearranged Payment and Deposit) entry class for payroll; 2-banking-day settlement required; file must pass hash total validation; return code handling within 2 banking days of settlement |
| O1 | Output | NACHA ACH File | Properly formatted file: file header (1-record), batch header (5-record), PPD detail records (6-records), batch control (8-record), file control (9-record) |
| O2 | Output | Bank Transmission Confirmation | SFTP acknowledgment or API HTTP 200 from originating bank confirming file receipt and acceptance |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | NACHA file generation and direct bank transmission |

**Definition of Done:** NACHA ACH file generated and transmitted; file hash total = sum of all 8-digit ABA routing numbers in all detail records; bank transmission confirmation received; file submitted ≥2 banking days before company pay date.

---

## A13333: Compute Employer Tax Obligations — ICOM (L5)

**Parent:** A1333 (box 3)
**Function:** Compute the employer's FICA match and FUTA liabilities, and execute federal payroll tax deposits via IRS EFTPS within the required deposit schedule window
**Supreme Constraint:** [IRC-3111] employer FICA matching; [IRC-3301] FUTA; [IRS-EFTPS] deposit schedule

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employee FICA Withheld | SS and Medicare withheld from A133314 and A133315 — basis for employer match |
| I2 | Input | FICA Taxable Wages | From A133312 — for employer FICA computation |
| I3 | Input | YTD FUTA Wages | Cumulative FUTA-subject wages per employee — from [MECH-HRIS] |
| I4 | Input | FIT Withheld | From A133313 — included in EFTPS deposit |
| I5 | Input | State UI Payment Records | Timely state unemployment payments — confirms FUTA credit |
| I6 | Input | Deposit Schedule Classification | Monthly or semi-weekly depositor status — instance configuration |
| C1 | Control | [IRC-3111] Employer FICA | Employer SS: 6.2% to wage base; Employer Medicare: 1.45% on all wages; no employer additional Medicare |
| C2 | Control | [IRC-3301] FUTA | 6.0% on first $7,000/employee/year; net 0.6% with timely state UI credit |
| C3 | Control | [IRS-EFTPS] Deposit Schedule | Monthly: by 15th of following month; semi-weekly: Wed/Fri; next-day rule if cumulative liability ≥$100K |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | |
| M2 | Mechanism | [MECH-EFTPS] IRS EFTPS | ACH debit; enroll at eftps.gov; 8 PM ET cutoff |
| O1 | Output | Employer Tax Liability Register | Period employer SS, employer Medicare, FUTA liability |
| O2 | Output | EFTPS Deposit Confirmation | Transaction ID + confirmation number + deposit date from IRS |

**Child Nodes:** A133331, A133332, A133333

---

#### A133331: Employer FICA Computation

**Agent Definition:** Calculate the employer's matching FICA obligation for the period by applying the statutory employer SS and Medicare rates to each employee's FICA taxable wages, producing an employer tax liability register.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | SS Withholding Register | Per-employee SS-subject wages and employee SS withheld from A133314 — basis for employer match |
| I2 | Input | Medicare Withholding Register | Per-employee Medicare wages and employee Medicare withheld from A133315 |
| C1 | Control | [IRC-3111] Employer FICA Tax | IRC §3111 — Employer SS: 6.2% on SS-subject wages up to wage base (equals employee SS withheld, 1:1 match); Employer Medicare: 1.45% on all wages (no cap); employer does not match the Additional Medicare 0.9% |
| O1 | Output | Employer FICA Liability Register | Per-employee: employer SS liability, employer Medicare liability; period total employer FICA |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Auto-computes employer match from employee withholding records |

**Definition of Done:** Employer FICA Liability Register produced; employer SS = employee SS withheld for each employee below the wage base; employer SS = 0 for employees above the wage base; employer Medicare = 1.45% × all Medicare wages; period total matches payroll processor employer tax report.

---

#### A133332: FUTA Computation

**Agent Definition:** Calculate the employer's FUTA tax liability for the period by applying the statutory rate to each employee's FUTA-subject wages, capping at the per-employee annual wage base, and applying the state UI credit to arrive at the net FUTA rate.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FICA Taxable Wages | Gross wages per employee from A133312 — same wages subject to FUTA (earnings up to $7,000 per employee per year) |
| I2 | Input | YTD FUTA Wages | Cumulative FUTA-subject wages per employee in the calendar year — from [MECH-HRIS] |
| I3 | Input | State UI Credit Evidence | Documentation of timely state unemployment insurance tax payments; confirms 5.4% credit eligibility |
| C1 | Control | [IRC-3301] FUTA Tax Rate | IRC §3301 — Gross rate 6.0% on first $7,000 wages per employee per year; credit of up to 5.4% for timely state UI payments; net rate 0.6% with full credit |
| O1 | Output | FUTA Liability Register | Per-employee: FUTA wages this period, FUTA liability this period, YTD FUTA wages, cumulative FUTA liability |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Tracks FUTA wage base per employee; applies state credit |

**Definition of Done:** FUTA Liability Register produced; FUTA wages = 0 for employees whose YTD wages exceeded $7,000 before this period; net rate = 0.6% if state UI paid timely; cumulative FUTA liability triggers EFTPS deposit when it exceeds $500.

---

#### A133333: EFTPS Tax Deposit

**Agent Definition:** Aggregate the period's FIT withheld plus total employee and employer FICA into a single federal tax deposit and submit it via IRS EFTPS within the required deposit schedule window, obtaining a transaction confirmation number.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FIT Withholding Register | Total FIT withheld for all employees this period from A133313 |
| I2 | Input | Employee FICA Withheld | Total SS + Medicare withheld from A133314 and A133315 |
| I3 | Input | Employer FICA Liability Register | Employer SS + employer Medicare from A133331 |
| I4 | Input | Deposit Schedule Classification | Monthly vs. semi-weekly depositor classification from instance config; lookback period used to determine |
| C1 | Control | [IRS-EFTPS] EFTPS Deposit Schedule Rules | IRS Publication 15 §11 — semi-weekly: deposit by Wed for Sat/Sun/Mon/Tue paydays, by Fri for Wed/Thu/Fri paydays; monthly: deposit by 15th of following month; next-day rule: cumulative liability ≥$100K in any period requires next-banking-day deposit |
| O1 | Output | EFTPS Deposit Confirmation | IRS-assigned transaction ID, confirmation number, deposit date, and deposit amount |
| M1 | Mechanism | [MECH-EFTPS] IRS EFTPS | ACH debit initiated via eftps.gov or payroll processor integration; 8 PM ET cutoff for same-day processing |

**Definition of Done:** EFTPS returns transaction confirmation number; deposit amount = FIT withheld + employee SS + employee Medicare + employer SS + employer Medicare for the period; deposit date is on or before IRS deadline for the company's depositor classification; confirmation stored in payroll records.

**Cross-Function:** [CROSS-FUNCTION: A13 → A11] EFTPS deposit reduces company cash; impacts Finance A11 treasury position. Cash outflow is captured in the payroll journal entry posted via IF-A1-11.

---

## A13334: File Periodic Payroll Tax Returns — ICOM (L5)

**Parent:** A1333 (box 4)
**Function:** Prepare and file all required periodic and annual payroll tax returns with federal and state tax authorities, and generate and distribute W-2 wage statements to employees and the SSA
**Supreme Constraint:** [FORM-941] quarterly deadline; [FORM-940] annual deadline; [FORM-W2] January 31 distribution and e-file; [STATE-WH] state tax return deadlines and deposit schedules

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Quarterly Payroll Tax Summary | Aggregate FIT, SS, Medicare (employee + employer) by quarter — from [MECH-PAYROLL] |
| I2 | Input | EFTPS Deposit Records | All deposit confirmation numbers for the period from A133333 |
| I3 | Input | Annual FUTA Liability | Cumulative FUTA from A133332 |
| I4 | Input | Annual W-2 Data | Per-employee YTD: wages, all withholdings, pre-tax benefit amounts — from [MECH-PAYROLL] |
| I5 | Input | Employee SSN and Address | Verified records from [MECH-HRIS] |
| C1 | Control | [FORM-941] Quarterly Return Rules | Due last day of month following quarter end; Schedule B required for semi-weekly depositors |
| C2 | Control | [FORM-940] Annual FUTA Rules | Due January 31; deposit any balance >$500 before filing |
| C3 | Control | [FORM-W2] W-2 Filing Rules | January 31 employee distribution and SSA e-file; e-file required for 10+ W-2s |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Generates and e-files returns; produces employee W-2 copies |
| O1 | Output | Filed Form 941 | IRS e-file acceptance confirmation + confirmation number |
| O2 | Output | Filed Form 940 | IRS e-file acceptance confirmation |
| O3 | Output | Distributed W-2s | Employee copies delivered; SSA e-file acceptance confirmation |
| O4 | Output | State Tax Returns and Deposits | State withholding deposits + quarterly and annual state income tax returns → state tax agencies; confirmation numbers per active jurisdiction (produced by A133341–A133343 via [MECH-PAYROLL] multi-state filing capability) |

**Child Nodes:** A133341, A133342, A133343

---

#### A133341: Quarterly Form 941 Filing

**Agent Definition:** Compile all payroll tax data for the quarter, complete IRS Form 941 and Schedule B (if applicable), and e-file with the IRS by the quarterly deadline, confirming that total deposits equal the tax liability on the return.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Quarterly Tax Summary | Per-quarter totals: wages paid, FIT withheld, SS wages + tax (employee + employer), Medicare wages + tax (employee + employer) — exported from [MECH-PAYROLL] |
| I2 | Input | EFTPS Deposit Confirmation Records | Transaction IDs and amounts for all deposits made during the quarter from A133333 |
| C1 | Control | [FORM-941] IRS Form 941 Instructions | Employer's Quarterly Federal Tax Return; due: April 30, July 31, October 31, January 31; Schedule B required for semi-weekly depositors showing daily tax liability; IRS e-file required for most filers |
| O1 | Output | Filed Form 941 | IRS e-file acceptance with Electronic Return Originator (ERO) confirmation number |
| O2 | Output | Deposit Reconciliation | Total quarterly deposits from EFTPS records = total tax liability on Form 941, $0 variance |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Generates Form 941 data; e-files or exports to tax agent |

**Definition of Done:** IRS returns e-file acceptance for Form 941; total EFTPS deposits for the quarter equal Form 941 total tax liability to $0.00; Schedule B attached if company is a semi-weekly depositor; filed on or before quarterly deadline.

**Cross-Function:** [CROSS-FUNCTION: A13 → A11] *Interface: IF-A1-12* — Quarterly tax liability reconciliation package delivered to Finance A11 for tax accrual clearance.

---

#### A133342: Annual Form 940 Filing

**Agent Definition:** Compile the annual FUTA tax liability from all quarters, verify state UI payment credit eligibility, complete IRS Form 940, deposit any balance exceeding $500, and e-file with the IRS by January 31.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Annual FUTA Liability Register | Cumulative FUTA from all quarters from A133332; per-employee FUTA wages not to exceed $7,000 |
| I2 | Input | State UI Payment Records | Evidence of timely state unemployment insurance payments for all four quarters — qualifies employer for 5.4% credit |
| C1 | Control | [IRC-3301] FUTA Net Rate | 6.0% gross; 5.4% credit for timely state UI payments; net 0.6%; credit reduced if state UI paid late or if state is a credit reduction state |
| C2 | Control | [FORM-940] IRS Form 940 Instructions | Annual FUTA return; due January 31; deposit any balance >$500 via EFTPS before filing |
| O1 | Output | Filed Form 940 | IRS e-file acceptance with confirmation number |
| O2 | Output | FUTA Balance Deposit | EFTPS deposit confirmation if balance >$500 |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Generates Form 940; tracks FUTA wages and state credit |
| M2 | Mechanism | [MECH-EFTPS] IRS EFTPS | Deposit of any balance |

**Definition of Done:** IRS returns e-file acceptance for Form 940; net FUTA = 0.6% of first $7,000 wages per employee (assuming full state credit); any balance >$500 deposited before filing; filed on or before January 31.

---

#### A133343: W-2 Generation and IRS e-File

**Agent Definition:** Generate W-2 wage and tax statements for all employees who received wages in the calendar year, distribute employee copies by January 31, and e-file Copy A with the Social Security Administration via the IRS FIRE system or BSO.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Annual Payroll Summary | Per-employee YTD: Box 1 wages (FIT), Box 3 SS wages, Box 5 Medicare wages, Box 16 state wages; all withholdings; pre-tax benefits (Box 12 codes) — from [MECH-PAYROLL] |
| I2 | Input | Employee Personal Records | Legal name, SSN, current address — verified in [MECH-HRIS]; SSN must be validated (not all 9s, not invalid format) |
| C1 | Control | [FORM-W2] IRS Form W-2 Instructions | Box-by-box completion; employer EIN required; January 31 deadline for both employee distribution and SSA e-file; 10+ W-2s require e-file (IRS threshold as of 2024); SSA e-file via IRS FIRE system or Business Services Online (BSO) |
| O1 | Output | Employee W-2 Copies (B, C, 2) | Delivered to employee address of record (paper or employer portal) by January 31 |
| O2 | Output | SSA e-File Confirmation | IRS FIRE or BSO returns acceptance with submission ID |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | W-2 generation, employee portal delivery or print/mail, SSA e-file transmission |

**Definition of Done:** W-2 generated for every employee with wages >$0 in the calendar year; employee copies delivered by January 31; SSA e-file returns acceptance; sum of all W-2 Box 1 wages reconciles to annual FIT taxable payroll register to $0.00 variance; SSNs pass format validation.

---

## A13335: Reconcile and Control Payroll — ICOM (L5)

**Parent:** A1333 (box 5)
**Function:** Verify payroll accuracy through three-way reconciliation across payroll system, bank, and general ledger; record the payroll liability and expense as a balanced journal entry; and process any off-cycle corrections or termination runs
**Supreme Constraint:** [MATH-GAAP-AXIOMS] double-entry identity; zero-variance reconciliation requirement

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Net Pay Register | From A13332 — total disbursements |
| I2 | Input | Employee Tax Withholding Register | From A13331 |
| I3 | Input | Employer Tax Liability Register | From A13333 |
| I4 | Input | EFTPS Deposit Confirmation | From A133333 |
| I5 | Input | Bank Statement / ACH Settlement | Actual ACH debits from company bank account for the period |
| I6 | Input | GL Chart of Accounts | Payroll expense, accrued liability, tax payable, cash account codes — instance configuration |
| I7 | Input | Off-Cycle Authorization | Principal-approved off-cycle run request (if applicable) |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | Total debits = total credits; $0 variance required |
| M1 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | SAP, Oracle, NetSuite, QuickBooks |
| M2 | Mechanism | [MECH-PAYROLL] Payroll Processor API | |
| O1 | Output | Posted Payroll Journal Entry | Confirmed GL posting: DR Payroll Expense / CR Wages Payable, Tax Payable, Benefits Withholding, Cash |
| O2 | Output | Three-Way Reconciliation Report | Payroll system = Bank = GL, $0 variance; signed off |
| O3 | Output | Off-Cycle Payroll Record | Correction or termination run processed and documented (if applicable) |

**Child Nodes:** A133351, A133352, A133353

---

#### A133351: GL Journal Entry Construction

**Agent Definition:** Construct and post the payroll journal entry for the period, recording gross payroll expense, all employee and employer tax liabilities, benefits withholdings, and net cash disbursement as zero-balanced debit/credit pairs in the general ledger.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Gross Pay Register | Total gross wages by cost center from A133311 |
| I2 | Input | Employee Tax Withholding Register | FIT, SS, Medicare, state totals from A13331 |
| I3 | Input | Employer FICA and FUTA | Employer tax liabilities from A133331 and A133332 |
| I4 | Input | Net Pay Register | Total ACH disbursement from A13332 |
| I5 | Input | Pre-Tax Benefits Deductions | Health, FSA, 401k deduction totals from A133312 |
| I6 | Input | GL Chart of Accounts | Account codes: Payroll Expense (debit), Wages Payable, Employee Tax Withheld, Employer Tax Payable, Benefits Withholding Payable, Cash/ACH Clearing (all credits) — instance configuration |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Accounting Identity | Pacioli (1494); FASB Conceptual Framework — every debit has a matching credit; total debits = total credits to $0.00 |
| O1 | Output | Posted Payroll Journal Entry | GL system confirms posting with transaction ID: DR Payroll Expense + DR Employer Tax Expense; CR Wages Payable + CR Employee Tax Withheld + CR Employer Tax Payable + CR Benefits Withholding + CR Cash |
| O2 | Output | Journal Entry Report | Line-item debit/credit listing with account codes, amounts, and GL transaction ID |
| M1 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | Journal entry creation and posting |
| M2 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Exports payroll register in journal entry format |

**Definition of Done:** Journal entry posted to GL with GL system transaction ID; total debits = total credits to $0.00; DR Payroll Expense = sum of all employee gross wages; DR Employer Tax Expense = employer FICA + FUTA for the period.

**Cross-Function:** [CROSS-FUNCTION: A13 → A11] *Interface: IF-A1-11* — Payroll journal entry posted to Finance A11 general ledger as an input to period accounting close.

---

#### A133352: Three-Way Payroll Reconciliation

**Agent Definition:** Reconcile the net payroll disbursement amount across three independent sources — payroll processor report, bank ACH settlement, and general ledger cash account — and confirm zero variance across all three before closing the pay period.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Payroll Processor Net Pay Report | Total net pay disbursed per payroll system for the period |
| I2 | Input | Bank Statement / ACH Settlement | Total ACH debit(s) from company payroll bank account for the same period |
| I3 | Input | GL Cash Account Activity | Movement in ACH clearing or payroll bank account in the GL for the same period |
| C1 | Control | [MATH-GAAP-AXIOMS] Zero-Variance Reconciliation | Payroll system total = bank total = GL total; any non-zero variance constitutes a stop condition requiring investigation before pay period close |
| O1 | Output | Three-Way Reconciliation Report | Table: Payroll System Total | Bank Total | GL Total | Variance (must = $0.00); date-stamped |
| M1 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | |
| M2 | Mechanism | [MECH-PAYROLL] Payroll Processor API | |

**Definition of Done:** Three-Way Reconciliation Report shows $0.00 variance across all three sources; report is date-stamped and filed in payroll period records; any non-zero variance blocks pay period close and triggers escalation to Principal for investigation.

---

#### A133353: Off-Cycle Payroll Run

**Agent Definition:** Execute a Principal-authorized off-cycle payroll run for a defined subset of employees (terminations, corrections, or manual adjustments), applying all standard A13331–A133352 computation and control steps to the affected employees only, and documenting the business reason.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Off-Cycle Run Authorization | Principal-signed approval: list of affected employee IDs, reason code (Involuntary Termination / Voluntary Termination / Pay Correction / Manual Adjustment), required pay date |
| I2 | Input | Corrected Time or Compensation Data | Amended hours, rates, or deductions for affected employees only — verified in [MECH-HRIS] |
| C1 | Control | [FLSA-OT] Final Pay Computation | Same FLSA overtime rules apply to final pay; all accrued OT must be paid |
| C2 | Control | [STATE-WH] State Final Pay Deadlines | Varies by state: CA = immediately upon involuntary termination; NY = next regular pay date; TX = next regular pay date; instance-configured per jurisdiction |
| C3 | Control | [NACHA-ACH] ACH Origination | Same NACHA format and lead-time requirements as regular payroll |
| O1 | Output | Off-Cycle Payroll Register | Processed payroll for affected employees: gross, deductions, net, reason code, authorization reference |
| O2 | Output | Off-Cycle ACH File | Direct deposit for affected employees — same NACHA format |
| O3 | Output | Off-Cycle Journal Entry | GL entry for off-cycle amounts — same structure as A133351 |
| O4 | Output | Off-Cycle Reconciliation Report | Three-way reconciliation for off-cycle run — same standard as A133352 |
| M1 | Mechanism | [MECH-PAYROLL] Payroll Processor API | Off-cycle run capability; subset processing |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | Termination date, reason code, and final pay data source |

**Definition of Done:** Off-cycle payroll processed for all authorized employees; ACH file generated and transmitted; GL journal entry posted with $0 variance; three-way reconciliation report shows $0 variance; business reason and authorization documented in payroll records; final pay delivered by state-mandated deadline for termination runs.

---

## Quality Assurance Checklist — Sprint Close

- [x] Every L6 node has exactly one complete IDEF0 block
- [x] No L6 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language
- [x] Boundary arrow correspondence holds at L5: union of A13331–A13335 outputs = A1333 outputs (O1=A13332; O2=A13335; O3=A13333; O4=A13334.O1; O5=A13334.O2; O6=A13334.O4 [State Tax Returns — added post-audit F3])
- [x] No skill appears under more than one L5 node
- [x] All cross-function skills cite interface IDs where registered
- [x] No banned verbs without measurable qualifier
- [x] Domain Header Block leaf-node count confirmed: 18
- [x] All mandatory A1333 inclusions checked

**Interface Register Status:** All A13 → A11 cross-function interfaces now registered: IF-A1-11 (Payroll Journal Entry, A133351 → A11 GL) and IF-A1-12 (Quarterly Tax Liability Reconciliation, A133341 → A11 tax accrual). Registered in ctrl-interface-register.md 2026-03-11.

---

*Scale note: This skill file is instance-agnostic. Mechanism vendor selections, active state jurisdictions, GL account codes, deposit schedule classification, and bank routing details are defined in `instances/[entity]/`. The governing constraints (federal law, NACHA, GAAP) are immutable regardless of company size.*

*Direct on.*
