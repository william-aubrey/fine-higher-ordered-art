# Skill File: Cost Accounting & Profitability Analysis

**Node:** A115
**Parent:** A11 Finance
**Function:** Analyze Product and Project Profitability
**Supreme Constraint:** [MATH-GAAP-AXIOMS] Cost Allocation Identity; [GAAP-ASC606] Revenue Matching; [ISO-9001] (cost of quality)
**Cross-Function Interfaces:** None (all flows internal to A11; outputs consumed by FP&A A111 and board)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 (L5) — confirmed at sprint close

---

## A115: Analyze Product and Project Profitability

**Function:** Analyze Product and Project Profitability
**Supreme Constraint:** [MATH-GAAP-AXIOMS]; [GAAP-ASC606]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Locked Trial Balance + Actuals | from Accounting A112 — period GL data by cost center |
| I2 | Input | Revenue Data by Product / Customer | from A112 revenue recognition output — disaggregated per ASC 606 |
| I3 | Input | Production Job-Cost Data | from Production A2 — actual direct labor, material, overhead per job |
| I4 | Input | Standard Cost Master | approved standard material, labor, and overhead rates |
| C1 | Control | [MATH-GAAP-AXIOMS] Cost Allocation Identity | total allocated costs must equal total costs incurred — no unallocated residual |
| C2 | Control | [GAAP-ASC606] | profitability analysis must use recognized revenue (not bookings or billings) |
| C3 | Control | [GAAP-MATERIALITY] | report variances and findings above materiality threshold |
| O1 | Output | Product and Customer Profitability Report | margin by product line and customer segment |
| O2 | Output | Standard Cost Variance Analysis | volume, rate, and efficiency variances vs. standard |
| O3 | Output | Job-Cost Performance Report | job-to-date vs. budget-at-completion by project |
| O4 | Output | Cost Center Efficiency Report | cost per unit / cost per headcount by function |
| O5 | Output | Make-vs-Buy Recommendation Package | fully loaded comparison for Principal decision |
| M1 | Mechanism | [MECH-ERP-GL] ERP / General Ledger | cost data source |
| M2 | Mechanism | [MECH-BI] Business Intelligence Platform | profitability reporting and drill-down |
| M3 | Mechanism | [MECH-FPA] FP&A Platform | standard cost and ABC modeling |

**Child Nodes:** A1151, A1152, A1153, A1154, A1155, A1156

### Boundary Arrow Correspondence (A115)

| A115 Code | Produced By | Notes |
|---|---|---|
| O1 Product and Customer Profitability Report | A1153.O3 | ranked by margin; loss leaders flagged |
| O2 Standard Cost Variance Analysis | A1152.O3 | root cause documented for material variances |
| O3 Job-Cost Performance Report | A1154.O2 | job-to-date vs. budget-at-completion |
| O4 Cost Center Efficiency Report | A1155.O3 | distributed to function heads |
| O5 Make-vs-Buy Recommendation Package | A1156.O3 | Principal decision package |

---

### A1151: Assign Costs to Products and Projects via Activity-Based Costing

**Function:** Assign Costs to Products and Projects via Activity-Based Costing
**Supreme Constraint:** [MATH-GAAP-AXIOMS]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Indirect Cost Pool Totals | from GL by cost center — all overhead, shared services costs |
| I2 | Input | Activity Driver Data | units of activity consumed per product / project |
| C1 | Control | [MATH-GAAP-AXIOMS] | total allocated costs = total pool costs; no cost left unallocated |
| O1 | Output | Activity Cost Pool Definitions | pool name, total cost, cost driver, cost driver rate |
| O2 | Output | Cost-to-Product / Project Allocation | each product/project: direct costs + ABC-allocated indirect costs |
| O3 | Output | Full-Absorption Cost per Unit | direct material + direct labor + allocated overhead per unit or service instance |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | ABC model |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | cost pool data |

**Child Nodes:** A11511, A11512, A11513

---

