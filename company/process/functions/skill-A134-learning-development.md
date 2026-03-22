# Skill File: Learning & Development

**Node:** A134
**Parent:** A13 People
**Function:** Identify organizational capability gaps, design and deliver learning programs to close those gaps, track completion and compliance, and measure learning effectiveness to inform future investment.
**Supreme Constraint:** [TITLE7] Title VII — equal access to training; [ADA] Americans with Disabilities Act — accessible training delivery; [ADEA] Age Discrimination in Employment Act — age-neutral development access; [NLRA] National Labor Relations Act — training content cannot chill §7 rights; [IF-A1-26] Legal A12 Employment Document Templates and Policy Mandates
**Cross-Function Interfaces:** IF-A1-04, IF-A1-26, IF-A1-27
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:**
- [ ] Compa-ratio analysis and salary band calibration — *Not A134 primary owner. L&D budget does not touch salary bands. Satisfied at A131 A13123. No gap created.*
- [ ] RIF legal compliance checklist — *Not A134 primary owner. RIF execution is at A1314 (A131). A134 may support reskilling to reduce RIF exposure; does not execute RIF. Satisfied upstream.*
- [x] 9-box talent grid calibration — CLOSED at A1354 (A135 SPR-022). A134 consumes 9-box output via Internal A13 Tunnel (A135 → A134) to construct IDPs at A13413. Not primary owner; design dependency documented.
- [x] HRIS data model design — A13451 [MECH-HRIS] [MECH-LMS]; learning completion data synced to HRIS competency profile; competency profile schema defined at A13131 (A131); A134 extends it with completion records.
- [ ] Organizational network analysis — *Primary owner: A131 A1316. L&D delivery channel targeting may be informed by ONA broker data (A13162) as a program-design input. Not a primary obligation. Satisfied upstream.*
- [ ] Succession depth charting — *Primary owner: A131 A1315. A13413 (IDP for high-potential employees) feeds successor readiness grades to A1315. Design dependency; not primary owner. Satisfied upstream.*

---

## A134: Learning & Development

**Function:** Identify organizational capability gaps, design and deliver learning programs to close those gaps, track completion and compliance, and measure learning effectiveness to inform future investment.
**Supreme Constraint:** [TITLE7] equal access to training opportunities; [ADA] accessible training delivery; [ADEA] age-neutral development access; [NLRA] training content cannot chill §7 rights

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Workforce Capacity Gap Register | From A131 A1312; deficit functions and role gaps inform capability needs |
| I2 | Input | Performance Review Development Needs | From A135 (Internal A13 Tunnel); performance review cycle outputs development targets and IDP triggers |
| I3 | Input | 9-Box Calibration Results | From A135 A1354 (Internal A13 Tunnel); high-potential employees for accelerated development; low-performers for remedial programs |
| I4 | Input | Succession Bench Readiness Grades | From A131 A1315 (Internal A13 Tunnel); successor readiness gaps drive targeted development priorities |
| I5 | Input | Legal Compliance Training Mandates | From Legal A12 via IF-A1-26; mandatory compliance training topics and completion deadlines by jurisdiction |
| C1 | Control | Title VII Equal Access | [TITLE7] 42 U.S.C. §2000e — training opportunities cannot exclude or disadvantage any protected class |
| C2 | Control | ADA Accessible Training | [ADA] 42 U.S.C. §12101 — training formats must accommodate known disabilities (captioning, extended time, accessible LMS) |
| C3 | Control | ADEA Age-Neutral Development | [ADEA] 29 U.S.C. §621 — development program access cannot exclude or penalize employees ≥40 based on career horizon assumptions |
| C4 | Control | NLRA Training Content Review | [NLRA] 29 U.S.C. §151; [STERICYCLE] 372 NLRB No. 113 (2023) — all training and handbook content must pass Stericycle categorical analysis before deployment |
| C5 | Control | Employment Law Mandates | [IF-A1-26] compliance training content must reflect current Legal A12 employment document templates and policy mandates |
| O1 | Output | Updated Competency Profiles | Per-employee learning completion records in MECH-HRIS and MECH-LMS; → IF-A1-04 (People & Roles Package) |
| O2 | Output | L&D Effectiveness Report | Kirkpatrick L1–L4 results by program; ROI per investment; annual report to Principal |
| O3 | Output | Compliance Training Completion Report | Per-employee and per-function completion evidence for mandatory training; → Legal A12 via IF-A1-27 |
| M1 | Mechanism | LMS | [MECH-LMS] Cornerstone OnDemand, Docebo, TalentLMS |
| M2 | Mechanism | HRIS | [MECH-HRIS] Competency profile storage |
| M3 | Mechanism | Performance Management Platform | [MECH-PERF] IDP integration; 9-box data source |
| M4 | Mechanism | LLM / Agent | [MECH-LLM] [MECH-AGENT] AI-assisted content authoring and effectiveness analysis |

**Child Nodes:** A1341, A1342, A1343, A1344, A1345, A1346

*[Internal A13 Tunnel: A135 → A134. Performance review development needs and 9-box calibration results flow from A135 into A134 as inputs for IDP construction and remedial program targeting. No IF-A1-XX required.]*

*[Internal A13 Tunnel: A131 → A134. Succession bench readiness grades and critical role competency profiles flow from A1315 and A1312 into A134 to prioritize high-potential development programs. No IF-A1-XX required.]*

*[Internal A13 Tunnel: A134 → A135. Updated competency profiles and IDP milestone completion records flow from A134 into A135 A13511 (goal-setting) to reflect development progress in the next performance cycle. No IF-A1-XX required.]*

---

## A1341: Identify Organizational Capability Gaps

