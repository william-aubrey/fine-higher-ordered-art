# Skill File: Entity Governance & Corporate Law

**Node:** A121
**Parent:** A12 Legal
**Function:** Govern Entity Structure and Maintain Corporate Records
**Supreme Constraint:** [DEL-DGCL] Delaware General Corporation Law 8 Del. C. §141–228 | [RULLCA] Revised Uniform LLC Act §§407–410
**Cross-Function Interfaces:** (Inbound: IF-A1-01, IF-A1-02) (Outbound: feeds A122, A125; IF-A1-03 via A123)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [x] Corporate minute-book maintenance — satisfied at A1211

---

## Node Tree: A121

```
A121  Govern Entity Structure and Maintain Corporate Records
├── A1211  Maintain Corporate Records and Produce Minute Book          [mandatory: Corporate Minute Book]
│   ├── A12111  Index Meeting Notice and Agenda into Minute Book System
│   ├── A12112  Transcribe Board and Member Meeting Minutes to Final Record
│   └── A12113  Archive Officer Certificates and Corporate Authorization Records
├── A1212  Draft and Execute Board Consent Resolutions
│   ├── A12121  Draft Written Consent Resolution with Legal Citations
│   ├── A12122  Route Consent for Director and Officer Signatures
│   └── A12123  File Executed Consent in Minute Book and Notify Stakeholders
├── A1213  File Annual Reports and Maintain Registered Agent
│   ├── A12131  Track State Annual Report Deadlines and Prepare Filing Package
│   ├── A12132  Submit Annual Report and Fee to Secretary of State
│   └── A12133  Update Registered Agent Designation on State Record
├── A1214  Execute Entity Formation and Structural Changes
│   ├── A12141  Draft and File Articles of Organization or Incorporation
│   ├── A12142  Prepare and Execute Operating Agreement or Bylaws
│   └── A12143  File Merger, Conversion, or Dissolution with Secretary of State
├── A1215  Assess and Satisfy Foreign Qualification Requirements
│   ├── A12151  Evaluate Revenue and Payroll Nexus Triggers by Jurisdiction
│   ├── A12152  File Certificate of Authority in Required Foreign Jurisdictions
│   └── A12153  Monitor Ongoing Foreign Qualification Compliance and Renewals
└── A1216  Escalate to Principal — Major Governance Decision
    ├── A12161  Package Governance Decision Materials with Legal Memo
    ├── A12162  Route Decision Package to Principal and Record Binary Approval
    └── A12163  Update Corporate Records with Principal Decision and Rationale
```

---

### A121: Govern Entity Structure and Maintain Corporate Records

**Function:** Govern Entity Structure and Maintain Corporate Records
**Supreme Constraint:** [DEL-DGCL] 8 Del. C. §141–228 | [RULLCA] §§407–410

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Entity Formation Documents | Articles of organization/incorporation, operating agreement, bylaws; source: A12141–A12142 or historical record |
| I2 | Input | Board and Member Meeting Notices | Proposed agenda and attendee list; source: Principal or board scheduler |
| I3 | Input | State Annual Report Notices | State-issued filing reminders and fee schedules; source: MECH-ENTITY compliance calendar |
| I4 | Input | Foreign Nexus Activity Data | Revenue by jurisdiction, payroll by state, property footprint; source: Finance A11 and People A13 |
| C1 | Control | Corporate Governance Law | [DEL-DGCL] 8 Del. C. §141–228 — director meetings, written consent, quorum, fiduciary duties |
| C2 | Control | LLC Governance Law | [RULLCA] §§407–410 — member/manager voting rights, consent requirements, operating agreement primacy |
| O1 | Output | Maintained Minute Book | Indexed and signed board minutes, consents, and officer records in MECH-ENTITY |
| O2 | Output | Filed Annual Reports | Secretary of State confirmation numbers by jurisdiction |
| O3 | Output | Foreign Qualification Certificates | Certificate of Authority for each active foreign jurisdiction |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation Registered Agent, Cogency Global, Registered Agents Inc. |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] Clio, eCounsel, TeamConnect |
| M3 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI |

**Child Nodes:** A1211, A1212, A1213, A1214, A1215, A1216

---

#### A1211: Maintain Corporate Records and Produce Minute Book

