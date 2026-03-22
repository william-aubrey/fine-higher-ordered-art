# Skill File: Production Systems Operations

**Node:** A146
**Parent:** A14 Engineering
**Function:** Operate and Sustain All Production Systems
**Supreme Constraint:** [ISO-22301] Business Continuity Management; [FMEA] Failure Mode and Effects Analysis; [NIST-CSF] Cybersecurity Framework
**Cross-Function Interfaces:** IF-A1-05 (A14 → A2+A3 — operational runbooks as process plans), IF-A1-06 (A14 → Finance — infrastructure CapEx)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] Chaos engineering experiment design — [CHAOS-ENG] → A1463 / A14631–A14633
- [x] MTTR/MTTF failure mode analysis — [FMEA] → A14551–A14553 (in A145) + A1462 incident analysis here
- [x] BCP RTO/RPO target definition — [ISO-22301] → A1464 / A14641–A14643

*Note: node numbering for A146 child nodes uses A1461–A1466 to avoid collision with A1451–A1456 (A145).*

---

## A146: Operate and Sustain All Production Systems

**Function:** Monitor, maintain, protect, and recover all production systems (software, data, digital asset, and physical) to meet availability, performance, and security SLAs
**Supreme Constraint:** [ISO-22301]; [FMEA]; [NIST-CSF]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Deployed Systems | from A142, A143, A144, A145 — systems to operate |
| I2 | Input | Technical Architecture Standards | from A141 — operational standards |
| I3 | Input | Security Architecture Standards | from A141 — security monitoring requirements |
| C1 | Control | [ISO-22301] Business Continuity Management | RTO/RPO targets |
| C2 | Control | [FMEA] Failure Mode and Effects Analysis | operational reliability analysis |
| C3 | Control | [NIST-CSF] NIST Cybersecurity Framework 2.0 | Detect + Respond + Recover functions |
| C4 | Control | [CHAOS-ENG] Chaos Engineering Principles | proactive failure injection |
| O1 | Output | Operational Monitoring and Alerting System | dashboards, alerts, on-call routing |
| O2 | Output | Incident Response and Resolution Records | incident timeline, root cause, resolution, postmortem |
| O3 | Output | Chaos Engineering Experiment Results | hypothesis, blast radius, findings, system improvements |
| O4 | Output | Business Continuity Plan and DR Artifacts | BCP document, DR runbooks, test results |
| O5 | Output | Security Operations Records | threat detection, investigation, response records |
| O6 | Output | Patch and Upgrade Execution Records | applied patches, system upgrade records, rollback plans |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform | monitoring |
| M2 | Mechanism | [MECH-INCIDENT] Incident Management | on-call and incident response |
| M3 | Mechanism | [MECH-SIEM] SIEM | security event detection |
| M4 | Mechanism | [MECH-CLOUD] Cloud Provider API | infrastructure management |

**Child Nodes:** A1461, A1462, A1463, A1464, A1465, A1466

### Boundary Arrow Correspondence (A146)

| A146 Code | Produced By | Notes |
|---|---|---|
| O1 Operational Monitoring and Alerting | A1461.O3 | deployed monitoring stack |
| O2 Incident Response Records | A1462.O3 | postmortem records |
| O3 Chaos Engineering Results | A1463.O3 | experiment findings and improvements |
| O4 Business Continuity Plan and DR | A1464.O3 | tested BCP/DR package |
| O5 Security Operations Records | A1465.O3 | security incident records |
| O6 Patch and Upgrade Records | A1466.O3 | applied maintenance records |

### Internal Arrows (A146 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1461.O1 | A1462 | Input | Alert Triggers (incident detection) |
| 2 | A1461.O1 | A1465 | Input | Security Alerts (security incident detection) |
| 3 | A1462.O3 | A1463 | Input | Postmortem Findings (chaos experiment design input) |
| 4 | A1463.O3 | A1464 | Input | Resilience Findings (BCP/DR improvement input) |
| 5 | A1465.O2 | A1466 | Input | Vulnerability Findings (patch prioritization input) |

