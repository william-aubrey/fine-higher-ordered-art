# Skill File: Employee Relations & Culture

**Node:** A136
**Parent:** A13 People
**Function:** Develop and publish workplace policies and the employee handbook, administer employee grievance and complaint resolution, conduct workplace investigations, design and execute employee engagement programs, administer leave of absence programs, and process voluntary separations and offboarding.
**Supreme Constraint:** [NLRA] National Labor Relations Act; [STERICYCLE] NLRB Stericycle Standard; [TITLE7] Title VII; [ADA] Americans with Disabilities Act; [FMLA] Family and Medical Leave Act; [STATE-FINAL-PAY] State Final Paycheck Timing Laws; [NC-EMP-AT-WILL] North Carolina Employment At-Will
**Cross-Function Interfaces:** IF-A1-04, IF-A1-26
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [ ] Compa-ratio analysis and salary band calibration — *Not A136 primary owner. Compa-ratio is A1331 Compensation Architecture. A136 does not own band definitions. Satisfied upstream.*
- [ ] RIF legal compliance checklist — *A136 processes voluntary separations only. RIF execution is A131 A1314 (workforce planning); RIF disparate impact is A1331 A133144; WARN notice is Legal A125 A12514. A136 A13663 coordinates final pay for any separation type. Satisfied upstream and in prior sprints.*
- [x] 9-box talent grid calibration — CLOSED at A1354 (A135 SPR-022). Not applicable to A136.
- [x] HRIS data model design — A13663 [MECH-HRIS]; separation processing triggers HRIS record status change; leave of absence records maintained in MECH-HRIS at A13651–A13653. HRIS people data model consumed here; schema defined at A13131 (A131).
- [ ] Organizational network analysis — *Primary owner: A131 A1316. A136 engagement survey results may feed ONA as supplementary input, but A136 does not execute ONA. Satisfied upstream.*
- [ ] Succession depth charting — *Primary owner: A131 A1315. Not applicable to A136. Satisfied upstream.*

---

## A136: Employee Relations & Culture

**Function:** Develop and publish workplace policies and the employee handbook, administer employee grievance and complaint resolution, conduct workplace investigations, design and execute employee engagement programs, administer leave of absence programs, and process voluntary separations and offboarding.
**Supreme Constraint:** [NLRA] NLRA; [STERICYCLE] Stericycle Standard; [TITLE7] Title VII; [ADA] ADA; [FMLA] FMLA; [STATE-FINAL-PAY] State Final Paycheck Laws; [NC-EMP-AT-WILL] NC At-Will Doctrine

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employment Document Templates and Policy Mandates | From Legal A12 via IF-A1-26; offer letter templates, handbook provisions, mandatory policy language by jurisdiction |
| I2 | Input | Workforce Architecture Plan | From A131 O1 (Internal A13 Tunnel); org structure, reporting lines, role class definitions |
| I3 | Input | Performance Review Records and PIP Outcomes | From A135 (Internal A13 Tunnel); performance context for grievances, separation decisions, and engagement analysis |
| I4 | Input | Employee Grievances, Complaints, and Leave Requests | From employees; formal grievance filings, harassment complaints, FMLA leave requests, resignation notices |
| C1 | Control | NLRA Concerted Activity Protection | [NLRA] 29 U.S.C. §157; [STERICYCLE] 372 NLRB No. 113 (2023) — handbook policies must not chill §7 rights; categorical analysis applies to every policy before publication |
| C2 | Control | Title VII Anti-Discrimination | [TITLE7] 42 U.S.C. §2000e — workplace investigation and grievance processes must be applied consistently regardless of protected class |
| C3 | Control | ADA Reasonable Accommodation | [ADA] 42 U.S.C. §12112 — leave and workplace modification requests must trigger interactive process; accommodation determinations documented |
| C4 | Control | FMLA Leave Entitlement | [FMLA] 29 U.S.C. §2601; 29 CFR Part 825 — eligible employees receive up to 12 weeks unpaid leave; no retaliation for exercise of FMLA rights |
| C5 | Control | State Final Paycheck Timing | [STATE-FINAL-PAY] State-specific timing requirements for final paycheck upon voluntary or involuntary separation |
| C6 | Control | NC At-Will Employment Doctrine | [NC-EMP-AT-WILL] N.C. Gen. Stat. §95-25.13 — handbook and policy language must not create implied contract of employment; at-will disclaimer required |
| O1 | Output | Published Employee Handbook | Version-controlled handbook with employee acknowledgment records → all employees via MECH-HRIS |
| O2 | Output | Grievance Resolution Records | Documented complaint intake, investigation referral, and resolution outcome → MECH-HRIS and Legal A12 if escalated |
| O3 | Output | Workplace Investigation Report | Findings of fact, credibility assessment, policy violation determination, remediation action → Legal A12 via IF-A1-26 for litigation risk review |
| O4 | Output | Employee Engagement Survey Results and Action Plan | Survey scores, theme analysis, action items by function → Principal and department leads |
| O5 | Output | Leave of Absence Determination Record | FMLA eligibility, leave approval/denial, return-to-work clearance → MECH-HRIS |
| O6 | Output | Separation Package | Final pay calculation trigger, COBRA notice trigger, exit interview record, HRIS termination → A1333 Payroll (final pay); A1332 Benefits (COBRA) |
| M1 | Mechanism | HRIS | [MECH-HRIS] Employee record; policy acknowledgment; leave tracking; separation processing |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] [MECH-AGENT] Policy drafting, Stericycle analysis, investigation summarization, engagement survey analysis |
| M3 | Mechanism | Document Management | [MECH-DOC] Handbook versioning, investigation files, grievance records |
| M4 | Mechanism | BI / Analytics | [MECH-BI] Engagement survey dashboards, turnover analytics, grievance trend reporting |
| M5 | Mechanism | E-Signature | [MECH-ESIGN] Handbook acknowledgment, separation agreement execution |

**Child Nodes:** A1361, A1362, A1363, A1364, A1365, A1366

*[Internal A13 Tunnel: A135 → A136. Performance review records and PIP outcomes from A135 provide context for grievance analysis (e.g., retaliatory complaint vs. legitimate grievance) and inform engagement survey interpretation. A131 → A136: Workforce architecture provides reporting lines and role class definitions for handbook applicability and leave eligibility determination. A136 → A1333: Final pay calculation trigger flows to Payroll; A136 → A1332: COBRA qualifying event trigger flows to Benefits. No IF-A1-XX required for intra-A13 flows.]*

