# Skill File: Talent Acquisition

**Node:** A132
**Parent:** A13 People
**Function:** Source, screen, assess, and extend offers to candidates for all authorized positions; complete pre-employment verification; and execute the structured onboarding program that delivers hired employees ready for productive contribution.
**Supreme Constraint:** [TITLE7] Title VII of the Civil Rights Act; [ADA] Americans with Disabilities Act; [ADEA] Age Discrimination in Employment Act; [EEOC-PROC] EEOC Uniform Selection Guidelines; [I9] I-9 Employment Eligibility; [FCRA] Fair Credit Reporting Act; [PAY-EQUITY-STATE] State Pay Transparency Laws; [FLSA-EXEMPT] FLSA Exempt Classification
**Cross-Function Interfaces:** IF-A1-04, IF-A1-07, IF-A1-25
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [x] Compa-ratio analysis and salary band calibration — A13241 [MECH-COMP]; offer anchored to band midpoint and compa-ratio target
- [ ] RIF legal compliance checklist — *Primary owner: A131 A1314. Not applicable to A132 (inbound hiring flow). Satisfied upstream.*
- [ ] 9-box talent grid calibration — *A1323 Assessment Protocol produces competency ratings that feed A135 9-box calibration as inputs. Primary owner: A135 Performance Management. Dependency documented at A13231.*
- [x] HRIS data model design — A13261 [MECH-HRIS]; new hire record creation per schema from A13131 triggered at onboarding
- [ ] Organizational network analysis — *Primary owner: A131 A1316. Not applicable to A132. Satisfied upstream.*
- [ ] Succession depth charting — *Primary owner: A131 A1315. A132 outputs feed succession pool indirectly. Satisfied upstream.*

---

## A132: Talent Acquisition

**Function:** Source, screen, assess, and extend offers to candidates for all authorized positions; complete pre-employment verification; and execute the structured onboarding program that delivers hired employees ready for productive contribution.
**Supreme Constraint:** [TITLE7] Title VII; [ADA] ADA; [ADEA] ADEA; [EEOC-PROC] EEOC Uniform Guidelines; [I9] I-9; [FCRA] FCRA; [PAY-EQUITY-STATE] Pay Equity; [FLSA-EXEMPT] FLSA

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Workforce Architecture Plan | From A131 O1; authorized positions, headcount targets, span standards, approved requisitions |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07 from Engineering A14; technical and functional requirements per role |
| I3 | Input | Compensation Band Definitions | From A1331 Compensation Architecture; authorized band min/mid/max by role class |
| C1 | Control | Title VII Non-Discrimination | [TITLE7] 42 U.S.C. §2000e — posting, screening, assessment, and offer must be free from protected-class discrimination |
| C2 | Control | ADA Reasonable Accommodation | [ADA] 42 U.S.C. §12101 — essential functions must be documented; accommodation offered at assessment stage |
| C3 | Control | ADEA Age Discrimination | [ADEA] 29 U.S.C. §621 — selection criteria and interview questions cannot penalize candidates ≥40 |
| C4 | Control | EEOC Uniform Selection Guidelines | [EEOC-PROC] 29 CFR Part 1607 — adverse impact documentation required; any selection procedure with disparate impact must be job-related and consistent with business necessity |
| C5 | Control | I-9 Employment Eligibility | [I9] 8 U.S.C. §1324a — employment eligibility verification required before or upon first day of work |
| C6 | Control | FCRA Background Check | [FCRA] 15 U.S.C. §1681 — written authorization required; pre-adverse and adverse action notices required if BGC results in rescission |
| C7 | Control | Pay Transparency Requirements | [PAY-EQUITY-STATE] Salary range disclosure required in postings in covered jurisdictions; pay equity check required before extending offer |
| C8 | Control | FLSA Exempt Classification | [FLSA-EXEMPT] 29 CFR Part 541 — exempt/non-exempt classification confirmed before offer is extended |
| C9 | Control | Employment Law Templates | [IF-A1-25] Offer letter, NDA, IP assignment, handbook acknowledgment templates from Legal A12 |
| O1 | Output | Hired Employee Record | Fully onboarded employee: completed I-9, signed offer, signed policies, HRIS record active → A1313 position register update |
| O2 | Output | Onboarded Employee Package | Orientation completion record, signed acknowledgments, 30-60-90 integration plan initiated → A134 Learning & Development |
| O3 | Output | New Hire Notification to Payroll | Position status updated to "filled" in A1313; payroll setup trigger to A1333 via IF-A1-04 |
| M1 | Mechanism | ATS | [MECH-ATS] Applicant Tracking System (Lever / Greenhouse / Workable / similar); candidate pipeline, disposition, and offer management |
| M2 | Mechanism | HRIS | [MECH-HRIS] Employee record creation and position status management |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] [MECH-AGENT] AI-assisted JD drafting, resume review, structured screening, offer drafting |
| M4 | Mechanism | E-Signature | [MECH-ESIGN] Offer letter and onboarding document execution |
| M5 | Mechanism | Compensation Benchmarking | [MECH-COMP] Band and compa-ratio data for offer construction |

**Child Nodes:** A1321, A1322, A1323, A1324, A1325, A1326

---

## A1321: Source Candidates

**Function:** Draft compliant job descriptions for all open requisitions, activate the approved sourcing channel mix, and maintain a live candidate pipeline in the ATS until each position is filled or frozen.
**Supreme Constraint:** [TITLE7] non-discriminatory job postings; [ADA] essential functions documented; [PAY-EQUITY-STATE] salary range disclosure in covered jurisdictions

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Workforce Architecture Plan | From A131; authorized open positions, headcount targets by function |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07 from A14; functional, technical, and behavioral competency requirements per role |
| C1 | Control | Title VII Non-Discrimination | [TITLE7] 42 U.S.C. §2000e — job postings must not contain language that discourages protected classes from applying |
| C2 | Control | ADA Essential Functions | [ADA] 42 U.S.C. §12112 — JD must distinguish essential from marginal functions; physical requirements must be facially neutral |
| C3 | Control | Pay Transparency | [PAY-EQUITY-STATE] salary range disclosure required in postings (CO, NY, CA, WA, and similar) |
| O1 | Output | Job Description Package | Compliant JD per open requisition: essential functions, preferred qualifications, FLSA status, EEO statement, salary range where required |
| O2 | Output | Active Candidate Pipeline | ATS records for all active candidates with source attribution, status stage, and disposition codes |
| M1 | Mechanism | ATS | [MECH-ATS] Job posting, channel distribution, pipeline management |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] JD drafting and compliance review |

