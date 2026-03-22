# Skill File: Regulatory Compliance Monitoring

**Node:** A123
**Parent:** A12 Legal
**Function:** Monitor Regulatory Environment and Produce Compliance Controls
**Supreme Constraint:** [GDPR] EU 2016/679 | [FCPA] 15 U.S.C. §78dd-1 | [OFAC] 31 CFR Parts 500-598
**Cross-Function Interfaces:** (Outbound: IF-A1-03 at A12363 → Engineering A14) (Inbound: external regulatory feeds)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [x] GDPR Data Protection Impact Assessment — satisfied at A1232 (A12321–A12323)
- [x] HSR Act pre-merger notification filing — satisfied at A1235 (A12351–A12352)

---

## Node Tree: A123

```
A123  Monitor Regulatory Environment and Produce Compliance Controls
├── A1231  Monitor Regulatory Change Feed
│   ├── A12311  Subscribe to and Ingest Regulatory Update Sources by Jurisdiction
│   ├── A12312  Classify Regulatory Change by Impact Tier and Affected Function
│   └── A12313  Route Material Regulatory Change to Responsible Function Owner
├── A1232  Execute GDPR Data Protection Impact Assessment               [mandatory: GDPR-DPIA]
│   ├── A12321  Identify High-Risk Processing Activities and DPIA Trigger Conditions
│   ├── A12322  Complete Eight-Section DPIA and Consult Data Protection Authority if Required
│   └── A12323  Publish DPIA Decision and Update Data Processing Register
├── A1233  Administer Privacy Compliance Program
│   ├── A12331  Draft and Publish Privacy Notices and Consent Language
│   ├── A12332  Process Data Subject Rights Requests Within Statutory Deadline
│   └── A12333  Conduct Annual Privacy Compliance Audit and Produce Remediation Plan
├── A1234  Screen Counterparties for Sanctions and Anti-Bribery Obligations
│   ├── A12341  Run Counterparty Name Against OFAC SDN and Consolidated Sanctions List
│   ├── A12342  Apply FCPA Risk Classification to Foreign Government Counterparty
│   └── A12343  Document Screening Results and Obtain Legal Clearance
├── A1235  File Regulatory Reports and Pre-Merger Notifications         [mandatory: HSR]
│   ├── A12351  Calculate HSR Size-of-Transaction and Size-of-Person Thresholds
│   ├── A12352  Prepare and Submit HSR Filing to FTC and DOJ
│   └── A12353  Track Regulatory Filing Calendar and Submit Periodic Reports
└── A1236  Produce and Distribute Compliance Operating Envelope         [→ IF-A1-03]
    ├── A12361  Translate Regulatory Change into Prohibitions and Required Controls
    ├── A12362  Update Compliance Operating Envelope Document in GRC System
    └── A12363  Distribute Updated Envelope to Engineering A14 and Confirm Receipt
```

---

### A123: Monitor Regulatory Environment and Produce Compliance Controls

**Function:** Monitor Regulatory Environment and Produce Compliance Controls
**Supreme Constraint:** [GDPR] EU 2016/679 | [FCPA] 15 U.S.C. §78dd-1 | [OFAC] 31 CFR Parts 500-598

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Regulatory Update Feeds | Agency Federal Register notices, GDPR DPA guidance, state law updates, OFAC SDN updates; source: external regulatory monitoring |
| I2 | Input | Processing Activity Inventory | Systems and processes that handle personal data; source: Engineering A14 system catalog |
| I3 | Input | Transaction and Counterparty Data | M&A deal parameters (for HSR), counterparty names (for OFAC/FCPA); source: Finance A11 and Sales A33 |
| C1 | Control | Privacy Regulation | [GDPR] EU 2016/679 — data protection; [CCPA] Cal. Civ. Code §1798.100 — California resident rights |
| C2 | Control | Anti-Corruption | [FCPA] 15 U.S.C. §78dd-1 — anti-bribery; accounting provisions; books and records requirements |
| C3 | Control | Sanctions | [OFAC] 31 CFR Parts 500-598 — prohibited transactions with SDN-listed entities and countries |
| C4 | Control | Pre-Merger Notification | [HSR] 15 U.S.C. §18a; 16 CFR Parts 801-803 — filing thresholds and waiting periods |
| O1 | Output | Compliance Operating Envelope | Policy document specifying prohibited actions and required controls (→ IF-A1-03 → Engineering A14) |
| O2 | Output | DPIA Reports | Completed 8-section GDPR DPIAs for high-risk processing |
| O3 | Output | HSR Filing Packages | Premerger notification filings with FTC/DOJ |
| O4 | Output | Sanctions Clearance Records | OFAC/FCPA screening results per counterparty |
| M1 | Mechanism | GRC Platform | [MECH-GRC] ServiceNow GRC, LogicGate, OneTrust, Navex |
| M2 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] OneTrust, TrustArc, DataGrail |
| M3 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI |

