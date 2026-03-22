---
type: skill
node: A1331
domain: Compensation Architecture
version: 1.0
sprint-date: 2026-03-12
status: complete
---

# Skill File: Compensation Architecture

**Node:** A1331
**Parent:** A133 Compensation & Benefits → A13 People → A1 Governance
**Function:** Design and maintain the job architecture, salary bands, and pay equity framework that governs all compensation decisions
**Supreme Constraint:** [FLSA-EXEMPT] 29 CFR Part 541; [EPA-1963] 29 U.S.C. §206(d); [PAY-EQUITY-STATE] CO EPEWA / CA SB 1162 / NY Lab. §194-b / IL SB 1480; [IRC-162] IRC §162
**Cross-Function Interfaces:** IF-A1-13 (A1331 → A132 Compensation Framework); IF-A1-14 (A13 → A12 Pay Equity Report + RIF Disparate Impact Analysis)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 (confirmed at sprint close)
**Hierarchy Depth:** L6 (A1331 = L4; A13311–A13316 = L5; A133111–A133163 = L6)

**Mandatory Inclusions Verified:**
- [x] Compa-ratio analysis and salary band calibration — [MECH-COMP] → A133141, A133131, A133132
- [x] RIF legal compliance checklist — [WARN] → A133144
- [x] 9-box talent grid calibration — [MECH-PERF] → input consumed at A133161, A133162; calibration owned by A135 (cross-referenced, not duplicated)
- [x] HRIS data model design — [MECH-HRIS] → A133153
- [~] Organizational network analysis — [MECH-ONA] used as optional augmentation input to A133142; not an owned A1331 process
- [~] Succession depth charting — owned by A135; A1331 documents compensation implications (above-band override) in A133152

---

## A1331: Compensation Architecture (L4 Parent)

**Function:** Design and maintain the job architecture, salary bands, and pay equity framework that governs all compensation decisions
**Supreme Constraint:** [FLSA-EXEMPT] 29 CFR Part 541; [EPA-1963] 29 U.S.C. §206(d); [PAY-EQUITY-STATE]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Role Requirements | Job profiles and leveling criteria from Engineering A14 |
| I2 | Input | Market Compensation Data | Salary surveys and external benchmarks (Radford, Mercer) |
| C1 | Control | Compensation Budget | From Finance A11 via IF-A1-08 |
| C2 | Control | [FLSA-EXEMPT] FLSA Exemption Tests | Exempt/non-exempt determination thresholds; 29 CFR Part 541 |
| C3 | Control | [PAY-EQUITY-STATE] State Pay Equity Laws | Pay transparency, equal pay requirements by jurisdiction |
| O1 | Output | Compensation Framework | Salary bands, grades, offer ranges → A132 Talent Acquisition (IF-A1-13) and A1333 Payroll |
| O2 | Output | Compa-Ratio Analysis | Pay equity report → A12 Legal (IF-A1-14) |
| O3 | Output | Approved Merit Increases | Individual merit increase register → A1333 Payroll for implementation |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Workday HCM, BambooHR, ADP Workforce Now |
| M2 | Mechanism | [MECH-COMP] Compensation Benchmarking | Radford (Aon), Mercer, Levels.fyi |

**Child Nodes:** A13311, A13312, A13313, A13314, A13315, A13316
**Status:** Complete

### Internal Arrows (A1331 diagram)

| # | From | To | Role at Destination | Label |
|---|---|---|---|---|
| 1 | A13311 Build Job Architecture | A13312 Market Benchmarking | Input | Job Family Taxonomy + Leveling Matrix |
| 2 | A13311 Build Job Architecture | A13313 Salary Band Construction | Input | Role-Grade Mapping Table |
| 3 | A13312 Market Benchmarking | A13313 Salary Band Construction | Input | Normalized Survey Data + Benchmark Match Table |
| 4 | A13313 Salary Band Construction | A13314 Pay Equity Analysis | Input | Salary Band Table (midpoints for compa-ratio computation) |
| 5 | A13313 Salary Band Construction | A13315 Govern Compensation Framework | Input | Salary Band Table (for FLSA review and publication) |
| 6 | A13314 Pay Equity Analysis | A13315 Govern Compensation Framework | Input | Pay Equity Findings (must be resolved or scheduled before framework publication) |
| 7 | A13313 Salary Band Construction | A13316 Merit Cycle Administration | Input | Salary Band Table (for merit increase cap enforcement) |
| 8 | A13314 Pay Equity Analysis | A13316 Merit Cycle Administration | Input | Compa-Ratio Register (for merit matrix and individual computation) |

### Boundary Arrow Correspondence (A1331 → children)

| A1331 Code | Produced By | Notes |
|---|---|---|
| O1 Compensation Framework | A13313 (bands) + A13315 (FLSA classification + publication + HRIS config) | Framework is complete when bands are built AND classified AND published AND loaded in HRIS |
| O2 Compa-Ratio Analysis | A13314 (compa-ratio computation, pay gap analysis, remediation plan, RIF analysis) | Full pay equity package |
| O3 Approved Merit Increases | A13316 (merit matrix + individual computation + Principal approval) | Merit register ready for Payroll implementation |

---

## A13311: Build Job Architecture (L5)

