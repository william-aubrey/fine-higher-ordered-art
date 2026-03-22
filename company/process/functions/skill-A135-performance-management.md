# Skill File: Performance Management

**Node:** A135
**Parent:** A13 People
**Function:** Establish measurable performance expectations for every employee, execute the continuous feedback and formal review cycle, calibrate the 9-box talent grid, administer performance improvement plans, and execute compliant performance exits.
**Supreme Constraint:** [TITLE7] Title VII; [ADA] Americans with Disabilities Act; [ADEA] Age Discrimination in Employment Act; [FMLA] Family and Medical Leave Act; [NLRA] National Labor Relations Act; [EEOC-PROC] EEOC Uniform Selection Guidelines; [IF-A1-25] Legal A12 Performance and Separation Templates
**Cross-Function Interfaces:** IF-A1-04, IF-A1-07, IF-A1-25
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [ ] Compa-ratio analysis and salary band calibration — *A135 produces merit increase recommendations that feed A1331 Compensation Architecture for compa-ratio adjustment. A135 does not own band definitions; cross-function output documented at A13543.*
- [ ] RIF legal compliance checklist — *A1356 A13561 includes explicit WARN Act threshold check (coordinate with A131 A1314) for any performance exit that is part of a larger workforce reduction event. Satisfied here and upstream.*
- [x] 9-box talent grid calibration — A1354 (A13541–A13543) [MECH-PERF]; primary owner; full 9-box calibration cycle designed and executed here; output flows to A131 A13152 (Succession Planning)
- [x] HRIS data model design — A1356 A13563 [MECH-HRIS]; performance exit triggers HRIS record termination per A13131 schema; A1353 review ratings written to HRIS; HRIS performance data model consumed here
- [ ] Organizational network analysis — *Primary owner: A131 A1316. Not applicable to A135. Satisfied upstream.*
- [ ] Succession depth charting — *A135 outputs validated 9-box placements to A131 A13152 (Bench Strength Assessment), which produces the Succession Depth Report. Succession charting is A131's domain; this sprint provides the required input.*

---

## A135: Performance Management

**Function:** Establish measurable performance expectations for every employee, execute the continuous feedback and formal review cycle, calibrate the 9-box talent grid, administer performance improvement plans, and execute compliant performance exits.
**Supreme Constraint:** [TITLE7] Title VII; [ADA] ADA; [ADEA] ADEA; [FMLA] FMLA; [NLRA] NLRA; [EEOC-PROC] EEOC Uniform Guidelines

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Workforce Architecture Plan | From A131 O1; role class definitions, span standards, authorized positions |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07 from A14 Engineering; behavioral and technical competency standards per role |
| I3 | Input | 30-60-90 Integration Scorecard | From A132 A13263 (internal A13 tunnel); early performance risk flags for new hires |
| I4 | Input | Compensation Band Definitions | From A1331; merit increase parameters; compa-ratio targets for rating-linked increases |
| C1 | Control | Title VII Non-Discrimination in Ratings | [TITLE7] 42 U.S.C. §2000e — performance criteria and rating process must be applied consistently across all protected classes; disparate impact in rating distributions triggers EEOC-PROC adverse impact review |
| C2 | Control | ADA Accommodation in Performance Process | [ADA] 42 U.S.C. §12112 — performance expectations must account for approved reasonable accommodations; PIP cannot hold employee to a standard incompatible with their active accommodation plan |
| C3 | Control | ADEA Age-Neutral Performance Assessment | [ADEA] 29 U.S.C. §621 — ratings and potential assessments cannot use age as a proxy for potential, learning velocity, or career horizon; 9-box calibration is age-blind |
| C4 | Control | FMLA Leave Non-Interference | [FMLA] 29 U.S.C. §2614 — employees on FMLA-protected leave cannot have their performance rating negatively impacted by absences taken under FMLA; rating period may be pro-rated for extended leave |
| C5 | Control | NLRA Concerted Activity Protection | [NLRA] 29 U.S.C. §151; [STERICYCLE] 372 NLRB No. 113 (2023) — performance management actions cannot target employees engaged in protected concerted activity; PIPs cannot be used as pretext for anti-union retaliation |
| C6 | Control | Employment Law Templates | [IF-A1-25] PIP template, separation agreement, ADEA OWBPA waiver, and WARN Act notice templates from Legal A12 A125 |
| O1 | Output | Validated 9-Box Placement Grid | Final 9-box placements for all employees → A131 A13152 (internal A13 tunnel); merit increase eligibility flag → A1331 |
| O2 | Output | Performance Review Record | Annual or semi-annual rated review per employee → MECH-PERF and MECH-HRIS; feeds A134 L&D development plan |
| O3 | Output | Performance Exit Package | Final pay calculation, COBRA notice, separation agreement → A1333 (IF-A1-04); HRIS termination → A1313 |
| O4 | Output | PIP and Corrective Action Record | Documented PIP, check-in notes, and outcome → Legal A12 A1254 via IF-A1-25 for EEO risk management |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Lattice / 15Five / Culture Amp / Betterworks; OKR tracking, review cycles, 9-box calibration |
| M2 | Mechanism | HRIS | [MECH-HRIS] Employee record; performance rating storage; termination processing |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] [MECH-AGENT] Review drafting, calibration facilitation, PIP design support |
| M4 | Mechanism | Document Management | [MECH-DOC] PIP records, separation agreements, corrective action documentation |
| M5 | Mechanism | E-Signature | [MECH-ESIGN] Separation agreement and PIP acknowledgment execution |

**Child Nodes:** A1351, A1352, A1353, A1354, A1355, A1356

---

## A1351: Set Performance Expectations

**Function:** Establish measurable OKRs, behavioral competency standards, and mutual commitment acknowledgments for every employee at the start of each performance period.
**Supreme Constraint:** [ADA] essential functions must be achievable with accommodation; [TITLE7] competency standards must be applied uniformly; [ADEA] age-neutral potential expectations

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Business Operating Plan | Principal-set annual targets; revenue, production, and governance objectives that cascade to individual OKRs |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07; behavioral and technical competencies per role class |
| I3 | Input | Approved Reasonable Accommodation Plan | From A12 A1253 via IF-A1-25; active accommodations that modify performance expectation delivery format |
| C1 | Control | ADA Accommodation Integration | [ADA] 42 U.S.C. §12112(b)(5) — if employee has an active accommodation, OKR targets and delivery methods must be compatible with the accommodation; accommodation does not lower the performance standard, only the delivery mechanism |
| C2 | Control | Title VII Consistency | [TITLE7] 42 U.S.C. §2000e — competency standards must be applied at the same level of rigor across all employees in the same role class; manager-level variation in standard-setting triggers adverse impact risk |
| O1 | Output | Individual OKR Set | Per employee: 3–5 objectives, 2–3 measurable key results each, traceable to business operating plan; stored in MECH-PERF |
| O2 | Output | Competency Standard Assignment | Behavioral anchor per competency dimension per role class; standard stored in MECH-PERF and acknowledged by employee and manager |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] OKR configuration and goal tracking |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] OKR drafting and business-plan-to-individual-goal cascade |