**Function:** Map current workforce competency levels against required competencies per function, prioritize gaps by business impact, and translate high-potential succession data into Individual Development Plans.
**Supreme Constraint:** [TITLE7] equal access analysis in gap assessment; [ADA] accommodation-aware competency profiling; [ADEA] age-neutral gap identification

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Workforce Capacity Gap Register | From A131 A1312; role deficits by function and competency class |
| I2 | Input | Role Competency Requirements | From A131 Workforce Architecture Plan (A1311); required competency levels by role class |
| I3 | Input | 9-Box Calibration Results | From A135 (Internal A13 Tunnel); performance × potential placement for all employees |
| I4 | Input | Succession Bench Readiness Grades | From A131 A13152 (Internal A13 Tunnel); per-critical-role readiness gap |
| C1 | Control | Title VII Equal Access | [TITLE7] 42 U.S.C. §2000e — competency assessment methodology must not systematically disadvantage protected classes |
| C2 | Control | ADA Accommodation-Aware Assessment | [ADA] 42 U.S.C. §12101 — known disabilities must be considered before labeling a competency gap as a performance issue |
| C3 | Control | ADEA Age-Neutral Assessment | [ADEA] 29 U.S.C. §621 — gap scoring cannot assume lower development potential based on employee age |
| C4 | Control | SMART Goals Framework | [SMART-GOALS] IDP objectives must be Specific, Measurable, Achievable, Relevant, Time-bound |
| O1 | Output | Capability Gap Register | Per-function: required competency vs. current rating; gap score; prioritization tier |
| O2 | Output | Prioritized Learning Needs Register | Business-impact-weighted ranking of capability gaps; top-tier gaps drive curriculum design |
| O3 | Output | Individual Development Plans (High-Potential) | Per high-potential employee: named competency targets, SMART-GOALS objectives, milestones, timeline |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Competency ratings; 9-box data |
| M2 | Mechanism | HRIS | [MECH-HRIS] Current competency profiles |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Gap scoring and IDP drafting |

**Child Nodes:** A13411, A13412, A13413

---

#### A13411: Assess Current Workforce Competency Inventory

**Agent Definition:** Extract current competency ratings for all active employees from MECH-HRIS and MECH-PERF, map each employee's profile against the role's required competency standard from the Workforce Architecture Plan, and produce a Competency Gap Inventory showing gap scores (required level − current level) by employee, role class, and function.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Employee Competency Profiles | MECH-HRIS competency fields per A13131 schema; current rated levels by competency domain |
| I2 | Input | Role Competency Requirements | Output of A1311 Workforce Architecture Plan; required competency levels per role class and function |
| C1 | Control | Title VII Equal Access | [TITLE7] 42 U.S.C. §2000e — competency assessment must not use criteria that are surrogates for protected class membership |
| C2 | Control | ADA Accommodation Flag | [ADA] 42 U.S.C. §12101 — employees with active accommodation flags must have competency gaps assessed in context of accommodation; gap score cannot penalize accommodation-related performance variation |
| O1 | Output | Competency Gap Inventory | Per-employee: role class, required level per domain (1–5), current level per domain (1–5), gap score (delta), accommodation flag; aggregate by function: average gap per domain, % of employees below required level |
| M1 | Mechanism | HRIS | [MECH-HRIS] Competency profile data extract |
| M2 | Mechanism | Performance Management Platform | [MECH-PERF] Competency ratings from last review cycle |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Gap score computation and summary generation |

**Definition of Done:** Competency Gap Inventory contains an entry for 100% of active employees AND every entry has a gap score for each required competency domain (gap = required − current; 0 = on target; negative = exceeds; positive = gap exists) AND inventory is versioned in MECH-DOC with assessment date.

---

#### A13412: Prioritize Learning Needs Against Business Objectives

**Agent Definition:** Rank all competency gaps in the Competency Gap Inventory by a composite business impact score (gap magnitude × function criticality weight × headcount affected), filter to the top-tier gaps whose closure is necessary for the current operating plan, and produce the Prioritized Learning Needs Register.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Competency Gap Inventory | Output of A13411; per-function competency gap scores |
| I2 | Input | Business Strategy and Growth Plan | Annual operating plan; which functions and capabilities are highest-priority for the coming period |
| I3 | Input | Workforce Capacity Gap Register | Output of A131 A13122; function-level deficits that intersect with competency gaps |
| C1 | Control | ADEA Age-Neutral Prioritization | [ADEA] 29 U.S.C. §621 — priority scoring cannot use employee tenure or age as a negative weighting factor |
| C2 | Control | SMART Goals Framework | [SMART-GOALS] each priority gap must be translatable into a SMART-formatted learning objective |
| O1 | Output | Prioritized Learning Needs Register | Gap ID; competency domain; affected function; gap score; headcount affected; business impact score (composite); priority tier (High/Medium/Low); proposed learning program name |
| M1 | Mechanism | FP&A | [MECH-FPA] Business impact weighting aligned to operating plan KPIs |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Priority scoring model and ranking |

**Definition of Done:** Prioritized Learning Needs Register contains a business impact score for every gap in the Competency Gap Inventory AND top-tier (High priority) gaps represent the functions with the highest combined impact score in the current operating plan AND register is signed off by CHO-equivalent before curriculum design begins.

---

#### A13413: Produce Individual Development Plans for High-Potential Employees

**Agent Definition:** For each employee placed in the high-potential quadrant of the 9-box calibration (performance ≥2 AND potential = 3), draft an Individual Development Plan specifying three to five SMART-formatted development objectives aligned to their next-role competency requirements per the Bench Strength Register, with named milestones and a 12-month timeline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | 9-Box Calibration Results | From A135 A1354 (Internal A13 Tunnel); employees with performance ≥2 AND potential = 3 (high-potential quadrant) |
| I2 | Input | Bench Strength Register | From A131 A13152 (Internal A13 Tunnel); per-employee next-role competency requirements and readiness grade |
| I3 | Input | Role Competency Requirements | From A1311; target role competency levels |
| C1 | Control | SMART Goals Framework | [SMART-GOALS] each IDP objective must satisfy all five SMART criteria; Doran (1981) |
| C2 | Control | Title VII Equal Access | [TITLE7] 42 U.S.C. §2000e — IDP pool selection (high-potential quadrant) must not systematically exclude any protected class |
| C3 | Control | ADEA Age-Neutral Development | [ADEA] 29 U.S.C. §621 — IDP objectives cannot assume shorter career horizon based on employee age |
| O1 | Output | Individual Development Plans (IDP) | Per high-potential employee: current role, target role, 3–5 SMART-formatted objectives, required competency delta, milestone checkpoints (quarterly), 12-month timeline, manager co-signature |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] IDP module; goal tracking |
| M2 | Mechanism | HRIS | [MECH-HRIS] Employee profile and next-role data |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] IDP objective drafting and competency gap alignment |

**Definition of Done:** IDP is produced for 100% of employees in the high-potential quadrant (performance ≥2 AND potential = 3) from the most recent 9-box calibration AND each IDP contains at least 3 SMART-formatted objectives with named milestones AND each IDP has a manager co-signature in MECH-PERF before being communicated to the employee.

