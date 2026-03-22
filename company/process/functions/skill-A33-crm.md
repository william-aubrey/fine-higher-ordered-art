---
node: A33
name: Customer Relationship Management
sprint: SPR-013
status: Draft
date: 2026-03-12
---

# Skill File: Customer Relationship Management

**Node:** A33
**Parent:** A3 Sales
**Function:** Convert Qualified Leads into Contracted Customers and Deliver Post-Sale Success to Generate Renewal and Expansion Revenue
**Supreme Constraint:** Contract law (UCC Art. 2 for goods; common law for services); GDPR; Deal Approval Authority Matrix from Finance A11
**Cross-Function Interfaces:** IF-A0-09, IF-A1-10, IF-A0-10 (new — commission payout to Payroll)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:** CPQ rules engine (A33131); Commission SPiFF (A33151, A33152); Revenue recognition event logging (A33143); Customer health score (A33161)

---

## ICOM

| Code | Role | Label |
|---|---|---|
| I1 | Input | Leads [qualified MQL contacts — from Marketing Channels A32] |
| I2 | Input | Contacts [existing customer / prospect database in MECH-CRM] |
| I3 | Input | Products / Services [available inventory and delivery capacity — from Production A2 via IF-A0-08] |
| C1 | Control | [SALES-PLAYBOOK] Sales Playbook / Process [internal — defines stages, exit criteria, activity cadences] |
| C2 | Control | [CPQ-RULES] Deal Approval Authority Matrix [from Finance A11 via IF-A1-10 — discount tiers, approval levels] |
| C3 | Control | [CONTRACT-TEMPLATE] Contract Templates [from Legal A12 — approved standard form agreements] |
| C4 | Control | [COMMISSION-PLAN] Commission Plan [from Finance A11 / People A13 — payout structure by deal type] |
| C5 | Control | [UCC-2] UCC Article 2 — Sale of Goods [governs product sale contracts] |
| C6 | Control | [GDPR-ART6] GDPR Art. 6 — Lawful Basis [customer data processing must have documented lawful basis] |
| M1 | Mechanism | MECH-CRM (HubSpot CRM, Salesforce, Pipedrive) |
| M2 | Mechanism | MECH-CPQ (Salesforce CPQ, DealHub, HubSpot Quotes) |
| M3 | Mechanism | MECH-ESIGN (DocuSign, Adobe Sign) |
| M4 | Mechanism | MECH-EMAIL-API (Gmail / Outlook — sales email) |
| M5 | Mechanism | MECH-VIDEO (Zoom — customer meetings) |
| O1 | Output | Deals (Contracts, Revenue) [executed contracts → Finance A11 via IF-A0-09] |
| O2 | Output | Happy Customers [→ A-0 boundary O1] |
| O3 | Output | Customer Feedback [→ Brand & Product Mgmt A31] |

---

### Boundary Arrow Correspondence (A33)

| A33 Output | Produced By | Notes |
|---|---|---|
| O1 Deals (Contracts, Revenue) | A334.O1, A334.O2 | Executed contracts (A334.O1) and revenue recognition event log (A334.O2) constitute the Deals output; A331→A332→A333 feed into A334 but do not produce the boundary output independently |
| O2 Happy Customers | A336 (A33161–A33163) | Customer success execution (health scores, QBRs, renewals) produces the A-0 boundary output "Happy Customers"; renewal + expansion revenue is captured within this output |
| O3 Customer Feedback | A336.O4 | Verbatim product feedback captured in QBRs (A33162) is routed to Brand & Product Mgmt A31 |

---

## Decomposition

### A331 — Qualify Inbound Leads and Assign to Pipeline Stage

**Purpose:** Score inbound leads against the ICP, create qualified CRM opportunity records with MEDDIC fields, and route disqualified leads back to nurture.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Inbound leads [from Marketing A32 — form fills, event captures, ad conversions with campaign tags] |
| I2 | Input | ICP criteria [from A31121 — firmographic and JTBD qualification criteria] |
| C1 | Control | [SALES-PLAYBOOK] Sales Playbook [MQL → SQL qualification criteria; MEDDIC or equivalent scoring model] |
| C2 | Control | [GDPR-ART6] CRM contact creation requires documented lawful basis |
| M1 | Mechanism | MECH-CRM (HubSpot, Salesforce — lead scoring and pipeline management) |
| M2 | Mechanism | MECH-MAP (HubSpot, Marketo — nurture re-enrollment) |
| O1 | Output | Qualified Opportunity Records [CRM opportunities with MEDDIC fields populated] |
| O2 | Output | Disqualified Lead Disposition [leads returned to nurture with reason code] |