---

### A1461: Build and Operate Production Monitoring and Alerting

**Function:** Build and Operate Production Monitoring and Alerting
**Supreme Constraint:** [ISO-25010]; [ISO-22301]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Deployed Systems | from A142–A145 — systems to monitor |
| I2 | Input | SLA Definitions | from Technical Architecture Standards — availability and latency targets |
| C1 | Control | [ISO-25010] Software Quality Model | reliability monitoring requirements |
| C2 | Control | [ISO-22301] Business Continuity | availability targets drive alert thresholds |
| O1 | Output | Production Monitoring Dashboards | per-system: uptime, latency, error rate, resource utilization |
| O2 | Output | Alerting Rules and Escalation Policies | per-system: alert conditions, severity, on-call routing |
| O3 | Output | Deployed Monitoring and Alerting Stack | operational observability infrastructure |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform (Datadog, Grafana + Prometheus) | monitoring |
| M2 | Mechanism | [MECH-INCIDENT] Incident Management (PagerDuty, Opsgenie) | on-call routing |

**Child Nodes:** A14611, A14612, A14613

---

### A1462: Detect, Respond to, and Resolve Production Incidents

**Function:** Detect, Respond to, and Resolve Production Incidents
**Supreme Constraint:** [ISO-22301]; [NIST-CSF]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Alert Triggers | from A1461 — monitoring alerts |
| I2 | Input | User-Reported Issues | from support channels |
| C1 | Control | [ISO-22301] Business Continuity | RTO governs maximum resolution time |
| C2 | Control | [NIST-CSF] NIST CSF — Respond function | incident response procedures |
| O1 | Output | Incident Triage Records | severity classification, impact assessment, owner assignment |
| O2 | Output | Incident Resolution Records | timeline, actions taken, resolution confirmation |
| O3 | Output | Postmortem Reports | root cause, contributing factors, action items, follow-up |
| M1 | Mechanism | [MECH-INCIDENT] Incident Management (PagerDuty, FireHydrant) | incident coordination |
| M2 | Mechanism | [MECH-OBSERV] Observability Platform | diagnostic data |
| M3 | Mechanism | [MECH-MESSAGING] Team Messaging API (Slack) | incident communication |

**Child Nodes:** A14621, A14622, A14623

---

### A1463: Design and Execute Chaos Engineering Experiments

**Function:** Design and Execute Chaos Engineering Experiments
**Supreme Constraint:** [CHAOS-ENG]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Postmortem Findings | from A1462.O3 — failure patterns to validate against |
| I2 | Input | System Architecture | from A141/A142 — dependency maps |
| C1 | Control | [CHAOS-ENG] Chaos Engineering Principles | hypothesis-driven, blast radius containment, steady-state verification |
| C2 | Control | [ISO-25010] Software Quality Model | reliability improvement target |
| O1 | Output | Chaos Experiment Design | hypothesis, fault injection method, blast radius, abort criteria |
| O2 | Output | Experiment Execution Records | injection timestamp, observed behavior, steady-state deviation |
| O3 | Output | Resilience Findings and System Improvements | identified weaknesses, implemented fixes, re-test results |
| M1 | Mechanism | [MECH-CLOUD] Cloud Provider API | fault injection (instance termination, network partition) |
| M2 | Mechanism | [MECH-OBSERV] Observability Platform | steady-state monitoring during experiments |

**Child Nodes:** A14631, A14632, A14633

---

### A1464: Plan and Test Business Continuity and Disaster Recovery

