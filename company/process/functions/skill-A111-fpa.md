# Skill File: Financial Planning & Analysis

**Node:** A111
**Parent:** A11 Finance
**Function:** Plan and Forecast Enterprise Financial Performance
**Supreme Constraint:** [MATH-GAAP-AXIOMS] Double-Entry Accounting Identity; [MATH-NPV] Capital Allocation; [GAAP-ASC606] Revenue Recognition
**Cross-Function Interfaces:** IF-A0-02, IF-A0-06, IF-A1-06, IF-A1-08, IF-A1-10, IF-A1-23
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] Zero-Based Budgeting (ZBB) cycle execution — [MATH-ZBB] → A11111
- [x] Capital allocation modeling — [MATH-NPV] → A1114 / A11141–A11143
- [ ] Intercompany elimination — [GAAP-ASC810] → deferred to A112 sprint
- [ ] XBRL tagging — [SEC-XBRL] → deferred to A112 sprint
- [ ] Deferred revenue recognition waterfall — [GAAP-ASC606] recognition mechanics → deferred to A112 sprint
- [ ] Transfer pricing documentation — [IRC-482] → deferred to A113 sprint
- [ ] Treasury cash pooling structure design — [MATH-NPV] pooling model → deferred to A114 sprint
- [ ] Actuarial loss development triangle — deferred to A116 sprint

---

## A111: Plan and Forecast Enterprise Financial Performance

**Function:** Plan and Forecast Enterprise Financial Performance
**Supreme Constraint:** [MATH-GAAP-AXIOMS]; [MATH-NPV]; [GAAP-MATERIALITY]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Revenue Contract Schedule + CRM Pipeline | from Sales A33 via IF-A0-09 |
| I2 | Input | Capital Expenditure Requests | from Engineering A14 via IF-A1-06 |
| I3 | Input | Headcount Requisitions + Compensation Band Data | from People A13 via IF-A1-07 and IF-A1-13 |
| I4 | Input | Closed-Period Actuals | from Accounting A112 (internal A11 flow) |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Accounting Identity | budget must be internally consistent |
| C2 | Control | [MATH-NPV] Net Present Value Formula | capital allocation evaluation |
| C3 | Control | [GAAP-MATERIALITY] Materiality Threshold | variance reporting cutoff (>5% net income) |
| C4 | Control | [GAAP-ASC230] Cash Flow Statement Classification | operating / investing / financing |
| C5 | Control | [GAAP-ASC606] Revenue Recognition | project recognized revenue by performance obligation |
| O1 | Output | Approved Annual Budget | → Production A2 via IF-A0-02; Sales A3 via IF-A0-06; People A13 via IF-A1-08; Sales A33 via IF-A1-10 |
| O2 | Output | 13-Week Cash Flow Projection | → Principal; → Accounting A112 (internal) |
| O3 | Output | Capital Allocation Decision Package | → Engineering A14 via IF-A1-23; → Principal |
| O4 | Output | Board Financial Reporting Package | → Principal and board |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | budgeting, forecasting, scenario modeling |
| M2 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | actuals data source and chart of accounts |
| M3 | Mechanism | [MECH-BI] Business Intelligence Platform | KPI dashboards and trend analysis |
| M4 | Mechanism | [MECH-CRM] CRM Platform | pipeline data for revenue forecast |

**Child Nodes:** A1111, A1112, A1113, A1114, A1115, A1116

### Boundary Arrow Correspondence (A111)

| A111 Code | Produced By | Notes |
|---|---|---|
| O1 Approved Annual Budget | A1111.O3 | balanced P&L + BS + cash flow budget |
| O2 13-Week Cash Flow Projection | A1112.O3 | only A1112.O3 (13-week projection) exits boundary; O1 + O2 consumed internally by A1113 |
| O3 Capital Allocation Decision Package | A1114.O3 | ranked scenarios for Principal decision |
| O4 Board Financial Reporting Package | A1116.O3 | distributed to authorized recipients |

### Internal Arrows (A111 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1111.O3 | A1112 | Input | Approved Budget (forecast calibration baseline) |
| 2 | A1112.O2 | A1113 | Input | Reforecast expense (budget-vs-reforecast comparison) |
| 3 | A1113.O3 | A1116 | Input | Variance Narrative (board package input) |
| 4 | A1114.O3 | A1116 | Input | Capital Allocation Recommendations (board package input) |
| 5 | A1115.O2 | A1111 | Input | Labor Cost-to-Cost-Center Map (ZBB labor input) |
| 6 | A1115.O3 | A1116 | Input | Labor Plan Validation (board package input) |