**Child Nodes:** A1231, A1232, A1233, A1234, A1235, A1236

---

#### A1231: Monitor Regulatory Change Feed

**Function:** Monitor Regulatory Change Feed
**Supreme Constraint:** [NIST-CSF] Govern function — continuous regulatory monitoring obligation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Regulatory Source Subscriptions | Federal Register RSS feeds, DPA guidance bulletins, state legislative updates, OFAC SDN delta reports |
| C1 | Control | Monitoring Scope | Jurisdictions where enterprise operates or processes data of residents — minimum: US federal, US states with revenue nexus, EU/EEA (GDPR) |
| O1 | Output | Classified Regulatory Change Log | MECH-GRC log of regulatory changes with impact tier (1=imminent action required / 2=review required / 3=monitor) |
| M1 | Mechanism | GRC Platform | [MECH-GRC] ServiceNow GRC, OneTrust — regulatory change management module |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — regulatory change summarization and impact assessment |

**Child Nodes:** A12311, A12312, A12313

---

##### A12311: Subscribe to and Ingest Regulatory Update Sources by Jurisdiction

**Agent Definition:** Configure MECH-GRC to pull regulatory updates from all required jurisdictions (US federal agencies, applicable state AGs, EU DPAs, OFAC), ingest updates into the regulatory change log daily, and flag any OFAC SDN list changes for immediate same-day processing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Jurisdiction Coverage List | Active operating jurisdictions: {US federal, US states (by nexus), EU/EEA member states (GDPR), other countries with data subjects} |
| C1 | Control | OFAC Update Cadence | [OFAC] SDN list updates are published without schedule; OFAC-flagged entities require same-day review; transactions with SDN-listed parties are prohibited |
| O1 | Output | Regulatory Change Ingestion Record | MECH-GRC daily log with: source, publication_date, jurisdiction, regulatory_body, change_summary, ingestion_timestamp |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — regulatory feed connectors and ingestion pipeline |

**Binary Definition of Done:**
- ✓ MECH-GRC shows daily ingestion records from all required jurisdictions.
- ✓ OFAC SDN changes appear in log within same business day of OFAC publication.
- ✓ Ingestion_timestamp confirms daily processing.

---

##### A12312: Classify Regulatory Change by Impact Tier and Affected Function

**Agent Definition:** For each newly ingested regulatory change, analyze the change scope and classify by impact tier (Tier 1: immediate action ≤30 days / Tier 2: review and plan ≤90 days / Tier 3: monitor ≥90 days) and identify the affected enterprise function(s) (Finance A11, Legal A12, People A13, Engineering A14, Production A2, Sales A3).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Regulatory Change Ingestion Record | A12311 output — unclassified regulatory change with source and summary |
| C1 | Control | Impact Assessment Standard | [NIST-CSF] Govern function — regulatory change impact assessment; materiality threshold per [GAAP-MATERIALITY] for financial regulatory changes |
| O1 | Output | Classified Regulatory Change Record | MECH-GRC record updated with: impact_tier (1/2/3), affected_functions[], effective_date, compliance_deadline, assigned_owner |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — classification workflow and owner assignment |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — regulatory impact analysis |

**Binary Definition of Done:**
- ✓ Every regulatory change ingested from A12311 has impact_tier, affected_functions[], and compliance_deadline populated within 2 business days of ingestion.
- ✓ Tier 1 changes have assigned_owner set before classification is complete.

---

##### A12313: Route Material Regulatory Change to Responsible Function Owner

**Agent Definition:** For all Tier 1 and Tier 2 regulatory changes in MECH-GRC, generate a Regulatory Action Notice for each affected function owner, transmit via MECH-MESSAGING with the compliance deadline, and log receipt confirmation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Classified Regulatory Change Records | Tier 1 and Tier 2 changes from A12312 with affected_functions[] and compliance_deadline |
| C1 | Control | Notification Timeliness | Tier 1 changes: notify within 1 business day of classification; Tier 2: notify within 5 business days |
| O1 | Output | Transmitted Regulatory Action Notices | MECH-MESSAGING notifications to each affected function owner: {change_summary, impact_tier, compliance_deadline, required_action, owning_agent} |
| M1 | Mechanism | Team Messaging API | [MECH-MESSAGING] Slack API, Microsoft Teams API — notice delivery |
| M2 | Mechanism | GRC Platform | [MECH-GRC] — routing log and receipt confirmation |

