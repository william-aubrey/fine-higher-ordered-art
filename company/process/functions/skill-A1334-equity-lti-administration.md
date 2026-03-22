# Skill File: Equity & Long-Term Incentive Administration

**Node:** A1334
**Parent:** A133 Compensation & Benefits → A13 People → A1 Governance
**Function:** Administer Equity Grants, Vesting Schedules, and Long-Term Incentive Plans in Compliance with Securities and Tax Law
**Supreme Constraint:** IRC §409A (non-qualified deferred compensation valuation and timing); IRC §83 / IRC §83(b) (property transferred in connection with services); SEC Rule 701 (private company exempt offering); ASC 718 (stock-based compensation expense recognition); IRC §422 (ISO qualification and holding periods)
**Cross-Function Interfaces:** IF-A1-18 (409A Valuation Report → Legal A12 + Finance A11), IF-A1-19 (Stock Compensation Expense → Finance A11), IF-A1-20 (Equity Tax Supplemental Payroll → Payroll A1333)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] IRC §409A valuation requirement and exercise price compliance → A133421, A133422, A133423, A133463
- [x] IRC §83(b) election notification obligation → A133412
- [x] SEC Rule 701 exempt offering aggregate monitoring → A133462
- [x] ASC 718 grant-date fair value and period expense recognition → A133441, A133442, A133443
- [x] ISO qualification rules, holding periods, and AMT → A133432, A133453
- [x] Form 3921 ISO exercise information reporting → A133453

---

## A1334: Equity & Long-Term Incentive Administration (L4 — Full ICOM)

**Function:** Administer equity grants, vesting schedules, and long-term incentive plans in compliance with securities and tax law
**Supreme Constraint:** [IRC-409A] non-qualified deferred compensation; [IRC-83B] property transfer election; [SEC-RULE701] exempt offering; [GAAP-ASC718] expense recognition; [IRC-422] ISO qualification

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Board-Approved Grant Authorizations | Cap table decisions — grant type (ISO/NQSO/RSA/RSU/SAR), quantity, exercise price, grantee |
| I2 | Input | Employee Vesting Events | Cliff, milestone, and time-based vesting triggers from MECH-HRIS and MECH-EQUITY schedule |
| C1 | Control | IRC §409A | [IRC-409A] Non-qualified deferred compensation timing and valuation; exercise price must equal or exceed FMV |
| C2 | Control | IRC §83(b) | [IRC-83B] 30-day election window from property transfer date for restricted stock |
| C3 | Control | SEC Rule 701 | [SEC-RULE701] Private company exempt offering aggregate value limits |
| C4 | Control | ASC 718 | [GAAP-ASC718] Grant-date fair value determination and expense recognition over service period |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] Carta, Pulley, Shareworks |
| M2 | Mechanism | 409A Valuation Provider | Third-party independent appraiser (Andersen, Aranca, Scalar Analytics) |
| O1 | Output | Equity Grant Agreements | Signed award documents → employees |
| O2 | Output | 409A Valuation Report | FMV determination → Legal A12 (securities compliance) + Finance A11 (ASC 718 inputs) — IF-A1-18 |
| O3 | Output | Stock Compensation Expense | ASC 718 period expense GL entry → Finance A11 — IF-A1-19 |
| O4 | Output | Equity Tax Supplemental Payroll | NQSO spread / RSU FMV at vest → Payroll A1333 for withholding — IF-A1-20 |
| O5 | Output | Equity Governance Reports | SEC Rule 701 Compliance Report → Legal A12 — IF-A1-22; Annual Equity Audit Report → Principal |

**Child Nodes:** A13341, A13342, A13343, A13344, A13345, A13346

---

## Boundary Arrow Correspondence (A1334 → Child Phases)

| A1334 Output | Produced By | Phase |
|---|---|---|
| O1 Equity Grant Agreements | A13341.O1 (executed grant agreements) | Issue and Document Equity Grants |
| O2 409A Valuation Report | A13342.O2 (adopted 409A report) | Obtain and Apply 409A Valuation |
| O3 Stock Compensation Expense | A13344.O3 (GL journal entry) | Recognize ASC 718 Stock Compensation Expense |
| O4 Equity Tax Supplemental Payroll | A13345.O2 (supplemental payroll transmission) | Process Equity Tax Events and Withholding |
| O5 Equity Governance Reports | A13346.O2 + O3 (Rule 701 compliance report + annual equity audit report) | Maintain Cap Table and Monitor SEC Compliance |

---

## A13341: Issue and Document Equity Grants (L5 Phase 1)

**Function:** Process board grant authorizations, execute grant agreements, notify IRC §83(b) election rights, and load vesting schedules into the cap table platform
**Supreme Constraint:** [IRC-409A] exercise price must equal or exceed FMV; [IRC-83B] §83(b) election notification for restricted stock; [SEC-RULE701] aggregate issuance tracking

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Board Grant Authorization | Board resolution: grantee, award type, quantity, proposed exercise price, grant date |
| I2 | Input | Current 409A FMV | Most recent adopted 409A valuation FMV per share — from A13342 |
| C1 | Control | IRC §409A | [IRC-409A] Exercise price for options must equal or exceed FMV at grant date; any shortfall creates prohibited deferred compensation |
| C2 | Control | IRC §83(b) Election | [IRC-83B] For restricted stock awards, grantee must be notified of the 30-day §83(b) election window; employer must receive a copy of any filed election |
| C3 | Control | SEC Rule 701 | [SEC-RULE701] Rolling 12-month aggregate value must be tracked; additional disclosure obligations if aggregate >$5M |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] Carta, Pulley |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] Google Workspace / Microsoft 365 — grant agreement templates and execution |
| O1 | Output | Executed Grant Agreements | Signed award documents for each grantee; stored in MECH-EQUITY |
| O2 | Output | Updated Cap Table with Vesting Schedules | New grants loaded in MECH-EQUITY; pool balance reduced; vesting schedules configured |

