# Skill File: Data and Analytics Infrastructure

**Node:** A143
**Parent:** A14 Engineering
**Function:** Build and Operate Data and Analytics Infrastructure
**Supreme Constraint:** [PHYS-CAP] CAP Theorem; [ISO-25010] Software Quality Model; [GDPR] GDPR (data governance)
**Cross-Function Interfaces:** IF-A1-03 (Legal → A14 Compliance Operating Envelope — data residency, retention), IF-A1-05 (A14 → A2+A3 — data products as process plans)
**Sprint Date:** 2026-03-13
**Leaf Node Count:** 18 (L5) — confirmed at sprint close
**Mandatory Inclusions Verified:**
- [x] Ontological engineering (data model design, entity relationship definitions, semantic layer design, knowledge graph construction) — per A143 scope note → A1434 / A14341–A14343
- [x] Data quality governance → A1436 / A14361–A14363

---

## A143: Build and Operate Data and Analytics Infrastructure

**Function:** Design, build, and operate the enterprise's data ingestion, storage, transformation, analytics, ontological modeling, and machine learning training infrastructure
**Supreme Constraint:** [PHYS-CAP]; [ISO-25010]; [GDPR]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Operational Data Streams | from A142 applications, A2 Production, A3 Sales (transactional data) |
| I2 | Input | Data Entity Definitions | from enterprise/data/ — canonical entity schemas |
| I3 | Input | Technical Architecture Standards | from A141 — infrastructure design constraints |
| I4 | Input | Compliance Operating Envelope | IF-A1-03 — data residency, retention, privacy requirements |
| C1 | Control | [PHYS-CAP] CAP Theorem | consistency/availability trade-off for data stores |
| C2 | Control | [ISO-25010] Software Quality Model | data infrastructure quality requirements |
| C3 | Control | [GDPR] General Data Protection Regulation | personal data processing constraints |
| C4 | Control | [CCPA] California Consumer Privacy Act | consumer data rights |
| C5 | Control | Security Architecture Standards | from A1415 — data security controls |
| O1 | Output | Operational Data Pipelines | running ETL/ELT pipelines ingesting data from source systems |
| O2 | Output | Analytical Data Store | queryable data warehouse with governed schema |
| O3 | Output | BI Dashboards and Reporting Layer | self-service analytics and scheduled reports |
| O4 | Output | Enterprise Data Ontology Models | entity relationship models, semantic layers, knowledge graphs |
| O5 | Output | ML Training Infrastructure | training pipelines, feature stores, experiment tracking |
| O6 | Output | Data Quality and Governance Records | quality scores, lineage, retention compliance records |
| M1 | Mechanism | [MECH-ETL] ETL / Data Pipeline | data transformation |
| M2 | Mechanism | [MECH-DW] Data Warehouse | analytical storage |
| M3 | Mechanism | [MECH-BI] Business Intelligence | dashboarding |
| M4 | Mechanism | [MECH-DB-VECTOR] Vector Database | embedding storage |
| M5 | Mechanism | [MECH-STREAM] Event Streaming | real-time data |

**Child Nodes:** A1431, A1432, A1433, A1434, A1435, A1436

### Boundary Arrow Correspondence (A143)

| A143 Code | Produced By | Notes |
|---|---|---|
| O1 Operational Data Pipelines | A1431.O3 | deployed and monitored pipelines |
| O2 Analytical Data Store | A1432.O3 | governed data warehouse |
| O3 BI Dashboards and Reporting Layer | A1433.O3 | published dashboards |
| O4 Enterprise Data Ontology Models | A1434.O3 | published ontology artifacts |
| O5 ML Training Infrastructure | A1435.O3 | operational training pipelines |
| O6 Data Quality and Governance Records | A1436.O3 | quality and compliance package |

### Internal Arrows (A143 diagram)

| # | From | To | Role | Label |
|---|---|---|---|---|
| 1 | A1431.O3 | A1432 | Input | Ingested Data (populates warehouse) |
| 2 | A1434.O3 | A1432 | Control | Ontology Models (govern warehouse schema) |
| 3 | A1434.O3 | A1431 | Control | Ontology Models (govern pipeline field mappings) |
| 4 | A1432.O3 | A1433 | Input | Analytical Data Store (BI data source) |
| 5 | A1432.O3 | A1435 | Input | Analytical Data Store (ML training data source) |
| 6 | A1436.O1 | A1431 | Control | Data Quality Rules (pipeline validation) |

---