**Child Nodes:** A13211, A13212, A13213

---

#### A13211: Draft Job Description and Requirements

**Agent Definition:** For each approved open requisition, draft a TITLE7 + ADA-compliant job description that separates essential from non-essential functions, specifies required versus preferred qualifications, states the FLSA exempt/non-exempt classification, includes a salary range where jurisdiction requires, and appends a standard EEO statement.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Role Requirements and Competency Profile | IF-A1-07 from A14 Engineering; functional duties, technical skill requirements, decision authority, and physical requirements per role |
| I2 | Input | Compensation Band Definition | From A1331; authorized band range for the role class; salary range for posting disclosure where required |
| C1 | Control | ADA Essential Function Documentation | [ADA] 42 U.S.C. §12111(8) — JD must list essential functions separately from marginal functions; physical/cognitive requirements stated in functional terms (e.g., "lift up to 30 lbs" not "must be physically fit") |
| C2 | Control | Title VII Non-Discriminatory Language | [TITLE7] 42 U.S.C. §2000e — no language that discourages or screens out protected classes (e.g., "recent graduate," "native English speaker," "physically demanding for the right person") |
| C3 | Control | FLSA Classification Statement | [FLSA-EXEMPT] 29 CFR Part 541 — exempt/non-exempt status is stated on the JD and consistent with the compensation band |
| C4 | Control | Pay Transparency Disclosure | [PAY-EQUITY-STATE] if role will be posted in CO, NY, CA, WA, IL, or WA D.C.: salary range must appear in the posting |
| O1 | Output | Job Description Document | Versioned JD: role title, IDEF0 node mapping, reporting relationship, essential functions (bulleted), preferred qualifications, required qualifications (minimum), FLSA status, salary range (jurisdiction-gated), EEO statement |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Drafting, compliance terminology check, and EEO statement standardization |
| M2 | Mechanism | ATS | [MECH-ATS] JD storage and version control |

**Definition of Done:** Job Description Document is stored in MECH-ATS with a version number AND essential functions are labeled as "Essential" distinct from preferred/marginal AND FLSA status field is populated AND salary range is included for all jurisdictions where the role will be posted that require disclosure.

---

#### A13212: Activate Sourcing Channels

**Agent Definition:** For each open requisition, select the sourcing channel mix (job boards, LinkedIn, agency brief, employee referral, pipeline reactivation) based on role criticality and time-to-fill target, post the job description to all selected channels, and brief any agencies with a written scope of assignment.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Job Description Document | Output of A13211; approved JD for posting |
| I2 | Input | Workforce Capacity Gap Register | From A13122; time-to-fill priority by function |
| C1 | Control | EEOC Sourcing Diversity | [EEOC-PROC] 29 CFR Part 1607 §4B — sourcing channels must not systematically exclude protected classes; minimum of one diversity-focused sourcing channel per requisition |
| C2 | Control | Title VII Agency Brief | [TITLE7] agency briefs must include the EEO statement and prohibit the agency from pre-filtering candidates on protected characteristics |
| O1 | Output | Sourcing Activation Record | Per requisition: channels activated, posting URLs, agency brief (if used), referral program notification, diversity channel confirmation, activation date |
| M1 | Mechanism | ATS | [MECH-ATS] Channel posting integration and source tracking |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Agency brief drafting, referral program announcement |

**Definition of Done:** Sourcing Activation Record is logged in MECH-ATS for each open requisition AND at least one diversity-focused sourcing channel is activated per requisition AND agency brief (where applicable) includes the EEO statement with written confirmation from agency received.

---

#### A13213: Track Candidate Pipeline to Fill-or-Freeze Decision

**Agent Definition:** Record real-time candidate status in the ATS (application, screening, assessment, offer, and disposition stages) for every open requisition; trigger a sourcing escalation for any requisition with zero active candidates at day 14; and produce a weekly pipeline health report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Sourcing Activation Record | Output of A13212; active channels and requisition start dates |
| I2 | Input | Candidate Applications | Inbound applications from all activated channels via MECH-ATS |
| C1 | Control | EEOC Record Retention | [EEOC-PROC] 42 U.S.C. §2000e-5(e); 29 CFR §1602.14 — application records retained ≥1 year (≥2 years for employers with 150+ employees); disposition code required for every candidate |
| C2 | Control | Title VII Disposition Documentation | [TITLE7] every candidate disposition must have a non-discriminatory, job-related reason code in MECH-ATS |
| O1 | Output | Candidate Pipeline Report | Per requisition: total applicants, stage distribution, source attribution, days since activation, escalation flag if no active candidate >14 days |
| M1 | Mechanism | ATS | [MECH-ATS] Pipeline management and disposition tracking |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Automated pipeline health monitoring and escalation trigger |

**Definition of Done:** Every open requisition has a disposition code for 100% of candidates who have exited the pipeline AND Candidate Pipeline Report is generated weekly AND any requisition with zero active candidates at day 14 has a documented sourcing escalation action in MECH-ATS.

---

## A1322: Screen and Qualify Candidates

**Function:** Apply minimum qualifications filters to the inbound applicant pool, conduct structured phone screens for all minimum-qualified candidates, and produce a ranked shortlist for the assessment panel.
**Supreme Constraint:** [TITLE7] [ADA] [ADEA] uniform, job-related screening criteria; [EEOC-PROC] selection procedure validation

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Active Candidate Pipeline | Output of A13213; inbound applications in MECH-ATS |
| I2 | Input | Job Description Document | Essential functions and minimum/preferred qualifications from A13211 |
| C1 | Control | EEOC Uniform Selection Guidelines | [EEOC-PROC] 29 CFR Part 1607 — screening criteria must be job-related and consistent with business necessity; adverse impact analysis available on request |
| C2 | Control | ADA Pre-Offer Disability Inquiry Prohibition | [ADA] 42 U.S.C. §12112(d)(2) — no disability-related questions or medical inquiries before a conditional offer |
| C3 | Control | ADEA Age Inquiry Prohibition | [ADEA] 29 U.S.C. §623 — no questions about age or graduation year that reveal age during screening |
| O1 | Output | Qualified Candidate Shortlist | Ranked list of candidates who passed minimum qualifications filter with score rationale per candidate |
| O2 | Output | Phone Screen Summary | Structured notes per screened candidate: minimum qualification result, comp alignment, availability, FLSA classification confirmation |
| M1 | Mechanism | ATS | [MECH-ATS] Application filter, stage advancement |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Resume parse and qualification mapping; [MECH-AGENT] screen scheduling and structured note capture |