#### Leaf Nodes

**A33111 — Score and Filter Inbound Leads Against Ideal Customer Profile Criteria**

| ICOM | Content |
|---|---|
| Input | Inbound lead list with campaign source, form data, and firmographic enrichment |
| Control | [SALES-PLAYBOOK] ICP scoring rubric: industry match (0/1), company size match (0/1), JTBD signal (0/1/2), buying authority (0/1/2); MQL threshold = ≥4/6 |
| Output | Scored lead list: each lead with ICP score, MQL/Not-MQL flag, disqualification reason if applicable |
| Mechanism | [MECH-CRM] HubSpot or Salesforce lead scoring; [MECH-MAP] enrichment data |

**Binary Definition of Done:**
- ✓ Every inbound lead has an ICP score with documented values for all four scoring dimensions.
- ✓ Every lead is flagged as MQL or Not-MQL with a decision rationale.
- ✓ Zero leads remain unscored more than 24 hours after inbound receipt.

---

**A33112 — Assign Qualified Leads to Sales Rep and Create CRM Opportunity Record**

| ICOM | Content |
|---|---|
| Input | Scored lead list (MQL-flagged); sales territory assignment rules; MEDDIC field template |
| Control | [SALES-PLAYBOOK] [territory rules, round-robin assignment logic; MEDDIC fields M=Metrics, E=Economic Buyer, D=Decision Criteria, D=Decision Process, I=Identify Pain, C=Champion] |
| Output | CRM opportunity record: company, contact, pipeline stage = "Qualified", assigned owner, MEDDIC fields populated (at least M and I), campaign source tag, close date estimate |
| Mechanism | [MECH-CRM] HubSpot or Salesforce (opportunity creation) |

**Binary Definition of Done:**
- ✓ CRM opportunity record is created for every MQL-flagged lead with all required fields: company, contact, pipeline stage = "Qualified", assigned owner, campaign source tag, and close date estimate.
- ✓ MEDDIC fields M (Metrics) and I (Identify Pain) are populated at minimum.
- ✓ Territory assignment follows [SALES-PLAYBOOK] rules with no unassigned opportunities.

---

**A33113 — Reject Disqualified Leads and Route to Nurture Sequence**

| ICOM | Content |
|---|---|
| Input | Scored lead list (Not-MQL-flagged) with disqualification reasons |
| Control | [CAN-SPAM] Opt-out status must be verified before nurture re-enrollment; [GDPR-ART6] EU contacts require consent for nurture email |
| Output | Disqualification log: lead ID, disqualification reason code, nurture sequence assigned (or suppressed if opted out); CRM contact status updated to "Nurture" |
| Mechanism | [MECH-CRM] HubSpot or Salesforce; [MECH-MAP] nurture sequence enrollment |

**Binary Definition of Done:**
- ✓ Every disqualified lead has a disqualification reason code logged in CRM.
- ✓ Every disqualified lead with active email consent is enrolled in the appropriate nurture sequence.
- ✓ Zero opted-out contacts are enrolled in any nurture sequence per [CAN-SPAM].

---

### A332 — Execute Sales Discovery and Solution Demonstration

**Purpose:** Conduct MEDDIC-structured discovery calls to capture qualification fields in CRM, deliver tailored solution demonstrations, and submit post-demo follow-up with a customized value summary.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | CRM opportunity record [MEDDIC fields, contact info, company background] |
| I2 | Input | Product Literature [one-pager, sales deck — from A31] |
| C1 | Control | [SALES-PLAYBOOK] Sales Playbook [discovery call agenda, demo structure, qualification exit criteria for next stage] |
| C2 | Control | [FTC-5] No misrepresentation of product capabilities during demo |
| M1 | Mechanism | MECH-VIDEO (Zoom — customer meetings) |
| M2 | Mechanism | MECH-CRM (HubSpot, Salesforce — call logging, field updates) |
| M3 | Mechanism | MECH-CONV (Gong, Chorus — call recording and transcript analysis) |
| M4 | Mechanism | MECH-LLM (Claude API — post-call summary and follow-up drafting) |
| O1 | Output | Updated CRM Opportunity [all MEDDIC fields populated; pipeline stage advanced] |
| O2 | Output | Post-Demo Follow-Up [email with customized value summary → prospect] |