---

## A1342: Design Learning Curriculum

**Function:** Translate the Prioritized Learning Needs Register into a structured curriculum by selecting learning modalities per competency gap, sequencing courses by role and development path, and obtaining Principal approval before deployment.
**Supreme Constraint:** [ADA] accessible modality selection; [TITLE7] equitable curriculum access; [NLRA] content pre-review

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Prioritized Learning Needs Register | From A13412; ranked gaps with proposed program names |
| I2 | Input | IDPs (High-Potential) | From A13413; competency targets requiring specific program designs |
| I3 | Input | L&D Budget Authorization | From Finance A11; approved spend ceiling for learning programs by function |
| C1 | Control | ADA Accessible Learning | [ADA] 42 U.S.C. §12101 — all modalities must include accessible alternatives (captions, screen-reader-compatible LMS, extended-time options) |
| C2 | Control | NLRA Content Review | [NLRA] [STERICYCLE] curriculum content review required; no program content may chill §7 rights |
| C3 | Control | ADEA Age-Neutral Curriculum | [ADEA] 29 U.S.C. §621 — curriculum sequencing and eligibility criteria cannot exclude based on age |
| O1 | Output | Curriculum Design Document | Program catalog: program name, target competency, modality, duration, eligibility, prerequisite, estimated cost |
| O2 | Output | Role-Specific Learning Path Map | Per role class: sequenced curriculum ordered by prerequisite dependencies and readiness level |
| O3 | Output | Approved Curriculum (Principal Sign-off) | Binary approval from Principal via A13423 before any content development or procurement begins |
| M1 | Mechanism | LMS | [MECH-LMS] Curriculum structure and path configuration |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Modality selection and curriculum design |

**Child Nodes:** A13421, A13422, A13423

---

#### A13421: Map Competency Targets to Learning Modalities

**Agent Definition:** For each priority gap in the Prioritized Learning Needs Register, apply the modality selection criteria (gap type × urgency × headcount × available budget) to assign one primary delivery modality (e-learning, instructor-led training, on-the-job training, coaching/mentoring, peer cohort, or blended) and document the selection rationale.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Prioritized Learning Needs Register | Output of A13412; gap ID, competency domain, priority tier, headcount affected |
| I2 | Input | L&D Budget Authorization | Finance A11 approved L&D spend envelope; per-FTE and per-program cost ceiling |
| C1 | Control | ADA Accessible Modality | [ADA] 42 U.S.C. §12101 — selected modality must have an accessible delivery alternative; e-learning must be WCAG 2.1 AA compliant or equivalent |
| C2 | Control | ADEA Age-Neutral Modality | [ADEA] 29 U.S.C. §621 — modality selection cannot default to age-based delivery assumptions about any employee cohort |
| O1 | Output | Modality Selection Table | Per gap: gap ID, competency domain, selected modality, accessible alternative, cost estimate per participant, selection rationale (max 100 words) |
| M1 | Mechanism | LMS | [MECH-LMS] Modality capability inventory (what the LMS supports) |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Modality-matching and cost modeling |

**Definition of Done:** Modality Selection Table contains a selected modality and accessible alternative for 100% of gaps in the Prioritized Learning Needs Register AND every e-learning selection cites WCAG 2.1 AA compliance requirement AND cost estimate per participant is provided for every program.

---

#### A13422: Sequence Curriculum by Role and Development Path

**Agent Definition:** For each role class, build a sequenced learning path that orders programs by prerequisite dependency (foundational before advanced), readiness level (onboarding before advanced practitioner), and IDP milestone alignment, and encode it as a role-specific learning path in MECH-LMS.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Modality Selection Table | Output of A13421; programs with modalities and cost estimates |
| I2 | Input | IDPs (High-Potential) | Output of A13413; IDP objectives requiring specific program placement |
| I3 | Input | Role Competency Requirements | From A1311; foundational-to-advanced competency level definitions per role class |
| C1 | Control | Title VII Equitable Access | [TITLE7] 42 U.S.C. §2000e — learning path eligibility criteria for each role class cannot systematically exclude protected class members |
| C2 | Control | SMART Goals Alignment | [SMART-GOALS] each learning path milestone must map to a SMART-formatted IDP objective or operating plan KPI |
| O1 | Output | Role-Specific Learning Path Map | Per role class: ordered program list with prerequisites, estimated completion time per program, and IDP milestone linkage |
| M1 | Mechanism | LMS | [MECH-LMS] Learning path configuration module |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Sequencing logic and prerequisite mapping |

**Definition of Done:** Role-Specific Learning Path Map exists for every active role class in the Authorized Position Register AND every learning path has a defined entry point (no prerequisites for foundational programs) AND every IDP objective in A13413 maps to at least one program in the learning path for the employee's role class.

---

#### A13423: Approve and Publish Curriculum Design [Human Gate]

**Agent Definition:** Compile the Curriculum Design Document, Modality Selection Table, Role-Specific Learning Path Maps, and total budget estimate into a structured approval package and route to Principal for approval, halting all content development and procurement until binary approve/reject is received.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Curriculum Design Document | Programs, modalities, cost estimates aggregated from A13421 and A13422 |
| I2 | Input | Role-Specific Learning Path Maps | Output of A13422; full sequenced curriculum |
| I3 | Input | L&D Budget Estimate | Total estimated spend vs. Finance-approved L&D budget envelope |
| C1 | Control | NLRA Content Pre-Review | [NLRA] 29 U.S.C. §151; [STERICYCLE] 372 NLRB No. 113 (2023) — CHO-equivalent must confirm no proposed program content would chill §7 rights before presenting for Principal approval |
| C2 | Control | ADA Accessibility Confirmation | [ADA] 42 U.S.C. §12101 — accessible delivery alternatives confirmed for all programs before approval |
| O1 | Output | Signed Curriculum Approval | Principal binary approve/reject with documented rationale; effective date |
| M1 | Mechanism | Document Management | [MECH-DOC] Approval package and authorization record |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Approval summary and budget presentation |

**Definition of Done:** Principal returns signed approval or rejection with documented rationale within 48-hour SLA AND authorization record is stored in MECH-DOC with effective date AND no content development or procurement begins before approval is recorded.

**Cross-Function:** Principal judgment gate — no downstream content development executes without this output.

---

## A1343: Develop Learning Content