**Function:** Plan and Test Business Continuity and Disaster Recovery
**Supreme Constraint:** [ISO-22301]; [ISO-31000]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | System Criticality Tiers | from A141 — risk tier assignments |
| I2 | Input | Resilience Findings | from A1463.O3 — known weaknesses |
| C1 | Control | [ISO-22301] Business Continuity Management | BCP structure and DR testing requirements |
| C2 | Control | [ISO-31000] Risk Management | risk assessment framework |
| O1 | Output | BCP Document | business impact analysis, recovery strategies, communication plan |
| O2 | Output | DR Runbooks | per-system: recovery procedure, data restoration, failover steps |
| O3 | Output | Tested BCP/DR Package | BCP + runbooks + DR test results |
| M1 | Mechanism | [MECH-CLOUD] Cloud Provider API | DR infrastructure (multi-region, backup) |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | BCP documentation |
| M3 | Mechanism | [MECH-IaC] Infrastructure as Code | DR infrastructure provisioning |

**Child Nodes:** A14641, A14642, A14643

---

### A1465: Operate Security Monitoring and Threat Response

**Function:** Operate Security Monitoring and Threat Response
**Supreme Constraint:** [NIST-CSF]; [MATH-CVSS]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Security Alerts | from A1461 — security event triggers |
| I2 | Input | Vulnerability Reports | from MECH-VULN — asset vulnerability inventory |
| C1 | Control | [NIST-CSF] NIST CSF — Detect + Respond functions | detection rules and response procedures |
| C2 | Control | [MATH-CVSS] CVSS v3.1 | vulnerability severity prioritization |
| C3 | Control | [SOC2-TSC] SOC 2 Trust Services Criteria | evidence collection for security monitoring |
| O1 | Output | Threat Detection Rules and Correlation Logic | SIEM detection rules, correlation patterns |
| O2 | Output | Security Vulnerability Findings | prioritized vulnerability list with CVSS scores |
| O3 | Output | Security Incident Response Records | per-incident: detection, investigation, containment, remediation |
| M1 | Mechanism | [MECH-SIEM] SIEM (Splunk, Microsoft Sentinel) | log aggregation and threat detection |
| M2 | Mechanism | [MECH-EDR] Endpoint Detection & Response (CrowdStrike) | endpoint monitoring |
| M3 | Mechanism | [MECH-VULN] Vulnerability Management (Tenable, Qualys) | vulnerability scanning |

**Child Nodes:** A14651, A14652, A14653

---

### A1466: Execute System Patching and Infrastructure Upgrades

**Function:** Execute System Patching and Infrastructure Upgrades
**Supreme Constraint:** [NIST-CSF]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Vulnerability Findings | from A1465.O2 — patches to apply |
| I2 | Input | Vendor Patch Releases | OS, middleware, database vendor updates |
| I3 | Input | Technical Architecture Standards | from A141 — upgrade compatibility requirements |
| C1 | Control | [NIST-CSF] NIST CSF — Protect function | timely patching requirements |
| C2 | Control | [ISO-25010] Software Quality Model | compatibility — patches must not break existing functionality |
| O1 | Output | Patch Assessment Reports | per-patch: applicability, risk, test results, deployment schedule |
| O2 | Output | Applied Patch Records | patch ID, system, deployment timestamp, verification result |
| O3 | Output | Infrastructure Upgrade Execution Records | upgrade scope, pre/post performance comparison, rollback plan |
| M1 | Mechanism | [MECH-CICD] CI/CD Pipeline | patch deployment automation |
| M2 | Mechanism | [MECH-IaC] Infrastructure as Code | infrastructure upgrade execution |
| M3 | Mechanism | [MECH-CLOUD] Cloud Provider API | infrastructure management |

**Child Nodes:** A14661, A14662, A14663

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A14611: Configure Production Monitoring Dashboards

**Agent Definition:** Configure monitoring dashboards in the observability platform tracking uptime, request latency (p50, p95, p99), error rate, CPU/memory/disk utilization, and custom business metrics for every production system deployed by A142–A145.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Deployed Systems Inventory | from A142–A145 — services, endpoints, infrastructure |
| C1 | Control | [ISO-25010] Software Quality Model | reliability — all critical metrics visible |
| O1 | Output | Production Monitoring Dashboards | per-system: uptime, latency percentiles, error rate, resource utilization |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform (Datadog, Grafana + Prometheus) | dashboard configuration |