#### Leaf Nodes

**A33121 — Conduct Discovery Call to Capture MEDDIC Qualification Fields in CRM**

| ICOM | Content |
|---|---|
| Input | CRM opportunity record; discovery call agenda template; contact profile |
| Control | [SALES-PLAYBOOK] [MEDDIC must be ≥80% complete before advancing to Demo stage; call recorded per MECH-CONV] |
| Output | Updated CRM opportunity: all 6 MEDDIC fields populated with verbatim notes; call recording uploaded; pipeline stage = "Discovery Complete" if ≥4/6 MEDDIC fields captured |
| Mechanism | [MECH-VIDEO] Zoom; [MECH-CONV] Gong (recording); [MECH-CRM] field updates |

**Binary Definition of Done:**
- ✓ All 6 MEDDIC fields are updated in the CRM opportunity record with verbatim notes.
- ✓ Call recording is uploaded to MECH-CONV and linked to the CRM opportunity.
- ✓ Pipeline stage is advanced to "Discovery Complete" if ≥4/6 MEDDIC fields are captured per [SALES-PLAYBOOK].

---

**A33122 — Prepare and Deliver Tailored Solution Demonstration**

| ICOM | Content |
|---|---|
| Input | MEDDIC discovery notes (pain, metrics, champion); product demo environment; tailored slide deck |
| Control | [FTC-5] No false product capability claims; demo must show only features available in the sold tier |
| Output | Completed demo session (recorded); deal champion confirmed; pipeline stage advanced to "Demo Complete"; next step agreed and logged in CRM |
| Mechanism | [MECH-VIDEO] Zoom; [MECH-CONV] Gong (recording); [MECH-CRM] pipeline stage update |

**Binary Definition of Done:**
- ✓ Demo session is completed and recorded in MECH-CONV.
- ✓ Deal champion is identified and confirmed in the CRM opportunity record.
- ✓ Pipeline stage is advanced to "Demo Complete" and next step is agreed and logged in CRM before session close.

---

**A33123 — Submit Post-Demo Follow-Up with Customized Value Summary**