### A1152: Compute Standard Costs and Analyze Variances

**Function:** Compute Standard Costs and Analyze Variances
**Supreme Constraint:** [MATH-GAAP-AXIOMS]; [GAAP-MATERIALITY]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Standard Cost Master | approved standard rates for material, labor, and overhead |
| I2 | Input | Actual Costs from Period | from GL actuals |
| C1 | Control | [MATH-GAAP-AXIOMS] | actual − standard = variance; variances must be explained |
| C2 | Control | [GAAP-MATERIALITY] | variances >threshold require root cause documentation |
| O1 | Output | Standard vs. Actual Cost Comparison | by product, period, and cost category |
| O2 | Output | Variance Summary Table | total variance split: material price, material usage, labor rate, labor efficiency, overhead |
| O3 | Output | Root Cause Report for Material Variances | documented root cause + owner per material variance |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (standard cost module) | |
| M2 | Mechanism | [MECH-BI] BI Platform | variance visualization |

**Child Nodes:** A11521, A11522, A11523

---

### A1153: Analyze Customer and Product Line Profitability

**Function:** Analyze Customer and Product Line Profitability
**Supreme Constraint:** [GAAP-ASC606]; [GAAP-MATERIALITY]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Full-Absorption Cost per Unit | from A1151.O3 |
| I2 | Input | Recognized Revenue by Product / Customer | from A112 — disaggregated per ASC 606 |
| C1 | Control | [GAAP-ASC606] | use recognized revenue, not bookings or cash |
| C2 | Control | [GAAP-MATERIALITY] | report customers and products accounting for >5% of revenue or cost |
| O1 | Output | Gross Margin by Product Line | revenue − COGS by product; gross margin % |
| O2 | Output | Customer Margin and LTV by Segment | revenue, COGS, gross margin, estimated LTV per segment |
| O3 | Output | Ranked Profitability Report with Loss Leader Flags | all products and customers ranked by margin; loss leaders (margin <0%) flagged |
| M1 | Mechanism | [MECH-BI] BI Platform | profitability analysis |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | revenue and cost data |

**Child Nodes:** A11531, A11532, A11533

---

### A1154: Produce Job-Cost Reports for Projects and Contracts

**Function:** Produce Job-Cost Reports for Projects and Contracts
**Supreme Constraint:** [MATH-GAAP-AXIOMS]; [GAAP-ASC606]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Job-Cost Actuals | direct labor hours + rates, material charges, allocated overhead per job code |
| I2 | Input | Contract Budget at Completion | from project charter or SOW — approved budget per job |
| C1 | Control | [MATH-GAAP-AXIOMS] | job-to-date costs must tie to GL charges to job code |
| C2 | Control | [GAAP-ASC606] | over-budget at completion triggers revenue recognition re-assessment for fixed-price contracts |
| O1 | Output | Job-Cost Report | job code, budget at completion, job-to-date actual, percent complete, EAC (estimate at completion) |
| O2 | Output | Over-Budget Alert and Reforecast | jobs where EAC > budget: alert with variance amount |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (project accounting module) | |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | EAC modeling |

**Child Nodes:** A11541, A11542, A11543

---

### A1155: Report Cost Center Spending and Efficiency Metrics

**Function:** Report Cost Center Spending and Efficiency Metrics
**Supreme Constraint:** [MATH-GAAP-AXIOMS]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Actual Costs by Cost Center | from period GL |
| I2 | Input | Cost Center Budget | from A111 approved budget |
| I3 | Input | Cost Driver Volume Data | headcount, units produced, etc. per cost center |
| C1 | Control | [MATH-GAAP-AXIOMS] | total cost center spending must sum to total company costs |
| C2 | Control | [GAAP-MATERIALITY] | flag cost centers with >threshold spending vs. budget |
| O1 | Output | Shared Services Cost Allocation Entries | allocated shared service costs to consuming cost centers |
| O2 | Output | Cost Center Efficiency Ratios | cost per unit, cost per headcount, cost per transaction by center |
| O3 | Output | Cost Center Performance Report | all centers: actual vs. budget, efficiency ratios, distributed to function heads |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | cost center data |
| M2 | Mechanism | [MECH-BI] BI Platform | reporting |

