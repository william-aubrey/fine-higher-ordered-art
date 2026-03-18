# Enterprise IDEF0 Model — Canonical Node Tree

*WRA/A-0 Master Node Tree*
*Author: WRA | Original diagrams: 2015-12-28 | Text encoding: 2026-03-09*
*Standard: FIPS PUB 183 | Viewpoint: The Principal | Purpose: see enterprise-viewpoint.md*

---

## How to Read This Document

Each node entry contains:
- **Function:** Active verb phrase (IDEF0 box name per standard §3.2.2.3)
- **ICOM Table:** Full Input / Control / Output / Mechanism specification
- **Internal Arrows:** Connections between child boxes on this diagram
- **Child Diagrams:** Reference to decompositions
- **Status:** `Complete` | `ICOM-Complete` | `Placeholder`

**Boundary arrow correspondence is enforced:** the union of child node outputs must equal the parent node output. ICOM codes (I1, C2, O3, M1) match position on the parent diagram, numbered left-to-right or top-to-bottom.

---

## Decomposition Status

| Node | Function | Skill File | Leaf Nodes | Sprint | Status |
|---|---|---|---|---|---|
| **A-0** | Enterprise | — | — | — | Complete |
| **A0** | Primary Functions | — | — | — | Complete |
| **A1** | Governance | — | — | — | Complete |
| A11 | Finance | — | — | — | Complete |
| A111 | Financial Planning & Analysis | skill-A111-fpa.md | 18 | SPR-005 | Complete |
| A112 | Accounting | skill-A112-accounting.md | 18 | SPR-006 | Complete |
| A113 | Tax | skill-A113-tax.md | 18 | SPR-007 | Complete |
| A114 | Treasury | skill-A114-treasury.md | 18 | SPR-008 | Complete |
| A115 | Cost Accounting | skill-A115-cost-accounting.md | 18 | SPR-009 | Complete |
| A116 | Audit | skill-A116-audit.md | 18 | SPR-010 | Complete |
| A12 | Legal | — | — | — | Complete |
| A121 | Entity Governance | skill-A121-entity-governance.md | 18 | SPR-014 | Complete |
| A122 | Contract Lifecycle | skill-A122-contract-lifecycle.md | 18 | SPR-015 | Complete |
| A123 | Regulatory Compliance | skill-A123-regulatory-compliance.md | 18 | SPR-016 | Complete |
| A124 | IP Portfolio | skill-A124-ip-portfolio.md | 18 | SPR-017 | Complete |
| A125 | Employment & Labor | skill-A125-employment-labor.md | 18 | SPR-018 | Complete |
| A126 | Litigation | skill-A126-litigation.md | 18 | SPR-019 | Complete |
| A13 | People | — | — | — | Complete |
| A131 | Workforce Planning | skill-A131-workforce-planning.md | 18 | SPR-020 | Complete |
| A132 | Talent Acquisition | skill-A132-talent-acquisition.md | 18 | SPR-021 | Complete |
| A133 | Total Rewards | — | — | — | Complete |
| A1331 | Compensation Architecture | skill-A1331-compensation-architecture.md | 18 | SPR-002 | Complete |
| A1332 | Benefits Administration | skill-A1332-benefits-administration.md | 18 | SPR-003 | Complete |
| A1333 | Payroll | skill-A1333-payroll.md | 18 | SPR-001 | Complete |
| A1334 | Equity & LTI Administration | skill-A1334-equity-lti-administration.md | 18 | SPR-004 | Complete |
| A134 | Learning & Development | skill-A134-learning-development.md | 18 | SPR-023 | Complete |
| A135 | Performance Management | skill-A135-performance-management.md | 18 | SPR-022 | Complete |
| A136 | Employee Relations | skill-A136-employee-relations.md | 18 | SPR-024 | Complete |
| A14 | Engineering | — | — | — | Complete |
| A141 | Technical Architecture Governance | skill-A141-technical-architecture-governance.md | 18 | SPR-025 | Complete |
| A142 | Software Platform | skill-A142-software-platform.md | 18 | SPR-026 | Complete |
| A143 | Data & Analytics Infrastructure | skill-A143-data-analytics-infrastructure.md | 18 | SPR-027 | Complete |
| A144 | Digital Asset Infrastructure | skill-A144-digital-asset-infrastructure.md | 18 | SPR-028 | Complete |
| A145 | Physical & Embedded Systems | skill-A145-physical-embedded-systems.md | 18 | SPR-029 | Complete |
| A146 | Production Systems Operations | skill-A146-production-systems-operations.md | 18 | SPR-030 | Complete |
| **A2** | Production | — | — | SPR-031 | ICOM-Complete |
| A21 | Receive Order | — | — | — | ICOM-Complete (instance-specific) |
| A22 | Produce Deliverable | — | — | — | ICOM-Complete (instance-specific) |
| A23 | Deliver to Customer | — | — | — | ICOM-Complete (instance-specific) |
| A24 | Support Customer | — | — | — | ICOM-Complete (instance-specific) |
| **A3** | Sales | — | — | — | Complete |
| A31 | Brand & Product Management | skill-A31-brand-product-management.md | 18 | SPR-011 | Complete |
| A32 | Marketing Channels | skill-A32-marketing-channels.md | 18 | SPR-012 | Complete |
| A33 | CRM | skill-A33-crm.md | 18 | SPR-013 | Complete |

**Totals:** 30 skill files | 540 leaf nodes | SPR-001–031 all complete
**A2 Production:** Universal ICOM template; leaf decomposition is instance-specific

---

## A-0: Enterprise (Context Diagram)

**Function:** Transform Capital into Customer Value and Returns to Capital

| Code | Role | Label |
|---|---|---|
| I1 | Input | Capital |
| C1 | Control | Government Regulation |
| C2 | Control | Community Standards |
| C3 | Control | Physics / Natural Law |
| O1 | Output | Happy Customers |
| O2 | Output | Returns to Capital |
| M1 | Mechanism | Principal(s) |
| M2 | Mechanism | Partners |
| M3 | Mechanism | Property |

**Child Diagram:** A0
**Status:** Complete

---

## A0: Primary Functions

**Parent:** A-0
**Boxes:** Governance (1) · Production (2) · Sales (3)

### Boundary Arrow Correspondence (A-0 → A0)

| A-0 Code | Routes To | Notes |
|---|---|---|
| I1 Capital | Governance A1 input | Capital enters Governance; Finance allocates downstream |
| C1 Government Regulation | Governance A1, Production A2, Sales A3 | Splits: direct to Legal (A12); tunneled to A2 and A3 |
| C2 Community Standards | Governance A1 | Absorbed by People (A13) and Legal (A12) |
| C3 Physics | Governance A1 → Engineering A14 | Tunneled through Governance to Engineering and Production |
| O1 Happy Customers | exits Sales A3 | |
| O2 Returns to Capital | exits Finance A11 via Governance A1 | |
| M1 Principal(s) | Governance A1 | Strategic direction authority |
| M2 Partners | Governance A1; tunneled to A2, A3 | Financing partners, advisors, vendors |
| M3 Property | Governance A1 → Engineering A14; tunneled to A2 | Assets under engineering stewardship |
| M4 Subject Matter Expert Guidance | All three boxes | Tunneled mechanism serving A1, A2, A3 |

### Internal Arrows (A0 diagram)

| # | From | To | Role at Destination | Label |
|---|---|---|---|---|
| 1 | Governance A1 | Production A2 | Control | Process Plans |
| 2 | Governance A1 | Production A2 | Control | Financing |
| 3 | Governance A1 | Production A2 | Control | Orders |
| 4 | Governance A1 | Production A2 | Mechanism | People, Property & Process |
| 5 | Governance A1 | Sales A3 | Control | Process Plans |
| 6 | Governance A1 | Sales A3 | Control | Financing |
| 7 | Governance A1 | Sales A3 | Mechanism | People, Property & Process |
| 8 | Production A2 | Sales A3 | Input | Products / Services |
| 9 | Sales A3 | Governance A1 | Input | Contracts, Revenue [feedback] |

**Child Diagrams:** A1, A2, A3
**Status:** Complete

---

## A1: Governance

**Parent:** A0 (box 1)
**Function:** Produce the rules, resources, and process designs that enable Production and Sales to operate within their governing constraints
**Boxes:** Finance (1) · Legal (2) · People (3) · Engineering (4)

### Boundary Arrow Correspondence (A0 → A1)

| A0 Code | Routes To in A1 | Notes |
|---|---|---|
| I1 Capital | Finance A11 | Raw capital input |
| I9 Contracts, Revenue [from Sales feedback] | Finance A11 | Revenue closes the loop into Finance |
| C1 Government Regulation | Legal A12 | Primary consumer of regulatory input |
| C2 Community Standards | People A13 | Cultural and social norms govern workforce |
| C3 Physics | Engineering A14 | Physical law constrains Engineering |
| M1 Principal(s) | Finance A11 | Strategic resource allocation authority |
| M2 Partners | Finance A11 | Financing partners |
| M3 Property | Engineering A14 | Asset stewardship |
| M4 SME Guidance | People A13, Engineering A14 | Tunneled expert input |
| O1 Process Plans | exits Engineering A14 | To Production A2, Sales A3 |
| O2 Financing | exits Finance A11 | To Production A2, Sales A3 |
| O3 Orders | exits Finance A11 | To Production A2 (demand authorization) |
| O4 People, Property & Process | exits People A13 + Engineering A14 | Mechanism bundle to A2, A3 |