| ICOM | Content |
|---|---|
| Input | Demo recording and MEDDIC notes; product one-pager; pricing overview |
| Control | [SALES-PLAYBOOK] [follow-up sent within 24 hours of demo; must reference prospect's specific pain and metrics] |
| Output | Follow-up email sent: customized value summary (their pain, our solution, quantified impact), relevant case study attached, pricing overview, clear next step with proposed date |
| Mechanism | [MECH-LLM] Claude API (email drafting); [MECH-EMAIL-API] Gmail; [MECH-CRM] email logged to opportunity |

**Binary Definition of Done:**
- ✓ Follow-up email is sent within 24 hours of the demo per [SALES-PLAYBOOK].
- ✓ Email explicitly references the prospect's pain and quantified metrics from the MEDDIC discovery notes.
- ✓ Email is logged to the CRM opportunity activity timeline.

---

### A333 — Configure and Present Pricing Quotes via CPQ

**Purpose:** Build CPQ quotes with authorized pricing and discount tiers, generate formal quote documents for prospects, and route out-of-authority discounts through the deal approval process.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Opportunity record [deal size, product scope, desired term — from CRM] |
| I2 | Input | Configured CPQ price book [from A31152 — current pricing tiers and bundle rules] |
| C1 | Control | [CPQ-RULES] Deal Approval Authority Matrix [Finance A11 via IF-A1-10 — AE authority: 0–5% discount; VP Sales: 6–10%; CFO: >10%] |
| C2 | Control | [IRC-61] Gross income — discounts must produce positive recognized revenue (no sham pricing) |
| M1 | Mechanism | MECH-CPQ (Salesforce CPQ, DealHub, HubSpot Quotes) |
| M2 | Mechanism | MECH-CRM (opportunity record; deal stage update) |
| M3 | Mechanism | MECH-ESIGN (DocuSign — quote delivery with e-sign capability) |
| O1 | Output | Formal Quote Document [CPQ-generated, version-controlled, sent to prospect] |
| O2 | Output | Approved Discount Authorization [signed by appropriate authority per matrix] |

#### Leaf Nodes

**A33131 — Configure CPQ Quote with Product SKUs, Pricing Rules, and Discount Tier Authorization**

| ICOM | Content |
|---|---|
| Input | Opportunity product scope; CPQ price book; requested discount (if any); rep authority level |
| Control | [CPQ-RULES] Discount within rep authority (≤5%): no approval needed; >5%: approval required before quote delivery; [PRICING-POLICY] price book rules must be applied |
| Output | Configured CPQ quote: line items (SKU, quantity, list price, discount %, net price), contract term, total ACV, total TCV; approval flag set if discount >rep authority |
| Mechanism | [MECH-CPQ] Salesforce CPQ or DealHub; [MECH-CRM] opportunity linked to quote |

**Binary Definition of Done:**
- ✓ Configured CPQ quote contains all required line items: SKU, quantity, list price, discount %, and net price.
- ✓ Discount authority flag is set correctly: within-authority quotes have no flag; over-authority quotes have approval flag before delivery.
- ✓ All [PRICING-POLICY] bundle pricing rules are applied with zero pricing errors in the CPQ configuration.

---

**A33132 — Generate and Deliver Formal Quote Document to Prospect**

| ICOM | Content |
|---|---|
| Input | Configured CPQ quote (approved or within-authority); prospect contact and delivery preference |
| Control | [UCC-2] Quote constitutes an offer; once delivered, pricing is valid for the term stated in the quote |
| Output | Formal quote document (PDF) delivered via MECH-ESIGN: product description, pricing, contract term, expiry date (≤30 days), payment terms, signature block; delivery confirmation logged in CRM |
| Mechanism | [MECH-CPQ] quote document generation; [MECH-ESIGN] DocuSign delivery; [MECH-CRM] activity log |

**Binary Definition of Done:**
- ✓ Formal quote document (PDF) is delivered to the prospect via MECH-ESIGN with: product description, pricing, contract term, expiry date (≤30 days), payment terms, and signature block.
- ✓ Delivery confirmation is logged in the CRM activity timeline.
- ✓ Quote expiry date is ≤30 days from delivery per [UCC-2] offer validity.

---

**A33133 — Process Quote Approval for Discounts Exceeding Rep Authority per Deal Approval Matrix**

| ICOM | Content |
|---|---|
| Input | CPQ quote with discount >rep authority; deal context (strategic account flag, deal size, competitive situation) |
| Control | [CPQ-RULES] Deal Approval Authority Matrix: VP Sales approves 6–10% discount; CFO approves >10%; approval must be documented before quote delivery |
| Output | Approval chain completed: approval obtained (with name, date, rationale) or rejected (with counter-offer); approval documented in CRM opportunity notes |
| Mechanism | [MECH-CRM] approval workflow or [MECH-MESSAGING] Slack approval channel; [MECH-CPQ] discount approval log |

**Binary Definition of Done:**
- ✓ Every discount that exceeds rep authority has a documented approval (or rejection) with approver name, date, and rationale before the quote is delivered.
- ✓ Approval is documented in the CRM opportunity notes.
- ✓ Zero quotes with discounts exceeding rep authority are delivered without prior approval per [CPQ-RULES].

---

### A334 — Negotiate Contract Terms and Execute Signed Agreement

**Purpose:** Negotiate contract redlines within Legal-approved parameters, route non-standard terms to Legal A12 for review, execute the signed contract, and log the revenue recognition event in CRM.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Quote accepted by prospect [from A333]; prospect's redline requests (if any) |
| I2 | Input | Contract Template [from Legal A12 via IF-A1-03 — approved standard form] |
| C1 | Control | [UCC-2] UCC Article 2 — Sale of Goods contract formation requirements |
| C2 | Control | [CONTRACT-TEMPLATE] Contract Templates [Legal A12 — rep may accept/reject standard redlines per playbook; non-standard must go to CLO] |
| C3 | Control | [GAAP-ASC606] Revenue recognition event must be logged at contract execution — 5-step model starts at contract signature |
| M1 | Mechanism | MECH-CLM (DocuSign CLM, Ironclad — contract redline management) |
| M2 | Mechanism | MECH-ESIGN (DocuSign, Adobe Sign — execution) |
| M3 | Mechanism | MECH-CRM (pipeline stage update, contract record) |
| O1 | Output | Executed Contract [signed by both parties — to Finance A11 via IF-A0-09] |
| O2 | Output | Revenue Recognition Event Log [contract ID, execution date, TCV, ARR, PO schedule — in CRM] |

#### Leaf Nodes

**A33141 — Redline and Negotiate Contract Terms Within Legal-Approved Template Parameters**

| ICOM | Content |
|---|---|
| Input | Prospect redline document; approved contract redline playbook (from Legal A12) |
| Control | [CONTRACT-TEMPLATE] [rep authority: accept/reject standard redlines per playbook; payment terms floor net 30; liability cap = 1× TCV; no unlimited liability] |
| Output | Negotiated contract: all redlines resolved within rep authority; open non-standard items flagged for A33142 routing; negotiation log in MECH-CLM |
| Mechanism | [MECH-CLM] Ironclad or DocuSign CLM; [MECH-CRM] negotiation activity log |

**Binary Definition of Done:**
- ✓ All standard redlines are resolved within rep authority per [CONTRACT-TEMPLATE] playbook.
- ✓ Every non-standard redline is flagged in MECH-CLM for A33142 routing — zero non-standard items are accepted without CLO review.
- ✓ Negotiation log is updated in MECH-CLM with all resolved and flagged items.

---

**A33142 — Route Non-Standard Contract Terms to Legal A12 for CLO-Agent Review**

| ICOM | Content |
|---|---|
| Input | Flagged non-standard redlines (from A33141) with business context and deal size |
| Control | [UCC-2] Non-standard terms affecting liability, IP, or indemnification must have CLO-Agent review; turnaround SLA = 2 business days |
| Output | CLO-Agent decision on each non-standard item: approve (with any counter), reject (with alternative), or escalate to Principal; decision documented in MECH-CLM |
| Mechanism | [MECH-CLM] DocuSign CLM or Ironclad; [MECH-MATTER] legal matter ticket; [MECH-MESSAGING] Slack (CLO notification) |

**Binary Definition of Done:**
- ✓ CLO-Agent issues a decision (approve, reject, or escalate) on every non-standard redline within 2 business days.
- ✓ Every decision is documented in MECH-CLM with rationale.
- ✓ Zero non-standard items proceed to contract execution without a CLO-Agent decision on record.

---

**A33143 — Execute Contract via E-Signature and Log Revenue Recognition Event in CRM**

| ICOM | Content |
|---|---|
| Input | Final agreed contract (all redlines resolved); prospect signing authority contact; contract metadata (TCV, ARR, term dates, payment schedule) |
| Control | [GAAP-ASC606] Contract execution triggers revenue recognition event; performance obligation schedule must be logged; [SOX-302] if public company, financial statement impact must be assessed |
| Output | Executed contract (both-party signatures via MECH-ESIGN); CRM opportunity stage = "Closed-Won"; revenue recognition event record: contract ID, execution date, TCV, ARR, PO schedule, performance obligations per ASC 606 → to Finance A11 via IF-A0-09 |
| Mechanism | [MECH-ESIGN] DocuSign; [MECH-CRM] Closed-Won update; [MECH-CLM] executed contract storage |

**Binary Definition of Done:**
- ✓ Executed contract has signatures from both parties captured in MECH-ESIGN.
- ✓ CRM opportunity stage is updated to "Closed-Won" within 24 hours of final signature.
- ✓ Revenue recognition event record is created in CRM with: contract ID, execution date, TCV, ARR, payment schedule, and performance obligations per [GAAP-ASC606].

---

### A335 — Calculate and Process Sales Commission and SPiFF Payouts

**Purpose:** Compute rep commission from closed-won deals per the commission plan, calculate SPiFF incentives for qualifying product or tier uplifts, and transmit payout data to Payroll A1333 for processing.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Closed-Won deal records [from A334 — contract TCV, ARR, product mix, term] |
| I2 | Input | Commission Plan [from Finance A11 / People A13 — rate schedule by deal type, tier, and rep level] |
| C1 | Control | [IRC-61] Commission is gross income to the rep — must be reported on W-2 / 1099 per applicable classification |
| C2 | Control | [COMMISSION-PLAN] Commission Plan [rate table, accelerators, clawback terms, dispute resolution window] |
| C3 | Control | [MATH-GAAP-AXIOMS] Commission expense must be accrued in the period earned (ASC 340-40 contract acquisition costs) |
| M1 | Mechanism | MECH-CRM (HubSpot, Salesforce — closed-won deal data) |
| M2 | Mechanism | MECH-PAYROLL (ADP, Gusto — commission payout transmission) |
| M3 | Mechanism | MECH-DOC (Google Sheets — commission calculation model) |
| O1 | Output | Commission Payout Schedule [rep-level commission amounts → Payroll A1333 via IF-A0-10] |
| O2 | Output | SPiFF Payout Schedule [incentive amounts by rep and qualifying deal → Payroll A1333 via IF-A0-10] |
| O3 | Output | Commission Accrual Entry [ASC 340-40 deferred acquisition cost → Finance A11] |

#### Leaf Nodes

**A33151 — Compute Rep Commission Payout from Closed-Won Deal per Commission Plan**

| ICOM | Content |
|---|---|
| Input | Closed-Won deal records (TCV, ARR, product mix, booking date); commission plan rate table |
| Control | [IRC-61] Commission = taxable W-2 income; [MATH-GAAP-AXIOMS] commission expense accrued in booking period per ASC 340-40; [COMMISSION-PLAN] clawback terms (e.g., customer cancels within 90 days) |
| Output | Commission calculation sheet: deal ID, rep name, TCV, commission rate, commission amount ($), clawback period expiry, payment period (next pay cycle); total commission by rep |
| Mechanism | [MECH-CRM] Closed-Won deal export; [MECH-DOC] Google Sheets commission model |

**Binary Definition of Done:**
- ✓ Commission calculation sheet contains an entry for every Closed-Won deal in the pay period with: deal ID, rep name, TCV, commission rate, commission amount, and clawback period expiry.
- ✓ [COMMISSION-PLAN] clawback terms are applied — deals in the clawback window are flagged.
- ✓ Total commission amount per rep is calculated and matches the sum of individual deal commissions to $0.00.

---

**A33152 — Calculate SPiFF Incentive for Qualifying Product or Tier Uplift**

| ICOM | Content |
|---|---|
| Input | Closed-Won deals with SPiFF-eligible product or tier uplift (per SPiFF program criteria); SPiFF rate table |
| Control | [COMMISSION-PLAN] [SPiFF eligibility criteria: specific SKU, minimum deal size, new logo vs. expansion, promotion period dates] |
| Output | SPiFF payout sheet: deal ID, rep name, SPiFF trigger (product/tier uplift description), SPiFF amount ($); total SPiFF by rep |
| Mechanism | [MECH-CRM] deal product line export; [MECH-DOC] Google Sheets SPiFF model |

**Binary Definition of Done:**
- ✓ SPiFF payout sheet contains an entry for every deal that qualifies under current [COMMISSION-PLAN] SPiFF program criteria.
- ✓ Every entry includes: deal ID, rep name, SPiFF trigger description, and SPiFF amount.
- ✓ Zero non-qualifying deals appear on the SPiFF payout sheet.

---

**A33153 — Submit Commission and SPiFF Payout to Payroll A1333 for Processing**

| ICOM | Content |
|---|---|
| Input | Commission payout schedule + SPiFF payout schedule (from A33151, A33152); next payroll cutoff date |
| Control | [IRC-61] Supplemental wage withholding applies to commission and SPiFF (22% federal supplemental rate) |
| Output | Commission and SPiFF payout file transmitted to Payroll A1333 via IF-A0-10: rep ID, payout amount, supplemental wage type flag, pay period; transmission confirmation received |
| Mechanism | [MECH-PAYROLL] ADP or Gusto (supplemental payroll upload); [MECH-CRM] payout record logged |

**Binary Definition of Done:**
- ✓ Commission and SPiFF payout file is transmitted to Payroll A1333 via IF-A0-10 before the next payroll cutoff date.
- ✓ Every payout line has a supplemental wage type flag applied per [IRC-61].
- ✓ Transmission confirmation from MECH-PAYROLL is received and logged.

---

### A336 — Deliver Customer Success and Drive Renewal and Expansion

**Purpose:** Build and track customer health scores from product usage and support signals, execute QBRs to surface expansion opportunities, and process renewal quotes while routing expansion opportunities to the sales pipeline.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Product Usage Data [log-level feature engagement from Engineering A14 product analytics] |
| I2 | Input | Support Ticket Data [customer issue history, resolution time — from support system] |
| I3 | Input | Contract Renewal Schedule [expiry dates from executed contracts — from A334] |
| C1 | Control | [SALES-PLAYBOOK] Sales Playbook [health score thresholds: Green ≥80, Yellow 60–79, Red <60; QBR cadence: quarterly for strategic, semi-annual for SMB] |
| C2 | Control | [COMMISSION-PLAN] Commission Plan [renewal commission rate; expansion commission rate] |
| C3 | Control | [GAAP-ASC606] Renewal constitutes a new contract; revenue recognition schedule must be updated] |
| M1 | Mechanism | MECH-CRM (HubSpot, Salesforce — customer success module) |
| M2 | Mechanism | MECH-WEB-ANALYTICS (Mixpanel, Amplitude — product usage analytics) |
| M3 | Mechanism | MECH-VIDEO (Zoom — QBR meetings) |
| O1 | Output | Customer Health Scores [Green/Yellow/Red with trend — for all active accounts] |
| O2 | Output | QBR Output [expansion opportunities logged as pipeline in CRM] |
| O3 | Output | Renewal Quote [processed via CPQ — to A333 for contracting] |
| O4 | Output | Customer Feedback [verbatim product feedback → Brand & Product Mgmt A31] |