**Child Nodes:** A133411, A133412, A133413

---

#### A133411: Process Board Grant Authorization

**Agent Definition:** Receive board grant resolution, verify sufficient shares remain in the equity plan pool, validate the proposed exercise price equals or exceeds the most recent adopted 409A FMV, update the rolling SEC Rule 701 aggregate value tracker, and create the pending grant record in MECH-EQUITY.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Board Grant Resolution | Grantee name and employee ID; award type (ISO / NQSO / RSA / RSU); quantity of shares; proposed exercise price (options) or purchase price (RSA); grant date |
| I2 | Input | Equity Plan Pool Balance | Current authorized, issued, and available-for-grant share counts from MECH-EQUITY |
| I3 | Input | Current 409A FMV | Most recent adopted FMV per common share from MECH-EQUITY 409A record |
| C1 | Control | IRC §409A | [IRC-409A] Exercise price must equal or exceed adopted 409A FMV at grant date; if proposed price < FMV, grant cannot be issued as-is without triggering §409A penalties |
| C2 | Control | SEC Rule 701 | [SEC-RULE701] Rolling 12-month aggregate value of all equity securities issued must be tracked; flag if updated aggregate approaches $5M threshold |
| O1 | Output | Authorized Grant Record | Grant ID; grantee; award type; quantity; exercise price; grant date; pool balance after deduction; Rule 701 rolling aggregate updated — all recorded in MECH-EQUITY |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] Carta, Pulley — grant record creation and pool management |

**Definition of Done:** Grant record created in MECH-EQUITY with exercise price ≥ the adopted 409A FMV on the grant date AND equity pool balance in MECH-EQUITY reflects the grant deduction AND SEC Rule 701 rolling 12-month aggregate value is updated.

---

#### A133412: Generate and Execute Grant Agreements

**Agent Definition:** Draft the grant agreement for each authorized award using plan-approved templates, deliver the agreement to the grantee for execution, and — for restricted stock awards (RSAs) — deliver written notice of the IRC §83(b) election window within 5 business days of the grant date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Authorized Grant Record | Grant ID; grantee; award type; quantity; exercise price; grant date; vesting terms from A133411 |
| C1 | Control | IRC §83(b) Election Window | [IRC-83B] For RSAs: 30-day election window runs from grant date (date of property transfer per IRC §83); employer must notify grantee of the election right; employer must receive a copy of any election filed with the IRS |
| C2 | Control | IRC §409A | [IRC-409A] Grant agreement for options must not permit exercise at below-FMV price; must not allow deferral of exercise proceeds |
| C3 | Control | IRC §422 ISO Requirements | [IRC-422] ISO grant agreements must specify: exercise price ≥ FMV at grant; option term ≤10 years (≤5 years for >10% shareholders); grant under board-approved plan; grantee must be employee at grant date |
| O1 | Output | Executed Grant Agreement | Signed award document per grantee stored in MECH-EQUITY; grantee signature received |
| O2 | Output | IRC §83(b) Election Window Notice | Written notice to RSA grantee of the 30-day election right; delivery confirmation recorded |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — grant agreement generation and execution tracking |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign, Adobe Sign — grant agreement execution |

**Definition of Done:** Signed grant agreement stored in MECH-EQUITY for each grantee AND — for RSA grants only — written §83(b) election notice delivered to grantee within 5 business days of grant date with delivery confirmation AND all ISO grant agreements meet IRC §422 content requirements.

---

#### A133413: Configure Vesting Schedule in Cap Table Platform

**Agent Definition:** Load the complete vesting schedule for each new grant into MECH-EQUITY, including cliff date, periodic vesting dates, and any performance or acceleration conditions, then run a validation test confirming the schedule produces the correct vested share count at each trigger date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed Grant Agreement | Vesting terms: cliff period, vesting frequency, performance conditions, single/double trigger acceleration provisions |
| C1 | Control | IRC §409A | [IRC-409A] Vesting schedule for RSUs must not create an impermissible deferred compensation arrangement; RSU settlement must occur within 2.5 months of the year vesting occurs to maintain §409A exemption |
| C2 | Control | GAAP-ASC718 | [GAAP-ASC718] Service period for expense amortization is the requisite service period, typically the vesting period; performance conditions affect probability-weighted expense |
| O1 | Output | Configured Vesting Schedule Record | Grant ID; cliff date; periodic vesting dates and share counts; acceleration conditions; performance metric thresholds (if applicable) — loaded and validated in MECH-EQUITY |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — vesting schedule configuration and validation |

**Definition of Done:** Vesting schedule in MECH-EQUITY matches executed grant agreement terms exactly AND automated test vesting event for each vesting tranche returns the correct share count AND MECH-EQUITY raises no configuration errors.

---

## A13342: Obtain and Apply 409A Valuation (L5 Phase 2)

**Function:** Commission an independent 409A valuation, adopt the FMV determination via board resolution, and apply the FMV to all new grants to ensure IRC §409A exercise price compliance
**Supreme Constraint:** [IRC-409A] qualified independent appraiser requirement for safe harbor; 12-month validity window; material event triggers revaluation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Financial Data Package | Cap structure, revenue, projections, recent transactions, comparables required by appraiser |
| I2 | Input | Prior 409A Report | Last adopted FMV and valuation date (to determine if revaluation is required) |
| C1 | Control | IRC §409A | [IRC-409A] FMV must be determined by a qualified independent appraiser using a reasonable valuation method; valuation is valid for 12 months absent a material event (new financing round, M&A activity, material change in business); using a qualified appraiser creates a presumption of reasonableness (IRS safe harbor) |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — FMV record storage and application |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] — valuation report storage and board resolution |
| O1 | Output | Third-Party 409A Valuation Report | FMV per common share; valuation methodology; effective date; appraiser credentials |
| O2 | Output | Board-Adopted 409A Report + FMV Applied to MECH-EQUITY | Adoption resolution signed; FMV loaded into MECH-EQUITY for new grants; IF-A1-18 delivered |