**Child Nodes:** A13221, A13222, A13223

---

#### A13221: Review and Filter Inbound Applications

**Agent Definition:** Apply a binary pass/fail minimum qualifications filter to all inbound applications using only criteria listed as "required" in the Job Description Document; assign a disposition code to every screened-out candidate with a job-related reason; advance all minimum-qualified candidates to phone screen.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Candidate Applications | MECH-ATS inbound applications with resume/CV for an open requisition |
| I2 | Input | Job Description Document | Minimum qualifications list (required) from A13211; basis for pass/fail filter |
| C1 | Control | EEOC Selection Criterion Validity | [EEOC-PROC] 29 CFR Part 1607 §3A — each screening criterion applied must appear as a minimum qualification in the JD; no ad hoc criteria may be introduced at this stage |
| C2 | Control | ADA Pre-Offer Medical Inquiry | [ADA] 42 U.S.C. §12112(d)(2) — no candidate excluded on the basis of a disclosed disability without first determining whether the essential functions can be performed with reasonable accommodation |
| C3 | Control | ADEA Year-Based Screening | [ADEA] 29 U.S.C. §623 — graduation year, years-since-degree, or similar criteria that act as age proxies must not be used as screening filters |
| O1 | Output | Application Review Log | Per candidate: pass/fail result, criterion(a) applied, disposition code if rejected, LLM parse confidence score for technical roles |
| M1 | Mechanism | ATS | [MECH-ATS] Stage filter and disposition code recording |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Resume-to-JD criteria mapping; highlights missing required qualifications |

**Definition of Done:** Application Review Log has a disposition record for 100% of inbound applications AND every rejected candidate has a job-related disposition code from the MECH-ATS disposition code library AND no screening criterion appears in the log that does not exist in the approved JD minimum qualifications list.

---

#### A13222: Conduct Structured Phone Screen

**Agent Definition:** Execute a 20–30 minute structured phone or video screen for every minimum-qualified candidate covering: minimum qualification depth-check, compensation range alignment, start date availability, work authorization status, and FLSA classification confirmation; document all responses in MECH-ATS using a standardized scorecard.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Application Review Log | Output of A13221; minimum-qualified candidates advanced to screen |
| I2 | Input | Compensation Band Definition | From A1331; range to confirm alignment without disclosing final offer position |
| C1 | Control | ADA Pre-Offer Disability Inquiry | [ADA] 42 U.S.C. §12112(d)(2) — no questions about disability, accommodation needs, or medical history; only "can you perform the essential functions with or without reasonable accommodation?" is permissible |
| C2 | Control | ADEA Age-Related Questions | [ADEA] 29 U.S.C. §623 — no questions about age, graduation year, retirement plans, or length of career remaining |
| C3 | Control | Pay Transparency | [PAY-EQUITY-STATE] if jurisdiction prohibits asking current/prior salary: prohibited; if jurisdiction requires salary range disclosure: disclose the posting range |
| O1 | Output | Phone Screen Scorecard | Per candidate: minimum qual depth-check result (PASS/FAIL), comp alignment (in-range/out-of-range/negotiable), availability (start date), work authorization (authorized/requires sponsorship), FLSA classification confirmation, overall recommendation (advance/hold/decline) |
| M1 | Mechanism | ATS | [MECH-ATS] Scorecard template and recording |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Screen scheduling, structured note generation from call transcript (where legally permissible) |

**Definition of Done:** Phone Screen Scorecard is completed and stored in MECH-ATS for every minimum-qualified candidate AND the scorecard contains a recommendation (advance/hold/decline) AND no prohibited question categories (disability, age, prior salary in restricted jurisdictions) appear in the screen notes.

---

#### A13223: Score and Rank Qualified Candidates

**Agent Definition:** Apply the standardized qualification scoring rubric to all phone screen results, rank the qualified pool by score against minimum and preferred qualifications, and produce a prioritized shortlist for the assessment panel with a documented rationale for each candidate's rank position.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Phone Screen Scorecards | Output of A13222; all completed screencards for the requisition |
| I2 | Input | Job Description Document | Required and preferred qualifications from A13211; basis for scoring rubric |
| C1 | Control | EEOC Uniform Selection Guidelines | [EEOC-PROC] 29 CFR Part 1607 §14 — scoring rubric must weight job-related criteria only; differential weighting of criteria requires documented business necessity |
| C2 | Control | Title VII Ranking Consistency | [TITLE7] 42 U.S.C. §2000e — identical criteria applied to all candidates; if any rank adjustment is made after initial scoring, the adjustment must be documented with a non-discriminatory rationale |
| O1 | Output | Ranked Candidate Shortlist | Ordered list: candidate name, overall score (numeric), criterion scores, rank position, rationale summary; top 3 minimum advanced to assessment panel unless fewer than 3 qualified |
| M1 | Mechanism | ATS | [MECH-ATS] Scoring rubric template; shortlist output |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Score aggregation and rationale drafting |

**Definition of Done:** Ranked Candidate Shortlist is stored in MECH-ATS with a numeric score for every evaluated candidate AND score methodology is documented (criteria weights) AND a minimum of 3 candidates are advanced to the assessment panel (or all qualified candidates if fewer than 3 pass screening), with documented rationale for any candidate advanced outside the top rank.

---

## A1323: Select Finalist Through Assessment

**Function:** Design a structured assessment protocol for each role, execute a panel interview process, and produce a defensible selection decision with documented rationale.
**Supreme Constraint:** [TITLE7] [ADA] [ADEA] job-related assessment criteria; [EEOC-PROC] structured selection procedure; accommodation required at assessment stage

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Ranked Candidate Shortlist | Output of A13223; candidates advanced to assessment |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07; competency model for the role |
| C1 | Control | ADA Reasonable Accommodation at Assessment | [ADA] 42 U.S.C. §12112(b)(6) — if candidate discloses a disability before assessment, reasonable accommodation must be offered (extended time, alternative format) before assessment proceeds |
| C2 | Control | EEOC Structured Interview Requirement | [EEOC-PROC] 29 CFR Part 1607 §14 — all interviewers must use the same question set; questions must be demonstrably job-related |
| C3 | Control | ADEA Interview Prohibitions | [ADEA] 29 U.S.C. §623 — no questions about age, years until retirement, or long-term career plans that imply age preference |
| O1 | Output | Assessment Protocol | Role-specific question bank, scoring rubric, panel composition, and accommodation procedure |
| O2 | Output | Interview Scores | Per-interviewer, per-candidate structured scores |
| O3 | Output | Selection Record | Finalist selection with documented rationale; adverse impact spot-check |
| M1 | Mechanism | ATS | [MECH-ATS] Assessment scheduling, score capture |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Question bank generation; [MECH-AGENT] panel coordination |

