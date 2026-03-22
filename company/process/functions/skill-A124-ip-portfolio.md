# Skill File: IP Portfolio Management

**Node:** A124
**Parent:** A12 Legal
**Function:** Build, Protect, and License IP Portfolio
**Supreme Constraint:** [AIA] America Invents Act 35 U.S.C. §100 et seq. | [LANHAM] 15 U.S.C. §1051 et seq. | [DTSA] 18 U.S.C. §1836
**Cross-Function Interfaces:** (Inbound: IF-A1-01; product specs from Engineering A14) (Outbound: IP licenses → Sales A33)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [x] Patent claim drafting and prosecution docketing — satisfied at A1241 (A12411–A12413)

---

## Node Tree: A124

```
A124  Build, Protect, and License IP Portfolio
├── A1241  Draft Patent Claims and Manage Prosecution Docket           [mandatory: Patent Claim Docketing]
│   ├── A12411  Draft Independent and Dependent Patent Claims with Claim Chart
│   ├── A12412  File Patent Application via USPTO Patent Center and Obtain Filing Receipt
│   └── A12413  Track USPTO Office Actions, Deadlines, and Maintenance Fees in Docket
├── A1242  Register and Monitor Trademark Portfolio
│   ├── A12421  Conduct Trademark Clearance Search and Render Clear-to-Use Opinion
│   ├── A12422  File Trademark Application on TEAS and Respond to USPTO Office Actions
│   └── A12423  Monitor Mark for Infringement and Issue Cease-and-Desist Letters
├── A1243  Administer Trade Secret and Confidentiality Controls
│   ├── A12431  Classify Assets as Trade Secrets and Document Reasonable Measures
│   ├── A12432  Execute NDA and Confidentiality Agreements for All Disclosures
│   └── A12433  Audit Trade Secret Access Logs and Respond to Unauthorized Disclosure
├── A1244  Register Copyright and Administer DMCA Compliance
│   ├── A12441  Register Original Works with U.S. Copyright Office
│   ├── A12442  Issue DMCA Takedown Notice for Infringing Content
│   └── A12443  Designate DMCA Agent and Maintain Safe Harbor Compliance
├── A1245  Execute IP Licensing and Assignment Agreements
│   ├── A12451  Draft IP License with Field-of-Use, Territory, and Royalty Terms
│   ├── A12452  Record IP Assignment with USPTO and U.S. Copyright Office
│   └── A12453  Track Royalty Obligations and Generate License Compliance Report
└── A1246  Conduct Freedom-to-Operate Analysis
    ├── A12461  Identify Relevant Patent Claims and Map to Product Features
    ├── A12462  Produce FTO Opinion Letter with Infringement Risk Assessment
    └── A12463  Escalate High-Risk FTO Finding to Principal with Design-Around Options
```

---

### A124: Build, Protect, and License IP Portfolio

**Function:** Build, Protect, and License IP Portfolio
**Supreme Constraint:** [AIA] 35 U.S.C. §100 et seq. | [LANHAM] 15 U.S.C. §1051 et seq. | [DTSA] 18 U.S.C. §1836

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Invention Disclosures and Product Specifications | Engineering A14 invention disclosures, product feature specifications, creative works; source: Engineering A14 |
| I2 | Input | Competitive IP Landscape | Prior art searches, competitor patent portfolios, trademark watch reports |
| I3 | Input | NDA and Disclosure Events | Third-party disclosure requests requiring confidentiality agreements |
| I4 | Input | IP License or Assignment Requests | Inbound license requests or proposed IP assignments from/to third parties |
| C1 | Control | Patent Law | [AIA] America Invents Act 35 U.S.C. §§100–390 — first-inventor-to-file; prior art; claim drafting requirements (§112) |
| C2 | Control | Trademark Law | [LANHAM] 15 U.S.C. §1051 et seq. — trademark registration, use-based and intent-to-use applications, likelihood of confusion standard |
| C3 | Control | Trade Secret Law | [DTSA] 18 U.S.C. §1836 — federal trade secret protection; reasonable measures requirement; misappropriation remedies |
| C4 | Control | Copyright Law | [COPY-17] 17 U.S.C. §§101–1401 — work-for-hire, registration (prerequisite for suit), DMCA §512 safe harbor |
| O1 | Output | Patent Portfolio | Filed and issued patents; prosecution docket with deadlines in MECH-DOCKET |
| O2 | Output | Trademark Portfolio | Registered marks; watch service alerts; enforcement records |
| O3 | Output | Trade Secret Register | Classified assets with reasonable measures documentation |
| O4 | Output | IP License Agreements | Executed IP licenses and assignments |
| O5 | Output | FTO Opinion Letters | Freedom-to-operate legal opinions per product |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] CPI CaseLog, Anaqua, FoundationIP — prosecution deadlines, USPTO filing, maintenance fees |
| M2 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] Google Patents, Derwent Innovation, USPTO TESS/Patent Center — prior art and clearance searches |
| M3 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] Anthropic Claude API, Harvey AI, Lexis+ AI |
| M4 | Mechanism | CLM Platform | [MECH-CLM] — IP license agreement lifecycle |

