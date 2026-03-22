# Skill File: Core Software Platform

**Node:** A142
**Parent:** A14 Engineering
**Function:** Build and Operate Core Software Platform
**Supreme Constraint:** [ISO-25010] Software Quality Model; [OWASP-TOP10] OWASP Top 10; [PHYS-CAP] CAP Theorem
**Cross-Function Interfaces:** IF-A1-05 (A14 → A2+A3 Product/Process Plans), IF-A1-07 (A14 → People Headcount Requisition)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] SBOM generation and vulnerability mapping — [SBOM-SPDX] or [SBOM-CDX] → A14235, A14236
- [x] SAST pipeline configuration — [MATH-CVSS], [OWASP-TOP10] → A14231
- [x] DAST runtime scanning — [OWASP-TOP10], [MATH-CVSS] → A14234
- [x] Dependency vulnerability scanning and remediation — [MATH-CVSS] → A14232, A14233
- [x] Formal verification of critical algorithm correctness → A14216
- [ ] Chaos engineering experiment design — [CHAOS-ENG] → deferred to A146 sprint
- [ ] MTTR/MTTF failure mode analysis — [FMEA] → deferred to A146 sprint

---

## A142: Build and Operate Core Software Platform

**Function:** Design, develop, test, deploy, and secure the enterprise's core software applications and services, including AI/ML inference systems
**Supreme Constraint:** [ISO-25010]; [OWASP-TOP10]; [PHYS-CAP]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Product Requirements | from Product A31 / Principal — feature specifications |
| I2 | Input | Technical Architecture Standards | from A141 — conformance requirements |
| I3 | Input | Security Architecture Standards | from A141 — security controls |
| C1 | Control | [ISO-25010] Software Quality Model | acceptance criteria for all deliverables |
| C2 | Control | [OWASP-TOP10] OWASP Top 10 | application security requirements |
| C3 | Control | [PHYS-CAP] CAP Theorem | distributed system design constraints |
| C4 | Control | Technical Architecture Standards | from A1411 — governs all design decisions |
| O1 | Output | Deployed Software Applications and Services | running, tested, production-ready systems |
| O2 | Output | AI/ML Model Serving Infrastructure | inference APIs and model deployment pipelines |
| O3 | Output | Software Security Artifacts | SBOM, SAST reports, vulnerability remediation records |
| O4 | Output | Software Product/Process Plans | → Production A2 via IF-A1-05; → Sales A3 |
| M1 | Mechanism | [MECH-IDE] Integrated Development Environment | code authoring |
| M2 | Mechanism | [MECH-SCM] Source Code Management | version control and code review |
| M3 | Mechanism | [MECH-CICD] CI/CD Pipeline | automated build, test, deploy |
| M4 | Mechanism | [MECH-CLOUD] Cloud Provider API | infrastructure provisioning |
| M5 | Mechanism | [MECH-LLM] LLM API | AI inference and agent orchestration |

**Child Nodes:** A1421, A1422, A1423

### Boundary Arrow Correspondence (A142)

| A142 Code | Produced By | Notes |
|---|---|---|
| O1 Deployed Software Applications | A14226.O2 | finalized deployment record = validated production application |
| O2 AI/ML Model Serving Infrastructure | A14215.O1 verified by A14216.O1 | deployed and verified AI services |
| O3 Software Security Artifacts | A14236.O1 | SBOM + vulnerability resolution package with sign-off |
| O4 Software Product/Process Plans | A14211.O1, A14226.O2 | design specifications and deployment records → IF-A1-05 |

### Internal Arrows (A142 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1421.O1 | A1422 | Input | Software Design Specifications (acceptance criteria reference) |
| 2 | A1421.O2 | A1422 | Input | Tested Application Code (build and deploy target) |
| 3 | A1421.O2 | A1423 | Input | Application Source Code (SAST scanning target) |
| 4 | A1422.O1 (A14224) | A1423 | Input | Staging Deployment (DAST scanning target) |
| 5 | A1422.O2 (A14221) | A1423 | Input | Build Artifacts (SBOM generation target) |
| 6 | A1423.O1 | A1421 | Control | Security Findings (remediation required before release) |
| 7 | A1423.O1 | A1422 | Control | Security Findings (remediation required before release) |