**Child Nodes:** A11551, A11552, A11553

---

### A1156: Model Make-vs-Buy and Outsourcing Decisions

**Function:** Model Make-vs-Buy and Outsourcing Decisions
**Supreme Constraint:** [MATH-NPV]; [IRC-162]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | In-House Cost Data | fully loaded cost from A1151.O3 |
| I2 | Input | Vendor Quotes | competitive bids for the outsourced option |
| C1 | Control | [MATH-NPV] | NPV of make vs. buy cash flows over decision horizon |
| C2 | Control | [IRC-162] | both options must qualify as ordinary and necessary business expense |
| O1 | Output | Fully Loaded In-House Cost Model | all direct + indirect + opportunity costs for make option |
| O2 | Output | Standardized Vendor Quote Comparison | normalized to same scope and terms |
| O3 | Output | Make-vs-Buy Recommendation Package | NPV comparison, qualitative factors, binary recommendation → Principal |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | NPV modeling |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | package delivery |

**Child Nodes:** A11561, A11562, A11563

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A11511: Define Activity Cost Pools and Cost Drivers

**Agent Definition:** Identify all significant indirect cost pools (facilities, IT, HR services, finance services, etc.), assign every indirect cost account to one pool, and define the activity driver for each pool (square footage, headcount, ticket count, transaction count) that best represents how the pool cost is consumed.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Indirect Cost GL Accounts | from MECH-ERP-GL — all non-direct cost accounts |
| C1 | Control | [MATH-GAAP-AXIOMS] | every indirect cost account assigned to exactly one pool; no unassigned residual |
| O1 | Output | Activity Cost Pool Register | pool name, assigned GL accounts, total pool cost, chosen cost driver |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | ABC pool definition |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | account-to-pool mapping |

**Definition of Done:** Sum of all pool costs equals total indirect cost balance in GL to $0.00 AND every indirect GL account is assigned to exactly one pool AND each pool has a documented cost driver with rationale.

---

#### A11512: Assign Indirect Costs to Activity Pools Using Resource Consumption Rates

**Agent Definition:** For each activity cost pool, determine the total units of the activity driver consumed across all products and projects in the period, compute the pool cost driver rate (pool cost ÷ total driver units), and produce the rate card.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Activity Cost Pool Register | from A11511.O1 |
| I2 | Input | Activity Driver Volume Data | total units of each driver consumed in the period |
| C1 | Control | [MATH-GAAP-AXIOMS] | pool cost driver rate = pool total cost ÷ total driver units |
| O1 | Output | Cost Driver Rate Card | pool name, pool cost, total driver units, cost per driver unit |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | rate computation |

**Definition of Done:** Cost driver rate is computed for every pool AND pool cost ÷ driver units = rate (no rounding error >$0.01 per unit) AND rate card is finalized before cost allocation run.

---

#### A11513: Allocate Activity Pool Costs to Products via Driver Rates

**Agent Definition:** Multiply the driver rate for each pool by the units of that driver consumed by each product or project, sum across all pools to compute the total indirect cost allocated to each product, and produce the fully allocated cost-per-unit schedule.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Cost Driver Rate Card | from A11512.O1 |
| I2 | Input | Driver Units per Product / Project | actual activity consumption by product and project |
| C1 | Control | [MATH-GAAP-AXIOMS] | sum of all allocations must equal sum of all pool costs to $0.00 |
| O1 | Output | Cost-to-Product / Project Allocation Schedule | each product/project: driver units per pool × rate = pool allocation; total allocated indirect cost |
| O2 | Output | Full-Absorption Cost per Unit | direct costs + allocated indirect costs per unit or service instance |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | allocation computation |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | allocation journal entries |