**Child Nodes:** A13231, A13232, A13233

---

#### A13231: Design Role Assessment Protocol

**Agent Definition:** For each open requisition, define the interview panel composition (minimum 2 interviewers), draft a behavioral and technical question bank tied explicitly to the role's required competencies (from IF-A1-07), assign scoring dimensions with defined anchors, and document the ADA accommodation procedure for the assessment stage.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Role Requirements and Competency Profile | IF-A1-07 from A14; competencies, technical skills, decision authority for the role |
| I2 | Input | Job Description Document | Essential functions from A13211; basis for interview question job-relatedness mapping |
| C1 | Control | EEOC Content Validity | [EEOC-PROC] 29 CFR Part 1607 §5B — each interview question must map to a named competency in the role requirements; the mapping must be documented for any question used in a selection decision |
| C2 | Control | ADA Accommodation Documentation | [ADA] 42 U.S.C. §12112(b)(6) — protocol must include written procedure for receiving and responding to accommodation requests received prior to or during the assessment |
| O1 | Output | Assessment Protocol Document | Panel composition (roles, names), question bank (behavioral STAR-format + technical), competency-to-question mapping table, scoring rubric (1–5 scale with behavioral anchors per dimension), accommodation request procedure |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] Question bank generation from competency model; anchor language drafting |
| M2 | Mechanism | ATS | [MECH-ATS] Protocol storage and distribution to panel |

*[Internal A13 Tunnel: Assessment competency dimensions align with A135 Performance Management 9-box calibration inputs. Continuity between hiring assessment rubric and performance rating rubric is by design; no IF-A1-XX registration required.]*

**Definition of Done:** Assessment Protocol Document is stored in MECH-ATS for the requisition AND every interview question maps to a named competency in the role requirements (zero unmapped questions) AND a scoring rubric with at least 3 behavioral anchors per dimension is present AND the accommodation request procedure is documented.

---

#### A13232: Execute Structured Interview Panel

**Agent Definition:** Convene the assessment panel using the approved Assessment Protocol; each panelist independently administers their assigned questions and records numeric scores and behavioral evidence notes before any panel discussion; no cross-panelist discussion of candidates occurs until all independent scores are submitted.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Assessment Protocol Document | Output of A13231; question assignments, scoring rubric, panel composition |
| I2 | Input | Ranked Candidate Shortlist | Output of A13223; candidates scheduled for assessment panel |
| C1 | Control | ADA Accommodation Execution | [ADA] 42 U.S.C. §12112(b)(6) — if accommodation was requested, it must be in place before the interview begins; interview cannot proceed without confirmed accommodation |
| C2 | Control | ADEA Prohibited Interview Topics | [ADEA] 29 U.S.C. §623(a) — panelists may not ask about age, retirement timeline, graduation year, or length of career plans; protocol must include a pre-brief to panelists on prohibited topics |
| C3 | Control | EEOC Independent Scoring Requirement | [EEOC-PROC] 29 CFR Part 1607 §15 — each panelist must submit independent scores before discussion to prevent anchoring bias from contaminating the record |
| O1 | Output | Individual Panelist Score Sheets | Per panelist, per candidate: dimension scores (1–5), behavioral evidence notes, overall recommendation (advance/decline) — timestamped before panel debrief begins |
| M1 | Mechanism | ATS | [MECH-ATS] Score sheet capture with pre-discussion timestamp lock |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Panel scheduling, reminder distribution, pre-brief delivery |

**Definition of Done:** Individual Panelist Score Sheets are captured in MECH-ATS with a pre-discussion timestamp for every panelist AND every score sheet has behavioral evidence notes (not just numeric scores) AND no panelist score sheet is submitted after the panel debrief session begin time.

---

#### A13233: Calibrate Panel and Select Finalist

**Agent Definition:** Facilitate the structured panel debrief to aggregate individual scores, perform a spot adverse impact check comparing finalist to runner-up demographic patterns, document the selection rationale in writing, and route to Principal [Human Gate] if the panel is split or if any candidate requested ADA accommodation.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Individual Panelist Score Sheets | Output of A13232; all panelist scores and notes |
| I2 | Input | Ranked Candidate Shortlist | Output of A13223; demographic context for adverse impact spot-check |
| C1 | Control | EEOC Adverse Impact Check | [EEOC-PROC] 29 CFR Part 1607 §4D — if the top-ranked candidate and the runner-up differ on a protected class dimension and the runner-up has a comparable score within 10%, adverse impact rationale must be documented before selection is finalized |
| C2 | Control | ADA Post-Assessment Review | [ADA] 42 U.S.C. §12112 — if any finalist disclosed a disability or requested accommodation, Principal reviews the selection to confirm decision is based on assessment results only |
| C3 | Control | Title VII Selection Documentation | [TITLE7] 42 U.S.C. §2000e — written selection rationale is retained with the application record for the EEOC record retention period |
| O1 | Output | Selection Record | Finalist identification, aggregated panel scores, adverse impact spot-check result (PASS/documented exception), selection rationale in writing, Principal approval if required |
| M1 | Mechanism | ATS | [MECH-ATS] Selection record storage and retention |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Selection rationale drafting; adverse impact spot-check calculation |

**Definition of Done:** Selection Record is stored in MECH-ATS with a written rationale AND adverse impact spot-check is documented as PASS or contains an exception rationale AND if the panel was split (any dimension where scores differ ≥2 points), Principal approval is documented before offer proceeds.

---

## A1324: Extend and Negotiate Employment Offer