#### Leaf Nodes

**A33161 — Build and Track Customer Health Score from Product Usage and Support Signals**

| ICOM | Content |
|---|---|
| Input | Product feature adoption rate (% of licensed features used); support ticket volume and severity; NPS or CSAT survey score; payment history (no late payments flag) |
| Control | [SALES-PLAYBOOK] [health score formula: Feature Adoption 40% + Support Severity 30% + NPS 20% + Payment 10%; update weekly; Red = at-risk alert to AE and management] |
| Output | Customer health score dashboard: account name, health score (0–100), tier (Green/Yellow/Red), trend (improving/stable/declining), at-risk alert flag, next CSM action due date |
| Mechanism | [MECH-CRM] HubSpot Customer Success or Salesforce Health Score; [MECH-WEB-ANALYTICS] Mixpanel product analytics; [MECH-BI] dashboard |

**Binary Definition of Done:**
- ✓ Customer health score is calculated and updated in MECH-CRM for every active account on the weekly cadence.
- ✓ Health score formula matches [SALES-PLAYBOOK] weights: Feature Adoption 40% + Support Severity 30% + NPS 20% + Payment 10%.
- ✓ Every account with a Red health score (<60) has an at-risk alert generated and assigned to the AE and management.

---

**A33162 — Execute Quarterly Business Review and Capture Expansion Opportunities**