**Child Nodes:** A133421, A133422, A133423

---

#### A133421: Commission 409A Valuation

**Agent Definition:** Determine whether the current 409A valuation remains valid (within 12 months and no material event), and if revaluation is required, engage a qualified independent appraiser, deliver the financial data package, and obtain a signed engagement letter confirming scope and delivery timeline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Prior 409A Report and Valuation Date | Last FMV per common share; effective date; any material events since valuation date |
| I2 | Input | Current Cap Structure and Financials | Capitalization table; recent revenue and growth data; any term sheets or financing events; comparable transaction data |
| C1 | Control | IRC §409A Revaluation Trigger | [IRC-409A] Revaluation required if: (a) prior valuation >12 months old, OR (b) material event has occurred (new financing, M&A activity, significant change in financial condition, issuance of equity to a third party at a new price) |
| O1 | Output | Signed Engagement Letter + Delivered Financial Data Package | Appraiser engagement confirmed; scope defined; delivery date agreed; financial data transmitted to appraiser |
| M1 | Mechanism | Document Collaboration | [MECH-DOC] — engagement letter execution and financial data package |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] — engagement letter execution |

**Definition of Done:** If current valuation is still valid (within 12 months, no material event) — documented determination recorded in MECH-EQUITY and process ends here. If revaluation required — signed engagement letter stored in MECH-DOC AND financial data package transmitted to appraiser AND scheduled delivery date confirmed in writing.

---

#### A133422: Review and Adopt 409A Valuation Report

**Agent Definition:** Review the third-party 409A valuation report for completeness and methodology compliance with IRC §409A safe harbor standards, present the report to the board for adoption via board resolution, store the adopted report, and transmit it to Legal A12 and Finance A11 per IF-A1-18.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Third-Party 409A Valuation Report | FMV per common share; valuation methodology (income, market, asset approach); appraiser credentials; effective date |
| C1 | Control | IRC §409A Qualified Appraiser Standard | [IRC-409A] 26 CFR §1.409A-1(b)(5)(iv)(B) — qualified independent appraiser must have significant knowledge, experience, education, or training in performing valuation of the relevant type of business; must be independent from the company; report must document all relevant factors |
| O1 | Output | Board-Adopted 409A Valuation Report | Adoption board resolution; signed report stored in MECH-DOC; FMV effective date and per-share amount confirmed |
| O2 | Output | IF-A1-18 Transmission to Legal A12 and Finance A11 | 409A report and adoption resolution transmitted per IF-A1-18 |
| M1 | Mechanism | Document Collaboration | [MECH-DOC] — report storage |
| M2 | Mechanism | Legal AI | [MECH-LEGAL-AI] Anthropic Claude API — methodology review and compliance check |

**Definition of Done:** Board adoption resolution signed AND 409A report stored in MECH-DOC AND IF-A1-18 transmission to Legal A12 and Finance A11 acknowledged by both consuming functions.

**[CROSS-FUNCTION: A1334 → A12 and A11]** *Interface: IF-A1-18*

---

#### A133423: Apply 409A FMV to Pending Grants

**Agent Definition:** Update MECH-EQUITY with the newly adopted FMV as the controlling exercise price floor for all new grants, verify all pending but un-issued grant authorizations have exercise prices at or above the adopted FMV, and escalate to the Principal any grant with an exercise price below FMV for repricing before issuance.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Adopted 409A FMV | Current FMV per common share from A133422 |
| I2 | Input | Pending Grant Authorizations | All board-approved grants not yet issued — exercise prices as proposed |
| C1 | Control | IRC §409A Exercise Price Floor | [IRC-409A] Any option with an exercise price below FMV at grant date is treated as non-qualified deferred compensation subject to §409A; grantee faces 20% excise tax + income tax + underpayment interest on any discount |
| O1 | Output | Updated Grant Authorizations | Exercise prices confirmed ≥ adopted FMV; any repricing escalations resolved before grant issuance |
| O2 | Output | 409A FMV Record in MECH-EQUITY | Current FMV per share and effective date loaded as controlling floor for new grants |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — FMV record update |

**Definition of Done:** MECH-EQUITY FMV record updated with adopted 409A FMV and effective date AND all pending grant authorizations in MECH-EQUITY have exercise prices ≥ adopted FMV AND zero grants issued with exercise prices below current FMV.

---

## A13343: Track and Process Vesting and Exercise Events (L5 Phase 3)

**Function:** Monitor vesting schedules, trigger vesting notifications, process option exercise transactions, and settle RSU and performance award vesting events
**Supreme Constraint:** [IRC-422] ISO holding period and qualification requirements; [IRC-83B] tax event at vesting absent §83(b) election; [IRC-409A] RSU settlement timing

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Vesting Schedule Records | Configured vesting schedules from MECH-EQUITY; upcoming vesting events calendar |
| I2 | Input | Exercise Notices | Grantee-submitted option exercise forms (grant ID, quantity, method: cash / net exercise / same-day sale) |
| I3 | Input | Performance Metric Certification | Board or compensation committee certification of performance condition achievement (for PSUs) |
| C1 | Control | IRC §422 ISO Requirements | [IRC-422] ISO holding period: shares must be held ≥1 year from exercise AND ≥2 years from grant date for capital gain treatment; disqualifying disposition triggers ordinary income; $100K annual ISO vesting limit |
| C2 | Control | IRC §409A RSU Settlement | [IRC-409A] RSU settlement must occur within 2.5 months after close of the year in which vesting occurs to qualify for §409A exemption |
| C3 | Control | IRC §83 | [IRC-83B] Restricted stock vests (absent §83(b) election): FMV at vesting date is ordinary income; taxable event created at each vesting tranche |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — employment status verification (grantees must be employees for ISO qualification) |
| O1 | Output | Vesting Event Records | Updated vested share records in MECH-EQUITY; grantee notifications |
| O2 | Output | Option Exercise Records | Share issuance or net settlement records; exercise price proceeds |
| O3 | Output | RSU/PSU Settlement Records | Settlement shares delivered or cash paid; FMV on settlement date recorded |

