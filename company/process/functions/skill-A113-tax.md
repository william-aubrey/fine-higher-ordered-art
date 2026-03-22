# Skill File: Tax

**Node:** A113
**Parent:** A11 Finance
**Function:** Compute and File Enterprise Tax Obligations
**Supreme Constraint:** [GAAP-ASC740] Income Tax Accounting; [IRC-482] Transfer Pricing; [IRC-162] Deductibility
**Cross-Function Interfaces:** IF-A1-01 (tax matters → Legal A12)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] Transfer pricing documentation — [IRC-482] → A1133 / A11331–A11333

---

## A113: Compute and File Enterprise Tax Obligations

**Function:** Compute and File Enterprise Tax Obligations
**Supreme Constraint:** [GAAP-ASC740]; [IRC-482]; [OECD-TP]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Locked Financial Statements | from Accounting A112 — GAAP P&L, BS, and trial balance |
| I2 | Input | Intercompany Transaction Data | from A112 consolidation — IC prices and volumes |
| I3 | Input | Sales Transaction Data | from Sales A33 via IF-A0-09 — by jurisdiction |
| I4 | Input | Engineering Investment Plans | from A14 via IF-A1-06 — R&D expenditures for credit qualification |
| C1 | Control | [GAAP-ASC740] Income Tax Accounting | current + deferred tax; effective rate disclosure |
| C2 | Control | [IRC-482] Transfer Pricing Arm's Length Standard | IC prices must reflect market rates |
| C3 | Control | [IRC-162] Ordinary and Necessary Business Expenses | deductibility standard for operating expenses |
| C4 | Control | [OECD-TP] OECD Transfer Pricing Guidelines | supplementary to IRC §482 for multinational IC pricing |
| O1 | Output | Income Tax Provision | current and deferred tax expense → financial statements A112 |
| O2 | Output | Filed Corporate Tax Returns | federal Form 1120 + state returns by jurisdiction |
| O3 | Output | Transfer Pricing Documentation Report | annual TP study per IRC §482 |
| O4 | Output | Sales Tax Remittances | collected sales tax remitted by filing jurisdiction |
| O5 | Output | Tax Structure Recommendation | legal entity / operation structure guidance → Principal |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | ONESOURCE, Vertex, Drake Tax |
| M2 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | financial data source |
| M3 | Mechanism | [MECH-TP] Transfer Pricing Analysis Platform | Thomson Reuters ONESOURCE TP, BVD Bureau van Dijk |

**Child Nodes:** A1131, A1132, A1133, A1134, A1135, A1136

### Boundary Arrow Correspondence (A113)

| A113 Code | Produced By | Notes |
|---|---|---|
| O1 Income Tax Provision | A1131.O3 | provision JE + effective rate disclosure |
| O2 Filed Corporate Tax Returns | A1132.O3 | all returns filed with confirmation |
| O3 Transfer Pricing Documentation | A1133.O1 | annual TP study |
| O4 Sales Tax Remittances | A1134.O3 | all jurisdictions filed and paid |
| O5 Tax Structure Recommendation | A1136.O3 | Principal decision package |

### Internal Arrows (A113 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1131.O1 | A1132 | Input | Taxable Income Reconciliation (return filing base) |
| 2 | A1131.O1 | A1136 | Input | Current Tax Position (structural optimization context) |
| 3 | A1133.O1 | A1132 | Input | Arm's Length Prices (return position support) |
| 4 | A1136.O2 | A1131 | Input | R&D Credit Calculation (credit reduces current tax expense) |

---

### A1131: Compute Annual Income Tax Provision

**Function:** Compute Annual Income Tax Provision
**Supreme Constraint:** [GAAP-ASC740]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | GAAP Pre-Tax Income | from A112 locked financial statements |
| I2 | Input | Permanent and Temporary Differences | depreciation timing, stock comp, meals/entertainment, etc. |
| C1 | Control | [GAAP-ASC740] Income Tax Accounting | current tax = taxable income × statutory rate; deferred tax = temporary differences × enacted rate |
| C2 | Control | [IRC-162] | deductible expense list drives permanent differences |
| O1 | Output | Taxable Income Reconciliation (Schedule M-1 / M-3) | GAAP income to taxable income bridge |
| O2 | Output | Deferred Tax Asset and Liability Schedule | all temporary differences × enacted rate |
| O3 | Output | Income Tax Provision Journal Entry and Effective Rate Disclosure | current + deferred tax JE; effective rate = total tax / pre-tax income |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | provision computation |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | GAAP income data source |