**Definition of Done:** Sum of all product/project indirect cost allocations equals sum of all pool costs to $0.00 AND full-absorption cost per unit is computed for every product with revenue AND allocation journal entries are posted and zero-balanced.

---

#### A11521: Set Standard Material, Labor, and Overhead Costs per Unit

**Agent Definition:** At the beginning of each standard cost period (typically annual), determine the standard cost for each cost component (material: expected purchase price; labor: standard hours × expected rate; overhead: applied rate per standard labor hour or unit), and update the standard cost master.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Vendor Pricing Data | expected material purchase prices for the coming period |
| I2 | Input | Labor Rate and Efficiency Data | budgeted labor rates and standard hours per unit from Engineering |
| C1 | Control | [MATH-GAAP-AXIOMS] | standard cost = expected actual cost; basis must be documented |
| O1 | Output | Updated Standard Cost Master | standard material, labor, and overhead cost per unit for each product |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (standard cost module) | standard cost update |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | standard cost modeling |

**Definition of Done:** Standard cost master is updated for all active products AND standard overhead rate is computed as total budgeted overhead ÷ total budgeted driver units AND prior period standard is archived with effective date.

---

#### A11522: Extract Actual Costs and Compute Period Variances vs. Standard

**Agent Definition:** Pull actual material, labor, and overhead costs from the period GL, compare to standard costs for the same output volume, and compute each variance type (material price, material usage, labor rate, labor efficiency, overhead spending, overhead volume).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Period Actual Costs | from MECH-ERP-GL — direct material, direct labor, overhead by product |
| I2 | Input | Standard Cost Master | from A11521.O1 |
| I3 | Input | Actual Output Volume | units produced or service instances delivered |
| C1 | Control | [MATH-GAAP-AXIOMS] | material price variance = (actual price − standard price) × actual quantity; usage variance = (actual qty − standard qty) × standard price; similar formulas for labor and overhead |
| O1 | Output | Variance Summary Table | each variance type with dollar amount: favorable (F) or unfavorable (U) |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (standard cost module) | variance computation |

**Definition of Done:** All six standard variance types are computed AND total of all variances equals (actual total cost − standard cost at actual volume) to $0.00 AND each variance is labeled F (favorable) or U (unfavorable).

---

#### A11523: Investigate and Document Root Cause for Variances Exceeding Threshold

**Agent Definition:** Review all variances above the materiality threshold, trace each to its operational root cause (supplier price change, process inefficiency, volume shortfall, overhead spending change), and produce the variance root cause report with owner assignment.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Variance Summary Table | from A11522.O1 |
| C1 | Control | [GAAP-MATERIALITY] Materiality Threshold | investigate variances >5% of standard cost for the category |
| O1 | Output | Variance Root Cause Report | variance type, dollar amount, root cause, owner, corrective action, due date |
| M1 | Mechanism | [MECH-BI] BI Platform | variance drill-down |
| M2 | Mechanism | [MECH-LLM] LLM API | root cause classification and narrative |

**Definition of Done:** Every material variance has a documented root cause AND an owner assigned AND a corrective action with due date AND zero material variances are left unclassified.

---

#### A11531: Compute Gross Margin and Contribution Margin by Product Line

**Agent Definition:** For each product line, compute gross margin (recognized revenue − COGS) and contribution margin (recognized revenue − variable costs), and produce the product line P&L with both margin metrics.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Recognized Revenue by Product Line | from A112 per ASC 606 |
| I2 | Input | Full-Absorption Cost per Unit | from A11513.O2 |
| C1 | Control | [GAAP-ASC606] | revenue must be recognized per 5-step model; no unrecognized bookings |
| C2 | Control | [MATH-GAAP-AXIOMS] | gross margin = revenue − COGS; contribution margin = revenue − variable costs |
| O1 | Output | Product Line P&L | revenue, COGS, gross profit, gross margin %, variable costs, contribution margin, contribution margin % |
| M1 | Mechanism | [MECH-BI] BI Platform | product line margin reporting |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | revenue and cost data |