**Function:** Construct a compliant compensation package anchored to the approved band and compa-ratio target, obtain required approval, and execute a signed employment offer using Legal-approved templates.
**Supreme Constraint:** [PAY-EQUITY-STATE] [FLSA-EXEMPT] offer construction; [IF-A1-25] offer letter template; [ORG-CHG-POLICY] approval thresholds

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Selection Record | Output of A13233; finalist identified and approved for offer |
| I2 | Input | Compensation Band Definitions | From A1331; band min/mid/max and compa-ratio benchmarks |
| I3 | Input | Equity Grant Schedule | From A1334 Equity & LTI Administration; if applicable for the role class |
| C1 | Control | Pay Equity Check | [PAY-EQUITY-STATE] [EPA-1963] — proposed base salary compared to compa-ratios of similarly situated employees; any deviation >10% from comparators requires documented business justification |
| C2 | Control | FLSA Classification Confirmation | [FLSA-EXEMPT] 29 CFR Part 541 — final offer must state exempt or non-exempt status; exempt classification requirements met (salary basis + duties test) |
| C3 | Control | Offer Approval Policy | [ORG-CHG-POLICY] Principal approval required for offers above band midpoint or containing non-standard package components |
| C4 | Control | Employment Law Templates | [IF-A1-25] offer letter template from Legal A12 A122; NDA and IP assignment agreement required |
| O1 | Output | Signed Employment Offer | Countersigned offer letter with start date, base salary, FLSA status, equity grant (if applicable), conditional offer contingencies stated |
| M1 | Mechanism | Compensation Benchmarking | [MECH-COMP] Compa-ratio and pay equity data |
| M2 | Mechanism | E-Signature | [MECH-ESIGN] Offer delivery and acceptance |
| M3 | Mechanism | LLM / Agent | [MECH-AGENT] Offer package drafting and negotiation facilitation |

**Child Nodes:** A13241, A13242, A13243

---

#### A13241: Construct Compensation Offer Package

**Agent Definition:** Anchor the base salary to the approved compensation band, compute the compa-ratio for the proposed salary against the band midpoint, calculate total direct compensation (base + target bonus + equity if applicable), verify FLSA exempt classification requirements are met, and perform a pay equity check against similarly situated employees in the same band.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Selection Record | Finalist identification and role class from A13233 |
| I2 | Input | Compensation Band Definitions | From A1331; band min/mid/max, target bonus percentage, FLSA status by band |
| I3 | Input | Comparable Employee Compensation | From A1331 / MECH-HRIS; current compa-ratios for similarly situated employees (same band, function, seniority tier) |
| I4 | Input | Equity Grant Schedule | From A1334; applicable grant size for role class at time of hire |
| C1 | Control | Pay Equity State Requirements | [PAY-EQUITY-STATE] — proposed base salary compa-ratio must not create a ≥10% gap vs. average compa-ratio of comparators without a documented, non-discriminatory business reason (prior experience, specialized skill, market premium) |
| C2 | Control | EPA Comparable Work | [EPA-1963] 29 U.S.C. §206(d) — compensation for substantially equal work must be equivalent across gender; any variance documented as based on seniority, merit, or factor other than sex |
| C3 | Control | FLSA Exempt Salary Basis | [FLSA-EXEMPT] 29 CFR §541.602 — exempt offer must meet or exceed current salary level threshold ($684/week as of last DOL update; use current threshold at time of offer) |
| O1 | Output | Offer Package Summary | Base salary, proposed compa-ratio (salary ÷ band midpoint), target bonus (%), equity grant (if applicable), total direct compensation, FLSA status, pay equity check result (PASS/FAIL with rationale), total fully-loaded annual cost estimate |
| M1 | Mechanism | Compensation Benchmarking | [MECH-COMP] Band and comparator data |
| M2 | Mechanism | HRIS | [MECH-HRIS] Comparator compensation data extract |

**Definition of Done:** Offer Package Summary is produced with a numeric compa-ratio (salary ÷ band midpoint expressed as a decimal) AND pay equity check is documented as PASS or FAIL with written rationale AND FLSA exempt status is confirmed against current salary threshold AND total direct compensation is calculated with no component left blank.

**Cross-Function:** [CROSS-FUNCTION: A132 ↔ A1331] Compensation Architecture bands and comparator data consumed here.

---

#### A13242: Obtain Offer Approval [Human Gate]

**Agent Definition:** Route the Offer Package Summary to Principal for approval when any of the following conditions are met: proposed base salary is above band midpoint (compa-ratio >1.00), offer includes non-standard package components (signing bonus, accelerated vesting, relocation), role reports directly to Principal, or pay equity check returned FAIL. Halt offer extension until binary approve/reject is returned.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Offer Package Summary | Output of A13241; full compensation breakdown and pay equity check result |
| I2 | Input | Selection Record | Output of A13233; finalist identification and panel scores |
| C1 | Control | Org Change Approval Policy | [ORG-CHG-POLICY] Principal approval required for offers above band midpoint or with non-standard package components |
| C2 | Control | Pay Equity Remediation | [PAY-EQUITY-STATE] if pay equity check returned FAIL, Principal must explicitly acknowledge and document the business justification before offer proceeds |
| O1 | Output | Offer Approval Record | Principal-signed approval or rejection, date, and documented rationale; if rejection: revised parameters for A13241 rerun |
| M1 | Mechanism | Document Management | [MECH-DOC] Approval record storage |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Routing and 24-hour SLA escalation |

**Definition of Done:** Offer Approval Record contains a binary approve/reject decision AND is timestamped AND if the pay equity check returned FAIL, the approval explicitly acknowledges the FAIL with written business justification AND no offer letter is generated by A13243 without a completed Offer Approval Record.

**Cross-Function:** Principal judgment gate — no offer letter is generated until this output is complete.

---

#### A13243: Extend Offer and Obtain Signed Acceptance

**Agent Definition:** Generate the employment offer letter using the Legal-approved template (IF-A1-25), attach required ancillary agreements (NDA, IP assignment, handbook acknowledgment), deliver via MECH-ESIGN, track acceptance status with a 5-business-day response window, and record the signed acceptance in MECH-ATS to trigger pre-employment verification.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Offer Approval Record | Output of A13242; approved compensation parameters |
| I2 | Input | Employment Offer Letter Template | [IF-A1-25] from Legal A12 A122; standard offer letter with at-will statement, compensation, start date, contingencies |
| C1 | Control | Employment Law Template Compliance | [IF-A1-25] offer letter must use the approved template; deviations require CLO review before delivery |
| C2 | Control | At-Will Statement | [NC-EMP-AT-WILL] (or applicable state law) — at-will statement in offer letter is required; no language that implies guaranteed tenure |
| C3 | Control | Contingency Disclosure | All conditional offer contingencies (background check, reference check, I-9) must be stated in the offer letter as conditions precedent |
| O1 | Output | Signed Employment Offer | Countersigned offer letter with all ancillary agreements; stored in MECH-ESIGN and MECH-ATS |
| M1 | Mechanism | E-Signature | [MECH-ESIGN] Offer delivery, signature collection, and record storage |
| M2 | Mechanism | ATS | [MECH-ATS] Offer status tracking; triggers pre-employment verification on acceptance |