**Binary Definition of Done:**
- ✓ MECH-GRC logs notification_sent_timestamp for each Tier 1 and Tier 2 change.
- ✓ Tier 1 notification_sent_timestamp ≤ 1 business day after classification.
- ✓ All affected_functions[] owners receive individual notices.

---

#### A1232: Execute GDPR Data Protection Impact Assessment

**Function:** Execute GDPR Data Protection Impact Assessment
**Supreme Constraint:** [GDPR-DPIA] GDPR Art. 35 — mandatory DPIA for high-risk processing

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Processing Activity Specification | Description of processing: data categories, data subjects, purpose, legal basis, retention period, third-party transfers |
| I2 | Input | DPIA Trigger Assessment | High-risk indicators: systematic profiling, special category data (Art. 9), large-scale monitoring, novel technology |
| C1 | Control | DPIA Obligation | [GDPR-DPIA] GDPR Art. 35 — DPIA mandatory when processing likely results in high risk to rights and freedoms; 8-section structured format |
| C2 | Control | Lawful Basis | [GDPR] Art. 6 — lawful basis (consent, contract, legal obligation, vital interests, public task, legitimate interests) must be identified |
| O1 | Output | Completed DPIA Report | 8-section GDPR-compliant DPIA with: description, necessity, risk assessment, measures, DPA consultation status |
| O2 | Output | Data Processing Register Update | MECH-PRIVACY register entry for the assessed processing activity |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] OneTrust, TrustArc, DataGrail — DPIA workflow and register |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — DPIA drafting and risk analysis |

**Child Nodes:** A12321, A12322, A12323

---

##### A12321: Identify High-Risk Processing Activities and DPIA Trigger Conditions

**Agent Definition:** Review all new or materially changed processing activities against GDPR Art. 35(3) mandatory DPIA triggers and WP29/EDPB 9-criteria checklist; classify each as DPIA Required, DPIA Recommended, or DPIA Not Required; and route DPIA Required activities to A12322.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Processing Activity Description | New or changed processing: data categories, subjects, purpose, volume, technology, third-country transfers |
| C1 | Control | DPIA Trigger Standard | [GDPR-DPIA] Art. 35(3) mandatory triggers: systematic profiling with legal effects, large-scale special category data (Art. 9), large-scale public monitoring; EDPB 9 criteria (systematic evaluation, automated decision-making, special categories, large scale, matching/combining, vulnerable subjects, novel technology, cross-border transfer, right to access prevented) — 2+ criteria triggers DPIA |
| O1 | Output | DPIA Trigger Classification | MECH-PRIVACY record per processing activity: activity_name, trigger_criteria_met[], classification (DPIA Required/Recommended/Not Required), classification_rationale |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] OneTrust — processing activity register and DPIA trigger assessment |

**Binary Definition of Done:**
- ✓ Every processing activity has a DPIA trigger classification record.
- ✓ Classification_rationale lists each criterion evaluated.
- ✓ All DPIA Required activities are routed to A12322 within 5 business days of classification.

---

##### A12322: Complete Eight-Section DPIA and Consult Data Protection Authority if Required

**Agent Definition:** Execute the 8-section GDPR DPIA for each DPIA Required activity: (1) describe processing, (2) assess necessity and proportionality, (3) identify risks to data subjects, (4) assess likelihood and severity per risk, (5) identify mitigation measures, (6) assess residual risk, (7) document controller decisions, (8) determine DPA prior consultation requirement; and submit to DPA if residual risk is high.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | DPIA Required Processing Activity | A12321 output — processing activity with DPIA Required classification |
| I2 | Input | Technical and Organizational Measures | Existing security controls from Engineering A14 system catalog (NIST-CSF controls, MECH-IAM, encryption standards) |
| C1 | Control | DPIA Structure | [GDPR-DPIA] Art. 35 — 8-section format; [GDPR] Art. 36 — prior consultation with DPA mandatory when residual risk remains high after measures |
| O1 | Output | Completed 8-Section DPIA | MECH-PRIVACY DPIA record with all 8 sections completed, risk matrix (likelihood × severity), residual_risk_level (High/Medium/Low), and DPA_consultation_required flag |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] OneTrust, TrustArc — DPIA template and workflow |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — risk analysis and measure identification |