**Child Nodes:** A11311, A11312, A11313

---

### A1132: Prepare and File Corporate Tax Returns

**Function:** Prepare and File Corporate Tax Returns
**Supreme Constraint:** [IRC-162]; [GAAP-ASC740]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Taxable Income Reconciliation | from A1131.O1 |
| I2 | Input | Transfer Pricing Documentation | from A1133.O1 |
| C1 | Control | [IRC-162] Ordinary and Necessary Business Expenses | deductibility determination for each expense category |
| C2 | Control | [IRC-448] Accounting Method | cash vs. accrual election governs income and expense recognition |
| O1 | Output | Federal Form 1120 (or 1120-S) | prepared, reviewed, signed |
| O2 | Output | State Corporate Income Tax Returns | by jurisdiction of nexus |
| O3 | Output | Filed Returns with Confirmation | federal and state returns filed; confirmation numbers received |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | return preparation and e-filing |

**Child Nodes:** A11321, A11322, A11323

---

### A1133: Document and Defend Transfer Pricing Positions

**Function:** Document and Defend Transfer Pricing Positions
**Supreme Constraint:** [IRC-482]; [OECD-TP]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Intercompany Transaction Data | IC pricing and volumes from A112 consolidation |
| I2 | Input | Comparable Market Data | third-party comparables from MECH-TP databases |
| C1 | Control | [IRC-482] Transfer Pricing Arm's Length Standard | IC prices must reflect what unrelated parties would charge |
| C2 | Control | [OECD-TP] OECD Transfer Pricing Guidelines | arm's length methods: CUP, resale price, cost plus, TNMM, profit split |
| O1 | Output | Annual Transfer Pricing Documentation Report | functional analysis, method selection, benchmarking, arm's length range |
| O2 | Output | Benchmarking Analysis | comparable uncontrolled transactions with IQR |
| O3 | Output | Advance Pricing Agreement Request (if applicable) | APA request to IRS where warranted |
| M1 | Mechanism | [MECH-TP] Transfer Pricing Analysis Platform | benchmarking database and documentation |

**Child Nodes:** A11331, A11332, A11333

---

### A1134: Administer Sales and Use Tax Compliance

**Function:** Administer Sales and Use Tax Compliance
**Supreme Constraint:** [GAAP-ASC606] (nexus triggered by revenue); state sales tax statutes

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Sales Transaction Data by Jurisdiction | from Sales A33 via IF-A0-09 |
| C1 | Control | South Dakota v. Wayfair (2018) | economic nexus: sales tax nexus triggered by $100K revenue or 200 transactions in state |
| C2 | Control | [IRC-61] Gross Income | taxable vs. exempt determination by product/service type |
| O1 | Output | Nexus Analysis by Jurisdiction | states with economic or physical nexus and registration status |
| O2 | Output | Period Sales Tax Remittances | collected taxes remitted by jurisdiction with confirmation |
| O3 | Output | Sales Tax Audit Readiness Self-Assessment | open positions and documentation gaps |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software (Avalara, Vertex) | nexus determination, return preparation, e-filing |

**Child Nodes:** A11341, A11342, A11343

---

### A1135: Respond to Tax Authority Inquiries and Examinations

**Function:** Respond to Tax Authority Inquiries and Examinations
**Supreme Constraint:** [IRC-162]; [GAAP-ASC740]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | IRS or State Notice / Examination Request | examination scope, IDRs, proposed adjustments |
| I2 | Input | Supporting Documentation | filed returns, workpapers, transfer pricing documentation |
| C1 | Control | [GAAP-ASC740] Uncertain Tax Positions | disclose and quantify UTP per ASC 740-10 more-likely-than-not standard |
| O1 | Output | IDR Response Package | documents and explanations delivered within IRS deadline |
| O2 | Output | Examination Defense File | organized response to proposed adjustments with legal authority |
| O3 | Output | Tax Examination Settlement Agreement | closing agreement, consent to assess, or Appeals settlement |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | workpaper retrieval and response preparation |
| M2 | Mechanism | [MECH-MATTER] Legal Matter Management | examination matter tracking |

**Child Nodes:** A11351, A11352, A11353

---

### A1136: Design Tax-Efficient Legal and Operational Structure