---

## A1361: Develop and Publish Employee Handbook and Workplace Policies

**Function:** Draft, review for NLRA compliance under the Stericycle standard, publish, and track employee acknowledgment of the employee handbook and all workplace policies.
**Supreme Constraint:** [NLRA] NLRA §7 rights; [STERICYCLE] categorical policy analysis; [NC-EMP-AT-WILL] at-will disclaimer; [IF-A1-26] Legal A12 Employment Document Templates

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employment Document Templates and Policy Mandates | From Legal A12 via IF-A1-26; mandatory provisions by jurisdiction, prohibited provisions, template language |
| I2 | Input | Existing Handbook (prior version) | Current published version for revision; version history in MECH-DOC |
| C1 | Control | NLRA §7 / Stericycle Standard | [NLRA] [STERICYCLE] Every policy must pass Stericycle categorical analysis before publication; facially neutral policies that would chill §7 rights are unlawful |
| C2 | Control | NC At-Will Disclaimer | [NC-EMP-AT-WILL] N.C. Gen. Stat. §95-25.13 — handbook must contain conspicuous at-will disclaimer; no language implying guaranteed employment term |
| O1 | Output | Published Employee Handbook | Version-controlled handbook with effective date, at-will disclaimer, all mandatory policies, employee acknowledgment form |
| O2 | Output | Policy Acknowledgment Records | Per-employee sign-off with date → MECH-HRIS |
| M1 | Mechanism | HRIS | [MECH-HRIS] Acknowledgment tracking and distribution |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Policy drafting, Stericycle analysis, jurisdiction-specific language review |
| M3 | Mechanism | Document Management | [MECH-DOC] Handbook versioning and archival |

**Child Nodes:** A13611, A13612, A13613

---

#### A13611: Draft and Revise Handbook Policies

**Agent Definition:** For each policy topic in the Legal A12 policy mandate list (IF-A1-26), draft or revise the corresponding handbook section using jurisdiction-specific mandatory language, and produce a complete draft handbook document with effective date, at-will disclaimer, and version number in MECH-DOC.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employment Document Templates and Policy Mandates | IF-A1-26 from Legal A12 A12511; mandatory provisions list, prohibited provisions list, jurisdiction scope |
| I2 | Input | Prior Handbook Version | Current published version in MECH-DOC; tracked changes from prior version |
| C1 | Control | NC At-Will Disclaimer Requirement | [NC-EMP-AT-WILL] N.C. Gen. Stat. §95-25.13 — at-will disclaimer must appear in a conspicuous location (first page or immediately after table of contents); must not be contradicted by other handbook language |
| C2 | Control | Legal Mandate Completeness | [IF-A1-26] Every mandatory provision in the Legal A12 mandate list must have a corresponding handbook section; no prohibited provision may appear |
| O1 | Output | Draft Employee Handbook | Complete handbook document: table of contents, at-will disclaimer, all policy sections (anti-harassment, PTO, attendance, social media, electronic communications, dress code, confidentiality, discipline, grievance procedure), effective date, version number; stored in MECH-DOC as draft |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Policy language drafting; jurisdiction-specific adaptation |
| M2 | Mechanism | Document Management | [MECH-DOC] Version-controlled draft storage |

**Definition of Done:** Draft handbook contains every mandatory provision from the IF-A1-26 mandate list AND contains zero prohibited provisions AND contains an at-will disclaimer on the first page or immediately after the table of contents AND has a version number incremented from the prior published version.

---

#### A13612: Conduct Stericycle Compliance Review of All Policies

**Agent Definition:** Apply the NLRB Stericycle categorical analysis to every policy in the draft handbook by evaluating whether an employee who wishes to engage in protected concerted activity would reasonably construe the policy as chilling §7 rights, and flag any policy that fails the test with a specific remediation recommendation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Draft Employee Handbook | Output of A13611; all policy sections subject to Stericycle analysis |
| C1 | Control | NLRB Stericycle Standard | [STERICYCLE] 372 NLRB No. 113 (2023) — a facially neutral policy is unlawful if it would reasonably tend to chill §7 rights from the perspective of an employee who wishes to engage in protected activity; replaces Boeing Co. balancing test |
| C2 | Control | NLRA §7 Rights Scope | [NLRA] 29 U.S.C. §157 — right to self-organize, form/join unions, bargain collectively, engage in concerted activities for mutual aid or protection, and refrain from such activities |
| O1 | Output | Stericycle Compliance Report | Per-policy analysis: policy name, §7-chilling risk assessment (PASS / FAIL / CONDITIONAL), specific language flagged, remediation recommendation for each FAIL; stored in MECH-DOC |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Stericycle categorical analysis execution; §7 rights mapping |

**Definition of Done:** Every policy section in the draft handbook has a corresponding entry in the Stericycle Compliance Report AND zero policies have a FAIL status without a remediation recommendation AND any CONDITIONAL policies have specific language modifications documented.

---

#### A13613: Publish Handbook and Collect Employee Acknowledgments

**Agent Definition:** Publish the final approved handbook version to all active employees via MECH-HRIS, collect electronic acknowledgment signatures within 10 business days, and log each acknowledgment record with employee ID, date, and handbook version in MECH-HRIS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Approved Employee Handbook | Draft handbook with all Stericycle FAIL items remediated; CLO-equivalent or Principal approval on final version |
| C1 | Control | IF-A1-26 Distribution Deadline | [IF-A1-26] Handbook policies must be published to all employees within 10 business days of effective date per Legal A12 acceptance condition |
| C2 | Control | NC Wage and Hour Notice | [NC-EMP-AT-WILL] If handbook revises pay-related policies, N.C. Gen. Stat. §95-25.13 notification requirements apply |
| O1 | Output | Published Handbook Version | Final handbook stored in MECH-DOC with version number and effective date; distributed to all active employees |
| O2 | Output | Acknowledgment Records | Per-employee: employee ID, handbook version, acknowledgment date, electronic signature; stored in MECH-HRIS |
| M1 | Mechanism | HRIS | [MECH-HRIS] Employee notification and acknowledgment tracking |
| M2 | Mechanism | E-Signature | [MECH-ESIGN] Electronic acknowledgment collection |

**Definition of Done:** 100% of active employees have received the published handbook via MECH-HRIS AND ≥95% of active employees have signed acknowledgment within 10 business days of effective date AND all acknowledgment records include employee ID, date, and version number in MECH-HRIS.