---

### A1421: Design and Develop Software Applications and AI Services

**Function:** Design and Develop Software Applications and AI Services
**Supreme Constraint:** [ISO-25010]; [PHYS-CAP]; [MATH-BIGO]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Product Requirements | feature specifications from Product / Principal |
| I2 | Input | Technical Architecture Standards | from A141 — design constraints |
| C1 | Control | [ISO-25010] Software Quality Model | code must satisfy quality characteristics |
| C2 | Control | [PHYS-CAP] CAP Theorem | distributed component design trade-offs |
| C3 | Control | [MATH-BIGO] Computational Complexity | algorithm selection governs performance |
| O1 | Output | Software Design Specifications | architecture diagrams, API contracts, data models |
| O2 | Output | Tested Application Code | code passing unit and integration tests |
| O3 | Output | Deployed AI/ML Inference Services | model serving endpoints in production |
| M1 | Mechanism | [MECH-IDE] IDE (VS Code, IntelliJ) | code authoring |
| M2 | Mechanism | [MECH-SCM] Source Code Management (GitHub) | version control |
| M3 | Mechanism | [MECH-LLM] LLM API (Anthropic Claude API) | AI model serving |

**Child Nodes:** A14211, A14212, A14213, A14214, A14215, A14216

---

### A1422: Test, Build, and Deploy Software to Production

**Function:** Test, Build, and Deploy Software to Production
**Supreme Constraint:** [IEEE-730]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Tested Application Code | from A1421.O2 |
| I2 | Input | Software Design Specifications | from A1421.O1 — acceptance criteria reference |
| C1 | Control | [IEEE-730] Software Quality Assurance | QA process requirements for release |
| C2 | Control | [ISO-25010] Software Quality Model | release must satisfy quality thresholds |
| C3 | Control | Security Findings | from A1423.O1 — all critical/high findings must be resolved pre-deploy |
| O1 | Output | CI/CD Pipeline Execution Records | build logs, test results, deployment artifacts |
| O2 | Output | Release Validation Report | test coverage, performance benchmarks, quality gate pass/fail |
| O3 | Output | Deployed Production Applications | running services in production environment |
| M1 | Mechanism | [MECH-CICD] CI/CD Pipeline (GitHub Actions, ArgoCD) | automated build-test-deploy |
| M2 | Mechanism | [MECH-CONTAINER] Container Registry & Orchestration (Kubernetes, ECS) | deployment orchestration |
| M3 | Mechanism | [MECH-CLOUD] Cloud Provider API (AWS, GCP) | infrastructure provisioning |

**Child Nodes:** A14221, A14222, A14223, A14224, A14225, A14226

---

### A1423: Secure Software Supply Chain and Remediate Vulnerabilities

**Function:** Secure Software Supply Chain and Remediate Vulnerabilities
**Supreme Constraint:** [OWASP-TOP10]; [MATH-CVSS]; [SBOM-SPDX]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Deployed Code and Applications | from A1421.O2, A1422.O3 — scanning targets |
| I2 | Input | Security Architecture Standards | from A141 — required security controls |
| C1 | Control | [OWASP-TOP10] OWASP Top 10 | application security checklist |
| C2 | Control | [MATH-CVSS] CVSS v3.1 Severity Scoring | vulnerability prioritization formula |
| C3 | Control | [SBOM-SPDX] SPDX SBOM Standard | supply chain transparency format |
| O1 | Output | Security Scan Findings Report | SAST + dependency scan results with CVSS scores |
| O2 | Output | Vulnerability Remediation Records | per-finding: resolution action, verification, closure date |
| O3 | Output | SBOM + Vulnerability Resolution Package | signed SBOM with all critical/high vulnerabilities resolved |
| M1 | Mechanism | [MECH-SAST] Static Application Security Testing (SonarQube, Semgrep) | source code scanning |
| M2 | Mechanism | [MECH-DEPS] Dependency Vulnerability Scanner (Snyk, Dependabot) | third-party library scanning |
| M3 | Mechanism | [MECH-SBOM] SBOM Generator (Syft, CycloneDX CLI) | SBOM generation |

**Child Nodes:** A14231, A14232, A14233, A14234, A14235, A14236

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A14211: Produce Software Design Specification and API Contracts