**Definition of Done:** Every production system has a monitoring dashboard AND dashboards display uptime, p50/p95/p99 latency, error rate, and resource utilization AND data refreshes within 60 seconds.

---

#### A14612: Define Alerting Rules and Severity Classifications

**Agent Definition:** Define alerting rules for each production system specifying trigger conditions (error rate threshold, latency breach, disk >90%, service down), severity classification (P1-Critical, P2-High, P3-Medium, P4-Low), and acknowledgment SLA per severity.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | SLA Definitions | availability and latency targets from Technical Architecture Standards |
| C1 | Control | [ISO-22301] Business Continuity | SLAs drive alert thresholds |
| O1 | Output | Alerting Rule Definitions | per-rule: system, metric, condition, threshold, severity, ack SLA |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform | alert rule configuration |

**Definition of Done:** Every production system has at least one alerting rule AND every rule has a severity classification AND acknowledgment SLA is defined per severity level (P1 ≤5 min, P2 ≤15 min, P3 ≤1 hour, P4 ≤next business day).

---

#### A14613: Configure On-Call Routing and Escalation Policies

**Agent Definition:** Configure on-call schedules, routing rules (alert → primary on-call → secondary → engineering manager), and escalation policies (unacknowledged P1 escalates after 5 minutes) in the incident management platform.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Engineering Team Roster | from IF-A1-04 — available engineers |
| I2 | Input | Alerting Rules | from A14612.O1 — alert routing source |
| C1 | Control | [NIST-CSF] NIST CSF — Respond function | escalation requirements |
| O1 | Output | On-Call Schedule | rotation schedule with primary and secondary on-call |
| O2 | Output | Escalation Policy Configuration | routing rules, escalation timeouts, notification channels |
| M1 | Mechanism | [MECH-INCIDENT] Incident Management (PagerDuty, Opsgenie) | on-call scheduling |
| M2 | Mechanism | [MECH-MESSAGING] Team Messaging API (Slack) | notification routing |

**Definition of Done:** On-call schedule covers 24/7 AND every alert severity has a routing path AND escalation policy is configured (P1 unacknowledged escalates after 5 minutes) AND test alert reaches primary on-call.

---

#### A14621: Triage and Classify Production Incidents

**Agent Definition:** Receive incident alerts or user reports, classify the incident by severity (P1–P4) and impact scope (number of users, systems affected, revenue impact), assign an incident owner, and open an incident record in the incident management system.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Alert Triggers | from A1461 monitoring alerts |
| I2 | Input | User-Reported Issues | from support channels |
| C1 | Control | [ISO-22301] Business Continuity | severity classification aligned with BIA |
| O1 | Output | Incident Triage Record | incident ID, severity, impact scope, assigned owner, timestamp |
| M1 | Mechanism | [MECH-INCIDENT] Incident Management (PagerDuty, FireHydrant) | incident creation |
| M2 | Mechanism | [MECH-MESSAGING] Team Messaging API | incident notification |

**Definition of Done:** Incident has a unique ID AND severity is classified (P1–P4) AND impact scope is documented AND owner is assigned AND incident record is opened within acknowledgment SLA.

---

#### A14622: Diagnose Root Cause and Resolve Incident

**Agent Definition:** Investigate the incident using observability data (logs, metrics, traces), identify the root cause, implement the fix or workaround, verify system recovery, and update the incident record with resolution details and timeline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Incident Triage Record | from A14621.O1 |
| C1 | Control | [ISO-22301] Business Continuity | resolution within RTO |
| C2 | Control | [NIST-CSF] NIST CSF — Respond function | response procedures |
| O1 | Output | Root Cause Analysis | identified cause, contributing factors, affected systems |
| O2 | Output | Incident Resolution Record | timeline, actions, resolution confirmation, customer communication |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform | diagnostic data (logs, metrics, traces) |
| M2 | Mechanism | [MECH-CLOUD] Cloud Provider API | infrastructure actions (restart, failover) |

