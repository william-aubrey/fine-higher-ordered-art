# Agent Instantiation Process (AIP) — Process Guide

**IDEF0 Role:** Mechanism (executes the agent instantiation function at the instance level)
**Authority:** C3PO enterprise standard. Applies to all instance CAOs.
**Owner:** CAO
**Location:** `agents/cao/processes/agent-instantiation-process.md`
**Origin:** Proposed by TCC CAO (2026-03-22), accepted and canonicalized by C3PO.

---

**Purpose:** A methodology for creating an operational agent from the enterprise agent roster. The CAO reads the enterprise IDEF0 function decomposition, traces the target agent's role in the model, derives ownership and work products, and produces the agent's operational folder with a seeded backlog.

**Audience:** Instance CAOs performing agent instantiation. The process is agent-agnostic and instance-agnostic — it applies to any of the 9 CXO agents (or infrastructure agents like the Librarian) in any C3PO instance.

**Prerequisite:** The enterprise IDEF0 function decomposition must be available locally in `company/process/functions/`. Without it, Steps 2 and 3 operate at reduced fidelity — parent-level inference rather than leaf-level lookup.

---

## The 7-Step Process

### Step 1: Verify Role in Enterprise Context

Read `company/process/controls/ctrl-enterprise-context.md` §5 (Agent Roster). Confirm the target agent exists with a defined mandate, IDEF0 position, success criteria, and kill criteria.

**Output:** Agent identity confirmed (e.g., P5 — CMO-Agent, Mechanism for A31 Brand & Product Management).

### Step 2: Trace IDEF0 Ownership

Read the enterprise function decomposition in `company/process/functions/`. Find every node where the target agent appears as an **M-arrow** (Mechanism). Record the node ID, function name, and level (parent or leaf).

Then read the instance model (`agents/cao/products/instance-model.md`). Find the same nodes at the instance level. Record any instance-specific M-arrow assignments or ICOM customizations.

**Output:** Complete list of IDEF0 nodes this agent participates in, at both enterprise and instance levels.

### Step 3: Derive Work Products

For each node identified in Step 2, read the **O-arrows** (Outputs). These are the agent's work products — the artifacts they produce.

Trace each O-arrow to its downstream consumer: which function receives it as an I-arrow (Input) or C-arrow (Control)? This mapping defines the agent's contribution to the system — what they produce and who depends on it.

**Output:** Work product inventory with downstream consumer mapping.

### Step 4: Map Repo Footprint

Using the outputs from Steps 2 and 3, determine the agent's complete footprint in the repository:

| Aspect | Location | Derived from |
|---|---|---|
| Operational state | `agents/cXo/cXo-tasks.md` | Convention |
| Processes | `agents/cXo/processes/` | Step 2 — leaf nodes where agent is sole M-arrow |
| Products | `agents/cXo/products/` | Step 3 — O-arrows of owned nodes |
| Governance (read) | `company/process/controls/` | Enterprise context mandate |
| Enterprise functions (read) | `company/process/functions/` | Step 2 — referenced skill files |

**Output:** Repo footprint map for the agent.

### Step 5: Create Agent Folder

Create the standard agent folder structure:

```
agents/cXo/
├── cXo-tasks.md
├── processes/      (created empty — populated as agent begins work)
└── products/       (created empty — populated as agent produces artifacts)
```

Seed `cXo-tasks.md` with:
- Backlog items derived from the work products identified in Step 3
- Any items migrated from other agents in Step 6
- Blocked items (dependencies on other agents or the Principal)

### Step 6: Migrate Existing Tasks

Scan all existing agent task files (`agents/*/cXo-tasks.md`) and the Principal backlog (`TASKS.md`) for items that fall within the new agent's domain. Transfer ownership of any items that belong to the new agent's IDEF0 nodes.

**Output:** Tasks migrated with source attribution.

### Step 7: CAO Review — Ownership Validation

The CAO validates the instantiation:

- [ ] No IDEF0 node is owned by two agents without explicit shared-ownership documentation
- [ ] All M-arrow assignments in the instance model are consistent with the enterprise model
- [ ] The agent's work products do not overlap with another agent's products
- [ ] If shared ownership exists (e.g., CPO and CMO on A31), the leaf-node split is documented

If shared ownership is detected and cannot be resolved from the enterprise decomposition, flag it as an open question for C3PO.

**Output:** Validated agent instantiation, or flagged ownership conflicts.

---

## The Ownership Document

The instantiation process produces an **agent ownership document** stored in `agents/cXo/products/`. This document is the bridge between the enterprise model and the agent's operational folder. It records:

- Agent identity and enterprise context reference
- IDEF0 nodes owned (with leaf/parent distinction)
- Work products produced (O-arrows) and their downstream consumers
- Governance controls obeyed (C-arrows from enterprise context)
- Shared ownership notes (if applicable)

The ownership document is maintained by the CAO and updated when the instance model changes.

---

## Relationship to Other Methodologies

| Methodology | Relationship |
|---|---|
| `spec-driven-development.md` | SDD governs how products are specified. AIP governs how the agents who build those products are created. AIP runs first — you need agents before they can run SDD. |
| `publication-authoring-process.md` | PAP is a CAO methodology for authoring publications. AIP might instantiate an agent who then uses PAP. |
| Sprint lifecycle (`/sprint`) | Agent instantiation typically happens within a sprint. The reasoning log captures the IDEF0 trace and ownership decisions. |

---

*This methodology was proposed by the TCC CAO during CMO instantiation (2026-03-22) and accepted by C3PO as a universal enterprise standard. The TCC CAO discovered the gap when it could not resolve leaf-node agent ownership without the enterprise function decomposition.*