**Child Nodes:** A13511, A13512, A13513

---

#### A13511: Draft Individual OKRs and Performance Goals

**Agent Definition:** For each employee, draft 3–5 quarterly or annual Objectives with 2–3 measurable Key Results each; every Key Result must be traceable to a named business outcome in the operating plan; goals are stored in MECH-PERF and ready for manager approval before the performance period begins.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Business Operating Plan | Annual targets by A0-level function (Governance A1, Production A2, Sales A3); cascaded to department and team targets |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07; functional accountabilities and success metrics for the role |
| C1 | Control | ADA Goal Compatibility | [ADA] 42 U.S.C. §12112(b)(5) — Key Results must be achievable through the approved accommodation modality; e.g., if accommodation allows remote delivery, goal cannot require in-person attendance as the sole success metric |
| C2 | Control | SMART Goal Standard | [SMART-GOALS] Each Key Result must be: Specific (named metric), Measurable (numeric target), Achievable (within authorized resources), Relevant (traceable to operating plan line item), Time-bound (due date stated) |
| O1 | Output | Individual OKR Draft | Per employee: objectives (labeled O1–O5), key results (KR1–KR3 per O), owner, due date, business-plan traceability link; stored in MECH-PERF as draft pending approval |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] OKR drafting and version control |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Cascade from operating plan; auto-suggest KR metrics based on role requirements |

**Definition of Done:** Individual OKR Draft contains 3–5 objectives AND every Key Result has a numeric target with a due date AND every objective is traceable to a named line item in the current business operating plan with zero carry-forward objectives without re-justification.

---

#### A13512: Define Role Competency Standards

**Agent Definition:** For each active role class, publish a behavioral competency standard specifying the expected behaviors at each performance level (Below Standard / Meets Standard / Exceeds Standard / Distinguished) for every competency dimension in the role requirements, and encode the standards in MECH-PERF as the calibration rubric.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Role Requirements and Competency Profile | IF-A1-07 from A14; competency dimensions and descriptions per role class |
| I2 | Input | Assessment Protocol Document | From A132 A13231; competency dimensions used in hiring assessment (ensure assessment → performance continuity) |
| C1 | Control | ADEA Age-Neutral Competency Language | [ADEA] 29 U.S.C. §623 — competency anchors cannot include descriptors that correlate with age (e.g., "digital native," "high energy," "career runway ahead") without demonstrated job-relatedness |
| C2 | Control | ADA Essential Function Basis | [ADA] 42 U.S.C. §12111(8) — competency standards must be grounded in essential functions of the role; accommodation does not reduce the standard, only the delivery format |
| C3 | Control | EEOC Selection Criterion Validity | [EEOC-PROC] 29 CFR Part 1607 §14 — if competency standards are used in promotion or reduction decisions, they must be content-valid and consistently applied |
| O1 | Output | Competency Standard Matrix | Per role class: competency dimension name, behavioral anchors at each of 4 performance levels (Below/Meets/Exceeds/Distinguished), maximum of 6 dimensions per role class; stored in MECH-PERF and MECH-DOC |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Competency rubric configuration |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Anchor language generation; age-neutral language review |

**Definition of Done:** Competency Standard Matrix covers all active role classes in the Authorized Position Register AND every role class has behavioral anchors at all 4 performance levels for every competency dimension AND the matrix is version-controlled in MECH-DOC with a publish date.

---

#### A13513: Obtain Mutual Performance Commitment [Human Gate]

**Agent Definition:** Route each employee's individual OKR Set and Competency Standard Assignment to their manager for approval; manager approves or revises goals within 5 business days; employee countersigns; log mutual commitment in MECH-PERF; no performance period begins without both signatures.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Individual OKR Draft | Output of A13511; approved-pending employee + manager sign-off |
| I2 | Input | Competency Standard Matrix | Output of A13512; applicable role class standards |
| C1 | Control | NLRA Concerted Activity | [NLRA] 29 U.S.C. §151; [STERICYCLE] — manager cannot use goal-setting to disadvantage employees engaged in protected concerted activity; goals must be consistent across similarly situated employees regardless of labor organizing status |
| C2 | Control | ADA Interactive Process | [ADA] 42 U.S.C. §12112 — if employee raises accommodation concern during goal acknowledgment, the manager must initiate the interactive process before finalizing goals |
| O1 | Output | Signed Performance Commitment Record | Employee name, manager name, OKR Set reference, Competency Standard reference, dual signature (employee + manager), effective date of performance period; stored in MECH-PERF |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Signature workflow and commitment record |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Routing, 5-business-day SLA escalation |

**Definition of Done:** Signed Performance Commitment Record is stored in MECH-PERF with both employee and manager signatures AND the record is dated before or on the performance period start date AND any accommodation concern raised during the goal-setting process has a documented interactive-process initiation record.

**Cross-Function:** Principal judgment gate for any Principal-direct employee performance commitments.

---

## A1352: Conduct Continuous Performance Feedback

**Function:** Execute the structured 1:1 cadence, deliver real-time recognition and corrective feedback, and conduct mid-cycle check-ins to surface and address performance risk before the formal review period.
**Supreme Constraint:** [ADA] accommodation continuity; [FMLA] leave non-interference; [NLRA] feedback cannot target protected concerted activity

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Signed Performance Commitment Record | Output of A13513; active OKRs and competency standards in MECH-PERF |
| I2 | Input | 30-60-90 Integration Scorecard | From A132 A13263; new hire performance risk flags to incorporate into 1:1 cadence |
| C1 | Control | FMLA Leave Non-Interference | [FMLA] 29 U.S.C. §2614 — 1:1 cadence must be paused for employees on FMLA; no negative performance notations for absences covered by protected leave |
| C2 | Control | NLRA Anti-Retaliation | [NLRA] 29 U.S.C. §151 — corrective feedback must be grounded in documented performance evidence; feedback timed to coincide with union organizing activity triggers NLRA retaliation risk |
| C3 | Control | ADA Accommodation Review | [ADA] 42 U.S.C. §12112 — if accommodation need arises during mid-cycle, immediate interactive process required; performance rating period may not proceed until accommodation is in place |
| O1 | Output | 1:1 Action Item Log | Per employee: dated action items, blockers, goal progress updates; stored in MECH-PERF |
| O2 | Output | Real-Time Feedback Record | Per feedback event: date, behavior, impact, specific evidence; stored in MECH-PERF within 5 business days of triggering event |
| O3 | Output | Mid-Cycle Check-In Record | Formal mid-period review: OKR progress, goal adjustments (if any), at-risk flag, accommodation status |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] 1:1 agenda, feedback logging, mid-cycle check-in |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Cadence reminders, feedback prompt generation |

**Child Nodes:** A13521, A13522, A13523

---

#### A13521: Execute Structured 1:1 Check-in Cadence

