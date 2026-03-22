# Skill File: Litigation & Dispute Resolution

**Node:** A126
**Parent:** A12 Legal
**Function:** Resolve Disputes and Execute Litigation Defense
**Supreme Constraint:** [FRCP-26] Federal Rules of Civil Procedure Rule 26 — discovery obligations and litigation hold | [AAA-COMM] AAA Commercial Arbitration Rules
**Cross-Function Interfaces:** (Inbound: IF-A1-01 from Finance A11; complaint/charge referrals from A1254, A1256) (Outbound: litigation hold notices affect all functions)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [x] eDiscovery legal hold notice issuance — satisfied at A1261 (A12611–A12613)

---

## Node Tree: A126

```
A126  Resolve Disputes and Execute Litigation Defense
├── A1261  Issue and Track eDiscovery Legal Hold Notices              [mandatory: eDiscovery Legal Hold]
│   ├── A12611  Identify Custodians and Issue Legal Hold Notice via MECH-LEGAL-HOLD
│   ├── A12612  Collect and Preserve Custodian Data with Chain-of-Custody Documentation
│   └── A12613  Monitor Hold Compliance and Release Hold upon Litigation Resolution
├── A1262  Engage and Manage Outside Counsel
│   ├── A12621  Select Outside Counsel via Panel Review and Issue Engagement Letter
│   ├── A12622  Establish Matter Budget and Litigation Strategy with Lead Counsel
│   └── A12623  Review and Approve Outside Counsel Invoices Against Budget
├── A1263  Execute Pre-Litigation Dispute Resolution
│   ├── A12631  Send Demand Letter and Evaluate Settlement Authority
│   ├── A12632  Conduct Mediation or Arbitration Proceeding
│   └── A12633  Document Settlement Agreement and Record Final Disposition
├── A1264  Produce Litigation Document Collection and Review
│   ├── A12641  Run ESI Search Query and Collect Responsive Documents
│   ├── A12642  Conduct Attorney-Client Privilege Review and Log Privilege Claims
│   └── A12643  Produce Document Set in Required Format to Opposing Counsel
├── A1265  Monitor Judgment Execution and Settlement Payment
│   ├── A12651  Calculate Judgment Amount with Interest Accrual
│   ├── A12652  Transmit Settlement Payment and Obtain Signed Release
│   └── A12653  File Satisfaction of Judgment and Close Matter Record
└── A1266  Escalate to Principal — Litigation Authorization
    ├── A12661  Prepare Litigation Risk Assessment with Exposure Range and Probability
    ├── A12662  Route Litigation Decision Package to Principal and Record Binary Approval
    └── A12663  Transmit Authorization to Outside Counsel and Update Matter Record
```

---

### A126: Resolve Disputes and Execute Litigation Defense

**Function:** Resolve Disputes and Execute Litigation Defense
**Supreme Constraint:** [FRCP-26] Fed. R. Civ. P. Rule 26 | [AAA-COMM] AAA Commercial Arbitration Rules

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Dispute and Claim Notices | Demand letters, complaints, NLRB charges, EEOC charges, arbitration demands; source: external parties, A1254, A1256 |
| I2 | Input | Legal Matter Referrals | Finance A11 referrals via IF-A1-01; HR referrals from People A13 |
| I3 | Input | Executed Settlement Authority | Principal-approved settlement ranges from A12662 |
| C1 | Control | Litigation Hold Obligation | [FRCP-26] Rule 26(b)(1) — relevance standard for discovery; Rule 37(e) — sanctions for failure to preserve ESI; Zubulake v. UBS Warburg (S.D.N.Y. 2003) — litigation hold duty arises when litigation is reasonably anticipated |
| C2 | Control | Arbitration Rules | [AAA-COMM] AAA Commercial Arbitration Rules — arbitrator selection, hearing procedures, award standards |
| C3 | Control | ESI Production Standards | Fed. R. Civ. P. Rule 34(b)(2)(E) — ESI produced in native format or reasonably usable form; [FRCP-26] Rule 26(f) meet-and-confer requirements |
| O1 | Output | Legal Hold Notices | Written holds issued to all relevant custodians |
| O2 | Output | Executed Settlement Agreements | Signed settlements with releases |
| O3 | Output | Document Productions | ESI productions to opposing counsel in court-ordered format |
| O4 | Output | Litigation Authorizations | Principal-approved litigation strategy decisions |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity, Everlaw, Nuix, Exterro |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] Clio, eCounsel, TeamConnect |
| M3 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI |

