# Skill File: Contract Lifecycle Management

**Node:** A122
**Parent:** A12 Legal
**Function:** Execute Contract Lifecycle from Origination to Archive
**Supreme Constraint:** [UCC-2] UCC Article 2 — Sale of Goods | [ISDA-MA] ISDA 2002 Master Agreement | [CISG] UN Convention on International Sale of Goods
**Cross-Function Interfaces:** (Inbound: IF-A1-01, IF-A1-02, IF-A1-10) (Outbound: IF-A1-25 at A12213; IF-A0-09 via Sales A33)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [x] ISDA Master Agreement negotiation parameters — satisfied at A12222
- [x] Force majeure clause invocation analysis — satisfied at A1226 (A12261–A12263)

---

## Node Tree: A122

```
A122  Execute Contract Lifecycle from Origination to Archive
├── A1221  Draft and Publish Standard Contract Templates             [→ IF-A1-25]
│   ├── A12211  Identify Contract Type and Select Governing Legal Framework
│   ├── A12212  Draft Contract Using Approved Clause Library and Legal Review
│   └── A12213  Publish Approved Template to CLM Repository
├── A1222  Review and Negotiate Counterparty Contracts              [mandatory: ISDA-MA]
│   ├── A12221  Conduct Legal Review and Mark Up Counterparty Draft
│   ├── A12222  Negotiate ISDA Schedule and Credit Support Annex Parameters
│   └── A12223  Escalate Non-Standard Terms to Principal for Approval
├── A1223  Execute Contract via Electronic Signature
│   ├── A12231  Prepare Execution Copy with All Schedules and Exhibits
│   ├── A12232  Route Contract for Counterparty and Company E-Signature
│   └── A12233  Register Executed Contract in CLM with Obligation Metadata
├── A1224  Track Contract Obligations and Renewal Deadlines
│   ├── A12241  Extract and Register Key Date Obligations in CLM System
│   ├── A12242  Generate Obligation Alerts at 90-60-30-Day Intervals
│   └── A12243  Produce Contract Performance Report for Business Owner Review
├── A1225  Process Contract Renewal and Termination
│   ├── A12251  Evaluate Renewal Terms and Options Exercise Window
│   ├── A12252  Issue Renewal or Non-Renewal Notice Within Required Notice Period
│   └── A12253  Execute Termination and Archive Final Agreement State
└── A1226  Analyze and Invoke Force Majeure Clause                  [mandatory: Force Majeure]
    ├── A12261  Identify Triggering Event and Evaluate Clause Scope
    ├── A12262  Issue Force Majeure Notice to Counterparty Within Notice Period
    └── A12263  Document Performance Suspension and Monitor Restoration Conditions
```

---

### A122: Execute Contract Lifecycle from Origination to Archive

**Function:** Execute Contract Lifecycle from Origination to Archive
**Supreme Constraint:** [UCC-2] UCC Article 2 | [ISDA-MA] ISDA 2002 Master Agreement

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Contract Requests | New contract requests, counterparty paper, renewal notices; source: Sales A33 (deals), Finance A11 (IF-A1-02), People A13 (employment), Operations A2 (vendor) |
| I2 | Input | Approved Template Library | Standard contract templates from MECH-CLM; source: A12213 outputs |
| I3 | Input | Deal Authorization | Deal approval authority matrix from Finance A11 (IF-A1-10); commission plan from Sales A33 |
| I4 | Input | Financing Instrument Terms | From Finance A11 (IF-A1-02) — loan, SAFE, convertible note parameters for legal structuring |
| C1 | Control | Sale of Goods | [UCC-2] UCC Article 2 — governs contracts for sale of tangible goods; §2-615 commercial impracticability |
| C2 | Control | OTC Derivatives | [ISDA-MA] ISDA 2002 Master Agreement — governs OTC derivative transactions; close-out netting; events of default |
| C3 | Control | International Sales | [CISG] UN Convention on International Sale of Goods (1980) — default law for cross-border goods sales between member nations |
| C4 | Control | Common Law Impracticability | [REST2-261] Restatement (Second) of Contracts §261 — discharge by supervening impracticability; force majeure doctrine |
| O1 | Output | Executed Contracts | Fully signed contracts in MECH-CLM repository with obligation metadata |
| O2 | Output | Standard Contract Template Library | Approved MSA, SOW, NDA, SaaS, and vendor templates (→ IF-A1-25 → Sales A33) |
| O3 | Output | Force Majeure Notices | Formal notices invoking or responding to force majeure |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] DocuSign CLM, Ironclad, Agiloft, Conga, Icertis |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign API, Adobe Sign, HelloSign |
| M3 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI, Lexis+ AI |