**Agent Definition:** Maintain a weekly or bi-weekly structured 1:1 between each employee and their manager using a standardized agenda covering: OKR progress (RAG status), blockers, development discussion, and wellbeing check; document action items and flag any goal at-risk status in MECH-PERF within 24 hours of the meeting.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Performance Commitment Record | Active OKRs from A13513; reference for goal progress status |
| I2 | Input | 30-60-90 Integration Scorecard | From A132 A13263; performance observations from onboarding period (new hires only, first 90 days) |
| C1 | Control | FMLA Non-Interference | [FMLA] 29 U.S.C. §2614 — 1:1 cadence suspended during FMLA leave; no negative performance notations for leave-protected absences |
| C2 | Control | ADA Accommodation Continuity | [ADA] 42 U.S.C. §12112 — if employee raises a new accommodation need during a 1:1, manager must document and initiate the interactive process; cannot continue performance tracking against incompatible standards |
| O1 | Output | 1:1 Meeting Record | Date, attendees, OKR status per goal (Green/Amber/Red), blockers logged, action items with owner and due date, any at-risk flag; stored in MECH-PERF within 24 hours of meeting |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] 1:1 template and action item tracking |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Meeting agenda pre-population from OKR status; post-meeting action item capture |

**Definition of Done:** 1:1 Meeting Record is stored in MECH-PERF within 24 hours of each meeting AND every open OKR has a current RAG status AND any goal rated Red has a documented action item with an owner and due date AND meetings occur at the defined cadence (weekly or bi-weekly) with zero gaps >21 calendar days without a documented exception.

---

#### A13522: Deliver Real-Time Performance Feedback

**Agent Definition:** Deliver specific, behavior-based performance feedback (positive recognition or corrective redirection) within 5 business days of the triggering event; log every feedback instance in MECH-PERF with: date, behavior observed, business impact, and specific evidence; no verbal-only feedback without corresponding MECH-PERF record.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Performance Event | Observed behavior or outcome meriting feedback (positive or corrective); manager-identified |
| I2 | Input | Competency Standard Matrix | Output of A13512; reference for what "Meets Standard" behavior looks like for the role |
| C1 | Control | NLRA Anti-Retaliation | [NLRA] 29 U.S.C. §151; [STERICYCLE] — corrective feedback delivered contemporaneously with protected concerted activity (e.g., a complaint to a coworker about working conditions) without a documented performance basis triggers retaliation risk; timing must be documented |
| C2 | Control | ADA No Disability-Based Feedback | [ADA] 42 U.S.C. §12112(d) — corrective feedback cannot reference a known disability or an accommodation request; feedback must be grounded in observable work product or behavior |
| C3 | Control | ADEA Age-Neutral Language | [ADEA] 29 U.S.C. §623 — feedback cannot reference age-correlated assumptions ("at this stage of your career," "younger colleagues adapt faster"); must reference specific observable behaviors |
| O1 | Output | Real-Time Feedback Record | Date, employee, manager, behavior description (specific and observable), business impact, competency dimension tagged, positive/corrective classification, evidence attachments; stored in MECH-PERF within 5 business days |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Feedback logging |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Behavior-based feedback language generation; prohibited language check |

**Definition of Done:** Real-Time Feedback Record is stored in MECH-PERF within 5 business days of the triggering event AND the record contains a specific observable behavior (not a personality attribution) AND the relevant competency dimension is tagged AND no feedback record contains prohibited language categories (disability reference, age-correlated language, protected activity reference).

---

#### A13523: Conduct Mid-Cycle Performance Check-In

**Agent Definition:** At the performance period midpoint (or 6 months for annual cycles), facilitate a structured check-in to review OKR attainment to date, authorize goal adjustments for material business changes, confirm accommodation status is current, and flag employees at risk of a below-standard rating for early corrective support.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | 1:1 Meeting Records | Output of A13521; YTD goal progress and at-risk flags |
| I2 | Input | Business Operating Plan Changes | Any material changes to the operating plan that warrant goal revision |
| C1 | Control | ADA Accommodation Review | [ADA] 42 U.S.C. §12112 — mid-cycle check-in includes explicit review of active accommodations; any changed circumstances require re-initiation of interactive process |
| C2 | Control | FMLA Leave Adjustment | [FMLA] 29 U.S.C. §2614 — if employee has taken FMLA leave since performance period start, OKR achievement targets must be pro-rated for the leave period; no "makeup" expectations for leave time |
| C3 | Control | Title VII Consistent Application | [TITLE7] 42 U.S.C. §2000e — goal adjustment criteria must be applied consistently across all similarly situated employees; adjustments cannot be selectively offered or denied based on protected class membership |
| O1 | Output | Mid-Cycle Check-In Record | Employee, date, OKR progress (% attainment per KR), goal adjustments approved (with business rationale), at-risk flag (Y/N), accommodation status confirmed, early support action items if at-risk |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Mid-cycle review template |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Scheduling, progress pull from MECH-PERF, at-risk flag computation |

**Definition of Done:** Mid-Cycle Check-In Record is stored in MECH-PERF for 100% of active employees within the defined mid-cycle window AND every at-risk flag has a documented early support action item with an owner AND every FMLA leave period in the performance cycle has a corresponding goal pro-ration documented.

---

## A1353: Execute Formal Review Cycle

**Function:** Collect self-assessments and 360-degree feedback, produce written manager performance reviews with numeric ratings, and process employee acknowledgments including escalation for contested ratings.
**Supreme Constraint:** [TITLE7] [ADA] [ADEA] [EEOC-PROC] consistent, evidence-based ratings; [FMLA] leave non-interference

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Mid-Cycle Check-In Records | Output of A13523; YTD progress and risk flags going into formal review |
| I2 | Input | Real-Time Feedback Records | Output of A13522; behavioral evidence log for the review period |
| C1 | Control | EEOC Record Retention | [EEOC-PROC] 42 U.S.C. §2000e-5(e); 29 CFR §1602.14 — performance reviews retained ≥1 year; if adverse employment action follows, retained for duration of any charge plus 3 years |
| C2 | Control | ADEA Review Language | [ADEA] 29 U.S.C. §623 — written review cannot reference age, years remaining in career, or assumptions about learning capacity based on tenure length |
| C3 | Control | ADA Rating Basis | [ADA] 42 U.S.C. §12112 — rating must be based on performance of essential functions with approved accommodation in place; cannot rate an employee "below standard" solely for inability to perform a marginal function |
| O1 | Output | Written Performance Review | Rated review per employee: overall rating, evidence per competency dimension, OKR attainment score; stored in MECH-PERF |
| O2 | Output | Employee Acknowledgment Record | Employee signature (agreement or dispute noted) + rebuttal if filed; stored in MECH-PERF |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Review workflow, rating capture, acknowledgment |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Review drafting and evidence-to-rating mapping |

**Child Nodes:** A13531, A13532, A13533

---

#### A13531: Collect Self-Assessment and 360-Degree Feedback