---

### A1111: Execute Annual Zero-Based Budget Build

**Function:** Execute Annual Zero-Based Budget Build
**Supreme Constraint:** [MATH-ZBB]; [MATH-GAAP-AXIOMS]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Zero-Based Cost Submissions | all costs justified from zero by department heads |
| I2 | Input | Revenue Forecast Inputs | contract schedule (IF-A0-09) + CRM pipeline (MECH-CRM) |
| I3 | Input | Labor Cost-to-Cost-Center Map | from A1115.O2 |
| C1 | Control | [MATH-ZBB] Zero-Based Budgeting Methodology | every dollar justified from zero; no prior-period carryforward |
| C2 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | budget P&L + BS + cash flow must balance to $0.00 |
| C3 | Control | [GAAP-ASC606] Revenue Recognition | recognized revenue only — no deferred bookings |
| O1 | Output | Zero-Based Budget Driver Workbook | compiled justified submissions by cost center |
| O2 | Output | Annual Revenue Forecast by Performance Obligation | per ASC 606 5-step model |
| O3 | Output | Balanced Full-Year Financial Budget | P&L + BS + cash flow, internally consistent |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | chart of accounts reference |

**Child Nodes:** A11111, A11112, A11113

---

### A1112: Produce Rolling Short-Term Forecast

**Function:** Produce Rolling Short-Term Forecast
**Supreme Constraint:** [GAAP-ASC230]; [GAAP-MATERIALITY]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Approved Budget | from A1111.O3 |
| I2 | Input | Current Period Actuals | from MECH-ERP-GL |
| I3 | Input | CRM Pipeline Stage Data | opportunity value × stage win rate |
| C1 | Control | [GAAP-ASC230] Cash Flow Classification | operating / investing / financing method |
| C2 | Control | [GAAP-MATERIALITY] Materiality Threshold | expense variances >5% net income flagged |
| O1 | Output | Updated Revenue Forecast by Segment | win-rate-weighted pipeline projection |
| O2 | Output | Reforecast Operating Expense by Category | actuals-adjusted, variance-flagged |
| O3 | Output | 13-Week Cash Flow Projection | week-by-week cash balance and shortfall dates |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | |
| M2 | Mechanism | [MECH-CRM] CRM Platform | pipeline data |
| M3 | Mechanism | [MECH-ERP-GL] ERP / GL | actuals pull |

**Child Nodes:** A11121, A11122, A11123

---

### A1113: Analyze Budget-to-Actual Variances

**Function:** Analyze Budget-to-Actual Variances
**Supreme Constraint:** [GAAP-MATERIALITY]; [MATH-GAAP-AXIOMS]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Closed-Period Actuals | from MECH-ERP-GL post-period-close |
| I2 | Input | Approved Annual Budget | from A1111.O3 |
| C1 | Control | [GAAP-MATERIALITY] Materiality Threshold | variances >5% net income require narrative |
| C2 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | variance ties must sum to zero across all lines |
| O1 | Output | Budget-to-Actual Variance Report | line-by-line comparison table |
| O2 | Output | Root Cause Classification Table | volume / rate / efficiency variance by line item |
| O3 | Output | Variance Narrative with Corrective Actions | management commentary + owner-assigned action items |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | actuals source |
| M3 | Mechanism | [MECH-BI] BI Platform | variance reporting views |

**Child Nodes:** A11131, A11132, A11133

---

### A1114: Model Capital Allocation Scenarios

**Function:** Model Capital Allocation Scenarios
**Supreme Constraint:** [MATH-NPV]; [IRC-263]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Capital Expenditure Requests | from Engineering A14 via IF-A1-06 |
| I2 | Input | Available Capital | from A1111.O3 budget envelope |
| C1 | Control | [MATH-NPV] Net Present Value Formula | NPV = Σ(CFₜ / (1+r)ᵗ) − C₀; r = WACC [MATH-WACC] |
| C2 | Control | [IRC-263] Capital Expenditure Capitalization | capitalize vs. expense determination per IRC §263 |
| O1 | Output | DCF Model per Investment Candidate | NPV, IRR, payback period per request |
| O2 | Output | Ranked Scenario Table | probability-weighted NPVs, risk-adjusted returns |
| O3 | Output | Capital Allocation Decision Package | ranked scenarios + Principal binary approve/reject |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | scenario modeling |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | budget data |