**Definition of Done:** Root cause is identified AND fix/workaround is implemented AND system recovery is verified (health checks pass) AND incident record is updated with full timeline AND resolution is within RTO for the incident severity.

---

#### A14623: Conduct Postmortem and Publish Action Items

**Agent Definition:** Conduct a blameless postmortem for all P1 and P2 incidents, documenting the incident timeline, root cause, contributing factors, what went well, what went poorly, and action items with owners and due dates, and publish the postmortem report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Incident Resolution Record | from A14622.O2 |
| I2 | Input | Root Cause Analysis | from A14622.O1 |
| C1 | Control | [ISO-22301] Business Continuity | continuous improvement |
| O1 | Output | Postmortem Report | timeline, root cause, contributing factors, lessons, action items with owners and due dates |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | postmortem documentation |
| M2 | Mechanism | [MECH-SCM] Source Code Management | action item tracking as issues |

**Definition of Done:** Postmortem covers all P1 and P2 incidents AND report contains timeline, root cause, and ≥1 action item AND every action item has an owner and due date AND postmortem is published to the engineering team.

---

#### A14631: Design Chaos Engineering Experiment with Hypothesis

**Agent Definition:** Design a chaos engineering experiment specifying the steady-state hypothesis (expected system behavior under normal conditions), fault injection method (instance termination, network partition, disk fill, latency injection), blast radius containment boundary, and abort criteria.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | System Architecture and Dependency Map | from A141/A142 |
| I2 | Input | Postmortem Findings | from A1462.O3 — failure patterns to validate |
| C1 | Control | [CHAOS-ENG] Chaos Engineering Principles | hypothesis-driven; minimize blast radius; automated abort |
| O1 | Output | Chaos Experiment Design Document | steady-state hypothesis, fault type, blast radius, abort criteria, success metrics |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | experiment documentation |

**Definition of Done:** Experiment document contains a falsifiable steady-state hypothesis AND fault injection method is specified AND blast radius boundary is defined AND abort criteria will halt the experiment before customer impact.

---

#### A14632: Execute Chaos Experiment and Record Observations

**Agent Definition:** Execute the designed chaos experiment in the target environment (staging or production with blast radius containment), inject the specified fault, observe system behavior against the steady-state hypothesis, and record all observations.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Chaos Experiment Design | from A14631.O1 |
| C1 | Control | [CHAOS-ENG] Chaos Engineering Principles | abort if blast radius is breached |
| C2 | Control | [ISO-25010] Software Quality Model | reliability monitoring during experiment |
| O1 | Output | Experiment Execution Record | injection timestamp, observed behavior, steady-state deviation metrics, abort triggered (yes/no) |
| M1 | Mechanism | [MECH-CLOUD] Cloud Provider API | fault injection (instance kill, network partition) |
| M2 | Mechanism | [MECH-OBSERV] Observability Platform | real-time monitoring during experiment |

**Definition of Done:** Fault was injected per design AND system behavior was observed AND steady-state deviation is quantified AND experiment record captures all metrics AND abort was correctly triggered if blast radius breached.

---

#### A14633: Analyze Results and Implement Resilience Improvements

**Agent Definition:** Analyze the chaos experiment results, identify system weaknesses revealed by the experiment (hypothesis disproven = weakness found), implement resilience improvements (circuit breakers, retries, fallbacks, data replication), and re-test to confirm improvement.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Experiment Execution Record | from A14632.O1 |
| C1 | Control | [CHAOS-ENG] Chaos Engineering Principles | weaknesses must result in actionable improvements |
| C2 | Control | [ISO-25010] Software Quality Model | reliability improvement target |
| O1 | Output | Resilience Findings Report | identified weaknesses, root cause, recommended improvements |
| O2 | Output | Implemented Improvements | code changes, configuration updates, architectural modifications |
| O3 | Output | Re-Test Confirmation | repeat experiment confirms improvement (hypothesis now holds) |
| M1 | Mechanism | [MECH-SCM] Source Code Management | improvement code commits |
| M2 | Mechanism | [MECH-CICD] CI/CD Pipeline | deployment of improvements |