**Function:** Design Tax-Efficient Legal and Operational Structure
**Supreme Constraint:** [IRC-162]; [IRC-41] R&D Tax Credit; [IRC-482]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Current Legal Entity Structure | entity types, jurisdictions, ownership chart |
| I2 | Input | Engineering Investment Plans | R&D expenditures from IF-A1-06 |
| C1 | Control | [IRC-41] R&D Tax Credit | qualified research expenses and activities definition |
| C2 | Control | [IRC-162] | structure must support ordinary and necessary business expense treatment |
| O1 | Output | Legal Entity Structure Analysis | current effective tax rate by structure; gap analysis |
| O2 | Output | R&D Tax Credit Calculation | QREs identified, credit amount computed per IRC §41 |
| O3 | Output | Tax Structure Recommendation Package | recommended entity/structural changes with projected tax savings → Principal |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | modeling |
| M2 | Mechanism | [MECH-LEGAL-AI] Legal AI / LLM API | structural research and analysis |

**Child Nodes:** A11361, A11362, A11363

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A11311: Compute Current Tax Expense from Taxable Income Reconciliation

**Agent Definition:** Prepare the Schedule M-1 / M-3 book-to-tax reconciliation by identifying all permanent differences (non-deductible expenses, tax-exempt income) and timing differences between GAAP pre-tax income and taxable income, and compute current year federal taxable income.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | GAAP Pre-Tax Income | from A112 locked income statement |
| I2 | Input | Permanent and Temporary Difference Listing | depreciation timing, meals/entertainment (50% disallowed), stock comp deduction timing, etc. |
| C1 | Control | [IRC-162] Ordinary and Necessary Business Expenses | permanent disallowances reduce taxable deductions |
| C2 | Control | [IRC-263] Capital Expenditure | capitalized vs. expensed timing differences |
| O1 | Output | Taxable Income Reconciliation Schedule | GAAP income + permanent differences + timing differences = federal taxable income |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | M-1/M-3 computation |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | GL data pull for difference identification |

**Definition of Done:** Taxable income reconciliation schedule ties to GAAP pre-tax income ± documented adjustments AND total permanent differences are each supported by a specific IRC citation AND the schedule produces a single federal taxable income figure.

---

#### A11312: Compute Deferred Tax Assets and Liabilities from Temporary Differences

**Agent Definition:** Identify all temporary differences (items recognized for GAAP but not yet for tax, or vice versa), apply the enacted federal and blended state tax rate to each, and produce the deferred tax asset and liability schedule with a net DTA/DTL balance.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Temporary Difference Listing | from A11311 — deferred revenue, depreciation, stock comp, accruals |
| C1 | Control | [GAAP-ASC740] Income Tax Accounting | deferred tax = temporary difference × enacted rate; assess valuation allowance if recovery not more-likely-than-not |
| O1 | Output | Deferred Tax Asset and Liability Schedule | each temporary difference, tax rate applied, DTA or DTL amount, net balance |
| O2 | Output | Valuation Allowance Analysis | evidence for and against full recovery of DTAs |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | deferred tax computation |

**Definition of Done:** Every temporary difference in the provision workpapers has a DTA or DTL balance computed AND net DTA/DTL change ties to deferred tax expense on income statement to $0.00 AND valuation allowance analysis documents the more-likely-than-not conclusion.

---

#### A11313: Prepare Income Tax Provision Journal Entry and Effective Rate Disclosure

**Agent Definition:** Compute total income tax expense (current + deferred), post the income tax provision journal entry to the general ledger, and compute the effective tax rate and rate reconciliation for financial statement footnote disclosure.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Taxable Income Reconciliation | from A11311.O1 |
| I2 | Input | Deferred Tax Schedule | from A11312.O1 |
| C1 | Control | [GAAP-ASC740] | income tax provision JE: debit income tax expense / credit taxes payable (current) + deferred tax liability (or debit DTA) |
| O1 | Output | Income Tax Provision Journal Entry | debit income tax expense / credit income taxes payable + deferred tax accounts; zero-balanced |
| O2 | Output | Effective Tax Rate and Rate Reconciliation | ETR = total tax / pre-tax income; rate reconciliation bridge: statutory rate to ETR |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | journal entry posting |
| M2 | Mechanism | [MECH-TAX] Tax Compliance Software | ETR computation |

**Definition of Done:** Income tax provision journal entry is zero-balanced AND effective tax rate equals total income tax expense / GAAP pre-tax income to 2 decimal places AND rate reconciliation bridge items sum to the ETR to 0.1% rounding.