**Binary Definition of Done:**
- ✓ MECH-PRIVACY DPIA record contains all 8 sections with content.
- ✓ Risk matrix has likelihood and severity scores for each identified risk.
- ✓ If residual_risk_level = High, DPA prior consultation request is filed within 30 days of DPIA completion.

---

##### A12323: Publish DPIA Decision and Update Data Processing Register

**Agent Definition:** Retrieve completed DPIA from MECH-PRIVACY, record the processing activity decision (proceed with measures / do not proceed / refer to DPA), update the enterprise Data Processing Register with the processing activity entry, and transmit DPIA outcome to Engineering A14 for technical implementation of required measures.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Completed 8-Section DPIA | A12322 output — DPIA with all sections, risk matrix, residual risk level, and DPA consultation status |
| C1 | Control | Register Obligation | [GDPR] Art. 30 — controller must maintain records of processing activities (Record of Processing Activities, RoPA) |
| O1 | Output | Data Processing Register Entry | MECH-PRIVACY RoPA record: activity_name, legal_basis, data_categories, retention_period, third_party_transfers, security_measures_ref, dpia_id, decision (proceed/do-not-proceed/pending-DPA) |
| O2 | Output | Engineering A14 Implementation Notice | Notification to Engineering A14 listing required technical measures from DPIA §5 with implementation deadline |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] — RoPA update |
| M2 | Mechanism | Team Messaging API | [MECH-MESSAGING] — Engineering A14 implementation notice |

**Binary Definition of Done:**
- ✓ MECH-PRIVACY RoPA contains a new or updated entry for the processing activity with all required Art. 30 fields.
- ✓ Engineering A14 receives implementation notice for each required technical measure.
- ✓ DPIA_id cross-references the completed DPIA from A12322.

---

#### A1233: Administer Privacy Compliance Program

**Function:** Administer Privacy Compliance Program
**Supreme Constraint:** [GDPR] Art. 13–14 (transparency) | [CCPA] Cal. Civ. Code §1798.100 (consumer rights)

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Processing Activity Register | MECH-PRIVACY RoPA with all processing activities and legal bases; source: A12323 |
| C1 | Control | Privacy Notice Obligation | [GDPR] Art. 13–14 — data subjects must be informed at collection time; [CCPA] §1798.100 — right to know |
| C2 | Control | Data Subject Rights | [GDPR] Art. 15–22 — access, rectification, erasure, portability, objection; [CCPA] §1798.100–1798.125 — deletion, opt-out |
| O1 | Output | Privacy Notices and Consent Records | Published privacy notices and documented consent events in MECH-PRIVACY |
| O2 | Output | Data Subject Request Responses | Completed DSR responses within statutory deadlines |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] OneTrust, TrustArc, DataGrail — consent management, DSR workflow |

**Child Nodes:** A12331, A12332, A12333

---

##### A12331: Draft and Publish Privacy Notices and Consent Language

**Agent Definition:** Draft privacy notice for each data collection channel using the processing activity register, include all Art. 13–14 required elements (controller identity, processing purposes, legal bases, retention periods, data subject rights, DPA complaint right, third-party recipients), obtain CLO approval, and publish to each applicable touchpoint.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Processing Activity Register | MECH-PRIVACY RoPA with processing purposes, legal bases, and data categories per channel |
| C1 | Control | Notice Content Requirements | [GDPR] Art. 13–14 — 12 required elements for at-collection notice; [CCPA] §1798.100(b) — right to know at or before collection |
| O1 | Output | Published Privacy Notices | Privacy notices published at each collection touchpoint (website, app, email signup, checkout) with MECH-PRIVACY version tracking |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] OneTrust — consent management and notice deployment |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — notice drafting |

**Binary Definition of Done:**
- ✓ Published privacy notice at each collection touchpoint contains all 12 GDPR Art. 13 elements.
- ✓ MECH-PRIVACY version record shows CLO approval signature.
- ✓ CCPA-required "Do Not Sell or Share" link is present on California-facing pages.

---

##### A12332: Process Data Subject Rights Requests Within Statutory Deadline