**Definition of Done:** Weaknesses are identified and documented AND improvements are implemented AND re-test confirms the steady-state hypothesis now holds under the same fault injection AND findings report is published.

---

#### A14641: Conduct Business Impact Analysis and Define RTO/RPO Targets

**Agent Definition:** Conduct a business impact analysis (BIA) for all production systems, classifying each by criticality tier, quantifying the business impact of downtime (revenue loss, regulatory penalty, customer churn), and defining Recovery Time Objective (RTO) and Recovery Point Objective (RPO) targets per system.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | System Criticality Tiers | from A141 — risk tier assignments |
| I2 | Input | Revenue and Compliance Data | business impact quantification inputs |
| C1 | Control | [ISO-22301] Business Continuity Management | BIA methodology |
| C2 | Control | [ISO-31000] Risk Management | risk assessment framework |
| O1 | Output | Business Impact Analysis Report | per-system: criticality tier, downtime cost/hour, regulatory impact, RTO, RPO |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | BIA documentation |
| M2 | Mechanism | [MECH-BI] Business Intelligence | impact quantification |

**Definition of Done:** All production systems have a criticality tier AND downtime business impact is quantified AND RTO and RPO targets are defined per system AND BIA is approved by Principal.

---

#### A14642: Develop Disaster Recovery Runbooks per System

**Agent Definition:** Write disaster recovery runbooks for each critical system specifying the step-by-step recovery procedure, data restoration method (backup, replication, point-in-time recovery), failover steps, validation checks, and rollback plan.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Business Impact Analysis | from A14641.O1 — RTO/RPO targets per system |
| I2 | Input | System Architecture | from A141/A142 — infrastructure topology |
| C1 | Control | [ISO-22301] Business Continuity | runbook must achieve RTO and RPO targets |
| O1 | Output | DR Runbooks | per-system: recovery steps, data restoration, failover, validation, rollback |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | runbook documentation |
| M2 | Mechanism | [MECH-IaC] Infrastructure as Code (Terraform) | DR infrastructure definitions |
| M3 | Mechanism | [MECH-CLOUD] Cloud Provider API | backup and replication configuration |

**Definition of Done:** Every critical system has a DR runbook AND runbook recovery procedure achieves stated RTO AND data restoration achieves stated RPO AND rollback plan is documented.

---

#### A14643: Execute DR Test and Validate Recovery Capability

**Agent Definition:** Execute a disaster recovery test by simulating a system failure, following the DR runbook recovery procedure, measuring actual recovery time and data loss against RTO/RPO targets, and producing the DR test report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | DR Runbooks | from A14642.O1 |
| C1 | Control | [ISO-22301] Business Continuity | DR tests must be conducted at least annually |
| O1 | Output | DR Test Execution Record | simulated failure, recovery steps followed, actual recovery time, actual data loss |
| O2 | Output | DR Test Report | RTO achieved vs. target, RPO achieved vs. target, pass/fail, improvement recommendations |
| M1 | Mechanism | [MECH-CLOUD] Cloud Provider API | failover and recovery execution |
| M2 | Mechanism | [MECH-OBSERV] Observability Platform | recovery monitoring |

**Definition of Done:** DR test is executed AND actual recovery time ≤ RTO target AND actual data loss ≤ RPO target AND test report documents all results AND improvement recommendations are listed if targets were not met.

---

#### A14651: Configure SIEM Detection Rules and Correlation Logic