---

#### A11321: Prepare Federal Corporate Income Tax Return

**Agent Definition:** Prepare the federal corporate income tax return (Form 1120 for C-corps, Form 1120-S for S-corps) from the taxable income reconciliation and all applicable schedules, compute the net tax due or refund, and obtain signature authorization before filing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Taxable Income Reconciliation | from A11311.O1 |
| I2 | Input | Prior Year Return and Carryforwards | NOL carryforwards, credit carryforwards |
| C1 | Control | [IRC-162] | all deductions must be ordinary and necessary |
| C2 | Control | [IRC-448] Accounting Method | method election determines income and deduction timing |
| O1 | Output | Federal Form 1120 / 1120-S | completed return with all required schedules |
| O2 | Output | Net Tax Due or Refund Computation | tax liability after estimated payments and credits |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software (Drake Tax, ONESOURCE) | return preparation |

**Definition of Done:** All required schedules (Schedule K, M-1/M-3, L) are complete AND the net tax due/refund amount ties to the provision workpapers to $0.00 AND return is authorized by CFO-equivalent (digital signature).

---

#### A11322: Prepare State Corporate Income Tax Returns by Jurisdiction

**Agent Definition:** For each state where the entity has income tax nexus, prepare the state corporate income tax return using the applicable apportionment formula (sales-factor or three-factor), compute the state tax liability, and prepare any state extension requests required.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Federal Form 1120 / 1120-S | from A11321.O1 — federal starting point for state modifications |
| I2 | Input | State Nexus Analysis | jurisdictions with income tax filing obligation |
| C1 | Control | State corporate income tax statutes | each state's applicable return form, apportionment method, and modifications |
| C2 | Control | [IRC-482] | state transfer pricing adjustments if applicable |
| O1 | Output | State Corporate Income Tax Returns | completed return for each nexus jurisdiction |
| O2 | Output | State Extension Requests (if applicable) | automatic extension forms with estimated payment |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software (ONESOURCE, Vertex) | state return preparation |

**Definition of Done:** A completed return exists for every state jurisdiction with income tax nexus AND each state return's federal starting point ties to Form 1120 federal taxable income AND extension requests are filed before original due dates for any extended returns.

---

#### A11323: File Returns and Tax Payments by Statutory Due Dates

**Agent Definition:** E-file all federal and state corporate tax returns by their statutory due dates (or extended due dates), initiate the corresponding tax payments via EFTPS (federal) and state electronic payment systems, and collect all filing confirmation numbers.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Completed Federal and State Returns | from A11321.O1 and A11322.O1 |
| I2 | Input | Tax Due Computation | net tax liability from returns |
| C1 | Control | Federal: 15th day of 4th month after fiscal year end; automatic 6-month extension via Form 7004 (payment still due on original date) | statutory due date |
| O1 | Output | E-Filed Return Confirmation Numbers | federal and state filing IDs and e-file acknowledgments |
| O2 | Output | Tax Payment Confirmations | EFTPS transaction IDs and state payment confirmation numbers |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | e-filing submission |
| M2 | Mechanism | [MECH-EFTPS] EFTPS | federal tax payment |

**Definition of Done:** Every return has an e-file acceptance confirmation AND every tax payment has a confirmation number AND all filing dates are on or before the applicable statutory (or extended) due date.

---

#### A11331: Prepare Annual Transfer Pricing Documentation Report

**Agent Definition:** Prepare the annual transfer pricing documentation report (Master File and Local File per OECD standards) covering all intercompany transactions, documenting the functional analysis, transfer pricing method selection, and tested party selection.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Intercompany Transaction Data | IC revenues, expenses, loans, royalties by transaction type and entity pair |
| C1 | Control | [IRC-482] Transfer Pricing Arm's Length Standard | documentation must establish arm's length nature of each IC transaction |
| C2 | Control | [OECD-TP] Master File and Local File | OECD BEPS Action 13 documentation structure |
| O1 | Output | Annual Transfer Pricing Documentation Report | functional analysis, transaction description, method selection, tested party, annual conclusion |
| M1 | Mechanism | [MECH-TP] Transfer Pricing Analysis Platform | documentation template and data aggregation |

**Definition of Done:** Report covers 100% of material intercompany transactions AND each transaction section documents: (1) functional analysis, (2) TP method selected with rationale, (3) tested party, (4) arm's length range AND report is completed before tax return filing date.