**Function:** Maintain Corporate Records and Produce Minute Book
**Supreme Constraint:** [DEL-DGCL] 8 Del. C. §228 | [RULLCA] §407(b)

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Meeting Notices and Agendas | Issued notices with date, location, agenda items; source: board scheduler |
| I2 | Input | Draft Meeting Minutes | Meeting facilitator's contemporaneous notes; source: internal |
| I3 | Input | Officer Appointment Records | Board resolutions appointing or removing officers; source: A1212 |
| C1 | Control | Written Consent Statute | [DEL-DGCL] 8 Del. C. §228 — unanimous written consent permitted in lieu of meeting for corporations |
| C2 | Control | LLC Consent Standard | [RULLCA] §407(b) — action without meeting requires consent of members holding required voting power |
| O1 | Output | Maintained Minute Book | Sequential indexed record of all meetings, consents, and officer records in MECH-ENTITY |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation, Cogency Global |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI — drafting and formatting |

**Child Nodes:** A12111, A12112, A12113

---

##### A12111: Index Meeting Notice and Agenda into Minute Book System

**Agent Definition:** Receive board or member meeting notice and agenda, assign sequential meeting record number, tag with meeting type (board, annual member, special), and insert indexed record into MECH-ENTITY minute book such that the record is retrievable by date, meeting type, and agenda item within 24 hours of notice issuance.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Meeting Notice | Document containing: meeting date, time, location or virtual link, quorum statement, agenda items with proposing party, notice method and date sent |
| C1 | Control | Notice Requirements | [DEL-DGCL] §222 — written notice ≥10 days and ≤60 days before meeting; [RULLCA] §405 — reasonable notice required |
| O1 | Output | Indexed Meeting Record | MECH-ENTITY record with fields: meeting_id (sequential), meeting_type, meeting_date, notice_date, quorum_flag, agenda_items[] (indexed string array) |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation, Cogency Global — minute book module |

**Binary Definition of Done:**
- ✓ MECH-ENTITY returns record creation confirmation with assigned meeting_id.
- ✓ Record is retrievable via date filter.
- ✓ All agenda items appear as indexed entries in agenda_items array.

---

##### A12112: Transcribe Board and Member Meeting Minutes to Final Record

**Agent Definition:** Receive draft meeting minutes, verify all motions include mover, seconder (if required by governing documents), and vote tally (ayes/nays/abstentions by name), convert to final form, obtain corporate secretary digital signature, and file signed minutes in MECH-ENTITY within 30 days of meeting date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Draft Meeting Minutes | Contemporaneous notes with motion text, vote tallies, attendee list, and any dissenting statements |
| C1 | Control | Quorum and Voting Standard | [DEL-DGCL] §141(b) — director majority constitutes quorum; majority of quorum required to act; [RULLCA] §407(a) — member/manager meeting action rules |
| O1 | Output | Final Signed Meeting Minutes | Signed PDF in MECH-ENTITY with fields: meeting_id (cross-reference to A12111), secretary_signature_date, resolutions_passed[], resolutions_failed[], dissent_notes |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — minute book archival |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign API, Adobe Sign — secretary signature |

**Binary Definition of Done:**
- ✓ Signed minutes file exists in MECH-ENTITY with secretary_signature_date ≤ 30 days after meeting_date.
- ✓ All motion outcomes (passed/failed) are recorded with named vote counts.
- ✓ Record cross-references the meeting_id from A12111.

---

##### A12113: Archive Officer Certificates and Corporate Authorization Records

**Agent Definition:** Receive executed officer certificates, board appointment resolutions, and authority delegation documents, assign document ID using entity–date–type naming convention, cross-reference to the authorizing minute book entry, and archive in MECH-ENTITY with role-based access control.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Officer and Authority Documents | Executed officer certificates (incumbency certificates), board appointment resolutions, and delegation of authority matrices |
| C1 | Control | Officer Appointment Authority | [DEL-DGCL] §142 — officers appointed by board; [RULLCA] §407(c) — manager appointment by members |
| O1 | Output | Archived Authorization Record | MECH-ENTITY document with fields: doc_id (entity-YYYYMMDD-type), authorizing_resolution_id (cross-reference to A12112), officer_name, title, effective_date, access_control_tier |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — document archive with role-based access |