**Function:** Define and codify the job family taxonomy, grade levels, and role-grade mapping that structure the compensation system
**Supreme Constraint:** [FLSA-EXEMPT] FLSA Exemption Tests; [TITLE7] Title VII

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Role Requirements | Current and planned job descriptions from Engineering A14 and HRIS |
| C1 | Control | [FLSA-EXEMPT] FLSA Exemption Tests | Taxonomy must capture exempt/non-exempt at family/grade level |
| C2 | Control | [TITLE7] Title VII | Leveling criteria must be facially neutral; no protected class language |
| O1 | Output | Job Architecture Package | Job Family Taxonomy + Leveling Matrix + Role-Grade Mapping Table |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Master record storage for all job architecture data |
| M2 | Mechanism | [MECH-COMP] Compensation Benchmarking | Industry-standard job family nomenclature (Radford, Mercer) |

**Child Nodes:** A133111, A133112, A133113

---

#### A133111: Define Job Family Taxonomy

**Agent Definition:** Enumerate all distinct functional areas within the enterprise, define 3–5 job sub-families per function, produce a taxonomy table with unique codes and descriptions for each family and sub-family, and confirm every existing role can be assigned to exactly one sub-family.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Organizational Headcount Report | Current active roles by department extracted from HRIS; minimum fields: role ID, title, department, manager |
| I2 | Input | Role Requirement Requests | Planned new roles from Engineering A14 — title, function, anticipated grade |
| C1 | Control | [FLSA-EXEMPT] FLSA Exemption Tests | Taxonomy must support exempt/non-exempt determination at the family level; computer employee family requires specific duties designation |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | All job families must map to a deductible business function |
| O1 | Output | Job Family Taxonomy Table | Code, name, description, and parent function for each family (e.g., ENG-SE = Software Engineering) and sub-family (e.g., ENG-SE-BE = Backend Engineering); unique code per entry |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Source of active role list; destination for taxonomy codes |
| M2 | Mechanism | [MECH-COMP] Compensation Benchmarking | Industry-standard nomenclature alignment (Radford job family codes) |
| M3 | Mechanism | [MECH-LLM] LLM API | Claude — first-pass sub-family drafting and consistency review |

**Definition of Done:** Taxonomy Table is produced with unique codes for all families AND every active role in HRIS can be assigned to exactly one sub-family with no gaps AND Principal or CHO-Agent provides written approval.

---

#### A133112: Define Leveling Framework

**Agent Definition:** For each job family in the approved taxonomy, define 4–8 grade levels with explicit, non-overlapping criteria for three dimensions: scope of impact (individual / team / function / company), decision authority (advises / recommends / decides), and required expertise (entry / intermediate / senior / staff / principal / director), and produce a Leveling Matrix.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Job Family Taxonomy Table | From A133111; defines the families for which levels are being written |
| C1 | Control | [FLSA-EXEMPT] FLSA Exemption Tests | Level criteria must explicitly trigger the applicable FLSA exemption test; level definitions must distinguish exempt-qualifying duties from non-exempt duties |
| C2 | Control | [TITLE7] Title VII | Criteria must be facially neutral and consistently applied; no language referencing protected characteristics |
| O1 | Output | Leveling Matrix | Job family × grade level grid; each cell contains scope, decision authority, and expertise criteria; formatted for HRIS upload and offer management use |
| M1 | Mechanism | [MECH-COMP] Compensation Benchmarking | Radford/Mercer standard leveling frameworks as reference |
| M2 | Mechanism | [MECH-LLM] LLM API | Claude — criteria drafting, cross-family consistency review |

**Definition of Done:** Leveling Matrix covers all job families AND each grade has unique, non-overlapping criteria for scope, decision authority, and expertise AND Principal or CHO-Agent approves the criteria in writing.

---

#### A133113: Map Roles to Grades

**Agent Definition:** For each active role in the HRIS, apply the Leveling Matrix to assign a job family code and grade level; produce a Role-Grade Mapping Table with rationale for each assignment; flag roles where criteria application produces <80% confidence for Principal review.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Active Role Definitions | Job descriptions for all active roles from HRIS; minimum fields: role ID, title, department, duties summary |
| I2 | Input | Leveling Matrix | From A133112; the criteria applied to each role |
| C1 | Control | [FLSA-EXEMPT] FLSA Exemption Tests | Grade assignment determines FLSA exempt/non-exempt status; misclassification triggers back-pay liability |
| C2 | Control | [TITLE7] Title VII | Consistent criteria application; a role cannot receive different grade treatment based on incumbent's protected class |
| O1 | Output | Role-Grade Mapping Table | Role ID, job family code, grade level, rationale string, confidence score, ambiguity flag (Y/N) per row |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Source of role data; destination for grade assignments |
| M2 | Mechanism | [MECH-LLM] LLM API | Claude — automated first-pass matching by duties description against Leveling Matrix criteria |

**Definition of Done:** Every active role in HRIS has an assigned grade AND all roles flagged <80% confidence are routed to Principal for resolution AND mapping table has zero unresolved grade gaps.

---

## A13312: Market Benchmarking (L5)

**Function:** Pull, normalize, and match external salary survey data to produce market positioning targets for each job family and grade
**Supreme Constraint:** [MATH-STAT] Statistical Significance; [IRC-162] Reasonable Compensation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Survey Subscriptions | Access credentials for Radford/Aon, Mercer, or equivalent surveys |
| I2 | Input | Job Architecture Package | From A13311 — job family taxonomy and role-grade mapping for benchmark selection |
| C1 | Control | [MATH-STAT] Statistical Significance (p < 0.05) | Survey cells with n < 30 suppressed; blended approach for small cells |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | Market targets must support reasonable compensation determination |
| O1 | Output | Market Benchmarking Package | Normalized survey data + Benchmark match table + Market percentile targets |
| M1 | Mechanism | [MECH-COMP] Compensation Benchmarking | Radford, Mercer survey platforms |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Cost projection and aggregate modeling |