**Agent Definition:** Receive data subject request (access, deletion, rectification, portability, or opt-out), verify requester identity, route to system owners via MECH-PRIVACY for data extraction or deletion, compile response, and transmit to data subject within the applicable statutory deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Data Subject Request | Request type (access/deletion/rectification/portability/opt-out), data subject identity, submission date |
| C1 | Control | Response Deadline | [GDPR] Art. 12(3) — response within 1 calendar month (extendable to 3 months with notice); [CCPA] §1798.100(d) — response within 45 days (extendable 45 days with notice) |
| O1 | Output | Data Subject Request Response | Completed response transmitted to data subject: data package (access/portability), deletion confirmation, or opt-out confirmation; response_date ≤ statutory deadline |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] DataGrail, OneTrust — DSR intake, routing, and response workflow |

**Binary Definition of Done:**
- ✓ Response_date ≤ 30 days (GDPR) or ≤ 45 days (CCPA) from request receipt.
- ✓ MECH-PRIVACY DSR record shows requester identity verification completed.
- ✓ Response type matches request type.

---

##### A12333: Conduct Annual Privacy Compliance Audit and Produce Remediation Plan

**Agent Definition:** Annually audit the privacy program against GDPR Art. 24 accountability requirements and CCPA compliance: verify RoPA completeness, privacy notice accuracy, DSR response rate and timeliness, DPIA currency, and consent record integrity; produce a findings report with a prioritized remediation plan.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Privacy Program State | MECH-PRIVACY: RoPA, notice versions, DSR response metrics, DPIA records, consent logs — as of audit date |
| C1 | Control | Accountability Obligation | [GDPR] Art. 24 — controller must implement appropriate measures and demonstrate compliance; Art. 83 — fines up to €20M or 4% global annual turnover |
| O1 | Output | Annual Privacy Audit Report | Findings report: {compliance_area, status (compliant/non-compliant/gap), finding_detail, remediation_priority (1-3), responsible_owner, deadline} |
| O2 | Output | Remediation Plan | MECH-GRC task list with remediation items, owners, and completion deadlines |
| M1 | Mechanism | Privacy Compliance Platform | [MECH-PRIVACY] — audit data extraction |
| M2 | Mechanism | GRC Platform | [MECH-GRC] — remediation plan tracking |

**Binary Definition of Done:**
- ✓ Audit report covers all 5 compliance areas.
- ✓ Each finding has remediation_priority and responsible_owner assigned.
- ✓ Remediation plan items are loaded into MECH-GRC with completion deadlines ≤ 90 days for Priority 1 findings.

---

#### A1234: Screen Counterparties for Sanctions and Anti-Bribery Obligations

**Function:** Screen Counterparties for Sanctions and Anti-Bribery Obligations
**Supreme Constraint:** [OFAC] 31 CFR Parts 500-598 | [FCPA] 15 U.S.C. §78dd-1

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Counterparty Identity Data | Legal name, aliases, country, EIN/tax ID, principal ownership information; source: Sales A33, Finance A11 (new vendors/lenders), Operations A2 |
| C1 | Control | OFAC Sanctions | [OFAC] 31 CFR Parts 500-598 — transactions with SDN-listed parties or sanctioned jurisdictions are prohibited; strict liability applies |
| C2 | Control | Anti-Corruption | [FCPA] 15 U.S.C. §78dd-1 — prohibits payments of anything of value to foreign officials to obtain or retain business; accounting provisions require accurate books and records |
| O1 | Output | Counterparty Screening Record | MECH-GRC record with: screening result (clear/match/pending), risk classification, legal clearance status |
| M1 | Mechanism | GRC Platform | [MECH-GRC] ServiceNow GRC, Navex — sanctions and third-party risk screening |

**Child Nodes:** A12341, A12342, A12343

---

##### A12341: Run Counterparty Name Against OFAC SDN and Consolidated Sanctions List

**Agent Definition:** Submit counterparty legal name, aliases, and country to OFAC sanctions screening API, match against the SDN list and Consolidated Sanctions List, record the screening result (CLEAR / POTENTIAL MATCH / CONFIRMED MATCH), and block transaction on CONFIRMED MATCH pending legal review.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Counterparty Identity Data | Legal name, all known aliases, country of incorporation, UBO (ultimate beneficial owner) name and country |
| C1 | Control | Sanctions Prohibition | [OFAC] 31 CFR — strict liability for transactions with SDN-listed parties; no knowledge requirement; penalties up to $1,000,000 per violation |
| O1 | Output | OFAC Screening Record | MECH-GRC record: counterparty_id, screening_date, lists_checked (SDN / Consolidated), result (CLEAR/POTENTIAL_MATCH/CONFIRMED_MATCH), match_detail (if applicable) |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — integrated OFAC screening API (Dow Jones Risk & Compliance, LexisNexis WorldCompliance, Refinitiv World-Check) |