**Child Nodes:** A11141, A11142, A11143

---

### A1115: Build Headcount and Labor Cost Plan

**Function:** Build Headcount and Labor Cost Plan
**Supreme Constraint:** [IRC-3111]; [IRC-162]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Headcount Requisitions | from all functions via IF-A1-07 |
| I2 | Input | Compensation Framework | salary bands from A1331 via IF-A1-13 |
| I3 | Input | Benefits Cost Estimate per FTE | from Benefits A1332 (internal A13 → A11 flow via IF-A1-17) |
| C1 | Control | [IRC-3111] Employer FICA | 6.2% SS + 1.45% Medicare employer cost per FTE |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | compensation deductibility standard |
| O1 | Output | Fully Loaded Cost per FTE by Compensation Level | base + employer FICA + benefits |
| O2 | Output | Labor Cost-to-Cost-Center Mapping Table | headcount × loaded cost by department |
| O3 | Output | Labor Plan vs. Compensation Budget Validation | confirms total ≤ IF-A1-08 budget authorization |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | headcount data |

**Child Nodes:** A11151, A11152, A11153

---

### A1116: Prepare Board and Management Reporting Package

**Function:** Prepare Board and Management Reporting Package
**Supreme Constraint:** [MATH-GAAP-AXIOMS]; [SOX-302]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Closed-Period Financial Statements | from Accounting A112 (internal A11 flow) |
| I2 | Input | Variance Narrative | from A1113.O3 |
| I3 | Input | Capital Allocation Recommendations | from A1114.O3 |
| I4 | Input | KPI Source Data | from MECH-ERP-GL and MECH-CRM |
| I5 | Input | Labor Plan Validation | from A1115.O3 (labor plan vs. compensation budget result) |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | financial summaries must be internally consistent |
| C2 | Control | [SOX-302] CEO/CFO Certification | officers certify accuracy if public company |
| O1 | Output | Period Financial Summary | P&L + BS + cash flow formatted for board |
| O2 | Output | Financial KPI Dashboard | growth, margin, burn rate, runway metrics |
| O3 | Output | Board Financial Package | complete package delivered to authorized recipients |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | |
| M2 | Mechanism | [MECH-BI] BI Platform | KPI dashboards |
| M3 | Mechanism | [MECH-DOC] Document Collaboration | package distribution |

**Child Nodes:** A11161, A11162, A11163

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A11111: Compile Zero-Based Cost Submissions by Department

**Agent Definition:** Collect all department-submitted zero-based cost justification workbooks, validate that every line item includes a business justification and maps to a valid chart-of-accounts code, and produce a consolidated input workbook for budget assembly.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Department ZBB Submissions | zero-based cost justification workbooks from all cost center owners |
| C1 | Control | [MATH-ZBB] Zero-Based Budgeting Methodology | every line item justified from zero; no prior-period carryforward permitted |
| C2 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | all submitted lines must map to a valid COA code |
| O1 | Output | Consolidated ZBB Input Workbook | all department submissions merged; each line has COA code, justification, and owner |
| M1 | Mechanism | [MECH-FPA] FP&A Platform (Anaplan, Adaptive Planning, Pigment) | submission workflow and workbook consolidation |

**Definition of Done:** MECH-FPA returns zero validation errors (all lines have COA code and justification) AND consolidated workbook row count equals sum of all department submission row counts.

---

#### A11112: Model Annual Revenue Forecast by Performance Obligation

**Agent Definition:** Apply the ASC 606 5-step model to the contract pipeline and executed contract schedule to project recognized revenue by performance obligation type and period for the budget year.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed Contract Schedule | contract IDs, TCV, performance obligation schedule from IF-A0-09 |
| I2 | Input | CRM Pipeline Data | open opportunities with stage, value, and expected close date |
| C1 | Control | [GAAP-ASC606] Revenue Recognition | 5-step model: identify contract, PO, price, allocate, recognize |
| O1 | Output | Annual Revenue Forecast by Performance Obligation | period-by-period recognized revenue by product/service type |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | |
| M2 | Mechanism | [MECH-CRM] CRM Platform (HubSpot, Salesforce) | pipeline data export |