**Child Nodes:** A1241, A1242, A1243, A1244, A1245, A1246

---

#### A1241: Draft Patent Claims and Manage Prosecution Docket

**Function:** Draft Patent Claims and Manage Prosecution Docket
**Supreme Constraint:** [AIA] 35 U.S.C. §112 — claim definiteness | §102 — prior art | §103 — obviousness

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Invention Disclosure | Inventor's written disclosure: invention description, novel aspects, prior art known to inventor, preferred embodiments, drawings |
| I2 | Input | Prior Art Search Results | Comprehensive search of USPTO, EPO, WIPO databases |
| C1 | Control | Claim Drafting Requirements | [AIA] 35 U.S.C. §112 — claims must particularly point out and distinctly claim the subject matter; §101 patent-eligible subject matter; §102 novelty; §103 non-obviousness |
| O1 | Output | Filed Patent Application | USPTO Patent Center filing receipt with application serial number |
| O2 | Output | Prosecution Docket | MECH-DOCKET record with all deadlines (response to OA, RCE, appeal, maintenance fees) |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] CPI CaseLog, Anaqua, FoundationIP |
| M2 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] Derwent Innovation, Google Patents, USPTO Patent Center |
| M3 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — claim drafting and office action response |

**Child Nodes:** A12411, A12412, A12413

---

##### A12411: Draft Independent and Dependent Patent Claims with Claim Chart

**Agent Definition:** Receive invention disclosure and prior art search, draft ≥1 independent claim covering the broadest patentable scope and ≥3 dependent claims narrowing to preferred embodiments, produce a claim chart mapping each claim element to the corresponding disclosure section, and verify §112 definiteness for each claim.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Invention Disclosure and Prior Art Search | Inventor's disclosure (novel aspects, embodiments, drawings) + prior art search results from MECH-IP-SEARCH |
| C1 | Control | Claim Definiteness | [AIA] 35 U.S.C. §112(b) — claims must particularly point out and distinctly claim the subject matter; §112(f) means-plus-function limitations; §101 eligible subject matter (not abstract idea, law of nature, natural phenomenon alone) |
| O1 | Output | Patent Claim Set with Claim Chart | Claim set: ≥1 independent claim + ≥3 dependent claims in standard patent format; claim chart: {claim_number, claim_element, disclosure_section_reference, prior_art_distinguishing_feature} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — claim drafting from disclosure |
| M2 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] — prior art cross-reference during drafting |

**Binary Definition of Done:**
- ✓ Claim set contains ≥1 independent claim + ≥3 dependent claims.
- ✓ Each independent claim element has a disclosure_section_reference in the claim chart.
- ✓ No claim uses "means for" language without §112(f) intended.
- ✓ §101 eligibility analysis note is appended.

---

##### A12412: File Patent Application via USPTO Patent Center and Obtain Filing Receipt

**Agent Definition:** Assemble the complete patent application package (specification, abstract, drawings, claims, inventor declarations, assignment), submit electronically via USPTO Patent Center, pay the applicable filing fee, and confirm receipt of official filing date and application serial number.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Patent Application Package | Specification with claims from A12411, abstract (≤150 words), drawings, inventor oath/declaration, assignment (if applicable), filing fee calculation |
| C1 | Control | Filing Requirements | [AIA] 35 U.S.C. §111 — application must include specification, claims, abstract, and drawings (if necessary); inventor oath/declaration; §119 priority claim (if applicable) |
| O1 | Output | USPTO Filing Receipt | Official filing receipt: application_serial_number, filing_date, confirmation_number, applicable_fees_paid |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — filing submission and receipt archival |
| M2 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] USPTO Patent Center — electronic submission portal |

**Binary Definition of Done:**
- ✓ USPTO Patent Center returns official filing receipt with application_serial_number and filing_date.
- ✓ MECH-DOCKET record is created with serial_number, filing_date, and 12-month response-to-first-OA deadline calculated.
- ✓ All required fees confirmed as paid.

---

##### A12413: Track USPTO Office Actions, Deadlines, and Maintenance Fees in Docket

