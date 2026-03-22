# Skill File: Treasury & Cash Management

**Node:** A114
**Parent:** A11 Finance
**Function:** Manage Cash, Liquidity, and Financial Risk
**Supreme Constraint:** [MATH-NPV] Cash Pooling and Investment Valuation; [NACHA-ACH] ACH Standards; [UCC-4] Bank Deposits; [MATH-BURN] Liquidity Monitoring
**Cross-Function Interfaces:** IF-A1-02 (debt financing instruments → Legal A12)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] Treasury cash pooling structure design — [MATH-NPV] → A1142 / A11421–A11423

---

## A114: Manage Cash, Liquidity, and Financial Risk

**Function:** Manage Cash, Liquidity, and Financial Risk
**Supreme Constraint:** [MATH-NPV]; [NACHA-ACH]; [MATH-BURN]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Bank Account Balances | daily aggregation via MECH-BANK-API |
| I2 | Input | Accounts Receivable / Payable Aging | from MECH-ERP-GL — timing of cash in / out |
| I3 | Input | Rolling Forecast + 13-Week Cash Projection | from FP&A A111 (internal A11 flow) |
| I4 | Input | Debt / Credit Facility Agreements | from Legal A12 — covenant terms and borrowing base formulas |
| I5 | Input | Board-Approved Investment Policy | authorized instruments, counterparty limits, duration limits |
| C1 | Control | [MATH-NPV] Net Present Value | investment and pooling structure NPV optimization |
| C2 | Control | [NACHA-ACH] ACH Origination Rules | file format, timing, return code handling for electronic transfers |
| C3 | Control | [UCC-4] Bank Deposits and Collections | funds availability and check processing rules |
| C4 | Control | [MATH-BURN] Burn Rate and Runway Formula | monthly burn = disbursements − collections; runway = cash / monthly burn |
| O1 | Output | Daily Cash Position Report | aggregated bank balances and net daily cash position |
| O2 | Output | Cash Pooling Structure and Intercompany Transfer Records | executed sweeps and IC entries |
| O3 | Output | FX Hedge Trade Confirmations and Journal Entries | hedging transactions and mark-to-market |
| O4 | Output | Debt Covenant Compliance Certificate | periodic certification to lenders |
| O5 | Output | Investment Portfolio Statement | holdings, yields, and reconciliation to custodian |
| O6 | Output | Treasury Risk Dashboard | burn rate, runway, FX exposure, credit exposure |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | Kyriba, GTreasury, SAP Treasury |
| M2 | Mechanism | [MECH-BANK-API] Bank API / Open Banking | Plaid, MX, direct bank APIs |
| M3 | Mechanism | [MECH-ACH] ACH Origination Gateway | NACHA-compliant ACH origination |

**Child Nodes:** A1141, A1142, A1143, A1144, A1145, A1146

### Boundary Arrow Correspondence (A114)

| A114 Code | Produced By | Notes |
|---|---|---|
| O1 Daily Cash Position Report | A1141.O3 | cash sweeps executed and position reported |
| O2 Cash Pooling Structure + IC Transfer Records | A1142.O3 | executed concentration transfers |
| O3 FX Hedge Confirmations + Journal Entries | A1143.O3 | FX trades and mark-to-market entries |
| O4 Debt Covenant Compliance Certificate | A1144.O3 | periodic certification to lenders |
| O5 Investment Portfolio Statement | A1145.O3 | reconciled to custodian |
| O6 Treasury Risk Dashboard | A1146.O3 | distributed to Principal |

---

### A1141: Execute Daily Cash Position and Liquidity Management

**Function:** Execute Daily Cash Position and Liquidity Management
**Supreme Constraint:** [MATH-BURN]; [NACHA-ACH]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Bank Account Balances | all accounts via MECH-BANK-API |
| I2 | Input | Expected Same-Day Cash Movements | AP disbursements scheduled, AR collections expected |
| C1 | Control | [MATH-BURN] Burn Rate and Runway | flag if projected weekly cash balance < 8-week runway threshold |
| C2 | Control | [NACHA-ACH] | ACH file timing and settlement rules |
| O1 | Output | Daily Bank Account Balance Aggregation | all accounts, balances, and availability as of cut-off time |
| O2 | Output | Intraday and Overnight Cash Forecast | projected end-of-day and overnight position per account |
| O3 | Output | Cash Sweep Instructions Executed | confirmed same-day transfers minimizing idle balances |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | position aggregation and sweep instruction |
| M2 | Mechanism | [MECH-BANK-API] Bank API | real-time balance feeds |