**Child Nodes:** A133121, A133122, A133123

---

#### A133121: Survey Data Pull and Normalization

**Agent Definition:** Access approved salary surveys, pull median, P25, P50, and P75 data for all benchmark job codes matching the enterprise's job families, age all figures to a single effective date using each survey's published aging factor, and suppress cells with n < 30.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Survey Access Credentials | API keys or export access for approved survey platforms (Radford/Aon, Mercer) |
| I2 | Input | Job Family Taxonomy Table | From A133111 — determines which benchmark job codes to pull |
| C1 | Control | [MATH-STAT] Statistical Significance | Survey cells with n < 30 respondents must be flagged and suppressed; blended average used when primary cell is suppressed |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | Survey data must represent arm's length market rates; proprietary or single-source data must be disclosed |
| O1 | Output | Normalized Survey Data Extract | Benchmark job code, P25/P50/P75 values, effective date, n= per cell; suppressed cells flagged; all figures in same currency and effective date |
| M1 | Mechanism | [MECH-COMP] Compensation Benchmarking | Radford/Aon, Mercer survey platforms — data access and export |
| M2 | Mechanism | [MECH-ETL] ETL / Data Pipeline | dbt, Fivetran — normalization and aging calculation |

**Definition of Done:** Survey data extract produced for all benchmark codes in scope AND all figures are on the same effective date AND cells with n < 30 are flagged and suppressed per survey rules AND extract records source survey and publication date.

---

#### A133122: Benchmark Job Matching

**Agent Definition:** For each unique job family × grade combination in the Role-Grade Mapping Table, select the best-fit survey benchmark job code from the normalized data extract by comparing job description, scope, and level; record match confidence; flag matches with <80% confidence for Principal review.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Role-Grade Mapping Table | From A133113 — all job family × grade combinations requiring a benchmark match |
| I2 | Input | Normalized Survey Data Extract | From A133121 — benchmark job codes and market data |
| C1 | Control | [MATH-STAT] Statistical Significance | Benchmark matches require n ≥ 30 in matched survey cell; blended approach if primary cell suppressed |
| C2 | Control | [PAY-EQUITY-STATE] State Pay Equity Laws | Benchmark matching documentation must be retained to support pay equity audit defense |
| O1 | Output | Benchmark Match Table | Job family × grade → survey benchmark code, match confidence %, n= in matched cell, suppression flag |
| M1 | Mechanism | [MECH-COMP] Compensation Benchmarking | Radford, Mercer survey platforms — benchmark job library |
| M2 | Mechanism | [MECH-LLM] LLM API | Claude — automated first-pass matching by job description similarity |

**Definition of Done:** All job family × grade combinations have an assigned benchmark code AND items with <80% match confidence are flagged for Principal review AND Benchmark Match Table is signed off by CHO-Agent.

---

#### A133123: Market Percentile Targeting

**Agent Definition:** For each job family tier, assign market positioning targets (P25, P50, P75) as the policy governing where the enterprise pays relative to the market; validate that the aggregate compensation cost at the target percentile is within the Finance-approved compensation budget.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Benchmark Match Table | From A133122 — matched benchmark data by family and grade |
| I2 | Input | Compensation Budget | From Finance A11 via IF-A1-08 — total headcount compensation envelope |
| C1 | Control | [IRC-162] Ordinary and Necessary Business Expenses | Targets must produce reasonable compensation; above-market outliers require documented rationale |
| C2 | Control | [MATH-NPV] Net Present Value Formula | Total compensation cost at target must be positive NPV vs. agency/contractor alternative |
| O1 | Output | Market Percentile Targets | Job family tier → target percentile; aggregate cost projection at target; approved by Principal and CFO-Agent |
| M1 | Mechanism | [MECH-COMP] Compensation Benchmarking | Survey platforms for percentile data retrieval |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Anaplan, Adaptive Planning — cost projection modeling |

**Definition of Done:** Market Percentile Targets are set for all job family tiers AND aggregate cost at target percentile is within Compensation Budget tolerance AND Principal and CFO-Agent approve the targets in writing.

---

## A13313: Salary Band Construction (L5)

**Function:** Compute salary band midpoints, ranges, and spreads; validate against budget; produce the Salary Band Table
**Supreme Constraint:** [MATH-COMPA] Compa-Ratio Formula; [MATH-BAND-SPREAD] Band Spread Formula; [FLSA-MW] FLSA Minimum Wage

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Market Benchmarking Package | From A13312 — normalized data, benchmark matches, percentile targets |
| I2 | Input | Budget Constraint | From A11 Finance via IF-A1-08 |
| I3 | Input | Current Employee Salary Register | From HRIS — used for budget impact validation |
| C1 | Control | [MATH-COMPA] Compa-Ratio Formula | Midpoints must produce compa-ratios 80–120 for median incumbent |
| C2 | Control | [FLSA-MW] FLSA Minimum Wage | Band minimums must be ≥ applicable federal or state minimum wage |
| O1 | Output | Salary Band Table | Min, midpoint, max per job family × grade; effective date; spread %; FLSA flag |
| O2 | Output | Budget Impact Report | Incremental cost to bring below-minimum employees to band minimum; variance vs. approved budget; CFO-Agent approval/rejection flag — delivered to Finance A11 |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Storage of salary bands for offer management |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Band calculation and cost modeling |

**Child Nodes:** A133131, A133132, A133133

---