**Child Nodes:** A1261, A1262, A1263, A1264, A1265, A1266

---

#### A1261: Issue and Track eDiscovery Legal Hold Notices

**Function:** Issue and Track eDiscovery Legal Hold Notices
**Supreme Constraint:** [FRCP-26] Rule 37(e) — sanctions for ESI loss | Zubulake litigation hold standard

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Litigation or Investigation Trigger | Filed complaint, demand letter, regulatory investigation notice, employment complaint, or reasonable anticipation of litigation |
| I2 | Input | Custodian and Data Source Identification | Employees, contractors, and systems holding potentially relevant data |
| C1 | Control | Litigation Hold Duty | [FRCP-26] Rule 37(e) — sanctions including adverse inference instruction, dismissal, or default for failure to preserve ESI when litigation is reasonably anticipated; hold duty arises immediately upon trigger; Zubulake IV standard |
| O1 | Output | Issued Legal Hold Notices | Written hold notices to all custodians suspending normal document retention and destruction |
| O2 | Output | Hold Compliance Log | MECH-LEGAL-HOLD records of custodian acknowledgment and hold status |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity, Everlaw, Exterro — hold management and custodian notification |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — hold trigger and matter cross-reference |

**Child Nodes:** A12611, A12612, A12613

---

##### A12611: Identify Custodians and Issue Legal Hold Notice via MECH-LEGAL-HOLD

**Agent Definition:** Upon litigation trigger, identify all employees and systems likely to hold potentially relevant documents (key players, witnesses, decision-makers, and system owners for relevant time period), create hold matter in MECH-LEGAL-HOLD, and issue written legal hold notices to all identified custodians within 48 hours of trigger.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Litigation Trigger Description | Trigger type (complaint filed / demand letter / investigation notice), claims summary, relevant time period, key parties |
| C1 | Control | Litigation Hold Standard | [FRCP-26] Rule 37(e) — "reasonable steps to preserve" ESI must begin when litigation reasonably anticipated; Zubulake IV — litigation hold notice must be "written and periodically re-sent"; routine document destruction must halt |
| O1 | Output | Issued Legal Hold Notices | MECH-LEGAL-HOLD hold_id with: trigger_date, custodian_list[], notice_sent_timestamp per custodian, relevant_time_period, data_sources_to_preserve[], hold_instructions (suspend all deletion/overwriting of potentially relevant data) |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity, Everlaw, Exterro — hold creation and custodian notification |

**Binary Definition of Done:**
- ✓ MECH-LEGAL-HOLD hold_id created.
- ✓ Notice_sent_timestamp ≤ 48 hours from trigger_date for all custodians.
- ✓ Data_sources_to_preserve[] lists all systems holding potentially relevant data.
- ✓ Hold_instructions explicitly suspend routine deletion.
*(eDiscovery mandatory inclusion satisfied at this node)*

---

##### A12612: Collect and Preserve Custodian Data with Chain-of-Custody Documentation

**Agent Definition:** For each custodian identified in A12611, collect and forensically preserve potentially relevant ESI from designated data sources (email, cloud storage, laptops, mobile devices, collaboration tools) using MECH-LEGAL-HOLD forensic collection, and create a chain-of-custody log for every collected data set.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Legal Hold Notice with Custodian List | A12611 output — hold_id, custodian_list[], data_sources_to_preserve[] |
| C1 | Control | ESI Preservation Standard | [FRCP-26] Rule 34(a)(1) — ESI includes emails, documents, data stored in any medium; collection must be forensically sound (hash verification) to ensure admissibility |
| O1 | Output | Preserved ESI Collection with Chain of Custody | MECH-LEGAL-HOLD collection record per custodian: {custodian_id, data_source, collection_date, collection_method, hash_value (MD5/SHA-256), custodian_of_record, chain_of_custody_log[]} |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity, Everlaw — forensic collection and hash verification |