**Definition of Done:** Gross margin % is computed for every product line with revenue AND contribution margin % excludes fixed cost allocations AND total product line revenue sums to total company recognized revenue to $0.00.

---

#### A11532: Compute Customer Margin and Lifetime Value by Segment

**Agent Definition:** Group customers into defined segments, compute gross margin per segment from recognized revenue less allocated COGS, estimate customer lifetime value (LTV) using historical cohort retention and average contract value, and produce the segment margin and LTV report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Recognized Revenue by Customer | from A112 — customer-level revenue detail |
| I2 | Input | COGS Allocation by Customer | from A1151 ABC allocation |
| C1 | Control | [GAAP-ASC606] | recognized revenue only; deferred revenue excluded from current period margin |
| O1 | Output | Customer Segment Margin Report | segment, revenue, COGS, gross margin, gross margin %, estimated LTV |
| M1 | Mechanism | [MECH-BI] BI Platform | customer cohort and LTV analysis |
| M2 | Mechanism | [MECH-CRM] CRM Platform | customer data |

**Definition of Done:** Every defined customer segment has a gross margin % computed AND LTV estimate is based on documented cohort retention data AND total segment revenue ties to total recognized revenue to $0.00.

---

#### A11533: Rank Products and Customers by Profitability and Flag Loss Leaders

**Agent Definition:** Sort all products and customer segments by gross margin % descending, flag any with gross margin < 0% as loss leaders, compute the cumulative revenue and margin contribution at each rank, and produce the ranked profitability report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Product Line P&L | from A11531.O1 |
| I2 | Input | Customer Segment Margin Report | from A11532.O1 |
| C1 | Control | [GAAP-MATERIALITY] | flag any product or segment accounting for >5% of revenue or cost |
| O1 | Output | Ranked Profitability Report | products and segments ranked by margin %; loss leaders (margin <0%) flagged in red; cumulative revenue/margin at each rank |
| M1 | Mechanism | [MECH-BI] BI Platform | ranked report generation |

**Definition of Done:** All products and segments appear in the ranked list AND every item with gross margin < 0% is flagged as a loss leader AND cumulative revenue at the top 10 items is documented.

---

#### A11541: Accumulate Direct Labor, Material, and Overhead Costs to Job Codes

**Agent Definition:** Confirm all direct labor hours, material requisitions, and overhead allocations for active projects are coded to the correct job code in the project accounting sub-ledger, and produce the job-to-date cost accumulation report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Direct Cost Transactions | from MECH-ERP-GL — labor, material, and overhead postings by job code |
| C1 | Control | [MATH-GAAP-AXIOMS] | sum of all job code charges must equal total direct + allocated overhead in GL |
| O1 | Output | Job-to-Date Cost Accumulation Report | job code, direct labor cost, material cost, allocated overhead, total job-to-date cost |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (project accounting module) | job code sub-ledger |

**Definition of Done:** Sum of all job-to-date costs ties to the GL project cost accounts to $0.00 AND every active job code has at least one cost entry AND no cost is posted to a closed or inactive job code.

---

#### A11542: Compare Job-to-Date Costs Against Contract Budget at Completion

**Agent Definition:** For each active project, compare the job-to-date actual cost to the contract budget at completion, compute percent complete (cost-to-cost or milestone method), and compute the estimate at completion (EAC = budget-at-completion ÷ cost performance index).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Job-to-Date Cost Accumulation | from A11541.O1 |
| I2 | Input | Contract Budget at Completion | approved project budget per contract or SOW |
| C1 | Control | [GAAP-ASC606] | for fixed-price contracts, over-budget EAC triggers revenue recognition reassessment |
| O1 | Output | Job-Cost Performance Schedule | job code, budget-at-completion, job-to-date actual, percent complete, EAC, variance at completion |
| O2 | Output | Over-Budget Alert | jobs with EAC > budget: dollar overage and percent overage |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL (project accounting) | |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | EAC computation |