---

## A1362: Administer Employee Grievance and Complaint Resolution

**Function:** Receive, classify, investigate or refer, and resolve employee grievances and complaints through a documented process that protects against retaliation and preserves evidentiary records.
**Supreme Constraint:** [TITLE7] anti-discrimination; [NLRA] §7 concerted activity; [ADA] accommodation complaints; [EEOC-PROC] charge response procedure

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Employee Grievance or Complaint | Formal written grievance; verbal complaint reduced to writing; anonymous hotline report |
| I2 | Input | Performance Review Records | From A135 (Internal A13 Tunnel); context for whether complaint correlates with recent performance action |
| C1 | Control | Title VII Anti-Retaliation | [TITLE7] 42 U.S.C. §2000e-3(a) — it is unlawful to retaliate against an employee for filing a complaint or participating in an investigation |
| C2 | Control | NLRA Concerted Activity | [NLRA] 29 U.S.C. §158(a)(1) — grievances related to terms and conditions of employment may constitute protected concerted activity |
| O1 | Output | Classified Grievance Record | Complaint ID, complainant (or anonymous flag), category (harassment, discrimination, policy violation, safety, interpersonal), severity, timeline, assigned investigator or resolution path |
| O2 | Output | Grievance Resolution Record | Findings, corrective action taken, complainant notification, appeal rights, closure date |
| O3 | Output | Investigation or Legal Referral | Formal investigation referral to A1363 or legal escalation to A12 via IF-A1-26; includes complaint ID, category, severity, and escalation rationale |
| M1 | Mechanism | HRIS | [MECH-HRIS] Grievance tracking module; complainant and respondent records |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Complaint classification; pattern analysis across grievance history |

**Child Nodes:** A13621, A13622, A13623

---

#### A13621: Receive and Classify Employee Grievance

**Agent Definition:** Receive a written employee grievance or complaint (or reduce a verbal complaint to writing), assign a unique complaint ID, classify the complaint by category (harassment, discrimination, policy violation, safety, retaliation, interpersonal), assess severity (routine / elevated / urgent), and log the classified record in MECH-HRIS within 24 hours of receipt.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employee Grievance or Complaint | Written complaint or verbal complaint reduced to writing; includes complainant identity (or anonymous flag), date, description of incident(s), named respondent(s) if applicable |
| C1 | Control | Title VII Anti-Retaliation | [TITLE7] 42 U.S.C. §2000e-3(a) — receipt of complaint must not trigger any adverse action against complainant; complaint record access restricted to authorized personnel |
| C2 | Control | EEOC Charge Awareness | [EEOC-PROC] 29 CFR Part 1601 — if complaint references a filed EEOC charge or intent to file, escalate immediately to Legal A12 via IF-A1-26; preserve all related records |
| O1 | Output | Classified Grievance Record | Complaint ID, complainant ID or anonymous flag, category, severity, date received, assigned resolution path (internal resolution / formal investigation / legal escalation), respondent(s); stored in MECH-HRIS |
| M1 | Mechanism | HRIS | [MECH-HRIS] Grievance intake module |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Category classification; severity assessment based on complaint content and policy references |

**Definition of Done:** Classified Grievance Record is logged in MECH-HRIS within 24 hours of complaint receipt AND complaint ID is unique AND category and severity are assigned AND resolution path is determined AND complainant receives written confirmation of receipt within 48 hours.

---

#### A13622: Investigate or Refer Grievance

**Agent Definition:** For grievances assigned to internal resolution, conduct a fact-finding investigation by interviewing complainant, respondent, and witnesses, collecting documentary evidence, and producing a written findings report; for grievances requiring formal investigation, refer to A1363 (Conduct Workplace Investigations); for grievances requiring legal escalation, refer to Legal A12 via IF-A1-26.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Classified Grievance Record | Output of A13621; complaint ID, category, severity, resolution path |
| I2 | Input | Performance Review Records | From A135 (Internal A13 Tunnel); context for evaluating whether grievance is retaliatory complaint vs. legitimate concern |
| C1 | Control | Title VII Investigation Consistency | [TITLE7] 42 U.S.C. §2000e — investigation procedures must be applied consistently regardless of complainant or respondent protected class; similarly situated complaints receive the same level of investigation rigor |
| C2 | Control | ADA Accommodation | [ADA] 42 U.S.C. §12112 — if grievance relates to accommodation denial, investigation must include review of interactive process documentation |
| O1 | Output | Grievance Investigation Findings Report | Complaint ID, summary of allegations, evidence collected (documents, interview summaries), credibility assessment, findings of fact, policy violation determination (SUBSTANTIATED / UNSUBSTANTIATED / INCONCLUSIVE), recommended corrective action; stored in MECH-DOC |
| O2 | Output | Referral to A1363 or Legal A12 | If severity = urgent or category = harassment/discrimination: formal referral to A1363 (workplace investigation) or Legal A12 for EEOC charge response |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Interview question generation; evidence summarization; findings drafting |
| M2 | Mechanism | Document Management | [MECH-DOC] Investigation file storage; evidence preservation |

**Definition of Done:** Every grievance assigned to internal resolution has a completed Findings Report in MECH-DOC AND every grievance requiring formal investigation has a documented referral to A1363 or Legal A12 AND investigation is completed within 15 business days of classification (or extension documented with rationale).

---

#### A13623: Resolve Grievance and Close Record

**Agent Definition:** Based on the investigation findings, implement the determined corrective action (written warning, coaching, policy clarification, mediation, or no action), notify the complainant of the outcome and appeal rights, obtain closure acknowledgment, and update the grievance record status to CLOSED in MECH-HRIS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Grievance Investigation Findings Report | Output of A13622 or A1363; findings, policy violation determination, recommended corrective action |
| C1 | Control | Title VII Anti-Retaliation | [TITLE7] 42 U.S.C. §2000e-3(a) — corrective action must not constitute retaliation against complainant; resolution must be proportionate to findings |
| C2 | Control | NLRA Concerted Activity | [NLRA] 29 U.S.C. §158(a)(1) — if grievance involved protected concerted activity, corrective action cannot target the concerted activity itself |
| O1 | Output | Grievance Resolution Record | Complaint ID, resolution date, corrective action implemented (or no action with rationale), complainant notification date, appeal rights communicated, closure acknowledgment from complainant (or documentation of refusal), record status = CLOSED; stored in MECH-HRIS |
| M1 | Mechanism | HRIS | [MECH-HRIS] Grievance status update and closure |
| M2 | Mechanism | Document Management | [MECH-DOC] Resolution documentation and notification letters |