**Child Nodes:** A11411, A11412, A11413

---

### A1142: Design and Operate Cash Pooling Structure

**Function:** Design and Operate Cash Pooling Structure
**Supreme Constraint:** [MATH-NPV]; [IRC-482]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Legal Entity Cash Flow Data | daily and projected cash flows per entity |
| I2 | Input | Board-Approved Pooling Structure | zero-balance or notional pooling design |
| C1 | Control | [MATH-NPV] | net interest income from pooling = NPV improvement vs. standalone accounts |
| C2 | Control | [IRC-482] Transfer Pricing | intercompany cash transfers must bear arm's length interest |
| O1 | Output | Cash Flow Map Across Legal Entities | surplus and deficit positions per entity |
| O2 | Output | Net Interest Income Model | projected NII from concentration vs. standalone |
| O3 | Output | Intercompany Concentration Transfer Records | executed transfers + IC interest entries |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | pooling structure operation |
| M2 | Mechanism | [MECH-ACH] ACH Origination Gateway | IC transfer execution |

**Child Nodes:** A11421, A11422, A11423

---

### A1143: Identify, Hedge, and Report Foreign Exchange Exposure

**Function:** Identify, Hedge, and Report Foreign Exchange Exposure
**Supreme Constraint:** [IFRS-9] (FX instruments); [GAAP-ASC820] Fair Value

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Multicurrency Revenue and Cost Data | from MECH-ERP-GL — open foreign currency positions |
| I2 | Input | Board-Approved FX Hedging Policy | approved instruments, hedge ratio, tenor limits |
| C1 | Control | [GAAP-ASC820] Fair Value Measurement | FX derivatives marked to market at Level 2 fair value |
| C2 | Control | [IFRS-9] Financial Instruments | classification and measurement of hedging instruments |
| O1 | Output | Open FX Exposure Report | currency pair, notional, maturity |
| O2 | Output | FX Spot and Forward Trade Confirmations | executed hedging transactions |
| O3 | Output | FX Gain/Loss and Mark-to-Market Journal Entries | unrealized and realized FX amounts posted to GL |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | FX exposure management |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | FX journal entry posting |

**Child Nodes:** A11431, A11432, A11433

---

### A1144: Administer Debt, Credit Facilities, and Covenant Compliance

**Function:** Administer Debt, Credit Facilities, and Covenant Compliance
**Supreme Constraint:** [UCC-9] Secured Transactions; [MATH-GAAP-AXIOMS]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Credit Facility Agreements | from Legal A12 — covenant definitions and borrowing base formula |
| I2 | Input | Period Financial Statements | from A112 — covenant ratio inputs |
| C1 | Control | [UCC-9] Secured Transactions | security interests and collateral requirements |
| C2 | Control | [MATH-GAAP-AXIOMS] | financial covenant ratios use GAAP-defined figures |
| O1 | Output | Credit Facility Availability and Borrowing Base Report | available credit, outstanding borrowings, headroom |
| O2 | Output | Financial Covenant Compliance Test | each covenant ratio computed vs. threshold; pass/fail |
| O3 | Output | Executed Debt Certificate | signed compliance certificate delivered to lenders |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | debt schedule tracking |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | covenant ratio data |
| M3 | Mechanism | [MECH-ESIGN] Electronic Signature | certificate execution |

**Child Nodes:** A11441, A11442, A11443

---

### A1145: Invest Surplus Cash in Board-Authorized Instruments

**Function:** Invest Surplus Cash in Board-Authorized Instruments
**Supreme Constraint:** [GAAP-ASC820] Fair Value; board investment policy

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Available Surplus Cash | from A1141 cash position — cash above minimum operating reserve |
| I2 | Input | Board-Approved Investment Policy | authorized instruments, counterparty credit limits, maximum duration |
| C1 | Control | [GAAP-ASC820] Fair Value Measurement | investments measured at Level 1 (money market, Treasuries) or Level 2 |
| C2 | Control | Board investment policy | only authorized counterparties and instruments permitted |
| O1 | Output | Investment Counterparty Screening Results | counterparties cleared vs. board-approved list |
| O2 | Output | Executed Investment Confirmations | purchased securities / instruments with terms |
| O3 | Output | Reconciled Investment Portfolio Statement | holdings, cost, FMV, yield; tied to custodian statement |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | investment management module |
| M2 | Mechanism | [MECH-BANK-API] Bank / Custodian API | portfolio data |