**Child Nodes:** A1221, A1222, A1223, A1224, A1225, A1226

---

#### A1221: Draft and Publish Standard Contract Templates

**Function:** Draft and Publish Standard Contract Templates
**Supreme Constraint:** [UCC-2] UCC Article 2 | [CISG] UN CISG (1980)

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Contract Type Specification | Request identifying: contract purpose, parties, governing law, key commercial terms; source: Sales A33, People A13, Operations A2 |
| I2 | Input | Legal and Regulatory Requirements | Applicable mandatory inclusions (jurisdiction-specific), existing IF-A1-03 Compliance Operating Envelope |
| C1 | Control | Governing Commercial Law | [UCC-2] Article 2 for goods; [REST2-261] §261 for services; [CISG] for international goods |
| C2 | Control | FTC Deceptive Practices | [FTC-5] 15 U.S.C. §45 — contract terms may not constitute unfair or deceptive practices |
| O1 | Output | Approved Contract Templates | Version-controlled templates in MECH-CLM: MSA, SOW, NDA, SaaS subscription agreement, vendor agreement, licensing agreement |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] DocuSign CLM, Ironclad — template library and version control |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI — clause drafting |

**Child Nodes:** A12211, A12212, A12213

---

##### A12211: Identify Contract Type and Select Governing Legal Framework

**Agent Definition:** Receive contract request, classify by contract type (MSA, SOW, NDA, SaaS, vendor, license, derivative), identify governing law by jurisdiction and subject matter, and produce a Contract Type Classification record specifying the applicable legal framework and mandatory clause set.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Contract Request | Request fields: purpose, counterparty type (customer / vendor / employee / lender), jurisdiction, subject matter (goods / services / software / IP / derivatives), deal value |
| C1 | Control | Contract Taxonomy | [UCC-2] for goods; [REST2-261] for services; [ISDA-MA] for derivatives; [CISG] for international goods; [UCC-9] for secured transactions |
| O1 | Output | Contract Type Classification Record | MECH-CLM metadata record: contract_type, governing_law_jurisdiction, mandatory_clause_set[], template_version, classification_rationale |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — contract type taxonomy and classification workflow |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — legal framework selection reasoning |

**Binary Definition of Done:**
- ✓ MECH-CLM classification record contains contract_type, governing_law_jurisdiction, and mandatory_clause_set[] (minimum 3 entries).
- ✓ Classification_rationale cites at least one named code from ctrl-constraint-library.md.

---

##### A12212: Draft Contract Using Approved Clause Library and Legal Review

**Agent Definition:** Using the Contract Type Classification from A12211, select applicable clauses from MECH-CLM clause library, draft complete contract including all mandatory sections (definitions, term, payment, IP ownership, limitation of liability, dispute resolution, force majeure, governing law), and flag any non-standard deviations for legal review.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Contract Type Classification Record | A12211 output identifying governing framework and mandatory clause set |
| I2 | Input | Commercial Deal Terms | Key economic terms: parties, term length, pricing, payment schedule, deliverables, SLA if applicable |
| C1 | Control | Commercial Law Framework | [UCC-2] §2-314 implied warranty of merchantability (goods); [REST2-261] §261 (services impracticability); [DTSA] 18 U.S.C. §1836 — trade secret protection clause |
| O1 | Output | Draft Contract | Complete draft with: definitions, term, payment, IP ownership, limitation of liability, indemnification, dispute resolution, force majeure, governing law, and signature blocks; non-standard clauses flagged |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — clause library and draft assembly |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — clause drafting and gap analysis |

**Binary Definition of Done:**
- ✓ Draft contains all 10 mandatory sections.
- ✓ Force majeure clause is present.
- ✓ Limitation of liability clause specifies a dollar cap or exclusion.
- ✓ IP ownership clause specifies work-for-hire or assignment language.

---

##### A12213: Publish Approved Template to CLM Repository