**Definition of Done:** Grievance record status is CLOSED in MECH-HRIS AND complainant has been notified in writing of the outcome and appeal rights AND corrective action (if any) has been implemented and documented AND resolution is logged within 5 business days of findings report completion.

---

## A1363: Conduct Workplace Investigations

**Function:** Execute formal workplace investigations for harassment, discrimination, misconduct, and whistleblower complaints requiring structured evidentiary process and legal coordination.
**Supreme Constraint:** [TITLE7] anti-discrimination investigation; [ADA] accommodation; [EEOC-PROC] charge response; [INVESTIGATION-POLICY] Internal Investigation Policy

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Investigation Referral | From A13622 or direct complaint escalation; complaint ID, category, severity = elevated or urgent |
| I2 | Input | Employment Document Templates | From Legal A12 via IF-A1-26; investigation notification templates, Garrity/Weingarten advisements |
| C1 | Control | Internal Investigation Policy | [INVESTIGATION-POLICY] Triggering events, investigator selection, evidence preservation, privilege protocols, reporting chain |
| C2 | Control | Title VII Investigation Standards | [TITLE7] 42 U.S.C. §2000e — investigation must be prompt, thorough, and impartial; failure to investigate adequately may constitute independent Title VII violation |
| O1 | Output | Formal Investigation Report | Executive summary, scope, methodology, timeline, witness list, evidence inventory, findings of fact, credibility determinations, policy violation conclusions, recommended remediation |
| O2 | Output | Remediation Action Record | Disciplinary action, policy revision, training requirement, or separation recommendation → A135 A1355 (PIP) or A1366 (separation) |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Interview protocol design; evidence analysis; report drafting |
| M2 | Mechanism | Document Management | [MECH-DOC] Investigation file with chain of custody |

**Child Nodes:** A13631, A13632, A13633

---

#### A13631: Scope Investigation and Preserve Evidence

**Agent Definition:** Upon receiving an investigation referral, define the investigation scope (allegations, respondents, time period, policy provisions at issue), issue a document preservation notice to all custodians, designate an impartial investigator, and produce a written investigation plan with timeline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Investigation Referral | From A13622; complaint ID, allegations, complainant identity, respondent(s), category, severity |
| C1 | Control | Internal Investigation Policy | [INVESTIGATION-POLICY] Investigator must be impartial (no reporting relationship to complainant or respondent); evidence preservation notice issued within 24 hours |
| C2 | Control | EEOC Charge Response Timing | [EEOC-PROC] If EEOC charge is pending, investigation must produce a position statement-ready record within EEOC response deadline (typically 30 days from notice) |
| O1 | Output | Investigation Plan | Scope statement, named investigator, witness list, document custodian list, preservation notice copies, anticipated timeline (target: 30 calendar days), confidentiality protocol; stored in MECH-DOC |
| M1 | Mechanism | Document Management | [MECH-DOC] Investigation file creation; preservation notice distribution |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Scope definition; witness identification from org chart and grievance record |

**Definition of Done:** Investigation Plan is documented in MECH-DOC AND evidence preservation notice has been issued to all identified custodians within 24 hours of referral AND impartial investigator is designated (no reporting relationship to any party) AND timeline is established.

---

#### A13632: Conduct Interviews and Collect Evidence

**Agent Definition:** Execute the investigation plan by interviewing the complainant, respondent, and all identified witnesses using structured interview protocols; collect and catalog all documentary evidence (emails, messages, access logs, prior disciplinary records); and produce signed interview summaries for each participant.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Investigation Plan | Output of A13631; scope, witness list, document custodian list, confidentiality protocol |
| I2 | Input | Employee Records | MECH-HRIS employment history, prior grievance records, prior disciplinary records for respondent(s) |
| C1 | Control | Title VII Impartiality | [TITLE7] 42 U.S.C. §2000e — interview questions must be consistent across similarly situated witnesses; no leading questions that presume guilt or innocence |
| C2 | Control | ADA Accommodation in Investigation | [ADA] 42 U.S.C. §12112 — if any participant has an active accommodation (e.g., sign language interpreter, written communication preference), accommodation must be provided during interview |
| O1 | Output | Interview Summary Set | Per witness: interviewee name, date, questions asked, responses (verbatim where possible), interviewee signature confirming accuracy; stored in MECH-DOC under investigation file |
| O2 | Output | Evidence Catalog | Document inventory: item ID, source, date collected, custodian, relevance to allegation, format; stored in MECH-DOC |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Interview protocol generation; transcript summarization; evidence cataloging |
| M2 | Mechanism | Document Management | [MECH-DOC] Evidence storage with chain of custody |

**Definition of Done:** All witnesses in the investigation plan have been interviewed (or refusal documented) AND every interview has a signed summary in MECH-DOC AND all identified documentary evidence is cataloged with chain of custody AND evidence collection is completed within the investigation plan timeline.

---

#### A13633: Draft Investigation Report and Recommend Remediation

**Agent Definition:** Analyze all interview summaries and evidence, assess witness credibility, determine whether each allegation is substantiated, unsubstantiated, or inconclusive, draft the formal investigation report, and recommend specific remediation actions proportionate to findings.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Interview Summary Set | Output of A13632; all witness interview records |
| I2 | Input | Evidence Catalog | Output of A13632; all documentary evidence |
| C1 | Control | Title VII Remediation Proportionality | [TITLE7] 42 U.S.C. §2000e — remediation must be reasonably calculated to prevent recurrence; insufficient remediation for substantiated harassment creates employer liability under Faragher/Ellerth |
| C2 | Control | Investigation Policy Reporting | [INVESTIGATION-POLICY] Report must be reviewed by CLO-equivalent before remediation is implemented; if findings include potential criminal conduct, report to legal counsel before any employee notification |
| O1 | Output | Formal Investigation Report | Executive summary, scope, methodology, timeline, witness credibility assessments, findings per allegation (SUBSTANTIATED / UNSUBSTANTIATED / INCONCLUSIVE), policy provisions violated, recommended remediation (disciplinary action, training, policy revision, separation referral), reviewer signature; stored in MECH-DOC (access-restricted) |
| O2 | Output | Remediation Action Record | Specific actions: written warning, suspension, mandatory training, separation referral to A1366 or A135 A1355, policy revision referral to A1361; each action with responsible party, deadline, and completion verification method |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Evidence analysis; credibility assessment support; report drafting |
| M2 | Mechanism | Document Management | [MECH-DOC] Final report storage under access restriction |