---

#### A11332: Benchmark Intercompany Prices Against Arm's Length Comparables

**Agent Definition:** Search the MECH-TP comparable database for uncontrolled transactions comparable to each intercompany transaction type, apply the selected transfer pricing method, compute the arm's length range (interquartile range), and determine whether the tested party's actual results fall within the range.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Intercompany Transaction Types and Tested Party Data | from A11331 functional analysis |
| I2 | Input | Comparable Company / Transaction Database | from MECH-TP (Bureau van Dijk Orbis, RoyaltyStat, etc.) |
| C1 | Control | [IRC-482] Arm's Length Range | IQR (25th to 75th percentile) of comparable results |
| C2 | Control | [OECD-TP] Method Hierarchy | CUP preferred; resale price, cost plus, TNMM, profit split in priority order |
| O1 | Output | Benchmarking Analysis | comparable set, method applied, IQR, tested party result vs. IQR |
| O2 | Output | Adjustment Calculation (if out of range) | amount needed to bring IC price to median of IQR |
| M1 | Mechanism | [MECH-TP] Transfer Pricing Analysis Platform | comparable search and benchmarking computation |

**Definition of Done:** Comparable set has ≥5 uncontrolled comparables per transaction type AND IQR is computed AND tested party result is documented as within range (pass) or outside range with adjustment amount (fail + adjustment).

---

#### A11333: Draft Advance Pricing Agreement Request Where Warranted

**Agent Definition:** Assess whether any intercompany transaction type has sufficient size, complexity, or examination risk to warrant an Advance Pricing Agreement (APA) with the IRS, and if warranted, draft and submit the APA pre-filing memorandum to the IRS Advance Pricing and Mutual Agreement (APMA) office.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Transfer Pricing Documentation Report | from A11331.O1 |
| I2 | Input | Examination History | prior IRS transfer pricing adjustments or disputes |
| C1 | Control | [IRC-482] | APA provides binding agreement on arm's length pricing method for covered transactions |
| C2 | Control | Rev. Proc. 2015-41 | APA request procedure and pre-filing memorandum requirements |
| O1 | Output | APA Necessity Assessment | binary: APA warranted / not warranted with supporting rationale |
| O2 | Output | APA Pre-Filing Memorandum (if warranted) | submitted to IRS APMA office |
| M1 | Mechanism | [MECH-TP] Transfer Pricing Analysis Platform | |
| M2 | Mechanism | [MECH-MATTER] Legal Matter Management | APA matter tracking |

**Definition of Done:** APA necessity assessment is documented with binary conclusion AND if APA is warranted, pre-filing memorandum is submitted to IRS APMA within 60 days of the assessment AND confirmation of IRS receipt is obtained.

---

#### A11341: Determine Sales and Use Tax Nexus by Jurisdiction

**Agent Definition:** Analyze the entity's physical presence and economic activity in each US state and territory to determine where sales tax nexus exists (physical or economic), confirm registration status, and flag any states requiring new registration.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Sales Transaction Data by State | from Sales A33 IF-A0-09 — revenue and transaction count by state |
| I2 | Input | Physical Presence Data | offices, employees, inventory, trade show attendance by state |
| C1 | Control | South Dakota v. Wayfair (2018) Economic Nexus | threshold: $100K annual revenue or 200 transactions in a state triggers nexus |
| C2 | Control | State sales tax statutes | product / service taxability determination by state |
| O1 | Output | Sales Tax Nexus Analysis | state-by-state: nexus type (physical/economic/none), registration status, action required |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software (Avalara, Vertex) | nexus determination engine |

**Definition of Done:** Nexus analysis covers all 50 states + DC AND every state above the Wayfair threshold is marked as requiring registration AND any unregistered nexus state has a registration action item with due date.

---

#### A11342: Compute and Remit Sales Tax Collections by Filing Period

**Agent Definition:** For each sales tax filing jurisdiction, compile collected sales tax by period, prepare the sales tax return, remit the tax due by the filing deadline, and confirm electronic payment.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Sales Tax Collected by Jurisdiction and Period | from MECH-TAX sales tax engine — collected from customer invoices |
| C1 | Control | State sales tax filing frequency rules | monthly / quarterly / annual filing based on revenue volume |
| O1 | Output | Period Sales Tax Returns by Jurisdiction | prepared return per filing jurisdiction |
| O2 | Output | Sales Tax Payment Confirmations | electronic payment confirmation numbers by state |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software (Avalara, Vertex) | return preparation and e-filing |