**Binary Definition of Done:**
- ✓ MECH-ENTITY returns document retrieval confirmation with assigned doc_id.
- ✓ Authorizing_resolution_id resolves to an existing signed minutes record from A12112.

---

#### A1212: Draft and Execute Board Consent Resolutions

**Function:** Draft and Execute Board Consent Resolutions
**Supreme Constraint:** [DEL-DGCL] 8 Del. C. §228 | [RULLCA] §407(b)

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Action Request with Business Justification | Description of corporate action, legal basis, and required authorizing parties; source: Principal or functional agent |
| I2 | Input | Applicable Governing Documents | Current operating agreement, bylaws, and prior resolutions; source: MECH-ENTITY |
| C1 | Control | Unanimous Consent Statute | [DEL-DGCL] 8 Del. C. §228 — written consent signed by all directors entitled to vote; filing with records required |
| C2 | Control | LLC Consent Standard | [RULLCA] §407(b) — consent of required majority of voting members |
| O1 | Output | Executed Written Consent Resolution | Signed consent with authorized action, effective date, and signatory list filed in MECH-ENTITY |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI — resolution drafting |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign API, Adobe Sign |

**Child Nodes:** A12121, A12122, A12123

---

##### A12121: Draft Written Consent Resolution with Legal Citations

**Agent Definition:** Receive corporate action request and governing documents, draft written consent resolution with recitals identifying legal authority, WHEREAS clauses, operative RESOLVED clause in active verb phrase form, and effective date, and return draft within 24 hours.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Action Request | Structured request with: action type, business purpose, required signatories, urgency flag |
| I2 | Input | Governing Documents | Current bylaws or operating agreement from MECH-ENTITY and any prior related resolutions |
| C1 | Control | Consent Authority | [DEL-DGCL] §228 for corporations; [RULLCA] §407(b) for LLCs — required consent threshold |
| O1 | Output | Draft Written Consent | Document with: recitals, WHEREAS clauses, RESOLVED clause (active verb phrase, R1.2a compliant), effective date, signature blocks for each required signatory |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI — resolution drafting from template |

**Binary Definition of Done:**
- ✓ Draft consent contains ≥1 RESOLVED clause in active verb phrase form.
- ✓ Identifies the governing statute citation.
- ✓ Lists all required signatories by name and title.

---

##### A12122: Route Consent for Director and Officer Signatures

**Agent Definition:** Load finalized consent draft into MECH-ESIGN, assign all required signatories as concurrent recipients, send routing notification with 48-hour deadline, and monitor completion status until all signatures are collected or deadline triggers escalation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Draft Written Consent | Finalized consent document from A12121 with all signature blocks identified |
| I2 | Input | Signatory Contact List | Name, title, and e-signature identity record for each required director/manager |
| C1 | Control | Electronic Signature Validity | [ESIGN-ACT] 15 U.S.C. §7001 — electronic signatures legally equivalent to wet signatures for corporate records |
| O1 | Output | Routing Confirmation | MECH-ESIGN envelope_id with signatory list, deadline timestamp, and completion status per signatory (pending/complete) |
| M1 | Mechanism | Electronic Signature | [MECH-ESIGN] DocuSign API, Adobe Sign — envelope creation and routing |

**Binary Definition of Done:**
- ✓ MECH-ESIGN envelope returns envelope_id.
- ✓ All required signatories appear in recipient list with status "sent".
- ✓ Deadline timestamp ≤ 48 hours from routing initiation.

---

##### A12123: File Executed Consent in Minute Book and Notify Stakeholders

**Agent Definition:** Receive fully executed consent from MECH-ESIGN, verify all required signatures are present, assign consent_id, file in MECH-ENTITY minute book under the authorized action category, and transmit filing confirmation to the requesting party within 1 business day of full execution.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed Written Consent | MECH-ESIGN completed envelope with all signatory completions and timestamps |
| C1 | Control | Record-Keeping Requirement | [DEL-DGCL] §228(d) — prompt filing of consents with corporate records; [RULLCA] §111 — records maintenance obligation |
| O1 | Output | Filed Consent Record | MECH-ENTITY record with: consent_id, action_type, execution_date, signatory_list[], cross-reference to triggering business request |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — minute book filing |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] — completed envelope retrieval |