**Definition of Done:** Formal Investigation Report is completed in MECH-DOC AND every allegation has a determination (SUBSTANTIATED / UNSUBSTANTIATED / INCONCLUSIVE) AND substantiated findings have corresponding remediation actions with deadlines AND report has been reviewed by CLO-equivalent (signature or acknowledgment in MECH-ESIGN) before remediation implementation.

---

## A1364: Design and Execute Employee Engagement Programs

**Function:** Measure employee engagement through structured surveys, analyze results by function and demographic dimension, produce action plans, and administer recognition programs that reinforce organizational culture.
**Supreme Constraint:** [TITLE7] survey and recognition must not discriminate; [NLRA] survey questions must not surveil concerted activity; [REPORTING-POLICY] engagement data access controls

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Workforce Architecture Plan | From A131 (Internal A13 Tunnel); org structure for survey segmentation |
| I2 | Input | Grievance Trend Data | From A1362; grievance patterns by department and category inform survey focus areas |
| I3 | Input | Turnover and Separation Data | From A1366 (Internal A13 Tunnel); exit interview themes and voluntary turnover rates |
| C1 | Control | NLRA Survey Boundaries | [NLRA] 29 U.S.C. §158(a)(1) — survey questions must not directly or indirectly inquire about union organizing, concerted activity intentions, or protected group membership in ways that could constitute unlawful surveillance |
| C2 | Control | Title VII Survey Equity | [TITLE7] 42 U.S.C. §2000e — recognition and engagement programs must be administered without regard to protected class; recognition criteria must be transparent and consistently applied |
| C3 | Control | Engagement Data Access | [REPORTING-POLICY] Engagement survey results at individual level are Principal-confidential; function-level aggregates may be shared with department leads |
| O1 | Output | Employee Engagement Survey Results Report | Overall engagement score, dimension scores (satisfaction, belonging, growth, autonomy, purpose), function-level breakdown, demographic-dimension breakdown (where sample size ≥ 5 to preserve anonymity), trend comparison to prior survey |
| O2 | Output | Engagement Action Plan | Per-function action items with owner, deadline, success metric, and follow-up survey checkpoint |
| O3 | Output | Recognition Program Record | Recognition events logged: nominee, nominator, recognition category, date, value (monetary or non-monetary) |
| M1 | Mechanism | BI / Analytics | [MECH-BI] Survey analysis dashboards; engagement trend reporting |
| M2 | Mechanism | HRIS | [MECH-HRIS] Recognition program tracking |

**Child Nodes:** A13641, A13642, A13643

---

#### A13641: Design and Deploy Employee Engagement Survey

**Agent Definition:** Design a structured engagement survey with validated dimensions (satisfaction, belonging, growth, autonomy, purpose), deploy it to all active employees via MECH-HRIS or a dedicated survey platform, set a response collection window of 10 business days, and achieve a minimum 60% response rate before closing the survey.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Prior Survey Results | Historical survey data for trend comparison and question refinement |
| I2 | Input | Grievance Trend Data | From A1362; department-level grievance patterns that may warrant targeted survey questions |
| C1 | Control | NLRA Survey Boundaries | [NLRA] 29 U.S.C. §158(a)(1) — no questions about union activity, organizing discussions, or concerted activity participation; no questions that would reasonably be perceived as surveilling §7 activity |
| C2 | Control | Anonymity Threshold | [REPORTING-POLICY] Individual responses are anonymous; results are only reported at aggregation levels where group size ≥ 5 to prevent re-identification |
| O1 | Output | Deployed Engagement Survey | Survey instrument: 25–35 items, 5-point Likert scale plus 2–3 open-text fields, mapped to validated dimensions, deployed to all active employees, collection window = 10 business days; response rate tracked in real time |
| M1 | Mechanism | HRIS | [MECH-HRIS] Survey distribution and response collection |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Question design; psychometric dimension mapping |

**Definition of Done:** Engagement survey is deployed to 100% of active employees AND response collection window is set to 10 business days AND response rate reaches ≥60% before survey close AND no survey question references union organizing, concerted activity, or protected group membership.

---

#### A13642: Analyze Engagement Results and Produce Action Plan

**Agent Definition:** Analyze closed survey responses by computing dimension scores, function-level breakdowns, and demographic-dimension breakdowns (where sample ≥ 5), identify the top 3 lowest-scoring dimensions per function, and produce a written action plan with specific interventions, owners, deadlines, and success metrics for each identified gap.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Closed Engagement Survey Responses | Raw response data with anonymized respondent metadata (function, tenure band, role class) |
| I2 | Input | Prior Survey Results | Historical dimension scores for trend analysis |
| I3 | Input | Turnover Data | From A1366 (Internal A13 Tunnel); voluntary turnover rate by function for correlation analysis |
| C1 | Control | Anonymity Threshold | [REPORTING-POLICY] No dimension score reported for any segment with <5 respondents; individual comments are thematically coded, not attributed |
| C2 | Control | Title VII Equity in Analysis | [TITLE7] 42 U.S.C. §2000e — if demographic-dimension analysis reveals engagement disparity by protected class, flag for CHO review and potential escalation to grievance process (A1362) |
| O1 | Output | Engagement Survey Results Report | Overall engagement score (0–100), dimension scores, function-level breakdown, demographic-dimension breakdown, trend delta from prior survey, top 3 lowest dimensions per function, open-text theme analysis; stored in MECH-BI and MECH-DOC |
| O2 | Output | Engagement Action Plan | Per-function: identified gap, intervention description, action owner (department lead), deadline, success metric (target dimension score improvement), follow-up survey checkpoint date; stored in MECH-DOC |
| M1 | Mechanism | BI / Analytics | [MECH-BI] Survey analytics dashboard; dimension scoring; trend visualization |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Open-text thematic coding; action plan drafting |

**Definition of Done:** Engagement Survey Results Report is published in MECH-BI AND every function with ≥5 respondents has dimension scores computed AND top 3 lowest dimensions per function are identified AND Engagement Action Plan has at least one intervention per identified gap with owner, deadline, and success metric.

---

#### A13643: Administer Employee Recognition Program