**Binary Definition of Done:**
- ✓ MECH-GRC screening record exists with screening_date and result for every counterparty.
- ✓ CONFIRMED_MATCH triggers automatic transaction block flag.
- ✓ Screening covers SDN list + Consolidated Sanctions List + applicable sectoral sanctions programs.

---

##### A12342: Apply FCPA Risk Classification to Foreign Government Counterparty

**Agent Definition:** For counterparties with government-owned or government-affiliated status, apply the FCPA risk classification rubric (country Corruption Perceptions Index, transaction type, interaction with foreign officials, value of anything of value exchanged) and assign a risk tier (Low / Medium / High / Prohibited).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Counterparty Government Affiliation Data | Ownership structure showing government ownership %, country, nature of transaction, any proposed hospitality, gifts, or facilitation payments |
| C1 | Control | FCPA Anti-Bribery Prohibition | [FCPA] 15 U.S.C. §78dd-1 — prohibits anything of value to foreign official for business advantage; parent company liability for subsidiary and agent conduct |
| O1 | Output | FCPA Risk Classification | MECH-GRC record: counterparty_id, government_affiliation (Y/N), cpi_score, transaction_type, risk_tier (Low/Medium/High/Prohibited), enhanced_due_diligence_required (Y/N) |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — third-party risk classification workflow |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — FCPA risk analysis |

**Binary Definition of Done:**
- ✓ MECH-GRC shows risk_tier for all counterparties with government_affiliation = Y.
- ✓ Risk_tier = Prohibited triggers automatic referral to A12343.
- ✓ Enhanced_due_diligence_required = Y for High risk tier.

---

##### A12343: Document Screening Results and Obtain Legal Clearance

**Agent Definition:** Compile OFAC screening result and FCPA risk classification into a Counterparty Clearance Package, apply legal clearance determination (CLEAR TO PROCEED / REFER TO CLO / DO NOT ENGAGE), and transmit clearance determination to the requesting function within 1 business day of completion.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | OFAC Screening Record | A12341 output |
| I2 | Input | FCPA Risk Classification | A12342 output (if foreign government-affiliated counterparty) |
| C1 | Control | Clearance Standard | [OFAC] — CLEAR required if SDN result = CLEAR; [FCPA] — High risk requires enhanced due diligence and CLO sign-off before engagement |
| O1 | Output | Counterparty Clearance Record | MECH-GRC record: counterparty_id, clearance_status (CLEAR/REFER_TO_CLO/DO_NOT_ENGAGE), clearance_date, legal_reviewer (if CLO review required), review_notes |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — clearance record and workflow routing |

**Binary Definition of Done:**
- ✓ MECH-GRC clearance record exists for each counterparty with clearance_status populated within 1 business day.
- ✓ DO_NOT_ENGAGE status triggers notification to requesting function.
- ✓ CLO review is documented for all REFER_TO_CLO determinations.

---

#### A1235: File Regulatory Reports and Pre-Merger Notifications

**Function:** File Regulatory Reports and Pre-Merger Notifications
**Supreme Constraint:** [HSR] 15 U.S.C. §18a; 16 CFR Parts 801-803 | SEC-SX, FORM-941

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Transaction and Filing Data | M&A transaction parameters (for HSR); financial and operational data (for periodic regulatory reports) |
| C1 | Control | Pre-Merger Notification | [HSR] 15 U.S.C. §18a — filing required if size-of-transaction and size-of-person thresholds met; 30-day initial waiting period (15 days for cash tender offers) |
| C2 | Control | Periodic Filing Obligations | SEC-SX, FORM-941, state regulatory reports — jurisdiction-specific periodic reporting obligations |
| O1 | Output | HSR Filing Package | Filed HSR notification with FTC/DOJ confirmation; waiting period start date |
| O2 | Output | Regulatory Filing Log | MECH-GRC calendar with all periodic filings submitted and confirmation numbers |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — filing calendar and tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — HSR threshold analysis and filing preparation |

**Child Nodes:** A12351, A12352, A12353

---

##### A12351: Calculate HSR Size-of-Transaction and Size-of-Person Thresholds