**Function:** Author or procure all learning materials, configure course structures in the LMS, and validate content for accuracy, accessibility, and legal compliance before publication.
**Supreme Constraint:** [ADA] WCAG 2.1 AA accessible content standards; [NLRA] content must pass Stericycle review; [TITLE7] no discriminatory or exclusionary content

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Signed Curriculum Approval | Output of A13423; approved programs and modalities |
| I2 | Input | Legal Compliance Training Mandates | Via IF-A1-26; required topic coverage and jurisdiction-specific content requirements |
| I3 | Input | Subject Matter Expert Input | Domain agents or external SMEs for technical content accuracy |
| C1 | Control | ADA Accessible Content | [ADA] 42 U.S.C. §12101 — e-learning content must meet WCAG 2.1 AA; video must include captions; materials must be screen-reader compatible |
| C2 | Control | NLRA Content Review | [NLRA] [STERICYCLE] all training content reviewed against Stericycle categorical standard before deployment |
| C3 | Control | Title VII Non-Discriminatory Content | [TITLE7] 42 U.S.C. §2000e — content cannot use biased examples or scenarios that disadvantage protected classes |
| O1 | Output | Published Course Library | Versioned courseware, assessments, facilitator guides, and SCORM/xAPI packages in MECH-LMS |
| O2 | Output | Content Validation Record | Per-course: accessibility check result, NLRA review result, accuracy sign-off, version number, publish date |
| M1 | Mechanism | LMS | [MECH-LMS] Course authoring and hosting |
| M2 | Mechanism | Document Management | [MECH-DOC] Content version control |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Content drafting and gap analysis |

**Child Nodes:** A13431, A13432, A13433

---

#### A13431: Author or Procure Learning Materials

**Agent Definition:** For each approved program, either author original learning materials (script, slides, assessment questions, facilitator guide) or procure licensed third-party content, and deliver all materials as version-controlled assets to the LMS content library before course configuration begins.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Signed Curriculum Approval | Output of A13423; approved programs with modality, scope, and budget ceiling per program |
| I2 | Input | Legal Compliance Training Mandates | Via IF-A1-26; mandatory coverage topics and jurisdiction-specific legal requirements for compliance training |
| C1 | Control | ADA Accessible Content Standards | [ADA] 42 U.S.C. §12101 — authored content must include transcripts for audio, captions for video, alt-text for images; procured content must have accessibility compliance certification from vendor |
| C2 | Control | Title VII Non-Discriminatory Content | [TITLE7] 42 U.S.C. §2000e — all scenario examples and case studies must be reviewed for protected-class bias before delivery |
| O1 | Output | Learning Content Package | Per program: script or facilitator guide, slides or SCORM/xAPI package, pre/post assessment questions (≥5 per program), job aid; version number; accessibility compliance note |
| M1 | Mechanism | LMS | [MECH-LMS] Content library |
| M2 | Mechanism | Document Management | [MECH-DOC] Version control |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Content authoring, script drafting, assessment generation |

**Definition of Done:** Learning Content Package is uploaded to MECH-LMS content library for 100% of approved programs AND every package has a version number AND every video/audio asset has a transcript or caption file AND pre/post assessment has at least 5 questions before any course is made available to learners.

---

#### A13432: Configure LMS Course Structure and Assignments

**Agent Definition:** For each approved program, configure the MECH-LMS course shell with completion criteria, assignment rules, assessment passing threshold, and assignment to the target employee population per the Role-Specific Learning Path Map.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Learning Content Package | Output of A13431; uploaded SCORM/xAPI packages or facilitator-led event configuration |
| I2 | Input | Role-Specific Learning Path Map | Output of A13422; target audience per program, prerequisite rules, completion order |
| C1 | Control | ADA Accessible LMS Configuration | [ADA] 42 U.S.C. §12101 — course must include extended-time accommodation option in assessment settings; accommodation bypass for learners with active flags in MECH-HRIS |
| C2 | Control | Mandatory Training Deadlines | [STATE-HARASSMENT-TRAINING] state-mandated compliance training must have completion deadlines configured per jurisdiction (CA: within 6 months of hire + every 2 years; NY: by calendar year end) |
| O1 | Output | Configured Course Catalog | MECH-LMS: course shells with defined audience, prerequisites, completion criteria, passing threshold (≥80% on post-assessment), assignment rule, and completion deadline |
| M1 | Mechanism | LMS | [MECH-LMS] Course management and assignment module |

**Definition of Done:** All approved programs have configured course shells in MECH-LMS with: (1) audience assignment rules matching the Role-Specific Learning Path Map, (2) completion criteria set (minimum: post-assessment pass at ≥80%), (3) extended-time accommodation option enabled, AND mandatory compliance training courses have jurisdiction-specific deadlines configured with zero compliance training courses missing a deadline.

---

#### A13433: Validate Content Accuracy and Compliance Before Publication

**Agent Definition:** For each course pending publication, execute the three-gate validation check — (1) subject matter accuracy sign-off by the relevant domain agent, (2) NLRA Stericycle categorical review of all policy-adjacent content, (3) ADA accessibility audit — and block publication until all three gates pass with documented results.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Learning Content Package | Output of A13431; all materials for the course |
| I2 | Input | NLRA Content Review Guidelines | [STERICYCLE] 372 NLRB No. 113 (2023) — categorical standard: would the content, viewed from the perspective of an employee wishing to engage in protected activity, reasonably tend to chill §7 rights? |
| I3 | Input | Employment Law Mandates | Via IF-A1-26; current compliance training topic requirements |
| C1 | Control | NLRA Stericycle Standard | [NLRA] 29 U.S.C. §151; [STERICYCLE] — any content that could be read to restrict or chill §7 rights must be revised before publication |
| C2 | Control | ADA Content Accessibility | [ADA] 42 U.S.C. §12101 — WCAG 2.1 AA compliance for all digital content |
| C3 | Control | Title VII Non-Discrimination | [TITLE7] 42 U.S.C. §2000e — bias review gate: no scenario or example uses protected class as a negative proxy |
| O1 | Output | Content Validation Record | Per course: accuracy gate (PASS/FAIL + sign-off agent), NLRA gate (PASS/FAIL + findings), ADA gate (PASS/FAIL + accessibility checklist), publication status (APPROVED/HOLD), validation date |
| M1 | Mechanism | LLM / Agent | [MECH-LLM] NLRA analysis and bias review |
| M2 | Mechanism | Document Management | [MECH-DOC] Validation record storage |