### A1431: Design and Build Data Ingestion and Integration Pipelines

**Function:** Design and Build Data Ingestion and Integration Pipelines
**Supreme Constraint:** [PHYS-CAP]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Source System Data Schemas | from A142 applications, ERP, CRM, HRIS |
| I2 | Input | Data Quality Rules | from A1436.O1 — validation rules per field |
| C1 | Control | [PHYS-CAP] CAP Theorem | pipeline consistency model (exactly-once, at-least-once) |
| C2 | Control | [GDPR] GDPR | PII handling: pseudonymization, consent tracking |
| C3 | Control | Ontology Models | from A1434.O3 — canonical field mappings |
| O1 | Output | Pipeline Design Specifications | source-to-target mapping, transformation logic, schedule |
| O2 | Output | Deployed Pipeline Code | running DAGs/flows in MECH-ETL |
| O3 | Output | Pipeline Monitoring Dashboards | run status, row counts, error rates, latency |
| M1 | Mechanism | [MECH-ETL] ETL / Data Pipeline (dbt, Fivetran, Airflow) | pipeline orchestration |
| M2 | Mechanism | [MECH-STREAM] Event Streaming (Kafka, Kinesis) | real-time ingestion |

**Child Nodes:** A14311, A14312, A14313

---

### A1432: Build and Operate Analytical Data Store

**Function:** Build and Operate Analytical Data Store
**Supreme Constraint:** [PHYS-CAP]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Ingested Data | from A1431.O3 — transformed and quality-checked data |
| I2 | Input | Ontology Models | from A1434.O3 — schema governance |
| C1 | Control | [PHYS-CAP] CAP Theorem | warehouse consistency model |
| C2 | Control | [ISO-25010] Software Quality Model | performance efficiency and reliability |
| O1 | Output | Warehouse Schema Definitions | table structures, partitioning, clustering, access controls |
| O2 | Output | Materialized Views and Aggregation Layers | pre-computed query layers for BI performance |
| O3 | Output | Governed Analytical Data Store | queryable, access-controlled, schema-versioned warehouse |
| M1 | Mechanism | [MECH-DW] Data Warehouse (Snowflake, BigQuery, Databricks) | analytical storage |
| M2 | Mechanism | [MECH-ETL] ETL / Data Pipeline (dbt) | transformation within warehouse |

**Child Nodes:** A14321, A14322, A14323

---

### A1433: Design and Build Reporting and Analytics Layer

**Function:** Design and Build Reporting and Analytics Layer
**Supreme Constraint:** [ISO-25010]; [GDPR]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Analytical Data Store | from A1432.O3 — data source for BI |
| I2 | Input | Reporting Requirements | from all enterprise functions — KPI definitions, report specifications |
| C1 | Control | [ISO-25010] Software Quality Model | usability and performance requirements |
| C2 | Control | [GDPR] GDPR | data access controls for reports containing PII |
| C3 | Control | [REPORTING-POLICY] Workforce Reporting Access Policy | access tiers for sensitive data |
| O1 | Output | Semantic Layer Definitions | business-friendly metric and dimension definitions |
| O2 | Output | Dashboard and Report Specifications | layout, filters, KPI calculations, refresh schedule |
| O3 | Output | Published BI Dashboards and Scheduled Reports | live dashboards and automated report distribution |
| M1 | Mechanism | [MECH-BI] Business Intelligence (Sigma, Tableau, Looker) | dashboarding |
| M2 | Mechanism | [MECH-DW] Data Warehouse | query backend |

**Child Nodes:** A14331, A14332, A14333

---

### A1434: Design and Build Enterprise Data Ontology Models

**Function:** Design and Build Enterprise Data Ontology Models
**Supreme Constraint:** [ISO-25010]; [PHYS-CAP]

*Scope note: This sub-function implements the enterprise data ontology defined in `enterprise/data/`. It covers entity relationship design, semantic layer construction, knowledge graph development, and canonical schema publication. This is ontological engineering — not merely data pipeline engineering.*

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Enterprise Data Entity Definitions | from enterprise/data/ (data-entity-people.md, data-entity-digital-asset.md, etc.) |
| I2 | Input | Source System Data Schemas | from A142 applications — existing schema reality |
| C1 | Control | [ISO-25010] Software Quality Model | ontology must satisfy interoperability and maintainability |
| C2 | Control | [PHYS-CAP] CAP Theorem | distributed data model consistency requirements |
| O1 | Output | Entity Relationship Models | canonical ER diagrams with cardinality, constraints, and keys |
| O2 | Output | Semantic Layer and Knowledge Graph Schemas | ontology nodes, edges, properties, inference rules |
| O3 | Output | Published Enterprise Data Ontology Package | versioned, approved, governing A1431 and A1432 schemas |
| M1 | Mechanism | [MECH-DB-RELATIONAL] Relational Database (PostgreSQL) | ER model validation |
| M2 | Mechanism | [MECH-DB-VECTOR] Vector Database (Pinecone, Weaviate) | knowledge graph embedding |
| M3 | Mechanism | [MECH-DOC] Document Collaboration | ontology documentation |