**Definition of Done:** Revenue forecast total ties to sum of (executed contracts recognized per schedule) + (pipeline × stage-weighted win rate) with zero unallocated contract value.

---

#### A11113: Balance Full-Year P&L, Balance Sheet, and Cash Flow Budget

**Agent Definition:** Assemble the annual P&L, balance sheet, and cash flow statement from ZBB submissions and revenue forecast, apply double-entry identity to confirm internal consistency, and produce the signed balanced financial budget.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Consolidated ZBB Input Workbook | from A11111.O1 |
| I2 | Input | Annual Revenue Forecast | from A11112.O1 |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Accounting Identity | Assets = Liabilities + Equity at every period end; cash flow ties to BS change in cash |
| C2 | Control | [GAAP-ASC230] Cash Flow Classification | operating / investing / financing per ASC 230 |
| O1 | Output | Balanced Full-Year Financial Budget | P&L + BS + cash flow; zero-balanced; signed by CFO-equivalent |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | consolidation and balance check |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL (NetSuite, SAP, Oracle) | COA and balance validation |

**Definition of Done:** MECH-FPA balance check returns zero discrepancies (P&L net income = BS retained earnings change AND BS assets = liabilities + equity to $0.00 AND cash flow ending balance = BS cash) AND CFO-equivalent digital signature is present.

---

#### A11121: Update Revenue Forecast from CRM Pipeline Stage Data

**Agent Definition:** Pull the current CRM opportunity pipeline, apply stage-specific win-rate multipliers by segment, and compute expected ARR/MRR additions and recognized revenue additions to the rolling forecast.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | CRM Opportunity Pipeline Export | stage, value, segment, close date, rep owner from MECH-CRM |
| I2 | Input | Stage Win-Rate Table | historical win rates by stage and segment (from MECH-BI) |
| C1 | Control | [GAAP-ASC606] Revenue Recognition | only count pipeline expected to meet ASC 606 recognition criteria |
| O1 | Output | Updated Revenue Forecast by Segment | stage-weighted ARR/MRR additions by period and product line |
| M1 | Mechanism | [MECH-CRM] CRM Platform | pipeline data export |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | forecast model update |

**Definition of Done:** Forecast model update is complete with timestamp AND weighted pipeline total ties to sum of (opportunity value × stage win rate) across all open opportunities to $0.00 variance.

---

#### A11122: Reforecast Operating Expenses from Actuals-Based Adjustments

**Agent Definition:** Pull current-period actuals by cost category from MECH-ERP-GL, compute run-rate adjustments from the prior forecast, apply actuals-based multipliers to the remaining forecast periods, and flag all categories with variance above the materiality threshold.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Current Period Actuals by Cost Category | from MECH-ERP-GL period-to-date |
| I2 | Input | Prior Rolling Forecast | expense baseline from last forecast cycle |
| C1 | Control | [GAAP-MATERIALITY] Materiality Threshold | flag any category where reforecast variance vs. budget >5% of net income |
| O1 | Output | Reforecast Operating Expense by Category | actuals-adjusted forward projection; materiality flags applied |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | actuals pull |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | forecast update and flag output |

**Definition of Done:** All cost categories have an updated forward projection AND every category exceeding [GAAP-MATERIALITY] threshold has a flag with variance amount and percentage documented.

---

#### A11123: Compute 13-Week Cash Flow Projection

**Agent Definition:** Project weekly operating cash collections and disbursements for the next 13 weeks using the indirect method from the reforecast P&L, compute week-by-week ending cash balance, and identify any week where projected cash balance falls below the board-approved minimum cash threshold.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Reforecast Operating Expense | from A11122.O1 |
| I2 | Input | Updated Revenue Forecast | from A11121.O1 |
| I3 | Input | Accounts Receivable Aging | from MECH-ERP-GL (AR module) — timing of cash collections |
| C1 | Control | [GAAP-ASC230] Cash Flow Statement Classification | operating / investing / financing separation |
| O1 | Output | 13-Week Cash Flow Projection | week-by-week cash collections, disbursements, ending balance, and shortfall flags |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | cash flow model |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL (AR/AP aging) | timing data |

**Definition of Done:** All 13 weeks have a populated ending cash balance AND any week with ending balance below minimum threshold is flagged with deficit amount AND projection ties to reforecast P&L to $0.00 variance on operating cash flows.