**Agent Definition:** Launch the annual or semi-annual review cycle in MECH-PERF by distributing the self-assessment form to every employee and the 360-degree feedback request to the manager-selected panel of peers and collaborators; enforce a 14-calendar-day collection window; no manager review is written until the self-assessment is submitted.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Performance Commitment Record | Active OKR Set and Competency Standard from A13513; basis for self-assessment structure |
| I2 | Input | Manager-Selected 360 Participant List | Manager nominates 3–5 peers/collaborators; employee may suggest additions; final list approved by manager |
| C1 | Control | Title VII 360 Participant Non-Discrimination | [TITLE7] 42 U.S.C. §2000e — 360 participant selection cannot systematically exclude peers who are members of protected classes, which could produce biased feedback inputs used in rating decisions |
| C2 | Control | ADA Self-Assessment Format | [ADA] 42 U.S.C. §12112 — self-assessment form and submission process must be accessible in the employee's approved accommodation format |
| C3 | Control | EEOC Retention of Self-Assessments | [EEOC-PROC] 29 CFR §1602.14 — self-assessments are part of the employee personnel record and subject to EEOC retention requirements |
| O1 | Output | Self-Assessment Submission | Employee's completed self-assessment: OKR attainment narrative, competency self-rating per dimension, development observations; submitted in MECH-PERF within the 14-day window |
| O2 | Output | 360 Feedback Summary | Aggregated (anonymized for peers, attributed for manager) feedback responses per competency dimension; stored in MECH-PERF |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Self-assessment and 360 collection workflow |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Deadline reminders; 360 prompt generation |

**Definition of Done:** Self-Assessment Submission is stored in MECH-PERF for 100% of employees in the review cycle within the 14-day collection window AND 360 Feedback Summary is available for each employee with responses from ≥3 of the nominated participants AND no manager review writing is initiated before the corresponding self-assessment is submitted.

---

#### A13532: Write and Deliver Manager Performance Review

**Agent Definition:** Manager writes the formal annual performance review synthesizing self-assessment, 360 feedback, Mid-Cycle Check-In Record, and Real-Time Feedback Records into a written review with: an overall numeric rating (1–5 scale or defined tier), specific evidence per competency dimension, and an OKR attainment score; the review is delivered to the employee within 5 business days of the review cycle close.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Self-Assessment Submission | Output of A13531; employee's narrative and self-rating |
| I2 | Input | 360 Feedback Summary | Output of A13531; peer and collaborator input |
| I3 | Input | Real-Time Feedback Records | Output of A13522; behavioral evidence log from review period |
| I4 | Input | Mid-Cycle Check-In Record | Output of A13523; YTD progress and at-risk context |
| C1 | Control | ADEA Review Language | [ADEA] 29 U.S.C. §623 — written review text must not reference age, career-remaining assumptions, or imply performance expectations differ by age cohort |
| C2 | Control | ADA Rating Basis | [ADA] 42 U.S.C. §12112 — if employee worked under an accommodation during the review period, the rating is based on performance of essential functions with that accommodation; any below-standard rating must be grounded in documented performance evidence, not accommodation-related delivery differences |
| C3 | Control | NLRA Documentation Standard | [NLRA] 29 U.S.C. §151 — below-standard ratings assigned contemporaneously with known union organizing or complaint activity must have documented, pre-existing performance evidence; any rating without documented behavioral evidence prior to the organizing activity creates NLRA retaliation risk |
| O1 | Output | Written Performance Review | Formal review document: overall rating (numeric), evidence per competency dimension (specific behavioral observations, not personality attributions), OKR attainment score (% KR completion), development recommendations; stored in MECH-PERF |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Review authoring and submission |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Evidence synthesis; prohibited language check |

**Definition of Done:** Written Performance Review is submitted in MECH-PERF within 5 business days of review cycle close AND every competency dimension has at least one specific behavioral evidence statement (not a personality attribution) AND the OKR attainment score is computed as a numeric percentage AND the review passes a prohibited-language check (no age references, disability references, or protected activity references).

---

#### A13533: Process Employee Acknowledgment and Escalation [Human Gate]

**Agent Definition:** Route the completed Written Performance Review to the employee for acknowledgment within a 7-calendar-day window; employee signs agreement OR submits a written rebuttal; any rebuttal alleging discrimination or EEOC-protected concern is escalated immediately to Legal A12 A1254; all records are locked in MECH-PERF after the window closes.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Written Performance Review | Output of A13532; manager-submitted review ready for employee acknowledgment |
| I2 | Input | Active Accommodation Record | From A12 A1253 via IF-A1-25; if accommodation concern is raised in rebuttal, accommodation record is attached |
| C1 | Control | EEOC Record Retention | [EEOC-PROC] 29 CFR §1602.14 — employee rebuttal is part of the performance record; retained with the review for ≥1 year; if adverse action follows, retained for duration of charge plus 3 years |
| C2 | Control | Title VII EEO Escalation | [TITLE7] 42 U.S.C. §2000e — if rebuttal contains an allegation of discriminatory rating, the allegation must be logged as an EEOC complaint and routed to A12 A1254 (Investigate Employment Complaints) within 2 business days |
| C3 | Control | ADA Accommodation Dispute | [ADA] 42 U.S.C. §12112 — if rebuttal alleges the rating was based on an accommodation-incompatible standard, the complaint triggers a re-review of the accommodation plan before the rating is finalized |
| O1 | Output | Employee Acknowledgment Record | Employee name, acknowledgment date, agreement or dispute notation, rebuttal text if filed (verbatim), escalation flag if discrimination concern raised; locked in MECH-PERF after 7-day window |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Acknowledgment workflow with 7-day countdown and lock |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Routing, deadline tracking, escalation trigger |

**Definition of Done:** Employee Acknowledgment Record is locked in MECH-PERF within 9 business days of review delivery (7-day window + 2-day processing) AND any rebuttal containing a discrimination or accommodation allegation has a documented escalation to Legal A12 A1254 within 2 business days AND no performance record is altered after lock without Principal and CLO dual authorization.

**Cross-Function:** [CROSS-FUNCTION: A135 → A12 A1254] EEO complaint escalation. Interface: IF-A1-25.

---

## A1354: Calibrate 9-Box Talent Grid

**Function:** Execute the cross-functional calibration session that produces validated 9-box talent grid placements for all employees, normalizes rating distributions, and delivers the outputs to Succession Planning (A131 A13152) and Compensation Architecture (A1331) for merit cycle.
**Supreme Constraint:** [TITLE7] [ADA] [ADEA] age-blind, accommodation-neutral calibration; [EEOC-PROC] calibration outcomes are de facto selection criteria and must withstand adverse impact scrutiny

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Written Performance Reviews | Output of A13532; manager-assigned performance ratings for all employees |
| I2 | Input | Preliminary Potential Assessments | Manager input on each employee's potential dimension (1–3 scale: meets current role / exceeds current role / ready for greater scope); submitted before calibration session |
| I3 | Input | Workforce Capacity Gap Register | From A131 A13122; highest-risk gap functions inform calibration prioritization |
| C1 | Control | Title VII Rating Distribution | [TITLE7] 42 U.S.C. §2000e; [EEOC-PROC] 29 CFR Part 1607 — if final rating distribution shows statistically significant adverse impact on a protected class (4/5ths rule applied to below-standard ratings), remediation required before merit actions are taken |
| C2 | Control | ADEA Potential Assessment | [ADEA] 29 U.S.C. §621 — potential dimension cannot be rated based on age-correlated assumptions about career horizon, adaptability, or learning velocity |
| C3 | Control | ADA Calibration Neutrality | [ADA] 42 U.S.C. §12112 — calibration panel cannot rate a known disability as a performance risk factor; accommodation status is not a calibration input |
| O1 | Output | Validated 9-Box Grid | Final placement for every active employee: performance axis (1–3), potential axis (1–3), 9-box coordinate, calibration session date, any panel override with documented rationale |
| O2 | Output | Rating Distribution Analysis | Aggregate distribution by function: % at each performance tier; adverse impact check result (PASS/FAIL); function-level flags for distribution outliers |
| O3 | Output | Merit Eligibility Flag | Per employee: performance rating tier; merit increase eligibility (eligible/ineligible/at-Principal-discretion) → A1331 Compensation Architecture for merit cycle |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] 9-box module; calibration facilitation |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Distribution analysis; adverse impact calculation; calibration session facilitation support |