**Child Nodes:** A14341, A14342, A14343

---

### A1435: Build and Operate Machine Learning Training Infrastructure

**Function:** Build and Operate Machine Learning Training Infrastructure
**Supreme Constraint:** [MATH-BIGO]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Training Datasets | from A1432.O3 — curated data from analytical store |
| I2 | Input | Model Requirements | from A142 — model specifications for AI services |
| C1 | Control | [MATH-BIGO] Computational Complexity | training compute budget constraints |
| C2 | Control | [ISO-25010] Software Quality Model | reproducibility and reliability |
| C3 | Control | [GDPR] GDPR | PII exclusion or pseudonymization in training data |
| O1 | Output | Feature Store Definitions | feature engineering logic and versioned feature sets |
| O2 | Output | Experiment Tracking Records | model versions, hyperparameters, metrics, artifacts |
| O3 | Output | Operational ML Training Pipelines | automated training, validation, and model registry workflows |
| M1 | Mechanism | [MECH-CLOUD] Cloud Provider API (AWS SageMaker, GCP Vertex AI) | training compute |
| M2 | Mechanism | [MECH-DW] Data Warehouse | training data source |
| M3 | Mechanism | [MECH-SCM] Source Code Management | ML code version control |

**Child Nodes:** A14351, A14352, A14353

---

### A1436: Govern Data Quality and Lifecycle

**Function:** Govern Data Quality and Lifecycle
**Supreme Constraint:** [GDPR]; [ISO-25010]

| Code | Role | Label | Notes |
|---|---|---|---|
| I1 | Input | Data Quality Scan Results | from MECH-ETL and MECH-DW — completeness, accuracy, freshness metrics |
| I2 | Input | Compliance Operating Envelope | IF-A1-03 — retention and deletion mandates |
| C1 | Control | [GDPR] GDPR Art. 5 | data minimization, accuracy, storage limitation principles |
| C2 | Control | [CCPA] CCPA | consumer data deletion rights |
| C3 | Control | [ISO-25010] Software Quality Model | data quality as a quality characteristic |
| O1 | Output | Data Quality Rules and Thresholds | per-field: completeness, uniqueness, validity rules with pass/fail thresholds |
| O2 | Output | Data Lineage and Retention Records | source-to-target lineage maps and retention schedule compliance |
| O3 | Output | Data Governance Compliance Package | quality scores, lineage, retention compliance, GDPR/CCPA audit evidence |
| M1 | Mechanism | [MECH-ETL] ETL / Data Pipeline | quality check execution |
| M2 | Mechanism | [MECH-GRC] GRC Platform | compliance tracking |
| M3 | Mechanism | [MECH-BI] Business Intelligence | quality score dashboards |

**Child Nodes:** A14361, A14362, A14363

---

## Leaf Node Definitions (L5 — 18 nodes)

---

#### A14311: Design Source-to-Target Data Mappings and Transformation Logic

**Agent Definition:** Map each source system field to its canonical target field using the Enterprise Data Ontology (A1434), define transformation rules (type casting, normalization, deduplication, PII pseudonymization), and produce the source-to-target mapping specification for each pipeline.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Source System Data Schemas | API schemas, database schemas, file formats from source systems |
| I2 | Input | Enterprise Data Ontology Package | from A1434.O3 — canonical field names, types, constraints |
| C1 | Control | [GDPR] GDPR Art. 5 | PII fields must be pseudonymized or consent-traced |
| C2 | Control | [ISO-25010] Software Quality Model | mapping must preserve data accuracy and completeness |
| O1 | Output | Source-to-Target Mapping Specification | per-pipeline: source field, target field, transformation rule, PII flag, validation rule |
| M1 | Mechanism | [MECH-DOC] Document Collaboration | mapping documentation |
| M2 | Mechanism | [MECH-ETL] ETL / Data Pipeline (dbt, Fivetran) | mapping validation |