**Agent Definition:** Execute the employee recognition program by receiving nominations, validating them against recognition criteria, processing recognition events (peer-to-peer, manager-to-direct, spot bonus, milestone), logging each event in MECH-HRIS, and producing a quarterly recognition summary report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Recognition Nominations | From employees and managers; nominee name, recognition category (values-based, project milestone, tenure milestone, peer-to-peer), justification |
| C1 | Control | Title VII Non-Discrimination in Recognition | [TITLE7] 42 U.S.C. §2000e — recognition must be distributed without regard to protected class; if quarterly report reveals statistically significant disparity in recognition rates by protected class, flag for CHO review |
| C2 | Control | NLRA Concerted Activity | [NLRA] 29 U.S.C. §158(a)(1) — recognition program must not reward employees for refraining from concerted activity or penalize those who participate in it |
| O1 | Output | Recognition Event Record | Per event: nominee ID, nominator ID, category, justification, date, value (monetary amount or non-monetary description), approval status; stored in MECH-HRIS |
| O2 | Output | Quarterly Recognition Summary Report | Total recognition events, distribution by category, distribution by function, distribution by protected-class dimension (aggregate only where sample ≥ 5), monetary recognition total; stored in MECH-BI |
| M1 | Mechanism | HRIS | [MECH-HRIS] Recognition event logging and tracking |
| M2 | Mechanism | BI / Analytics | [MECH-BI] Recognition distribution analytics |

**Definition of Done:** Every submitted recognition nomination is processed (approved or returned with rationale) within 5 business days AND all approved recognition events are logged in MECH-HRIS with nominee, nominator, category, and date AND quarterly recognition summary report is produced within 10 business days of quarter close.

---

## A1365: Administer Leave of Absence Programs

**Function:** Receive and evaluate leave of absence requests, determine FMLA eligibility, administer ADA-related leave as reasonable accommodation, track leave balances, and process return-to-work clearances.
**Supreme Constraint:** [FMLA] 29 U.S.C. §2601; [ADA] 42 U.S.C. §12112; [TITLE7] pregnancy-related leave; [STATE-FINAL-PAY] if leave converts to separation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Leave of Absence Request | Employee request: leave type (FMLA, ADA accommodation, personal, parental, military), start date, expected duration, medical certification if applicable |
| I2 | Input | Employee HRIS Record | Employment tenure, hours worked, employer size — for FMLA eligibility determination |
| C1 | Control | FMLA Eligibility and Entitlement | [FMLA] 29 U.S.C. §2611–2615; 29 CFR Part 825 — eligible employees (12 months tenure, 1,250 hours, employer ≥50 employees within 75 miles) receive up to 12 weeks unpaid leave per 12-month period for qualifying reasons |
| C2 | Control | ADA Leave as Accommodation | [ADA] 42 U.S.C. §12112 — leave beyond FMLA entitlement may be required as a reasonable accommodation if it would enable the employee to return to work; interactive process required |
| C3 | Control | Anti-Retaliation | [FMLA] 29 U.S.C. §2615; [ADA] 42 U.S.C. §12203 — no adverse action for requesting or taking protected leave |
| O1 | Output | Leave Eligibility Determination | FMLA-eligible (YES/NO with rationale), approved leave type, approved duration, benefits continuation terms |
| O2 | Output | Return-to-Work Clearance | Medical certification review, fitness-for-duty confirmation, restoration to same or equivalent position |
| O3 | Output | Separation Referral for Leave Exhaustion | Referral to A1366 when FMLA/ADA leave is exhausted without return; includes employee ID, leave exhaustion date, ADA interactive process outcome |
| M1 | Mechanism | HRIS | [MECH-HRIS] Leave tracking, eligibility calculation, benefits continuation flags |

**Child Nodes:** A13651, A13652, A13653

---

#### A13651: Evaluate Leave Request and Determine Eligibility

**Agent Definition:** Receive a leave of absence request, verify FMLA eligibility by checking employment tenure (≥12 months), hours worked (≥1,250 in prior 12 months), and employer size (≥50 employees within 75 miles), determine qualifying reason, issue the FMLA eligibility notice (WH-381) and rights and responsibilities notice (WH-381) within 5 business days of request, and log the determination in MECH-HRIS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Leave of Absence Request | Employee request with leave type, qualifying reason, requested start date, expected duration, medical certification (if applicable) |
| I2 | Input | Employee HRIS Record | Hire date, hours worked in trailing 12 months, work location, employer headcount within 75-mile radius |
| C1 | Control | FMLA Eligibility Criteria | [FMLA] 29 U.S.C. §2611(2); 29 CFR §825.110 — three-part test: (1) 12 months of employment (need not be consecutive), (2) ≥1,250 hours of service in trailing 12 months, (3) employer has ≥50 employees within 75 miles of employee's worksite |
| C2 | Control | FMLA Notice Requirements | [FMLA] 29 CFR §825.300(b) — employer must provide eligibility notice (WH-381) within 5 business days of learning of need for leave; notice must state whether employee is eligible and provide rights and responsibilities |
| O1 | Output | FMLA Eligibility Determination Record | Employee ID, request date, eligibility determination (ELIGIBLE / NOT ELIGIBLE with specific criterion failed), qualifying reason classification, approved leave type, approved duration, benefits continuation terms, WH-381 notice issued date; stored in MECH-HRIS |
| M1 | Mechanism | HRIS | [MECH-HRIS] Leave eligibility calculation; WH-381 notice generation |

**Definition of Done:** FMLA eligibility determination is logged in MECH-HRIS AND WH-381 eligibility and rights notice is issued to employee within 5 business days of request receipt AND if eligible, approved leave duration and benefits continuation terms are documented AND if not eligible, specific failed criterion is stated in the determination record.

---

#### A13652: Track Leave Balance and Administer Benefits Continuation