**Agent Definition:** Monitor USPTO Patent Center for all office actions, notices, and allowances on active applications; record each action in MECH-DOCKET with applicable response deadline (calculated with statutory extensions); generate 90-30-7-day deadline alerts; and track issued patent maintenance fee payment windows.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | USPTO Case Status Updates | USPTO Patent Center status feed for all active applications and issued patents: {serial_number, action_type, mailing_date, statutory_deadline} |
| C1 | Control | Response Deadlines | [AIA] 35 U.S.C. §133 — response to OA required within 3 months statutory (extendable to 6 months with fee); §4.5 maintenance fee windows: 3.5, 7.5, 11.5 years from issue date; failure = abandonment or lapse |
| O1 | Output | Updated Prosecution Docket | MECH-DOCKET records updated: {application_id, action_type, mailing_date, statutory_deadline, extended_deadline, maintenance_fee_amount, maintenance_fee_due_date, alert_status} |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] CPI CaseLog, Anaqua — docketing and alert engine |

**Binary Definition of Done:**
- ✓ MECH-DOCKET shows updated record for each office action within 5 business days of USPTO mailing_date.
- ✓ All deadlines have 90-day and 30-day alerts scheduled.
- ✓ Issued patent maintenance fee windows are docketed with payment deadlines.

---

#### A1242: Register and Monitor Trademark Portfolio

**Function:** Register and Monitor Trademark Portfolio
**Supreme Constraint:** [LANHAM] 15 U.S.C. §1051 et seq. | [MADRID] WIPO Madrid Protocol

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Mark and Goods/Services Specification | Proposed mark (word/logo/slogan), list of goods/services, use-in-commerce specimens (if use-based) |
| I2 | Input | Trademark Watch Alerts | Third-party applications and uses identified by trademark watch service |
| C1 | Control | Trademark Registration | [LANHAM] 15 U.S.C. §1051 — use-based application (§1(a)) or intent-to-use (§1(b)); likelihood of confusion standard (§1052(d)) |
| C2 | Control | International Registration | [MADRID] WIPO Madrid Protocol — international registration via WIPO based on home country registration |
| O1 | Output | Registered Trademarks | USPTO certificate of registration; WIPO international registration (if applicable) |
| O2 | Output | Enforcement Actions | Cease-and-desist letters; TTAB opposition or cancellation proceedings |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] Anaqua, FoundationIP — trademark prosecution and watch service |
| M2 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] USPTO TESS, Corsearch, TrademarkNow — clearance and monitoring |

**Child Nodes:** A12421, A12422, A12423

---

##### A12421: Conduct Trademark Clearance Search and Render Clear-to-Use Opinion

**Agent Definition:** Receive proposed mark and goods/services specification, execute comprehensive clearance search (USPTO TESS, state registers, common law databases, domain names) for identical and confusingly similar marks, and render a written Clear-to-Use Opinion (GO / PROCEED WITH CAUTION / DO NOT USE) with risk rationale.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Proposed Mark and Goods/Services | Mark text or image, International Class(es), specific goods/services description |
| C1 | Control | Likelihood of Confusion Standard | [LANHAM] §1052(d) — mark refused if likely to cause confusion with prior registered mark; DuPont factors: similarity of marks, relatedness of goods, sophistication of buyers, channels of trade |
| O1 | Output | Clear-to-Use Opinion | Written opinion: {mark, classes, search_databases_searched, conflicting_marks_found[], risk_assessment, opinion (GO/PROCEED_WITH_CAUTION/DO_NOT_USE), rationale} |
| M1 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] USPTO TESS, Corsearch, TrademarkNow — comprehensive clearance search |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — DuPont factor analysis |

**Binary Definition of Done:**
- ✓ Opinion documents all search databases searched.
- ✓ conflicting_marks_found[] lists all potentially confusing marks with DuPont factor analysis.
- ✓ Opinion is one of {GO/PROCEED_WITH_CAUTION/DO_NOT_USE}.
- ✓ Rationale cites [LANHAM] §1052(d).

---

##### A12422: File Trademark Application on TEAS and Respond to USPTO Office Actions