**Binary Definition of Done:**
- ✓ MECH-LEGAL-HOLD shows collection record for every custodian in custodian_list[].
- ✓ Each record includes hash_value for integrity verification.
- ✓ Chain_of_custody_log has an entry for every transfer of the collected data.

---

##### A12613: Monitor Hold Compliance and Release Hold upon Litigation Resolution

**Agent Definition:** Send monthly hold reminder notices to all active custodians; quarterly audit hold compliance (confirm custodians have not deleted or destroyed held data); when litigation resolves, obtain CLO authorization and release the hold by issuing a written hold release notice to all custodians and closing the MECH-LEGAL-HOLD matter.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Active Legal Hold Record | MECH-LEGAL-HOLD active hold_id with custodian list and last reminder timestamps |
| C1 | Control | Ongoing Hold Obligation | [FRCP-26] Rule 37(e) — hold obligation continues until litigation is finally resolved; Zubulake IV — monthly reminder notices best practice; premature release exposes to sanctions |
| O1 | Output | Hold Compliance Audit Reports | Quarterly report: {hold_id, custodian, compliance_status (compliant/non-compliant), data_integrity_verified (Y/N), hold_status (active/released)} |
| O2 | Output | Hold Release Notice (upon resolution) | Written release notice to all custodians; MECH-LEGAL-HOLD matter status changed to CLOSED; date of release logged |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] — hold management, reminder engine, and compliance tracking |

**Binary Definition of Done:**
- ✓ Monthly reminder notices are sent to all active custodians.
- ✓ Quarterly compliance audit covers 100% of custodians.
- ✓ Hold release requires CLO_authorization = Y.
- ✓ MECH-LEGAL-HOLD matter status = CLOSED with release_date logged.

---

#### A1262: Engage and Manage Outside Counsel

**Function:** Engage and Manage Outside Counsel
**Supreme Constraint:** ABA Model Rules of Professional Conduct Rule 1.6 (confidentiality) | Matter budget governance

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Matter Scope and Litigation Authorization | Litigation authorization from A12662; matter type, jurisdiction, estimated exposure |
| C1 | Control | Attorney-Client Privilege | Attorney-client communications and attorney work product are privileged; engagement letter must establish scope to preserve privilege |
| O1 | Output | Engaged Outside Counsel | Signed engagement letter with defined scope, billing rates, and budget |
| O2 | Output | Approved Invoices | Reviewed and approved outside counsel invoices within budget |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — outside counsel management and invoice tracking |

**Child Nodes:** A12621, A12622, A12623

---

##### A12621: Select Outside Counsel via Panel Review and Issue Engagement Letter

**Agent Definition:** For matters requiring outside counsel, evaluate ≥2 firms against selection criteria (subject matter expertise, jurisdiction experience, billing rates, conflict check), select the preferred firm, and issue a signed engagement letter defining: scope, billing rates, staffing, reporting cadence, and budget authorization level.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Matter Specification | Matter type, jurisdiction, estimated exposure range, timeline, key legal issues |
| C1 | Control | Conflicts Check | ABA Model Rule 1.7 — firm must confirm no conflicts of interest before engagement; conflicts waiver required if conflict exists and parties consent |
| O1 | Output | Signed Outside Counsel Engagement Letter | Engagement letter in MECH-MATTER: {firm_name, matter_id, scope_of_work, billing_rates_by_timekeeper, staffing_plan, budget_ceiling, reporting_cadence, conflicts_cleared (Y), governing_law} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — engagement letter archive |

**Binary Definition of Done:**
- ✓ Engagement letter is signed by both parties.
- ✓ Conflicts_cleared = Y.
- ✓ Budget_ceiling is specified.
- ✓ MECH-MATTER stores the signed letter under the matter_id.

---

##### A12622: Establish Matter Budget and Litigation Strategy with Lead Counsel

**Agent Definition:** With outside lead counsel, establish a phased litigation budget (initial pleadings, discovery, motions, trial), agree on litigation strategy (key defenses, discovery priorities, motion schedule), document in a Matter Strategy Plan, and load the phased budget into MECH-MATTER for invoice tracking.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Matter Facts and Engagement Letter | Trigger facts, complaint, engagement letter with billing rates and scope |
| C1 | Control | Budget Governance | Internal matter budget policy — budget must be approved by CLO for matters >$25K; revised budget required if actual spend tracks to exceed approved budget by >20% |
| O1 | Output | Matter Strategy Plan with Phased Budget | MECH-MATTER record: {matter_id, key_defenses[], discovery_priorities[], motion_schedule[], trial_timeline (if applicable), phased_budget: {phase, budget_amount, budget_period}} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — matter strategy and budget entry |