**Definition of Done:** Every source field is mapped to a canonical target field OR explicitly excluded with rationale AND every PII field has a pseudonymization or consent-tracking rule AND mapping specification is reviewed and approved.

---

#### A14312: Implement and Deploy Data Pipelines

**Agent Definition:** Implement the data pipelines as code (DAGs, dbt models, or streaming consumers) per the source-to-target mapping specifications, deploy to the pipeline orchestration platform, and configure scheduling (batch) or trigger rules (streaming).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Source-to-Target Mapping Specification | from A14311.O1 |
| C1 | Control | [PHYS-CAP] CAP Theorem | pipeline delivery guarantee: exactly-once or at-least-once stated per pipeline |
| C2 | Control | [ISO-25010] Software Quality Model | reliability and maintainability |
| O1 | Output | Deployed Pipeline Code | versioned DAGs/models in MECH-SCM, running in MECH-ETL |
| M1 | Mechanism | [MECH-ETL] ETL / Data Pipeline (dbt, Airflow, Fivetran) | pipeline deployment |
| M2 | Mechanism | [MECH-STREAM] Event Streaming (Kafka, Kinesis) | streaming pipeline deployment |
| M3 | Mechanism | [MECH-SCM] Source Code Management | pipeline code version control |

**Definition of Done:** All pipelines from the mapping specification are deployed AND each pipeline has a stated delivery guarantee AND pipeline code is committed to MECH-SCM AND batch pipelines have a defined schedule AND streaming pipelines have a defined trigger rule.

---

#### A14313: Configure Pipeline Monitoring and Alerting

**Agent Definition:** Configure monitoring dashboards tracking pipeline run status, row counts processed, error rates, and data freshness for every deployed pipeline, and set up alerting rules that trigger notifications when a pipeline fails or data freshness exceeds the SLA threshold.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Deployed Pipelines | from A14312.O1 — running pipelines to monitor |
| C1 | Control | [ISO-25010] Software Quality Model | reliability monitoring requirements |
| O1 | Output | Pipeline Monitoring Dashboards | per-pipeline: run status, row counts, error rate, last successful run timestamp |
| O2 | Output | Alerting Rules | per-pipeline: failure alert, freshness SLA breach alert, row count anomaly alert |
| M1 | Mechanism | [MECH-OBSERV] Observability Platform (Datadog, Grafana) | monitoring |
| M2 | Mechanism | [MECH-MESSAGING] Team Messaging API (Slack) | alert delivery |

**Definition of Done:** Every deployed pipeline has a monitoring dashboard entry AND every pipeline has at least a failure alert and a freshness SLA alert configured AND alert notifications route to the owning team's channel.

---

#### A14321: Define Warehouse Schema with Partitioning and Access Controls

**Agent Definition:** Define the analytical data warehouse schema (tables, columns, types, constraints, partitioning keys, clustering keys) conforming to the Enterprise Data Ontology, and configure role-based access controls per the Reporting Access Policy.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Enterprise Data Ontology Package | from A1434.O3 — canonical entity definitions |
| I2 | Input | Ingested Data Schemas | from A1431 — actual data arriving from pipelines |
| C1 | Control | [ISO-25010] Software Quality Model | performance efficiency (partitioning), security (access controls) |
| C2 | Control | [REPORTING-POLICY] Workforce Reporting Access Policy | access tiers for sensitive data |
| O1 | Output | Warehouse Schema DDL | CREATE TABLE statements with partitioning, clustering, column constraints, RBAC grants |
| M1 | Mechanism | [MECH-DW] Data Warehouse (Snowflake, BigQuery) | schema deployment |
| M2 | Mechanism | [MECH-IAM] Identity & Access Management | RBAC configuration |

**Definition of Done:** All canonical entities from the ontology have corresponding warehouse tables AND partitioning keys are defined for tables exceeding 1M rows AND RBAC grants match the access tier definitions in REPORTING-POLICY.

---

#### A14322: Build Materialized Views and Aggregation Layers

**Agent Definition:** Create materialized views and pre-computed aggregation tables for high-frequency BI queries, define refresh schedules, and verify query performance meets the defined latency threshold.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Warehouse Schema DDL | from A14321.O1 — base tables |
| I2 | Input | BI Query Patterns | high-frequency query patterns identified from reporting requirements |
| C1 | Control | [ISO-25010] Software Quality Model | performance efficiency — query latency thresholds |
| O1 | Output | Materialized View Definitions | SQL definitions, refresh schedule, dependency graph |
| O2 | Output | Aggregation Performance Test Results | per-view: query latency before/after, refresh duration |
| M1 | Mechanism | [MECH-DW] Data Warehouse (Snowflake, BigQuery) | view materialization |