**Binary Definition of Done:**
- ✓ MECH-ENTITY returns consent_id for the filed record.
- ✓ All signatory completions from MECH-ESIGN are present.
- ✓ Requesting party receives filing notification with consent_id within 1 business day of full execution.

---

#### A1213: File Annual Reports and Maintain Registered Agent

**Function:** File Annual Reports and Maintain Registered Agent
**Supreme Constraint:** [RULLCA] §111 | State annual report statutes

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | State Filing Deadline Calendar | Annual report due dates and fee schedules by jurisdiction; source: MECH-ENTITY compliance calendar |
| I2 | Input | Current Entity Status Data | Current officers, registered agent, principal address, member/director list; source: MECH-ENTITY |
| C1 | Control | State Annual Report Statute | [RULLCA] §111 — duty to maintain records; state-specific annual report statutes (NC G.S. §57D-1-22 for LLCs) |
| C2 | Control | Registered Agent Requirement | [RULLCA] §113 — entity must maintain registered agent with physical address in each formation and foreign qualification state |
| O1 | Output | Filed Annual Reports | Secretary of State confirmation receipt per jurisdiction |
| O2 | Output | Updated Registered Agent Records | Current registered agent designations in all active jurisdictions |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation, Cogency Global — filing calendar and agent services |

**Child Nodes:** A12131, A12132, A12133

---

##### A12131: Track State Annual Report Deadlines and Prepare Filing Package

**Agent Definition:** Query MECH-ENTITY compliance calendar for all pending annual report deadlines within 90 days, retrieve current entity data, assemble the filing package per each state's form requirements, and flag any filings due within 30 days as PRIORITY for immediate routing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Compliance Calendar Query | MECH-ENTITY response: list of {jurisdiction, filing_type, due_date, fee_amount} for all active registrations |
| I2 | Input | Current Entity Data | Officer list, principal address, registered agent name and address, member/director count from MECH-ENTITY |
| C1 | Control | State Annual Report Requirements | State-specific LLC Act or corporate statute annual report provisions — required form, required fields, filing method |
| O1 | Output | Annual Report Filing Package | Per-jurisdiction package: completed state form, fee payment authorization, preparer certification; packages with due_date ≤ 30 days flagged PRIORITY |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — compliance calendar API and form population |

**Binary Definition of Done:**
- ✓ MECH-ENTITY returns filing package records for all jurisdictions with due_date ≤ 90 days.
- ✓ All packages with due_date ≤ 30 days carry PRIORITY flag.
- ✓ No required data field is blank.

---

##### A12132: Submit Annual Report and Fee to Secretary of State

**Agent Definition:** Submit completed annual report filing package to the Secretary of State of each jurisdiction via online portal or MECH-ENTITY filing service, remit the required fee, and record the filing confirmation number and submission date in MECH-ENTITY compliance calendar.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Annual Report Filing Package | Completed state forms and fee authorization from A12131 |
| C1 | Control | Filing Deadline | State-specific due date; late filing triggers penalty fees and potential loss of good standing |
| O1 | Output | Filed Annual Report with Confirmation | Secretary of State confirmation_number, filing_date, and fee receipt per jurisdiction |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation, Cogency Global — state filing submission service |

**Binary Definition of Done:**
- ✓ MECH-ENTITY compliance calendar shows confirmation_number populated for each submitted jurisdiction.
- ✓ Submission_date ≤ state due_date for all filings.

---

##### A12133: Update Registered Agent Designation on State Record

**Agent Definition:** When registered agent change is required, prepare and file Statement of Change of Registered Agent with the Secretary of State of each affected jurisdiction, remit any filing fee, and update MECH-ENTITY agent record to reflect new designation with confirmed effective date.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Registered Agent Change Authorization | Board/manager consent from A1212 authorizing agent change, identifying new agent name and physical address |
| C1 | Control | Registered Agent Statute | [RULLCA] §113 — agent must have physical address (not P.O. Box) in the state; change effective upon state acceptance |
| O1 | Output | Updated Agent Record | Secretary of State change confirmation AND MECH-ENTITY record showing new_agent_name, effective_date, confirmation_number; prior agent record archived with termination_date |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — registered agent change filing service |