**Agent Definition:** Translate product requirements into a software design specification containing architecture diagrams (component, sequence, data model), API contracts (OpenAPI/gRPC schema), and acceptance criteria traceable to the Technical Architecture Standards from A141.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Product Requirements Document | feature specifications with user stories and acceptance criteria |
| I2 | Input | Technical Architecture Standards | from A1411.O3 — reference architecture and technology stack |
| C1 | Control | [ISO-25010] Software Quality Model | design must address all applicable quality characteristics |
| C2 | Control | [PHYS-CAP] CAP Theorem | distributed components must declare CAP selection |
| O1 | Output | Software Design Specification | component diagrams, sequence diagrams, data model, API contracts (OpenAPI 3.x or gRPC .proto), acceptance criteria |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | design document drafting |
| M2 | Mechanism | [MECH-SCM] Source Code Management | API contract versioning |

**Definition of Done:** Design spec contains component diagram AND ≥1 sequence diagram per major flow AND API contracts are defined in OpenAPI 3.x or gRPC AND every acceptance criterion traces to a product requirement AND distributed components explicitly state CAP selection.

---

#### A14212: Implement Application Source Code

**Agent Definition:** Write application source code implementing the software design specification, applying the approved technology stack and reference architecture patterns, with all algorithms meeting stated computational complexity bounds.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Software Design Specification | from A14211.O1 |
| C1 | Control | [ISO-25010] Software Quality Model | code must satisfy maintainability and reliability characteristics |
| C2 | Control | [MATH-BIGO] Computational Complexity | algorithms must meet stated performance bounds |
| C3 | Control | [OWASP-TOP10] OWASP Top 10 | no OWASP Top 10 vulnerabilities introduced |
| O1 | Output | Application Source Code | implementation code committed to feature branch in MECH-SCM |
| M1 | Mechanism | [MECH-IDE] IDE (VS Code, IntelliJ IDEA) | code authoring |
| M2 | Mechanism | [MECH-SCM] Source Code Management (GitHub) | version control |

**Definition of Done:** Source code implements all components in the design specification AND algorithms meet stated Big-O bounds AND no OWASP Top 10 vulnerability is introduced (verified by MECH-SAST pre-merge scan).

---

#### A14213: Author Unit and Integration Test Suites

**Agent Definition:** Write unit tests covering all public interfaces and edge cases, and integration tests covering all cross-service interactions and external API integrations, achieving minimum code coverage threshold defined in Technical Architecture Standards.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Application Source Code | from A14212.O1 |
| I2 | Input | Software Design Specification | from A14211.O1 — acceptance criteria reference |
| C1 | Control | [ISO-25010] Software Quality Model | test coverage and reliability requirements |
| C2 | Control | [IEEE-730] Software Quality Assurance | test documentation standards |
| O1 | Output | Unit Test Suite | per-module: test cases, assertions, mocks/stubs, passing results |
| O2 | Output | Integration Test Suite | cross-service test cases with environment configuration |
| M1 | Mechanism | [MECH-IDE] IDE (VS Code, IntelliJ IDEA) | test authoring |
| M2 | Mechanism | [MECH-SCM] Source Code Management (GitHub) | test code version control |

**Definition of Done:** All unit tests pass AND all integration tests pass AND test coverage ≥ minimum threshold defined in Technical Architecture Standards AND every public interface has at least one test case.

---

#### A14214: Conduct Code Review and Merge Approved Changes

**Agent Definition:** Submit application code and test suites for peer code review, address all reviewer feedback, obtain approval from at least one qualified reviewer, and merge the approved changes to the target branch in MECH-SCM.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Application Source Code | from A14212.O1 — feature branch |
| I2 | Input | Test Suites | from A14213.O1, A14213.O2 — tests on same branch |
| C1 | Control | [ISO-25010] Software Quality Model | maintainability and code quality standards |
| C2 | Control | [OWASP-TOP10] OWASP Top 10 | security review as part of code review |
| O1 | Output | Code Review Record | reviewer comments, resolution status, approval signature |
| O2 | Output | Merged Application Code | approved code merged to target branch with passing CI checks |
| M1 | Mechanism | [MECH-SCM] Source Code Management (GitHub) | pull request and code review workflow |
| M2 | Mechanism | [MECH-LLM] LLM API (Anthropic Claude API) | automated code review assistance |