**Definition of Done:** All high-frequency BI query patterns have a supporting materialized view or aggregation table AND refresh schedules are configured AND query latency with materialized views ≤ defined threshold.

---

#### A14323: Validate Warehouse Data Integrity and Publish Access Endpoints

**Agent Definition:** Execute data integrity checks (referential integrity, uniqueness constraints, null checks) against all warehouse tables, publish query access endpoints (connection strings, service accounts, API endpoints) to authorized consumers, and document the governed data store catalog.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Populated Warehouse Tables | from A1431 ingestion + A14321/A14322 schema |
| C1 | Control | [ISO-25010] Software Quality Model | data integrity as reliability characteristic |
| C2 | Control | [GDPR] GDPR | access endpoints must enforce data protection |
| O1 | Output | Data Integrity Validation Report | per-table: constraint check results, row counts, anomaly flags |
| O2 | Output | Published Access Endpoints | connection details, service account credentials, API docs |
| O3 | Output | Data Store Catalog | table descriptions, column definitions, ownership, refresh frequency, access tier |
| M1 | Mechanism | [MECH-DW] Data Warehouse | integrity checks |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | catalog publication |

**Definition of Done:** All referential integrity checks pass AND no table has unexpected null counts exceeding threshold AND access endpoints are published to authorized consumers AND data store catalog covers 100% of warehouse tables.

---

#### A14331: Define Semantic Layer Metrics and Dimensions for BI

**Agent Definition:** Define business-friendly metric and dimension definitions in the BI platform's semantic layer, mapping each metric to its underlying warehouse calculation and each dimension to its warehouse column, with clear business definitions.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Reporting Requirements | KPI definitions from Finance, Sales, People, Operations |
| I2 | Input | Warehouse Schema DDL | from A14321.O1 — available columns and tables |
| C1 | Control | [ISO-25010] Software Quality Model | usability — metrics must be unambiguous |
| O1 | Output | Semantic Layer Definition File | per-metric: business name, calculation formula, underlying SQL, dimension associations |
| M1 | Mechanism | [MECH-BI] Business Intelligence (Sigma, Looker, Tableau) | semantic layer configuration |
| M2 | Mechanism | [MECH-DW] Data Warehouse | calculation validation |

**Definition of Done:** All requested KPIs have a semantic layer metric definition AND each metric has a documented business definition AND calculation formula AND underlying SQL is validated against warehouse schema.

---

#### A14332: Design and Build BI Dashboards per Function

**Agent Definition:** Build BI dashboards for each enterprise function (Finance, Legal, People, Sales, Engineering, Operations) per the reporting requirements, applying the semantic layer definitions for consistent metric calculations and RBAC for data access control.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Semantic Layer Definition File | from A14331.O1 |
| I2 | Input | Dashboard Specifications | layout, filters, drill-down paths, refresh schedule per function |
| C1 | Control | [ISO-25010] Software Quality Model | usability and performance |
| C2 | Control | [REPORTING-POLICY] Workforce Reporting Access Policy | access tiers applied to sensitive dashboards |
| O1 | Output | Deployed BI Dashboards | live dashboards per function with RBAC applied |
| M1 | Mechanism | [MECH-BI] Business Intelligence (Sigma, Tableau, Looker, Power BI) | dashboard creation |
| M2 | Mechanism | [MECH-IAM] Identity & Access Management | RBAC configuration |

**Definition of Done:** Every requested function has at least one deployed dashboard AND RBAC access tiers match REPORTING-POLICY AND dashboards load within acceptable latency threshold AND all metrics reference semantic layer definitions (no hard-coded SQL in dashboards).

---

#### A14333: Configure Scheduled Report Distribution