**Agent Definition:** Receive reviewed and approved draft contract, assign template version number, publish to MECH-CLM template library with access permissions (Sales A33: read/use; Legal A12: read/edit), and transmit template availability notification to Sales A33 and applicable business owners.

**[CROSS-FUNCTION: A12 → A33]** *Interface: IF-A1-25*

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Approved Contract Draft | A12212 output with all non-standard flags resolved and CLO sign-off |
| C1 | Control | Template Governance | Internal CLM governance policy — templates require CLO-equivalent approval before publication; version must increment from prior approved version |
| O1 | Output | Published Contract Template | MECH-CLM template record: template_id, template_type, version_number, governing_law, effective_date, access_roles (Sales A33: use; Legal: edit), approval_signature |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] DocuSign CLM, Ironclad — template library publication |
| M2 | Mechanism | Team Messaging API | [MECH-MESSAGING] Slack API — template availability notification to Sales A33 |

**Binary Definition of Done:**
- ✓ MECH-CLM returns template_id for published template.
- ✓ Access_roles field grants Sales A33 use permission.
- ✓ Version_number is incremented from prior approved version.
- ✓ CLO approval_signature is present.
*(IF-A1-25 output satisfied)*

---

#### A1222: Review and Negotiate Counterparty Contracts

**Function:** Review and Negotiate Counterparty Contracts
**Supreme Constraint:** [ISDA-MA] ISDA 2002 Master Agreement | [UCC-2] UCC Article 2 | [CISG] UN CISG

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Counterparty Contract Draft | Counterparty's paper (their form contract) with accompanying commercial terms |
| I2 | Input | Internal Negotiation Authority Matrix | Approved positions on standard clauses (liability caps, IP ownership, indemnification); source: IF-A1-10 for deal approval thresholds |
| C1 | Control | OTC Derivatives Master | [ISDA-MA] ISDA 2002 Master Agreement — Events of Default, Termination Events, Close-out Netting, Credit Support Annex parameters |
| C2 | Control | International Sales | [CISG] — may be excluded by explicit choice-of-law clause (Art. 6); default applies if not excluded |
| O1 | Output | Marked-Up Counterparty Draft | Red-lined contract with company positions; fallback positions documented per clause |
| O2 | Output | Executed ISDA Schedule | Completed ISDA Schedule and CSA for derivative counterparties |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — negotiation workflow and redline tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI, Lexis+ AI — contract review and redline |

**Child Nodes:** A12221, A12222, A12223

---

##### A12221: Conduct Legal Review and Mark Up Counterparty Draft

**Agent Definition:** Receive counterparty contract draft, compare each clause against the internal approved clause library and negotiation authority matrix, produce a red-lined version annotating company positions, and flag clauses requiring escalation (liability caps, IP ownership, indemnification, governing law) for A12223 routing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Counterparty Contract Draft | Counterparty's form contract in MECH-CLM or MECH-DOC |
| I2 | Input | Negotiation Authority Matrix | Internal approved positions per clause type; source: CLO-approved playbook in MECH-CLM |
| C1 | Control | Commercial Law | [UCC-2] for goods contracts; [REST2-261] for services; implied warranties, limitation of liability |
| O1 | Output | Marked-Up Contract Draft | Red-lined counterparty draft in MECH-CLM with: (a) company position per clause, (b) escalation flags on non-standard clauses, (c) summary of open issues table |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — redline workflow and issue tracker |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — clause-by-clause analysis and redline generation |

**Binary Definition of Done:**
- ✓ MECH-CLM contains marked-up draft with company position annotated on ≥90% of substantive clauses.
- ✓ Open issues table lists all escalation-flag clauses with company fallback position.
- ✓ Summary is transmitted to business owner within 3 business days of receipt.

---

##### A12222: Negotiate ISDA Schedule and Credit Support Annex Parameters