**Definition of Done:** Content Validation Record exists for 100% of courses pending publication AND every record shows all three gates (accuracy, NLRA, ADA) as PASS before publication status is set to APPROVED AND any FAIL result has a documented resolution action before the course is published.

---

## A1344: Deliver Learning Programs

**Function:** Execute all scheduled learning delivery activities — instructor-led events, self-paced LMS assignments, and mentoring/coaching pairings — and record attendance and completion in MECH-LMS.
**Supreme Constraint:** [ADA] accommodation during delivery; [TITLE7] equitable delivery access; [ADEA] age-neutral facilitator behavior; [FMLA] leave-protected absence handling

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Configured Course Catalog | From A13432; course shells with assigned audiences and schedules |
| I2 | Input | IDPs (High-Potential) | From A13413; development timelines that drive program scheduling priority |
| I3 | Input | Accommodation Flags | From MECH-HRIS (A13131 schema); employees with active ADA accommodations requiring modified delivery |
| C1 | Control | ADA Delivery Accommodation | [ADA] 42 U.S.C. §12101 — real-time delivery accommodation (interpreting, captioning, extended time) must be available for any employee with an active accommodation flag |
| C2 | Control | FMLA Protected Leave | [FMLA] 29 U.S.C. §2601 — employees on FMLA leave cannot be penalized for missing mandatory training during leave period; completion deadline reset required |
| C3 | Control | ADEA Equal Facilitation | [ADEA] 29 U.S.C. §621 — facilitation must avoid age-based assumptions about learning pace or technology comfort |
| O1 | Output | Training Attendance Records | Per ILT event: session date, roster, sign-in records, facilitator name; stored in MECH-LMS |
| O2 | Output | LMS Completion Records | Per employee per course: completion status, score, completion date; in MECH-LMS |
| O3 | Output | Mentoring Match Registry | Per mentoring pair: mentor name, mentee name, development focus, match date, milestone schedule |
| M1 | Mechanism | LMS | [MECH-LMS] Delivery, completion tracking, event scheduling |
| M2 | Mechanism | Video Conferencing | [MECH-VIDEO] Virtual ILT delivery |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Mentoring match optimization |

**Child Nodes:** A13441, A13442, A13443

---

#### A13441: Execute Scheduled Instructor-Led Training Events

**Agent Definition:** Schedule, roster, and execute all instructor-led training (ILT) events per the program calendar, record attendance for every participant in MECH-LMS at session close, and issue completion credits to attendees who meet the completion criteria (≥80% session attendance or post-test pass).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Configured ILT Course Shells | MECH-LMS event records with session date, duration, capacity, enrolled roster, facilitator assignment |
| I2 | Input | Accommodation Requests | Active ADA accommodation flags from MECH-HRIS; specific accommodation type required for scheduled attendees |
| C1 | Control | ADA Real-Time Accommodation | [ADA] 42 U.S.C. §12101 — live interpreting, captioning, or assistive technology must be confirmed available ≥48 hours before session for all attendees with active accommodation flags |
| C2 | Control | FMLA Absence Handling | [FMLA] 29 U.S.C. §2601 — FMLA-leave absences are automatically excused; completion deadline for mandatory training is reset to 30 days after FMLA return-to-work date |
| O1 | Output | Training Attendance Records | MECH-LMS event record: session ID, date, facilitator, attendees (signed in), absentees (excused/unexcused), completion credit issued (Y/N) per attendee |
| M1 | Mechanism | LMS | [MECH-LMS] Event scheduling and attendance tracking |
| M2 | Mechanism | Video Conferencing | [MECH-VIDEO] Zoom API, Google Meet — virtual ILT delivery with participant tracking |

**Definition of Done:** Training Attendance Record is updated in MECH-LMS within 24 hours of session close for 100% of scheduled ILT events AND completion credits are issued only to attendees meeting completion criteria AND no attendee with an active ADA accommodation flag has an unresolved accommodation need in the 48-hour pre-session window.

---

#### A13442: Assign and Monitor LMS Self-Paced Learning

**Agent Definition:** Push all course assignments to target employee learning plans in MECH-LMS per the Role-Specific Learning Path Map and assignment rules, monitor progress against completion deadlines, and generate a weekly overdue-assignment alert report for managers covering all learners past due by >7 days.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Configured Course Catalog | Output of A13432; assignment rules and completion deadlines per course and audience |
| I2 | Input | Active Employee Roster | From A13132; filled positions for assignment targeting |
| C1 | Control | ADA Accommodation Deadline Extension | [ADA] 42 U.S.C. §12101 — employees with active extended-time accommodations receive 50% completion deadline extension automatically for assessed self-paced courses |
| C2 | Control | Mandatory Training Deadlines | [STATE-HARASSMENT-TRAINING] jurisdiction-specific deadlines govern mandatory compliance courses; no discretionary extension applies |
| O1 | Output | Employee Learning Plans | MECH-LMS: per-employee assigned course list, completion status, deadline, last-accessed date |
| O2 | Output | Weekly Overdue Assignment Report | Employees with course completions past due by >7 days; manager name; escalation flag if >30 days overdue |
| M1 | Mechanism | LMS | [MECH-LMS] Assignment and progress tracking |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Report generation |

**Definition of Done:** Employee Learning Plans in MECH-LMS contain assignments for 100% of active employees with at least one curriculum program applicable to their role class AND the Weekly Overdue Assignment Report is generated every Monday covering all employees past due by >7 days AND mandatory compliance training assignments have jurisdiction-specific deadlines configured with no NULL deadline fields.

---

#### A13443: Match and Track Mentoring and Coaching Pairs

**Agent Definition:** For each mentoring pair approved in the Curriculum Design, execute the pairing process using 9-box succession bench data to match mentor capability to mentee development need, schedule the initial meeting, track milestone check-ins at 30/60/90 days, and record program completion when all milestones are met.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | IDPs (High-Potential) | Output of A13413; mentee names, development competency targets, and timeline |
| I2 | Input | Bench Strength Register | From A131 A13152 (Internal A13 Tunnel); mentor candidates whose competency strengths match mentee development needs |
| C1 | Control | Title VII Equitable Mentoring | [TITLE7] 42 U.S.C. §2000e — mentor pool selection process cannot systematically exclude candidates from protected classes from serving as mentors |
| C2 | Control | ADEA Age-Neutral Pairing | [ADEA] 29 U.S.C. §621 — pairing algorithm cannot assume that employees ≥40 are less suitable as mentors based on age |
| C3 | Control | NLRA Confidentiality | [NLRA] 29 U.S.C. §151 — mentoring conversations are not monitored for §7 activity; program documentation covers professional development topics only |
| O1 | Output | Mentoring Match Registry | Per pair: mentor name and role, mentee name and role, development competency focus, match date, milestone schedule (30/60/90 day check-in dates) |
| O2 | Output | Mentoring Completion Records | Per pair: milestone check-in notes (professional development focus only), final completion status, competency progress self-assessment by mentee |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] IDP module — mentoring milestone tracking |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Pairing algorithm (competency match + availability) |