**Binary Definition of Done:**
- ✓ MECH-ENTITY agent record shows new registered agent with state-confirmed effective_date.
- ✓ Prior agent record is archived with termination_date populated.

---

#### A1214: Execute Entity Formation and Structural Changes

**Function:** Execute Entity Formation and Structural Changes
**Supreme Constraint:** [RULLCA] §201–202 | [DEL-DGCL] §101–111

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Formation Decision with Entity Type Election | Principal's entity type selection, jurisdiction, purpose, and capital structure |
| I2 | Input | Structural Change Authorization | Board/member consent from A1212 for merger, conversion, or dissolution |
| C1 | Control | Formation Statute | [RULLCA] §201–202 — LLC formation requirements; [DEL-DGCL] §101–111 — incorporation requirements |
| C2 | Control | Structural Change Statute | [RULLCA] §1001–1061 — merger and conversion; [DEL-DGCL] §251–275 — merger, consolidation, dissolution |
| O1 | Output | Filed Formation or Structural Change Documents | Secretary of State acceptance with effective date |
| O2 | Output | Executed Governing Entity Documents | Operating agreement or bylaws, fully signed and effective |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation, Cogency Global |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI — document drafting |

**Child Nodes:** A12141, A12142, A12143

---

##### A12141: Draft and File Articles of Organization or Incorporation

**Agent Definition:** Draft articles of organization (LLC) or articles of incorporation (corporation) per the formation jurisdiction's statutory requirements, verify entity name availability, and submit to Secretary of State with filing fee to obtain formation confirmation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Formation Parameters | Entity name (with name availability confirmation), jurisdiction, entity type, purpose clause, initial registered agent, member/director list |
| C1 | Control | Formation Requirements | [RULLCA] §201 — required contents of articles of organization; [DEL-DGCL] §102 — required contents of certificate of incorporation |
| O1 | Output | Filed Articles with State Acceptance | Secretary of State confirmation with entity file number, effective date, and stamped articles copy |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — state filing submission |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — articles drafting |

**Binary Definition of Done:**
- ✓ Secretary of State returns filing confirmation with entity file_number.
- ✓ Articles effective_date is populated.
- ✓ MECH-ENTITY entity record is created with formation_jurisdiction and entity_type fields populated.

---

##### A12142: Prepare and Execute Operating Agreement or Bylaws

**Agent Definition:** Draft operating agreement (LLC) or bylaws (corporation) incorporating governance structure, voting thresholds, officer roles, capital account mechanics, transfer restrictions, and dispute resolution clause; obtain all member/director signatures; and archive signed document in MECH-ENTITY.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Governance Parameters | Member/director identities, ownership percentages, voting rights design, officer structure, fiscal year, capital contribution schedule |
| C1 | Control | Operating Agreement Primacy | [RULLCA] §110 — operating agreement governs internal affairs; may modify most default rules except §110(c) non-waivable provisions |
| O1 | Output | Executed Operating Agreement or Bylaws | Signed PDF in MECH-ENTITY with all member/director signatures, effective date, and version number |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — governing document drafting |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] — member/director execution |
| M3 | Mechanism | Entity Management System | [MECH-ENTITY] — governing document archive |

**Binary Definition of Done:**
- ✓ MECH-ENTITY stores signed governing document with all member/director signatures confirmed via MECH-ESIGN.
- ✓ Document version number is set.
- ✓ No RULLCA §110(c) non-waivable provisions are modified.

---

##### A12143: File Merger, Conversion, or Dissolution with Secretary of State

**Agent Definition:** Receive board/member consent authorizing structural change, prepare and file the required statutory form (articles of merger, certificate of conversion, or articles of dissolution) with the Secretary of State of each required jurisdiction, remit filing fee, and archive state acceptance in MECH-ENTITY.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Structural Change Authorization | Executed consent from A1212 specifying change type, terms, and effective date |
| C1 | Control | Structural Change Statute | [RULLCA] §1001–1061 — LLC mergers and conversions; [DEL-DGCL] §251–275 — corporate mergers and dissolution; surviving entity obligations |
| O1 | Output | Filed Structural Change Document with State Acceptance | Secretary of State confirmation with effective date and new/surviving entity file status |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — structural change filing and record update |