**Agent Definition:** File trademark application via USPTO TEAS (use-based or intent-to-use), pay applicable filing fee, docket all response deadlines, monitor for and respond to Office Actions (likelihood of confusion, merely descriptive, specimen rejection) within the statutory deadline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Clear-to-Use Opinion (GO or PROCEED WITH CAUTION) | A12421 output; mark approved for filing |
| I2 | Input | Specimens of Use (if use-based) | Evidence of mark in commerce: website screenshot, product label, storefront image |
| C1 | Control | Application Filing Requirements | [LANHAM] §1051(a) — use-based requires specimen; §1051(b) — ITU requires bona fide intent; §13 — Office Action response deadline 3 months (extendable to 6) |
| O1 | Output | Filed TEAS Application | USPTO application serial number, filing date, and MECH-DOCKET entry with response deadlines |
| O2 | Output | Responded Office Actions | USPTO Office Action response filed within deadline with arguments and/or amended identification of goods/services |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — trademark prosecution calendar |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — office action response drafting |

**Binary Definition of Done:**
- ✓ USPTO returns application_serial_number with filing_date.
- ✓ MECH-DOCKET shows all prosecution deadlines docketed.
- ✓ All Office Action responses are filed before the 3-month statutory deadline (or extended deadline with fee).

---

##### A12423: Monitor Mark for Infringement and Issue Cease-and-Desist Letters

**Agent Definition:** Configure trademark watch service to monitor USPTO applications, internet uses, and domain registrations for marks confusingly similar to company's registered marks; for confirmed infringement, draft and transmit cease-and-desist letter within 30 days of identification; log all enforcement actions in MECH-DOCKET.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Trademark Watch Alerts | Third-party applications, internet uses, and domain registrations flagged as potentially infringing |
| C1 | Control | Mark Protection Obligation | [LANHAM] §1127 — trademark rights may be abandoned through failure to police; §1114 — infringement standard (likelihood of confusion in commerce) |
| O1 | Output | Cease-and-Desist Letter (if infringement confirmed) | Written letter: identifies registered mark, registration number, identified infringement, demand to cease use within 10 business days, reservation of rights |
| O2 | Output | Enforcement Log | MECH-DOCKET record per watch alert: {alert_date, infringing_party, mark_used, action_taken (monitor/C&D/opposition/cancel), outcome} |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — watch service and enforcement log |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — infringement analysis and C&D drafting |

**Binary Definition of Done:**
- ✓ MECH-DOCKET enforcement log has an entry for every watch alert.
- ✓ Confirmed infringement triggers C&D letter transmitted within 30 days of identification.
- ✓ C&D letter references registered mark number and [LANHAM] §1114.

---

#### A1243: Administer Trade Secret and Confidentiality Controls

**Function:** Administer Trade Secret and Confidentiality Controls
**Supreme Constraint:** [DTSA] 18 U.S.C. §1836 — federal trade secret; reasonable measures prerequisite

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Asset Inventory | Technical information, formulas, processes, business data, customer lists potentially qualifying as trade secrets |
| I2 | Input | Third-Party Disclosure Requests | Requests to share company information with vendors, partners, or counterparties |
| C1 | Control | Trade Secret Definition | [DTSA] 18 U.S.C. §1839(3) — information must: (a) derive economic value from being secret, (b) be subject to reasonable measures to keep secret |
| O1 | Output | Trade Secret Register | Classified asset inventory with documented reasonable measures |
| O2 | Output | Executed NDAs | Confidentiality agreements executed before each third-party disclosure |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — NDA templates and execution |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — trade secret register and enforcement tracking |

**Child Nodes:** A12431, A12432, A12433

---

##### A12431: Classify Assets as Trade Secrets and Document Reasonable Measures

**Agent Definition:** Receive asset inventory from Engineering A14, evaluate each asset against the DTSA two-part trade secret test (economic value from secrecy + reasonable measures), classify qualifying assets as trade secrets, and document the specific reasonable measures protecting each asset.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Technical and Business Asset Inventory | List of: algorithms, source code, customer data, pricing models, formulas, manufacturing processes; source: Engineering A14 and Finance A11 |
| C1 | Control | Trade Secret Test | [DTSA] 18 U.S.C. §1839(3) — (a) information derives independent economic value from not being generally known; (b) subject to reasonable measures to maintain secrecy; failure to document measures defeats trade secret claim |
| O1 | Output | Trade Secret Register | MECH-MATTER record per asset: {asset_id, asset_description, classification (trade_secret/not_qualified), economic_value_rationale, reasonable_measures[] (access controls, NDA, encryption, physical security)} |
| M1 | Mechanism | Legal Matter Management | [MECH-MATTER] — trade secret register |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — DTSA classification analysis |

**Binary Definition of Done:**
- ✓ MECH-MATTER trade secret register has an entry for every reviewed asset.
- ✓ Each classified trade_secret entry lists ≥2 specific reasonable_measures.
- ✓ economic_value_rationale is present.
- ✓ Register is reviewed and updated annually.