#### A133131: Band Midpoint Computation

**Agent Definition:** For each job family × grade in the Benchmark Match Table, retrieve the market figure at the approved target percentile from the Normalized Survey Data Extract; apply weighted average if multiple survey sources are used; designate the result as the band midpoint and output the Band Midpoint Schedule.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Normalized Survey Data Extract | From A133121 — P25/P50/P75 figures by benchmark job code |
| I2 | Input | Benchmark Match Table with Percentile Targets | From A133122 + A133123 — which benchmark code and which percentile applies per grade |
| C1 | Control | [MATH-COMPA] Compa-Ratio Formula | Midpoints must produce compa-ratios in the 80–120 range for the median incumbent; outlier midpoints require revalidation |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | Midpoints must reflect arm's length market rates |
| O1 | Output | Band Midpoint Schedule | Job family × grade → midpoint dollar amount, source percentile, survey source(s), effective date, weighted average methodology if blended |
| M1 | Mechanism | [MECH-COMP] Compensation Benchmarking | Survey platforms for percentile data retrieval |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Weighted average calculation |

**Definition of Done:** Midpoints are computed for all job family × grade combinations AND all midpoints are sourced from survey cells with n ≥ 30 (or documented blended approach) AND effective date is current (within 12 months).

---

#### A133132: Band Range Construction

**Agent Definition:** For each band midpoint, apply the approved spread formula (Minimum = Midpoint × (1 − half-spread); Maximum = Midpoint × (1 + half-spread)), where spread varies by grade tier per policy, and verify all minimums are at or above the applicable federal or state minimum wage.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Band Midpoint Schedule | From A133131 — midpoints by job family × grade |
| I2 | Input | Spread Parameter Table | Policy document: approved spread % by grade tier (e.g., L1–L3: ±20%; L4–L6: ±30%); approved by Principal |
| C1 | Control | [MATH-BAND-SPREAD] Salary Band Spread Formula | Spread = (Max − Min) / Midpoint; must fall within 40–80% range (narrower for hourly, wider for senior/executive) |
| C2 | Control | [FLSA-MW] FLSA Minimum Wage | Band minimum must be ≥ max(federal minimum wage, applicable state minimum wage) |
| C3 | Control | [PAY-EQUITY-STATE] State Pay Transparency Laws | In CO, CA, NY, IL, WA: salary range posted on job listings must match the band; bands must be usable as disclosure ranges |
| O1 | Output | Salary Band Table | Job family × grade → min, midpoint, max in dollars; effective date; spread %; minimum wage compliance flag |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Storage destination for salary bands |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Band range calculation |

**Definition of Done:** Salary Band Table covers all job family × grade combinations AND no band minimum is below the applicable minimum wage AND band spread is within approved policy range AND CFO-Agent confirms budget alignment.

---

#### A133133: Budget Constraint Validation

**Agent Definition:** Join each HRIS employee to the Salary Band Table via grade assignment; compute the cost to bring all below-minimum employees to the band minimum; sum total incremental cost; compare against the approved compensation budget; flag any overage exceeding 5% for CFO-Agent escalation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Current Employee Salary Register | From HRIS — employee ID, grade, current base salary, employment status |
| I2 | Input | Salary Band Table | From A133132 — min, midpoint, max per grade |
| I3 | Input | Compensation Budget | From Finance A11 via IF-A1-08 — approved headcount compensation envelope |
| C1 | Control | [MATH-GAAP-AXIOMS] Double-Entry Accounting Identity | All budget impacts must be GL-coded; incremental cost must map to a cost center |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | Total compensation must remain ordinary and necessary |
| O1 | Output | Budget Impact Report | Total current compensation cost; cost at midpoint; incremental cost to bring below-minimum employees to band minimum; variance vs. approved budget; approved/rejected flag; CFO-Agent signature |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Employee salary data |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Cost modeling and variance calculation |

**Definition of Done:** Budget Impact Report is produced AND variance vs. approved budget is computed AND either (a) variance is within ±5%, OR (b) CFO-Agent provides written approval of the variance AND all below-minimum employees are identified with required adjustment amounts.

---

## A13314: Pay Equity Analysis (L5)

**Function:** Compute compa-ratios, identify pay disparities by protected class, produce a remediation plan, and conduct RIF disparate impact analysis
**Supreme Constraint:** [EPA-1963] Equal Pay Act of 1963; [TITLE7] Title VII; [PAY-EQUITY-STATE] State pay equity laws

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Salary Band Table | From A13313 — midpoints required for compa-ratio computation |
| I2 | Input | Current Employee Salary Register | From HRIS — current salaries and grade assignments |
| I3 | Input | Employee Demographics | Gender, race/ethnicity — collected with consent; from HRIS |
| C1 | Control | [EPA-1963] Equal Pay Act of 1963 | Prohibits sex-based pay differentials for equal work |
| C2 | Control | [TITLE7] Title VII | Prohibits compensation discrimination by race, color, religion, sex, national origin |
| C3 | Control | [PAY-EQUITY-STATE] State Pay Equity Laws | CO, CA, IL proactively require periodic analysis |
| O1 | Output | Pay Equity Package | Compa-Ratio Register + Pay Equity Analysis Report + Remediation Schedule + RIF Analysis (when triggered) |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Employee data source |
| M2 | Mechanism | [MECH-BI] Business Intelligence Platform | Sigma, Tableau — statistical analysis |

**Child Nodes:** A133141, A133142, A133143, A133144

---

#### A133141: Compa-Ratio Computation

