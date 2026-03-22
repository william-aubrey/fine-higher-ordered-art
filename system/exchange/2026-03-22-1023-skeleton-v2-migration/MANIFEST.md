---
direction: C3PO → Fine Higher Ordered Art
type: amendment
date: 2026-03-22
---

## Purpose

Delivers the Universal Skeleton v2 migration to Fine Higher Ordered Art: full 10-agent folder structure with processes/ and products/ subfolders, enterprise IDEF0 function decomposition (30 skill files), CAO methodologies, all agent context files, librarian infrastructure, updated exchange skill, and a migration guide covering FHOA-specific adjudication decisions.

## Rationale

FHOA was onboarded under Universal Skeleton v1 (2026-03-15) with minimal agent folders (CLO, CTO only). Skeleton v2 standardizes all instances to have all 10 agents (9 CXO + Librarian) with processes/ and products/ subfolders, company/process/functions/ for the enterprise IDEF0 decomposition, and CAO methodologies in agents/cao/processes/. This migration brings FHOA to parity with the current enterprise standard.

The migration creates new structures and direct-places files without modifying any existing files in the FHOA repo. One file in company/process/mechanisms/ (spec-driven-development.md) is superseded by the direct-placed copy in agents/cao/processes/ — the migration guide recommends deletion but does not execute it.

## Contents

1. `ctrl-enterprise-context.md` — Latest enterprise context (2026-03-22); install to `company/process/controls/ctrl-enterprise-context.md`
2. `ctrl-instance-governance-standard.md` — Instance governance standard v2; install to `company/process/controls/ctrl-instance-governance-standard.md`
3. `migration-guide-fhoa.md` — FHOA-specific migration guide with adjudication decisions and next steps

## Direct Placement (hash-verified)

### Enterprise IDEF0 Decomposition → company/process/functions/

| File | Source | SHA-256 |
|---|---|---|
| skill-A111-fpa.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A112-accounting.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A113-tax.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A114-treasury.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A115-cost-accounting.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A116-audit.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A121-entity-governance.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A122-contract-lifecycle.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A123-regulatory-compliance.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A124-ip-portfolio.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A125-employment-labor.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A126-litigation.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A131-workforce-planning.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A132-talent-acquisition.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A1331-compensation-architecture.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A1332-benefits-administration.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A1333-payroll.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A1334-equity-lti-administration.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A134-learning-development.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A135-performance-management.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A136-employee-relations.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A141-technical-architecture-governance.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A142-software-platform.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A143-data-analytics-infrastructure.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A144-digital-asset-infrastructure.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A145-physical-embedded-systems.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A146-production-systems-operations.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A31-brand-product-management.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A32-marketing-channels.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |
| skill-A33-crm.md | enterprise/production/eaas/build/registry/ | _recorded at placement_ |

### CAO Methodologies → agents/cao/processes/

| File | Source | SHA-256 |
|---|---|---|
| spec-driven-development.md | agents/cao/processes/ | _recorded at placement_ |
| process-cao-build-process.md | agents/cao/processes/ | _recorded at placement_ |
| process-cao-self-recursive-c-suite-improvement.md | agents/cao/processes/ | _recorded at placement_ |
| agent-instantiation-process.md | agents/cao/processes/ | _recorded at placement_ |
| instance-instantiation-process.md | agents/cao/processes/ | _recorded at placement_ |
| publication-authoring-process.md | agents/cao/processes/ | _recorded at placement_ |

### Agent Context Files → agents/[cxo]/

| File | Target | SHA-256 |
|---|---|---|
| cao-context.md | agents/cao/ | _recorded at placement_ |
| cfo-context.md | agents/cfo/ | _recorded at placement_ |
| cho-context.md | agents/cho/ | _recorded at placement_ |
| clo-context.md | agents/clo/ | _recorded at placement_ |
| cmo-context.md | agents/cmo/ | _recorded at placement_ |
| coo-context.md | agents/coo/ | _recorded at placement_ |
| cpo-context.md | agents/cpo/ | _recorded at placement_ |
| cro-context.md | agents/cro/ | _recorded at placement_ |
| cto-context.md | agents/cto/ | _recorded at placement_ |
| librarian-context.md | agents/librarian/ | _recorded at placement_ |

### Librarian Infrastructure → agents/librarian/

| File | Target | SHA-256 |
|---|---|---|
| idef0.md | agents/librarian/products/library/build/standards/idef0/ | _recorded at placement_ |
| README.md | agents/librarian/products/library/prototype/deposits/ | _recorded at placement_ |
| process-youtube-video-analysis-v03.md | agents/librarian/processes/ | _recorded at placement_ |

### Updated Exchange Skill

| File | Target | SHA-256 |
|---|---|---|
| SKILL.md | .claude/skills/exchange/ | _recorded at placement_ |

## Required Actions

- [ ] Review migration-guide-fhoa.md for FHOA-specific adjudication decisions
- [ ] Delete `company/process/mechanisms/spec-driven-development.md` (superseded by `agents/cao/processes/spec-driven-development.md`)
- [ ] Decide on CLO library/ subfolder (see migration guide for options)
- [ ] Acknowledge receipt via exchange (type: acknowledgment)