### Internal Arrows (A1 diagram)

| # | From | To | Role at Destination | Label |
|---|---|---|---|---|
| 1 | Finance A11 | Legal A12 | Input | Matters [financial/contractual matters for legal review] |
| 2 | Finance A11 | Legal A12 | Input | Financing [instruments requiring legal structuring] |
| 3 | Legal A12 | Engineering A14 | Control | Rights, Rules, Regulations, Templates |
| 4 | Legal A12 | boundary O | Output | Rights, Rules, Regulations, Templates [→ A2, A3] |
| 5 | People A13 | Engineering A14 | Mechanism | People & Roles [human capacity deployed to Engineering] |
| 6 | People A13 | boundary O | Output | People & Roles [→ A2, A3] |
| 7 | Engineering A14 | boundary O | Output | Product / Process Plans [→ A2, A3] |
| 8 | Engineering A14 | Finance A11 | Input | Capital Requirements [feedback: investment needs] |
| 9 | Engineering A14 | People A13 | Input | Role Requirements [feedback: skill/headcount needs] |
| 10 | Finance A11 | People A13 | Control | Compensation Budget [headcount authorization] |

**Child Diagrams:** A11, A12, A13, A14
**Status:** Complete (internal arrows)

---

## A11: Finance

**Parent:** A1 (box 1)
**Function:** Transform Capital and Revenue into Financing allocations, Accounting records, and Returns to Capital under mathematical and regulatory constraint
**Supreme Constraint:** GAAP/IFRS mathematical axioms; IRC Tax Code; Fiduciary law; Sarbanes-Oxley (public cos.)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Capital [external investment, owner equity] |
| I2 | Input | Contracts, Revenue [from Sales A3 feedback] |
| I3 | Input | Capital Requirements [from Engineering A14] |
| C1 | Control | Government Regulation [tax law, SEC, SOX, GAAP/IFRS] |
| M1 | Mechanism | Principal(s) [fiduciary authority] |
| M2 | Mechanism | Partners [financing partners, auditors, tax advisors] |
| M3 | Mechanism | ERP / Accounting System (GL, AP, AR) |
| O1 | Output | Financing [→ Production A2, Sales A3, and within A1] |
| O2 | Output | Returns to Capital [→ A-0 boundary O2] |
| O3 | Output | Compensation Budget [→ People A13] |
| O4 | Output | Matters [→ Legal A12] |
| O5 | Output | Orders [demand authorization → Production A2] |

**Sub-functions:**
- A111: Plan and Forecast Enterprise Financial Performance
- A112: Record and Report Enterprise Financial Activity
- A113: Compute and File Enterprise Tax Obligations
- A114: Manage Cash, Liquidity, and Financial Risk
- A115: Analyze Product and Project Profitability
- A116: Test Controls and Produce Audit Evidence

**Child Diagrams:** A111, A112, A113, A114, A115, A116
**Status:** Complete — all 6 sub-functions decomposed to leaf level; 108 L5 leaf nodes across 6 registry files

---

## A111: Plan and Forecast Enterprise Financial Performance

**Parent:** A11 (box 1)
**Function:** Plan and Forecast Enterprise Financial Performance
**Supreme Constraint:** MATH-ZBB (Zero-Based Budget methodology); MATH-WACC (Capital allocation discount rate); MATH-BURN (Cash runway formula)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Contracts, Revenue [actuals from Sales A3 — for variance analysis] |
| I2 | Input | Capital Requirements [from Engineering A14 via IF-A1-06 — CapEx requests] |
| C1 | Control | MATH-ZBB [Zero-Based Budgeting — every cost item must be re-justified each cycle] |
| C2 | Control | MATH-WACC [Weighted Average Cost of Capital — discount rate for capital allocation models] |
| C3 | Control | MATH-BURN [Burn rate and runway formula — governs cash forecast horizon] |
| C4 | Control | GAAP-ASC230 [Cash flow statement classification — operating / investing / financing] |
| M1 | Mechanism | MECH-FPA (Anaplan, Adaptive Planning, Pigment, Mosaic) |
| M2 | Mechanism | MECH-ERP (NetSuite, SAP — actuals data source) |
| M3 | Mechanism | MECH-CFO (Chief Financial Officer) |
| O1 | Output | Annual Operating Plan [approved budget — internal control to A11 sub-functions; to Production A2 and Sales A3 via IF-A0-02] |
| O2 | Output | Rolling Forecast [13-week cash + 18-month financial — to Principal / Board] |
| O3 | Output | Budget-to-Actual Variance Report [monthly — to Principal / Board] |
| O4 | Output | Approved Capital Expenditure List [→ Engineering A14 via IF-A1-23] |

**Child Diagrams:** A1111–A1116 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A111-fpa.md`

---

## A112: Record and Report Enterprise Financial Activity

**Parent:** A11 (box 2)
**Function:** Record and Report Enterprise Financial Activity
**Supreme Constraint:** MATH-GAAP-AXIOMS (double-entry identity); GAAP-ASC606 (revenue recognition); GAAP-ASC842 (leases); GAAP-ASC810 (consolidation); SOX-302 (CEO/CFO certification); SEC-XBRL (iXBRL tagging)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Contracts, Revenue [executed contracts from Sales A3 — ASC 606 performance obligation schedules] |
| I2 | Input | Payroll Journal Entry [from People A13 via IF-A1-11 — period payroll accrual] |
| I3 | Input | Benefits Cost Accrual [from People A13 via IF-A1-17] |
| I4 | Input | Stock Compensation Expense [from People A13 via IF-A1-19 — ASC 718 period charge] |
| C1 | Control | MATH-GAAP-AXIOMS [Double-entry identity: every debit has a matching credit] |
| C2 | Control | GAAP-ASC606 [Revenue recognition — 5-step model; deferred revenue waterfall] |
| C3 | Control | GAAP-ASC842 [Lease accounting — ROU asset and lease liability] |
| C4 | Control | GAAP-ASC810 [Consolidation — intercompany elimination] |
| C5 | Control | SOX-302 [CEO/CFO certification of financial statements] |
| C6 | Control | SEC-XBRL [iXBRL inline tagging for SEC EDGAR submissions] |
| M1 | Mechanism | MECH-ERP (SAP S/4HANA, Oracle Financials, NetSuite) |
| M2 | Mechanism | MECH-XBRL (Workiva Wdesk, GoXBRL) |
| M3 | Mechanism | MECH-EDGAR (SEC EDGAR Electronic Submissions) |
| M4 | Mechanism | MECH-CFO (Chief Financial Officer) |
| O1 | Output | GAAP Financial Statements [Balance Sheet, P&L, Cash Flow Statement, Equity Statement — with CEO/CFO certification] |
| O2 | Output | SEC Financial Reports [10-K, 10-Q with iXBRL tagging — via MECH-EDGAR] |
| O3 | Output | Financial Statements for Legal Review [→ Legal A12 via IF-A1-24 — pre-filing review] |

**Child Diagrams:** A1121–A1126 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A112-accounting.md`

---

## A113: Compute and File Enterprise Tax Obligations

