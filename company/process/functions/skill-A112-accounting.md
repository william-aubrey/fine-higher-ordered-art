# Skill File: Accounting & Reporting

**Node:** A112
**Parent:** A11 Finance
**Function:** Record and Report Enterprise Financial Activity
**Supreme Constraint:** [MATH-GAAP-AXIOMS] Double-Entry Identity; [GAAP-ASC606] Revenue Recognition; [GAAP-ASC810] Consolidation; [GAAP-ASC842] Leases; [SEC-XBRL] XBRL Tagging
**Cross-Function Interfaces:** IF-A0-09 (consuming), IF-A1-11 (consuming), IF-A1-12 (consuming), IF-A1-17 (consuming), IF-A1-19 (consuming), IF-A1-21 (consuming), IF-A1-24 (producing)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] Intercompany elimination entries — [GAAP-ASC810] → A1124 / A11241–A11243
- [x] Deferred revenue recognition waterfall — [GAAP-ASC606] → A1122 / A11221–A11223
- [x] XBRL tagging of financial statements — [SEC-XBRL] → A1126 / A11261–A11263

---

## A112: Record and Report Enterprise Financial Activity

**Function:** Record and Report Enterprise Financial Activity
**Supreme Constraint:** [MATH-GAAP-AXIOMS]; [GAAP-ASC606]; [GAAP-ASC810]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Executed Contracts + Revenue Data | from Sales A33 via IF-A0-09 |
| I2 | Input | Payroll Journal Entries | from People A13 via IF-A1-11 |
| I3 | Input | Benefits Cost Accrual Journal Entries | from People A13 via IF-A1-17 |
| I4 | Input | Stock Compensation Expense Journal Entries | from People A13 via IF-A1-19 |
| I5 | Input | Approved Carrier Invoices | from People A13 via IF-A1-21 |
| I6 | Input | Quarterly Tax Liability Reconciliation | from People A13 via IF-A1-12 |
| I7 | Input | Lease Agreements | new and modified leases from Legal A12 |
| I8 | Input | Intercompany Transaction Data | from all legal entity instances |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Accounting Identity | every debit has a matching credit; trial balance = zero |
| C2 | Control | [GAAP-ASC606] Revenue Recognition | 5-step model governs when revenue is recognized |
| C3 | Control | [GAAP-ASC842] Leases | operating vs. finance lease classification |
| C4 | Control | [GAAP-ASC810] Consolidation | intercompany elimination; VIE assessment |
| C5 | Control | [SOX-302] CEO/CFO Certification | officers certify financial statements |
| O1 | Output | Locked Trial Balance | → A112 downstream financial statements |
| O2 | Output | GAAP Financial Statements | P&L + BS + cash flow + footnotes → Principal, board, and Legal A12 via IF-A1-24 |
| O3 | Output | EDGAR Filing with XBRL Tags | SEC 10-K / 10-Q / 8-K → SEC EDGAR (public cos.) |
| O4 | Output | Closed-Period Actuals | → FP&A A111 for variance analysis (internal A11 flow) |
| M1 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | core accounting system |
| M2 | Mechanism | [MECH-EDGAR] SEC EDGAR Filing System | financial report submission |
| M3 | Mechanism | [MECH-XBRL] XBRL Tagging Tools | inline XBRL tagging |
| M4 | Mechanism | [MECH-AUDIT] Audit & Controls Platform | period-close workflow and evidence management |

**Child Nodes:** A1121, A1122, A1123, A1124, A1125, A1126

### Boundary Arrow Correspondence (A112)

| A112 Code | Produced By | Notes |
|---|---|---|
| O1 Locked Trial Balance | A1121.O3 | period locked after reconciliation complete |
| O2 GAAP Financial Statements | A1125.O3 | CEO/CFO certified |
| O3 EDGAR Filing with XBRL | A1126.O3 | EDGAR acceptance confirmed |
| O4 Closed-Period Actuals | A1121.O3 | feeds FP&A A111 internally |

### Internal Arrows (A112 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1121.O3 | A1122 | Input | Locked Trial Balance (revenue recognition base) |
| 2 | A1121.O3 | A1123 | Input | Locked Trial Balance (lease liability balances) |
| 3 | A1121.O3 | A1124 | Input | Locked Trial Balance (intercompany balances) |
| 4 | A1122.O3 | A1125 | Input | Deferred Revenue Roll-Forward Schedule (footnote disclosure) |
| 5 | A1123.O3 | A1125 | Input | ROU Asset and Lease Liability Schedule (footnote disclosure) |
| 6 | A1124.O3 | A1125 | Input | Consolidation Package (minority interest, eliminated entries) |
| 7 | A1125.O2 | A1126 | Input | Certified Financial Statements (XBRL tagging base) |