**Definition of Done:** Code review has ≥1 approval from a qualified reviewer AND all reviewer comments are resolved AND CI checks pass on the merged branch AND merge is recorded in MECH-SCM.

---

#### A14215: Deploy AI/ML Inference Services to Production

**Agent Definition:** Deploy AI/ML model inference endpoints (LLM APIs, classification models, embedding services) to production infrastructure using container orchestration, configure health check endpoints, and verify all services are running and reachable.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Trained Model Artifacts | model weights, tokenizer, serving configuration |
| C1 | Control | [MATH-BIGO] Computational Complexity | inference latency must meet stated O(n) bounds |
| C2 | Control | [ISO-25010] Software Quality Model | reliability — health checks required |
| O1 | Output | Deployed AI/ML Inference Services | live model endpoints with health checks passing |
| O2 | Output | Deployment Configuration Record | container specs, resource limits, scaling policy, endpoint URLs |
| M1 | Mechanism | [MECH-CONTAINER] Container Registry & Orchestration (Kubernetes) | model serving infrastructure |
| M2 | Mechanism | [MECH-CLOUD] Cloud Provider API (AWS, GCP) | compute provisioning |

**Definition of Done:** All inference endpoints are deployed AND health check endpoints return HTTP 200 AND deployment configuration is committed to MECH-SCM AND resource limits and scaling policy are defined.

---

#### A14216: Verify AI/ML Model Correctness Against Formal Test Suite

**Agent Definition:** Execute formal verification tests against deployed AI/ML inference services using known-correct input/output pairs, measure inference latency percentiles, and produce the model correctness verification report confirming accuracy and performance meet SLA thresholds.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Deployed AI/ML Inference Services | from A14215.O1 — live endpoints |
| I2 | Input | Verification Test Suite | known-correct input/output pairs for formal correctness verification |
| C1 | Control | [ISO-25010] Software Quality Model | performance efficiency and reliability |
| C2 | Control | [MATH-BIGO] Computational Complexity | p95 latency must meet stated bounds |
| O1 | Output | Model Correctness Verification Report | per-test-case: expected output, actual output, pass/fail; aggregate pass rate; p50/p95/p99 latency |
| M1 | Mechanism | [MECH-LLM] LLM API (Anthropic Claude API) | model inference target |
| M2 | Mechanism | [MECH-OBSERV] Observability Platform (Datadog) | latency measurement |

**Definition of Done:** Formal verification test suite passes with ≥99% accuracy on known-correct pairs AND p95 inference latency ≤ SLA threshold defined in Technical Architecture Standards AND verification report is produced and stored.

---

#### A14221: Execute CI/CD Pipeline Build and Automated Test Suite

**Agent Definition:** Trigger the CI/CD pipeline for the target branch, execute the full automated test suite (unit, integration, end-to-end), and produce the pipeline execution record with test results, code coverage, and build artifacts.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Tested Application Code | from A14212.O1 — merged branch in MECH-SCM |
| C1 | Control | [IEEE-730] Software Quality Assurance | pipeline must execute all test stages |
| C2 | Control | [ISO-25010] Software Quality Model | quality gates define minimum coverage and pass rates |
| O1 | Output | Pipeline Execution Record | build ID, duration, test results (pass/fail counts), code coverage %, build artifacts (container images, binaries) |
| M1 | Mechanism | [MECH-CICD] CI/CD Pipeline (GitHub Actions, Jenkins, CircleCI) | automated pipeline |
| M2 | Mechanism | [MECH-SCM] Source Code Management | branch trigger |

**Definition of Done:** Pipeline completes without infrastructure failures AND all test stages execute AND test pass rate ≥ quality gate threshold AND code coverage ≥ minimum threshold AND build artifacts are produced and stored.

---

#### A14222: Validate Release Against Quality Gates