**Binary Definition of Done:**
- ✓ MECH-MATTER shows phased_budget with amount per phase.
- ✓ Key_defenses[] and discovery_priorities[] are documented.
- ✓ CLO approval is recorded for matters above budget threshold.

---

##### A12623: Review and Approve Outside Counsel Invoices Against Budget

**Agent Definition:** Review all outside counsel invoices line-by-line against engagement letter billing rates, staffing plan, and phased budget; approve invoice within 30 days for items within budget; flag and dispute non-compliant line items (block-billing, excessive hours, out-of-scope work); transmit approved amount for Finance A11 payment processing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Outside Counsel Invoice | Invoice with: matter_id, billing_period, timekeepers, hours, rates, activities, total amount |
| C1 | Control | Invoice Review Standard | ABA Guidelines for Litigation Management — block-billing (combining multiple tasks in single time entry) is presumptively non-compliant; invoices must reconcile to engagement letter rates |
| O1 | Output | Reviewed Invoice with Approval Status | MECH-MATTER invoice record: {invoice_id, total_billed, total_approved, total_disputed, dispute_reasons[], approved_amount, transmitted_to_finance (Y/N)} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — invoice tracking and approval workflow |

**Binary Definition of Done:**
- ✓ MECH-MATTER invoice record shows approved_amount and total_disputed for every line item.
- ✓ Transmitted_to_finance = Y for approved amount.
- ✓ Budget_vs_actual tracking shows cumulative spend vs. phased_budget by phase.

---

#### A1263: Execute Pre-Litigation Dispute Resolution

**Function:** Execute Pre-Litigation Dispute Resolution
**Supreme Constraint:** [AAA-COMM] AAA Commercial Arbitration Rules | [UCC-2] §2-718 liquidated damages

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Dispute Trigger | Demand letter, breach of contract claim, or pre-litigation dispute requiring resolution |
| I2 | Input | Settlement Authority | Principal-approved settlement range from A12662 |
| C1 | Control | Arbitration Obligation | Contract-specific arbitration clause — if applicable, dispute must go to arbitration per [AAA-COMM] rules rather than litigation |
| O1 | Output | Resolved Dispute | Executed settlement agreement, arbitration award, or mediation settlement |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — dispute resolution file |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — demand letter and settlement analysis |

**Child Nodes:** A12631, A12632, A12633

---

##### A12631: Send Demand Letter and Evaluate Settlement Authority

**Agent Definition:** For pre-litigation disputes, draft and transmit a demand letter specifying: legal basis, claimed damages with supporting calculation, demand amount, and response deadline (typically 14–30 days); simultaneously obtain Principal authorization for settlement authority range (from A12662); and evaluate counterparty's response against the authorized range.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Dispute Facts and Damages Assessment | Legal basis for claim, supporting documents, damages calculation (actual damages, consequential damages, interest accrual) |
| C1 | Control | Liquidated Damages | [UCC-2] §2-718 — liquidated damages clause enforceable if reasonable estimate of actual harm; punitive damages generally not available in contract disputes |
| O1 | Output | Transmitted Demand Letter | Written demand: legal_basis, damages_calculation, demand_amount, response_deadline (14–30 days), reservation of rights; delivery_confirmation logged in MECH-MATTER |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — demand letter drafting |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — demand letter and response tracking |

**Binary Definition of Done:**
- ✓ Demand letter contains legal_basis, damages_calculation, and response_deadline.
- ✓ Delivery_confirmation is logged in MECH-MATTER.
- ✓ Settlement authority range is obtained from A12662 before evaluating counterparty response.

---

##### A12632: Conduct Mediation or Arbitration Proceeding