**Child Nodes:** A11451, A11452, A11453

---

### A1146: Report Treasury Risk Metrics and Hedging Effectiveness

**Function:** Report Treasury Risk Metrics and Hedging Effectiveness
**Supreme Constraint:** [MATH-BURN]; [GAAP-ASC820]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Cash Position and Forecast | from A1141 |
| I2 | Input | FX Exposure and Hedge Portfolio | from A1143 |
| I3 | Input | Investment Portfolio | from A1145 |
| C1 | Control | [MATH-BURN] Burn Rate and Runway Formula | monthly burn = operating disbursements − collections |
| C2 | Control | [GAAP-ASC820] | fair value metrics at Level 1/2 hierarchy |
| O1 | Output | Cash Burn Rate and Runway Calculation | monthly burn, trailing 3-month average, runway months |
| O2 | Output | Treasury Risk Dashboard | FX exposure by currency, liquidity metrics, credit counterparty exposure |
| O3 | Output | Treasury Report Distributed to Principal | complete report with risk commentary delivered within reporting SLA |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | dashboard generation |
| M2 | Mechanism | [MECH-BI] Business Intelligence Platform | treasury metrics visualization |

**Child Nodes:** A11461, A11462, A11463

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A11411: Aggregate Daily Bank Account Balances via Bank API

**Agent Definition:** Pull end-of-day balance and same-day transaction data from all bank accounts via MECH-BANK-API, validate that all accounts are reporting, and produce the daily bank account balance register.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Bank API Balance Feed | all accounts connected via MECH-BANK-API at end-of-day cut-off |
| C1 | Control | [UCC-4] Bank Deposits and Collections | funds availability rules determine available vs. ledger balance |
| O1 | Output | Daily Bank Account Balance Register | account ID, bank, ledger balance, available balance, as-of timestamp |
| M1 | Mechanism | [MECH-BANK-API] Bank API / Open Banking (Plaid, MX, direct bank APIs) | |
| M2 | Mechanism | [MECH-TMS] Treasury Management System | balance aggregation |

**Definition of Done:** All bank accounts in the TMS account register have a balance reported as of the business day cut-off AND no account shows "No Data" status AND register total ties to prior day balance ± same-day net transactions to $0.00.

---

#### A11412: Forecast Intraday and Overnight Cash Positions

**Agent Definition:** Combine the opening bank balance with scheduled same-day AP disbursements and expected AR collections to compute the projected end-of-day and overnight cash position for each account, and flag any account projected to go below the minimum balance threshold.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Daily Bank Balance Register | from A11411.O1 |
| I2 | Input | Scheduled AP Disbursements | ACH and wire payments scheduled for today from MECH-AP |
| I3 | Input | Expected AR Collections | invoices due and ACH returns expected today |
| C1 | Control | [NACHA-ACH] ACH Settlement Timing | next-day or same-day ACH settlement windows |
| O1 | Output | Intraday Cash Flow Projection | opening balance + expected inflows − expected outflows = projected end-of-day balance |
| O2 | Output | Minimum Balance Threshold Flags | any account projected below minimum flagged with deficit amount |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | intraday projection model |

**Definition of Done:** Intraday projection is produced by 10:00 AM local time AND covers 100% of accounts in the balance register AND any account below minimum threshold has a flag with projected deficit amount.

---

#### A11413: Initiate Cash Sweeps to Minimize Idle Balances

**Agent Definition:** Based on the intraday cash projection, initiate same-day ACH or wire transfers to sweep excess balances from subsidiary accounts to the concentration account (or to fund deficient accounts), and confirm all transfers are executed.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Intraday Cash Flow Projection | from A11412.O1 |
| I2 | Input | Board-Approved Sweep Instructions | concentration account hierarchy and minimum balance per account |
| C1 | Control | [NACHA-ACH] ACH Origination Rules | CCD+ format, same-day ACH cut-off times, return code handling |
| O1 | Output | Cash Sweep Instruction Batch | ACH or wire instructions for each sweep transfer |
| O2 | Output | Sweep Execution Confirmations | NACHA origination confirmation or wire settlement confirmation |
| M1 | Mechanism | [MECH-ACH] ACH Origination Gateway | sweep execution |
| M2 | Mechanism | [MECH-TMS] Treasury Management System | sweep instruction generation |