| ICOM | Content |
|---|---|
| Input | Customer health score (from A33161); product usage trends; customer's business goals (from prior QBR notes in CRM) |
| Control | [SALES-PLAYBOOK] [QBR must cover: usage review, business outcome delivered, roadmap preview, expansion discussion; expansion opportunity requires ≥60 health score to progress] |
| Output | QBR meeting completed (recorded); CRM activity logged; expansion opportunities created as pipeline records (product, scope, estimated ACV, timeline); customer feedback captured and routed to A31 |
| Mechanism | [MECH-VIDEO] Zoom; [MECH-CONV] Gong (recording); [MECH-CRM] expansion opportunity creation |

**Binary Definition of Done:**
- ✓ QBR meeting is completed (recorded in MECH-CONV) and activity logged in CRM.
- ✓ Every expansion opportunity identified in the QBR is created as a pipeline record in CRM with: product, scope, estimated ACV, and timeline.
- ✓ QBR is only conducted for accounts with health score ≥60 per [SALES-PLAYBOOK]; accounts below threshold receive a recovery plan instead.

---

**A33163 — Process Renewal Quote and Route Expansion Opportunity Back to Sales Pipeline**

| ICOM | Content |
|---|---|
| Input | Renewal schedule (contract expiry date ≤90 days); health score; expansion opportunity records; existing contract terms |
| Control | [GAAP-ASC606] Renewal is a new contract — new revenue recognition schedule required; [CPQ-RULES] renewal pricing may include pre-approved discount for early renewal; expansion routes to A333 for new quote |
| Output | Renewal quote generated via MECH-CPQ and delivered to customer (route to A333 for execution); expansion opportunity record advanced to "Sales Qualified" stage and assigned to sales rep for A332 process; renewal win/loss logged in CRM |
| Mechanism | [MECH-CPQ] renewal quote generation; [MECH-CRM] renewal and expansion pipeline; [MECH-ESIGN] renewal execution |