**Agent Definition:** For derivative counterparties, receive ISDA Master Agreement and proposed Schedule, negotiate economic and credit terms (Specified Entities, Threshold Amounts, Independent Amounts, Minimum Transfer Amount, Eligible Collateral, Valuation Agent), and produce executed Schedule and CSA reflecting agreed parameters.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Counterparty ISDA Master Agreement and Proposed Schedule | ISDA 2002 Master Agreement template plus counterparty's proposed Schedule elections and Credit Support Annex terms |
| I2 | Input | Credit Parameters | Company's credit profile, approved threshold and independent amount levels; source: Finance A11 Treasury (A114) |
| C1 | Control | ISDA Master Agreement | [ISDA-MA] ISDA 2002 Master Agreement — §5 Events of Default (Failure to Pay, Bankruptcy, Cross-Default); §6 Termination Events and Close-out Netting; Schedule Part 1–5 elections |
| O1 | Output | Executed ISDA Schedule | Completed ISDA Schedule with: Part 1 (Termination provisions), Part 2 (Tax representations), Part 3 (Documents), Part 4 (Miscellaneous), Part 5 (Other provisions); plus Credit Support Annex with agreed Threshold, MTA, IA, and eligible collateral |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — ISDA workflow and Schedule version tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — ISDA Schedule election analysis |

**Binary Definition of Done:**
- ✓ Executed ISDA Schedule contains all 5 Parts with no blank elections.
- ✓ Credit Support Annex specifies Threshold Amount, Minimum Transfer Amount, Independent Amount, and eligible collateral type.
- ✓ Both parties' authorized signatories have executed via MECH-ESIGN.

---

##### A12223: Escalate Non-Standard Terms to Principal for Approval

**Agent Definition:** Compile all escalation-flagged contract clauses from A12221, document company's fallback position versus counterparty's last position, and route to Principal as a Contract Exception Package requesting binary APPROVE (accept counterparty position) or REJECT (walk away / hold firm) per clause.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Escalation-Flagged Clauses | Open issues table from A12221 with clause text, company position, counterparty position, and risk assessment |
| C1 | Control | Principal Authority | Non-delegatable judgment for non-standard commercial risk positions |
| O1 | Output | Contract Exception Package with Principal Decision | Signed APPROVE/REJECT per flagged clause with timestamp; transmitted back to negotiation workflow |
| M1 | Mechanism | Team Messaging API | [MECH-MESSAGING] Slack API, Microsoft Teams — exception routing to Principal |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] Google Workspace — exception package and decision record |

**Binary Definition of Done:**
- ✓ Principal returns binary APPROVE or REJECT for each escalated clause within the requested decision deadline.
- ✓ Decisions are recorded in MECH-DOC with timestamp.
- ✓ Negotiation proceeds on APPROVE clauses only.

---

#### A1223: Execute Contract via Electronic Signature

**Function:** Execute Contract via Electronic Signature
**Supreme Constraint:** [ESIGN-ACT] 15 U.S.C. §7001 — electronic signatures legally equivalent

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Agreed Final Contract | Negotiated final draft with all open issues resolved from A1222 or A1221 |
| C1 | Control | Electronic Signature Law | [ESIGN-ACT] 15 U.S.C. §7001 — e-signatures legally equivalent; UETA state adoption |
| O1 | Output | Executed Contract Record | Fully signed contract in MECH-CLM with execution metadata (dates, signatory identities, envelope ID) |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — contract execution workflow |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign API, Adobe Sign, HelloSign |

**Child Nodes:** A12231, A12232, A12233

---

##### A12231: Prepare Execution Copy with All Schedules and Exhibits

**Agent Definition:** Assemble the final execution package by combining the base agreement with all schedules, exhibits, and attachments, verify internal approval (deal approval matrix from IF-A1-10 for customer contracts), and lock the document against further edits before routing for signature.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Final Agreed Contract | All negotiated clauses resolved; counterparty's last accepted redline version |
| I2 | Input | Deal Approval Confirmation | Finance A11 deal approval matrix confirmation (IF-A1-10) for customer contracts above approval threshold |
| C1 | Control | Deal Approval Authority | [CPQ-RULES] Internal deal approval authority matrix; discounts above threshold require CFO-equivalent sign-off (IF-A1-10) |
| O1 | Output | Locked Execution Package | Single PDF combining base agreement + all schedules + exhibits; edit-locked; version labeled "EXECUTION COPY" |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — document assembly and edit-lock |

**Binary Definition of Done:**
- ✓ MECH-CLM execution package contains base agreement + all referenced schedules/exhibits in a single document.
- ✓ Document version is labeled EXECUTION COPY.
- ✓ Edit-lock is confirmed.
- ✓ (For customer contracts) deal approval from IF-A1-10 is recorded.

---