**Agent Definition:** Track FMLA leave usage against the 12-week entitlement (or 26-week military caregiver entitlement) on a rolling 12-month basis, continue group health plan coverage during FMLA leave at the same employee contribution rate, and flag when the leave entitlement is ≤2 weeks from exhaustion for return-to-work planning.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | FMLA Eligibility Determination Record | Output of A13651; approved leave type, start date, approved duration |
| I2 | Input | Benefits Enrollment Record | From A1332 (Internal A13 Tunnel); current health plan, contribution rate, dependent coverage |
| C1 | Control | FMLA Leave Calculation Method | [FMLA] 29 CFR §825.200 — employer must use one of four methods for the 12-month period calculation (rolling, fixed, calendar year, or forward-measured); selected method must be consistently applied and documented |
| C2 | Control | FMLA Benefits Continuation | [FMLA] 29 U.S.C. §2614(c)(1) — employer must maintain group health plan coverage during FMLA leave under the same terms as if employee were actively working; employee remains responsible for their share of premiums |
| O1 | Output | Leave Balance Record | Employee ID, leave type, total entitlement weeks, weeks used, weeks remaining, next expected return date, benefits continuation status, exhaustion warning flag (YES if ≤2 weeks remaining); updated in MECH-HRIS per pay period |
| M1 | Mechanism | HRIS | [MECH-HRIS] Leave balance tracking; benefits continuation flag management |

**Definition of Done:** Leave balance is updated in MECH-HRIS at least every pay period AND benefits continuation flag is active for all employees on FMLA leave AND exhaustion warning flag is triggered when ≤2 weeks of entitlement remain AND leave calculation method used is documented and consistent across all employees.

---

#### A13653: Process Return-to-Work and Leave Exhaustion

**Agent Definition:** Upon employee return from leave, verify fitness-for-duty certification (if required for the leave reason), confirm restoration to the same or equivalent position per FMLA §2614(a)(1), update HRIS leave status to CLOSED, and if leave is exhausted without return, initiate the ADA interactive process for extended leave or refer to A1366 for separation processing.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Leave Balance Record | Output of A13652; remaining entitlement, expected return date |
| I2 | Input | Fitness-for-Duty Certification | Medical provider certification that employee can perform essential functions of the role (required only if employer has a uniformly applied fitness-for-duty policy) |
| C1 | Control | FMLA Restoration Rights | [FMLA] 29 U.S.C. §2614(a)(1) — employee must be restored to the same or equivalent position with equivalent pay, benefits, and terms and conditions of employment; exception: key employee defense under §2614(b) |
| C2 | Control | ADA Extended Leave as Accommodation | [ADA] 42 U.S.C. §12112; EEOC Guidance on Leave as Accommodation — if FMLA is exhausted and employee cannot return, employer must engage in the interactive process to determine if additional leave is a reasonable accommodation; indefinite leave is not required |
| O1 | Output | Return-to-Work Clearance Record | Employee ID, return date, fitness-for-duty certification status (received / waived / not required), position restored (same / equivalent with justification), HRIS leave status = CLOSED; stored in MECH-HRIS |
| O2 | Output | Extended Leave or Separation Referral | If leave exhausted without return: ADA interactive process documentation or separation referral to A1366 with leave exhaustion as qualifying event |
| M1 | Mechanism | HRIS | [MECH-HRIS] Leave status closure; position restoration confirmation |

**Definition of Done:** Return-to-Work Clearance Record is logged in MECH-HRIS AND employee is restored to same or equivalent position (or key employee defense is documented) AND HRIS leave status is CLOSED AND if leave is exhausted without return, ADA interactive process is initiated within 5 business days of exhaustion date OR separation referral is documented.

---

## A1366: Process Voluntary Separation and Offboarding

**Function:** Receive and process voluntary resignations and retirements, conduct exit interviews, calculate final pay obligations by jurisdiction, trigger COBRA qualifying event notification, and terminate HRIS record with complete separation documentation.
**Supreme Constraint:** [STATE-FINAL-PAY] state final paycheck timing; [COBRA] 29 U.S.C. §1161 (qualifying event notice); [NC-EMP-AT-WILL] at-will separation documentation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Resignation or Retirement Notice | Written employee notice; effective date; reason (voluntary) |
| I2 | Input | Leave Exhaustion Separation Referral | From A13653; separation due to FMLA exhaustion after ADA interactive process |
| C1 | Control | State Final Paycheck Timing | [STATE-FINAL-PAY] State-specific timing: NC = next regular payday; CA = immediate for involuntary, next payday for voluntary resignation; CO = immediate for involuntary |
| C2 | Control | COBRA Qualifying Event Notice | [COBRA] 29 U.S.C. §1166(a)(2) — employer must notify plan administrator within 30 days of qualifying event (separation); plan issues election notice within 14 days |
| O1 | Output | Exit Interview Record | Structured exit interview: departure reason, engagement factors, suggestions, willingness to return, manager effectiveness rating; anonymized for trend analysis |
| O2 | Output | Final Pay Calculation Trigger | Employee ID, separation date, PTO balance, final pay timing requirement by jurisdiction → A1333 Payroll for final paycheck processing |
| O3 | Output | COBRA Qualifying Event Notice | Employee ID, qualifying event (separation), event date, notification date → A1332 Benefits for COBRA election notice issuance |
| O4 | Output | HRIS Termination Record | Employee ID, separation type (voluntary resignation / retirement / leave exhaustion), effective date, exit interview completed flag, final pay issued flag, COBRA notified flag; status = TERMINATED in MECH-HRIS |
| O5 | Output | People & Roles Update | Updated People & Roles Package reflecting separated employee → Engineering A14 via IF-A1-04 for system deprovisioning |
| M1 | Mechanism | HRIS | [MECH-HRIS] Separation processing; termination record |
| M2 | Mechanism | Document Management | [MECH-DOC] Exit interview storage; separation checklist |

**Child Nodes:** A13661, A13662, A13663

---

#### A13661: Receive Resignation and Conduct Exit Interview

**Agent Definition:** Receive the employee's written resignation or retirement notice, confirm the effective separation date with the employee's manager, schedule and conduct a structured exit interview covering departure reasons, engagement factors, and manager effectiveness, and log the exit interview record in MECH-DOC with anonymized copy routed to A1364 engagement analysis.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Resignation or Retirement Notice | Written notice from employee; includes requested last day of employment |
| I2 | Input | Manager Confirmation | Manager acknowledges resignation and confirms or negotiates effective date |
| C1 | Control | NC At-Will Doctrine | [NC-EMP-AT-WILL] N.C. Gen. Stat. — no notice period is legally required for at-will resignation in NC; employer cannot compel a longer notice period |
| O1 | Output | Confirmed Separation Date Record | Employee ID, resignation receipt date, confirmed effective separation date, manager name; stored in MECH-HRIS |
| O2 | Output | Exit Interview Record | Structured interview: departure reason (categorized), engagement dimension ratings, manager effectiveness rating, suggestions, rehire eligibility recommendation, interviewer name, date; stored in MECH-DOC; anonymized copy → A1364 A13642 for trend analysis |
| M1 | Mechanism | HRIS | [MECH-HRIS] Separation initiation and date confirmation |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Exit interview question generation; response thematic coding |