---

##### A12432: Execute NDA and Confidentiality Agreements for All Disclosures

**Agent Definition:** For every proposed disclosure of company confidential information to a third party, confirm an NDA is executed before disclosure, retrieve the applicable standard NDA template from MECH-CLM, route for signature via MECH-ESIGN, and confirm execution before disclosure is authorized.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Disclosure Request | Identification of information to be disclosed, recipient identity, purpose, and expected duration |
| C1 | Control | Reasonable Measures Requirement | [DTSA] §1839(3)(A) — reasonable measures to keep information secret; unprotected disclosure may destroy trade secret status |
| O1 | Output | Executed NDA | MECH-CLM executed NDA with: counterparty_name, disclosure_scope, confidentiality_period, permitted_use, return_or_destruction_obligation, governing_law |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — NDA template and execution |
| M2 | Mechanism | Electronic Signature | [MECH-ESIGN] — NDA execution |

**Binary Definition of Done:**
- ✓ MECH-CLM shows executed NDA for each disclosure with counterparty_name and disclosure_scope populated BEFORE any confidential information is transmitted.
- ✓ NDA includes confidentiality_period and governing_law fields.

---

##### A12433: Audit Trade Secret Access Logs and Respond to Unauthorized Disclosure

**Agent Definition:** Quarterly, pull access logs from Engineering A14 IAM systems for all trade-secret-classified assets, compare against authorized access roster in trade secret register, identify unauthorized access events, and for confirmed unauthorized disclosure, initiate A1261 legal hold and refer matter to A126 Litigation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | IAM Access Logs | Engineering A14 MECH-IAM logs: {asset_id, user_id, access_timestamp, access_type (read/write/export)} for all trade-secret-classified assets |
| I2 | Input | Authorized Access Roster | Trade secret register (A12431) authorized_users[] per asset |
| C1 | Control | Misappropriation Trigger | [DTSA] 18 U.S.C. §1836(b)(1) — misappropriation includes acquisition by improper means or disclosure without consent; statute of limitations 3 years from discovery |
| O1 | Output | Access Audit Report | Quarterly report: {asset_id, access_events_count, unauthorized_events_count, unauthorized_user_ids[], action_taken} |
| O2 | Output | Litigation Referral (if unauthorized disclosure) | Matter referral to A126 with evidence package |
| M1 | Mechanism | Identity and Access Management | [MECH-IAM] Okta, Microsoft Entra ID — access log export |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — unauthorized disclosure case record |

**Binary Definition of Done:**
- ✓ Quarterly audit report covers 100% of trade-secret-classified asset access logs.
- ✓ Any unauthorized_events_count > 0 triggers A1261 legal hold initiation.
- ✓ Audit report is completed within 15 business days of quarter end.

---

#### A1244: Register Copyright and Administer DMCA Compliance

**Function:** Register Copyright and Administer DMCA Compliance
**Supreme Constraint:** [COPY-17] 17 U.S.C. §§101–1401 | [COPY-17] §512 DMCA Safe Harbor

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Original Creative Works | Software, written content, audiovisual works, graphic design; source: Engineering A14 and Marketing A32 |
| I2 | Input | Infringement Reports | Third-party use of company copyrighted works without license |
| C1 | Control | Copyright Protection | [COPY-17] 17 U.S.C. §411 — registration is prerequisite for infringement suit (for US works); §412 — statutory damages and attorney's fees require pre-infringement registration |
| C2 | Control | DMCA Safe Harbor | [COPY-17] 17 U.S.C. §512 — online service provider safe harbor requires: registered DMCA agent, responsive takedown policy, no actual knowledge of infringement |
| O1 | Output | Copyright Registrations | U.S. Copyright Office registration certificates |
| O2 | Output | DMCA Compliance Records | Agent registration, takedown notices sent, safe harbor compliance log |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — copyright registration tracking |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — DMCA notice drafting |

**Child Nodes:** A12441, A12442, A12443

---

##### A12441: Register Original Works with U.S. Copyright Office

**Agent Definition:** For each original work identified as warranting copyright registration, prepare and file the application with the U.S. Copyright Office (via Copyright.gov eCO system), pay filing fee, and docket the registration certificate number in MECH-DOCKET upon receipt.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Work for Registration | Original work with: title, creation date, authorship (employee/contractor — work-for-hire analysis), deposit copy |
| C1 | Control | Registration Requirements | [COPY-17] 17 U.S.C. §408 — deposit + application + fee; §411 — registration prerequisite for US work infringement suit; work-for-hire under §101 — employee created in scope of employment or specially commissioned with written agreement |
| O1 | Output | Copyright Registration Certificate | Copyright.gov registration certificate with: registration_number, effective_date, title, author, claimant |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — copyright registration tracking |