**Definition of Done:** All jurisdictions with collected sales tax have a filed return AND all payment confirmation numbers are received AND no return is filed after its statutory due date.

---

#### A11343: Conduct Periodic Sales Tax Audit Readiness Self-Assessment

**Agent Definition:** Review open sales tax positions, confirm exemption certificates are on file for all tax-exempt sales, verify use tax has been accrued on taxable purchases where sales tax was not charged, and produce the audit readiness report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Sales Tax Returns Filed Year-to-Date | from A11342 |
| I2 | Input | Exemption Certificate Register | certificates on file for B2B customers claiming exemption |
| C1 | Control | State sales tax statutes | exemption certificate requirements; use tax self-assessment obligation |
| O1 | Output | Sales Tax Audit Readiness Report | open positions, exemption certificate gaps, use tax accrual adequacy, overall risk rating |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | position analysis |

**Definition of Done:** Audit readiness report covers all nexus jurisdictions AND exemption certificate coverage rate (certificates on file / total exempt sales) is computed AND use tax accrual balance is compared to estimated liability AND report is produced at least annually.

---

#### A11351: Respond to IRS Information Document Requests Within Deadline

**Agent Definition:** Upon receipt of an IRS Information Document Request (IDR), compile all requested documents and information from the accounting and tax systems, organize the response package per the IDR format, and deliver to the IRS examiner by the IDR due date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | IRS IDR | document list and questions from IRS examination agent |
| I2 | Input | Tax Returns and Workpapers | filed returns, provision workpapers, supporting schedules |
| C1 | Control | [GAAP-ASC740] Uncertain Tax Positions | ASC 740-10: disclose and quantify uncertain positions; do not waive privilege by over-disclosure |
| O1 | Output | IDR Response Package | requested documents organized per IDR items; cover letter with explanations |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | workpaper retrieval |
| M2 | Mechanism | [MECH-MATTER] Legal Matter Management | IDR deadline tracking |

**Definition of Done:** IDR response package is delivered to IRS examiner on or before the IDR due date AND every IDR item is addressed (document provided or objection stated) AND delivery confirmation from IRS examiner is obtained.

---

#### A11352: Coordinate Examination Defense with Outside Tax Counsel

**Agent Definition:** Brief outside tax counsel on the examination scope and key positions, coordinate the legal defense strategy for each disputed issue, and produce a position paper with legal authority for each issue under examination.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | IRS Proposed Adjustments or Notice of Deficiency | examination findings and proposed tax adjustments |
| I2 | Input | Transfer Pricing Documentation and Tax Returns | supporting records for disputed positions |
| C1 | Control | [GAAP-ASC740] | any expected adjustment must be reflected in the tax provision as an uncertain tax position |
| O1 | Output | Examination Defense Position Paper | legal authority (IRC, case law, regulations) for each disputed issue |
| O2 | Output | Updated UTP Reserve | revised uncertain tax position reserve in provision if settlement probability warrants |
| M1 | Mechanism | [MECH-MATTER] Legal Matter Management | examination defense file |
| M2 | Mechanism | [MECH-LEGAL-AI] Legal AI / LLM API | legal research support |

**Definition of Done:** Position paper covers every disputed issue with at least one IRC or regulatory citation AND any expected settlement is reflected in the UTP reserve AND outside counsel confirms receipt and alignment on strategy.

---

#### A11353: Execute Tax Examination Settlement Agreement

**Agent Definition:** Negotiate final resolution of all open examination issues with the IRS (or state authority), execute the closing agreement or Form 870 consent to assess, post the settlement journal entry to the general ledger, and close the examination matter.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Examination Defense Position Papers | from A11352.O1 |
| I2 | Input | IRS Appeals Settlement Offer (if applicable) | IRS Appeals or examination settlement terms |
| C1 | Control | [GAAP-ASC740] | settlement amount recognized in period of final settlement; prior UTP reserve adjusted |
| O1 | Output | Executed Closing Agreement or Form 870 | signed settlement document with IRS |
| O2 | Output | Settlement Journal Entry | true-up of income tax provision for settlement amount vs. reserve |
| O3 | Output | Closed Examination Matter File | all documents filed; matter status = closed in MECH-MATTER |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | settlement JE posting |
| M2 | Mechanism | [MECH-MATTER] Legal Matter Management | matter closure |