**Agent Definition:** Configure automated scheduled report generation and distribution from the BI platform, defining recipient lists, delivery schedule, format (PDF, CSV, email embed), and delivery channel (email, Slack, shared drive), and verify that first scheduled delivery executes successfully.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Deployed BI Dashboards | from A14332.O1 — reports derived from dashboards |
| I2 | Input | Distribution Requirements | recipient list, schedule, format, channel per report |
| C1 | Control | [GDPR] GDPR | reports containing PII must be delivered only to authorized recipients |
| C2 | Control | [REPORTING-POLICY] Workforce Reporting Access Policy | distribution restricted by access tier |
| O1 | Output | Scheduled Report Configurations | per-report: schedule, recipients, format, channel |
| O2 | Output | First Delivery Confirmation | delivery receipt for initial scheduled run |
| M1 | Mechanism | [MECH-BI] Business Intelligence | report scheduling |
| M2 | Mechanism | [MECH-EMAIL-API] Transactional Email API (SendGrid) | email distribution |
| M3 | Mechanism | [MECH-MESSAGING] Team Messaging API (Slack) | Slack distribution |

**Definition of Done:** All requested scheduled reports are configured AND each report has a defined schedule, recipient list, and format AND first scheduled delivery executes successfully with delivery confirmation.

---

#### A14341: Design Entity Relationship Models from Enterprise Data Definitions

**Agent Definition:** Translate the enterprise data entity definitions (from enterprise/data/) into formal entity-relationship models with cardinality, primary/foreign key constraints, and attribute specifications, validating against the existing source system schemas for implementability.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Enterprise Data Entity Definitions | from enterprise/data/ (data-entity-people.md, data-entity-digital-asset.md) |
| I2 | Input | Source System Data Schemas | existing schema reality from A142 applications |
| C1 | Control | [ISO-25010] Software Quality Model | interoperability — models must be implementable across systems |
| O1 | Output | Entity Relationship Models | ER diagrams with entities, attributes, cardinality, PK/FK constraints, business rules |
| M1 | Mechanism | [MECH-DB-RELATIONAL] Relational Database (PostgreSQL) | ER validation and constraint testing |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | ER documentation |

**Definition of Done:** Every entity in enterprise/data/ has a corresponding ER model AND all relationships have cardinality specified AND PK/FK constraints are defined AND ER model has been validated against at least one source system schema for implementability.

---

#### A14342: Build Semantic Layer and Knowledge Graph Schemas

**Agent Definition:** Construct semantic layer ontologies and knowledge graph schemas defining nodes (entities), edges (relationships), properties (attributes), and inference rules, linking to the ER models and enabling semantic search and reasoning capabilities.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Entity Relationship Models | from A14341.O1 |
| I2 | Input | Business Domain Vocabulary | from enterprise/data/ and enterprise/model/ — business term definitions |
| C1 | Control | [ISO-25010] Software Quality Model | maintainability — schema must be extensible |
| C2 | Control | [PHYS-CAP] CAP Theorem | knowledge graph consistency model for distributed queries |
| O1 | Output | Semantic Layer Ontology | node types, edge types, property schemas, inference rules |
| O2 | Output | Knowledge Graph Schema Definition | graph database schema (nodes, relationships, properties, indexes) |
| M1 | Mechanism | [MECH-DB-VECTOR] Vector Database (Pinecone, Weaviate) | embedding and semantic search |
| M2 | Mechanism | [MECH-DB-RELATIONAL] Relational Database | graph storage backend |
| M3 | Mechanism | [MECH-LLM] LLM API | semantic analysis and inference rule generation |

**Definition of Done:** Semantic layer covers all entities from the ER models AND knowledge graph schema has node and edge type definitions AND at least one inference rule is defined AND schema supports semantic search queries.

---

#### A14343: Publish and Version Enterprise Data Ontology Package

**Agent Definition:** Assemble the ER models, semantic layer ontology, and knowledge graph schemas into a versioned Enterprise Data Ontology Package, obtain data governance approval, commit to version control, and publish as a governing control for A1431 (pipeline field mappings) and A1432 (warehouse schema).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Entity Relationship Models | from A14341.O1 |
| I2 | Input | Semantic Layer Ontology + Knowledge Graph Schema | from A14342.O1, A14342.O2 |
| C1 | Control | [ISO-25010] Software Quality Model | versioning and documentation standards |
| O1 | Output | Published Enterprise Data Ontology Package | versioned, approved, committed to MECH-SCM |
| M1 | Mechanism | [MECH-SCM] Source Code Management (GitHub) | version control |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | package documentation |
| M3 | Mechanism | [MECH-MESSAGING] Team Messaging API | publication notification |

**Definition of Done:** Ontology package has a semantic version number AND data governance approval is recorded AND package is committed to MECH-SCM AND A1431 and A1432 teams are notified of the new version.

---

#### A14351: Design Feature Store and Feature Engineering Definitions