**Agent Definition:** For disputes requiring formal ADR (contract-mandated arbitration or mutually agreed mediation), file the demand or initiation with the applicable forum (AAA, JAMS, or court-appointed mediator), prepare position papers and evidence submissions, attend proceedings, and receive and analyze the mediator recommendation or arbitration award.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | ADR Forum Designation | Contract arbitration clause (specifying AAA, JAMS, or other forum) or mutual agreement to mediate |
| I2 | Input | Evidence and Position Package | Demand letter, counterparty response, collected documents, witness list, damages calculation |
| C1 | Control | Arbitration Procedural Rules | [AAA-COMM] AAA Commercial Arbitration Rules — arbitrator selection (R-11 to R-15), hearing procedures (R-32 to R-37), award (R-46 to R-48); award is final and binding; enforcement under FAA 9 U.S.C. §9 |
| O1 | Output | Arbitration Award or Mediation Settlement | Arbitrator's written award (binding) OR signed mediation settlement term sheet (enforceable as contract) |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — ADR proceeding file |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — position paper drafting and award analysis |

**Binary Definition of Done:**
- ✓ MECH-MATTER records ADR_type, forum, filing_date, hearing_date, and outcome (award_amount or settlement_terms).
- ✓ Arbitration award is signed by arbitrator.
- ✓ Mediation settlement is executed by all parties.

---

##### A12633: Document Settlement Agreement and Record Final Disposition

**Agent Definition:** Draft and execute a settlement agreement (if pre-arbitration settlement reached), including: mutual release of claims, confidentiality clause, payment schedule, and non-admission of liability; obtain Principal authorization via A12662 if settlement exceeds threshold; record final disposition in MECH-MATTER and notify Finance A11 for payment processing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Agreed Settlement Terms | Negotiated terms: settlement_amount, payment_schedule, release_scope, confidentiality_terms, non-admission_clause |
| C1 | Control | Release Validity | General release extinguishes all claims arising from the dispute; [ADEA] settlements require OWBPA-compliant release for age discrimination claims (45-day review, 7-day revocation) |
| O1 | Output | Executed Settlement Agreement | Signed agreement in MECH-MATTER: {matter_id, settlement_amount, payment_due_date, release_scope (claims released), confidentiality_flag, non_admission_clause, all_signatures_present} |
| O2 | Output | Finance A11 Payment Notice | Notification to Finance A11 with payment_amount and payment_due_date |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — settlement agreement archive |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] — settlement execution |

**Binary Definition of Done:**
- ✓ MECH-MATTER contains executed settlement agreement with all_signatures_present.
- ✓ Finance A11 receives payment notice with payment_due_date.
- ✓ (if ADEA claims) OWBPA-compliant review and revocation periods are documented.

---

#### A1264: Produce Litigation Document Collection and Review

**Function:** Produce Litigation Document Collection and Review
**Supreme Constraint:** [FRCP-26] Rule 34(b)(2)(E) ESI production | Attorney-client privilege

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Discovery Requests | Opposing counsel's Rule 34 document requests or subpoenas; court-ordered discovery scope |
| I2 | Input | Preserved ESI Collection | A12612 forensically collected ESI from MECH-LEGAL-HOLD |
| C1 | Control | Discovery Scope | [FRCP-26] Rule 26(b)(1) — discovery of nonprivileged matters relevant to any party's claim or defense and proportional to needs of case |
| C2 | Control | ESI Production Format | [FRCP-26] Rule 34(b)(2)(E) — ESI produced in native format or reasonably usable form unless stated; metadata preserved unless parties agree otherwise |
| O1 | Output | Document Production | Responsive documents produced in court-ordered format with privilege log |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity, Everlaw, Nuix — ESI processing, review, and production |

**Child Nodes:** A12641, A12642, A12643

---

##### A12641: Run ESI Search Query and Collect Responsive Documents

**Agent Definition:** Receive discovery request, develop search terms and date range filters in consultation with outside counsel, run queries against the preserved ESI collection in MECH-LEGAL-HOLD, deduplicate results, and generate a hit count report for proportionality analysis before full collection.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Rule 34 Document Request | Opposing counsel's requests with: request categories, relevant time period, and any format specifications |
| I2 | Input | Preserved ESI Collection | MECH-LEGAL-HOLD collection from A12612 |
| C1 | Control | Proportionality Standard | [FRCP-26] Rule 26(b)(1) — discovery proportional to needs of case considering: amount in controversy, importance of issues, parties' resources, relative access to information, burden vs. benefit |
| O1 | Output | ESI Query Results with Hit Count Report | MECH-LEGAL-HOLD query result: {search_terms[], date_range, total_hits, deduplicated_hits, responsive_collection_size_GB, custodian_breakdown} |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity — search query and hit report |