---

### A1121: Execute Monthly Accounting Period Close

**Function:** Execute Monthly Accounting Period Close
**Supreme Constraint:** [MATH-GAAP-AXIOMS]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | All Period-End Source Documents | payroll JE (IF-A1-11), benefits accrual (IF-A1-17), stock comp JE (IF-A1-19), carrier invoices (IF-A1-21), tax reconciliation (IF-A1-12) |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | trial balance debit total must equal credit total to $0.00 |
| O1 | Output | All Period-End Journal Entries Posted | accruals, deferrals, and source-document JEs posted |
| O2 | Output | Balance Sheet Account Reconciliations | every BS account tied to source record |
| O3 | Output | Locked Trial Balance | period locked; actuals frozen for financial statements |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | journal entry posting and lock |
| M2 | Mechanism | [MECH-AUDIT] Audit & Controls Platform | close checklist workflow |

**Child Nodes:** A11211, A11212, A11213

---

### A1122: Recognize Revenue from Customer Contracts

**Function:** Recognize Revenue from Customer Contracts
**Supreme Constraint:** [GAAP-ASC606]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Executed Contracts + Revenue Schedule | from Sales A33 via IF-A0-09 |
| I2 | Input | Locked Trial Balance | from A1121.O3 (deferred revenue balances) |
| C1 | Control | [GAAP-ASC606] Revenue Recognition | 5-step model: identify contract, identify POs, determine price, allocate, recognize upon PO satisfaction |
| O1 | Output | Period Revenue Recognition Journal Entry | recognized revenue debit / deferred revenue credit, per contract and PO |
| O2 | Output | Contract Asset / Liability Roll-Forward | opening + additions + recognized + closing by contract |
| O3 | Output | Deferred Revenue Roll-Forward Schedule | total deferred revenue movement with waterfall by future period |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (revenue recognition module) | |
| M2 | Mechanism | [MECH-AR] Accounts Receivable System | contract invoicing data |

**Child Nodes:** A11221, A11222, A11223

---

### A1123: Record and Amortize Lease Obligations

**Function:** Record and Amortize Lease Obligations
**Supreme Constraint:** [GAAP-ASC842]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | New or Modified Lease Agreements | from Legal A12 |
| I2 | Input | Prior Period Lease Schedules | existing ROU asset and lease liability balances from MECH-ERP-GL |
| C1 | Control | [GAAP-ASC842] Leases | operating vs. finance lease classification; ROU asset and liability recognition |
| O1 | Output | Lease Classification Memo | operating or finance determination with supporting calculations |
| O2 | Output | ROU Asset and Lease Liability Journal Entry | commencement recognition or monthly amortization entry |
| O3 | Output | Lease Amortization Schedule | period-by-period ROU asset, liability, interest, and expense |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (lease accounting module) | |

**Child Nodes:** A11231, A11232, A11233

---

### A1124: Account for Intercompany Transactions and Eliminate Balances

**Function:** Account for Intercompany Transactions and Eliminate Balances
**Supreme Constraint:** [GAAP-ASC810]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Intercompany Transaction Data | transactions between legal entities during the period |
| I2 | Input | Prior Period Intercompany Balances | open AR/AP and investment account balances |
| C1 | Control | [GAAP-ASC810] Consolidation | eliminate all intercompany revenue, expenses, AR/AP, and investment |
| C2 | Control | [IRC-482] Transfer Pricing Arm's Length Standard | intercompany prices must reflect market rates |
| O1 | Output | Intercompany Eliminating Journal Entries | posted to consolidation journal in MECH-ERP-GL |
| O2 | Output | Intercompany Account Reconciliation | each entity pair's IC balances agree to $0.00 |
| O3 | Output | Consolidation Package | eliminated entries + minority interest + combined statements |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (consolidation module) | |

**Child Nodes:** A11241, A11242, A11243

---

### A1125: Produce GAAP Financial Statements