**Definition of Done:** Mentoring Match Registry contains an entry for 100% of high-potential employees with mentoring assigned in their IDP AND every entry has a confirmed initial meeting date AND 90-day milestone check-in records exist for every pair active ≥90 days with a completion status (completed / extended / cancelled with reason).

---

## A1345: Track Learning Completion and Compliance

**Function:** Maintain complete and accurate learning completion records in MECH-LMS and MECH-HRIS, produce mandatory compliance training completion reports on schedule, and escalate overdue completions before regulatory deadlines are breached.
**Supreme Constraint:** [STATE-HARASSMENT-TRAINING] mandatory training completion deadlines; [ADA] accommodation-adjusted completion tracking; [FMLA] leave exclusions; output to Legal A12 via IF-A1-27

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | LMS Completion Records | From A13441 and A13442; individual completion data |
| I2 | Input | Mentoring Completion Records | From A13443; structured development activity completions |
| I3 | Input | Mandatory Training Calendar | Compliance training deadlines from IF-A1-26; jurisdiction-specific due dates |
| C1 | Control | State Mandatory Training Requirements | [STATE-HARASSMENT-TRAINING] CA Gov. Code §12950.1; NY Lab. Law §201-g; IL 775 ILCS 5 — deadlines and topic coverage requirements by jurisdiction |
| C2 | Control | ADA Accommodation Tracking | [ADA] 42 U.S.C. §12101 — accommodation-extended deadlines must be reflected in completion status; accommodation-extended completion ≠ overdue |
| C3 | Control | FMLA Leave Exclusion | [FMLA] 29 U.S.C. §2601 — employees on active FMLA leave are excluded from overdue escalation; deadlines reset upon return |
| O1 | Output | Updated Competency Profiles | MECH-HRIS competency profile updated with every verified completion; feeds IF-A1-04 |
| O2 | Output | Compliance Training Completion Report | Per-employee and per-function: course name, completion date, score, jurisdiction-specific deadline compliance (MET/MISSED/PENDING) |
| O3 | Output | Overdue Training Escalation Log | Employees past jurisdiction deadline; manager and Principal notification record |
| M1 | Mechanism | LMS | [MECH-LMS] Completion data source |
| M2 | Mechanism | HRIS | [MECH-HRIS] Competency profile update target |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Report generation and escalation logic |

**Child Nodes:** A13451, A13452, A13453

---

#### A13451: Record All Learning Completions in HRIS/LMS

**Agent Definition:** For every learning event completed (ILT attendance, self-paced course pass, mentoring milestone, external certification), write the completion record to MECH-LMS and sync the relevant competency domain rating update to the employee's MECH-HRIS competency profile within 2 business days of completion.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | LMS Completion Records | MECH-LMS completion events: employee ID, course ID, completion date, score (if assessed), pass/fail |
| I2 | Input | Mentoring Completion Records | From A13443; milestone completion records for mentoring and coaching |
| I3 | Input | External Certification Records | Employee-submitted external certifications; verified by document review before HRIS update |
| C1 | Control | HRIS Data Integrity | [FLSA-EXEMPT] HRIS competency field updates must not alter FLSA classification status — competency update is a separate field, not an exemption status field |
| C2 | Control | ADA Accommodation Accuracy | [ADA] 42 U.S.C. §12101 — accommodation-extended completions are marked COMPLETE (not late) when the accommodation deadline is met |
| O1 | Output | Updated Employee Competency Profiles | MECH-HRIS: per employee, per competency domain — prior level, new level, completion source (course ID or certification name), update date |
| O2 | Output | LMS Transcript | MECH-LMS: complete learning history per employee — all completions, scores, dates, course titles |
| M1 | Mechanism | HRIS | [MECH-HRIS] Competency profile write |
| M2 | Mechanism | LMS | [MECH-LMS] Completion record store |

**Definition of Done:** Updated Employee Competency Profile is written to MECH-HRIS within 2 business days of every verified completion AND MECH-LMS transcript is complete (no missing course records) for 100% of active employees AND zero active employees have a competency level update in MECH-HRIS without a supporting completion source citation.

---

#### A13452: Generate Mandatory Compliance Training Reports

**Agent Definition:** At the end of each reporting period (monthly for mandatory training status; quarterly for compliance audit package), extract all employees' completion status for each mandatory compliance training course, compute per-function and per-jurisdiction completion rates, and produce the Compliance Training Completion Report for delivery to Legal A12 via IF-A1-27.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | LMS Completion Records | MECH-LMS: all employees' completion status per mandatory course, with completion dates and scores |
| I2 | Input | Mandatory Training Calendar | From IF-A1-26; required courses by jurisdiction and deadline |
| I3 | Input | Active Employee Roster | From A13132; current employee population for rate denominator |
| C1 | Control | State Mandatory Training Requirements | [STATE-HARASSMENT-TRAINING] CA Gov. Code §12950.1; NY Lab. Law §201-g; IL 775 ILCS 5 — report must document compliance against each applicable state statute |
| C2 | Control | ADA Completion Accuracy | [ADA] 42 U.S.C. §12101 — accommodation-extended completions count as compliant if accommodation deadline is met |
| C3 | Control | FMLA Exclusion | [FMLA] 29 U.S.C. §2601 — employees on active FMLA leave are excluded from compliance rate denominators |
| O1 | Output | Compliance Training Completion Report | Per-function and per-jurisdiction: required course, employee count (denominator), completions (numerator), completion rate %, employees NOT complete with overdue dates; CHO-equivalent certification of compliance status; for delivery to Legal A12 via IF-A1-27 |
| M1 | Mechanism | LMS | [MECH-LMS] Completion data extract |
| M2 | Mechanism | BI / Reporting | [MECH-BI] Compliance rate dashboard |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Report generation |