**Binary Definition of Done:**
- ✓ Copyright.gov returns registration_number.
- ✓ MECH-DOCKET record is created with registration_number, effective_date, and work_title.
- ✓ Work-for-hire status is documented in the registration record.

---

##### A12442: Issue DMCA Takedown Notice for Infringing Content

**Agent Definition:** Receive infringing content report, verify company ownership of the copied work, draft DMCA §512(c)(3) takedown notice with all required elements, transmit to the platform's designated DMCA agent, and log the notice with service confirmation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Infringing Content Report | URL of infringing content, identified original company work, evidence of copying |
| C1 | Control | DMCA Takedown Requirements | [COPY-17] 17 U.S.C. §512(c)(3) — valid takedown notice must include: (a) physical or electronic signature of authorized agent, (b) identification of copyrighted work, (c) identification of infringing material with URL, (d) contact information, (e) good faith belief statement, (f) accuracy statement under penalty of perjury |
| O1 | Output | Transmitted DMCA Takedown Notice | Written notice meeting all 6 §512(c)(3) requirements transmitted to platform's designated DMCA agent with transmission_confirmation |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — DMCA notice drafting |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — takedown enforcement log |

**Binary Definition of Done:**
- ✓ DMCA takedown notice contains all 6 §512(c)(3) required elements.
- ✓ transmission_confirmation is logged in MECH-MATTER.
- ✓ Platform acknowledgment or takedown action is recorded within 14 days.

---

##### A12443: Designate DMCA Agent and Maintain Safe Harbor Compliance

**Agent Definition:** Register a designated DMCA agent with the U.S. Copyright Office, publish agent contact information in the platform's terms or legal notices page, implement a repeat infringer policy, and annually verify registration currency to maintain §512 safe harbor eligibility.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Platform Operating Status | Confirmation that company operates a platform hosting user-generated content that could attract §512 safe harbor needs |
| C1 | Control | Safe Harbor Requirements | [COPY-17] 17 U.S.C. §512(c)(2) — designated agent must be registered with Copyright Office via DMCA.copyright.gov; registration must be renewed every 3 years; repeat infringer policy must be implemented and enforced |
| O1 | Output | DMCA Safe Harbor Compliance Record | MECH-DOCKET record: agent_registration_number, registration_date, renewal_due_date (3 years from registration), policy_page_url (where agent info is published), repeat_infringer_policy_published (Y/N) |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — DMCA agent registration and renewal tracking |

**Binary Definition of Done:**
- ✓ MECH-DOCKET shows agent_registration_number from Copyright Office.
- ✓ renewal_due_date is docketed with 90-day alert.
- ✓ repeat_infringer_policy_published = Y.
- ✓ Annual compliance verification note is dated within the last 12 months.

---

#### A1245: Execute IP Licensing and Assignment Agreements

**Function:** Execute IP Licensing and Assignment Agreements
**Supreme Constraint:** [AIA] 35 U.S.C. §261 (patent assignment) | [LANHAM] 15 U.S.C. §1060 (trademark assignment with goodwill)

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | License or Assignment Request | Proposed transaction: licensor/licensee identities, IP assets, territory, field of use, term, royalty structure |
| C1 | Control | Patent Assignment Recordation | [AIA] 35 U.S.C. §261 — assignments should be recorded with USPTO within 3 months |
| C2 | Control | Trademark Assignment with Goodwill | [LANHAM] 15 U.S.C. §1060 — trademark assignment without goodwill is void ("naked assignment") |
| O1 | Output | Executed IP License or Assignment | Signed agreement in MECH-CLM; USPTO/Copyright Office recordation confirmation (for assignments) |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — IP license lifecycle |
| M2 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — assignment recordation tracking |

**Child Nodes:** A12451, A12452, A12453

---

##### A12451: Draft IP License with Field-of-Use, Territory, and Royalty Terms

**Agent Definition:** Draft IP license agreement specifying: licensor, licensee, licensed IP (patent numbers, trademark registrations, or copyright registration numbers), field of use, territory, license type (exclusive/non-exclusive/sole), term, royalty rate and payment schedule, sublicensing rights, and audit rights.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | License Parameters | Negotiated commercial terms: IP assets, field of use, territory, exclusivity, term, royalty rate, payment schedule, sublicensing permission |
| C1 | Control | License Completeness | [AIA] §261 for patents; [LANHAM] §1060 for trademarks (must include quality control provision to preserve mark validity); [COPY-17] §204 for exclusive copyright licenses (must be in writing) |
| O1 | Output | Draft IP License Agreement | Complete draft: licensed IP schedule, field_of_use, territory, license_type, term, royalty_rate, payment_schedule, sublicensing_rights, quality_control (trademarks), audit_rights_provision, governing_law |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — IP license drafting |
| M2 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — license template and draft management |