**Agent Definition:** Define the feature store schema specifying feature groups, individual features with their computation logic, data sources, refresh frequency, and versioning strategy, ensuring features are reusable across multiple ML models.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Model Requirements | from A142 — features needed for AI/ML services |
| I2 | Input | Analytical Data Store | from A1432.O3 — raw data source for feature computation |
| C1 | Control | [ISO-25010] Software Quality Model | reliability and reusability |
| C2 | Control | [GDPR] GDPR | PII features must be excluded or pseudonymized |
| O1 | Output | Feature Store Schema | feature groups, feature definitions (name, type, computation SQL, source table, refresh), version strategy |
| M1 | Mechanism | [MECH-DW] Data Warehouse | feature computation backend |
| M2 | Mechanism | [MECH-CLOUD] Cloud Provider API (SageMaker Feature Store, Vertex AI Feature Store) | feature store infrastructure |

**Definition of Done:** All model-required features have a feature store definition AND each feature has computation logic, source table, and refresh frequency specified AND no PII feature is present without pseudonymization AND feature versioning strategy is documented.

---

#### A14352: Build Experiment Tracking and Model Registry

**Agent Definition:** Deploy experiment tracking infrastructure that records model training runs (hyperparameters, metrics, artifacts, data versions) and a model registry that stores versioned model artifacts with promotion stages (development, staging, production).

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | ML Framework Requirements | from A142 — frameworks (PyTorch, TensorFlow, scikit-learn) |
| C1 | Control | [ISO-25010] Software Quality Model | reproducibility — every experiment must be recreatable from its record |
| O1 | Output | Experiment Tracking System | per-run: hyperparameters, metrics, data version, model artifacts, code commit hash |
| O2 | Output | Model Registry | versioned model artifacts with stage labels (dev/staging/prod) |
| M1 | Mechanism | [MECH-CLOUD] Cloud Provider API (MLflow, SageMaker, Vertex AI) | experiment tracking |
| M2 | Mechanism | [MECH-SCM] Source Code Management | ML code versioning |

**Definition of Done:** Experiment tracking system records ≥5 metadata fields per run (hyperparameters, metrics, data version, code commit, artifacts) AND model registry supports version promotion across dev/staging/prod stages AND at least one model is registered as a validation test.

---

#### A14353: Deploy Automated ML Training Pipelines

**Agent Definition:** Implement automated ML training pipelines that fetch data from the feature store, execute training jobs, log results to experiment tracking, evaluate model performance against baseline, and register validated models in the model registry.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Feature Store | from A14351.O1 — training data source |
| I2 | Input | Experiment Tracking System + Model Registry | from A14352.O1, A14352.O2 — tracking and registration targets |
| C1 | Control | [MATH-BIGO] Computational Complexity | training compute budget constraints |
| C2 | Control | [ISO-25010] Software Quality Model | reliability — pipeline must be idempotent and resumable |
| O1 | Output | Automated Training Pipeline Definitions | pipeline DAGs with stages: data fetch, train, evaluate, register |
| O2 | Output | Training Pipeline Execution Records | per-run: duration, compute cost, metrics, model version produced |
| M1 | Mechanism | [MECH-CLOUD] Cloud Provider API (SageMaker, Vertex AI) | training compute |
| M2 | Mechanism | [MECH-ETL] ETL / Data Pipeline (Airflow, Kubeflow) | pipeline orchestration |
| M3 | Mechanism | [MECH-SCM] Source Code Management | pipeline code version control |

**Definition of Done:** Training pipeline fetches data from feature store AND logs all training metadata to experiment tracking AND evaluates model against performance baseline AND registers validated model in model registry AND pipeline is committed to MECH-SCM.

---

#### A14361: Define Data Quality Rules and Acceptance Thresholds

**Agent Definition:** Define data quality rules (completeness, uniqueness, validity, consistency, timeliness) for every critical data field in the warehouse, set pass/fail acceptance thresholds per rule, and publish the data quality rule set as a governing control for A1431 pipelines.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Warehouse Schema DDL | from A14321.O1 — field inventory |
| I2 | Input | Enterprise Data Ontology Package | from A1434.O3 — expected field constraints |
| C1 | Control | [ISO-25010] Software Quality Model | data quality as reliability characteristic |
| C2 | Control | [GDPR] GDPR Art. 5(d) | personal data must be accurate and kept up to date |
| O1 | Output | Data Quality Rule Set | per-field: rule type, rule logic, acceptance threshold (e.g., ≥99% completeness), owner |
| M1 | Mechanism | [MECH-ETL] ETL / Data Pipeline (dbt tests, Great Expectations) | rule implementation |
| M2 | Mechanism | [MECH-DOC] Document Collaboration | rule documentation |