**Binary Definition of Done:**
- ✓ Query results include deduplicated_hits count.
- ✓ Hit count report is shared with outside counsel before full review begins.
- ✓ Search_terms[] are documented for meet-and-confer disclosure if requested by opposing counsel.

---

##### A12642: Conduct Attorney-Client Privilege Review and Log Privilege Claims

**Agent Definition:** Review each document in the responsive collection for attorney-client privilege (confidential communication between attorney and client for legal advice), attorney work product protection (documents prepared in anticipation of litigation), and responsiveness; code each document; and generate a privilege log for all withheld documents.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Responsive ESI Collection | A12641 query results — deduplicated responsive document set in MECH-LEGAL-HOLD |
| C1 | Control | Attorney-Client Privilege | FRE 501 — attorney-client privilege protects confidential communications between attorney and client made for purpose of legal advice; privilege waived by voluntary disclosure to third parties |
| C2 | Control | Work Product Doctrine | [FRCP-26] Rule 26(b)(3) — documents prepared in anticipation of litigation protected from discovery; opinion work product (attorney mental impressions) has near-absolute protection |
| O1 | Output | Coded Document Set with Privilege Log | MECH-LEGAL-HOLD review coding: {responsive_flag, privilege_code (AC/WP/none), responsiveness_code (responsive/non-responsive/redact)} + privilege log: {document_id, date, author, recipients, privilege_basis, subject_matter_description} |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity, Everlaw — document review and coding platform |

**Binary Definition of Done:**
- ✓ Every document in responsive collection has responsive_flag and privilege_code set.
- ✓ Privilege log entry exists for every withheld document.
- ✓ Privilege log contains all required fields (no subject_matter_description field may be blank).

---

##### A12643: Produce Document Set in Required Format to Opposing Counsel

**Agent Definition:** Export all responsive, non-privileged documents from MECH-LEGAL-HOLD in the court-ordered or agreed production format (TIFF/native/PDF with load files), Bates-stamp each document, apply redactions to privilege or personal data, transmit production to opposing counsel via secure file transfer, and log production volume and Bates range in MECH-MATTER.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Coded Document Set | A12642 output — responsive, non-privileged documents coded for production |
| C1 | Control | Production Format | [FRCP-26] Rule 34(b)(2)(E) — native format required unless agreed otherwise; Bates numbering is convention (not required by rule but standard practice); redactions of privileged content and personal data per applicable law |
| O1 | Output | Document Production Package | Transmittal letter + production files (Bates-numbered): {production_id, bates_range_start, bates_range_end, document_count, total_pages, format, transmittal_date, opposing_counsel_receipt_confirmation} |
| M1 | Mechanism | Legal Hold and eDiscovery | [MECH-LEGAL-HOLD] Relativity, Nuix — production export with Bates stamping |

**Binary Definition of Done:**
- ✓ MECH-MATTER production log shows bates_range and document_count.
- ✓ Transmittal_date is on or before court-ordered production deadline.
- ✓ Opposing_counsel_receipt_confirmation is logged.

---

#### A1265: Monitor Judgment Execution and Settlement Payment

**Function:** Monitor Judgment Execution and Settlement Payment
**Supreme Constraint:** State judgment enforcement law | Contract payment terms

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Judgment or Settlement Agreement | Court-entered judgment with amount and interest rate, or executed settlement agreement with payment schedule |
| C1 | Control | Judgment Interest | State-specific post-judgment interest rate (federal rate: 28 U.S.C. §1961 — weekly average 1-year Treasury yield); interest accrues from date of judgment entry |
| O1 | Output | Satisfied Judgment or Settlement Payment Record | Satisfaction of judgment filed with court; payment receipt from Finance A11 |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — judgment and payment tracking |

**Child Nodes:** A12651, A12652, A12653

---

##### A12651: Calculate Judgment Amount with Interest Accrual