**Binary Definition of Done:**
- ✓ Draft license contains all required fields.
- ✓ Trademark licenses include quality_control provision.
- ✓ Exclusive copyright licenses are in writing per [COPY-17] §204.
- ✓ Royalty calculation method is unambiguous.

---

##### A12452: Record IP Assignment with USPTO and U.S. Copyright Office

**Agent Definition:** Upon execution of an IP assignment agreement, prepare and file the assignment recordation with USPTO Patent Center (for patents) or USPTO TEAS (for trademarks) or Copyright.gov (for copyrights), pay filing fee, and log the recordation confirmation in MECH-DOCKET.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed IP Assignment Agreement | Signed assignment agreement with: assignor, assignee, IP assets transferred, consideration, effective date |
| C1 | Control | Assignment Recordation | [AIA] 35 U.S.C. §261 — assignment recorded at USPTO provides constructive notice; failure to record within 3 months may defeat priority against subsequent bona fide purchaser; [COPY-17] §205 — copyright assignment recorded with Copyright Office |
| O1 | Output | Assignment Recordation Confirmation | USPTO or Copyright.gov recordation certificate: reel_and_frame_number (USPTO) or recordation_number (Copyright Office), recorded_date |
| M1 | Mechanism | Patent and Trademark Docketing | [MECH-DOCKET] — assignment recordation tracking |

**Binary Definition of Done:**
- ✓ MECH-DOCKET shows recordation confirmation (reel_and_frame or recordation_number) for each assigned IP asset.
- ✓ recorded_date ≤ 3 months after assignment execution_date (for patents).
- ✓ Assignment covers all transferred IP assets listed in the agreement.

---

##### A12453: Track Royalty Obligations and Generate License Compliance Report

**Agent Definition:** Monthly, extract royalty payment obligations from all active IP licenses in MECH-CLM, calculate royalties due based on licensee's reported sales or usage, verify payments received against amounts due, and produce a License Compliance Report flagging any underpayment ≥ materiality threshold.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Active License Records | MECH-CLM: all active licenses with {royalty_rate, royalty_base (revenue/units), payment_due_date, payment_received} |
| C1 | Control | Audit Right | License-specific audit right provision; [GAAP-MATERIALITY] — underpayments ≥5% of license royalty receivable are material |
| O1 | Output | License Compliance Report | Monthly report: {license_id, royalty_period, royalty_due, royalty_received, variance, variance_pct, action_required (none/demand_letter/audit_trigger)} |
| M1 | Mechanism | Contract Lifecycle Management | [MECH-CLM] — royalty tracking and reporting |
| M2 | Mechanism | Business Intelligence | [MECH-BI] — compliance report generation |

**Binary Definition of Done:**
- ✓ Report covers 100% of active licenses with royalty obligations.
- ✓ variance_pct ≥ 5% triggers action_required = demand_letter or audit_trigger.
- ✓ Report is generated monthly within 15 days of period end.

---

#### A1246: Conduct Freedom-to-Operate Analysis

**Function:** Conduct Freedom-to-Operate Analysis
**Supreme Constraint:** [AIA] 35 U.S.C. §271 — patent infringement | §298 — FTO opinion admissible to negate willfulness

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Product Feature Specification | Engineering A14 product specifications identifying features to be analyzed for FTO |
| I2 | Input | Competitor Patent Portfolio | Relevant patents identified via prior art search; source: MECH-IP-SEARCH |
| C1 | Control | Infringement Standard | [AIA] 35 U.S.C. §271(a) — direct infringement: makes/uses/sells/offers/imports patented invention; §271(b) — induced infringement; claim-by-claim, element-by-element analysis required |
| O1 | Output | FTO Opinion Letter | Legal opinion: freedom to operate on specific product version, infringement risk per patent, design-around options |
| M1 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] Derwent Innovation, Google Patents — patent claim analysis |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — claim mapping and infringement analysis |

**Child Nodes:** A12461, A12462, A12463

---

##### A12461: Identify Relevant Patent Claims and Map to Product Features