**Child Nodes:** A133431, A133432, A133433

---

#### A133431: Monitor and Notify Vesting Events

**Agent Definition:** Scan MECH-EQUITY vesting schedules daily to identify vesting events due in the current period, confirm grantee is still an active employee (for ISO/NQSO) or meets plan continuation terms, update MECH-EQUITY vested share records, and deliver vesting notifications to grantees within 1 business day of the vesting date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | MECH-EQUITY Vesting Schedule | All scheduled vesting events for the current period; grant ID; grantee; shares vesting; vesting date |
| I2 | Input | Active Employee Status | Current employment status from MECH-HRIS — distinguishes continued vesting vs. termination-triggered acceleration or forfeiture |
| C1 | Control | IRC §422 ISO Employment Requirement | [IRC-422] ISO vesting and exercise rights require active employment; options may continue for 3 months post-termination (without cause) before losing ISO status |
| C2 | Control | IRC §83 Property Transfer | [IRC-83B] For restricted stock absent §83(b) election: each vesting tranche is a separate taxable event; FMV at vesting is ordinary income; triggers equity tax event in A13345 |
| O1 | Output | Vesting Event Notification | Per-grantee notification of shares vested; updated vested balance in MECH-EQUITY; ISO holding period start date recorded |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — vesting trigger and record update |
| M2 | Mechanism | Transactional Email API | [MECH-EMAIL-API] — vesting notification delivery |

**Definition of Done:** All scheduled vesting events for the period are marked vested in MECH-EQUITY AND grantee notifications delivered within 1 business day of vesting date AND any ISO vesting event records include the grant date and vesting date (for ISO holding period tracking) AND any terminated grantee's post-termination option window is set per plan terms.

---

#### A133432: Process Stock Option Exercise Transactions

**Agent Definition:** Receive option exercise notice from grantee, verify the option is vested and within its exercise window, confirm the grantee's employment status for ISO qualification, process payment of the exercise price via the elected exercise method, issue shares (or net settle), and record the ISO or NQSO classification for tax reporting.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Option Exercise Notice | Grantee ID; grant ID; quantity to exercise; exercise method (cash / net exercise / same-day sale / cashless); exercise date |
| I2 | Input | Current FMV per Share | Most recent 409A FMV or, for same-day sale, transaction price — for spread calculation and ISO disqualifying disposition monitoring |
| C1 | Control | IRC §422 ISO Qualification | [IRC-422] At exercise: (a) grantee must be employee or within 3-month post-termination window; (b) exercise price paid in full; (c) option not disqualified by exceeding $100K annual ISO vesting limit; ISO exercise does not trigger regular income tax but creates AMT preference item equal to (FMV − exercise price) × shares |
| C2 | Control | IRC §409A | [IRC-409A] NQSO exercise with same-day sale or net exercise must not be structured as a deferral of the option spread beyond the exercise date |
| O1 | Output | Option Exercise Record | Shares issued or net-settled; exercise price proceeds received; ISO/NQSO classification; spread amount; ISO holding period start date (for ISOs); all recorded in MECH-EQUITY |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — exercise processing |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — employment status verification at exercise date |

**Definition of Done:** Exercise record created in MECH-EQUITY with correct ISO/NQSO classification AND exercise price payment confirmed AND shares issued (or net settlement completed) AND ISO holding period start date recorded for each ISO exercise AND spread amount calculated and transmitted to A13345 for tax withholding processing.

---

#### A133433: Settle RSU and Performance Award Vesting

**Agent Definition:** Process RSU vesting settlements (deliver shares or pay cash equivalent at FMV), verify performance metric achievement before settling PSU awards, execute share withholding or sell-to-cover for tax obligations, and record the FMV on the settlement date for income and tax reporting.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | RSU/PSU Vesting Event Record | Grant ID; grantee; shares vesting; vesting date; settlement method (shares / cash / share withholding / sell-to-cover) |
| I2 | Input | Performance Metric Certification (PSUs only) | Board/committee resolution certifying achievement percentage for performance-vesting awards |
| C1 | Control | IRC §409A RSU Settlement Timing | [IRC-409A] RSU settlement must occur within the short-term deferral period: 2.5 months after the close of the calendar year in which vesting occurs; settlement beyond this window converts the RSU to non-qualified deferred compensation |
| C2 | Control | GAAP-ASC718 | [GAAP-ASC718] For PSUs: expense recognized based on probability-weighted achievement; if performance condition not met, cumulative expense reversal required |
| O1 | Output | RSU/PSU Settlement Record | Shares delivered or cash paid; FMV per share on settlement date; gross income amount (FMV × shares settled); share withholding or sell-to-cover shares executed; all recorded in MECH-EQUITY |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — RSU/PSU settlement processing |

**Definition of Done:** Settlement completed within the 2.5-month §409A safe harbor window after the vesting date AND FMV on settlement date recorded in MECH-EQUITY AND shares delivered (or cash paid) to grantee confirmed AND gross income amount transmitted to A13345 for tax withholding processing.