**Agent Definition:** Receive court-entered judgment or settlement payment obligation, calculate the total amount due including post-judgment interest accrued from judgment entry date to anticipated payment date, and transmit payment authorization to Finance A11 for fund preparation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Judgment or Settlement Payment Obligation | Principal amount, judgment_entry_date (for judgments) or payment_due_date (for settlements), interest rate |
| C1 | Control | Post-Judgment Interest | [28 U.S.C. §1961] — federal court judgments accrue interest at weekly average 1-year constant maturity Treasury yield from date of judgment; state court: state-specific rate |
| O1 | Output | Payment Authorization | Finance A11 notification: {matter_id, payment_type (judgment/settlement), principal_amount, interest_accrued, total_due, payment_due_date, payee_wire_instructions} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — judgment tracking |
| M2 | Mechanism | Business Intelligence | [MECH-BI] — interest calculation |

**Binary Definition of Done:**
- ✓ Payment authorization contains principal_amount + interest_accrued = total_due.
- ✓ Payment_due_date is on or before judgment satisfaction deadline.
- ✓ Finance A11 receives authorization at least 5 business days before payment_due_date.

---

##### A12652: Transmit Settlement Payment and Obtain Signed Release

**Agent Definition:** Confirm Finance A11 has prepared the payment per A12651; transmit payment to opposing party or plaintiff via the agreed payment method (wire transfer, check); upon payment confirmation, obtain a signed mutual release or Satisfaction of Judgment form from the receiving party.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Finance A11 Payment Confirmation | Wire transfer confirmation or check number with transmission date |
| I2 | Input | Settlement Agreement or Judgment | Executed settlement or court judgment specifying payment_amount and release terms |
| C1 | Control | Release Requirement | Settlement agreement release clause — payment is conditioned on execution of mutual release; release extinguishes all settled claims |
| O1 | Output | Signed Release or Satisfaction | Executed release (for settlements) or signed Satisfaction of Judgment form (for judgments), archived in MECH-MATTER |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — payment and release record |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] — release execution |

**Binary Definition of Done:**
- ✓ MECH-MATTER contains payment_confirmation and signed_release (or satisfaction_of_judgment).
- ✓ Release is executed by authorized counterparty representative.
- ✓ Payment_amount matches settlement_amount or total_due from A12651.

---

##### A12653: File Satisfaction of Judgment and Close Matter Record

**Agent Definition:** For court-entered judgments, file the executed Satisfaction of Judgment with the clerk of the originating court, obtain file-stamped confirmation, archive in MECH-MATTER, and close the matter record marking all obligations satisfied.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Satisfaction of Judgment | Signed Satisfaction form from plaintiff and proof of payment from A12652 |
| C1 | Control | Filing Obligation | State court rules — Satisfaction of Judgment must be filed with the court to clear the judgment lien from public record; failure to file may impair debtor's credit and property title |
| O1 | Output | Filed Satisfaction with Court Confirmation | Court file-stamp confirmation of Satisfaction of Judgment + MECH-MATTER matter status = CLOSED with close_date |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — matter closure |

**Binary Definition of Done:**
- ✓ Court returns file-stamped Satisfaction of Judgment.
- ✓ MECH-MATTER matter status = CLOSED.
- ✓ Close_date is populated.
- ✓ Finance A11 receives notification of matter closure for liability clearance.

---

#### A1266: Escalate to Principal — Litigation Authorization

**Function:** Escalate to Principal — Litigation Authorization
**Supreme Constraint:** Non-delegatable Principal judgment on litigation risk and settlement authority

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Dispute or Claim Requiring Authorization | Litigation decision (file suit / defend / settle), settlement demand, or material litigation strategy choice |
| C1 | Control | Principal Sovereignty | Litigation carries financial, reputational, and strategic consequences non-delegatable to agents; settlement authority requires explicit Principal approval |
| O1 | Output | Signed Principal Authorization | Binary decision with settlement authority range (if applicable) and litigation direction |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — authorization record |
| M2 | Mechanism | Team Messaging API | [MECH-MESSAGING] — Principal escalation |

**Child Nodes:** A12661, A12662, A12663

---

##### A12661: Prepare Litigation Risk Assessment with Exposure Range and Probability