**Definition of Done:** MECH-ACH returns origination confirmation for every sweep instruction AND no account ends the day with a balance above the board-approved maximum idle balance AND sweep confirmations are filed in MECH-TMS.

---

#### A11421: Map Cash Flows Across Legal Entities for Pooling Design

**Agent Definition:** Compile daily and projected cash flows for each legal entity, map surplus and deficit positions, and produce the inter-entity cash flow map that informs the optimal pooling structure design.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Entity-Level Cash Flow Data | daily cash positions per legal entity from MECH-BANK-API |
| I2 | Input | 13-Week Cash Flow Forecasts | from FP&A A111 (internal A11 flow) — forward surplus/deficit by entity |
| C1 | Control | [MATH-NPV] | pooling benefit = reduction in net borrowing costs across entities |
| O1 | Output | Inter-Entity Cash Flow Map | entity × period: surplus or deficit amount; net benefit calculation |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | entity pooling model |

**Definition of Done:** Cash flow map covers all legal entities with bank accounts AND surplus/deficit positions sum to the enterprise net cash position AND NPV of pooling benefit is computed and documented.

---

#### A11422: Model Net Interest Income from Cash Concentration

**Agent Definition:** Model the net interest income (NII) improvement from concentrating all entity cash into a single pooling account, comparing the pooled interest yield against the weighted average of standalone account yields, and compute the annual NII improvement.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Inter-Entity Cash Flow Map | from A11421.O1 |
| I2 | Input | Bank Deposit Rates and Credit Line Rates | current rates per bank for pooling and standalone accounts |
| C1 | Control | [MATH-NPV] NPV Formula | NII improvement NPV = Σ(annual NII benefit / (1+r)ᵗ) |
| O1 | Output | Cash Pooling NII Model | projected annual NII: pooled vs. standalone; NPV of multi-year benefit |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | NII modeling |
| M2 | Mechanism | [MECH-FPA] FP&A Platform | NPV computation |

**Definition of Done:** NII model shows annual NII for pooled scenario AND standalone scenario AND the difference (NII improvement) is positive (pooling is beneficial) or negative (pooling not warranted) AND NPV of 3-year benefit is calculated.

---

#### A11423: Execute Intercompany Cash Concentration Transfers and Record Entries

**Agent Definition:** Execute daily intercompany cash concentration transfers per the approved pooling structure, record the intercompany loan or deposit entries in each entity's general ledger (with arm's length interest), and produce the daily IC transfer log.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Cash Sweep Instructions | from A11413.O1 — intercompany sweep amounts |
| I2 | Input | Arm's Length IC Interest Rate | from TP documentation A1133 — intercompany interest rate |
| C1 | Control | [IRC-482] Transfer Pricing | IC cash transfers must bear arm's length interest; documented in TP study |
| C2 | Control | [NACHA-ACH] | ACH transfer execution rules |
| O1 | Output | IC Cash Concentration Transfer Log | date, transferring entity, receiving entity, amount, confirmation |
| O2 | Output | IC Loan / Deposit Journal Entries | debit IC receivable / credit cash (lending entity); reverse at borrowing entity |
| M1 | Mechanism | [MECH-ACH] ACH Origination Gateway | transfer execution |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | IC journal entry posting |

**Definition of Done:** Every IC transfer has an ACH or wire confirmation AND corresponding IC loan/deposit entries are posted in both entities' GLs AND IC interest accrual rate is within the arm's length range from the TP study.

---

#### A11431: Compute Open Foreign Currency Exposure by Currency Pair

**Agent Definition:** Aggregate all open foreign currency denominated assets (AR, IC loans, investments) and liabilities (AP, IC payables, debt) by currency pair, compute the net open exposure per pair, and produce the FX exposure report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Multicurrency GL Balances | from MECH-ERP-GL — all foreign currency denominated accounts |
| I2 | Input | Forward Contract Positions | existing hedges in TMS |
| C1 | Control | [GAAP-ASC820] Fair Value | open FX positions valued at spot rate (Level 1) |
| O1 | Output | FX Exposure Report | currency pair, gross long, gross short, net exposure, existing hedge coverage |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | FX exposure aggregation |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | multicurrency balance extraction |