**Agent Definition:** Receive proposed M&A transaction parameters, calculate the size-of-transaction value and size-of-person values for both acquiring and acquired persons, apply the current HSR threshold rules, and determine whether HSR filing is required.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Transaction Parameters | Acquiring person identity and revenues, acquired person identity and revenues/assets, total transaction value, transaction type (asset/stock/merger) |
| C1 | Control | HSR Thresholds | [HSR] 16 CFR Part 801 — size-of-transaction threshold (annually adjusted by FTC; currently ~$119.5M); size-of-person threshold (one person ≥~$23.9M, other ≥~$239M); or unconditional threshold (~$478.9M) regardless of party size |
| O1 | Output | HSR Threshold Analysis | Memo with: size_of_transaction_value, acquiring_person_revenues, acquired_person_revenues_assets, filing_required (Y/N), threshold_basis, exemption_analysis (if applicable) |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — HSR threshold calculation and exemption analysis |

**Binary Definition of Done:**
- ✓ Threshold analysis memo contains size_of_transaction_value, both party revenues/assets, filing_required (Y/N) determination, and (if Y) identifies exemptions checked.
- ✓ Analysis is completed within 2 business days of transaction parameter receipt.

---

##### A12352: Prepare and Submit HSR Filing to FTC and DOJ

**Agent Definition:** For transactions where HSR filing is required, compile the Form C or Form S filing package (including Item 4(c) documents, financial statements, 5-year acquisition history, and entity information), file electronically with the FTC via HSR e-file, pay the applicable filing fee, and confirm the waiting period start date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | HSR Threshold Analysis | A12351 output confirming filing_required = Y |
| I2 | Input | HSR Filing Documents | Item 4(c) documents (board materials discussing acquisition), financial statements, 5-year acquisition history, entity structure charts |
| C1 | Control | HSR Filing Requirements | [HSR] 16 CFR Parts 801-803 — Form C (acquirer) and Form S (seller) required information; filing fee tiers based on size-of-transaction ($30K / $105K / $360K as of 2024) |
| O1 | Output | Filed HSR Notification | FTC e-file confirmation with: confirmation_number, filing_date, waiting_period_start_date, waiting_period_end_date (30 days from filing, or 15 for cash tender offer) |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — HSR filing tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — HSR form preparation |

**Binary Definition of Done:**
- ✓ FTC e-file returns confirmation_number.
- ✓ Waiting_period_start_date and waiting_period_end_date are recorded in MECH-GRC.
- ✓ No transaction closing occurs before waiting_period_end_date (or earlier clearance from FTC/DOJ).

---

##### A12353: Track Regulatory Filing Calendar and Submit Periodic Reports

**Agent Definition:** Maintain MECH-GRC regulatory filing calendar for all periodic reporting obligations (SEC, state agencies, banking regulators, other applicable bodies), generate filing packages 30 days before each deadline, submit on time, and log confirmation numbers.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Regulatory Filing Inventory | List of all periodic regulatory filing obligations with {regulator, form, frequency, deadline, responsible_function} |
| C1 | Control | Periodic Filing Obligations | Jurisdiction-specific regulatory reporting deadlines; late filings trigger penalties and potential enforcement action |
| O1 | Output | Submitted Regulatory Reports | Confirmation receipts per regulatory body with submission_date ≤ filing_deadline |
| O2 | Output | Regulatory Filing Log | MECH-GRC calendar: {obligation_id, regulator, form, due_date, submission_date, confirmation_number, status} |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — filing calendar, deadline tracking, and submission log |

**Binary Definition of Done:**
- ✓ MECH-GRC filing log shows submission_date ≤ due_date for every filing.
- ✓ Confirmation_number is populated for all submitted reports.
- ✓ No obligation status = OVERDUE.

---

#### A1236: Produce and Distribute Compliance Operating Envelope

**Function:** Produce and Distribute Compliance Operating Envelope
**Supreme Constraint:** [GDPR] Art. 24 | [FCPA] | [OFAC] | [FTC-5] | Internal policy governance

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Classified Regulatory Changes | Tier 1 and Tier 2 changes from A1231 requiring control updates |
| I2 | Input | DPIA Required Measures | Technical and organizational measures from A12322 DPIA §5 |
| C1 | Control | Accountability Obligation | [GDPR] Art. 24 — controller must implement appropriate technical and organizational measures |
| O1 | Output | Compliance Operating Envelope | Policy document in MECH-GRC specifying: prohibited actions, required controls, governing legal citations, effective date (→ IF-A1-03 → Engineering A14) |
| M1 | Mechanism | GRC Platform | [MECH-GRC] ServiceNow GRC, LogicGate — policy management and distribution |