---

#### A11131: Extract Period-End Actuals vs. Budget Comparison Report

**Agent Definition:** Pull the locked-period actuals from MECH-ERP-GL for the closed accounting period, align each GL account to its corresponding approved budget line in MECH-FPA, and produce the line-by-line budget-to-actual variance report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Locked-Period Actuals | from MECH-ERP-GL post period-close |
| I2 | Input | Approved Annual Budget by GL Account | from A1111.O3 |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | actuals and budget totals must each balance independently |
| O1 | Output | Budget-to-Actual Variance Report | GL account × period with actual, budget, variance ($ and %) columns |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | actuals pull |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | budget-to-actual comparison view |
| M3 | Mechanism | [MECH-BI] BI Platform | formatted variance report output |

**Definition of Done:** Report covers 100% of GL accounts in the approved budget AND every line has dollar variance and percentage variance populated AND report total variance ties to MECH-ERP-GL period net income to $0.00.

---

#### A11132: Classify Material Variance Root Causes by Type

**Agent Definition:** Review the budget-to-actual variance report, identify all line items where variance exceeds the materiality threshold, and classify each as a volume variance (units/headcount), rate variance (price/rate change), or efficiency variance (productivity), with a one-sentence root cause statement.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Budget-to-Actual Variance Report | from A11131.O1 |
| C1 | Control | [GAAP-MATERIALITY] Materiality Threshold | only lines >5% net income or >$[instance-defined threshold] classified |
| O1 | Output | Root Cause Classification Table | variance type (volume / rate / efficiency), root cause sentence, and owner per flagged line |
| M1 | Mechanism | [MECH-BI] BI Platform | variance drill-down |
| M2 | Mechanism | [MECH-LLM] LLM API (Anthropic Claude API) | root cause classification and narrative generation |

**Definition of Done:** Every line exceeding [GAAP-MATERIALITY] threshold has a variance type classification AND a root cause statement AND an owner assigned — zero unclassified material variances.

---

#### A11133: Draft Variance Narrative with Owner-Assigned Corrective Actions

**Agent Definition:** Compile the material variance root causes into a written management variance narrative and produce a corrective action table with owner name, action description, and due date for each material variance finding.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Root Cause Classification Table | from A11132.O1 |
| C1 | Control | [GAAP-MATERIALITY] Materiality Threshold | narrative covers all findings above threshold |
| O1 | Output | Management Variance Narrative | written commentary on all material variances with context and trend |
| O2 | Output | Corrective Action Table | owner, action description, due date per finding; binary flag: open/closed |
| M1 | Mechanism | [MECH-LLM] LLM API | narrative drafting |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | narrative and action table delivery |

**Definition of Done:** Variance narrative contains one paragraph per material finding AND corrective action table has owner, action, and due date for every finding AND draft is returned within 24 hours of period-close actuals lock.

---

#### A11141: Build Discounted Cash Flow Model per Investment Candidate

**Agent Definition:** For each Capital Expenditure Request in IF-A1-06, build a discounted cash flow model projecting incremental cash flows over the asset's useful life, compute NPV using the WACC as the discount rate, and compute IRR and payback period.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Capital Expenditure Request | from Engineering A14 via IF-A1-06 (business case, projected cash flows, useful life) |
| C1 | Control | [MATH-NPV] Net Present Value Formula | NPV = Σ(CFₜ / (1+r)ᵗ) − C₀ where r = WACC |
| C2 | Control | [MATH-WACC] Weighted Average Cost of Capital | WACC = (E/V × Re) + (D/V × Rd × (1 − Tax Rate)) |
| C3 | Control | [IRC-263] Capital Expenditure Classification | confirm expenditure qualifies for capitalization |
| O1 | Output | DCF Model per Investment Candidate | NPV, IRR, payback period, sensitivity table (±10% revenue, ±10% cost) |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | DCF modeling |

**Definition of Done:** Every CapEx Request in IF-A1-06 has a completed DCF model with NPV, IRR, payback period, and two-variable sensitivity table AND [IRC-263] capitalization determination is documented.

---

#### A11142: Rank Investment Scenarios by Risk-Adjusted Return