**Definition of Done:** Compliance Training Completion Report is produced monthly AND covers 100% of mandatory compliance courses in the Mandatory Training Calendar AND completion rate and non-completion list are accurate within 1 business day of extraction AND report is delivered to Legal A12 via IF-A1-27 with CHO-equivalent certification.

**Cross-Function:** [CROSS-FUNCTION: A13 → A12] Compliance training completion evidence delivered to Legal A12 for regulatory audit file. Interface: IF-A1-27.

---

#### A13453: Escalate Overdue Training Completions

**Agent Definition:** Identify all employees who have missed a mandatory training completion deadline, generate tiered escalation notifications (manager at 7 days overdue; Principal at 14 days; Legal A12 at 30 days for jurisdiction-mandated training), and record each escalation in the Overdue Training Escalation Log.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Compliance Training Completion Report | Output of A13452; employees with MET/MISSED/PENDING status per course |
| I2 | Input | Mandatory Training Calendar | Jurisdiction-specific deadlines; internal policy deadlines |
| C1 | Control | State Mandatory Training Requirements | [STATE-HARASSMENT-TRAINING] employer liability for non-compliance; escalation must be documented for regulatory defense |
| C2 | Control | ADA/FMLA Exclusion | [ADA] [FMLA] employees on protected leave or active accommodation extensions are excluded from overdue classification |
| C3 | Control | NLRA Anti-Retaliation | [NLRA] 29 U.S.C. §151 — escalation process cannot be used as a pretext to discipline employees engaged in §7 activity |
| O1 | Output | Overdue Training Escalation Log | Per overdue employee: course name, deadline, days overdue, escalation tier, notification sent (Y/N), resolution date (if resolved), final status |
| M1 | Mechanism | Messaging | [MECH-MESSAGING] Slack API / Teams API — automated escalation notifications |
| M2 | Mechanism | LMS | [MECH-LMS] Overdue flag and notification trigger |

**Definition of Done:** Overdue Training Escalation Log is updated within 1 business day of each deadline breach AND escalation notifications are sent at 7-day (manager), 14-day (Principal), and 30-day (Legal A12 for jurisdiction-mandated) intervals with zero missed notifications AND no escalation record has an unresolved status after 60 days without Principal documentation of the resolution plan.

---

## A1346: Evaluate Learning Effectiveness

**Function:** Measure learning outcome quality using Kirkpatrick's four-level framework, assess behavior transfer and business results 90 days post-training, and compute the ROI of the L&D investment for Principal reporting.
**Supreme Constraint:** [KIRKPATRICK] Kirkpatrick Four-Level Training Evaluation Model — all programs evaluated against standardized levels; [ADEA] age-neutral evaluation; [TITLE7] disparate outcome flagging

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Training Attendance and Completion Records | From A13441, A13442, A13443; who completed what and when |
| I2 | Input | Pre-Training Competency Baseline | From A13411; competency gap scores before training |
| I3 | Input | Post-Training Competency Profiles | From A13451; updated HRIS competency ratings post-completion |
| I4 | Input | Business KPI Baseline | From A131 A1312 (Workforce Demand Model); function-level KPIs before program launch |
| I5 | Input | L&D Program Costs | Total program spend by course (content, facilitation, LMS admin, time-cost) |
| C1 | Control | Kirkpatrick Evaluation Standard | [KIRKPATRICK] Kirkpatrick Four-Level Training Evaluation Model (Kirkpatrick 1959; Kirkpatrick Partners 2009) — L1 (Reaction), L2 (Learning), L3 (Behavior), L4 (Results); minimum L1+L2 for every program; L3+L4 for High-priority programs only |
| C2 | Control | ADEA Evaluation Neutrality | [ADEA] 29 U.S.C. §621 — effectiveness analysis cannot attribute post-training performance to employee age |
| C3 | Control | Title VII Disparate Outcome | [TITLE7] 42 U.S.C. §2000e — if post-training outcomes show systematic disparity by protected class, finding must be flagged to Legal A12 before publishing the evaluation |
| O1 | Output | Learning Effectiveness Report (L1-L2) | Per program: L1 satisfaction score (% favorable), L2 knowledge gain (pre/post assessment delta) |
| O2 | Output | Learning Effectiveness Report (L3-L4) | Per High-priority program: L3 behavior change (90-day observation), L4 business result correlation, ROI % |
| O3 | Output | Annual L&D Investment ROI Report | Total L&D spend vs. attributed business results; program-level ROI ranking; Principal recommendation for next cycle investment |
| M1 | Mechanism | LMS | [MECH-LMS] Survey and assessment data |
| M2 | Mechanism | BI / Reporting | [MECH-BI] Effectiveness dashboard |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] [MECH-AGENT] Behavior change analysis and ROI computation |

**Child Nodes:** A13461, A13462, A13463

---

#### A13461: Measure Learner Reaction and Knowledge Acquisition (Kirkpatrick L1-L2)

**Agent Definition:** For every completed program, administer a standardized post-training reaction survey (Kirkpatrick Level 1) and compare pre-training assessment scores to post-training assessment scores to compute the knowledge acquisition delta (Kirkpatrick Level 2), and produce per-program L1 and L2 effectiveness scores.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Training Completion Records | MECH-LMS: all employees who completed the program; completion date |
| I2 | Input | Pre-Training Assessment Scores | MECH-LMS: pre-test scores collected before program access was granted |
| I3 | Input | Post-Training Assessment Scores | MECH-LMS: post-test scores collected at program completion |
| C1 | Control | Kirkpatrick L1-L2 Standard | [KIRKPATRICK] Kirkpatrick Four-Level Model — L1: survey measures relevance, facilitator quality, and likelihood of application (5-point scale; target ≥75% favorable); L2: pre/post delta ≥15% indicates effective knowledge transfer |
| C2 | Control | ADA Survey Accessibility | [ADA] 42 U.S.C. §12101 — reaction surveys must be screen-reader accessible; results analysis must be accommodation-aware |
| O1 | Output | L1-L2 Effectiveness Report | Per program: L1 favorable rating %, L2 mean pre-score, L2 mean post-score, L2 delta %, statistical significance (p-value), overall rating (Effective / Marginal / Ineffective) |
| M1 | Mechanism | LMS | [MECH-LMS] Survey administration and assessment score data |
| M2 | Mechanism | LLM / Agent | [MECH-LLM] Survey analysis and significance testing |