##### A12232: Route Contract for Counterparty and Company E-Signature

**Agent Definition:** Load execution package into MECH-ESIGN, configure signing order (company signatory first, counterparty second, or concurrent per deal protocol), transmit to all signatories with 5-business-day deadline, and monitor completion status.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Locked Execution Package | A12231 output — edit-locked contract PDF |
| I2 | Input | Signatory List | Name, title, and e-signature identity for each required signatory (company and counterparty) |
| C1 | Control | Electronic Signature Validity | [ESIGN-ACT] 15 U.S.C. §7001 — electronic signatures valid; parties must have consent to e-signature process |
| O1 | Output | E-Signature Routing Confirmation | MECH-ESIGN envelope_id with signatory list, deadline timestamp, and per-signatory status (sent/viewed/signed) |
| M1 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign API, Adobe Sign — envelope creation and routing |

**Binary Definition of Done:**
- ✓ MECH-ESIGN envelope_id is generated.
- ✓ All required signatories appear with status "sent".
- ✓ Deadline timestamp is ≤ 5 business days from routing initiation.
- ✓ Counterparty consent to e-signature is confirmed.

---

##### A12233: Register Executed Contract in CLM with Obligation Metadata

**Agent Definition:** Retrieve fully executed contract from MECH-ESIGN, extract and register key obligation metadata (effective date, term end, renewal notice date, payment milestones, auto-renewal flag), load into MECH-CLM contract record, and confirm registration to business owner.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Fully Executed Contract | MECH-ESIGN completed envelope with all signatory completions and timestamps |
| C1 | Control | Revenue Recognition Trigger | [GAAP-ASC606] — contract execution triggers performance obligation identification; obligation metadata feeds Finance A11 revenue recognition schedule (IF-A0-09) |
| O1 | Output | CLM Contract Record | MECH-CLM record with: contract_id, counterparty_name, effective_date, term_end_date, renewal_notice_date, auto_renewal_flag, payment_milestones[], contract_value, business_owner |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — contract repository and metadata extraction |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — obligation extraction from contract text |

**Binary Definition of Done:**
- ✓ MECH-CLM contract_id is created.
- ✓ All 8 metadata fields are populated.
- ✓ Business_owner receives registration confirmation with contract_id.
- ✓ (For customer revenue contracts) contract metadata is transmitted to Finance A11 for ASC 606 schedule preparation (IF-A0-09).

---

#### A1224: Track Contract Obligations and Renewal Deadlines

**Function:** Track Contract Obligations and Renewal Deadlines
**Supreme Constraint:** [GAAP-ASC606] Revenue recognition obligation tracking | [UCC-2] §2-309 notice requirements

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | CLM Contract Records | All active contracts with obligation metadata; source: MECH-CLM (A12233 outputs) |
| C1 | Control | Notice Obligations | [UCC-2] §2-309 — reasonable notice required for termination of indefinite contracts; contract-specific notice periods |
| O1 | Output | Obligation Alert Reports | Automated alerts at 90-60-30-day intervals to business owners for renewals, milestones, and notice deadlines |
| O2 | Output | Contract Performance Report | Periodic summary of active contracts, upcoming deadlines, and obligation status |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] DocuSign CLM, Ironclad — obligation tracking and alert engine |

**Child Nodes:** A12241, A12242, A12243

---

##### A12241: Extract and Register Key Date Obligations in CLM System

**Agent Definition:** For each newly executed contract in MECH-CLM, parse the contract text to extract all date-bound obligations (notice periods, payment milestones, delivery deadlines, renewal windows, option exercise dates, audit rights windows) and register each as a structured obligation record with owner, due date, and action type.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed Contract Text | Full contract text from MECH-CLM contract record (A12233 output) |
| C1 | Control | Obligation Completeness | All date-bound obligations in the contract must be captured; omitted obligations constitute a contract management failure |
| O1 | Output | Obligation Register | MECH-CLM obligation records: {contract_id, obligation_type, due_date, notice_period_days, owner, action_type (notify/pay/deliver/exercise/escalate)} |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — obligation extraction and calendar registration |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — date and obligation extraction from contract text |

**Binary Definition of Done:**
- ✓ Obligation register contains one record per date-bound obligation in the contract.
- ✓ Each record has due_date, owner, and action_type populated.
- ✓ MECH-CLM confirms calendar alerts are scheduled.