---

## A13344: Recognize ASC 718 Stock Compensation Expense (L5 Phase 4)

**Function:** Determine grant-date fair value, compute period stock compensation expense over the vesting period, and prepare zero-balanced GL journal entries for Finance A11
**Supreme Constraint:** [GAAP-ASC718] grant-date measurement, service period amortization; [GAAP-ASC820] fair value hierarchy; [MATH-GAAP-AXIOMS] zero-balanced entries

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | New Grant Data | Grant type, exercise price, grant date, vesting schedule, expected term — from MECH-EQUITY |
| I2 | Input | 409A Valuation Report | Current FMV per common share — basis for fair value model inputs |
| I3 | Input | Finance Period Close Calendar | GL account codes, cost center codes, period close deadline |
| C1 | Control | GAAP-ASC718 | [GAAP-ASC718] Grant-date fair value measurement; options: Black-Scholes or lattice model; forfeitures recognized as incurred (post-ASU 2016-09); graded vs. straight-line amortization policy election |
| C2 | Control | GAAP-ASC820 | [GAAP-ASC820] Fair value hierarchy; private company may use simplified method for expected term |
| C3 | Control | MATH-GAAP-AXIOMS | [MATH-GAAP-AXIOMS] All journal entries must be zero-balanced |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — ASC 718 expense reporting module |
| M2 | Mechanism | FP&A Platform | [MECH-FPA] Anaplan, Adaptive Planning — expense modeling and cost center allocation |
| M3 | Mechanism | ERP / General Ledger | [MECH-ERP-GL] NetSuite, SAP — GL journal entry posting |
| O1 | Output | Grant-Date Fair Value Record | Per-grant fair value per unit; model inputs documented |
| O2 | Output | Period Stock Compensation Expense | Total expense by cost center and grant type for the accounting period |
| O3 | Output | Stock Compensation Journal Entry | Zero-balanced GL entry → Finance A11 — IF-A1-19 |

**Child Nodes:** A133441, A133442, A133443

---

#### A133441: Determine Grant-Date Fair Value

**Agent Definition:** Apply a Black-Scholes option pricing model (or lattice model for complex vesting structures) to each new equity grant, document all model inputs per ASC 718 requirements, and record the grant-date fair value per unit in MECH-EQUITY.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Grant Parameters | Grant type; exercise price; grant date; contractual term; expected vesting period; dividend yield; for ISOs: annual vesting limit check |
| I2 | Input | Valuation Inputs | Risk-free rate (corresponding US Treasury rate for expected term); expected volatility (peer group historical volatility for private companies); expected term (simplified method: (vesting period + contractual term) / 2, per SEC Staff Accounting Bulletin Topic 14D) |
| C1 | Control | GAAP-ASC718 Fair Value Model | [GAAP-ASC718] ASC 718-10-55 — Black-Scholes acceptable for plain-vanilla options; lattice model required for complex path-dependent vesting; RSAs and RSUs measured at grant-date stock price (FMV per 409A); all assumptions must be documented and supportable |
| C2 | Control | GAAP-ASC820 | [GAAP-ASC820] For private companies, simplified method for expected term is a Level 3 input; must be consistently applied |
| O1 | Output | Grant-Date Fair Value Record | Per-grant: fair value per unit (per option or per share); model type used; all input values (rate, volatility, term, dividend yield); calculation date — stored in MECH-EQUITY |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — ASC 718 fair value calculation module |
| M2 | Mechanism | FP&A Platform | [MECH-FPA] — model input tracking and sensitivity analysis |

**Definition of Done:** Grant-date fair value per unit calculated and stored in MECH-EQUITY for every new grant AND all model inputs documented with data sources AND the fair value calculation is reproducible from the documented inputs.

---

#### A133442: Compute Period Stock Compensation Expense

**Agent Definition:** For all active grants, compute the stock compensation expense to be recognized in the current accounting period by amortizing each grant's total fair value over its requisite service period, apply forfeiture adjustments for terminated grantees, and allocate the period expense to cost centers matching the grantees' departments.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Active Grant Portfolio | All active grants: grant-date fair value per unit; requisite service period; amortization start date; elapsed vesting percentage; forfeiture events since last period |
| I2 | Input | Forfeiture Events | Terminated grantees with unvested awards — generates expense reversal equal to unrecognized portion |
| C1 | Control | GAAP-ASC718 Amortization | [GAAP-ASC718] Straight-line amortization over requisite service period for awards with only service conditions; graded amortization available if each tranche treated as separate award; for performance conditions, recognize expense based on probability of achievement; cumulative expense reversal required if performance condition not achieved |
| O1 | Output | Period Stock Compensation Expense | Total expense by cost center (debit: Stock Compensation Expense by department); total contra-equity offset (credit: Additional Paid-in Capital); forfeiture adjustments itemized |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — ASC 718 period expense calculation |
| M2 | Mechanism | FP&A Platform | [MECH-FPA] — cost center allocation and expense reporting |

**Definition of Done:** Period expense calculated for all active grants AND cumulative recognized expense for each grant does not exceed the grant's total compensation cost (grant-date fair value × vested units) AND forfeiture adjustments applied for all terminations in the period AND total expense agrees to prior-period cumulative balance plus current-period service cost.

---

#### A133443: Prepare Stock Compensation Journal Entry