**Definition of Done:** L1-L2 Effectiveness Report is produced for 100% of programs with ≥5 completions AND every report contains both an L1 favorable rating percentage and an L2 delta with p-value AND programs rated Ineffective (L1 <60% favorable OR L2 delta <0%) are flagged for curriculum review in the next planning cycle.

---

#### A13462: Assess Behavior Transfer and Business Results (Kirkpatrick L3-L4)

**Agent Definition:** For all High-priority programs, conduct a structured 90-day post-completion assessment of on-the-job behavior change (Kirkpatrick Level 3) through manager observation surveys and compare post-training function KPIs against the pre-training baseline to identify business result correlation (Kirkpatrick Level 4).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | L1-L2 Effectiveness Report | Output of A13461; programs rated Effective or Marginal proceed to L3-L4 assessment |
| I2 | Input | Pre-Training KPI Baseline | From A131 A1312 Workforce Demand Model; function-level output KPIs before program launch |
| I3 | Input | Post-Training KPI Data (90-day) | Current function-level output KPIs at 90 days post-program completion |
| I4 | Input | Manager Observation Surveys | Structured behavioral observation: ≥5 observable behaviors per competency domain, rated on 5-point frequency scale |
| C1 | Control | Kirkpatrick L3-L4 Standard | [KIRKPATRICK] Kirkpatrick Four-Level Model — L3: behavior change score = mean frequency rating on observable behaviors (target ≥3.5/5.0); L4: business results expressed as KPI delta % with attribution statement |
| C2 | Control | ADEA Evaluation Neutrality | [ADEA] 29 U.S.C. §621 — manager observation surveys cannot include behavioral items that correlate with age-related factors unrelated to the competency being developed |
| C3 | Control | Title VII Disparate Outcome | [TITLE7] 42 U.S.C. §2000e — if L3-L4 results show systematic disparity by protected class, finding must be flagged to Legal A12 before publishing the program evaluation |
| O1 | Output | L3-L4 Effectiveness Report | Per High-priority program: L3 mean behavior change score, L4 KPI delta %, attribution confidence level (High/Medium/Low with rationale), combined effectiveness rating |
| M1 | Mechanism | Performance Management Platform | [MECH-PERF] Manager survey distribution and response collection |
| M2 | Mechanism | BI / Reporting | [MECH-BI] KPI comparison and correlation analysis |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] Attribution analysis and report drafting |

**Definition of Done:** L3-L4 Effectiveness Report is produced for 100% of High-priority programs at 90 days post-completion AND L3 assessment has a minimum manager response rate of 80% AND L4 KPI delta is computed against the pre-training baseline documented in A131 A1312 AND any finding showing systematic disparity by protected class is flagged to Legal A12 before the report is published to Principal.

**Cross-Function:** [CROSS-FUNCTION: A13 → A12] Protected-class disparity findings escalated to Legal A12 via Compliance Training Completion Report addendum. Interface: IF-A1-27.

---

#### A13463: Compute Learning Investment ROI and Report to Principal

**Agent Definition:** Aggregate total L&D program costs against the measured business results from L3-L4 assessments, compute ROI per program using the Phillips ROI Formula, rank programs by ROI, and produce the Annual L&D Investment ROI Report for Principal judgment.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | L3-L4 Effectiveness Reports | Output of A13462; per-program business result (KPI delta) for High-priority programs |
| I2 | Input | L1-L2 Effectiveness Reports | Output of A13461; for programs without L3-L4, L2 delta used as proxy with "no ROI computed" notation |
| I3 | Input | L&D Program Cost Records | MECH-FPA: content creation cost, facilitation cost, LMS admin cost, time-cost (participants × hourly rate × training hours) |
| C1 | Control | Kirkpatrick ROI Formula | [KIRKPATRICK] Phillips ROI Formula: ROI % = ((Program Benefits − Program Costs) / Program Costs) × 100; Program Benefits = monetized L4 KPI delta; programs without L4 data show L2-only score with "no ROI computed" notation |
| C2 | Control | GAAP Expense Recognition | [MATH-GAAP-AXIOMS] L&D costs are period expenses; ROI report must use actual expensed amounts |
| O1 | Output | Annual L&D Investment ROI Report | Program name, total cost, total benefit (monetized), ROI %, L1-L2-L3-L4 ratings summary, recommendation (Continue / Redesign / Discontinue); ordered by ROI descending |
| M1 | Mechanism | FP&A | [MECH-FPA] Cost aggregation and ROI computation |
| M2 | Mechanism | BI / Reporting | [MECH-BI] ROI report visualization |
| M3 | Mechanism | LLM / Agent | [MECH-LLM] ROI analysis and recommendation drafting |

**Definition of Done:** Annual L&D Investment ROI Report contains a cost entry for every program that ran during the year AND every High-priority program has an ROI % computed per Phillips formula AND every program has a recommendation (Continue / Redesign / Discontinue) with documented rationale AND report is delivered to Principal within 30 days of fiscal year close.

---

## Boundary Arrow Correspondence (A134 → Parent A13)

| A134 Output | Routes To | Notes |
|---|---|---|
| O1: Updated Competency Profiles | MECH-HRIS → IF-A1-04 (People & Roles Package) | Learning completions update individual competency profiles; consumed by Engineering A14 and downstream deployment functions |
| O2: L&D Effectiveness Report | Principal (judgment layer) | Management information; annual investment decision input |
| O3: Compliance Training Completion Report | Legal A12 via IF-A1-27 | Regulatory audit evidence; mandatory training compliance certification |

*Updated Competency Profiles also flow via Internal A13 Tunnel (A134 → A135): completion records update the competency profile that feeds next performance cycle goal-setting at A13511.*

---

## Leaf Node Count Verification

| L4 Node | Leaf Nodes |
|---|---|
| A1341: Identify Organizational Capability Gaps | A13411, A13412, A13413 = 3 |
| A1342: Design Learning Curriculum | A13421, A13422, A13423 = 3 |
| A1343: Develop Learning Content | A13431, A13432, A13433 = 3 |
| A1344: Deliver Learning Programs | A13441, A13442, A13443 = 3 |
| A1345: Track Learning Completion and Compliance | A13451, A13452, A13453 = 3 |
| A1346: Evaluate Learning Effectiveness | A13461, A13462, A13463 = 3 |
| **Total** | **18** |