**Agent Definition:** Configure threat detection rules in the SIEM platform covering brute force attacks, anomalous login patterns, privilege escalation, data exfiltration indicators, and malware signatures, with correlation logic linking related events into security incidents.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Security Architecture Standards | from A141 — threat model and detection requirements |
| C1 | Control | [NIST-CSF] NIST CSF — Detect function | detection rule coverage requirements |
| C2 | Control | [MATH-CVSS] CVSS v3.1 | severity scoring for detected threats |
| O1 | Output | SIEM Detection Rules | per-rule: detection logic, data source, severity, correlation links |
| M1 | Mechanism | [MECH-SIEM] SIEM (Splunk, Microsoft Sentinel) | rule configuration |

**Definition of Done:** Detection rules cover brute force, anomalous login, privilege escalation, data exfiltration, and malware indicators AND correlation logic links related events AND every rule has a severity classification.

---

#### A14652: Execute Vulnerability Scanning and Prioritize Findings

**Agent Definition:** Execute vulnerability scans against all production assets (servers, containers, network devices, applications), score each finding by CVSS v3.1, and produce a prioritized vulnerability list with remediation recommendations.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Production Asset Inventory | from A142–A145 — all scannable assets |
| C1 | Control | [MATH-CVSS] CVSS v3.1 Severity Scoring | Critical ≥9.0; High 7.0–8.9 |
| C2 | Control | [NIST-CSF] NIST CSF — Identify function | asset vulnerability assessment |
| O1 | Output | Vulnerability Scan Results | per-finding: asset, CVE ID, CVSS score, remediation recommendation |
| O2 | Output | Prioritized Vulnerability List | ranked by CVSS score, grouped by system criticality tier |
| M1 | Mechanism | [MECH-VULN] Vulnerability Management (Tenable, Qualys, Rapid7) | vulnerability scanning |

**Definition of Done:** All production assets are scanned AND every finding has a CVSS score AND findings are prioritized by score × criticality tier AND remediation recommendations are provided.

---

#### A14653: Investigate and Respond to Security Incidents

**Agent Definition:** Investigate security incidents detected by SIEM or reported by users, determine scope of compromise, execute containment actions (isolate affected systems, revoke credentials), perform forensic analysis, and produce the security incident response report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | SIEM Security Alerts | from A1461/A14651 — detected threats |
| I2 | Input | User-Reported Security Issues | from support channels |
| C1 | Control | [NIST-CSF] NIST CSF — Respond + Recover functions | IR procedures |
| C2 | Control | [ISO-27001] ISMS | incident management requirements |
| O1 | Output | Containment Actions Record | systems isolated, credentials revoked, timestamp |
| O2 | Output | Forensic Analysis Report | compromise scope, attack vector, indicators of compromise |
| O3 | Output | Security Incident Response Report | full timeline, containment, eradication, recovery, lessons learned |
| M1 | Mechanism | [MECH-SIEM] SIEM | forensic log analysis |
| M2 | Mechanism | [MECH-EDR] Endpoint Detection & Response (CrowdStrike, SentinelOne) | endpoint forensics |
| M3 | Mechanism | [MECH-IAM] Identity & Access Management | credential revocation |

**Definition of Done:** Incident scope is determined AND containment actions are executed AND forensic analysis identifies attack vector AND incident response report documents full timeline AND lessons learned are published.

---

#### A14661: Assess Patches for Applicability and Risk

**Agent Definition:** Evaluate newly released vendor patches and security updates against the production system inventory, assess applicability (affected systems), risk (breaking changes, compatibility), and urgency (CVSS score of addressed vulnerabilities), and produce the patch assessment report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Vendor Patch Releases | OS, middleware, database, framework updates |
| I2 | Input | Vulnerability Findings | from A1465.O2 — patches addressing known vulnerabilities |
| C1 | Control | [NIST-CSF] NIST CSF — Protect function | timely patching (Critical within 72 hours, High within 14 days) |
| C2 | Control | [ISO-25010] Software Quality Model | compatibility assessment |
| O1 | Output | Patch Assessment Report | per-patch: applicability, CVSS of addressed CVE, risk, deployment priority, test plan |
| M1 | Mechanism | [MECH-VULN] Vulnerability Management | CVE cross-reference |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | assessment documentation |