**Definition of Done:** Signed Employment Offer is stored in MECH-ESIGN and MECH-ATS with both employer and candidate signatures AND offer letter was generated from the IF-A1-25 approved template AND all contingencies are stated in the letter AND pre-employment verification (A1325) is triggered within 1 business day of signed acceptance.

**Cross-Function:** [CROSS-FUNCTION: A132 ↔ A12 A122] Uses employment contract template. Interface: IF-A1-25.

---

## A1325: Complete Pre-Employment Verification

**Function:** Obtain FCRA-compliant candidate authorization, conduct background and eligibility checks, and adjudicate all contingencies before the candidate's first day of work.
**Supreme Constraint:** [FCRA] background check authorization and adverse action; [I9] employment eligibility; [IRCA] I-9 employer obligations; [TITLE7] adverse action cannot be pretextual discrimination

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Signed Employment Offer | Output of A13243; accepted conditional offer; pre-employment verification triggered |
| I2 | Input | Role-Type BGC Policy | Defined criteria for background check scope per role class (all, criminal only, financial-history for fiduciary roles, etc.) |
| C1 | Control | FCRA Authorization | [FCRA] 15 U.S.C. §1681b(b)(2) — separate written disclosure and authorization required before ordering any consumer report |
| C2 | Control | FCRA Adverse Action Procedure | [FCRA] 15 U.S.C. §1681m — if BGC results in rescission: pre-adverse action notice (report + summary of rights) → 5-day wait → adverse action notice |
| C3 | Control | I-9 Timing | [I9] 8 U.S.C. §1324a — Section 1 completed by employee no later than first day of work; Section 2 completed by employer within 3 business days of first day |
| O1 | Output | Pre-Employment Clearance Decision | BGC report summary, adjudication result (cleared / contingent / rescinded), I-9 completion status |
| M1 | Mechanism | ATS | [MECH-ATS] Verification status tracking |
| M2 | Mechanism | HRIS | [MECH-HRIS] I-9 record storage |
| M3 | Mechanism | LLM / Agent | [MECH-AGENT] BGC vendor coordination, I-9 reminder workflow, contingency tracking |

**Child Nodes:** A13251, A13252, A13253

---

#### A13251: Conduct Background Check

**Agent Definition:** Obtain FCRA-compliant written authorization from the candidate, order the applicable background check package from the approved Consumer Reporting Agency (CRA) per the role-type BGC policy, and document receipt and review of the completed report in MECH-ATS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Employment Offer | Output of A13243; triggers BGC initiation |
| I2 | Input | Role-Type BGC Policy | Policy defining BGC scope per role class: standard (criminal, employment, education), enhanced (+ credit for fiduciary), executive (+ reference interviews) |
| C1 | Control | FCRA Separate Disclosure Requirement | [FCRA] 15 U.S.C. §1681b(b)(2)(A) — written disclosure that a consumer report will be obtained must be in a stand-alone document (not embedded in the offer letter or application) |
| C2 | Control | FCRA Written Authorization | [FCRA] 15 U.S.C. §1681b(b)(2)(B) — candidate's written authorization (separate from disclosure) must be obtained and stored before the report is ordered |
| C3 | Control | State BGC Restrictions | [STATE-BGC-LAW] "Ban the Box" statutes in applicable jurisdictions (NC, or jurisdiction of work) — criminal history inquiry timing restrictions; ensure BGC is ordered post-conditional-offer, not pre-offer |
| O1 | Output | BGC Authorization Record | Signed FCRA disclosure and authorization; BGC report (from CRA); report receipt timestamp in MECH-ATS |
| M1 | Mechanism | LLM / Agent | [MECH-AGENT] BGC vendor portal coordination; authorization document delivery |
| M2 | Mechanism | ATS | [MECH-ATS] BGC status tracking and report storage |

**Definition of Done:** BGC Authorization Record contains a signed, stand-alone FCRA disclosure AND a signed authorization (separate documents) AND completed BGC report is stored in MECH-ATS AND the BGC was ordered after conditional offer acceptance (post-offer, pre-start).

---

#### A13252: Complete I-9 Employment Eligibility Verification

**Agent Definition:** Ensure the new hire completes I-9 Section 1 (employee attestation) on or before the first day of employment; complete Section 2 (employer verification of identity and work authorization documents) within 3 business days of the first day of work using one List A document or one List B + one List C document; store the completed I-9 in MECH-HRIS separate from the personnel file.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Employment Offer with Start Date | Output of A13243; start date determines I-9 timing deadlines |
| I2 | Input | I-9 Form (Current USCIS Version) | USCIS Form I-9; current edition; required to use the edition published by USCIS at time of hire |
| C1 | Control | I-9 Section 1 Timing | [I9] 8 U.S.C. §1324a(b)(1)(A) — employee must complete Section 1 no later than the first day of employment; Section 1 cannot be completed before the offer is accepted |
| C2 | Control | I-9 Section 2 Timing | [I9] 8 CFR §274a.2(b)(1)(ii) — employer must complete Section 2 within 3 business days of the employee's first day of employment |
| C3 | Control | I-9 Document Acceptance | [I9] I-9 List of Acceptable Documents — employer may not specify which documents from the list the employee presents; employer may not request more documents than required |
| C4 | Control | IRCA Anti-Discrimination | [IRCA] 8 U.S.C. §1324b — employer may not request specific I-9 documents based on national origin or citizenship status |
| O1 | Output | Completed I-9 Form | Both sections completed; document type and expiry (if applicable) recorded; stored in MECH-HRIS separate from personnel file; reverification date flagged if document has expiry |
| M1 | Mechanism | HRIS | [MECH-HRIS] I-9 record storage with access control (I-9 records access is limited to audit/legal purposes) |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] I-9 completion deadline reminders to new hire and onboarding coordinator |

**Definition of Done:** Completed I-9 Form is stored in MECH-HRIS with a timestamp confirming Section 2 was completed within 3 business days of the employee's start date AND document type and issuing authority are recorded AND reverification date is flagged in MECH-HRIS if the document has an expiration date.

---

#### A13253: Adjudicate Pre-Employment Contingencies