**Child Nodes:** A13541, A13542, A13543

---

#### A13541: Prepare 9-Box Calibration Inputs

**Agent Definition:** Compile all manager-submitted performance ratings and preliminary potential assessments into the 9-box calibration worksheet; compute the rating distribution for each function; flag any function where >40% of employees are rated Exceeds or Distinguished for mandatory calibration review; flag any function with statistically significant protected-class skew in below-standard ratings.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Written Performance Reviews | Output of A13532; manager-assigned overall performance ratings for all employees |
| I2 | Input | Preliminary Potential Assessments | Manager-submitted potential ratings (1–3) for each employee |
| C1 | Control | Title VII Distribution Pre-Check | [TITLE7] 42 U.S.C. §2000e; [EEOC-PROC] 29 CFR Part 1607 §4D — apply four-fifths rule to preliminary ratings by protected class; any class with a below-standard rate >1.25× the lowest-rate class triggers a pre-calibration flag |
| C2 | Control | ADEA Potential Input Review | [ADEA] 29 U.S.C. §623 — review potential assessments for prohibited language (e.g., "limited runway," "past peak") before packaging for calibration panel |
| C3 | Control | Target Distribution Policy | [WRA-CALIBRATION-NORM] ≤20% of any function's employees rated Exceeds; ≤10% rated Distinguished; functions above these thresholds require manager justification in calibration session |
| O1 | Output | 9-Box Calibration Worksheet | All employees in a single grid: performance axis (1–3), potential axis (1–3), preliminary 9-box coordinate; distribution table by function; outlier flags (>40% Exceeds, adverse impact pre-check); potential language review flags |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] 9-box grid data pull and worksheet generation |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Distribution calculation; four-fifths rule computation; potential language review |

**Definition of Done:** 9-Box Calibration Worksheet contains a preliminary 9-box coordinate for 100% of active employees in the review cycle AND distribution table covers all active functions AND any function with >40% Exceeds is flagged AND four-fifths rule pre-check is documented as PASS or contains specific flagged class categories.

---

#### A13542: Facilitate Cross-Manager Calibration Session

**Agent Definition:** Convene the calibration panel (all function managers + CHO + Principal for Principal-directs); each manager presents ratings above "Meets Standard" for their employees; panel reaches consensus on final 9-box coordinates; no employee may be moved more than 1 grade in either axis without the presenting manager's agreement or documented Principal override.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | 9-Box Calibration Worksheet | Output of A13541; preliminary placements and distribution flags |
| I2 | Input | Critical Role Inventory | From A131 A13151; critical roles flagged for succession priority review during calibration |
| C1 | Control | ADEA Panel Conduct | [ADEA] 29 U.S.C. §623 — calibration session facilitator must pre-brief all panelists on prohibited topics: no discussion of age, retirement plans, or age-cohort comparisons during deliberations |
| C2 | Control | ADA Calibration Neutrality | [ADA] 42 U.S.C. §12112 — facilitator must intervene if any panelist raises a disability status, accommodation request, or medical condition as a calibration input |
| C3 | Control | NLRA Anti-Retaliation | [NLRA] 29 U.S.C. §151 — facilitator must intervene if any panelist references an employee's union organizing activity, complaint about working conditions, or other §7-protected activity as a calibration factor |
| C4 | Control | Panel Override Documentation | [WRA-CALIBRATION-NORM] Any final placement that differs from the presenting manager's submission by >1 grade in either axis must have a documented rationale from the overriding panelist and Principal acknowledgment |
| O1 | Output | Calibration Session Record | Panel attendees, date, all final 9-box placements, list of movements from preliminary to final (with rationale), panel override log, adverse impact spot-check at session close |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Live 9-box visualization and placement editing |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Session facilitation structure; panel override documentation capture |

**Definition of Done:** Calibration Session Record documents final 9-box placements for 100% of reviewed employees AND every movement from preliminary to final has a documented rationale AND all prohibited-topic interventions (age, disability, §7 activity) are logged AND adverse impact spot-check is conducted and documented as PASS or FAIL with flagged categories at session close.

---

#### A13543: Publish Validated 9-Box Grid and Merit Inputs

**Agent Definition:** Finalize all 9-box placements in MECH-PERF, export the validated grid to A131 A13152 (Bench Strength Assessment) as the successor readiness input, compute merit increase eligibility by tier, and export merit eligibility flags to A1331 Compensation Architecture for the merit cycle.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Calibration Session Record | Output of A13542; final validated 9-box placements |
| I2 | Input | Compensation Band Definitions | From A1331; merit increase parameters by performance tier |
| C1 | Control | EEOC Record Retention | [EEOC-PROC] 29 CFR §1602.14 — finalized 9-box records are employment records subject to retention; any adverse action taken post-calibration retains the calibration record for duration of charge plus 3 years |
| C2 | Control | Title VII Final Distribution Check | [TITLE7] 42 U.S.C. §2000e — final distribution must be checked for adverse impact before merit recommendations are generated; any class FAIL result must be routed to Legal A12 A1254 before merit actions are taken |
| C3 | Control | ADEA Merit Eligibility | [ADEA] 29 U.S.C. §621 — merit eligibility criteria must be applied uniformly regardless of age; no adjustment to merit eligibility thresholds that disproportionately affects employees ≥40 |
| O1 | Output | Validated 9-Box Grid (Final) | All employees: final performance score, final potential score, 9-box coordinate, overall rating tier; stored in MECH-PERF; exported to A131 A13152 for bench strength input |
| O2 | Output | Merit Eligibility Report | Per employee: rating tier, merit eligibility flag (eligible/ineligible/at-Principal-discretion), merit increase target % range per band; delivered to A1331 Compensation Architecture for merit cycle |
| O3 | Output | Rating Distribution Final Report | Function-level final distribution; four-fifths adverse impact result (PASS/FAIL per class); stored in MECH-DOC |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Finalization and export |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Adverse impact final computation; merit eligibility calculation |

**Definition of Done:** Validated 9-Box Grid (Final) is stored in MECH-PERF with zero employees in an unresolved placement state AND the grid is exported to A131 A13152 within 5 business days of calibration session AND Merit Eligibility Report is delivered to A1331 AND Rating Distribution Final Report documents a four-fifths check result for each protected class with any FAIL routed to Legal A12 A1254.