**Definition of Done:** Every active job code has an EAC computed AND variance at completion = EAC − budget-at-completion is documented AND any fixed-price job with EAC > budget is flagged for ASC 606 revenue recognition review.

---

#### A11543: Alert Stakeholders When Job Costs Exceed Budget by Defined Threshold

**Agent Definition:** For every job code where the current EAC exceeds budget-at-completion by more than the defined threshold (e.g., 10%), generate and deliver an over-budget alert to the project owner and CFO-equivalent, including the variance amount and recommended corrective actions.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Job-Cost Performance Schedule | from A11542.O1 — jobs with EAC > budget |
| C1 | Control | [GAAP-MATERIALITY] | alert threshold = 10% or $ materiality threshold per instance policy |
| O1 | Output | Over-Budget Alert Notifications | job code, budget, EAC, variance, corrective action options — delivered to project owner and CFO-equivalent |
| M1 | Mechanism | [MECH-MESSAGING] Team Messaging API (Slack, Teams) | real-time alert delivery |
| M2 | Mechanism | [MECH-EMAIL-API] Transactional Email API | backup email notification |

**Definition of Done:** Every job with EAC > budget + threshold has a delivered alert AND alert includes dollar and percentage variance AND delivery confirmed via MECH-MESSAGING or MECH-EMAIL-API.

---

#### A11551: Allocate Shared Services Costs to Cost Centers via Transfer Pricing

**Agent Definition:** Determine the transfer price for each shared service (IT, HR, Finance, Legal) consumed by operating cost centers using a documented allocation methodology (headcount, transaction count, or direct billing), post the intercompany or intracompany allocation entries, and produce the cost allocation summary.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Shared Services Cost Center Totals | actual period costs for IT, HR, Finance, Legal service centers |
| I2 | Input | Cost Driver Usage Data | headcount, ticket count, transactions per consuming cost center |
| C1 | Control | [MATH-GAAP-AXIOMS] | total allocated = total shared service cost; no residual unallocated |
| C2 | Control | [IRC-482] (if cross-entity) | intercompany allocations must be at arm's length |
| O1 | Output | Shared Services Allocation Journal Entries | debit consuming cost center / credit shared service center; all zero-balanced |
| O2 | Output | Allocation Summary | cost center, shared service type, driver units, rate, allocated amount |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | allocation entry posting |

**Definition of Done:** Total allocated costs across all consuming centers equals total shared service cost to $0.00 AND allocation journal entries are zero-balanced AND allocation methodology is documented with driver data support.

---

#### A11552: Compute Cost Center Efficiency Ratios

**Agent Definition:** For each operating and service cost center, compute the applicable efficiency ratio (cost per unit of output, cost per FTE, cost per transaction, or cost as % of revenue) and compare to the prior period and to budget.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Actual Costs per Cost Center | from period GL post-allocation |
| I2 | Input | Cost Driver Volume Data | units, headcount, transactions per cost center |
| C1 | Control | [GAAP-MATERIALITY] | flag cost centers where efficiency ratio deteriorated >threshold vs. prior period |
| O1 | Output | Cost Center Efficiency Ratio Table | cost center, efficiency metric, current period, prior period, budget, variance |
| M1 | Mechanism | [MECH-BI] BI Platform | efficiency ratio computation and comparison |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | cost data |

**Definition of Done:** Every cost center has at least one efficiency ratio computed AND prior period and budget comparisons are populated AND any cost center with efficiency ratio deterioration >threshold is flagged.

---

#### A11553: Distribute Cost Center Performance Report to Function Heads