**Function:** Produce GAAP Financial Statements
**Supreme Constraint:** [MATH-GAAP-AXIOMS]; [SOX-302]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Locked Consolidated Trial Balance | from A1121.O3 + A1124.O3 |
| I2 | Input | Deferred Revenue Roll-Forward | from A1122.O3 |
| I3 | Input | ROU Asset and Lease Schedule | from A1123.O3 |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | statements must articulate (net income = BS change in retained earnings; BS balances) |
| C2 | Control | [GAAP-ASC230] Cash Flow Classification | operating / investing / financing |
| C3 | Control | [SOX-302] CEO/CFO Certification | officer sign-off required |
| O1 | Output | Income Statement | period P&L by line with EPS if public |
| O2 | Output | Balance Sheet | assets = liabilities + equity |
| O3 | Output | Statement of Cash Flows | operating / investing / financing sections |
| O4 | Output | Notes to Financial Statements | significant accounting policies and required disclosures |
| O5 | Output | CEO/CFO Certified Financial Statement Package | signed package ready for distribution and filing |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | financial statement generation |
| M2 | Mechanism | [MECH-AUDIT] Audit & Controls Platform | disclosure checklist |
| M3 | Mechanism | [MECH-ESIGN] Electronic Signature | CEO/CFO certification |

**Child Nodes:** A11251, A11252, A11253

---

### A1126: File SEC Financial Reports with XBRL Tagging

**Function:** File SEC Financial Reports with XBRL Tagging
**Supreme Constraint:** [SEC-XBRL]; [SEC-SX]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | CEO/CFO Certified Financial Statement Package | from A1125.O5 |
| C1 | Control | [SEC-XBRL] XBRL Tagging Requirements | iXBRL inline tagging per SEC Rule 405 of Regulation S-T |
| C2 | Control | [SEC-SX] Regulation S-X | financial statement form and content requirements for SEC filings |
| C3 | Control | [SOX-302] | certifications must accompany 10-K and 10-Q |
| O1 | Output | iXBRL-Tagged Financial Statements | inline XBRL tags applied to all required elements |
| O2 | Output | SEC Filing Transmittal Package | 10-K / 10-Q / 8-K + exhibits + certifications |
| O3 | Output | EDGAR Acceptance Confirmation | filing ID and confirmation from EDGAR |
| M1 | Mechanism | [MECH-XBRL] XBRL Tagging Tools (Workiva Wdesk, GoXBRL) | |
| M2 | Mechanism | [MECH-EDGAR] SEC EDGAR Filing System | electronic submission |

**Child Nodes:** A11261, A11262, A11263

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A11211: Process All Period-End Journal Entries and Accruals

**Agent Definition:** Post all standard recurring journal entries (depreciation, prepaid amortization, accrued expenses) and all non-recurring period-end entries (payroll JE from IF-A1-11, benefits accrual from IF-A1-17, stock comp JE from IF-A1-19) to the general ledger for the closing period.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Journal Entry Source Package | payroll JE (IF-A1-11), benefits accrual (IF-A1-17), stock comp JE (IF-A1-19), AP invoices (IF-A1-21), standard recurring entries from close checklist |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | every journal entry must be zero-balanced (debit = credit) |
| O1 | Output | All Period-End Journal Entries Posted | complete GL posting confirmation for the period |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | journal entry posting module |
| M2 | Mechanism | [MECH-AUDIT] Audit & Controls Platform | close checklist item sign-off |

**Definition of Done:** MECH-ERP-GL returns zero unposted journal entries on the close checklist AND each journal entry has a zero debit/credit variance AND all source-document journal entries (IF-A1-11, IF-A1-17, IF-A1-19) are confirmed posted.

---

#### A11212: Reconcile All Balance Sheet Accounts to Source Records

**Agent Definition:** For each balance sheet account, extract the GL balance and trace it to the source record (bank statement, sub-ledger, loan schedule, or supporting workpaper), document the reconciling item if any, and sign off each account as reconciled or flag for investigation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | GL Balance by BS Account | from MECH-ERP-GL post journal entry posting |
| I2 | Input | Source Records | bank statements (MECH-BANK-API), sub-ledgers (AR/AP), payroll clearing (MECH-PAYROLL) |
| C1 | Control | [MATH-GAAP-AXIOMS] | GL balance must tie to source record; unexplained variance = error |
| O1 | Output | Balance Sheet Account Reconciliation Workpapers | each BS account with GL balance, source balance, variance, and sign-off |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | GL balance extraction |
| M2 | Mechanism | [MECH-AUDIT] Audit & Controls Platform | reconciliation workflow and sign-off |