**Agent Definition:** Apply probability-weighted NPV scoring to all investment candidates using defined risk factors, rank all candidates in a single scenario table, and compute the cumulative capital required at each rank cutoff.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | DCF Models per Investment Candidate | from A11141.O1 |
| C1 | Control | [MATH-NPV] Net Present Value Formula | probability-weighted NPV = NPV × P(success) |
| O1 | Output | Ranked Investment Scenario Table | all candidates ranked by probability-weighted NPV; cumulative capital at each rank |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | scenario ranking model |

**Definition of Done:** All CapEx Request candidates appear in the ranked table AND probability weights sum to ≤1.0 for each candidate AND cumulative capital column is populated at every rank cutoff.

---

#### A11143: Compile Capital Allocation Decision Package for Principal

**Agent Definition:** Assemble the ranked scenario table, individual DCF models, risk narrative, and a binary approve/reject recommendation for each investment candidate into a single decision package and route to the Principal for decision.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Ranked Investment Scenario Table | from A11142.O1 |
| I2 | Input | DCF Models | from A11141.O1 |
| C1 | Control | [MATH-NPV] | NPV > 0 is the default approve threshold; negative NPV requires explicit Principal override |
| O1 | Output | Capital Allocation Decision Package | ranked table + DCF models + risk narrative + approve/reject recommendation per candidate |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | package assembly and routing |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | Principal approval capture |

**Definition of Done:** Decision package is delivered to Principal AND Principal returns signed binary approve/reject decision for each candidate within Principal-defined SLA AND approved CapEx list is transmitted to Engineering A14 via IF-A1-23.

**[CROSS-FUNCTION: A111 → A14]** *Interface: IF-A1-23*

---

#### A11151: Compute Fully Loaded Cost per FTE by Compensation Level

**Agent Definition:** Compute the fully loaded annual cost for each compensation level by summing base salary (from IF-A1-13 midpoint), employer FICA, and estimated benefits cost per FTE, and produce a cost-per-level table for use in labor budget modeling.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Compensation Framework | salary bands (min / midpoint / max) by level from IF-A1-13 |
| I2 | Input | Benefits Cost Estimate per FTE | annual employer cost (health, dental, 401k match) from IF-A1-17 |
| C1 | Control | [IRC-3111] Employer FICA | 6.2% Social Security (up to SS wage base) + 1.45% Medicare on all wages |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | compensation cost is deductible; reasonable compensation standard |
| O1 | Output | Fully Loaded Cost per FTE by Level | base (midpoint) + employer FICA + benefits = total annual cost per compensation level |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | cost computation |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | compensation level reference |

**Definition of Done:** Every active compensation level in IF-A1-13 has a fully loaded cost figure AND employer FICA is calculated using current IRC §3111 rates AND total fully loaded cost ≥ band midpoint base salary.

---

#### A11152: Allocate Total Labor Cost to Department Cost Centers

**Agent Definition:** Multiply planned headcount by level × fully loaded cost per level for each department, sum to total department labor cost, and produce a headcount-to-cost-center allocation table mapping all planned FTEs to P&L cost centers.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Headcount Plan by Department and Level | from headcount requisitions via IF-A1-07 |
| I2 | Input | Fully Loaded Cost per FTE by Level | from A11151.O1 |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | total labor cost allocation must sum to total planned headcount × loaded cost |
| O1 | Output | Labor Cost-to-Cost-Center Allocation Table | department, headcount count by level, total loaded labor cost per cost center |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | allocation computation |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | headcount plan data |

**Definition of Done:** Every cost center with planned headcount has a total loaded labor cost assigned AND sum of all cost center labor costs equals sum of (headcount by level × fully loaded cost per level) to $0.00 variance.

---

#### A11153: Validate Labor Plan Against Approved Compensation Budget

**Agent Definition:** Compare total planned labor cost across all cost centers to the compensation budget authorization in IF-A1-08 and produce a validation report confirming the plan is within budget or flagging the overage amount for Principal decision.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Labor Cost-to-Cost-Center Allocation Table | from A11152.O1 |
| I2 | Input | Compensation Budget Authorization | from Finance A11 via IF-A1-08 |
| C1 | Control | [IRC-162] Reasonable Compensation Standard | total compensation must be ordinary and necessary |
| O1 | Output | Labor Plan Validation Report | total planned vs. authorized labor cost; variance ($); pass/fail flag |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | validation comparison |