**Agent Definition:** Apply the role-specific BGC adjudication matrix to all background check findings, issue FCRA pre-adverse and adverse action notices if the decision is to rescind, document the clearance or rescission decision with written rationale, and update the ATS with the final contingency disposition.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | BGC Authorization Record | Output of A13251; completed BGC report and role-type adjudication matrix |
| I2 | Input | I-9 Completion Status | Output of A13252; work authorization confirmed or unresolved |
| C1 | Control | FCRA Pre-Adverse Action Notice | [FCRA] 15 U.S.C. §1681m(a) — if BGC findings are basis for rescission: must send pre-adverse action notice (copy of report + CFPB Summary of Rights) before final adverse action; minimum 5-business-day response window |
| C2 | Control | FCRA Adverse Action Notice | [FCRA] 15 U.S.C. §1681m(a) — if candidate does not dispute within response window: send adverse action notice (nature of adverse action, CRA name/address, right to obtain free copy, right to dispute) |
| C3 | Control | Title VII BGC Individualized Assessment | [TITLE7] 42 U.S.C. §2000e; EEOC Enforcement Guidance on Criminal Background Checks (2012) — automatic exclusions based on criminal history without individualized assessment of nature of offense, time elapsed, and job relevance create disparate impact liability |
| O1 | Output | Contingency Clearance Decision | Per contingency: cleared (proceed to onboarding), rescinded (FCRA notices issued and stored), or deferred (I-9 issue pending); written rationale and adjudication matrix scoring stored in MECH-ATS |
| M1 | Mechanism | ATS | [MECH-ATS] Contingency status and decision storage |
| M2 | Mechanism | Document Management | [MECH-DOC] FCRA notice storage with delivery confirmation |

**Definition of Done:** Contingency Clearance Decision is recorded in MECH-ATS for every BGC finding (including findings with no adverse impact) AND if rescission occurred, FCRA pre-adverse and adverse action notices are stored in MECH-DOC with delivery confirmation AND the individualized assessment is documented for any criminal history finding before rescission is executed.

**Cross-Function:** [CROSS-FUNCTION: A132 ↔ A12] FCRA adverse action procedure may require CLO review. Interface: IF-A1-25.

---

## A1326: Execute New Employee Onboarding

**Function:** Provision all required systems access, deliver employment orientation including required signed acknowledgments, and execute the 30-60-90 day integration plan that closes the onboarding cycle.
**Supreme Constraint:** [IF-A1-25] onboarding document templates; [IF-A1-07] systems access per role specification; [ADA] accommodation in onboarding delivery

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Contingency Clearance Decision | Output of A13253; all pre-employment contingencies cleared |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07 from A14; systems, tool access, and onboarding plan per role |
| I3 | Input | HRIS Position Schema | From A13131; required fields to complete the HRIS employee record |
| C1 | Control | Employment Law Onboarding Documents | [IF-A1-25] handbook acknowledgment, NDA, IP assignment, and any required policy attestations use Legal-approved templates |
| C2 | Control | ADA Onboarding Accommodation | [ADA] 42 U.S.C. §12112 — orientation delivery must accommodate any known disability; alternative formats available on request |
| C3 | Control | I-9 Completion Prerequisite | [I9] employee cannot be placed in a work assignment until I-9 Section 2 is complete |
| O1 | Output | Hired Employee Record | HRIS employee record (active), I-9 complete, payroll active (A1333), signed offer + acknowledgments stored |
| O2 | Output | Onboarded Employee Package | Orientation completion record, signed policy acknowledgments → A134 Learning & Development |
| O3 | Output | Position Register Update | A1313 notified: position status changed from "open" to "filled"; IF-A1-04 payroll setup triggered |
| M1 | Mechanism | HRIS | [MECH-HRIS] Employee record creation |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Provisioning checklist execution, orientation scheduling, 30-60-90 check-in cadence |
| M3 | Mechanism | E-Signature | [MECH-ESIGN] Onboarding document collection |

**Child Nodes:** A13261, A13262, A13263

---

#### A13261: Provision Systems and HRIS Access

**Agent Definition:** Create the new hire's HRIS employee record using the canonical position schema (A13131), trigger the IT systems provisioning checklist per role class (per IF-A1-07), activate payroll setup in A1333, and update the Authorized Position Register to "filled" status in MECH-HRIS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Contingency Clearance Decision | Output of A13253; onboarding authorized to proceed |
| I2 | Input | HRIS Position Schema | Output of A13131; required fields for employee record creation |
| I3 | Input | Role Requirements and Competency Profile | IF-A1-07 from A14; systems access entitlements by role class; IT provisioning checklist |
| C1 | Control | I-9 Prerequisite | [I9] 8 U.S.C. §1324a — work assignment (including system access for productive use) may not be granted until I-9 Section 2 is complete |
| C2 | Control | FLSA Classification in HRIS | [FLSA-EXEMPT] 29 CFR Part 541 — HRIS employee record must reflect correct FLSA status at time of creation; no record created with FLSA status = NULL |
| C3 | Control | Payroll Setup Trigger | [IRC-3111] [IRS-PUB15] — payroll record must be created before or on the employee's first payday; provisioning must coordinate with A1333 payroll cycle |
| O1 | Output | Active HRIS Employee Record | Employee record in MECH-HRIS: employee ID, name, position ID (linked to authorized position register), department, band, FLSA status, start date, manager, I-9 status = verified |
| O2 | Output | IT Provisioning Confirmation | Checklist: email provisioned, collaboration tools provisioned, role-specific tools provisioned, access entitlements per IF-A1-07; all items checked or exception documented |
| O3 | Output | Payroll Setup Trigger | New hire record routed to A1333 with pay rate, FLSA status, pay frequency, start date, and W-4/direct deposit collection initiated |
| M1 | Mechanism | HRIS | [MECH-HRIS] Employee record creation; position status update to "filled" |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Provisioning checklist orchestration and exception tracking |

**Definition of Done:** Active HRIS Employee Record is created with zero NULL required fields (per A13131 schema) AND position status is updated from "open" to "filled" in the Authorized Position Register AND IT Provisioning Confirmation has a checked or exception-noted status for every item in the role-class checklist AND payroll setup record is transmitted to A1333 before the employee's first payday.

**Cross-Function:** [CROSS-FUNCTION: A132 → A1333] Payroll setup trigger. Interface: IF-A1-04. [CROSS-FUNCTION: A132 ↔ A14] IT access per role specification. Interface: IF-A1-07.

---

#### A13262: Deliver Employment Orientation