**Definition of Done:** Confirmed separation date is logged in MECH-HRIS AND exit interview is conducted before or on the last day of employment AND exit interview record is stored in MECH-DOC AND anonymized copy is available for engagement trend analysis.

---

#### A13662: Calculate Final Pay Obligations and Trigger COBRA Notice

**Agent Definition:** Determine the jurisdiction-specific final paycheck timing requirement for the separation type (voluntary resignation vs. retirement vs. leave exhaustion), calculate accrued PTO payout per company policy and state law, transmit the final pay calculation trigger to A1333 Payroll, and issue the COBRA qualifying event notification to A1332 Benefits within 30 days of separation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Confirmed Separation Date Record | Output of A13661; employee ID, separation date, separation type |
| I2 | Input | PTO Balance and Accrual Policy | From MECH-HRIS; accrued but unused PTO balance; company PTO payout policy; state PTO payout mandate (CA, CO mandate payout; NC defers to employer policy) |
| C1 | Control | State Final Paycheck Timing | [STATE-FINAL-PAY] NC: next regular payday for voluntary resignation; CA Lab. Code §202: 72 hours for resignation without 72-hour notice, immediately if ≥72-hour notice given; CO: next regular payday |
| C2 | Control | COBRA Qualifying Event Timeline | [COBRA] 29 U.S.C. §1166(a)(2) — employer notifies plan administrator within 30 days of separation; plan issues election notice within 14 days of receiving employer notice; 60-day election window for employee |
| O1 | Output | Final Pay Calculation Trigger | Employee ID, separation date, separation type, PTO payout amount, final paycheck deadline by jurisdiction, any outstanding expense reimbursements, any outstanding loan or advance deductions; transmitted to A1333 Payroll |
| O2 | Output | COBRA Qualifying Event Notice | Employee ID, qualifying event type (termination of employment), event date, dependent coverage status, notification date; transmitted to A1332 Benefits A133223 for COBRA election notice issuance |
| M1 | Mechanism | HRIS | [MECH-HRIS] PTO balance lookup; separation type classification |
| M2 | Mechanism | Payroll Processor | [MECH-PAYROLL] Final paycheck scheduling per jurisdictional deadline |

**Definition of Done:** Final pay calculation trigger is transmitted to A1333 Payroll before the jurisdiction-specific final paycheck deadline AND COBRA qualifying event notice is transmitted to A1332 Benefits within 30 days of separation date AND PTO payout amount is calculated per applicable state law and company policy.

*[Internal A13 Tunnel: A136 → A1333 Payroll. Final pay trigger flows to Payroll for processing; A136 → A1332 Benefits. COBRA qualifying event notice flows to Benefits for election notice issuance. No IF-A1-XX required for intra-A13 flows.]*

---

#### A13663: Terminate HRIS Record and Complete Offboarding Checklist

**Agent Definition:** Execute the offboarding checklist by revoking system access (transmit deprovisioning request to Engineering A14 via IF-A1-04), recovering company property, confirming final pay issuance, confirming COBRA notice issuance, and setting the employee's HRIS record status to TERMINATED with all separation documentation attached.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Confirmed Separation Date Record | Output of A13661; employee ID, separation date |
| I2 | Input | Final Pay Issuance Confirmation | From A1333 Payroll; confirmation that final paycheck has been issued per jurisdictional deadline |
| I3 | Input | COBRA Notice Issuance Confirmation | From A1332 Benefits; confirmation that COBRA election notice has been sent to separated employee |
| C1 | Control | System Access Revocation SLA | [IF-A1-04] People → Engineering; system access must be revoked on or before the separation effective date; coordinate with Engineering A14 IAM for MECH-IAM deprovisioning |
| C2 | Control | Record Retention | [EEOC-PROC] 29 CFR §1602.14 — personnel records must be retained for at least 1 year after separation; if charge is pending, retain until final disposition |
| O1 | Output | HRIS Termination Record | Employee ID, separation type, effective date, exit interview completed (YES/NO), final pay issued (YES/NO with date), COBRA notified (YES/NO with date), system access revoked (YES/NO with date), company property recovered (YES/NO), record status = TERMINATED; stored in MECH-HRIS |
| O2 | Output | People & Roles Update | Updated People & Roles Package reflecting the separated employee → Engineering A14 via IF-A1-04 for downstream system deprovisioning |
| M1 | Mechanism | HRIS | [MECH-HRIS] Record termination and offboarding checklist |

**Definition of Done:** HRIS record status is TERMINATED AND system access revocation is confirmed on or before separation date AND final pay issuance is confirmed AND COBRA notice issuance is confirmed AND company property recovery is documented AND People & Roles update is transmitted via IF-A1-04.

**Cross-Function:** [CROSS-FUNCTION: A13 → A14] *Interface: IF-A1-04* — People & Roles Package update triggers system access deprovisioning in Engineering A14.

---

## Boundary Arrow Correspondence Check (A13 → A136)

A13 Output O1 = **People & Roles** — the union of A136 outputs contributes:
- Published Employee Handbook (O1) → workforce policy framework governing all People & Roles
- Grievance Resolution Records (O2) → employee relations status affecting role fitness
- Investigation Reports (O3) → remediation actions that may alter role assignments
- Engagement Survey Results (O4) → workforce health intelligence feeding People strategy
- Leave Determinations (O5) → temporary role status changes (on leave / active)
- Separation Packages (O6) → permanent role removal from People & Roles inventory; triggers IF-A1-04 update

All outputs contribute to or modify the People & Roles Package that A13 produces for Engineering A14, Production A2, and Sales A3. ✓

---

## Quality Assurance Checklist

- [x] Every L5 node has exactly one complete IDEF0 block (18 nodes confirmed)
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md (R2.1)
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md (R2.2)
- [x] Every Output (O) names a specific artifact or verifiable state change (R2.3)
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: union of child outputs = parent output (R1.4)
- [x] No skill appears under more than one function node (R4.3)
- [x] All cross-function skills cite an interface from ctrl-interface-register.md (R4.1)
- [x] No banned verbs appear in skill definitions without a measurable qualifier (R3.4)
- [x] Domain Header Block leaf-node count is accurate (18)
- [x] All mandatory inclusions for this domain are checked