**Cross-Function:** [CROSS-FUNCTION: A135 → A131 A13152] 9-box output to Succession Planning (internal A13 tunnel). [CROSS-FUNCTION: A135 → A1331] Merit eligibility to Compensation Architecture (internal A13 tunnel).

---

## A1355: Administer Performance Improvement Plan

**Function:** Design a structured PIP for employees rated below standard, execute a monitored improvement period with defined success criteria, and produce a binary outcome determination.
**Supreme Constraint:** [ADA] accommodation in PIP; [TITLE7] consistent PIP application; [ADEA] age-neutral PIP criteria; [NLRA] PIP cannot be anti-union pretext; [IF-A1-25] PIP template from Legal A12

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Written Performance Review (Below Standard) | Output of A13532; below-standard rating triggering PIP consideration |
| I2 | Input | Corrective Action History | Output of A13522; prior feedback records establishing documented performance gap |
| I3 | Input | PIP Template | [IF-A1-25] from Legal A12 A125; PIP document template reviewed by CLO for NLRA and discrimination risk |
| C1 | Control | ADA PIP Accommodation Check | [ADA] 42 U.S.C. §12112(b)(5) — before finalizing PIP targets, confirm no active accommodation plan is incompatible with the improvement targets; if gap arose from an unaddressed accommodation need, PIP must be preceded by accommodation plan revision |
| C2 | Control | Title VII PIP Consistency | [TITLE7] 42 U.S.C. §2000e — PIP must be used consistently: employees in similar roles with similar performance gaps must be managed with equivalent rigor; selective PIP deployment on protected-class members without equivalent deployment elsewhere creates adverse impact |
| C3 | Control | NLRA Anti-Retaliation | [NLRA] 29 U.S.C. §151; [STERICYCLE] — PIP initiated within 90 days of employee's known protected concerted activity must have documented pre-existing performance evidence predating the activity; CLO review recommended |
| O1 | Output | Performance Improvement Plan | Documented PIP: performance gap (specific behavioral evidence), improvement targets (measurable, time-bound), support resources, check-in cadence, explicit success and failure criteria, employee and manager signatures |
| O2 | Output | PIP Monitoring Record | Per check-in: date, progress against targets, manager observation, employee response; stored in MECH-DOC |
| O3 | Output | PIP Outcome Record | Binary result: PASS (performance meets standard, PIP closed) or FAIL (performance does not meet standard, A1356 initiated); Principal-acknowledged |
| M1 | Mechanism | Document Management | [MECH-DOC] PIP documentation |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] PIP drafting and target-setting support |

**Child Nodes:** A13551, A13552, A13553

---

#### A13551: Design Performance Improvement Plan

**Agent Definition:** Working from the documented performance gap and the Legal-approved PIP template (IF-A1-25), draft a PIP specifying: the current performance gap (with behavioral evidence references), measurable improvement targets achievable in 60–90 days, available support resources, a structured check-in cadence, and explicit binary success and failure criteria; route to CLO review and obtain employee and manager signatures before PIP period begins.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Written Performance Review (Below Standard) | Performance rating and evidence base from A13532 |
| I2 | Input | Real-Time Feedback Records | Prior corrective feedback from A13522; documented history of the performance gap |
| I3 | Input | PIP Template | [IF-A1-25] CLO-approved PIP form; ensures NLRA and discrimination review at template level |
| C1 | Control | ADA Pre-PIP Accommodation Verification | [ADA] 42 U.S.C. §12112(b)(5) — before finalizing improvement targets, verify the employee's active accommodation plan (from A12 A1253) does not make the targets unachievable; if conflict exists, revise accommodation plan first, then set PIP targets |
| C2 | Control | NLRA PIP Timing Documentation | [NLRA] 29 U.S.C. §151 — document the timeline: performance gap first observed (date), feedback delivered (date), PIP initiated (date); timeline must establish that performance issue predates any known §7 activity |
| C3 | Control | Title VII Equivalent Standard | [TITLE7] 42 U.S.C. §2000e — improvement targets must be set at the same standard used for all employees in the role class; PIP targets cannot be set higher for protected-class employees than the Competency Standard Matrix (A13512) defines |
| O1 | Output | Signed Performance Improvement Plan | Completed PIP: performance gap narrative (with dated evidence references), 3–5 specific improvement targets (measurable, time-bound), support resources listed, check-in dates scheduled, success criteria (met when: [specific measurable condition]), failure criteria (failed when: [specific measurable condition]); signed by employee, manager, and CLO-reviewed |
| M1 | Mechanism | Document Management | [MECH-DOC] PIP authoring, version control, signature storage |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] PIP target drafting; evidence integration; prohibited-language check |

**Definition of Done:** Signed Performance Improvement Plan is stored in MECH-DOC with employee, manager, and CLO-review signatures AND success criteria are stated as a specific measurable condition (binary) AND failure criteria are stated as a specific measurable condition (binary) AND the PIP timeline documentation shows performance gap predates any documented §7 activity.

**Cross-Function:** [CROSS-FUNCTION: A135 ↔ A12 A1254] CLO review of PIP before delivery. Interface: IF-A1-25.

---

#### A13552: Execute and Monitor PIP Progress

**Agent Definition:** Conduct structured check-ins at each defined PIP interval; document all check-in notes and manager observations in MECH-DOC; track employee progress against each improvement target with a binary status per target per check-in; no verbal-only feedback during the PIP period — all managerial communication related to the PIP is documented.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Performance Improvement Plan | Output of A13551; improvement targets and check-in schedule |
| I2 | Input | Performance Evidence | Observed work product, output quality, behavioral observations during PIP period; documented in real-time |
| C1 | Control | ADA Accommodation Continuity | [ADA] 42 U.S.C. §12112 — if employee requests a modified accommodation during the PIP period, the interactive process must be initiated; PIP timeline may be paused pending accommodation revision; PIP cannot proceed against a target that requires a capability the accommodation addresses |
| C2 | Control | NLRA Documentation Standard | [NLRA] 29 U.S.C. §151 — all check-in records must be contemporaneous with the observation; retroactive documentation of performance issues during a PIP creates retaliation inference if the employee is engaged in §7 activity |
| C3 | Control | FMLA Leave Adjustment | [FMLA] 29 U.S.C. §2614 — if employee takes FMLA leave during PIP period, the PIP clock pauses for the leave duration; PIP end date extends by the leave length; leave cannot be cited as a failure to meet PIP targets |
| O1 | Output | PIP Monitoring Record | Per check-in: date, target-by-target status (on-track / behind / failed), manager observation (specific behavioral evidence), employee response, any accommodation or leave event; stored in MECH-DOC |
| M1 | Mechanism | Document Management | [MECH-DOC] Check-in record storage |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Check-in scheduling; [MECH-LLM] observation documentation drafting |

**Definition of Done:** PIP Monitoring Record is stored in MECH-DOC for every scheduled check-in (zero missed check-ins without documented exception) AND each record contains a target-by-target status for every improvement target in the PIP AND any FMLA leave taken during the PIP has a documented clock-pause with revised PIP end date AND no record is backdated (document timestamps are contemporaneous with observations).

---

#### A13553: Determine PIP Outcome [Human Gate]