**Agent Definition:** Conduct a structured day-1 orientation covering organizational culture, People policies, and compliance training; collect countersigned copies of all required onboarding documents (handbook acknowledgment, NDA, IP assignment, applicable state-required notices); and issue an orientation completion record.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Active HRIS Employee Record | Output of A13261; confirms new hire is provisioned and payroll-active |
| I2 | Input | Onboarding Document Package | [IF-A1-25] handbook, NDA, IP assignment agreement, and any required state-specific new hire notices (NC: wage notice, etc.) |
| C1 | Control | Employment Law Templates | [IF-A1-25] NDA and IP assignment must use CLO-approved templates; no deviations without CLO sign-off |
| C2 | Control | ADA Orientation Accommodation | [ADA] 42 U.S.C. §12112 — if employee disclosed disability, orientation materials must be available in the required alternative format (screen reader-compatible, captioned video, etc.) |
| C3 | Control | State New Hire Notice Requirements | [NC-EMP-AT-WILL] + applicable state wage payment notice — written wage statement at hiring (NC Gen. Stat. §95-25.13) must be provided on or before first day |
| O1 | Output | Orientation Completion Record | Employee name, date, list of documents signed with signature timestamps, compliance training topics covered, accommodation delivered (if applicable); stored in MECH-DOC |
| O2 | Output | Signed Onboarding Document Package | Countersigned: offer letter, handbook acknowledgment, NDA, IP assignment, state wage notice; stored in MECH-ESIGN |
| M1 | Mechanism | E-Signature | [MECH-ESIGN] Document collection and storage |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Orientation agenda delivery, completion tracking, document routing |

**Definition of Done:** Orientation Completion Record is stored in MECH-DOC within 1 business day of the new hire's first day AND all required documents (handbook acknowledgment, NDA, IP assignment, applicable state wage notice) are countersigned and stored in MECH-ESIGN AND accommodation delivery is documented if an ADA accommodation was in effect.

**Cross-Function:** [CROSS-FUNCTION: A132 → A134] Orientation Completion Record is the handoff trigger to Learning & Development for role-specific training.

---

#### A13263: Execute 30-60-90 Day Integration Plan

**Agent Definition:** Conduct structured integration check-ins at 30, 60, and 90 days using a standardized scorecard; identify and escalate early performance risk to A135 Performance Management at the 60-day mark if warranted; close the onboarding cycle with a Principal-acknowledged integration confirmation at day 90.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Orientation Completion Record | Output of A13262; onboarding start confirmed |
| I2 | Input | Assessment Protocol Document | Output of A13231; competency dimensions from hiring assessment; baseline for 30-60-90 performance expectations |
| C1 | Control | ADA Accommodation Continuity | [ADA] 42 U.S.C. §12112 — any accommodation provided during the hiring process must be reviewed and continued or adjusted during the 30-60-90 period through the interactive accommodation process |
| C2 | Control | NLRA At-Will Restriction | [NLRA] 29 U.S.C. §151 — separation during the 30-60-90 period based on protected concerted activity is prohibited; documented performance basis required for any early exit |
| O1 | Output | Integration Scorecard (30 / 60 / 90 Day) | Per check-in: competency dimension ratings, manager observations, new hire self-assessment, outstanding provisioning issues, accommodation status, recommendation (on-track / monitor / escalate) |
| O2 | Output | Onboarding Cycle Closure Confirmation | Principal-acknowledged completion at day 90: new hire confirmed integrated, HRIS record updated to "active — onboarding complete," escalations resolved or handed to A135 |
| M1 | Mechanism | LLM / Agent | [MECH-AGENT] Check-in scheduling, scorecard generation, escalation routing |
| M2 | Mechanism | HRIS | [MECH-HRIS] Onboarding status flag update |

*[Internal A13 Tunnel: If integration scorecard at 60 days indicates a performance concern, escalation to A135 A13513 (Set Performance Expectations) is the earliest entry point for the performance improvement process. No IF-A1-XX registration required.]*

**Definition of Done:** Integration Scorecard is completed at 30, 60, and 90 days AND any "escalate" recommendation at the 60-day scorecard has a documented escalation record routed to A135 AND Onboarding Cycle Closure Confirmation is acknowledged by Principal at or before day 95 with HRIS status updated to "active — onboarding complete."

**Cross-Function:** [CROSS-FUNCTION: A132 → A135] Early performance flag routed to Performance Management at 60-day mark if escalation threshold met.

---

## Boundary Arrow Correspondence (A132 → Parent A13)

| A132 Output | Routes To | Notes |
|---|---|---|
| O1: Hired Employee Record | A1313 (HRIS position register update); A1333 (payroll setup via IF-A1-04) | Triggers position status "filled" and payroll activation |
| O2: Onboarded Employee Package | A134 Learning & Development | Orientation completion is the L&D intake trigger |
| O3: New Hire Notification to Payroll | A1333 Payroll Processing via IF-A1-04 | Payroll record creation required before first payday |

*The Ranked Candidate Shortlist, Selection Record, and Offer Approval Record are internal A132 workflow artifacts. They do not cross the A13 boundary and do not require IF-A1-XX designations.*

---

## New Codes Added (SPR-021)

### Constraint Codes (additions to Section 4.5 Employment Law)
- `FCRA`: Fair Credit Reporting Act (15 U.S.C. §1681) — written authorization required before consumer report; pre-adverse and adverse action notices required if rescinding
- `IRCA`: Immigration Reform and Control Act — Anti-Discrimination Provision (8 U.S.C. §1324b) — employer may not request specific I-9 documents based on national origin or citizenship status
- `STATE-BGC-LAW`: State Ban-the-Box and criminal background check timing restrictions — criminal history inquiry must be post-conditional-offer in covered jurisdictions
- `NC-EMP-AT-WILL`: North Carolina Employment At-Will / Wage Notice (N.C. Gen. Stat. §95-25.13) — written wage statement required at hiring; at-will language required in offer letter

### Mechanism Codes
- `MECH-ATS`: Pre-existing in catalog (Section 3: HR & People Systems). No new registration needed.

---

## Leaf Node Count Verification

| L4 Node | Leaf Nodes |
|---|---|
| A1321: Source Candidates | A13211, A13212, A13213 = 3 |
| A1322: Screen and Qualify Candidates | A13221, A13222, A13223 = 3 |
| A1323: Select Finalist Through Assessment | A13231, A13232, A13233 = 3 |
| A1324: Extend and Negotiate Employment Offer | A13241, A13242, A13243 = 3 |
| A1325: Complete Pre-Employment Verification | A13251, A13252, A13253 = 3 |
| A1326: Execute New Employee Onboarding | A13261, A13262, A13263 = 3 |
| **Total** | **18** |