**Definition of Done:** All new patches are assessed for applicability AND CVSS score of addressed vulnerabilities is documented AND risk (breaking changes) is evaluated AND deployment priority is assigned (Critical/High/Medium/Low).

---

#### A14662: Test and Deploy Patches to Production Systems

**Agent Definition:** Apply approved patches to a staging environment, execute regression tests to confirm no breaking changes, deploy patches to production using the CI/CD pipeline with rollback capability, and verify post-patch system health.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Patch Assessment Report | from A14661.O1 — approved patches with deployment priority |
| C1 | Control | [ISO-25010] Software Quality Model | patches must not degrade existing functionality |
| C2 | Control | [NIST-CSF] NIST CSF — Protect function | patching timeline SLA |
| O1 | Output | Staging Test Results | per-patch: regression test pass/fail, performance delta |
| O2 | Output | Applied Patch Records | patch ID, system, deployment timestamp, verification result |
| M1 | Mechanism | [MECH-CICD] CI/CD Pipeline | patch deployment |
| M2 | Mechanism | [MECH-CLOUD] Cloud Provider API | infrastructure patching |
| M3 | Mechanism | [MECH-OBSERV] Observability Platform | post-patch health monitoring |

**Definition of Done:** Patches pass staging regression tests AND patches are deployed to production AND post-patch health checks pass AND applied patch records are logged with deployment timestamp AND rollback plan is available for each patch.

---

#### A14663: Execute Infrastructure Upgrades and Document Changes

**Agent Definition:** Plan and execute major infrastructure upgrades (OS version, database version, Kubernetes version, cloud service migration), perform pre-upgrade backup, execute the upgrade with monitoring, verify post-upgrade functionality, and document all changes in the infrastructure change log.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Infrastructure Upgrade Plan | from Technical Architecture Standards — planned upgrades |
| C1 | Control | [ISO-25010] Software Quality Model | compatibility — upgrade must not break existing functionality |
| C2 | Control | [ISO-22301] Business Continuity | upgrade executed within maintenance window; rollback plan ready |
| O1 | Output | Pre-Upgrade Backup Confirmation | backup ID, timestamp, data verified |
| O2 | Output | Upgrade Execution Record | upgrade scope, pre/post version, execution timeline, verification results |
| O3 | Output | Infrastructure Change Log Entry | change ID, description, affected systems, rollback plan, approval |
| M1 | Mechanism | [MECH-IaC] Infrastructure as Code (Terraform, Pulumi) | upgrade execution |
| M2 | Mechanism | [MECH-CLOUD] Cloud Provider API | infrastructure management |
| M3 | Mechanism | [MECH-OBSERV] Observability Platform | post-upgrade monitoring |

**Definition of Done:** Pre-upgrade backup is confirmed AND upgrade is executed within maintenance window AND post-upgrade verification passes AND change log entry is created AND rollback plan is documented and tested.

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1=A1461.O3; O2=A1462.O3; O3=A1463.O3; O4=A1464.O3; O5=A1465.O3; O6=A1466.O3
- [x] No skill appears under more than one function node
- [x] All cross-function interfaces cited: IF-A1-05 (operational runbooks as process plans)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L4 node names are active verb phrases — all 6 verified (R1.2a)
- [x] L5 node names are active verb phrases — all 18 verified (R1.2a)
- [x] Leaf node count confirmed: 18 (3+3+3+3+3+3)
- [x] Mandatory inclusions: chaos engineering (A14631–A14633); BCP RTO/RPO (A14641–A14643); FMEA operational (via A1462 incident analysis)