**Agent Definition:** Compile all available facts, claim analysis, relevant precedent, and damages calculation into a Litigation Risk Assessment specifying: claim-by-claim merit assessment, probability of adverse outcome (%), damages exposure range (low/mid/high), litigation cost estimate (phased), time-to-resolution estimate, and strategic alternatives (settle / defend / countersue).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Claim Facts and Legal Analysis | Complaint or demand letter facts, legal research on claim merits, damages calculation, comparable settlement data |
| C1 | Control | Risk Assessment Standard | Expected value analysis: EV = P(adverse) × damages_exposure; comparison of EV to litigation_cost_estimate determines settlement zone |
| O1 | Output | Litigation Risk Assessment | MECH-MATTER document: {matter_id, claims[], per_claim_merit_assessment[], probability_adverse_outcome_pct, damages_exposure (low/mid/high), litigation_cost_estimate_phased, time_to_resolution, strategic_alternatives[] (settle/defend/countersue with EV per alternative)} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — risk assessment and expected value analysis |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — risk assessment archive |

**Binary Definition of Done:**
- ✓ Risk assessment contains probability_adverse_outcome_pct, damages_exposure (low/mid/high), litigation_cost_estimate_phased, and ≥2 strategic_alternatives[] with EV per alternative.
- ✓ Assessment is completed within 5 business days of dispute trigger.

---

##### A12662: Route Litigation Decision Package to Principal and Record Binary Approval

**Agent Definition:** Transmit the Litigation Risk Assessment as a Principal Decision Package via MECH-MESSAGING requesting binary decisions: (a) DEFEND or SETTLE, (b) if SETTLE: authorized settlement range (floor and ceiling), (c) outside counsel engagement authorization; record Principal's decisions with timestamp.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Litigation Risk Assessment | A12661 output — complete risk assessment with EV analysis |
| C1 | Control | Principal Authority | Litigation authorization is non-delegatable; settlement authority range must be explicit — agents may not settle without stated authorization |
| O1 | Output | Signed Principal Litigation Decisions | MECH-MATTER record: {decision_defend_or_settle, settlement_authority_floor, settlement_authority_ceiling, outside_counsel_authorized (Y/N), decision_timestamp, principal_signature} |
| M1 | Mechanism | Team Messaging API | [MECH-MESSAGING] — Principal decision routing |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — decision record |

**Binary Definition of Done:**
- ✓ Principal returns decision_defend_or_settle.
- ✓ (if SETTLE is option) settlement_authority_floor and settlement_authority_ceiling are specified.
- ✓ Decision_timestamp is recorded.
- ✓ Outside_counsel_authorized flag is set.
- ✓ All decisions are in MECH-MATTER before any litigation or settlement action is taken.

---

##### A12663: Transmit Authorization to Outside Counsel and Update Matter Record

**Agent Definition:** Transmit Principal's litigation direction and settlement authority to outside lead counsel via MECH-MATTER with binding authority instructions; update the MECH-MATTER strategy record to reflect authorized direction; and confirm outside counsel acknowledges the authorization parameters in writing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Principal Litigation Decisions | A12662 output — authorized strategy direction and settlement ceiling/floor |
| C1 | Control | Agency Authority Limitation | Outside counsel acts as agent; settlement authority limited to Principal-approved range; any settlement above ceiling requires new A12662 authorization before execution |
| O1 | Output | Authorization Transmission Confirmation | MECH-MATTER record: {matter_id, authorization_transmitted_date, outside_counsel_acknowledgment (Y/N), authorized_strategy, settlement_authority_range, next_milestone} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — authorization transmission and matter update |

**Binary Definition of Done:**
- ✓ MECH-MATTER shows authorization_transmitted_date.
- ✓ Outside_counsel_acknowledgment = Y.
- ✓ Authorized_strategy and settlement_authority_range are documented in matter record.
- ✓ Outside counsel acknowledges in writing that settlement requires Principal approval above ceiling.

---

**A126 Leaf Node Count:** 18 ✓

**Mandatory Inclusions — A126:**
- [x] eDiscovery legal hold notice issuance — A1261 (A12611: hold issued within 48 hours of trigger via MECH-LEGAL-HOLD with custodian list and data_sources_to_preserve; A12612: forensic collection with hash verification and chain-of-custody; A12613: monthly reminder notices, quarterly compliance audit, CLO-authorized release); [FRCP-26] Rule 37(e) + Zubulake IV fully applied