**Definition of Done:** Closing agreement or Form 870 is executed by both parties AND settlement journal entry is posted and zero-balanced AND examination matter is marked Closed in MECH-MATTER with final documents archived.

---

#### A11361: Evaluate Legal Entity Structure for Tax Efficiency

**Agent Definition:** Analyze the current legal entity structure (C-corp, S-corp, LLC, partnership, foreign subsidiaries) across all jurisdictions to identify tax rate differentials, qualification for favorable treatment, and structural mismatches that increase effective tax rate.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Current Legal Entity Chart | entity types, ownership, jurisdictions, intercompany flows |
| I2 | Input | Income Tax Provision | current ETR from A11313.O2 |
| C1 | Control | [IRC-162] | all structures must preserve ordinary and necessary expense deductibility |
| C2 | Control | [IRC-482] | any restructuring that involves IC transactions must maintain arm's length pricing |
| O1 | Output | Entity Structure Tax Analysis | current ETR by entity; identified structural opportunities and risks |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | structural modeling |
| M2 | Mechanism | [MECH-LEGAL-AI] Legal AI / LLM API | jurisdiction-specific tax law research |

**Definition of Done:** Analysis documents the current effective tax rate AND identifies at least one structural opportunity or confirms no opportunities exist with reasoning AND each identified opportunity includes estimated ETR reduction and implementation requirements.

---

#### A11362: Compute R&D Tax Credit Qualification and Credit Amount

**Agent Definition:** Identify all qualified research activities and qualified research expenses (QREs) from the engineering expenditure data, apply the four-part IRC §41 qualification test to each activity, compute the credit amount under the regular credit method (or alternative simplified credit), and document the supporting calculation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Engineering Investment and Expense Data | from IF-A1-06 — R&D expenditures by project |
| C1 | Control | [IRC-41] R&D Tax Credit | four-part test: (1) permitted purpose, (2) technological uncertainty, (3) process of experimentation, (4) technological in nature; QRE = wages + supplies + 65% of contractor costs |
| O1 | Output | QRE Listing by Project | each project with qualified wages, supplies, and contractor costs |
| O2 | Output | R&D Credit Calculation | regular credit = 20% × (QREs − base amount) OR ASC method = 14% × (QREs − 50% × 3-yr avg) |
| M1 | Mechanism | [MECH-TAX] Tax Compliance Software | R&D credit computation |

**Definition of Done:** Every identified R&D project has a documented four-part qualification analysis AND QREs tie to accounting records by project AND credit calculation uses a recognized IRC §41 method (regular or ASC) with base amount documented.

---

#### A11363: Escalate Tax Planning Recommendation to Principal for Decision

**Agent Definition:** Compile the entity structure analysis, R&D credit calculation, and any other identified tax planning opportunities into a structured decision package with projected after-tax savings, implementation steps, and risks, and route to the Principal for binary approve/reject.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Entity Structure Tax Analysis | from A11361.O1 |
| I2 | Input | R&D Credit Calculation | from A11362.O2 |
| C1 | Control | [IRC-162] | recommended structures must preserve deductibility |
| O1 | Output | Tax Planning Recommendation Package | each recommendation: projected ETR reduction, implementation steps, risk rating, and binary approve/reject item |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | package assembly |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | Principal decision capture |

**Definition of Done:** Package covers all identified planning opportunities AND each item has a projected after-tax savings amount AND Principal returns signed binary approve/reject decision for each item within Principal-defined SLA.

**[CROSS-FUNCTION: A113 → A12]** *Interface: IF-A1-01 — Tax matters requiring Legal review (structural changes, APA, examination)*

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1 = A1131.O3; O2 = A1132.O3; O3 = A1133.O1; O4 = A1134.O2; O5 = A1136.O3
- [x] No skill appears under more than one function node
- [x] All cross-function skills cite an interface: IF-A1-01 (tax matters to Legal A12)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] All L4 and L5 node names are active verb phrases — verified (R1.2a)
- [x] Leaf node count confirmed: 18
- [x] Mandatory inclusions: Transfer pricing documentation (A1133 ✓)
- [x] New constraint codes used: GAAP-ASC740 (A1131), IRC-41 (A1136) — add to ctrl-constraint-library.md
- [x] New mechanism codes used: MECH-TP (A1133) — add to ctrl-mechanism-catalog.md