**Binary Definition of Done:**
- ✓ Secretary of State returns acceptance confirmation for each required jurisdiction.
- ✓ MECH-ENTITY entity record reflects new entity type, name, or dissolution status with effective_date populated.

---

#### A1215: Assess and Satisfy Foreign Qualification Requirements

**Function:** Assess and Satisfy Foreign Qualification Requirements
**Supreme Constraint:** [RULLCA] §901–906 | State "doing business" nexus standards

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Operating Activity Data by Jurisdiction | Revenue, payroll, employees, property, and physical presence by state; source: Finance A11 and People A13 |
| C1 | Control | Foreign Qualification Standard | [RULLCA] §901 — transacting business test; state-specific nexus standards define "doing business" threshold |
| O1 | Output | Foreign Qualification Certificates | Certificate of Authority from each required jurisdiction |
| O2 | Output | Foreign Compliance Calendar | Ongoing annual report obligations in each foreign state in MECH-ENTITY |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation, Cogency Global — foreign qualification filing service |

**Child Nodes:** A12151, A12152, A12153

---

##### A12151: Evaluate Revenue and Payroll Nexus Triggers by Jurisdiction

**Agent Definition:** Receive quarterly operating activity data by state from Finance A11 and People A13, apply each state's "doing business" nexus test, and produce a Foreign Qualification Exposure Report identifying states where qualification is required but not yet obtained.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Operating Activity Report | Quarterly report: {state, revenue_amount, employee_count, payroll_amount, property_value, physical_presence_flag} per state |
| C1 | Control | Nexus Standard | [RULLCA] §901 — transacting business includes maintaining office, hiring employees, signing contracts in state; excludes isolated transactions and interstate commerce |
| O1 | Output | Foreign Qualification Exposure Report | Table: {state, nexus_triggered (Y/N), current_qualification_status, action_required} for all states with activity |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — current qualification status query |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — state-by-state nexus analysis |

**Binary Definition of Done:**
- ✓ Report contains an entry for every state with employee_count > 0 OR revenue_amount > $0.
- ✓ Each row has nexus_triggered flag set.
- ✓ All rows with nexus_triggered=Y and current_qualification_status=NONE have action_required=FILE.

---

##### A12152: File Certificate of Authority in Required Foreign Jurisdictions

**Agent Definition:** For each state identified as action_required=FILE in the Exposure Report, prepare and submit the Certificate of Authority application with required exhibits (certified formation documents, registered agent appointment, filing fee) to the Secretary of State.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Foreign Qualification Exposure Report | A12151 output identifying states requiring filing |
| I2 | Input | Certified Formation Documents | Certified copy of articles of organization/incorporation and good standing certificate from formation state; source: A12132 |
| C1 | Control | Foreign Qualification Statute | State-specific foreign LLC/corporation act; [RULLCA] §902 — required documents for foreign qualification |
| O1 | Output | Certificate of Authority per Jurisdiction | State-issued Certificate of Authority with effective date and file number |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] CT Corporation, Cogency Global — foreign qualification filing service |

**Binary Definition of Done:**
- ✓ MECH-ENTITY shows Certificate of Authority with state confirmation_number for each state where action_required=FILE.
- ✓ Qualification effective_date is populated.

---

##### A12153: Monitor Ongoing Foreign Qualification Compliance and Renewals

**Agent Definition:** Query MECH-ENTITY compliance calendar for foreign jurisdiction annual report deadlines, verify registered agent designations in each foreign state, and flag any lapsed qualifications or deadlines within 60 days for routing to A12131.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Foreign Qualification Registry | MECH-ENTITY list: {state, qualification_date, annual_report_due, registered_agent} for all active foreign qualifications |
| C1 | Control | Ongoing Compliance Obligation | State-specific annual report statutes for foreign entities; failure to file triggers loss of good standing and right to sue in state |
| O1 | Output | Foreign Compliance Status Report | Table: {state, annual_report_status (current/due/overdue), registered_agent_status, days_until_due} |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — compliance calendar and good standing monitoring |

**Binary Definition of Done:**
- ✓ Compliance status report covers 100% of active foreign qualification records in MECH-ENTITY.
- ✓ All jurisdictions with days_until_due ≤ 60 are flagged for A12131 routing.
- ✓ No jurisdiction shows status=overdue.

---

#### A1216: Escalate to Principal — Major Governance Decision