**Binary Definition of Done:**
- ✓ Renewal quote is generated via MECH-CPQ and delivered to the customer ≥90 days before contract expiry.
- ✓ Renewal constitutes a new revenue recognition event per [GAAP-ASC606] — new performance obligation schedule is logged in CRM.
- ✓ Every expansion opportunity is advanced to "Sales Qualified" stage and assigned to a sales rep for the A332 process.

---

## Leaf Node Summary

| Node | Name | L4 Parent |
|---|---|---|
| A33111 | Score and Filter Inbound Leads Against Ideal Customer Profile Criteria | A331 |
| A33112 | Assign Qualified Leads to Sales Rep and Create CRM Opportunity Record | A331 |
| A33113 | Reject Disqualified Leads and Route to Nurture Sequence | A331 |
| A33121 | Conduct Discovery Call to Capture MEDDIC Qualification Fields in CRM | A332 |
| A33122 | Prepare and Deliver Tailored Solution Demonstration | A332 |
| A33123 | Submit Post-Demo Follow-Up with Customized Value Summary | A332 |
| A33131 | Configure CPQ Quote with Product SKUs, Pricing Rules, and Discount Tier Authorization | A333 |
| A33132 | Generate and Deliver Formal Quote Document to Prospect | A333 |
| A33133 | Process Quote Approval for Discounts Exceeding Rep Authority per Deal Approval Matrix | A333 |
| A33141 | Redline and Negotiate Contract Terms Within Legal-Approved Template Parameters | A334 |
| A33142 | Route Non-Standard Contract Terms to Legal A12 for CLO-Agent Review | A334 |
| A33143 | Execute Contract via E-Signature and Log Revenue Recognition Event in CRM | A334 |
| A33151 | Compute Rep Commission Payout from Closed-Won Deal per Commission Plan | A335 |
| A33152 | Calculate SPiFF Incentive for Qualifying Product or Tier Uplift | A335 |
| A33153 | Submit Commission and SPiFF Payout to Payroll A1333 for Processing | A335 |
| A33161 | Build and Track Customer Health Score from Product Usage and Support Signals | A336 |
| A33162 | Execute Quarterly Business Review and Capture Expansion Opportunities | A336 |
| A33163 | Process Renewal Quote and Route Expansion Opportunity Back to Sales Pipeline | A336 |