**Agent Definition:** Prepare the period stock compensation expense journal entry debiting Stock Compensation Expense by cost center and crediting Additional Paid-in Capital, verify zero balance, and transmit to Finance A11 before the period close deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Period Stock Compensation Expense | Expense amounts by cost center and award type from A133442 |
| I2 | Input | Finance Period Close Calendar | GL account codes for Stock Compensation Expense and Additional Paid-in Capital; cost center codes; period close deadline |
| C1 | Control | MATH-GAAP-AXIOMS | [MATH-GAAP-AXIOMS] Zero-balanced entry: debit (Stock Compensation Expense by cost center) must equal credit (Additional Paid-in Capital) to $0.00 variance |
| C2 | Control | GAAP-ASC718 | [GAAP-ASC718] Equity-classified awards credit APIC; liability-classified awards (cash-settled SARs) credit a liability account and require remeasurement each period |
| O1 | Output | Stock Compensation Journal Entry | Journal entry ID; period; debit lines (Stock Compensation Expense by cost center); credit line (Additional Paid-in Capital); zero-balanced; transmitted to Finance A11 — IF-A1-19 |
| M1 | Mechanism | ERP / General Ledger | [MECH-ERP-GL] NetSuite, SAP — journal entry posting |
| M2 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — expense export |

**Definition of Done:** Journal entry is zero-balanced (debit total = credit total to $0.00 variance) AND all GL account and cost center codes resolve in Finance A11 chart of accounts AND entry posted in MECH-ERP-GL before Finance period close deadline AND Finance A11 acknowledges receipt.

**[CROSS-FUNCTION: A1334 → A11]** *Interface: IF-A1-19*

---

## A13345: Process Equity Tax Events and Withholding (L5 Phase 5)

**Function:** Compute taxable income from equity events, generate supplemental payroll entries for withholding, and prepare annual equity tax information returns
**Supreme Constraint:** [IRC-422] disqualifying disposition triggers; [IRC-61] NQSO spread is ordinary income; [IRC-3402] supplemental withholding; [FORM-3921] ISO reporting obligation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Equity Event Records | NQSO exercise records; RSU vest/settlement records; RSA vesting events; ISO exercise records |
| I2 | Input | FMV on Event Date | 409A FMV per share on each event date — basis for spread and income calculations |
| C1 | Control | IRC §422 ISO Tax Treatment | [IRC-422] ISO exercise: no regular income tax (but AMT preference item = spread); disqualifying disposition (sale within 1 year of exercise or 2 years of grant) → ordinary income on spread + capital gain/loss on remainder |
| C2 | Control | IRC §61 / IRC-3402 | [IRC-61] NQSO spread (FMV − exercise price) is ordinary income at exercise; [IRC-3402] supplemental withholding rate 22% for supplemental wages ≤$1M aggregate in calendar year; 37% for excess |
| C3 | Control | FORM-3921 | [FORM-3921] IRC §6039 — Form 3921 required for each ISO exercise; employee copy January 31; IRS filing March 31 (electronic) |
| M1 | Mechanism | Payroll Processor API | [MECH-PAYROLL] ADP, Gusto — supplemental payroll import |
| M2 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — equity event data source |
| O1 | Output | Equity Tax Event Records | Per-event: taxable income amount; federal and state withholding; FICA treatment; ISO/NQSO classification |
| O2 | Output | Equity Tax Supplemental Payroll Transmission | Supplemental payroll entry → Payroll A1333 — IF-A1-20 |
| O3 | Output | Annual Equity Tax Returns | Filed Forms 3921 (ISO exercises); W-2 Box 12 Code V entries (NQSO spread) |

**Child Nodes:** A133451, A133452, A133453

---

#### A133451: Compute Equity Income and Required Withholding

**Agent Definition:** For every equity event in the period (NQSO exercise, RSU/RSA vesting, ISO disqualifying disposition), compute the amount of ordinary income recognized, determine federal and state withholding amounts using the supplemental rate, and classify each event for FICA treatment.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Equity Event Records | Event type; grantee ID; grant type (ISO/NQSO/RSA/RSU); quantity; exercise price (if applicable); event date; from MECH-EQUITY |
| I2 | Input | FMV on Event Date | Per-share FMV on the event date (409A FMV or, if public or same-day sale, transaction price) |
| C1 | Control | IRC §61 Ordinary Income | [IRC-61] Ordinary income at event: NQSO exercise = (FMV − exercise price) × shares; RSU vest = FMV × shares settled; RSA vest without §83(b) = (FMV at vest − cost paid) × shares; ISO disqualifying disposition = (FMV at exercise − exercise price) × shares |
| C2 | Control | IRC §3402 Supplemental Withholding | [IRC-3402] Supplemental wage withholding: flat 22% federal rate on amounts ≤$1M aggregate supplemental wages in calendar year; 37% on excess; FICA (IRC §3101/§3111) applies to NQSO spread and RSU/RSA vest income but NOT to ISO exercise (neither regular nor AMT) |
| O1 | Output | Equity Tax Event Record | Per event: grantee ID; event type; taxable income amount; federal income tax withholding; state income tax withholding (by jurisdiction); Social Security withholding (if applicable); Medicare withholding; FICA exempt flag (for ISO exercises) |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — event data |
| M2 | Mechanism | HRIS Platform | [MECH-HRIS] — state of employment for jurisdiction-specific withholding |

**Definition of Done:** Equity Tax Event Record computed for every equity event in the period AND each record correctly classifies ISO exercise as FICA-exempt AND withholding amounts use the current supplemental rate (not aggregate method unless documented policy election) AND records are available for A133452 transmission.

---

#### A133452: Generate Equity Tax Supplemental Payroll Transmission