**Definition of Done:** 100% of balance sheet accounts have a completed reconciliation workpaper AND zero unresolved variances above $1.00 remain open AND all sign-offs are captured in MECH-AUDIT before period lock.

---

#### A11213: Lock Period and Produce Trial Balance for Financial Statements

**Agent Definition:** Confirm all reconciliations are complete and all journal entries are posted, lock the accounting period in MECH-ERP-GL to prevent further posting, and produce the final trial balance report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed-Off Account Reconciliation Workpapers | from A11212.O1 (all accounts reconciled) |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | trial balance total debits must equal total credits to $0.00 |
| O1 | Output | Locked Accounting Period | MECH-ERP-GL period status = Closed; no further posting permitted |
| O2 | Output | Final Trial Balance | all GL accounts with debit / credit balances totaling $0.00 |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | period lock function |

**Definition of Done:** MECH-ERP-GL period status is set to Closed AND trial balance debit total equals credit total to $0.00 AND no open reconciliation items remain in MECH-AUDIT.

---

#### A11221: Identify and Allocate Transaction Price to Performance Obligations

**Agent Definition:** For each new or modified customer contract in the period, identify all performance obligations, determine standalone selling prices, and allocate the total transaction price to each performance obligation using the relative SSP method.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | New and Modified Customer Contracts | from Sales A33 via IF-A0-09 — contract IDs, total value, deliverables |
| C1 | Control | [GAAP-ASC606] Steps 1–4 | identify contract, identify POs, determine transaction price, allocate price to POs using relative SSP |
| O1 | Output | Performance Obligation Allocation Schedule | per contract: PO description, SSP, allocated transaction price, performance period |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (revenue recognition module) | |
| M2 | Mechanism | [MECH-AR] Accounts Receivable System | contract database |

**Definition of Done:** Every contract with multiple POs has an allocation schedule AND allocated amounts sum to contract total transaction price to $0.00 AND standalone selling prices are documented for each PO type.

---

#### A11222: Recognize Revenue Upon Satisfaction of Each Performance Obligation

**Agent Definition:** For each performance obligation due for recognition in the period, post the revenue recognition journal entry (debit deferred revenue / credit revenue, or debit AR / credit revenue for point-in-time recognition), and update the contract asset/liability balance.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Performance Obligation Allocation Schedule | from A11221.O1 |
| I2 | Input | PO Completion Evidence | delivery confirmations, milestone acceptances, or time-elapsed for rateable recognition |
| C1 | Control | [GAAP-ASC606] Step 5 — Revenue Recognition | recognize revenue when (or as) performance obligation is satisfied |
| O1 | Output | Revenue Recognition Journal Entries | debit deferred revenue (or AR) / credit revenue; per contract and PO |
| O2 | Output | Contract Asset / Liability Roll-Forward | opening balance + billings + recognized − collections = closing balance |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (revenue recognition module) | automated recognition per schedule |

**Definition of Done:** All POs with satisfaction evidence in the period have a posted revenue recognition journal entry AND contract asset/liability roll-forward opening + activity = closing balance to $0.00.

---

#### A11223: Produce Deferred Revenue Roll-Forward Schedule

**Agent Definition:** Compile the period-end deferred revenue balance by contract, produce a waterfall schedule showing the future period in which each deferred balance will be recognized, and verify the schedule total ties to the balance sheet deferred revenue account.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Contract Asset / Liability Roll-Forward | from A11222.O2 |
| I2 | Input | Locked Trial Balance | deferred revenue GL balance from A11213.O2 |
| C1 | Control | [GAAP-ASC606] | deferred revenue represents unfulfilled POs; recognized in future periods per PO timeline |
| O1 | Output | Deferred Revenue Roll-Forward Schedule | contract-level closing deferred balance; future-period recognition waterfall (12+ months) |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | balance extraction |
| M2 | Mechanism | [MECH-BI] BI Platform | waterfall schedule output |

**Definition of Done:** Deferred revenue roll-forward schedule total equals GL deferred revenue balance to $0.00 AND waterfall schedule covers all future recognition periods through the last contract's performance period end.

---

#### A11231: Classify Leases as Operating or Finance Under ASC 842