**Agent Definition:** Receive product feature specification, search patent databases for patents claiming similar technology, identify all unexpired patents with claims potentially reading on product features, and produce a Claim Mapping Matrix mapping each product feature to each relevant patent claim.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Product Feature Specification | Detailed technical specification of product features to be analyzed |
| I2 | Input | Patent Database Search | MECH-IP-SEARCH results: unexpired patents in relevant technology classes |
| C1 | Control | Claim Construction Standard | [AIA] 35 U.S.C. §112 — claims construed in light of specification; Phillips v. AWH claim construction standard (ordinary meaning to PHOSITA) |
| O1 | Output | Claim Mapping Matrix | Table: {patent_number, claim_number, claim_text, product_feature_mapped, elements_present (Y/N per element), preliminary_risk (High/Medium/Low/None)} |
| M1 | Mechanism | IP Search Tools | [MECH-IP-SEARCH] Derwent Innovation, Google Patents — claim text extraction and analysis |
| M2 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — claim element-by-element mapping |

**Binary Definition of Done:**
- ✓ Claim mapping matrix covers all product features.
- ✓ All claims mapped as preliminary_risk High or Medium have element-by-element analysis completed.
- ✓ Matrix covers patents filed within the last 20 years in the relevant technology classes.

---

##### A12462: Produce FTO Opinion Letter with Infringement Risk Assessment

**Agent Definition:** Using the Claim Mapping Matrix, conduct element-by-element infringement analysis for all High and Medium preliminary risk patents, apply claim construction and patent scope analysis, and produce a signed FTO Opinion Letter with: freedom-to-operate conclusion per product feature, risk tier per patent (infringe/likely-infringe/design-around-needed/free), and design-around options for infringement risks.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Claim Mapping Matrix | A12461 output — complete element-by-element mapping for High and Medium risk patents |
| C1 | Control | Willful Infringement Defense | [AIA] 35 U.S.C. §298 — FTO opinion letter is admissible to negate willfulness; attorney opinion must be competent and timely obtained before product launch |
| O1 | Output | FTO Opinion Letter | Signed legal opinion: {product_version_analyzed, analysis_date, per_patent_conclusions[], overall_freedom_to_operate (Y/N/Qualified), recommended_design_arounds[], reliance_caveat} |
| M1 | Mechanism | Legal AI / LLM API | [MECH-LEGAL-AI] — FTO analysis drafting |
| M2 | Mechanism | Legal Matter Management | [MECH-MATTER] — FTO opinion archive |

**Binary Definition of Done:**
- ✓ FTO opinion letter contains per_patent_conclusions[] for all High and Medium risk patents.
- ✓ overall_freedom_to_operate determination is one of {Y/N/Qualified}.
- ✓ Letter is signed by attorney.
- ✓ Archived in MECH-MATTER before product launch date.

---

##### A12463: Escalate High-Risk FTO Finding to Principal with Design-Around Options

**Agent Definition:** For any FTO opinion with overall_freedom_to_operate = N or Qualified, compile the risk summary, identified blocking patents, and ≥2 design-around options per blocking patent into a Principal Decision Package; route to Principal with binary choices (PROCEED WITH DESIGN-AROUND / HALT / SEEK LICENSE); and record the decision.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FTO Opinion Letter | A12462 output with overall_freedom_to_operate = N or Qualified |
| C1 | Control | Principal Authority | Non-delegatable judgment — product launch under infringement risk and design-around/licensing decisions |
| O1 | Output | Principal Decision Package | Document: blocking_patents[], per_patent_design_around_options[], estimated_redesign_cost, patent_expiry_dates, license_acquisition_feasibility_note |
| O2 | Output | Signed Principal Decision | Binary PROCEED_WITH_DESIGN_AROUND / HALT / SEEK_LICENSE with timestamp; transmitted to Engineering A14 |
| M1 | Mechanism | Team Messaging API | [MECH-MESSAGING] — Principal escalation and decision capture |
| M2 | Mechanism | Document Collaboration | [MECH-DOC] — decision package and record |

**Binary Definition of Done:**
- ✓ Principal Decision Package contains ≥2 design-around_options per blocking patent.
- ✓ Principal returns signed decision within requested deadline.
- ✓ Engineering A14 receives decision transmission with implementation instructions.

---

**A124 Leaf Node Count:** 18 ✓

**Mandatory Inclusions — A124:**
- [x] Patent claim drafting and prosecution docketing — A1241: A12411 (independent + dependent claims with claim chart, §112 definiteness verified), A12412 (USPTO Patent Center filing with receipt), A12413 (OA deadlines, maintenance fee windows docketed in MECH-DOCKET with 90-30-7-day alerts); [AIA] 35 U.S.C. §§111–133 fully applied