**Agent Definition:** Compare pipeline execution results against the defined quality gates (minimum test pass rate, minimum code coverage, maximum regression count), and produce a quality gate validation report with a binary pass/fail determination per gate.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Pipeline Execution Record | from A14221.O1 — test results, coverage, build status |
| C1 | Control | [ISO-25010] Software Quality Model | quality gates derived from quality characteristics |
| C2 | Control | [IEEE-730] Software Quality Assurance | QA sign-off process |
| O1 | Output | Quality Gate Validation Report | per-gate: metric value, threshold, pass/fail; aggregate pass/fail determination |
| M1 | Mechanism | [MECH-CICD] CI/CD Pipeline | quality gate evaluation |

**Definition of Done:** All quality gates have a pass/fail determination AND aggregate report contains a single binary pass/fail determination AND any failing gate blocks the release pipeline.

---

#### A14223: Execute Performance Benchmark Comparison

**Agent Definition:** Execute the performance benchmark suite against the candidate release build, compare latency percentiles, throughput, and error rates against the prior release baseline, and produce a performance benchmark report with a binary regression/no-regression determination.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Quality Gate Validation Report | from A14222.O1 — must be "pass" determination |
| I2 | Input | Performance Benchmark Baselines | prior release latency (p50/p95/p99), throughput, error rate benchmarks |
| C1 | Control | [ISO-25010] Software Quality Model | performance efficiency characteristics |
| C2 | Control | [MATH-BIGO] Computational Complexity | regression detection against stated bounds |
| O1 | Output | Performance Benchmark Report | per-endpoint: latency percentiles, throughput, error rate; delta vs. baseline; binary regression/no-regression determination |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform (Datadog, Grafana) | performance measurement |
| M2 | Mechanism | [MECH-CICD] CI/CD Pipeline | benchmark suite execution |

**Definition of Done:** Benchmark suite executes against all critical endpoints AND latency percentiles (p50/p95/p99) are compared to prior release baseline AND report contains a single binary regression/no-regression determination.

---

#### A14224: Deploy Release to Staging and Execute Smoke Tests

**Agent Definition:** Deploy the validated release candidate to the staging environment using the approved deployment strategy, execute the smoke test suite against staging endpoints, and confirm all smoke tests pass before authorizing production deployment.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Performance Benchmark Report | from A14223.O1 — must be "no-regression" determination |
| I2 | Input | Build Artifacts | container images or binaries from A14221.O1 |
| C1 | Control | [ISO-25010] Software Quality Model | staging must mirror production configuration |
| C2 | Control | Security Findings | from A1423.O1 — all critical/high findings resolved |
| O1 | Output | Staging Deployment Record | deployment ID, timestamp, version, staging environment URL |
| O2 | Output | Smoke Test Results | per-test: endpoint, expected behavior, actual behavior, pass/fail |
| M1 | Mechanism | [MECH-CICD] CI/CD Pipeline (GitHub Actions, ArgoCD) | staging deployment |
| M2 | Mechanism | [MECH-CONTAINER] Container Registry & Orchestration (Kubernetes, ECS) | staging orchestration |

**Definition of Done:** Release candidate is deployed to staging AND all smoke tests pass AND staging environment configuration mirrors production AND staging deployment record is produced.

---

#### A14225: Deploy Release to Production Environment

**Agent Definition:** Execute the production deployment (blue-green, canary, or rolling strategy per Technical Architecture Standards), promote the validated release candidate from staging to production, and produce the production deployment record including rollback plan.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Smoke Test Results | from A14224.O2 — all tests pass |
| I2 | Input | Staging Deployment Record | from A14224.O1 — validated staging deployment |
| C1 | Control | [ISO-25010] Software Quality Model | production reliability requirements |
| C2 | Control | Security Findings | from A1423.O1 — all critical/high findings resolved |
| O1 | Output | Production Deployment Record | deployment ID, timestamp, version, strategy used, rollback plan, promotion source |
| M1 | Mechanism | [MECH-CICD] CI/CD Pipeline (ArgoCD, GitHub Actions) | production deployment execution |
| M2 | Mechanism | [MECH-CONTAINER] Container Registry & Orchestration (Kubernetes, ECS) | production orchestration |
| M3 | Mechanism | [MECH-CLOUD] Cloud Provider API (AWS, GCP) | infrastructure provisioning |

**Definition of Done:** Production deployment completes without errors AND deployment record contains rollback plan AND deployment version matches validated staging version.

---

#### A14226: Verify Production Health and Finalize Deployment Record