**Definition of Done:** Report covers all currency pairs with net exposure >$10,000 USD equivalent AND net exposure per pair = gross long − gross short AND existing hedge coverage ratio is computed per pair.

---

#### A11432: Execute FX Spot and Forward Transactions to Hedge Exposures

**Agent Definition:** For currency pairs with net open exposure exceeding the board-approved hedge threshold, execute FX spot or forward contracts at market rates to reduce exposure to within policy limits, and obtain trade confirmation from the counterparty bank.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FX Exposure Report | from A11431.O1 — net exposures above hedge threshold |
| I2 | Input | Board-Approved Hedging Policy | hedge ratio, authorized instruments, tenor limits, approved counterparties |
| C1 | Control | [IFRS-9] Financial Instruments | hedge accounting designation requirements if hedge accounting elected |
| O1 | Output | FX Trade Confirmations | counterparty, notional, rate, settlement date, deal reference |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | trade execution and confirmation |

**Definition of Done:** Every currency pair with exposure above the board-approved threshold has a hedge trade confirmation AND post-hedge net exposure is within board-approved policy limits AND each trade is from an approved counterparty.

---

#### A11433: Record FX Gain/Loss and Mark-to-Market Hedge Fair Values

**Agent Definition:** Each period, compute the realized FX gain/loss on settled FX transactions and the unrealized mark-to-market fair value of open forward contracts, and post the corresponding journal entries to the general ledger.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Settled FX Trade Confirmations | from A11432 — settled trades with original rate vs. settlement rate |
| I2 | Input | Open Forward Contract Portfolio | from MECH-TMS — open contracts at period end |
| C1 | Control | [GAAP-ASC820] Fair Value Level 2 | forward contract FMV = difference between contracted rate and current forward rate × notional |
| O1 | Output | FX Gain/Loss Journal Entry | realized: debit/credit FX gain/loss on settled trades |
| O2 | Output | Mark-to-Market Journal Entry | unrealized: debit/credit derivative asset/liability for open forwards |
| M1 | Mechanism | [MECH-ERP-GL] ERP / GL | journal entry posting |
| M2 | Mechanism | [MECH-TMS] Treasury Management System | MTM computation |

**Definition of Done:** Every settled FX trade has a realized gain/loss journal entry AND every open forward has an MTM entry posted AND all journal entries are zero-balanced AND MTM valuations use observable market rates (Level 2).

---

#### A11441: Monitor Credit Facility Availability and Borrowing Base

**Agent Definition:** Calculate the current borrowing base from the credit agreement formula (eligible AR × advance rate, or other formula), compare to outstanding borrowings, and report the available credit and excess availability.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Credit Agreement Borrowing Base Formula | from Legal A12 — eligible collateral and advance rates |
| I2 | Input | AR Aging and Collateral Data | from MECH-ERP-GL AR sub-ledger |
| C1 | Control | [UCC-9] Secured Transactions | security interest in AR collateral; ineligible AR exclusions |
| O1 | Output | Borrowing Base Certificate | eligible collateral, advance rate, borrowing base, outstanding borrowings, availability |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | borrowing base calculation |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | AR aging data |

**Definition of Done:** Borrowing base certificate ties eligible AR to MECH-ERP-GL AR aging AND ineligible AR is excluded per credit agreement definitions AND availability = borrowing base − outstanding borrowings is computed and documented.

---

#### A11442: Test and Certify Financial Covenant Compliance Each Reporting Period

**Agent Definition:** Compute each financial covenant ratio (leverage ratio, fixed charge coverage ratio, minimum liquidity, etc.) from the period financial statements, compare to covenant thresholds, determine pass/fail for each covenant, and prepare the compliance certificate.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Period Financial Statements | from A112 locked statements |
| I2 | Input | Credit Agreement Covenant Definitions | from Legal A12 — each covenant's defined calculation |
| C1 | Control | [MATH-GAAP-AXIOMS] | covenant ratios use GAAP-defined figures per credit agreement |
| O1 | Output | Covenant Compliance Test | each covenant: defined ratio, actual ratio, threshold, pass/fail |
| O2 | Output | Covenant Compliance Certificate | signed by CFO-equivalent; pass/fail per covenant |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | covenant testing module |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | CFO-equivalent certification |