**Agent Definition:** Convert equity tax event records into a supplemental payroll file, transmit the file to MECH-PAYROLL for inclusion in the next regular payroll cycle, and confirm that withholding amounts are deposited to EFTPS in the same deposit schedule period as the equity events.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Equity Tax Event Records | Per-grantee equity income and withholding amounts from A133451 |
| C1 | Control | IRC §3402 Supplemental Withholding Timing | [IRC-3402] Supplemental wages must be included in the payroll cycle that includes the event date or the immediately following payroll; the employer cannot defer withholding deposit beyond the applicable EFTPS deposit schedule period |
| C2 | Control | NACHA-ACH | [NACHA-ACH] If net proceeds after withholding are paid to grantee via ACH (sell-to-cover or same-day sale), file must meet NACHA format and timing requirements |
| O1 | Output | Equity Tax Supplemental Payroll Transmission | Per-grantee supplemental payroll file: employee ID; equity income; federal withholding; state withholding; FICA amounts; transmitted to Payroll A1333 — IF-A1-20 |
| M1 | Mechanism | Payroll Processor API | [MECH-PAYROLL] ADP Workforce Now, Gusto — supplemental payroll import |
| M2 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — supplemental payroll export |

**Definition of Done:** Supplemental payroll file transmitted to MECH-PAYROLL AND MECH-PAYROLL returns successful import confirmation with zero error records AND withholding is deposited to EFTPS within the grantee's applicable deposit schedule period.

**[CROSS-FUNCTION: A1334 → A1333]** *Interface: IF-A1-20*

---

#### A133453: Prepare Annual Equity Tax Reporting

**Agent Definition:** Generate IRS Form 3921 for each ISO exercise in the calendar year, confirm NQSO spread is reported on employee W-2 Box 12 Code V, file all required information returns with the IRS FIRE system by the applicable deadline, and deliver employee copies by January 31.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Full-Year ISO Exercise Records | All ISO exercises in the calendar year: grantee ID; grant date; exercise date; exercise price per share; FMV on exercise date; number of shares transferred — from MECH-EQUITY |
| I2 | Input | Full-Year NQSO Exercise Records | All NQSO exercises: spread amount per exercise event — from equity tax event records |
| C1 | Control | FORM-3921 ISO Reporting | [FORM-3921] IRC §6039(a) — Form 3921 required for every transfer of stock pursuant to exercise of an ISO during the calendar year; employee copy due January 31; IRS copy due February 28 (paper) or March 31 (electronic via FIRE); penalty §6721/§6722 for failure to file or incorrect information |
| C2 | Control | IRC §422 ISO Reporting | [IRC-422] ISO exercise records must include grant date and exercise date to support holding period determination; employer must report to employee to enable AMT preference item calculation |
| O1 | Output | Filed Forms 3921 + W-2 Box 12 Code V | FIRE system acceptance acknowledgment for Form 3921 batch; employee copies delivered by January 31; NQSO spread reflected on each grantee's W-2 Box 12 Code V |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — Form 3921 data export |
| M2 | Mechanism | Payroll Processor API | [MECH-PAYROLL] — W-2 Box 12 Code V preparation |

**Definition of Done:** IRS FIRE system returns accepted filing status for the Form 3921 batch AND employee copies of Form 3921 delivered or postmarked by January 31 AND every NQSO exercise in the calendar year has a corresponding W-2 Box 12 Code V entry matching the spread amount.

---

## A13346: Maintain Cap Table and Monitor SEC Compliance (L5 Phase 6)

**Function:** Reconcile cap table records, monitor SEC Rule 701 aggregate value compliance, and conduct the annual equity plan audit
**Supreme Constraint:** [SEC-RULE701] rolling 12-month aggregate limits; [GAAP-ASC718] expense reconciliation; [IRC-409A] no outstanding below-FMV options

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | MECH-EQUITY Transaction Records | All grant, exercise, forfeiture, expiration, and settlement events in the period |
| I2 | Input | Corporate Charter Authorized Share Count | Board-authorized share count per corporate charter |
| C1 | Control | SEC Rule 701 | [SEC-RULE701] Rolling 12-month aggregate: track value of all equity securities issued; disclosure threshold $5M; expanded disclosure threshold $10M |
| C2 | Control | IRC §409A | [IRC-409A] No outstanding options with exercise prices below current FMV; annual check required |
| C3 | Control | GAAP-ASC718 | [GAAP-ASC718] Cumulative expense must reconcile to MECH-ERP-GL stock compensation balance |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] |
| M2 | Mechanism | Business Intelligence | [MECH-BI] Tableau, Looker — cap table analytics and Rule 701 aggregate tracking |
| O1 | Output | Reconciled Cap Table | Shares outstanding by class; fully diluted share count; options pool available |
| O2 | Output | SEC Rule 701 Compliance Report | Rolling 12-month aggregate value; disclosure obligation status |
| O3 | Output | Annual Equity Audit Report | Outstanding award summary; 409A compliance confirmation; ASC 718 expense reconciliation |

**Child Nodes:** A133461, A133462, A133463

---

#### A133461: Reconcile Cap Table Records

**Agent Definition:** Reconcile the MECH-EQUITY cap table against all grant, exercise, forfeiture, repurchase, and expiration transactions in the period, verify that authorized minus issued shares equals the plan pool balance shown in MECH-EQUITY, and confirm fully diluted share count against board-approved authorizations.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | MECH-EQUITY Period Transaction Log | All equity events in the period: grants issued, options exercised, shares forfeited, options expired, RSUs settled |
| I2 | Input | Corporate Charter Authorized Shares | Total authorized common and preferred shares per most recent certificate of incorporation |
| C1 | Control | SEC Rule 701 | [SEC-RULE701] Cap table accuracy underpins Rule 701 aggregate value calculation; errors in outstanding share counts can cause misrepresentation of aggregate offering value |
| C2 | Control | GAAP-ASC718 | [GAAP-ASC718] Share counts drive weighted-average diluted EPS calculations; must be accurate for financial reporting |
| O1 | Output | Reconciled Cap Table | Outstanding shares by class; options/RSUs outstanding by grant; shares available in plan pool; fully diluted share count; reconciliation confirms authorized − issued = available |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — cap table reconciliation |
| M2 | Mechanism | Business Intelligence | [MECH-BI] — reconciliation query |