**Agent Definition:** Join each active employee's current base salary from the HRIS to the Salary Band Table via their grade assignment; compute Compa-Ratio = (Current Salary / Band Midpoint) × 100 for every active employee; flag employees with compa-ratio <85 or >115; output a sorted Compa-Ratio Register.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Current Employee Salary Register | From HRIS — employee ID, grade, current base salary; active employees only |
| I2 | Input | Salary Band Table | From A133132 — midpoints by job family × grade |
| C1 | Control | [MATH-COMPA] Compa-Ratio Formula | Compa-Ratio = (Employee Base Salary / Band Midpoint) × 100; target range 85–115 |
| C2 | Control | [PAY-EQUITY-STATE] State Pay Equity Laws | Compa-ratio register is the primary evidence document for pay equity audit defense |
| O1 | Output | Compa-Ratio Register | Employee ID, job family, grade, current salary, band midpoint, compa-ratio, flag (<85 = below-target; >115 = above-target); sorted by job family and grade |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Employee salary and grade data |
| M2 | Mechanism | [MECH-BI] Business Intelligence Platform | Sigma, Tableau — computation and visualization |

**Definition of Done:** Compa-ratio is computed for every active employee AND employees with compa-ratio <85 or >115 are flagged AND no active employee has a missing or zero base salary in the register.

---

#### A133142: Pay Gap Statistical Analysis

**Agent Definition:** Run a multiple regression on the Compa-Ratio Register using legitimate pay factors (grade, tenure, performance tier from A135, location differential) as controls and protected class indicators (gender, race/ethnicity where collected with consent) as test variables; compute the unexplained residual attributable to each protected class; flag any coefficient significant at p < 0.05.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Compa-Ratio Register | From A133141 — compa-ratio per employee |
| I2 | Input | Employee Demographics | Gender, race/ethnicity collected with consent; from HRIS — used only for aggregate statistical analysis, never for individual decisions |
| I3 | Input | Legitimate Pay Factors | Tenure (hire date from HRIS), performance tier (from A135 if available), location differential (cost-of-labor index) |
| C1 | Control | [EPA-1963] Equal Pay Act of 1963 | Sex-based pay coefficient must be tested; significant finding triggers remediation |
| C2 | Control | [TITLE7] Title VII | Race/ethnicity-based pay coefficient must be tested |
| C3 | Control | [MATH-STAT] Statistical Significance (p < 0.05) | Threshold for declaring a pay gap finding; report raw p-values; do not round |
| C4 | Control | [PAY-EQUITY-STATE] State Pay Equity Laws | CA, CO, IL may require specific analytical methodology or disclosure |
| O1 | Output | Pay Equity Analysis Report | Regression model specification; coefficient table (factor, estimate, std error, p-value); findings list (protected class, estimated gap in dollars, p-value, affected employee count) |
| M1 | Mechanism | [MECH-BI] Business Intelligence Platform | Statistical regression execution (R, Python via BI platform) |
| M2 | Mechanism | [MECH-LLM] LLM API | Claude — narrative findings synthesis |

**Definition of Done:** Regression model is run with all required legitimate factor controls AND all protected class coefficients have computed p-values AND findings list is produced with dollar magnitude for each significant gap.

---

#### A133143: Pay Equity Remediation Plan Construction

**Agent Definition:** For each finding in the Pay Equity Analysis Report, identify affected employees, compute the minimum salary adjustment required to eliminate the gap (bring compa-ratio to parity with comparable employees), prioritize by gap magnitude, and construct a remediation timeline and cost schedule within the approved equity budget; route to CLO-Agent for legal review before implementation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Pay Equity Analysis Report | From A133142 — findings with affected employee list and gap dollar amounts |
| I2 | Input | Equity Remediation Budget | From Finance A11 via IF-A1-08 — approved remediation spend envelope |
| I3 | Input | 9-Box Performance Tier Output | From A135 (if available) — ensures remediation accounts for performance tier context |
| C1 | Control | [EPA-1963] Equal Pay Act of 1963 | Adjustments must eliminate the identified disparity, not introduce new ones |
| C2 | Control | [TITLE7] Title VII | Remediation must not selectively adjust only one protected class at the expense of another |
| C3 | Control | [PAY-EQUITY-STATE] State Pay Equity Laws | CA, CO require timely remediation; document implementation deadline |
| O1 | Output | Pay Equity Remediation Schedule | Employee ID, current compa-ratio, target compa-ratio, adjustment amount, implementation date, cumulative cost; routed to CLO-Agent via IF-A1-14 |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Employee data |
| M2 | Mechanism | [MECH-LLM] LLM API | Claude — prioritization logic and schedule construction |

**Cross-Function:** **[CROSS-FUNCTION: A13 → A12]** *Interface: IF-A1-14* — Pay Equity Remediation Schedule sent to CLO-Agent for legal clearance before implementation.

**Definition of Done:** Remediation Schedule covers all employees identified in Pay Equity Analysis Report findings AND total remediation cost is within equity budget OR CFO-Agent approves overage in writing AND CLO-Agent returns legal clearance via IF-A1-14.

---

#### A133144: RIF Disparate Impact Analysis