**Function:** Escalate to Principal — Major Governance Decision
**Supreme Constraint:** [RULLCA] §407 | [DEL-DGCL] §271 — sale of substantially all assets requires stockholder/member vote

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Proposed Governance Action | Description of action, legal authority required, business rationale, and decision deadline |
| C1 | Control | Major Transaction Standard | [DEL-DGCL] §271 — sale of substantially all assets; [RULLCA] §407 — acts outside ordinary course require unanimous or supermajority consent |
| O1 | Output | Signed Principal Approval or Rejection | Binary decision with documented rationale, archived in MECH-ENTITY |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — decision package preparation |
| M2 | Mechanism | Entity Management System | [MECH-ENTITY] — approval record archive |

**Child Nodes:** A12161, A12162, A12163

---

##### A12161: Package Governance Decision Materials with Legal Memo

**Agent Definition:** Compile relevant facts, proposed resolution text, legal authority citations, and risk analysis into a governance decision package with a legal memo (≤2 pages) containing: action summary, legal authority, 2–3 options with trade-offs, and CLO recommendation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed Governance Action | Action description, business rationale, legal requirements, and deadline |
| C1 | Control | Business Judgment Rule | [DEL-DGCL] §141 — directors must act on informed basis; legal memo satisfies the informed deliberation requirement for business judgment rule protection |
| O1 | Output | Governance Decision Package | Document with: (1) action summary ≤200 words, (2) legal authority citations from ctrl-constraint-library.md, (3) options analysis, (4) CLO recommendation, (5) proposed RESOLVED clause in R1.2a active verb phrase form |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — legal memo drafting |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] Google Workspace, Microsoft 365 — package assembly |

**Binary Definition of Done:**
- ✓ Package contains all 5 required sections.
- ✓ Proposed RESOLVED clause is in active verb phrase form.
- ✓ All legal citations resolve to named codes in ctrl-constraint-library.md.

---

##### A12162: Route Decision Package to Principal and Record Binary Approval

**Agent Definition:** Transmit governance decision package to Principal via MECH-MESSAGING with explicit binary decision request (APPROVE / REJECT), record Principal's response with timestamp, and return the signed decision status to the initiating workflow.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Governance Decision Package | A12161 output, complete with all 5 sections |
| C1 | Control | Principal Sovereignty | Non-delegatable sovereign judgment — Principal approval required for acts outside ordinary course [RULLCA] §407 |
| O1 | Output | Signed Binary Decision | Principal's APPROVE or REJECT response with timestamp and optional rationale note, stored in MECH-DOC |
| M1 | Mechanism | Team Messaging API | [MECH-MESSAGING] Slack API, Microsoft Teams API — decision routing and response capture |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] — decision record storage |

**Binary Definition of Done:**
- ✓ Principal returns binary APPROVE or REJECT response with timestamp.
- ✓ Response is stored in MECH-DOC with decision_date.
- ✓ Process execution is resumed (APPROVE) or halted (REJECT) accordingly.

---

##### A12163: Update Corporate Records with Principal Decision and Rationale

**Agent Definition:** Receive signed binary decision from A12162, prepare the corresponding board/member consent resolution reflecting the decision, route through A1212 for execution, and archive the final decision record in MECH-ENTITY cross-referenced to the initiating action package.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Binary Decision | A12162 output: decision type (APPROVE/REJECT), timestamp, and rationale |
| C1 | Control | Record-Keeping Obligation | [RULLCA] §111 — member resolutions and actions must be maintained in records; [DEL-DGCL] §220 — records available for inspection |
| O1 | Output | Filed Decision Resolution | Executed consent from A1212 filed in MECH-ENTITY with cross-reference to A12161 decision package |
| M1 | Mechanism | Entity Management System | [MECH-ENTITY] — final resolution archive |

**Binary Definition of Done:**
- ✓ MECH-ENTITY contains a filed consent record with consent_id cross-referenced to the governance decision package.
- ✓ The record reflects Principal's APPROVE or REJECT decision with rationale_note.

---

**A121 Leaf Node Count:** 18 ✓

**Mandatory Inclusions — A121:**
- [x] Corporate minute-book maintenance — A1211 (indexed in MECH-ENTITY, signed within 30 days, officer records archived with resolution cross-references)