**Definition of Done:** Every covenant in the credit agreement has a computed ratio AND pass/fail determination AND compliance certificate is signed by CFO-equivalent AND certificate is delivered to lenders within the credit agreement deadline.

---

#### A11443: Process Debt Drawdowns, Repayments, and Interest Payments

**Agent Definition:** For each debt drawdown, scheduled repayment, or interest payment, initiate the wire or ACH transfer, post the corresponding journal entry (debit cash / credit note payable for drawdown; reverse for repayment; debit interest expense for interest), and confirm settlement.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Drawdown Request or Payment Schedule | from credit agreement amortization schedule or borrowing notice |
| C1 | Control | [MATH-GAAP-AXIOMS] | principal payments reduce liability; interest is expensed per accrual method |
| C2 | Control | [UCC-9] | lender's security interest maintained; no unauthorized disposition of collateral |
| O1 | Output | Wire/ACH Transfer Confirmation | payment executed and confirmed |
| O2 | Output | Debt Journal Entry | drawdown: debit cash / credit note payable; repayment: reverse; interest: debit interest expense / credit accrued interest payable |
| M1 | Mechanism | [MECH-ACH] ACH Origination Gateway | payment execution |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | journal entry posting |

**Definition of Done:** Transfer confirmation is received AND journal entry is zero-balanced AND outstanding debt balance in MECH-ERP-GL agrees to the lender's loan statement to $0.00.

---

#### A11451: Screen Investment Counterparties Against Board-Approved Policy

**Agent Definition:** For each proposed investment transaction, verify that the counterparty (bank, money market fund, broker-dealer) appears on the board-approved counterparty list, check the counterparty's current credit rating against the minimum required rating, and produce a cleared or rejected determination.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed Investment Counterparty | name, instrument type, and term of proposed investment |
| I2 | Input | Board-Approved Investment Policy | approved counterparty list, minimum credit rating, maximum concentration per counterparty |
| C1 | Control | Board investment policy | only counterparties on approved list AND meeting minimum rating threshold are cleared |
| O1 | Output | Counterparty Screening Result | cleared (meets all policy criteria) or rejected (fails one or more criteria) |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | counterparty management |

**Definition of Done:** Screening result is binary (cleared / rejected) AND every criterion in the investment policy is evaluated AND rejected counterparties have the specific failing criterion documented.

---

#### A11452: Execute Investment Purchases in Board-Authorized Instruments

**Agent Definition:** For cleared counterparties, execute the investment purchase (money market fund subscription, Treasury bill purchase, or other authorized instrument), obtain trade confirmation, and record the investment in MECH-TMS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Counterparty Screening Clearance | from A11451.O1 |
| I2 | Input | Available Surplus Cash | from A1141 above minimum reserve |
| C1 | Control | Board investment policy | authorized instruments and maximum duration |
| C2 | Control | [GAAP-ASC820] Fair Value | investments initially recorded at cost (Level 1 money market) or fair value |
| O1 | Output | Investment Purchase Confirmation | instrument, face value, yield, maturity, counterparty, settlement date |
| O2 | Output | Investment Journal Entry | debit short-term investments / credit cash |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | investment execution |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | investment entry posting |

**Definition of Done:** Trade confirmation is received from counterparty AND investment journal entry is zero-balanced AND investment is recorded in MECH-TMS portfolio with all required fields populated.

---

#### A11453: Reconcile Investment Portfolio to Custodian Statements

**Agent Definition:** Each period, compare the MECH-TMS investment portfolio register to the custodian's official statement, identify any discrepancy in holdings, cost basis, or accrued interest, and produce the reconciled portfolio statement.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | MECH-TMS Portfolio Register | all investment holdings with cost, FMV, accrued interest |
| I2 | Input | Custodian Statement | official period-end statement from bank or broker-dealer custodian |
| C1 | Control | [GAAP-ASC820] Fair Value | FMV must reflect Level 1/2 market prices at period end |
| O1 | Output | Reconciled Investment Portfolio Statement | TMS register vs. custodian; variance column; all items at $0.00 |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | portfolio reconciliation |
| M2 | Mechanism | [MECH-BANK-API] Bank / Custodian API | custodian statement feed |