---

##### A12242: Generate Obligation Alerts at 90-60-30-Day Intervals

**Agent Definition:** Query MECH-CLM obligation calendar daily, identify all obligations with due_date within 90 days, generate tiered alert notifications (90-day advisory, 60-day action notice, 30-day urgent escalation) and transmit to the obligation owner via MECH-MESSAGING.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Obligation Calendar | MECH-CLM query result: all obligations with due_date within 90 days |
| C1 | Control | Notice Period Compliance | Contract-specific notice periods; [UCC-2] §2-309 reasonable notice standard for indefinite contracts |
| O1 | Output | Tiered Alert Notifications | MECH-MESSAGING alerts: 90-day (advisory), 60-day (action required), 30-day (urgent) — each with obligation_type, contract_id, due_date, and required_action |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — alert engine and calendar query |
| M2 | Mechanism | Team Messaging API | [MECH-MESSAGING] Slack API, Microsoft Teams — alert delivery |

**Binary Definition of Done:**
- ✓ MECH-MESSAGING confirms delivery of alert for every obligation with due_date ≤ 90 days.
- ✓ Alert tier matches days-until-due (90d / 60d / 30d).
- ✓ No obligation with due_date ≤ 30 days lacks a sent urgent alert.

---

##### A12243: Produce Contract Performance Report for Business Owner Review

**Agent Definition:** Compile monthly contract performance report from MECH-CLM showing: all active contracts by owner, upcoming obligation deadlines in next 60 days, overdue obligations, contracts up for renewal within 6 months, and total contract value at risk from overdue items.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | CLM Active Contract Data | MECH-CLM full active contract registry with obligation status by contract |
| C1 | Control | Materiality Threshold | [GAAP-MATERIALITY] — contracts representing ≥5% of revenue flagged as high-priority in report |
| O1 | Output | Monthly Contract Performance Report | MECH-BI dashboard export with sections: (1) Active contract summary, (2) Upcoming obligations ≤60 days, (3) Overdue obligations, (4) Renewal pipeline ≤6 months, (5) Contract value at risk |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — report data export |
| M2 | Mechanism | Business Intelligence | [MECH-BI] Sigma, Tableau, Power BI — report rendering |

**Binary Definition of Done:**
- ✓ Report is generated monthly.
- ✓ Report contains all 5 sections.
- ✓ Overdue_obligations count is accurate (verified against MECH-CLM obligation status).
- ✓ High-priority contracts (≥5% revenue) are flagged.

---

#### A1225: Process Contract Renewal and Termination

**Function:** Process Contract Renewal and Termination
**Supreme Constraint:** [UCC-2] §2-309 | Contract-specific notice provisions

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Renewal/Termination Decision | Business owner's instruction to renew, non-renew, or terminate; source: A12242 alerts triggering decision |
| C1 | Control | Notice Requirements | Contract-specific renewal and termination notice periods; [UCC-2] §2-309 reasonable notice for indefinite contracts |
| O1 | Output | Executed Renewal or Termination | Signed renewal amendment or termination notice with effective date |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — renewal and termination workflow |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] — renewal amendment execution |

**Child Nodes:** A12251, A12252, A12253

---

##### A12251: Evaluate Renewal Terms and Options Exercise Window

**Agent Definition:** Retrieve contract renewal provisions from MECH-CLM, calculate the option exercise window (notice period start and deadline), compare proposed renewal terms against market benchmark and current deal approval authority, and produce a Renewal Decision Package for business owner.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Contract Record with Renewal Terms | MECH-CLM contract record showing: renewal_type (auto/manual/option), notice_period_days, renewal_term, renewal_price_escalation |
| C1 | Control | Option Exercise Deadline | Contract-specific notice period; [UCC-2] §2-309 — reasonable notice; failure to exercise within window may constitute waiver |
| O1 | Output | Renewal Decision Package | Document with: option exercise deadline, proposed renewal terms, delta from current terms, market comparison note, recommended action (renew/renegotiate/terminate) |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — renewal term extraction |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — renewal analysis |

**Binary Definition of Done:**
- ✓ Renewal Decision Package contains: exercise_deadline (specific date), proposed_renewal_terms, delta_from_current, and recommended_action.
- ✓ Package is delivered to business owner ≥ 30 days before exercise_deadline.