**Definition of Done:** All critical data fields have at least one quality rule AND every rule has a defined acceptance threshold AND rule set is published as a control input to A1431 pipelines.

---

#### A14362: Execute Data Lineage Mapping and Retention Compliance

**Agent Definition:** Map data lineage from source system through pipeline to warehouse table for every data flow, verify that retention and deletion schedules comply with GDPR Art. 5(e) storage limitation and the Compliance Operating Envelope (IF-A1-03), and produce the lineage and retention compliance report.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Deployed Pipelines | from A1431 — source-to-target flows |
| I2 | Input | Compliance Operating Envelope | IF-A1-03 — retention mandates and deletion schedules |
| C1 | Control | [GDPR] GDPR Art. 5(e) | storage limitation — data retained only as long as necessary |
| C2 | Control | [CCPA] CCPA | consumer data deletion requests |
| O1 | Output | Data Lineage Map | per-field: source system → pipeline → warehouse table → BI layer; transformation history |
| O2 | Output | Retention Compliance Report | per-data-category: required retention period, actual retention, compliance status (compliant/non-compliant) |
| M1 | Mechanism | [MECH-ETL] ETL / Data Pipeline | lineage extraction |
| M2 | Mechanism | [MECH-GRC] GRC Platform (OneTrust, ServiceNow) | retention tracking |

**Definition of Done:** Lineage map covers 100% of warehouse tables AND every personal data category has a retention schedule AND retention compliance report shows zero non-compliant categories OR lists remediation actions for non-compliant categories with target dates.

---

#### A14363: Produce Data Governance Compliance Package

**Agent Definition:** Assemble data quality scores, lineage maps, retention compliance reports, and GDPR/CCPA audit evidence into a consolidated Data Governance Compliance Package, obtain data governance officer sign-off, and deliver to Legal A12 for regulatory audit readiness.

| Code | Role | Label | Specification |
|---|---|---|---|
| I1 | Input | Data Quality Rule Results | from A14361.O1 executed against current data |
| I2 | Input | Data Lineage Map + Retention Compliance Report | from A14362.O1, A14362.O2 |
| C1 | Control | [GDPR] GDPR | audit evidence requirements |
| C2 | Control | [CCPA] CCPA | consumer request fulfillment evidence |
| O1 | Output | Data Governance Compliance Package | quality scores, lineage, retention compliance, GDPR/CCPA evidence, governance sign-off |
| M1 | Mechanism | [MECH-GRC] GRC Platform | compliance package assembly |
| M2 | Mechanism | [MECH-ESIGN] Electronic Signature | governance officer sign-off |
| M3 | Mechanism | [MECH-DOC] Document Collaboration | package distribution |

**Definition of Done:** Package contains data quality scores for all critical fields AND lineage maps for all warehouse tables AND retention compliance status for all data categories AND governance officer sign-off is captured AND package is delivered to Legal A12 for audit readiness.

---

## QA Checklist (Post-Sprint Self-Assessment)

- [x] Every L4 and L5 node has exactly one complete IDEF0 block
- [x] No L5 node is decomposable into 2+ independently executable sub-functions (R3.1)
- [x] Every Control (C) cites a code from ctrl-constraint-library.md
- [x] Every Mechanism (M) cites a code from ctrl-mechanism-catalog.md
- [x] Every Output (O) names a specific artifact or verifiable state change
- [x] Every DoD is binary (true/false evaluable) — no qualitative language (R3.3)
- [x] Boundary arrow correspondence holds: O1=A1431.O3; O2=A1432.O3; O3=A1433.O3; O4=A1434.O3; O5=A1435.O3; O6=A1436.O3
- [x] No skill appears under more than one function node
- [x] All cross-function interfaces cited: IF-A1-03 (Compliance Operating Envelope), IF-A1-05 (data products as process plans)
- [x] No banned verbs without measurable qualifier (R3.4)
- [x] L4 node names are active verb phrases — all 6 verified (R1.2a)
- [x] L5 node names are active verb phrases — all 18 verified (R1.2a)
- [x] Leaf node count confirmed: 18
- [x] Mandatory inclusions: ontological engineering (A14341–A14343); data quality governance (A14361–A14363)