**Agent Definition:** Given a proposed RIF population, compute the selection rate for each protected class within the affected population relative to the retained population; apply the EEOC 4/5ths rule and chi-square test; produce a Disparate Impact Analysis Report; assess WARN Act notice obligation; route both outputs to CLO-Agent before any RIF communications are made.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed RIF Population | List of role IDs and incumbents proposed for elimination — provided by Principal before any notifications |
| I2 | Input | Employee Demographics | From HRIS — gender, race/ethnicity, age (for ADEA) with consent |
| I3 | Input | Total Active Headcount | From HRIS — denominator for selection rate computation |
| C1 | Control | [TITLE7] Title VII | Disparate impact theory applies to facially neutral employment decisions; adverse impact triggers heightened scrutiny |
| C2 | Control | [ADEA] Age Discrimination in Employment Act | Age (≥40) is a protected class; must be analyzed separately even when not covered by Title VII analysis |
| C3 | Control | [WARN] WARN Act | 60-day advance notice required if RIF meets mass layoff threshold (≥50 employees at single site); compute headcount vs. threshold |
| C4 | Control | [MATH-STAT] Statistical Significance | Chi-square test at p < 0.05; supplement with EEOC 4/5ths rule (selection rate <80% of highest-selected group = adverse impact flag) |
| O1 | Output | Disparate Impact Analysis Report | Selection rate by protected class; 4/5ths ratio; chi-square p-value; adverse impact flags; recommended mitigation actions |
| O2 | Output | WARN Act Threshold Assessment | Affected headcount vs. WARN thresholds; notice obligation determination (required / not required / borderline); applicable notice deadline if required |
| M1 | Mechanism | [MECH-BI] Business Intelligence Platform | Chi-square test execution |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | Demographics and headcount data |

**Cross-Function:** **[CROSS-FUNCTION: A13 → A12]** *Interface: IF-A1-14* — Disparate Impact Analysis Report and WARN Assessment routed to CLO-Agent before any RIF communications.

**Definition of Done:** Selection rates are computed for all protected classes in the proposed RIF population AND chi-square test is run (pooling cells where n < 5) AND WARN threshold assessment is completed AND both outputs are delivered to CLO-Agent AND CLO-Agent acknowledges receipt before any RIF notification proceeds.

---

## A13315: Govern Compensation Framework (L5)

**Function:** Classify all grades for FLSA purposes, publish the approved compensation framework to authorized stakeholders, and configure the HRIS compensation data model
**Supreme Constraint:** [FLSA-EXEMPT] 29 CFR Part 541; [PAY-EQUITY-STATE] State pay transparency laws

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Salary Band Table | From A13313 — bands requiring FLSA classification and publication |
| I2 | Input | Leveling Matrix | From A13311 — duties criteria for FLSA test application |
| I3 | Input | Pay Equity Findings | From A13314 — must be resolved or scheduled before framework publication |
| C1 | Control | [FLSA-EXEMPT] FLSA Exemption Tests | Every grade must have a documented FLSA determination |
| C2 | Control | [PAY-EQUITY-STATE] State Pay Transparency Laws | CO, CA, NY, IL, WA require pay ranges on job postings |
| O1 | Output | Published Compensation Framework | Salary bands + FLSA classifications + offer ranges — distributed to authorized stakeholders |
| O2 | Output | Configured HRIS Compensation Module | Salary bands loaded; active employees have grade assignments; compa-ratio field auto-computes on salary change; audit log enabled — consumed by A1333 Payroll |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Configuration and storage |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | Google Workspace, Microsoft 365 |

**Child Nodes:** A133151, A133152, A133153

---

#### A133151: FLSA Exemption Classification

**Agent Definition:** For each grade in the Salary Band Table, apply the FLSA three-part exemption test (salary level test at $684/week current threshold, salary basis test, and applicable duties test); produce a binary exempt/non-exempt determination per grade with documented rationale; flag grades in the HCE range ($107,432/year) for HCE exemption review.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Salary Band Table | From A133132 — band minimums and midpoints by grade; salary level test applied to band minimum |
| I2 | Input | Leveling Matrix | From A133112 — duties criteria per grade for duties test application |
| C1 | Control | [FLSA-EXEMPT] FLSA Exemption Tests | 29 CFR Part 541; current salary level: $684/week; exemption categories: executive, administrative, professional, computer, HCE; duties test is fact-specific per job |
| C2 | Control | [FLSA-MW] FLSA Minimum Wage | Non-exempt grades: band minimum must be ≥ max(federal $7.25/hr, applicable state minimum) |
| O1 | Output | FLSA Classification Register | Grade → exempt/non-exempt determination; exemption category (if exempt); HCE flag; current salary level threshold applied; duties test rationale summary; effective date |
| M1 | Mechanism | [MECH-LLM] LLM API | Claude — duties test application against Leveling Matrix criteria |
| M2 | Mechanism | [MECH-HRIS] HRIS Platform | Storage of FLSA classification per grade |

**Definition of Done:** FLSA determination is produced for every grade AND every exempt determination documents the applicable duties test category AND any grade with band minimum below the salary level threshold ($684/week) is classified non-exempt without exception.

---

#### A133152: Compensation Framework Publication