**Total leaf nodes: 18** ✓

---

## Mandatory Inclusion Checklist (A3 Sales)

| Requirement | Node | Status |
|---|---|---|
| CPQ rules engine configuration — [CPQ-RULES] | A33131 (Configure CPQ Quote) | ✓ |
| Commission SPiFF calculation and dispute resolution — [IRC-61] | A33151 (Commission); A33152 (SPiFF) | ✓ |
| Revenue recognition event logging — [GAAP-ASC606] | A33143 (Execute Contract and Log Revenue Event) | ✓ |
| Customer health score model construction | A33161 (Build and Track Customer Health Score) | ✓ |

---

## New Interfaces Required

| ID | From | To | Artifact | Arrow Type |
|---|---|---|---|---|
| IF-A0-10 | Sales A33 | People A13 (Payroll A1333) | Commission and SPiFF Payout Transmission | Output (feedback) |

---

## Audit Status

- [ ] R1.2a check: all box names are active verb phrases (no gerunds)
- [ ] R1.4 check: all L5 outputs are named in parent L4 ICOM
- [ ] R2.1 check: ICOM complete at every level
- [ ] Mandatory inclusions: CPQ ✓, Commission ✓, SPiFF ✓, Revenue event ✓, Customer health score ✓
- [ ] Leaf count: 18 ✓
- [ ] New interface: IF-A0-10 requires registration