**Agent Definition:** For each new or modified lease agreement, apply the five ASC 842 classification criteria (transfer of ownership, purchase option, lease term, PV of lease payments, specialized nature) to determine operating or finance classification.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | New or Modified Lease Agreement | from Legal A12 — lease term, payment schedule, purchase option, asset type |
| C1 | Control | [GAAP-ASC842] Lease Classification Criteria | finance lease if any of the 5 criteria met: (1) transfer of ownership, (2) purchase option reasonably certain, (3) lease term ≥ major part of useful life, (4) PV of payments ≥ substantially all of fair value, (5) specialized asset with no alternative use |
| O1 | Output | Lease Classification Memo | operating or finance determination with criterion-by-criterion analysis |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (lease accounting module) | |

**Definition of Done:** Classification memo documents all five criteria with factual assessment AND conclusion (operating or finance) is supported by criterion analysis AND memo is stored in MECH-AUDIT with effective date of lease.

---

#### A11232: Record Right-of-Use Asset and Lease Liability at Commencement

**Agent Definition:** At lease commencement, compute the present value of lease payments using the implicit rate (or lessee's incremental borrowing rate), record the right-of-use asset and lease liability at that amount, and post the commencement journal entry.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Lease Classification Memo | from A11231.O1 |
| I2 | Input | Lease Payment Schedule | future minimum lease payments by period |
| C1 | Control | [GAAP-ASC842] Initial Recognition | ROU asset = lease liability + prepaid lease payments − lease incentives received; lease liability = PV of future payments |
| O1 | Output | Commencement Journal Entry | debit ROU asset / credit lease liability at PV amount |
| O2 | Output | Lease Amortization Schedule | payment, interest, principal, and ROU amortization per period |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (lease accounting module) | PV computation and journal entry |

**Definition of Done:** Commencement journal entry has ROU asset = lease liability (absent prepaid or incentive adjustments) to $0.00 AND amortization schedule sum of principal payments equals initial lease liability balance to $0.00.

---

#### A11233: Amortize Lease Liability and Record Monthly Lease Expense

**Agent Definition:** Each period, apply the effective interest method to the lease liability to compute interest expense (finance lease) or straight-line lease cost (operating lease), post the period journal entry, and update the amortization schedule.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Lease Amortization Schedule | from A11232.O2 — period-by-period payment, interest, principal |
| C1 | Control | [GAAP-ASC842] Subsequent Measurement | finance lease: interest on liability + amortization of ROU; operating lease: straight-line lease cost |
| O1 | Output | Period Lease Journal Entry | interest / amortization entry per lease classification |
| O2 | Output | Updated Lease Amortization Schedule | closing lease liability and ROU asset balance |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (lease accounting module) | |

**Definition of Done:** Period journal entry interest amount ties to amortization schedule to $0.00 AND closing lease liability balance = prior balance − principal payment to $0.00 AND MECH-ERP-GL lease module shows no unposted entries.

---

#### A11241: Identify Intercompany Transactions and Record Eliminating Entries

**Agent Definition:** Extract all transactions between legal entities during the period, for each intercompany pair record the eliminating journal entry (debit IC revenue / credit IC expense, or debit IC payable / credit IC receivable), and post to the consolidation journal.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Intercompany Transaction Listing | all transactions between legal entities: sales, loans, management fees, cost allocations |
| C1 | Control | [GAAP-ASC810] Consolidation | eliminate all intercompany balances and transactions in consolidation |
| C2 | Control | [IRC-482] Transfer Pricing | confirm IC prices are at arm's length before elimination |
| O1 | Output | Intercompany Eliminating Journal Entries | posted to consolidation journal; IC revenue/expense and IC AR/AP eliminated |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (consolidation module) | intercompany matching and elimination |

**Definition of Done:** Every intercompany transaction pair has a corresponding eliminating journal entry AND sum of all IC eliminating entries nets to $0.00 AND MECH-ERP-GL intercompany matching report shows zero unmatched IC transactions.

---

#### A11242: Reconcile Intercompany Accounts Between Legal Entities

**Agent Definition:** For each intercompany entity pair, compare the IC receivable in Entity A to the IC payable in Entity B and document any difference; require both entities to agree balances match before period close.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | IC Receivable and Payable Balances | from each entity's MECH-ERP-GL sub-ledger |
| C1 | Control | [GAAP-ASC810] | all IC balances must be eliminated; disagreement means either entity's balance is wrong |
| O1 | Output | Intercompany Account Reconciliation | entity pair matrix: IC receivable, IC payable, variance; all pairs at $0.00 |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (consolidation module) | |

**Definition of Done:** Every intercompany entity pair has a signed reconciliation AND variance column shows $0.00 for every pair AND reconciliation is complete before period lock.

---

#### A11243: Prepare Consolidation Package with Minority Interest Calculations

**Agent Definition:** Combine all entity trial balances, apply eliminating entries, compute minority interest for any partially owned subsidiaries, and produce the consolidated trial balance ready for financial statement preparation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Eliminating Journal Entries | from A11241.O1 |
| I2 | Input | Entity Trial Balances | locked trial balance from each legal entity |
| C1 | Control | [GAAP-ASC810] Consolidation and Minority Interest | noncontrolling interest = outside ownership % × subsidiary net assets |
| O1 | Output | Consolidated Trial Balance | sum of all entities less eliminations; minority interest line included |
| O2 | Output | Minority Interest Calculation Schedule | per subsidiary: NCI %, NCI equity, NCI net income |
| O3 | Output | Consolidation Package | consolidated trial balance + eliminating entries + NCI schedules |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (consolidation module) | |

**Definition of Done:** Consolidated trial balance debit total equals credit total to $0.00 AND NCI balance equals outside ownership % × subsidiary net assets to $0.00 AND all entity balances are included in the consolidation.

---

#### A11251: Prepare Income Statement, Balance Sheet, and Statement of Cash Flows

**Agent Definition:** From the locked consolidated trial balance, generate the income statement, balance sheet, and statement of cash flows, verify articulation (net income flows to retained earnings, cash flow ending balance equals balance sheet cash), and confirm all three statements balance.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Locked Consolidated Trial Balance | from A11213.O2 + A11243.O3 |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | net income = BS retained earnings change; BS assets = liabilities + equity; CF ending cash = BS cash |
| C2 | Control | [GAAP-ASC230] Cash Flow Classification | operating / investing / financing presentation |
| O1 | Output | Income Statement | revenue, COGS, gross profit, opex, EBITDA, net income; current period and prior period comparative |
| O2 | Output | Balance Sheet | assets = liabilities + equity; current and prior period comparative |
| O3 | Output | Statement of Cash Flows | operating (indirect) / investing / financing; ending cash ties to BS |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | financial statement generation |

**Definition of Done:** Net income on income statement equals change in retained earnings on balance sheet to $0.00 AND total assets equal total liabilities + equity to $0.00 AND cash flow ending balance equals balance sheet cash balance to $0.00.

---

#### A11252: Compile Footnote Disclosures per GAAP Requirements

**Agent Definition:** Prepare all required GAAP footnote disclosures including significant accounting policies, revenue disaggregation (ASC 606), lease commitments (ASC 842), stock-based compensation (ASC 718), and any other required disclosures, and assemble into the notes to the financial statements.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Period Financial Statements | from A11251 |
| I2 | Input | Deferred Revenue Roll-Forward | from A11223.O1 |
| I3 | Input | Lease Amortization Schedule | from A11233.O2 |
| C1 | Control | [GAAP-ASC606] | revenue disaggregation note required |
| C2 | Control | [GAAP-ASC842] | future minimum lease payment table required |
| O1 | Output | Notes to Financial Statements | complete footnote disclosure package per GAAP checklist |
| M1 | Mechanism | [MECH-AUDIT] Audit & Controls Platform | disclosure checklist |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | footnote drafting |

**Definition of Done:** MECH-AUDIT disclosure checklist shows all required disclosures checked off AND revenue disaggregation note sum ties to total revenue on income statement to $0.00 AND lease commitment table future payments sum ties to lease liability on balance sheet to $0.00.

---

#### A11253: Obtain CEO/CFO Certification on Financial Statements

**Agent Definition:** Route the complete financial statements and footnotes to the CEO-equivalent and CFO-equivalent for review and SOX Section 302 certification, capture digital signatures, and confirm certifications are received before distribution.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Financial Statements + Footnotes | from A11251 + A11252 |
| C1 | Control | [SOX-302] CEO/CFO Financial Statement Certification | officers certify: no material misstatements, ICFR disclosed, any fraud disclosed |
| O1 | Output | CEO/CFO Certified Financial Statement Package | signed package with SOX 302 certifications attached |
| M1 | Mechanism | [MECH-ESIGN] Electronic Signature (DocuSign, Adobe Sign) | certification capture |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | distribution to certifying officers |

**Definition of Done:** Both CEO-equivalent and CFO-equivalent digital signatures are captured in MECH-ESIGN AND certification date is within the required reporting period deadline AND signed package is stored in MECH-AUDIT.

**[CROSS-FUNCTION: A112 → A12]** *Interface: IF-A1-24 — Financial Statements for Pre-Filing Legal Review*

---

#### A11261: Tag Financial Statements with Inline XBRL Per SEC Requirements

**Agent Definition:** Apply inline XBRL tags to all required financial statement line items in the certified financial statements using the current US GAAP taxonomy, validate tag completeness against the SEC EDGAR validation rules, and produce the iXBRL-tagged document.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | CEO/CFO Certified Financial Statement Package | from A11253.O1 |
| C1 | Control | [SEC-XBRL] XBRL Tagging Requirements | iXBRL inline tagging per SEC Rule 405 of Regulation S-T; US GAAP taxonomy (current version) |
| O1 | Output | iXBRL-Tagged Financial Statements | inline tags applied; EDGAR validation returns zero errors |
| M1 | Mechanism | [MECH-XBRL] XBRL Tagging Tools (Workiva Wdesk, Rivet Logic, GoXBRL) | tagging workflow and validation |

**Definition of Done:** MECH-XBRL validation returns zero EDGAR validation errors AND all required financial statement elements have at least one XBRL tag AND custom elements are minimized (only used where no US GAAP taxonomy element applies).

---

#### A11262: Prepare SEC Filing Transmittal Package

**Agent Definition:** Assemble the complete SEC filing transmittal package including the iXBRL-tagged financial statements, required exhibits (certifications, consent letters, code of ethics), and cover page, formatted per the applicable form type (10-K, 10-Q, or 8-K).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | iXBRL-Tagged Financial Statements | from A11261.O1 |
| I2 | Input | Required Exhibits | SOX 302 certifications, SOX 906 certifications, auditor consent (annual), exhibit index |
| C1 | Control | [SEC-SX] Regulation S-X | financial statement content and format requirements |
| C2 | Control | [SOX-302] | certifications must be included as exhibits |
| O1 | Output | SEC Filing Transmittal Package | complete 10-K / 10-Q / 8-K with all required exhibits assembled |
| M1 | Mechanism | [MECH-EDGAR] SEC EDGAR Electronic Submissions | filing preparation interface |
| M2 | Mechanism | [MECH-XBRL] XBRL Tagging Tools | transmittal package assembly |

**Definition of Done:** EDGAR filing preparation tool shows zero missing required exhibits AND form type (10-K/10-Q/8-K) matches the triggering event AND all certifications are signed and attached.

---

#### A11263: Submit EDGAR Filing and Confirm Acceptance

**Agent Definition:** Submit the complete SEC filing transmittal package to EDGAR, receive the EDGAR filing ID and acceptance confirmation, and deliver the confirmation to the CFO-equivalent within the filing deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | SEC Filing Transmittal Package | from A11262.O1 |
| C1 | Control | [SEC-SX] Regulation S-X | filing must be submitted by statutory deadline (60 days post-fiscal-year-end for 10-K large accelerated filer; 90 days for others) |
| C2 | Control | [SEC-XBRL] | submission must include iXBRL-tagged financials |
| O1 | Output | EDGAR Filing Acceptance Confirmation | EDGAR filing ID, accession number, and acceptance timestamp |
| M1 | Mechanism | [MECH-EDGAR] SEC EDGAR Electronic Submissions | electronic filing submission |

**Definition of Done:** EDGAR returns HTTP 200 acceptance with filing ID AND accession number AND submission timestamp is before the statutory deadline for the applicable form type AND confirmation is delivered to CFO-equivalent.

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1 = A1121.O3; O2 = A1125.O5; O3 = A1126.O3; O4 = A1121.O3
- [x] No skill appears under more than one function node
- [x] All cross-function skills cite an interface: IF-A1-24 (A11253 → Legal A12)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] All L4 and L5 node names are active verb phrases — verified (R1.2a)
- [x] Leaf node count confirmed: 18
- [x] Mandatory inclusions: intercompany elimination (A1124 ✓), deferred revenue (A1122 ✓), XBRL (A1126 ✓)
- [x] New interface used: IF-A1-24 (A112 → A12 Legal, Financial Statements for Pre-Filing Review) — add to ctrl-interface-register.md