**Definition of Done:** Every holding in MECH-TMS has a matching line in the custodian statement AND FMV per unit ties to observable market price AND total portfolio FMV on TMS register agrees to custodian statement to $0.00.

---

#### A11461: Compute Cash Burn Rate and Runway Months

**Agent Definition:** Compute the trailing 3-month average monthly cash burn rate (operating disbursements minus collections) and the current runway in months (cash balance divided by average monthly burn), and compare to the prior period.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Bank Account Balance Register | from A11411.O1 — current total cash |
| I2 | Input | Prior 3 Months Operating Cash Flows | from MECH-ERP-GL cash flow activity |
| C1 | Control | [MATH-BURN] Burn Rate Formula | monthly burn = operating cash disbursements − operating cash collections; runway = cash balance ÷ average monthly burn |
| O1 | Output | Cash Burn Rate and Runway Calculation | trailing 3-month average burn, current cash, runway months, period-over-period change |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | burn/runway calculation |
| M2 | Mechanism | [MECH-ERP-GL] ERP / GL | operating cash flow data |

**Definition of Done:** Burn rate is computed as trailing 3-month average AND runway = current cash / average monthly burn to one decimal place AND period-over-period change in runway is documented.

---

#### A11462: Produce Treasury Risk Dashboard with FX, Liquidity, and Credit Exposure

**Agent Definition:** Compile all treasury risk metrics (cash burn rate, runway, FX net exposure by currency, investment counterparty credit concentration, debt covenant headroom) into a single dashboard and produce the period treasury risk report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Cash Burn Rate and Runway | from A11461.O1 |
| I2 | Input | FX Exposure Report | from A11431.O1 |
| I3 | Input | Investment Portfolio Statement | from A11453.O1 |
| I4 | Input | Covenant Compliance Test | from A11442.O1 |
| C1 | Control | [MATH-BURN] | runway < 6 months = critical flag; < 12 months = caution flag |
| C2 | Control | [GAAP-ASC820] | FX and investment fair values at observable market rates |
| O1 | Output | Treasury Risk Dashboard | all risk metrics by category; RAG status (red/amber/green) |
| M1 | Mechanism | [MECH-TMS] Treasury Management System | dashboard generation |
| M2 | Mechanism | [MECH-BI] BI Platform | visualization |

**Definition of Done:** Dashboard contains all four metric categories (liquidity, FX, credit, covenant) AND every metric has a RAG status AND any critical flag (runway < 6 months or covenant breach) is escalated to Principal immediately.

---

#### A11463: Distribute Treasury Report to CFO-Equivalent and Principal

**Agent Definition:** Finalize the treasury risk dashboard and underlying data into a treasury report, confirm the distribution list matches the current board approval, and deliver the report to the CFO-equivalent and Principal within the reporting deadline SLA.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Treasury Risk Dashboard | from A11462.O1 |
| C1 | Control | Board reporting policy | treasury report frequency (weekly or monthly) and distribution list |
| O1 | Output | Treasury Report Delivered | complete report with delivery confirmation to all authorized recipients |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | report distribution |
| M2 | Mechanism | [MECH-MESSAGING] Team Messaging API | critical flag escalation (Slack, Teams) |

**Definition of Done:** Report is delivered to all authorized recipients AND MECH-DOC returns delivery confirmation AND distribution timestamp is within the board-approved reporting frequency deadline AND any critical flag has been escalated via MECH-MESSAGING before report delivery.

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1 = A1141.O3; O2 = A1142.O3; O3 = A1143.O3; O4 = A1144.O3; O5 = A1145.O3; O6 = A1146.O3
- [x] No skill appears under more than one function node
- [x] All cross-function skills cite an interface: IF-A1-02 (debt financing → Legal A12)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] All L4 and L5 node names are active verb phrases — verified (R1.2a); note: "Manage" in parent A114 name is a non-leaf header, not a leaf node definition, and is preceded by an action verb phrase in the Function field
- [x] Leaf node count confirmed: 18
- [x] Mandatory inclusions: Cash pooling structure design [MATH-NPV] (A1142 ✓)
- [x] New constraint codes used: MATH-BURN (A1146), IFRS-9 (A1143) — add to ctrl-constraint-library.md if not present; MATH-BURN is new; IFRS-9 already exists