**Parent:** A11 (box 3)
**Function:** Compute and File Enterprise Tax Obligations
**Supreme Constraint:** GAAP-ASC740 (income tax accounting); IRC-482 (transfer pricing — arm's length); IRC-41 (R&D tax credit); OECD-TP (multinational transfer pricing guidelines)

| Code | Role | Label |
|---|---|---|
| I1 | Input | GAAP Financial Statements [pre-tax income for tax provision calculation — from A112] |
| I2 | Input | Intercompany Transaction Records [from A112 — for transfer pricing documentation] |
| C1 | Control | GAAP-ASC740 [Income tax accounting — current and deferred tax; valuation allowances] |
| C2 | Control | IRC-482 [Transfer pricing arm's length standard] |
| C3 | Control | OECD-TP [OECD Transfer Pricing Guidelines — supplementary to IRC §482] |
| C4 | Control | IRC-41 [R&D tax credit — qualified research activities and expenditures] |
| C5 | Control | IRC-162 [Ordinary and necessary business expense deductibility] |
| M1 | Mechanism | MECH-TAX (Thomson Reuters ONESOURCE, Vertex, Avalara, Drake Tax) |
| M2 | Mechanism | MECH-TP (Thomson Reuters ONESOURCE TP, BVD Bureau van Dijk, RoyaltyStat) |
| M3 | Mechanism | MECH-CFO (Chief Financial Officer) |
| O1 | Output | Tax Provision [current and deferred tax — posted to GAAP Financial Statements] |
| O2 | Output | Corporate Tax Returns [Form 1120, state returns — filed with taxing authorities] |
| O3 | Output | Transfer Pricing Documentation [IRC §482 contemporaneous documentation — audit-ready file] |
| O4 | Output | Tax-Efficient Structure Recommendation [→ Legal A12 for implementation] |

**Child Diagrams:** A1131–A1136 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A113-tax.md`

---

## A114: Manage Cash, Liquidity, and Financial Risk

**Parent:** A11 (box 4)
**Function:** Manage Cash, Liquidity, and Financial Risk
**Supreme Constraint:** MATH-BURN (cash runway); NACHA-ACH (cash movement); IFRS-9 (financial instrument measurement); IRC-482 (arm's length for intercompany cash pooling)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Bank Account Balances [real-time via MECH-BANK-API] |
| I2 | Input | Annual Operating Plan [cash requirements from A111] |
| I3 | Input | Financing Instruments [executed debt/credit facilities — from Legal A12] |
| C1 | Control | MATH-BURN [Burn rate / runway formula — governs minimum cash reserve policy] |
| C2 | Control | NACHA-ACH [ACH origination rules — governs intercompany cash sweeps] |
| C3 | Control | IFRS-9 [Financial instruments — FX exposure measurement and hedge accounting] |
| C4 | Control | IRC-482 [Arm's length standard for intercompany cash concentration transfers] |
| C5 | Control | GAAP-ASC820 [Fair value measurement — Level 1/2/3 for investments] |
| M1 | Mechanism | MECH-TMS (Kyriba, GTreasury, SAP Treasury) |
| M2 | Mechanism | MECH-BANK-API (Plaid, MX, direct bank APIs) |
| M3 | Mechanism | MECH-ACH (NACHA-compliant ACH origination gateway) |
| M4 | Mechanism | MECH-CFO (Chief Financial Officer) |
| O1 | Output | Daily Cash Position Report [→ Principal / Board] |
| O2 | Output | 13-Week Cash Forecast [→ Principal / Board] |
| O3 | Output | FX Hedge Trade Confirmations [→ counterparty banks] |
| O4 | Output | Treasury Risk Dashboard [burn rate, runway, covenant status, hedge effectiveness] |

**Child Diagrams:** A1141–A1146 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A114-treasury.md`

---

## A115: Analyze Product and Project Profitability

**Parent:** A11 (box 5)
**Function:** Analyze Product and Project Profitability
**Supreme Constraint:** MATH-GAAP-AXIOMS (cost allocation must be zero-balanced); GAAP-ASC606 (revenue recognition for margin computation); ISO-9001 (cost quality standards)

| Code | Role | Label |
|---|---|---|
| I1 | Input | GAAP Financial Statements [revenue and cost data — from A112] |
| I2 | Input | Job Cost Records [from Production A2 — actual labor and material costs by project] |
| I3 | Input | Activity Driver Data [transaction volumes, machine hours — from ERP] |
| C1 | Control | MATH-GAAP-AXIOMS [Cost allocation must be zero-balanced; total allocated cost = total incurred cost] |
| C2 | Control | GAAP-ASC606 [Revenue allocated to performance obligations governs margin calculation] |
| C3 | Control | MATH-NPV [Net present value — make-vs-buy and outsourcing decision models] |
| M1 | Mechanism | MECH-ERP (cost accounting module — job costing, ABC) |
| M2 | Mechanism | MECH-BI (Sigma, Tableau, Power BI — profitability dashboards) |
| M3 | Mechanism | MECH-FPA (Anaplan — cost center and margin modeling) |
| M4 | Mechanism | MECH-CFO (Chief Financial Officer) |
| O1 | Output | Product Line Profitability Report [gross margin by SKU/service line] |
| O2 | Output | Customer Profitability Report [lifetime value and margin by segment] |
| O3 | Output | Job-Cost Report [EAC vs. budget by project — to Production A2 project managers] |
| O4 | Output | Make-vs-Buy Decision Model [NPV recommendation — to Engineering A14 and COO] |

**Child Diagrams:** A1151–A1156 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A115-cost-accounting.md`

---

## A116: Test Controls and Produce Audit Evidence

**Parent:** A11 (box 6)
**Function:** Test Controls and Produce Audit Evidence
**Supreme Constraint:** COSO-ICFR (COSO Internal Control — Integrated Framework); PCAOB-AS2201 (SOX 404 audit standard); SEC-SOX (§302, §404); MATH-LDF (Loss Development Factors for actuarial reserves)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Financial Reporting Risk Register [from prior assessments and external auditor scoping] |
| I2 | Input | GAAP Financial Statements [draft — from A112, for external audit evidence package] |
| I3 | Input | Loss Run Data [historical claims by accident year — for actuarial triangle] |
| C1 | Control | COSO-ICFR [Five-component internal control framework — Control Environment, Risk Assessment, Control Activities, Information & Communication, Monitoring] |
| C2 | Control | PCAOB-AS2201 [AS 2201 — Auditing ICFR; design vs. operating effectiveness distinction] |
| C3 | Control | SEC-SOX [§302 CEO/CFO certification; §404 management assessment of ICFR] |
| C4 | Control | MATH-LDF [Loss Development Factors — chain-ladder actuarial projection] |
| C5 | Control | GAAP-ASC450 [Contingency reserve adequacy — probable and estimable threshold] |
| M1 | Mechanism | MECH-GRC (AuditBoard, Workiva, Galvanize) |
| M2 | Mechanism | MECH-ACTUARIAL (ResQ, Milliman Arius, ICRFS) |
| M3 | Mechanism | MECH-ERP (evidence source — GL transactions, system reports) |
| M4 | Mechanism | MECH-CFO (Chief Financial Officer) |
| O1 | Output | Risk-Control Matrix + SOX Testing Results [ICFR assessment — to external auditors and Principal] |
| O2 | Output | External Audit Evidence Package [PBC list + management representation letter] |
| O3 | Output | Internal Audit Reports [findings with risk ratings + remediation tracking register] |
| O4 | Output | Actuarial Loss Reserve Report [booked reserve vs. actuarial estimate — to Principal] |

**Child Diagrams:** A1161–A1166 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A116-audit.md`

---

## A12: Legal

**Parent:** A1 (box 2)
**Function:** Interpret governing law and regulation to produce rights, rules, templates, and compliance artifacts that define the enterprise's operating envelope
**Supreme Constraint:** Jurisdiction-specific statutory law; Regulatory agency rules (SEC, FTC, OSHA, EPA, GDPR, HIPAA, CCPA); Case law precedent

| Code | Role | Label |
|---|---|---|
| I1 | Input | Matters [financial/contractual/regulatory from Finance A11] |
| I2 | Input | Financing [instruments requiring legal structuring] |
| C1 | Control | Government Regulation [statutes, regulatory rules, case law] |
| M1 | Mechanism | Legal Counsel (in-house or outside) |
| M2 | Mechanism | Contract Lifecycle Management (CLM) Platform |
| M3 | Mechanism | Matter Management System |
| O1 | Output | Rights, Rules, Regulations, Templates [→ Engineering A14, Production A2, Sales A3] |
| O2 | Output | Legal Financing Structures [→ Finance A11] |

**Sub-functions:**
- A121: Maintain Corporate Records and Entity Governance
- A122: Manage Contract Lifecycle and Obligations
- A123: Execute Regulatory Compliance Program
- A124: Manage Intellectual Property Portfolio
- A125: Administer Employment and Labor Law Compliance
- A126: Manage Litigation and Dispute Resolution

**Child Diagrams:** A121, A122, A123, A124, A125, A126
**Status:** Complete — all 6 sub-functions decomposed to leaf level; 108 L5 leaf nodes across 6 registry files (SPR-014–019)

---

## A121: Maintain Corporate Records and Entity Governance

**Parent:** A12 (box 1)
**Function:** Maintain Corporate Records and Entity Governance
**Supreme Constraint:** [DEL-DGCL] 8 Del. C. §141–228 (board authority and corporate governance); [RULLCA] RULLCA §§407–410 (LLC manager authority); [ESIGN-ACT] E-Sign Act (electronic execution validity)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Matters [entity formation/governance matters from Finance A11] |
| C1 | Control | Government Regulation [state corporate statutes, secretary of state rules] |
| C2 | Control | DEL-DGCL [Delaware General Corporation Law §141–228 — board authority, quorum, voting] |
| C3 | Control | RULLCA [Revised Uniform LLC Act §§407–410 — manager authority and member consent] |
| M1 | Mechanism | MECH-ENTITY (CT Corporation, Cogency Global — registered agent and filing services) |
| M2 | Mechanism | MECH-ESIGN (DocuSign, Adobe Sign — electronic execution) |
| M3 | Mechanism | MECH-LEGAL-AI (Harvey, Ironclad AI, ContractPodAi) |
| O1 | Output | Corporate Records [minute book, resolutions, charter documents → archive] |
| O2 | Output | Regulatory Filings [annual reports, foreign qualifications → Secretary of State] |
| O3 | Output | Entity Governance Package [→ Finance A11 for structural/tax decisions] |

**Child Diagrams:** A1211–A1216 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A121-entity-governance.md` (SPR-014)

---

## A122: Manage Contract Lifecycle and Obligations

**Parent:** A12 (box 2)
**Function:** Manage Contract Lifecycle and Obligations
**Supreme Constraint:** [UCC-2] UCC Art. 2 §2-615 (force majeure — goods); [REST2-261] Restatement 2d Contracts §261 (force majeure — services); [ESIGN-ACT] E-Sign Act; [ISDA-MA] ISDA Master Agreement 2002 (derivative transactions)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Matters [contractual matters and financing instruments from Finance A11] |
| I2 | Input | Financing [instruments requiring legal structuring] |
| C1 | Control | Government Regulation [contract law, UCC, common law] |
| C2 | Control | UCC-2 [§2-615 force majeure for goods contracts] |
| C3 | Control | REST2-261 [Restatement 2d §261 — commercial impracticability for service contracts] |
| C4 | Control | ESIGN-ACT [electronic signature legal validity] |
| M1 | Mechanism | MECH-CLM (Ironclad, Concord, DocuSign CLM) |
| M2 | Mechanism | MECH-ESIGN (DocuSign, Adobe Sign) |
| M3 | Mechanism | MECH-LEGAL-AI (Harvey, ContractPodAi) |
| O1 | Output | Standard Contract Template Library [→ Sales A33 via IF-A1-25] |
| O2 | Output | Executed Contracts [signed and logged → CLM repository] |
| O3 | Output | Obligation Tracker [renewal/termination alerts → internal stakeholders] |
| O4 | Output | Force Majeure Notices [suspension documentation → counterparties] |

**Child Diagrams:** A1221–A1226 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A122-contract-lifecycle.md` (SPR-015)

---

## A123: Execute Regulatory Compliance Program

**Parent:** A12 (box 3)
**Function:** Execute Regulatory Compliance Program
**Supreme Constraint:** [GDPR-DPIA] GDPR Art. 35 (Data Protection Impact Assessment); [HSR-ACT] HSR Act 15 U.S.C. §18a (pre-merger notification thresholds); [OFAC-SDN] OFAC Sanctions List (counterparty screening); [FCPA] Foreign Corrupt Practices Act

| Code | Role | Label |
|---|---|---|
| I1 | Input | Matters [regulatory and compliance matters from Finance A11] |
| C1 | Control | Government Regulation [statutes, regulatory agency rules — SEC, FTC, OSHA, EPA, GDPR, HIPAA, CCPA] |
| C2 | Control | GDPR-DPIA [Art. 35 — mandatory DPIA trigger criteria; 8-section assessment format] |
| C3 | Control | HSR-ACT [§18a threshold calculation; 16 CFR Part 801 size-of-transaction and size-of-person tests] |
| C4 | Control | OFAC-SDN [Specially Designated Nationals list — real-time counterparty screening required] |
| M1 | Mechanism | MECH-GRC (OneTrust, TrustArc, Archer GRC — compliance program management) |
| M2 | Mechanism | MECH-LEGAL-AI (Harvey — regulatory change monitoring) |
| M3 | Mechanism | MECH-CLO (Chief Legal Officer) |
| O1 | Output | GDPR DPIA Report [8-section assessment; DPA prior consultation if residual risk high] |
| O2 | Output | HSR Pre-Merger Notification [Form C/S filed via FTC e-file; waiting period tracked] |
| O3 | Output | Compliance Operating Envelope [→ Engineering A14 via IF-A1-03] |
| O4 | Output | Counterparty Screening Clearances [OFAC/FCPA pass/refer records] |

**Child Diagrams:** A1231–A1236 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A123-regulatory-compliance.md` (SPR-016)

---

## A124: Manage Intellectual Property Portfolio

**Parent:** A12 (box 4)
**Function:** Manage Intellectual Property Portfolio
**Supreme Constraint:** [PCT] Patent Cooperation Treaty (international patent filing); [MADRID] WIPO Madrid Protocol (international trademark registration); [DMCA] 17 U.S.C. §512 (safe harbor); [DTSA] Defend Trade Secrets Act 18 U.S.C. §1836

| Code | Role | Label |
|---|---|---|
| I1 | Input | Matters [IP matters from Finance A11 and Engineering A14] |
| C1 | Control | Government Regulation [USPTO rules, WIPO treaties, copyright law, trade secret law] |
| C2 | Control | PCT [Patent Cooperation Treaty — international filing priority and national phase entry] |
| C3 | Control | MADRID [WIPO Madrid Protocol — international trademark registration system] |
| C4 | Control | DMCA [17 U.S.C. §512 — safe harbor notice-and-takedown procedure] |
| C5 | Control | DTSA [18 U.S.C. §1836 — trade secret misappropriation; reasonable measures standard] |
| M1 | Mechanism | MECH-IP-DOCKET (Anaqua, CPA Global, Dennemeyer — IP docketing and prosecution management) |
| M2 | Mechanism | MECH-IP-SEARCH (Google Patents, Derwent Innovation, USPTO TESS/Patent Center) |
| M3 | Mechanism | MECH-CLO (Chief Legal Officer) |
| O1 | Output | Patent Portfolio [granted patents, pending applications with prosecution docket] |
| O2 | Output | Trademark Portfolio [registered marks with renewal schedule] |
| O3 | Output | FTO Opinion [freedom-to-operate clearance → Engineering A14] |
| O4 | Output | IP Licensing Agreements [executed → Finance A11 for royalty accounting] |

**Child Diagrams:** A1241–A1246 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A124-ip-portfolio.md` (SPR-017)

---

## A125: Administer Employment and Labor Law Compliance

**Parent:** A12 (box 5)
**Function:** Administer Employment and Labor Law Compliance
**Supreme Constraint:** [WARN-ACT] 29 U.S.C. §2101 (mass layoff notice); [ADA] Americans with Disabilities Act (accommodation interactive process); [NLRA] National Labor Relations Act (concerted activity protection); [EEOC-PROC] EEOC charge procedure

| Code | Role | Label |
|---|---|---|
| I1 | Input | Matters [employment and labor matters from Finance A11 and People A13] |
| C1 | Control | Government Regulation [FLSA, ADA, NLRA, FMLA, WARN Act, Title VII, state employment law] |
| C2 | Control | WARN-ACT [29 U.S.C. §2101 — 60-day advance notice; employee count and triggering formulas] |
| C3 | Control | ADA [42 U.S.C. §12112 — accommodation interactive process; undue hardship analysis] |
| C4 | Control | NLRA [29 U.S.C. §157 — §7 rights; Stericycle (NLRB 2023) categorical policy analysis] |
| C5 | Control | EEOC-PROC [EEOC charge, mediation, and right-to-sue procedure] |
| M1 | Mechanism | MECH-HRIS (employment record system) |
| M2 | Mechanism | MECH-LEGAL-AI (Harvey — employment document drafting) |
| M3 | Mechanism | MECH-CLO (Chief Legal Officer) |
| O1 | Output | Employment Agreement and Handbook Templates [→ People A13 via IF-A1-26] |
| O2 | Output | WARN Act Notices [to employees, union, state agency, chief elected official] |
| O3 | Output | ADA Accommodation Determinations [documented interactive process records] |
| O4 | Output | Restrictive Covenant Agreements [NDAs, non-competes, non-solicits → employees] |

**Child Diagrams:** A1251–A1256 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A125-employment-labor.md` (SPR-018)

---

## A126: Manage Litigation and Dispute Resolution

**Parent:** A12 (box 6)
**Function:** Manage Litigation and Dispute Resolution
**Supreme Constraint:** [FRCP-26] Fed. R. Civ. P. Rule 26 (discovery obligations and litigation hold duty); [AAA-COMM] AAA Commercial Arbitration Rules (arbitration procedure); [ABA-1.6] Model Rules of Professional Conduct 1.6 (attorney-client privilege)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Matters [disputes and litigation matters from Finance A11] |
| C1 | Control | Government Regulation [federal and state procedural rules; court local rules] |
| C2 | Control | FRCP-26 [Rule 26(a)/(b)/(f) — discovery obligations; litigation hold triggered at reasonable anticipation] |
| C3 | Control | AAA-COMM [AAA Commercial Arbitration Rules — arbitrator selection, discovery, award] |
| C4 | Control | ABA-1.6 [Attorney-client privilege and confidentiality — governs all outside counsel communications] |
| M1 | Mechanism | MECH-LEGAL-HOLD (Exterro, ZDiscovery, Zapproved — litigation hold and eDiscovery platform) |
| M2 | Mechanism | MECH-MATTER (Clio, TeamConnect — matter management and outside counsel billing) |
| M3 | Mechanism | MECH-CLO (Chief Legal Officer) |
| O1 | Output | Legal Hold Notices [issued within 48 hrs; custodian list; forensic collection with hash verification] |
| O2 | Output | Outside Counsel Engagement Package [scope, budget, billing guidelines, reporting cadence] |
| O3 | Output | Dispute Resolution Record [mediation/arbitration outcomes; settlement payment schedule] |
| O4 | Output | Litigation Authorization Decision [APPROVE/REJECT by Principal — escalated via A1266] |

**Child Diagrams:** A1261–A1266 (6 L4 nodes → 18 L5 leaf nodes)
**Status:** Complete — `enterprise/registry/skill-A126-litigation.md` (SPR-019)

---

## A13: People

**Parent:** A1 (box 3)
**Function:** Acquire, develop, and deploy human capacity to produce People & Roles packages that enable Production and Sales to execute
**Supreme Constraint:** Labor law (FLSA, ADA, NLRA, FMLA, WARN Act); Organizational psychology; Cultural and social contracts

| Code | Role | Label |
|---|---|---|
| I1 | Input | Role Requirements [from Engineering A14 — skill/headcount needs] |
| C1 | Control | Community Standards [social/cultural norms governing workforce] |
| C2 | Control | Compensation Budget [from Finance A11 — headcount authorization] |
| C3 | Control | Rights, Rules, Regulations [from Legal A12 — employment law compliance] |
| M1 | Mechanism | Subject Matter Expert Guidance [HR advisors, organizational psychologists] |
| M2 | Mechanism | HRIS Platform |
| M3 | Mechanism | ATS (Applicant Tracking System) |
| M4 | Mechanism | Payroll Processor (e.g., ADP, Gusto, Paychex) |
| O1 | Output | People & Roles [→ Engineering A14, Production A2, Sales A3] |

**Sub-functions:**
- A131: Workforce Planning & Organizational Design — *ICOM-Complete; SPR-020 done; see `skill-A131-workforce-planning.md`*
- A132: Talent Acquisition — *ICOM-Complete; SPR-021 done; see `skill-A132-talent-acquisition.md`*
- A133: Compensation & Benefits — *ICOM decomposed below; A1333 Payroll is first sprint*
- A134: Learning & Development — *ICOM-Complete; SPR-023 done; see `skill-A134-learning-development.md`*
- A135: Performance Management — *ICOM-Complete; SPR-022 done; see `skill-A135-performance-management.md`*
- A136: Employee Relations & Culture — *ICOM-Complete; SPR-024 done; see `skill-A136-employee-relations.md`*

**Child Diagrams:** A131, A132, A133, A134, A135, A136

**Status:** **COMPLETE** — A131 ICOM-Complete (SPR-020); A132 ICOM-Complete (SPR-021); A133 ICOM complete (4 sub-sprints); A134 ICOM-Complete (SPR-023); A135 ICOM-Complete (SPR-022); A136 ICOM-Complete (SPR-024); all 6 sub-functions decomposed

---

## A133: Compensation & Benefits

**Parent:** A13 (box 3)
**Function:** Design, administer, and execute the total compensation and benefits programs that attract, retain, and fairly pay all employees
**Supreme Constraint:** FLSA; ERISA; IRC compensation and benefits rules (§§125, 401(a), 409A); State wage payment laws

| Code | Role | Label |
|---|---|---|
| I1 | Input | Role Requirements [compensation grade/benchmark data from Engineering A14 via A13] |
| I2 | Input | Employee Time & Attendance Data [hours worked, leave taken — from HRIS] |
| I3 | Input | Employee Benefit Elections [enrollment choices during onboarding/open enrollment] |
| I4 | Input | Board-Approved Grant Authorizations [equity grants — for A1334] |
| C1 | Control | Compensation Budget [from Finance A11 — headcount authorization and pay envelope] |
| C2 | Control | Rights, Rules, Regulations [from Legal A12 — wage/hour, benefits, securities law] |
| C3 | Control | Community Standards [social contract on fair pay; benefits market norms] |
| M1 | Mechanism | HRIS Platform [MECH-HRIS] |
| M2 | Mechanism | Payroll Processor (ADP, Gusto, Paychex) [MECH-PAYROLL] |
| M3 | Mechanism | Benefits Administration Platform |
| M4 | Mechanism | Equity Management Platform (Carta, Pulley) |
| O1 | Output | Compensation Framework [salary bands, grades → Talent Acquisition A132; Payroll A1333] |
| O2 | Output | Employee Net Pay [ACH deposits → employees via NACHA] |
| O3 | Output | Payroll Journal Entry [GL debit/credit pairs → Finance A11] |
| O4 | Output | Tax Filings & Deposits [941, 940, W-2, EFTPS → IRS/state agencies] |
| O5 | Output | Benefits Coverage [active health/dental/401k enrollments → employees] |
| O6 | Output | Stock Compensation Expense [ASC 718 entries → Finance A11] |

**Child Diagrams:** A1331, A1332, A1333, A1334
**Status:** ICOM complete — child nodes defined below

---

## A1331: Compensation Architecture

**Parent:** A133 (box 1)
**Function:** Design and maintain the job architecture, salary bands, and pay equity framework that governs all compensation decisions
**Supreme Constraint:** FLSA classification rules (exempt vs. non-exempt); State pay equity and transparency laws; IRC §162 (reasonable compensation)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Role Requirements [job profiles and leveling criteria from Engineering A14] |
| I2 | Input | Market Compensation Data [salary surveys and external benchmarks] |
| C1 | Control | Compensation Budget [from Finance A11] |
| C2 | Control | FLSA Classification Rules [exempt/non-exempt determination thresholds] |
| C3 | Control | State Pay Equity Laws [pay transparency, equal pay requirements by jurisdiction] |
| M1 | Mechanism | HRIS Platform [MECH-HRIS] |
| M2 | Mechanism | Compensation Management Software (Radford, Mercer, Levels.fyi) [MECH-COMP] |
| O1 | Output | Compensation Framework [salary bands, grades, offer ranges → Talent Acquisition A132; Payroll A1333] |
| O2 | Output | Compa-Ratio Analysis [pay equity report → Legal A12 compliance] |

**Child Nodes:** Leaf-level — decomposition via domain sprint A1331
**Status:** Placeholder — decomposition via domain sprint

---

## A1332: Benefits Administration

**Parent:** A133 (box 2)
**Function:** Design, procure, and administer employee benefits programs including health insurance, retirement plans, and ancillary benefits
**Supreme Constraint:** ERISA (plan governance, fiduciary duty); ACA employer mandate; IRC §125 (cafeteria plans); IRC §401(a) (retirement plan qualification); COBRA

| Code | Role | Label |
|---|---|---|
| I1 | Input | Employee Benefit Elections [enrollment forms and changes — onboarding and open enrollment] |
| I2 | Input | Benefits Invoices [carrier billing statements] |
| C1 | Control | Benefits Budget [from Finance A11 via Compensation Budget] |
| C2 | Control | ERISA [plan document requirements, fiduciary standards, 5500 filing] |
| C3 | Control | ACA Employer Mandate [minimum essential coverage, affordability rules] |
| C4 | Control | IRC §125 / §401(a) [pre-tax treatment qualification rules] |
| M1 | Mechanism | Benefits Administration Platform (Rippling, Gusto, Benefitfocus) |
| M2 | Mechanism | Insurance Carriers (health, dental, vision, life, disability) |
| M3 | Mechanism | 401(k) Plan Provider (Guideline, Fidelity, Vanguard) |
| O1 | Output | Benefits Coverage [active enrollments → employees] |
| O2 | Output | Pre-tax Deduction Schedule [health, FSA/HSA amounts → Payroll A1333] |
| O3 | Output | 401(k) Contribution File [deferral elections → Payroll A1333] |
| O4 | Output | Benefits Cost Accrual [employer cost → Finance A11 GL] |

**Child Nodes:** A13321–A13326 (6 L5 execution-phase sub-processes); each decomposes to L6 atomic skill nodes
**Status:** **Complete** → `enterprise/registry/skill-A1332-benefits-administration.md`

---

## A1333: Payroll Processing

**Parent:** A133 (box 3)
**Function:** Execute periodic pay runs by computing all earnings, withholdings, and deductions, disbursing net pay, and filing all required tax returns and deposits
**Supreme Constraint:** FLSA overtime rules [FLSA-OT]; IRC §§3101–3102, 3111, 3301, 3402 (FICA and federal withholding); NACHA ACH standards; IRS EFTPS; State wage payment laws

| Code | Role | Label |
|---|---|---|
| I1 | Input | Approved Time & Attendance Records [hours, OT, leave — from HRIS] |
| I2 | Input | Compensation Framework [pay rates and grades from A1331] |
| I3 | Input | Pre-tax Deduction Schedule [health, FSA, 401k amounts from A1332] |
| I4 | Input | Garnishment Orders [court-issued withholding orders] |
| C1 | Control | FLSA Overtime Rules [FLSA-OT — 1.5× for hours >40/week] |
| C2 | Control | Federal Withholding [IRC §3402 income tax; §§3101–3102 FICA employee; §3111 FICA employer; §3301 FUTA] |
| C3 | Control | Pre-tax Deduction Ordering [IRC §125 — sequence before withholding] |
| C4 | Control | Garnishment Limits [CCPA-GARNISH — maximum withholding caps] |
| C5 | Control | NACHA ACH File Standards [direct deposit format and timing rules] |
| C6 | Control | State Wage Payment Laws [withholding, pay frequency, final pay rules by jurisdiction] |
| M1 | Mechanism | Payroll Processor API (ADP, Gusto, Paychex) [MECH-PAYROLL] |
| M2 | Mechanism | HRIS Platform [MECH-HRIS] |
| M3 | Mechanism | IRS EFTPS [IRS-EFTPS] |
| M4 | Mechanism | GL / ERP System [MECH-ERP] |
| O1 | Output | Employee Net Pay [ACH deposit file → NACHA network → employees] |
| O2 | Output | Payroll Journal Entry [GL debit/credit pairs, zero-balanced → Finance A11] |
| O3 | Output | EFTPS Tax Deposit [federal income tax + FICA → IRS] |
| O4 | Output | Quarterly Form 941 [employer's federal tax return → IRS] |
| O5 | Output | Annual Form 940 / W-2 [FUTA return; wage statements → IRS/employees] |
| O6 | Output | State Tax Filings [income tax withholding + unemployment → state agencies] |

**Child Nodes:** A13331–A13336 (6 L5 execution-phase sub-processes); each decomposes to L6 atomic skill nodes
**Status:** **First domain sprint target** → `enterprise/registry/skill-A1333-payroll.md`

---

## A1334: Equity & Long-Term Incentive Administration

**Parent:** A133 (box 4)
**Function:** Administer equity grants, vesting schedules, and long-term incentive plans in compliance with securities and tax law
**Supreme Constraint:** IRC §409A (non-qualified deferred compensation timing and valuation); IRC §83 (property transferred in connection with services); SEC Rule 701 (private company exempt offering); ASC 718 (stock-based compensation expense recognition)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Board-Approved Grant Authorizations [cap table decisions — type, quantity, strike price] |
| I2 | Input | Employee Vesting Events [cliff, milestone, and time-based triggers from HRIS] |
| C1 | Control | IRC §409A [deferred compensation valuation and payment timing rules] |
| C2 | Control | IRC §83(b) [30-day election window for early exercise — forfeiture risk] |
| C3 | Control | SEC Rule 701 [private company exempt offering aggregate value limits] |
| C4 | Control | ASC 718 [grant-date fair value determination and expense recognition] |
| M1 | Mechanism | Cap Table / Equity Management Platform (Carta, Pulley) |
| M2 | Mechanism | 409A Valuation Provider (third-party independent appraisal) |
| O1 | Output | Equity Grant Agreements [signed award documents → employees] |
| O2 | Output | 409A Valuation Report [→ Legal A12; Finance A11 for ASC 718 inputs] |
| O3 | Output | Stock Compensation Expense [ASC 718 period expense → Finance A11 GL] |
| O4 | Output | Supplemental W-2 / 1099 Comp [NQSO spread, RSU FMV at vest → Payroll A1333 for tax withholding] |

**Child Nodes:** A13341–A13346 (6 L5 execution-phase sub-processes); each decomposes to L6 atomic skill nodes
**Status:** **Complete** → `enterprise/registry/skill-A1334-equity-lti-administration.md`

---

## A14: Engineering

**Parent:** A1 (box 4)
**Function:** Design and maintain the systems, processes, and technical capabilities that translate Rights/Rules and People/Resources into executable Product/Process Plans
**Supreme Constraint:** Laws of physics; CAP theorem; Computational complexity theory; IEEE/ISO standards; OSHA mechanical safety codes

| Code | Role | Label |
|---|---|---|
| I1 | Input | Capital Requirements feedback [to Finance A11] |
| I2 | Input | Role Requirements feedback [to People A13] |
| C1 | Control | Rights, Rules, Regulations, Templates [from Legal A12] |
| C2 | Control | Physics / Natural Law [from A-0 C3 — tunneled] |
| M1 | Mechanism | People & Roles [from People A13 — engineers, technicians] |
| M2 | Mechanism | Property [physical and digital assets] |
| M3 | Mechanism | Subject Matter Expert Guidance [external technical advisors] |
| M4 | Mechanism | Development Toolchain (IDE, CI/CD, SAST, SBOM) |
| O1 | Output | Product / Process Plans [→ Production A2, Sales A3] |
| O2 | Output | Capital Requirements [feedback → Finance A11] |
| O3 | Output | Role Requirements [feedback → People A13] |

**Sub-functions:**
- A141: Govern Technical Architecture and Standards
- A142: Build and Operate Core Software Platform
- A143: Build and Operate Data and Analytics Infrastructure
- A144: Build and Operate Digital Asset Infrastructure
- A145: Engineer Physical and Embedded Systems
- A146: Operate and Sustain All Production Systems

**Notes on scope:**
- A141 receives IF-A1-03 (Compliance Operating Envelope from Legal A123) and IF-A1-23 (Approved CapEx from Finance A111); produces Technical Architecture Standards governing all of A142–A146
- A143 must explicitly treat ontological engineering (data model design, entity relationship definitions, semantic layer design, knowledge graph construction) as a mandatory inclusion at sprint time — A143 is not merely data pipeline engineering; it implements the enterprise data ontology defined in `enterprise/data/`
- A144 is the resolution of "Digital Asset Banking as A14" — blockchain nodes, smart contracts, digital asset custody, tokenization; first client: TCC; consumed by A2 Production instances
- A145 covers both *product engineering* (designing the robot: mechanical, electrical, firmware, embedded AI) AND *manufacturing process engineering* (designing the facility and assembly line that produces it: layout, flow, lean methods, SPC). Both are governed by the same supreme constraint — Physics/Natural Law — and belong in the same IDEF0 box. When Ouborobo builds its first facility, the industrial engineering sub-processes are leaf nodes within A145; currently future-scope
- AI/ML systems: information-layer AI (inference APIs, model serving, training pipelines) belongs in A142; embedded/robotics AI (perception stacks, control loops, sensor fusion) belongs in A145
- Security engineering is a cross-cutting control that governs all of A141–A146, not a standalone sub-function

**Status:** ICOM-Complete — A141–A146 decomposed via SPR-025–030 (CAO-010); 6 skill files, 108 L5 leaf nodes; 4 new MECH codes (CAD, EDA, PROTO, TEST); all audited

---

## A2: Production

**Parent:** A0 (box 2)
**Function:** Execute value-creating processes under Governance direction to transform Inputs into Products / Services
**Supreme Constraint:** Resource scarcity; Theory of Constraints; ISO 9001 quality standards; industry-specific physical and regulatory constraints

| Code | Role | Label |
|---|---|---|
| I1 | Input | Orders [from Governance A1 — demand authorization] |
| I2 | Input | Raw Materials / Source Data [industry-specific primary inputs — physical goods, digital feeds, customer requests] |
| C1 | Control | Process Plans [from Governance A1 — Engineering A14 via IF-A1-05] |
| C2 | Control | Financing [from Governance A1 — Finance A11] |
| C3 | Control | Rights, Rules, Regulations [from Governance A1 — Legal A12, tunneled] |
| M1 | Mechanism | People, Property & Process [from Governance A1] |
| O1 | Output | Products / Services [→ Sales A3] |
| O2 | Output | Production Cost Records [→ Finance A11 via IF-A1-01 — job cost, material cost, labor cost] |

**Sub-functions (universal template):**
- A21: Acquire and Stage Production Resources
- A22: Execute Value-Creating Process
- A23: Verify Output Against Quality Specification
- A24: Package and Transfer Output to Sales

**Child Diagrams:** A21, A22, A23, A24

### Note on A2 Architecture

Production is the most industry-variable function in this model. The four sub-functions below are a **universal template** — every enterprise has some form of resource acquisition, process execution, quality verification, and output delivery. However, the specific inputs, outputs, mechanisms, and leaf-level decomposition vary entirely by industry.

**Instance override rule:** Enterprise instances (`instances/[entity]/model/instance-model.md`) may rename A21–A24 box labels, redefine their ICOM fields, and decompose to leaf level with industry-specific processes. The universal template here provides structural scaffolding; it is not prescriptive at the leaf level.

**Examples of A22 variation:**
- Software company → A22 is code execution / service delivery
- Trading card company → A22 is card content creation (see `instances/trading-card-co/`)
- Manufacturing → A22 is the assembly process
- Professional services → A22 is the engagement delivery
- Robotics → A22 is robot assembly and firmware integration

**No enterprise-level skill files are produced for A2.** Leaf-level decomposition and skill file generation happen at the instance level via instance domain sprints stored in `instances/[entity]/registry/`.

### Boundary Arrow Correspondence (A0 → A2)

| A0 Code | Routes To in A2 | Notes |
|---|---|---|
| I1 Orders (from A1) | A21 | Demand authorization triggers resource acquisition |
| I (external) Raw Materials / Source Data | A21 | Industry-specific primary inputs enter Resource Acquisition |
| C1 Process Plans (from A14) | A21, A22, A23 | Engineering specs govern resource specs, process execution, quality criteria |
| C2 Financing (from A11) | A21, A22 | Budget allocation for procurement and execution |
| C3 Rights, Rules, Regulations (from A12) | A22, A23 | Regulatory constraints govern process execution and quality |
| M1 People, Property & Process | A21, A22, A23, A24 | Workforce and tooling deployed across all four functions |
| O1 Products / Services | exits A24 | Finished output transferred to Sales A3 |
| O2 Production Cost Records | exits A22, A23 | Cost data flows back to Finance A11 |

### Internal Arrows (A2 diagram)

| # | From | To | Role at Destination | Label |
|---|---|---|---|---|
| 1 | A21 | A22 | Input | Staged Resources [procured materials, data, capacity ready for execution] |
| 2 | A22 | A23 | Input | Work Product [output of value-creating process — pre-QA] |
| 3 | A23 | A24 | Input | Verified Output [quality-approved product/service] |
| 4 | A23 | A22 | Control | Rework Directive [failed items returned for correction] |
| 5 | A21 | A23 | Input | Resource Quality Certificates [incoming inspection results — supplier certifications] |

**Status:** ICOM-Complete (universal template) — instance-specific leaf decomposition in `instances/[entity]/`

---

## A21: Acquire and Stage Production Resources

**Parent:** A2 (box 1)
**Function:** Acquire and Stage Production Resources
**Supreme Constraint:** [ISO-9001] Supplier quality management; [ISO-31000] Supply chain risk management; [TOC] Theory of Constraints (bottleneck at procurement halts all downstream)

| Code | Role | Label |
|---|---|---|
| I1 | Input | Orders [demand authorization — quantity, spec, timeline] |
| I2 | Input | Raw Materials / Source Data [external supplier deliveries, data feeds, sub-assemblies] |
| C1 | Control | Process Plans [from A14 — bill of materials, resource specifications, supplier qualification criteria] |
| C2 | Control | Financing [from A11 — procurement budget and purchase authority] |
| C3 | Control | [ISO-9001] Incoming Inspection Standard [quality acceptance criteria for received materials] |
| M1 | Mechanism | People, Property & Process [procurement staff, warehouse, receiving dock] |
| M2 | Mechanism | ERP / Procurement System [purchase orders, goods receipts, inventory management] |
| O1 | Output | Staged Resources [inspected, accepted materials/data/capacity — ready for A22] |
| O2 | Output | Resource Quality Certificates [incoming inspection pass/fail records — to A23] |
| O3 | Output | Purchase Orders and Supplier Records [→ Finance A11 for cost accounting] |

**Child Nodes:** Instance-specific — leaf decomposition via instance domain sprint
**Status:** ICOM-Complete (universal template)

---

## A22: Execute Value-Creating Process

**Parent:** A2 (box 2)
**Function:** Execute Value-Creating Process
**Supreme Constraint:** [ISO-9001] Process quality; [TOC] Throughput optimization; [LEAN] Waste elimination; industry-specific physical, regulatory, and technical constraints

| Code | Role | Label |
|---|---|---|
| I1 | Input | Staged Resources [from A21 — materials, data, capacity] |
| C1 | Control | Process Plans [from A14 — work instructions, process specifications, acceptance criteria] |
| C2 | Control | Rights, Rules, Regulations [from A12 — regulatory requirements governing production] |
| C3 | Control | Rework Directive [from A23 — items failing quality verification returned for correction] |
| M1 | Mechanism | People, Property & Process [production workforce, equipment, tooling] |
| M2 | Mechanism | Industry-Specific Production Systems [instance-defined: manufacturing line, software platform, service delivery tool] |
| O1 | Output | Work Product [completed but not yet quality-verified output — to A23] |
| O2 | Output | Production Cost Records [labor hours, material usage, overhead allocation — → Finance A11] |

**Child Nodes:** Instance-specific — this is the most variable node in the entire model; leaf decomposition via instance domain sprint
**Status:** ICOM-Complete (universal template)

**Instance examples:**
- TCC: A22 = "Create Card Content" (AI image generation, stats generation, metadata assembly)
- Ouborobo: A22 = "Assemble and Integrate Robot Systems" (mechanical + electrical + firmware)
- SaaS: A22 = "Develop and Deploy Software Features" (overlaps with A14 — instance must resolve boundary)

---

## A23: Verify Output Against Quality Specification

**Parent:** A2 (box 3)
**Function:** Verify Output Against Quality Specification
**Supreme Constraint:** [ISO-9001] Quality management system; [SIXSIGMA] Statistical process control; industry-specific quality standards

| Code | Role | Label |
|---|---|---|
| I1 | Input | Work Product [from A22 — completed output for inspection/testing] |
| I2 | Input | Resource Quality Certificates [from A21 — incoming material inspection records] |
| C1 | Control | Process Plans [from A14 — quality acceptance criteria, test procedures, tolerance specifications] |
| C2 | Control | [ISO-9001] Quality Management System [inspection procedures, nonconformance handling] |
| C3 | Control | [SIXSIGMA] Statistical Process Control [control charts, Cpk thresholds, sampling plans] |
| M1 | Mechanism | People, Property & Process [quality inspectors, test equipment, metrology] |
| M2 | Mechanism | Quality Management System [NCR tracking, CAPA, audit trail] |
| O1 | Output | Verified Output [quality-approved product/service — to A24] |
| O2 | Output | Rework Directive [items failing quality criteria — returned to A22 for correction] |
| O3 | Output | Quality Records [inspection results, test reports, NCR/CAPA records — retained per ISO-9001] |

**Child Nodes:** Instance-specific — leaf decomposition via instance domain sprint
**Status:** ICOM-Complete (universal template)

---

## A24: Package and Transfer Output to Sales

**Parent:** A2 (box 4)
**Function:** Package and Transfer Output to Sales
**Supreme Constraint:** [ISO-9001] Delivery conformance; industry-specific packaging, labeling, and logistics requirements

| Code | Role | Label |
|---|---|---|
| I1 | Input | Verified Output [from A23 — quality-approved product/service] |
| C1 | Control | Process Plans [from A14 — packaging specifications, labeling requirements, shipping standards] |
| C2 | Control | Rights, Rules, Regulations [from A12 — labeling law, export controls, customs] |
| M1 | Mechanism | People, Property & Process [packaging staff, logistics, warehouse] |
| M2 | Mechanism | Logistics / Fulfillment System [shipping, inventory, order management] |
| O1 | Output | Products / Services [finished, packaged, ready-to-sell output → Sales A3] |
| O2 | Output | Delivery Records [shipping confirmation, handoff documentation — → A33 CRM, Finance A11] |

**Child Nodes:** Instance-specific — leaf decomposition via instance domain sprint
**Status:** ICOM-Complete (universal template)

---

## A3: Sales

**Parent:** A0 (box 3)
**Function:** Identify prospective customers, communicate product value, convert prospects to contracted buyers, and retain customers to generate ongoing revenue
**Supreme Constraint:** Human attention and cognition limits; FTC advertising rules (16 CFR Part 255); CAN-SPAM Act (15 U.S.C. §7701); GDPR Art. 6 consent; Contract law
**Boxes:** Brand & Product Management (1) · Marketing Channels (2) · CRM (3)

### Boundary Arrow Correspondence (A0 → A3)

| A0 Code | Routes To in A3 | Notes |
|---|---|---|
| I8 Products / Services | CRM A33 | Available product for sale |
| C5 Process Plans | Brand & Product A31, Marketing A32, CRM A33 | Sales process designs |
| C6 Financing | Brand & Product A31 (pricing budget), Marketing A32 (marketing budget), CRM A33 (commission plan) | |
| C7 Rights, Rules, Regulations | Marketing A32, CRM A33 | Advertising law, contract templates |
| M7 People, Property & Process | All three boxes | Sales team, tools |
| O1 Happy Customers | exits CRM A33 | |
| O9 Contracts, Revenue | exits CRM A33 [feedback to A1] | |

### Internal Arrows (A3 diagram)

| # | From | To | Role at Destination | Label |
|---|---|---|---|---|
| 1 | Brand & Product Mgmt A31 | Marketing Channels A32 | Input | Product Offering |
| 2 | Brand & Product Mgmt A31 | Marketing Channels A32 | Control | Product Literature |
| 3 | Marketing Channels A32 | CRM A33 | Input | Leads |
| 4 | CRM A33 | boundary O | Output | Deals (Contracts, Revenue) |
| 5 | CRM A33 | boundary O | Output | Happy Customers |
| 6 | CRM A33 | Brand & Product Mgmt A31 | Input | Customer Feedback [feedback] |

**Child Diagrams:** A31, A32, A33
**Status:** Complete (internal arrows)

---

## A31: Brand & Product Management

**Parent:** A3 (box 1)
**Function:** Define and position the product offering by synthesizing market intelligence, customer feedback, and engineering capability into a coherent value proposition
**Supreme Constraint:** IP/trademark law (Lanham Act); Brand policy; Pricing authority from Finance A11

| Code | Role | Label |
|---|---|---|
| I1 | Input | Customer Feedback [from CRM A33 feedback loop] |
| I2 | Input | Market Intelligence [competitive data, analyst reports] |
| I3 | Input | Product Roadmap [from Engineering A14 via Process Plans] |
| C1 | Control | Style Guide / Brand Policy |
| C2 | Control | Pricing Policy [from Finance A11] |
| C3 | Control | IP Constraints [from Legal A12 — trademark, patent bounds] |
| O1 | Output | Product Offering [defined, positioned product] |
| O2 | Output | Product Literature [→ Marketing Channels A32] |
| M1 | Mechanism | Product Management Platform (e.g., Productboard, Jira, Linear) |
| M2 | Mechanism | Brand Design Tools (e.g., Figma, Canva) |
| M3 | Mechanism | LLM API [positioning analysis, content generation] |

**Status:** Complete — `enterprise/registry/skill-A31-brand-product-management.md` (18 L5 leaf nodes; SPR-011)

---

## A32: Marketing Channels

**Parent:** A3 (box 2)
**Function:** Distribute product messaging through defined channels to generate a qualified lead pipeline
**Supreme Constraint:** FTC advertising rules (16 CFR Part 255); CAN-SPAM Act (15 U.S.C. §7701); GDPR Art. 6 lawful basis; Platform-specific advertising policies

| Code | Role | Label |
|---|---|---|
| I1 | Input | Product Offering [from Brand & Product Mgmt A31] |
| I2 | Input | Product Literature [from Brand & Product Mgmt A31] |
| C1 | Control | Marketing Budget [from Finance A11 via Financing] |
| C2 | Control | Brand Guidelines [from Brand & Product Mgmt A31] |
| C3 | Control | FTC / CAN-SPAM / GDPR Rules [from Legal A12] |
| C4 | Control | Platform Ad Policies [external, tunneled] |
| O1 | Output | Leads [qualified contacts → CRM A33] |
| M1 | Mechanism | Website / CMS |
| M2 | Mechanism | Email Marketing Platform (e.g., Mailchimp) |
| M3 | Mechanism | Social Media Platforms |
| M4 | Mechanism | Advertising Platforms (e.g., Google Ads, LinkedIn Ads) |
| M5 | Mechanism | Conference / Event Management |
| M6 | Mechanism | Content Creation Tools / LLM API |

**Status:** Complete — `enterprise/registry/skill-A32-marketing-channels.md` (18 L5 leaf nodes; SPR-012)

---

## A33: Customer Relationship Management

**Parent:** A3 (box 3)
**Function:** Convert qualified leads into contracted customers and deliver post-sale success to generate renewal and expansion revenue
**Supreme Constraint:** Contract law (UCC Art. 2 for goods; common law for services); GDPR; Deal approval authority matrix from Finance A11

| Code | Role | Label |
|---|---|---|
| I1 | Input | Leads [from Marketing Channels A32] |
| I2 | Input | Contacts [existing customer / prospect database] |
| I3 | Input | Products / Services [from Production A2 — available inventory / delivery capacity] |
| C1 | Control | Sales Playbook / Process |
| C2 | Control | Deal Approval Thresholds [from Finance A11] |
| C3 | Control | Contract Templates [from Legal A12] |
| C4 | Control | Commission Plan [from Finance A11 / People A13] |
| O1 | Output | Deals (Contracts, Revenue) [→ Finance A11 via Governance feedback] |
| O2 | Output | Happy Customers [→ A-0 boundary O1] |
| O3 | Output | Customer Feedback [feedback → Brand & Product Mgmt A31] |
| M1 | Mechanism | CRM Platform (e.g., HubSpot, Salesforce) |
| M2 | Mechanism | Accounting System (e.g., Quickbooks) |
| M3 | Mechanism | Email / Calendar (e.g., Gmail) |
| M4 | Mechanism | CPQ System (Configure-Price-Quote) |
| M5 | Mechanism | Phone / Video Conferencing |

**Status:** Complete — `enterprise/registry/skill-A33-crm.md` (18 L5 leaf nodes; SPR-013)

---

## Decomposition Status Summary

| Node | Name | Boxes | Status |
|---|---|---|---|
| A-0 | Enterprise (context) | 1 | Complete |
| A0 | Primary Functions | 3 | Complete |
| A1 | Governance | 4 | Complete (internal arrows) |
| A11 | Finance | 6 | **Complete** — all 6 sub-functions decomposed; 108 L5 leaf nodes across 6 registry files |
| A111 | Plan and Forecast Enterprise Financial Performance | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A111-fpa.md` |
| A112 | Record and Report Enterprise Financial Activity | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A112-accounting.md` |
| A113 | Compute and File Enterprise Tax Obligations | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A113-tax.md` |
| A114 | Manage Cash, Liquidity, and Financial Risk | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A114-treasury.md` |
| A115 | Analyze Product and Project Profitability | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A115-cost-accounting.md` |
| A116 | Test Controls and Produce Audit Evidence | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A116-audit.md` |
| A12 | Legal | 6 | **Complete** — all 6 sub-functions decomposed; 108 L5 leaf nodes across 6 registry files (SPR-014–019) |
| A121 | Maintain Corporate Records and Entity Governance | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A121-entity-governance.md` |
| A122 | Manage Contract Lifecycle and Obligations | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A122-contract-lifecycle.md` |
| A123 | Execute Regulatory Compliance Program | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A123-regulatory-compliance.md` |
| A124 | Manage Intellectual Property Portfolio | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A124-ip-portfolio.md` |
| A125 | Administer Employment and Labor Law Compliance | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A125-employment-labor.md` |
| A126 | Manage Litigation and Dispute Resolution | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A126-litigation.md` |
| A13 | People | 6 | **Complete** — all 6 sub-functions decomposed; A131 (18), A132 (18), A133 (72), A134 (18), A135 (18), A136 (18) = 162 leaf nodes |
| A136 | Employee Relations & Culture | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A136-employee-relations.md` (SPR-024) |
| A133 | Compensation & Benefits | 4 | ICOM complete — child nodes defined |
| A1331 | Compensation Architecture | 6 L5 phases → 18 L6 leaf nodes | **Complete** — `skill-A1331-compensation-architecture.md` |
| A1332 | Benefits Administration | 6 L5 phases → 18 L6 leaf nodes | **Complete** — `skill-A1332-benefits-administration.md` |
| A1333 | Payroll Processing | 5 L5 phases → 18 L6 leaf nodes | **Complete** — `skill-A1333-payroll.md` |
| A1334 | Equity & LTI Administration | 6 L5 phases → 18 L6 leaf nodes | **Complete** — `skill-A1334-equity-lti-administration.md` |
| A14 | Engineering | 6 | **Complete** — all 6 sub-functions decomposed; 108 L5 leaf nodes across 6 registry files (SPR-025–030) |
| A141 | Govern Technical Architecture and Standards | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A141-technical-architecture-governance.md` |
| A142 | Build and Operate Core Software Platform | 3 L4 → 18 L5 leaf nodes | **Complete** — `skill-A142-software-platform.md` |
| A143 | Build and Operate Data and Analytics Infrastructure | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A143-data-analytics-infrastructure.md` |
| A144 | Build and Operate Digital Asset Infrastructure | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A144-digital-asset-infrastructure.md` |
| A145 | Engineer Physical and Embedded Systems | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A145-physical-embedded-systems.md` |
| A146 | Operate and Sustain All Production Systems | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A146-production-systems-operations.md` |
| A2 | Production | 4 | **ICOM-Complete** (universal template) — leaf decomposition is instance-specific |
| A21 | Acquire and Stage Production Resources | Instance-specific | ICOM-Complete (universal template) |
| A22 | Execute Value-Creating Process | Instance-specific | ICOM-Complete (universal template) |
| A23 | Verify Output Against Quality Specification | Instance-specific | ICOM-Complete (universal template) |
| A24 | Package and Transfer Output to Sales | Instance-specific | ICOM-Complete (universal template) |
| A3 | Sales | 3 | **Complete** — all 3 sub-functions decomposed; 54 L5 leaf nodes across 3 registry files |
| A31 | Brand & Product Management | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A31-brand-product-management.md` |
| A32 | Marketing Channels | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A32-marketing-channels.md` |
| A33 | CRM | 6 L4 → 18 L5 leaf nodes | **Complete** — `skill-A33-crm.md` |

*Leaf-node skill definitions: 540 (A11: 108 + A12: 108 + A13: 162 + A14: 108 + A3: 54)*
*Registry: 30 files complete; A1 Governance COMPLETE (486 nodes); A3 Sales COMPLETE (54 nodes); A2 Production ICOM-Complete (universal template — leaf nodes at instance level)*
*Enterprise model: ALL functions ICOM-Complete. Leaf decomposition remaining only at A2 instance level.*