**Definition of Done:** MECH-EQUITY cap table balance (authorized shares − issued shares) reconciles to the corporate charter authorized share count AND fully diluted share count ties to board-approved pool authorizations AND zero discrepancies between share issuances in MECH-EQUITY and corresponding payment records.

---

#### A133462: Monitor SEC Rule 701 Aggregate Value

**Agent Definition:** Compute the rolling 12-month aggregate value of all equity securities issued under the equity compensation plan using the SEC Rule 701 calculation methodology (greater of securities issued during the period or the aggregate offering price), compare against the $5M and $10M disclosure thresholds, and — if either threshold is met or exceeded — initiate the required additional disclosure process.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Reconciled Cap Table | All equity securities issued in the rolling 12-month period with grant-date FMV per share from A133461 |
| C1 | Control | SEC Rule 701 | [SEC-RULE701] 12-month aggregate limit is the GREATEST of: (a) $1M, (b) 15% of total assets, (c) 15% of outstanding amount of the class of securities sold; if aggregate value in rolling 12 months >$5M: additional disclosures required (risk factors, financial statements, compensation plan summary) within a reasonable period; if >$10M: expanded disclosures must be provided to all recipients |
| O1 | Output | SEC Rule 701 Aggregate Value Report | Rolling 12-month aggregate value; comparison to $5M and $10M thresholds; disclosure obligation determination (none / additional disclosures / expanded disclosures); report generated quarterly |
| O2 | Output | Rule 701 Disclosure Package (if triggered) | Risk factors; most recent audited financial statements; compensation plan summary — delivered to all equity recipients if $5M threshold met |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — issuance history and aggregate value calculation |
| M2 | Mechanism | Business Intelligence | [MECH-BI] — rolling 12-month aggregation |

**Definition of Done:** Rule 701 Aggregate Value Report generated for the current quarter AND if aggregate value ≥$5M, additional disclosure package is prepared and delivered to all equity recipients before issuance of additional securities AND if aggregate value ≥$10M, expanded disclosure package is prepared and delivered.

---

#### A133463: Conduct Annual Equity Plan Audit

**Agent Definition:** Conduct an annual audit of all outstanding equity awards to confirm: (a) no options have exercise prices below the current 409A FMV, (b) all outstanding awards have valid vesting schedules in MECH-EQUITY, (c) ASC 718 cumulative expense reconciles to the MECH-ERP-GL stock compensation account balance, and (d) options expiring within 90 days have been communicated to grantees.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Full Outstanding Award Summary | All grants in MECH-EQUITY: grant type, exercise price, grant date, current FMV, vesting status, expiration date |
| I2 | Input | Cumulative ASC 718 Expense | Total stock compensation expense recognized to date from MECH-EQUITY vs. MECH-ERP-GL stock compensation expense account balance |
| C1 | Control | IRC §409A | [IRC-409A] Annual audit must confirm no outstanding options have exercise prices below the current adopted 409A FMV; any identified below-market options require immediate remediation (repricing or §409A compliance plan) before penalty exposure accrues further |
| C2 | Control | GAAP-ASC718 | [GAAP-ASC718] Cumulative recognized expense for each grant must not exceed the grant's total compensation cost; any discrepancy indicates a calculation error requiring correction before financial close |
| C3 | Control | IRC §422 Option Expiration | [IRC-422] ISO options must be exercised within 10 years of grant date (5 years for >10% shareholders); grantees approaching expiration must be notified with sufficient time to make an informed exercise decision |
| O1 | Output | Annual Equity Audit Report | Outstanding awards by type and grantee; options expiring in next 90 days with notification status; 409A compliance confirmation (zero below-FMV options); ASC 718 cumulative expense reconciliation to MECH-ERP-GL; any findings and remediation actions |
| M1 | Mechanism | Cap Table / Equity Management Platform | [MECH-EQUITY] — outstanding award data |
| M2 | Mechanism | Business Intelligence | [MECH-BI] — audit analytics |

**Definition of Done:** Annual Equity Audit Report confirms zero outstanding options with exercise prices below the current adopted 409A FMV AND ASC 718 cumulative expense in MECH-EQUITY reconciles to the MECH-ERP-GL stock compensation expense account balance to $0.00 variance AND all grantees with options expiring within 90 days have received written notification.

---

## Post-Sprint QA Checklist

- [x] Every L5 and L6 node has exactly one complete IDEF0 block
- [x] No L6 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md (R2.1)
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md (R2.2)
- [x] Every Output (O) names a specific artifact or verifiable state change (R2.3)
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1=A13341.O1; O2=A13342.O2; O3=A13344.O3; O4=A13345.O2; O5=A13346.O2+O3 [added post-audit F1]
- [x] No skill appears under more than one function node (R4.3)
- [x] All cross-function skills cite IF-A1-18, IF-A1-19, IF-A1-20 (R4.1/R4.2)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L5 node names are active verb phrases (R1.2) — all six phases verified
- [x] Leaf node count confirmed: 18 (3 per phase × 6 phases)
- [x] All mandatory inclusions verified (see Domain Header Block)
- [x] New constraint codes (IRC-409A, IRC-83B, SEC-RULE701, GAAP-ASC718, IRC-422, FORM-3921) added to ctrl-constraint-library.md
- [x] New mechanism code (MECH-EQUITY) added to ctrl-mechanism-catalog.md
- [x] New interfaces (IF-A1-18, IF-A1-19, IF-A1-20) registered in ctrl-interface-register.md