**Definition of Done:** Validation report has a binary pass (total planned ≤ authorized) or fail (total planned > authorized) determination AND any overage has dollar amount specified AND report is delivered to CFO-equivalent within 24 hours of headcount plan finalization.

**[CROSS-FUNCTION: A111 → A13]** *Interface: IF-A1-08 (consumes control input)*

---

#### A11161: Assemble Period-End Financial Statements with Variance Commentary

**Agent Definition:** Retrieve closed-period financial statements (P&L, balance sheet, cash flow statement) from MECH-ERP-GL, attach the variance narrative from A1113, and format the combined package for board-level presentation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Closed-Period Financial Statements | from Accounting A112 (P&L, BS, cash flow — internal A11 flow) |
| I2 | Input | Variance Narrative | from A11133.O1 |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Identity | financial statements must be internally consistent |
| O1 | Output | Period Financial Summary with Variance Commentary | P&L + BS + cash flow + management narrative formatted for board |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | financial statement extraction |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | formatting and assembly |

**Definition of Done:** Financial summary contains all three GAAP statements AND variance narrative is attached AND P&L net income ties to BS retained earnings change to $0.00.

---

#### A11162: Compute Financial KPI Dashboard Metrics

**Agent Definition:** Calculate the standard financial KPI set (revenue growth MoM/YoY, gross margin %, EBITDA margin %, operating cash burn rate, runway months, ARR growth rate) from period actuals and forecast data, and produce the KPI dashboard with period-over-period trend lines.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Period Actuals | from MECH-ERP-GL |
| I2 | Input | Updated Revenue Forecast | from A11121.O1 |
| C1 | Control | [MATH-BURN] Burn Rate Formula | monthly net cash outflow = operating cash disbursements − collections; runway = cash balance ÷ monthly burn |
| C2 | Control | [MATH-GAAP-AXIOMS] | all margin metrics derived from GAAP-compliant P&L figures |
| O1 | Output | Financial KPI Dashboard | revenue growth, gross margin %, EBITDA %, burn rate, runway months, ARR growth; with 12-month trend |
| M1 | Mechanism | [MECH-BI] BI Platform (Sigma, Looker, Power BI) | dashboard generation |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | actuals source |

**Definition of Done:** All six KPIs are populated for the current period AND each KPI has at least a 3-period trend line AND burn rate and runway calculations are consistent with 13-week cash projection (A11123) to within 5% rounding variance.

---

#### A11163: Distribute Board Financial Package to Authorized Recipients

**Agent Definition:** Finalize the board financial package by combining the period financial summary and KPI dashboard, verify the authorized recipients list matches the current board resolution, and distribute via MECH-DOC within the reporting deadline SLA.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Period Financial Summary with Variance Commentary | from A11161.O1 |
| I2 | Input | Financial KPI Dashboard | from A11162.O1 |
| I3 | Input | Authorized Recipients List | from board resolution stored in entity management system |
| C1 | Control | [SOX-302] CEO/CFO Certification | if public company, CEO/CFO must certify accuracy before distribution |
| O1 | Output | Board Financial Package | complete package with delivery confirmation receipt |
| M1 | Mechanism | [MECH-DOC] Document Collaboration (Google Workspace, Microsoft 365) | secure distribution |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | SOX-302 certification if applicable |

**Definition of Done:** Package is delivered to every recipient on the authorized list AND MECH-DOC returns delivery confirmation for each recipient AND distribution timestamp is within the board-approved reporting deadline SLA.

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1 = A1111.O3; O2 = A1112.O3; O3 = A1114.O3; O4 = A1116.O3
- [x] No skill appears under more than one function node
- [x] All cross-function skills cite an interface from ctrl-interface-register.md: IF-A1-08 (labor validation), IF-A1-23 (CapEx authorization to A14)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L4 node names are active verb phrases — all 6 phases verified (R1.2a)
- [x] L5 node names are active verb phrases — all 18 leaf nodes verified (R1.2a)
- [x] Leaf node count confirmed: 18
- [x] All mandatory inclusions checked (ZBB: A11111; Capital allocation NPV: A11141–A11143)
- [x] New constraint codes used: MATH-ZBB, MATH-WACC, MATH-BURN — add to ctrl-constraint-library.md
- [x] New interfaces used: IF-A1-23 (A11→A14 CapEx Authorization) — add to ctrl-interface-register.md