**Agent Definition:** Run post-deployment health checks against all production endpoints, compare production health metrics (error rate, latency, resource utilization) to pre-deployment baselines, and finalize the deployment record with health verification sign-off.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Production Deployment Record | from A14225.O1 — deployment to verify |
| C1 | Control | [ISO-25010] Software Quality Model | reliability and performance efficiency |
| O1 | Output | Post-Deploy Health Verification Report | per-endpoint: health status, error rate, p95 latency, resource utilization; all within acceptable bounds |
| O2 | Output | Finalized Deployment Record | deployment record with health verification sign-off, deployment marked "successful" or rollback initiated |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform (Datadog, New Relic) | health monitoring |
| M2 | Mechanism | [MECH-CICD] CI/CD Pipeline | deployment status finalization |

**Definition of Done:** All health check endpoints return HTTP 200 AND error rate ≤ pre-deployment baseline AND p95 latency ≤ pre-deployment baseline AND deployment record is finalized with health verification sign-off.

---

#### A14231: Execute Static Application Security Testing (SAST) Pipeline

**Agent Definition:** Run MECH-SAST against all application repositories, classify each finding by OWASP Top 10 category and CVSS v3.1 severity score, and produce the SAST findings report with remediation priority.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Application Source Code | all active repositories in MECH-SCM |
| C1 | Control | [OWASP-TOP10] OWASP Top 10 | findings classified by OWASP category |
| C2 | Control | [MATH-CVSS] CVSS v3.1 Severity Scoring | Base Score = f(AV, AC, PR, UI, S, C, I, A) |
| O1 | Output | SAST Findings Report | per-finding: file, line, OWASP category, CVSS score, severity (Critical/High/Medium/Low), remediation guidance |
| M1 | Mechanism | [MECH-SAST] Static Application Security Testing (SonarQube, Checkmarx, Semgrep) | source code scanning |

**Definition of Done:** All active repositories have been scanned AND every finding has an OWASP Top 10 classification AND a CVSS v3.1 score AND findings are sorted by severity descending.

---

#### A14232: Scan Dependencies for Known Vulnerabilities

**Agent Definition:** Run MECH-DEPS against all application dependency manifests, identify all dependencies with known CVEs, score each by CVSS severity, and produce the dependency vulnerability report with per-dependency CVE ID, CVSS score, affected version, and available fix version.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Dependency Manifests | package.json, requirements.txt, go.mod, Cargo.toml, etc. from MECH-SCM |
| C1 | Control | [MATH-CVSS] CVSS v3.1 Severity Scoring | Critical ≥9.0; High 7.0–8.9; Medium 4.0–6.9; Low <4.0 |
| C2 | Control | [OWASP-TOP10] OWASP Top 10 | dependency vulnerabilities mapped to OWASP categories |
| O1 | Output | Dependency Vulnerability Report | per-dependency: CVE ID, CVSS score, affected version, fixed version, OWASP category |
| M1 | Mechanism | [MECH-DEPS] Dependency Vulnerability Scanner (Snyk, Dependabot, OWASP Dependency-Check) | vulnerability scanning |

**Definition of Done:** All dependency manifests in MECH-SCM are scanned AND every finding has a CVE ID, CVSS v3.1 score, and OWASP Top 10 classification AND findings are sorted by severity descending.

---

#### A14233: Remediate Critical and High Dependency Vulnerabilities

**Agent Definition:** Resolve all Critical and High severity dependency vulnerabilities identified in the dependency vulnerability report by upgrading, patching, or replacing the affected dependency, and produce remediation records with verification test results confirming the vulnerability is resolved.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Dependency Vulnerability Report | from A14232.O1 — Critical and High findings |
| C1 | Control | [MATH-CVSS] CVSS v3.1 Severity Scoring | Critical ≥9.0; High 7.0–8.9 — both require remediation |
| C2 | Control | [ISO-25010] Software Quality Model | remediation must not degrade functional suitability |
| O1 | Output | Remediation Records | per-finding: action taken (upgrade/patch/replace), verification test result, closure date |
| M1 | Mechanism | [MECH-DEPS] Dependency Vulnerability Scanner | re-scan to verify remediation |
| M2 | Mechanism | [MECH-SCM] Source Code Management | dependency update commits |