**Agent Definition:** Package the approved Salary Band Table, FLSA Classification Register, and Market Percentile Targets into the Compensation Framework Document; distribute to authorized stakeholders; configure HRIS access controls to restrict salary band visibility to HR roles; post pay ranges to open job listings in pay-transparency jurisdictions; document succession compensation carve-out policy.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Salary Band Table | From A133132 — approved bands |
| I2 | Input | FLSA Classification Register | From A133151 — per-grade FLSA determinations |
| I3 | Input | Pay Equity Remediation Schedule | From A133143 — must be in-flight or resolved before framework is published |
| I4 | Input | Market Percentile Targets | From A133123 — market positioning policy |
| C1 | Control | [PAY-EQUITY-STATE] State Pay Transparency Laws | CO EPEWA §8-5-201: ranges required on job postings; CA SB 1162: employer must provide pay scale on request; NY Lab. §194-b: postings must include range |
| C2 | Control | [GDPR] / [CCPA] | Salary data is personal data; access must be role-restricted; employees have right of access to their own band range |
| O1 | Output | Compensation Framework Document | Salary bands (range only, not individual), FLSA classifications, offer range guidelines, percentile targets, succession compensation policy — access-controlled; distributed to HR, Legal, Finance, CRO-Agent |
| O2 | Output | Job Posting Pay Ranges | Jurisdiction-appropriate salary ranges for all open requisitions — fed to A132 Talent Acquisition via IF-A1-13 |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Access control configuration; band storage |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | Google Workspace — framework document distribution |

**Cross-Function:** **[CROSS-FUNCTION: A13 → A132]** *Interface: IF-A1-13* — Compensation Framework Document and Job Posting Pay Ranges delivered to Talent Acquisition.

**Succession Compensation Note:** Succession candidates (identified in A135) may warrant above-band compensation placements as retention instruments. These are documented as named exceptions in the Compensation Framework Document with Principal approval, not permanent band exceptions.

**Definition of Done:** Compensation Framework Document is distributed to all authorized stakeholders AND job postings in pay-transparency jurisdictions include the applicable salary range AND HRIS access controls are configured to restrict full band data to HR roles only.

---

#### A133153: HRIS Compensation Data Model Configuration

**Agent Definition:** Load all approved salary band records into the HRIS compensation module; map each active role to its grade in the HRIS job code fields; configure the compa-ratio field to auto-compute on any base salary change event; enable audit logging for all compensation record modifications.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Salary Band Table | From A133132 — min, midpoint, max per grade to load |
| I2 | Input | Role-Grade Mapping Table | From A133113 — grade assignment per role to load into HRIS job codes |
| I3 | Input | FLSA Classification Register | From A133151 — FLSA status per grade to configure in HRIS |
| C1 | Control | [OWASP-TOP10] OWASP Top 10 | Salary data is sensitive; HRIS configuration must enforce role-based access control; no salary fields accessible via unauthenticated API endpoint |
| C2 | Control | [GDPR] / [CCPA] | Salary records are personal data; audit log must be maintained for all changes; retention policy applies |
| O1 | Output | Configured HRIS Compensation Module | Salary bands loaded (min/midpoint/max per grade); all active employees have grade assignments; compa-ratio field auto-computes on salary change; FLSA status per grade stored; audit log enabled |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Workday HCM, BambooHR, ADP WFN — configuration target |
| M2 | Mechanism | [MECH-IAM] Identity & Access Management | Okta, AWS IAM — role-based access control for salary data |

**Definition of Done:** All salary bands are loaded in HRIS with min/midpoint/max values AND every active employee has a grade assignment in HRIS AND compa-ratio updates automatically on any base salary change event AND HRIS audit log is confirmed enabled for all compensation record changes.

---

## A13316: Merit Cycle Administration (L5)

**Function:** Construct the merit budget matrix, compute individual merit increases, and obtain Principal approval before HRIS implementation
**Supreme Constraint:** [MATH-COMPA] Compa-Ratio Formula; [IRC-162] Ordinary and Necessary Business Expenses; [TITLE7] Title VII

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Finance-Approved Merit Budget | % of payroll for merit cycle from Finance A11 |
| I2 | Input | 9-Box Performance Tier Distribution | Actual distribution of employees across 9-box tiers from A135 |
| I3 | Input | Compa-Ratio Register | From A13314 — current compa-ratios for all employees |
| C1 | Control | [MATH-COMPA] Compa-Ratio Formula | Matrix zones defined as: low (<85), target (85–115), high (>115) |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | Total merit cost must remain ordinary and necessary business expense |
| C3 | Control | [TITLE7] Title VII | Merit matrix must be applied consistently; post-factor adjustments may not selectively reduce protected class outcomes |
| O1 | Output | Approved Merit Increase Register | Individual merit increases approved by Principal; ready for A1333 Payroll implementation |
| M1 | Mechanism | [MECH-PERF] Performance Management Platform | Lattice, 15Five — 9-box tier data source |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Budget modeling and matrix validation |

**Child Nodes:** A133161, A133162, A133163

---

#### A133161: Merit Budget Matrix Construction

**Agent Definition:** Using the Finance-approved merit budget and the 9-box performance tier distribution, construct a merit matrix where each cell contains the merit increase % range for an employee at that compa-ratio zone (low/target/high) × performance tier (Low/Core/High/Top Performer); validate that the weighted average of the matrix applied to the current population is within ±0.1% of the approved budget.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Finance-Approved Merit Budget | % of total payroll authorized for merit increases; from Finance A11 via IF-A1-08 |
| I2 | Input | 9-Box Performance Tier Distribution | Percentage of employees in each of the 4 merit-relevant performance tiers; from A135 Performance Management |
| I3 | Input | Compa-Ratio Register | From A133141 — current compa-ratio distribution for budget validation |
| C1 | Control | [MATH-COMPA] Compa-Ratio Formula | Matrix zones: low (<85) = higher merit eligibility; target (85–115) = standard; high (>115) = reduced or zero |
| C2 | Control | [IRC-162] Ordinary and Necessary Business Expenses | Merit increases must be ordinary and necessary; out-of-band increases require documented rationale |
| O1 | Output | Merit Budget Matrix | Compa-ratio zone × performance tier → merit increase % (min/midpoint/max); weighted average cost = approved budget ±0.1% |
| M1 | Mechanism | [MECH-FPA] FP&A Platform | Budget modeling, weighted average validation |
| M2 | Mechanism | [MECH-PERF] Performance Management Platform | 9-box tier distribution data |