**Agent Definition:** Compile the cost center efficiency ratios and spending summaries into a formatted performance report, confirm the distribution list matches current function heads, and distribute the report within the post-close reporting deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Cost Center Efficiency Ratio Table | from A11552.O1 |
| I2 | Input | Actual vs. Budget Spending by Cost Center | from A111 variance analysis |
| C1 | Control | [GAAP-MATERIALITY] | report must include narrative for material variances |
| O1 | Output | Cost Center Performance Report | per function: actual spend, budget, variance, efficiency metrics — formatted and distributed |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | report assembly and distribution |

**Definition of Done:** Report is delivered to each function head on the distribution list AND MECH-DOC returns delivery confirmation AND distribution timestamp is within the reporting deadline.

---

#### A11561: Model Fully Loaded In-House Cost for Make Option

**Agent Definition:** Compute the total fully loaded cost of performing the activity in-house, including direct costs, allocated overhead (from ABC model), opportunity cost of capacity consumed, and any capital investment required, expressed as an annualized cost.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Direct Cost Data for In-House Activity | headcount costs, material costs, tooling costs |
| I2 | Input | ABC Overhead Allocation | from A11513.O2 — overhead allocated to this activity |
| C1 | Control | [MATH-NPV] | if capital investment required: include NPV of capex in annualized cost |
| C2 | Control | [IRC-162] | in-house costs are fully deductible as ordinary and necessary expenses |
| O1 | Output | Fully Loaded In-House Annual Cost | total direct + overhead + annualized capex + opportunity cost |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | make cost model |

**Definition of Done:** In-house cost model documents every cost component with a source AND total fully loaded cost ≥ direct costs (overhead cannot be zero unless truly no overhead is consumed) AND annualized capex is computed using MATH-NPV if applicable.

---

#### A11562: Obtain and Standardize Vendor Quotes for Buy Option

**Agent Definition:** Issue RFP or request at least two competitive vendor quotes for the same scope as the in-house option, normalize all quotes to the same basis (same scope, same contract term, same risk allocation), and produce the standardized quote comparison.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | In-House Activity Scope Definition | from A11561 — scope, volume, service levels |
| C1 | Control | [INCOTERMS] (if applicable) | delivery and risk transfer terms for goods supply |
| C2 | Control | [IRC-162] | vendor costs are deductible if ordinary and necessary |
| O1 | Output | Standardized Vendor Quote Comparison | at least 2 quotes normalized to same scope: vendor, annual cost, SLA, contract term, risk |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | RFP and quote management |

**Definition of Done:** At least two vendor quotes are obtained AND all quotes are normalized to the same scope, term, and risk basis AND quote comparison documents any non-price differences (SLA, term, risk).

---

#### A11563: Compile Make-vs-Buy Recommendation Package for Principal Decision

**Agent Definition:** Compare the fully loaded in-house cost to the standardized vendor quotes using NPV analysis over the decision horizon, assess qualitative factors (capability, risk, flexibility, strategic value), and produce a decision package with a binary make-or-buy recommendation for the Principal.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Fully Loaded In-House Cost | from A11561.O1 |
| I2 | Input | Standardized Vendor Quote Comparison | from A11562.O1 |
| C1 | Control | [MATH-NPV] | NPV of make option vs. NPV of buy option over decision horizon; decision rule: choose higher NPV |
| O1 | Output | Make-vs-Buy Decision Package | NPV comparison, qualitative factor matrix, binary recommendation (make/buy) → Principal |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | NPV comparison |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | package delivery |
| M3 | Mechanism | [MECH-ESIGN] Electronic Signature | Principal decision capture |

**Definition of Done:** Package contains NPV for both make and buy options over the same horizon AND qualitative matrix covers ≥3 non-price factors AND Principal returns signed binary make/buy decision within Principal-defined SLA.

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1 = A1153.O3; O2 = A1152.O3; O3 = A1154.O2; O4 = A1155.O3; O5 = A1156.O3
- [x] No skill appears under more than one function node
- [x] No cross-function interfaces (all flows internal to A11) — no tagging required
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] All L4 and L5 node names are active verb phrases — verified (R1.2a)
- [x] Leaf node count confirmed: 18