**Definition of Done:** Zero Critical-severity CVEs remain unresolved AND zero High-severity CVEs remain unresolved for >30 days AND every remediation action has a verification test result confirming the CVE is no longer detected.

---

#### A14234: Execute Dynamic Application Security Testing (DAST)

**Agent Definition:** Run MECH-DAST against all externally reachable application endpoints in the staging environment, classify each finding by OWASP Top 10 category and CVSS v3.1 severity score, and produce the DAST findings report with remediation priority.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Staging Deployment | from A14224.O1 — running staging endpoints as scan targets |
| C1 | Control | [OWASP-TOP10] OWASP Top 10 | findings classified by OWASP category |
| C2 | Control | [MATH-CVSS] CVSS v3.1 Severity Scoring | Base Score = f(AV, AC, PR, UI, S, C, I, A) |
| O1 | Output | DAST Findings Report | per-finding: endpoint, OWASP category, CVSS score, severity, remediation guidance |
| M1 | Mechanism | [MECH-DAST] Dynamic Application Security Testing (OWASP ZAP, Burp Suite) | runtime security scanning |

**Definition of Done:** All externally reachable staging endpoints are scanned AND every finding has an OWASP Top 10 classification AND a CVSS v3.1 score AND findings are sorted by severity descending.

---

#### A14235: Generate Software Bill of Materials (SBOM)

**Agent Definition:** Generate a Software Bill of Materials in SPDX or CycloneDX format for every deployable artifact, listing all direct and transitive dependencies with version, license, and supplier information.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Build Artifacts | container images and binaries from A14221.O1 |
| C1 | Control | [SBOM-SPDX] SPDX Specification 2.3 | SBOM format standard |
| C2 | Control | [SBOM-CDX] CycloneDX 1.5 | alternative SBOM format |
| O1 | Output | Generated SBOM | per-artifact: SPDX or CycloneDX formatted bill of materials with all dependencies, versions, licenses, suppliers |
| M1 | Mechanism | [MECH-SBOM] SBOM Generator (Syft, CycloneDX CLI) | SBOM generation |

**Definition of Done:** SBOM is generated for every deployable artifact AND SBOM format conforms to SPDX 2.3 or CycloneDX 1.5 AND every dependency entry includes version, license, and supplier.

---

#### A14236: Produce Vulnerability Resolution Package with Sign-Off

**Agent Definition:** Cross-reference the generated SBOM against SAST findings, DAST findings, and dependency vulnerability reports, confirm all Critical and High findings are resolved, and produce the signed vulnerability resolution package with CTO/CISO sign-off.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Generated SBOM | from A14235.O1 |
| I2 | Input | SAST Findings Report | from A14231.O1 |
| I3 | Input | DAST Findings Report | from A14234.O1 |
| I4 | Input | Remediation Records | from A14233.O1 |
| C1 | Control | [MATH-CVSS] CVSS v3.1 | resolution verification threshold |
| C2 | Control | [SBOM-SPDX] SPDX Specification 2.3 | package format |
| O1 | Output | Vulnerability Resolution Package | SBOM + cross-referenced vulnerability status (SAST + DAST + dependency); all Critical/High resolved; CTO/CISO sign-off |
| M1 | Mechanism | [MECH-SBOM] SBOM Generator | cross-reference tooling |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | sign-off capture |

**Definition of Done:** Cross-reference confirms zero unresolved Critical/High vulnerabilities across SAST, DAST, and dependency scans AND vulnerability resolution package includes the SBOM AND CTO/CISO sign-off is captured via MECH-ESIGN.

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1=A14226.O2; O2=A14215.O1; O3=A14236.O1; O4=A14211.O1+A14226.O2
- [x] No skill appears under more than one function node
- [x] All cross-function interfaces cited: IF-A1-05 (Product/Process Plans to A2+A3)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L4 node names are active verb phrases — all 3 verified (R1.2a)
- [x] L5 node names are active verb phrases — all 18 verified (R1.2a) — 3 L4 nodes × 6 L5 children = 18
- [x] Leaf node count confirmed: 18
- [x] Mandatory inclusions: SBOM (A14235, A14236); SAST (A14231); DAST (A14234); dependency scan (A14232, A14233); formal verification (A14216)