**Definition of Done:** Merit Matrix is produced with a cell for every compa-ratio zone × performance tier combination AND weighted average merit cost applied to the current population is within ±0.1% of the approved budget AND Principal and CFO-Agent approve the matrix in writing.

---

#### A133162: Individual Merit Increase Computation

**Agent Definition:** For each eligible employee (active, not on PIP, hire date > 90 days ago), look up compa-ratio zone and 9-box performance tier, retrieve the corresponding merit % from the Merit Budget Matrix, set the proposed increase at the midpoint of that range, cap at band maximum if the increase would cause compa-ratio to exceed 120, and output a Proposed Merit Increase Register.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Merit Budget Matrix | From A133161 — merit % range per compa-ratio zone × performance tier |
| I2 | Input | Compa-Ratio Register | From A133141 — current compa-ratio and salary for each employee |
| I3 | Input | Eligible Employee List | From HRIS — active employees, not on PIP, hire date > 90 days ago |
| C1 | Control | [MATH-COMPA] Compa-Ratio Formula | Post-increase compa-ratio must not exceed 120; if increase would cause >120, cap at band maximum |
| C2 | Control | [FLSA-OT] FLSA Overtime Rules | Non-exempt employees' salary increases may affect overtime rate; flag non-exempt increases for payroll implementation review |
| O1 | Output | Proposed Merit Increase Register | Employee ID, current salary, merit %, proposed new salary, resulting compa-ratio, band-maximum cap flag (Y/N); per-employee; total cost sum |
| M1 | Mechanism | [MECH-HRIS] HRIS Platform | Employee eligibility and salary data |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | Individual and aggregate computation |

**Definition of Done:** Every eligible employee has a proposed increase in the register AND no proposed new salary exceeds the band maximum AND total proposed merit cost is within ±0.5% of the approved merit budget.

---

#### A133163: Principal Merit Approval Gate

**Agent Definition:** Compile the Proposed Merit Increase Register, a budget summary (total cost, % of payroll, headcount affected), and any pay equity coordination flags into a structured approval package; route to Principal; halt HRIS implementation until binary approve/reject is received.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed Merit Increase Register | From A133162 — complete list of proposed increases |
| I2 | Input | Pay Equity Remediation Schedule | From A133143 — verify merit implementation is coordinated with equity adjustments; flag employees receiving both a merit increase and an equity adjustment |
| I3 | Input | Budget Summary | Total merit cost, % of total payroll, employee count, band-cap count |
| C1 | Control | [IRC-162] Ordinary and Necessary Business Expenses | All approved increases must remain ordinary and necessary |
| C2 | Control | [TITLE7] Title VII | Post-factor approval must not selectively reduce or deny increases based on protected class; any approval-stage modification to the register must be documented |
| O1 | Output | Approved Merit Increase Register | Principal's signed approval with implementation effective date, OR rejection with documented rationale; ready for submission to A1333 Payroll |
| M1 | Mechanism | Principal (William Aubrey) | **Human Approval Gate** — sole approval authority for merit implementation |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | DocuSign, Adobe Sign — approval documentation |

**Definition of Done:** Principal returns signed approval or rejection within SLA (48 business hours) AND approved register includes an implementation effective date AND all pay equity remediation adjustments are documented as coordinated with merit implementation.

---

## Node Status Summary

| Node | Name | Status |
|---|---|---|
| A1331 | Compensation Architecture | Complete |
| A13311 | Build Job Architecture | Complete |
| A13312 | Market Benchmarking | Complete |
| A13313 | Salary Band Construction | Complete |
| A13314 | Pay Equity Analysis | Complete |
| A13315 | Govern Compensation Framework | Complete |
| A13316 | Merit Cycle Administration | Complete |
| A133111 | Define Job Family Taxonomy | Complete — Leaf Node |
| A133112 | Define Leveling Framework | Complete — Leaf Node |
| A133113 | Map Roles to Grades | Complete — Leaf Node |
| A133121 | Survey Data Pull and Normalization | Complete — Leaf Node |
| A133122 | Benchmark Job Matching | Complete — Leaf Node |
| A133123 | Market Percentile Targeting | Complete — Leaf Node |
| A133131 | Band Midpoint Computation | Complete — Leaf Node |
| A133132 | Band Range Construction | Complete — Leaf Node |
| A133133 | Budget Constraint Validation | Complete — Leaf Node |
| A133141 | Compa-Ratio Computation | Complete — Leaf Node |
| A133142 | Pay Gap Statistical Analysis | Complete — Leaf Node |
| A133143 | Pay Equity Remediation Plan Construction | Complete — Leaf Node |
| A133144 | RIF Disparate Impact Analysis | Complete — Leaf Node |
| A133151 | FLSA Exemption Classification | Complete — Leaf Node |
| A133152 | Compensation Framework Publication | Complete — Leaf Node |
| A133153 | HRIS Compensation Data Model Configuration | Complete — Leaf Node |
| A133161 | Merit Budget Matrix Construction | Complete — Leaf Node |
| A133162 | Individual Merit Increase Computation | Complete — Leaf Node |
| A133163 | Principal Merit Approval Gate | Complete — Leaf Node |

*18 leaf nodes. 6 L5 phases. 1 domain sprint. Sprint date: 2026-03-12*