**Agent Definition:** At the PIP conclusion date, manager documents a binary outcome determination (PASS: all improvement targets met as defined in the PIP success criteria; FAIL: one or more failure criteria met as defined in the PIP); route to Principal for acknowledgment; PASS closes the PIP record; FAIL triggers A1356 Performance Exit initiation within 5 business days.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Performance Improvement Plan | Output of A13551; success and failure criteria |
| I2 | Input | PIP Monitoring Records | Output of A13552; cumulative target status at PIP conclusion |
| C1 | Control | Title VII Outcome Consistency | [TITLE7] 42 U.S.C. §2000e — PASS/FAIL determination must be applied strictly against the PIP's stated criteria; outcome cannot be adjusted based on protected-class membership |
| C2 | Control | ADA Accommodation Final Check | [ADA] 42 U.S.C. §12112 — if FAIL determination includes any target that was modified by an accommodation, CLO must review the FAIL determination before exit action proceeds |
| C3 | Control | NLRA Exit Authorization | [NLRA] 29 U.S.C. §151 — Principal sign-off required before exit is initiated for any employee known to be engaged in §7 activity at time of FAIL determination; CLO review of NLRA risk is mandatory |
| O1 | Output | PIP Outcome Record | Binary outcome: PASS or FAIL; outcome rationale citing specific PIP criteria met or unmet; Principal acknowledgment (required for FAIL); stored in MECH-DOC |
| M1 | Mechanism | Document Management | [MECH-DOC] Outcome record |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Principal routing; [MECH-LLM] outcome rationale drafting |

**Definition of Done:** PIP Outcome Record is stored in MECH-DOC with a binary PASS or FAIL designation AND outcome rationale cites specific PIP criteria (not general characterizations) AND FAIL determination has Principal acknowledgment before A1356 is triggered AND if §7 activity is known, CLO review confirmation is documented.

**Cross-Function:** FAIL outcome triggers A1356 Performance Exit. Principal judgment gate.

---

## A1356: Execute Performance Exit

**Function:** Execute compliant separation for employees who fail PIP or are subject to summary exit decisions; complete final pay, COBRA, WARN coordination, and separation agreement; process off-boarding and notify downstream systems.
**Supreme Constraint:** [ADEA] OWBPA waiver; [TITLE7] adverse action non-discrimination; [FCRA] BGC adverse action not applicable (internal); [IF-A1-25] separation agreement template; STATE-FINAL-PAY final paycheck timing

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | PIP Outcome Record (FAIL) or Principal Exit Authorization | Output of A13553 (FAIL) or Principal decision for summary exit (gross misconduct); either triggers A1356 |
| I2 | Input | Compensation and Benefits Data | From A1333 Payroll and A1332 Benefits; accrued PTO, final wages, COBRA election window |
| I3 | Input | Separation Agreement Template | [IF-A1-25] from Legal A12 A122; general release of claims; ADEA OWBPA waiver if employee ≥40 |
| C1 | Control | ADEA OWBPA Waiver Requirements | [ADEA] 29 U.S.C. §626(f) — if employee ≥40: separation agreement must include 21-day consideration period, 7-day revocation right, reference to ADEA claims, explicit written advice to consult an attorney |
| C2 | Control | State Final Paycheck Timing | [STATE-FINAL-PAY] final paycheck must be delivered on the last day of employment (CA, CO, MN, NV) or by next regular payday (NC, most states); accrued PTO treatment varies by state |
| C3 | Control | WARN Act Threshold | [WARN] 29 U.S.C. §2101 — coordinate with A131 A1314: if this exit is part of a larger reduction event that meets WARN threshold, 60-day notice to affected employees, government agencies, and unions must precede separation |
| C4 | Control | Employment Law Separation Templates | [IF-A1-25] separation agreement and COBRA notice use CLO-approved templates |
| O1 | Output | Final Pay Package | Final paycheck (all earned wages + accrued PTO per state law), delivered on state-required timeline |
| O2 | Output | Separation Agreement (if applicable) | Signed general release of claims + ADEA OWBPA waiver if employee ≥40; stored in MECH-ESIGN |
| O3 | Output | Off-Boarding Completion Record | HRIS termination, systems access deactivation, COBRA notice delivered, Authorized Position Register updated to "open" or "frozen" |
| M1 | Mechanism | E-Signature | [MECH-ESIGN] Separation agreement execution |
| M2 | Mechanism | HRIS | [MECH-HRIS] Employee record termination; position status update |
| M3 | Mechanism | LLM / Agent | [MECH-AGENT] Off-boarding checklist execution; downstream notification |

**Child Nodes:** A13561, A13562, A13563

---

#### A13561: Prepare Employee Separation Package

**Agent Definition:** Upon receipt of a FAIL PIP Outcome or Principal exit authorization, compute the final pay package (all earned wages + accrued PTO per state law), draft the COBRA election notice, determine whether the separation triggers the WARN Act threshold in coordination with A131 A1314, and prepare the separation documentation package for CLO review before delivery.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | PIP Outcome Record (FAIL) or Principal Exit Authorization | Trigger document; determines separation type (PIP-FAIL vs. summary) |
| I2 | Input | Final Pay Calculation Data | From A1333: final wages (including hours through separation date), accrued PTO balance per state law, any outstanding expense reimbursements |
| I3 | Input | Current WARN Act Threshold Assessment | From A131 A1314 (internal A13 tunnel); is this exit part of a qualifying mass layoff or plant closing event? |
| C1 | Control | State Final Paycheck Timing | [STATE-FINAL-PAY] final paycheck delivery timeline varies by state and separation type (voluntary vs. involuntary); determine applicable jurisdiction and deliver within required timeline |
| C2 | Control | COBRA Notice Timing | [COBRA] 29 U.S.C. §1163 — qualifying event notice to plan within 30 days; COBRA election notice to participant within 14 days of plan notification; election window 60 days |
| C3 | Control | WARN Act Coordination | [WARN] 29 U.S.C. §2101 — if this exit is part of a larger reduction event meeting WARN threshold, separation cannot be executed without confirming WARN notices have been issued or an exception is documented |
| O1 | Output | Separation Documentation Package | Final pay calculation (itemized), COBRA notice (draft), WARN threshold determination, separation agreement scope (release/no release), CLO review request; stored in MECH-DOC |
| M1 | Mechanism | Document Management | [MECH-DOC] Package assembly |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Final pay computation coordination; COBRA notice drafting; WARN threshold check |

**Definition of Done:** Separation Documentation Package is assembled and routed to CLO for review within 1 business day of PIP FAIL or Principal exit authorization AND final pay calculation itemizes all earned wage components AND COBRA notice draft is included AND WARN threshold determination is documented as triggered or not triggered with supporting headcount math.

**Cross-Function:** [CROSS-FUNCTION: A135 ↔ A131 A1314] WARN Act threshold coordination. [CROSS-FUNCTION: A135 ↔ A12 CLO] Separation package CLO review. Interface: IF-A1-25.

---

#### A13562: Draft and Execute Separation Agreement