---

##### A12252: Issue Renewal or Non-Renewal Notice Within Required Notice Period

**Agent Definition:** Draft renewal acceptance or non-renewal notice per contract specifications, obtain authorized company signatory approval, and transmit to counterparty via the contractually required method (email, MECH-ESIGN, certified mail) before the notice deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Business Owner Renewal Decision | Binary decision: RENEW or NON-RENEW; received from A12251 review |
| I2 | Input | Notice Requirement | Contractually specified notice method, address, and deadline |
| C1 | Control | Notice Timing | Contract-specific notice period; [UCC-2] §2-309 — reasonable notice standard; late notice may cause unintended auto-renewal |
| O1 | Output | Transmitted Renewal or Non-Renewal Notice | Signed and transmitted notice with: delivery method, delivery date (must be ≤ notice deadline), counterparty confirmation of receipt |
| M1 | Mechanism | Electronic Signature | [MECH-ESIGN] — notice execution |
| M2 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — notice event logging |

**Binary Definition of Done:**
- ✓ Notice delivery_date ≤ contractual notice_deadline.
- ✓ Delivery method matches contractual specification.
- ✓ MECH-CLM logs notice event with delivery_date and delivery_method.

---

##### A12253: Execute Termination and Archive Final Agreement State

**Agent Definition:** Upon contract termination (expiry, non-renewal, or early termination), verify all outstanding obligations are resolved, close the contract record in MECH-CLM, archive the final executed agreement and all correspondence in MECH-CLM, and notify Finance A11 to close any related revenue recognition schedule.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Contract Termination Trigger | Expiry, executed termination notice, or mutual termination agreement |
| I2 | Input | Obligation Clearance Confirmation | Confirmation that all payment, delivery, and IP obligations under the contract are satisfied or settled |
| C1 | Control | Post-Termination Obligations | Contract-specific survival clauses (confidentiality, IP ownership, limitation of liability typically survive); [UCC-2] §2-720 survival of rights after breach |
| O1 | Output | Archived Terminated Contract Record | MECH-CLM record status changed to TERMINATED with: termination_date, termination_reason, surviving_obligations[], final_archive_location |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — contract close and archive |

**Binary Definition of Done:**
- ✓ MECH-CLM contract record status = TERMINATED.
- ✓ Termination_date is populated.
- ✓ Surviving_obligations[] contains all clauses identified as surviving in the agreement.
- ✓ Finance A11 receives notification to close revenue recognition schedule (if applicable).

---

#### A1226: Analyze and Invoke Force Majeure Clause

**Function:** Analyze and Invoke Force Majeure Clause
**Supreme Constraint:** [UCC-2] §2-615 Commercial Impracticability | [REST2-261] Restatement (Second) of Contracts §261

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Force Majeure Triggering Event Report | Description of event, onset date, expected duration, and affected contract obligations |
| I2 | Input | Contract Force Majeure Clause | Extracted clause text from MECH-CLM showing: triggering event definitions, notice requirements, duty to mitigate, restoration obligations |
| C1 | Control | Goods Contract Impracticability | [UCC-2] §2-615 — seller excused from delivery if occurrence of contingency whose non-occurrence was basic assumption of contract |
| C2 | Control | Services Contract Impracticability | [REST2-261] §261 — discharge by supervening impracticability if event not fault of obligor and non-occurrence was basic assumption |
| O1 | Output | Force Majeure Analysis Memo | Legal memo with: triggering event analysis, clause applicability determination (Y/N), notice requirements, mitigation obligations, recommended action |
| O2 | Output | Force Majeure Notices | Formal written notices to affected counterparties |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — clause extraction and force majeure event tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — force majeure analysis |

**Child Nodes:** A12261, A12262, A12263

---

##### A12261: Identify Triggering Event and Evaluate Clause Scope