**Child Nodes:** A12361, A12362, A12363

---

##### A12361: Translate Regulatory Change into Prohibitions and Required Controls

**Agent Definition:** For each Tier 1 or Tier 2 regulatory change and each DPIA-required measure, draft the corresponding policy rule as: (a) a specific prohibition (active verb phrase stating what is banned) or (b) a required control (active verb phrase stating the mandatory action and the constraint citation).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Regulatory Change or DPIA Required Measure | Classified regulatory change (A12312) or DPIA §5 measure (A12322) requiring policy translation |
| C1 | Control | Policy Rule Standard | Each policy rule must cite a named code from ctrl-constraint-library.md; rules must use active verb phrase form (R1.2a); rules must be binary (compliant/non-compliant evaluable) |
| O1 | Output | Draft Policy Rules | Numbered list: {rule_id, rule_type (prohibition/required_control), rule_text (active verb phrase), governing_constraint_code, affected_function} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — policy rule drafting |
| M2 | Mechanism | GRC Platform | [MECH-GRC] — rule staging workflow |

**Binary Definition of Done:**
- ✓ Every regulatory change with impact_tier ≤ 2 has ≥1 draft policy rule.
- ✓ Every rule_text is in active verb phrase form.
- ✓ Governing_constraint_code resolves to a named code in ctrl-constraint-library.md.

---

##### A12362: Update Compliance Operating Envelope Document in GRC System

**Agent Definition:** Integrate all approved draft policy rules into the Compliance Operating Envelope document in MECH-GRC, increment the document version number, obtain CLO approval signature, and record the effective date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Approved Draft Policy Rules | A12361 output — all new rules reviewed and approved by CLO |
| C1 | Control | Policy Governance | [IF-A1-03] Compliance Operating Envelope schema: Policy_ID, effective_date, scope, prohibited_actions[], required_controls[], governing_citations[], review_date, approval_signature |
| O1 | Output | Updated Compliance Operating Envelope | MECH-GRC policy document: version incremented, new rules integrated, effective_date set, CLO approval_signature present |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — policy document version management |

**Binary Definition of Done:**
- ✓ MECH-GRC Compliance Operating Envelope shows version_number incremented from prior version.
- ✓ Effective_date is populated.
- ✓ CLO approval_signature is present.
- ✓ All schema fields from IF-A1-03 are populated.

---

##### A12363: Distribute Updated Envelope to Engineering A14 and Confirm Receipt

**Agent Definition:** Transmit the updated Compliance Operating Envelope from MECH-GRC to Engineering A14 via MECH-MESSAGING, log distribution timestamp, and confirm acknowledgment receipt from the CTO-equivalent within 2 business days.

**[CROSS-FUNCTION: A12 → A14]** *Interface: IF-A1-03*

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Updated Compliance Operating Envelope | A12362 output — version-controlled policy document in MECH-GRC |
| C1 | Control | Cross-Function Interface Standard | [IF-A1-03] — Legal A12 produces Compliance Operating Envelope; Engineering A14 is the primary consumer; acceptance condition: legal citations resolve to ctrl-constraint-library.md entries AND policy approved by CLO-equivalent |
| O1 | Output | Distribution Confirmation | MECH-GRC distribution log: {envelope_version, distribution_date, recipient (Engineering A14 / CTO-equivalent), acknowledgment_timestamp} |
| M1 | Mechanism | GRC Platform | [MECH-GRC] — distribution workflow |
| M2 | Mechanism | Team Messaging API | [MECH-MESSAGING] Slack API, Microsoft Teams — distribution notification |

**Binary Definition of Done:**
- ✓ MECH-GRC distribution log records distribution_date.
- ✓ Acknowledgment_timestamp is populated within 2 business days of distribution_date.
- ✓ The envelope version transmitted matches the A12362 approved version.
*(IF-A1-03 output satisfied)*

---

**A123 Leaf Node Count:** 18 ✓

**Mandatory Inclusions — A123:**
- [x] GDPR Data Protection Impact Assessment — A1232 (A12321 trigger classification, A12322 8-section DPIA with DPA consultation, A12323 RoPA update); [GDPR-DPIA] Art. 35 fully applied
- [x] HSR Act pre-merger notification filing — A1235 (A12351 threshold calculation per 16 CFR Part 801, A12352 Form C/S filing with FTC e-file, A12353 regulatory calendar); waiting period tracking included