**Agent Definition:** Where a general release of claims is appropriate, draft a separation agreement using the CLO-approved template; if employee is ≥40 years old, ensure full ADEA OWBPA compliance (21-day consideration, 7-day revocation, explicit written advice to consult an attorney); deliver for signature via MECH-ESIGN.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Separation Documentation Package | Output of A13561; CLO-reviewed package with separation scope determination |
| I2 | Input | Separation Agreement Template | [IF-A1-25] CLO-approved general release and ADEA OWBPA waiver template |
| C1 | Control | ADEA OWBPA Waiver Validity | [ADEA] 29 U.S.C. §626(f) — for employees ≥40: waiver must be in plain English; must reference ADEA claims specifically; must advise employee in writing to consult an attorney; 21-day consideration period from delivery; 7-day revocation right post-signing; agreement unenforceable if OWBPA requirements are not met |
| C2 | Control | Title VII Non-Coercive Agreement | [TITLE7] 42 U.S.C. §2000e — separation agreement must not condition severance on the employee's agreement not to file an EEOC charge (filing right cannot be waived); employee may waive right to monetary recovery, not the right to file |
| C3 | Control | Employment Law Template Compliance | [IF-A1-25] separation agreement must use CLO-approved template; any deviations require CLO redline approval before delivery |
| O1 | Output | Executed Separation Agreement | Fully countersigned agreement (or documented declination); ADEA OWBPA form if employee ≥40; stored in MECH-ESIGN with delivery timestamp and revocation period end date |
| M1 | Mechanism | E-Signature | [MECH-ESIGN] Agreement delivery and signature collection |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Agreement drafting from template; OWBPA checklist |

**Definition of Done:** Executed Separation Agreement is stored in MECH-ESIGN with delivery timestamp AND if employee is ≥40, the agreement includes: explicit reference to ADEA, written advice to consult attorney, 21-day consideration period from delivery date, and 7-day revocation period noted AND no severance payment is released until the revocation period expires AND agreement does not contain a clause waiving the right to file an EEOC charge.

**Cross-Function:** [CROSS-FUNCTION: A135 ↔ A12 A122] Uses separation agreement template. Interface: IF-A1-25.

---

#### A13563: Complete Off-Boarding and Notify Downstream Systems

**Agent Definition:** Process the employee's final separation in MECH-HRIS (termination record), coordinate with A14 to deactivate all systems access per the role-class off-boarding checklist (IF-A1-07), trigger the final payroll run in A1333 (IF-A1-04), and update the Authorized Position Register to "open" or "frozen" status.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Executed Separation Agreement or Exit Authorization | Output of A13562 or Principal authorization for no-release exit; trigger for off-boarding execution |
| I2 | Input | Role Requirements and Competency Profile | IF-A1-07; systems access entitlements by role class; off-boarding checklist |
| I3 | Input | COBRA Notice Delivery Confirmation | From A13561 package; confirm COBRA notice dispatched on separation date |
| C1 | Control | FLSA Final Pay | [FLSA-MW] 29 U.S.C. §206 — final paycheck must include all hours worked through separation date at no less than minimum wage; no deductions from final pay below minimum wage |
| C2 | Control | State Final Paycheck Timing | [STATE-FINAL-PAY] deliver final paycheck within jurisdiction-required timeline from separation date |
| C3 | Control | HRIS Termination Record | [FLSA-EXEMPT] [IRS-PUB15] HRIS termination record triggers final W-2 generation obligation (by January 31 of following year); record must include actual separation date |
| O1 | Output | HRIS Termination Record | Employee status set to "terminated" with effective date; final pay triggered to A1333 via IF-A1-04; W-2 generation flag set; stored in MECH-HRIS |
| O2 | Output | Systems Access Deactivation Confirmation | Role-class off-boarding checklist: all access points deactivated (email, collaboration tools, role-specific systems, HRIS employee-facing portal), confirmed by A14; stored in MECH-DOC |
| O3 | Output | Position Register Update | Authorized Position Register updated: position status changed from "filled" to "open" (backfill approved) or "frozen" (backfill not approved) in MECH-HRIS |
| M1 | Mechanism | HRIS | [MECH-HRIS] Termination record processing; position register update |
| M2 | Mechanism | LLM / Agent | [MECH-AGENT] Off-boarding checklist orchestration; downstream notification to A14 (IF-A1-07) and A1333 (IF-A1-04) |

**Definition of Done:** HRIS Termination Record is processed on the separation date AND Systems Access Deactivation Confirmation has a checked or exception-documented status for every item in the role-class off-boarding checklist AND final payroll trigger is transmitted to A1333 within the state-required final-pay timeline AND Position Register is updated from "filled" to "open" or "frozen" within 1 business day of separation.

**Cross-Function:** [CROSS-FUNCTION: A135 → A1333] Final payroll trigger. Interface: IF-A1-04. [CROSS-FUNCTION: A135 → A14] Systems access deactivation. Interface: IF-A1-07. [CROSS-FUNCTION: A135 → A1313] HRIS position status update (internal A13 tunnel).

---

## Boundary Arrow Correspondence (A135 → Parent A13)

| A135 Output | Routes To | Notes |
|---|---|---|
| O1: Validated 9-Box Placement Grid | A131 A13152 (Bench Strength Assessment); A1331 (Merit Eligibility) | Internal A13 tunnel; does not cross A13 boundary |
| O2: Performance Review Record | MECH-PERF / MECH-HRIS; A134 Learning & Development | Performance data informs L&D development plan (A134 sprint to define intake) |
| O3: Performance Exit Package | A1333 Payroll via IF-A1-04; A1313 HRIS position status | Crosses A13 boundary via IF-A1-04 for final payroll |
| O4: PIP and Corrective Action Record | Legal A12 A1254 via IF-A1-25 | EEO risk management record; crosses A13 boundary via IF-A1-25 |

*The 9-box grid flow (A135 → A131 A13152) is an internal A13 tunnel. It does not require an IF-A1-XX designation.*

---

## New Codes Added (SPR-022)

### Constraint Codes (additions to Section 4.5 Employment Law)
- `STATE-FINAL-PAY`: State Final Paycheck Timing Laws — timing of final paycheck upon separation varies by state and separation type; involuntary termination requires immediate payment (CA, CO, MN, NV) or next regular payday (NC and most states); accrued PTO treatment varies by state; failure to timely pay may trigger statutory waiting time penalties

### Mechanism Codes
- No new mechanism codes required. All mechanisms (MECH-PERF, MECH-HRIS, MECH-DOC, MECH-ESIGN, MECH-LLM, MECH-AGENT) are pre-registered in the catalog.

---

## Leaf Node Count Verification

| L4 Node | Leaf Nodes |
|---|---|
| A1351: Set Performance Expectations | A13511, A13512, A13513 = 3 |
| A1352: Conduct Continuous Performance Feedback | A13521, A13522, A13523 = 3 |
| A1353: Execute Formal Review Cycle | A13531, A13532, A13533 = 3 |
| A1354: Calibrate 9-Box Talent Grid | A13541, A13542, A13543 = 3 |
| A1355: Administer Performance Improvement Plan | A13551, A13552, A13553 = 3 |
| A1356: Execute Performance Exit | A13561, A13562, A13563 = 3 |
| **Total** | **18** |