**Agent Definition:** Receive triggering event description, extract the force majeure clause from MECH-CLM for each affected contract, analyze whether the event falls within the clause's defined triggering event categories, and produce a Clause Applicability Determination with yes/no finding and legal basis.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Triggering Event Description | Event type (natural disaster / government action / pandemic / war / supply chain failure), onset date, affected performance obligations, expected duration |
| I2 | Input | Force Majeure Clause Text | Contract-specific clause extracted from MECH-CLM: triggering event list (exhaustive or illustrative), foreseeability standard, exclusions |
| C1 | Control | Impracticability Standard | [UCC-2] §2-615 — three-part test: (1) contingency occurred, (2) non-occurrence was basic assumption, (3) seller did not assume greater obligation; [REST2-261] §261 — equivalent service contract test |
| O1 | Output | Clause Applicability Determination | Legal memo: triggering_event_in_clause (Y/N), legal_basis (UCC-2 §2-615 or REST2-261 §261), foreseeability_analysis, exclusions_applicable (Y/N), recommended_action |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — clause extraction |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — applicability analysis |

**Binary Definition of Done:**
- ✓ Determination memo contains triggering_event_in_clause (Y/N).
- ✓ Legal_basis cites a named code from ctrl-constraint-library.md.
- ✓ Foreseeability_analysis is present.
- ✓ Memo is completed within 1 business day of event report receipt.

---

##### A12262: Issue Force Majeure Notice to Counterparty Within Notice Period

**Agent Definition:** Draft formal force majeure notice per each affected contract's notice requirements (method, address, content), obtain authorized company signatory execution via MECH-ESIGN, and transmit to each counterparty before the contractual notice deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Clause Applicability Determination | A12261 output confirming triggering_event_in_clause = Y and affected contracts list |
| I2 | Input | Notice Requirements | Contractual notice: method (email/certified mail/overnight courier), address, deadline from event onset (commonly 5–10 business days) |
| C1 | Control | Force Majeure Notice Requirements | Contract-specific notice deadline; failure to provide timely notice typically waives the force majeure defense |
| O1 | Output | Transmitted Force Majeure Notices | Executed and delivered notice to each affected counterparty with: (a) event description, (b) affected obligations, (c) expected duration, (d) mitigation steps taken; delivery_date ≤ notice_deadline |
| M1 | Mechanism | Electronic Signature | [MECH-ESIGN] — notice execution |
| M2 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — notice event logging |

**Binary Definition of Done:**
- ✓ Force majeure notice delivery_date ≤ contractual notice_deadline for all affected contracts.
- ✓ MECH-CLM logs notice_sent event with delivery_date, delivery_method, and counterparty confirmation for each contract.

---

##### A12263: Document Performance Suspension and Monitor Restoration Conditions

**Agent Definition:** Record the performance suspension period in MECH-CLM for all affected contracts, document mitigation steps taken, monitor the triggering event for abatement, and produce a weekly status report until the event resolves and performance obligations resume.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Force Majeure Notice Confirmation | A12262 output confirming notices transmitted |
| I2 | Input | Weekly Event Status Update | Ongoing assessment of triggering event scope, duration, and abatement indicators |
| C1 | Control | Duty to Mitigate | [REST2-261] §261 comment d — party asserting impracticability must have made reasonable efforts to mitigate; [UCC-2] §2-615(a) — commercially reasonable substitute performance obligation |
| O1 | Output | Performance Suspension Record | MECH-CLM record per contract: suspension_start_date, suspended_obligations[], mitigation_steps_taken[], restoration_trigger_condition, weekly_status_log[] |
| O2 | Output | Restoration Notice (upon event resolution) | Formal notice to counterparty that force majeure event has abated and performance will resume on specified date |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — suspension tracking and status logging |
| M2 | Mechanism | Team Messaging API | [MECH-MESSAGING] — weekly status reports to business owner |

**Binary Definition of Done:**
- ✓ MECH-CLM suspension record exists for each affected contract with suspension_start_date and suspended_obligations[] populated.
- ✓ Weekly_status_log[] receives an entry each week until restoration_trigger_condition is met.
- ✓ Restoration notice is transmitted within 3 business days of event abatement.

---

**A122 Leaf Node Count:** 18 ✓

**Mandatory Inclusions — A122:**
- [x] ISDA Master Agreement negotiation parameters — A12222 (Negotiate ISDA Schedule and Credit Support Annex Parameters); all 5 Schedule Parts required; CSA with Threshold, MTA, IA, and eligible collateral
- [x] Force majeure clause invocation analysis — A1226 (A12261 clause scope evaluation, A12262 notice issuance within deadline, A12263 suspension documentation and restoration monitoring); [UCC-2] §2-615 + [REST2-261] §261
