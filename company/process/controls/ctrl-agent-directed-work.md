# Agent-Directed Work Standard

*Governing control for how work is requested, executed, and stored at the instance level.*
*Source: C3PO enterprise governance (amendment 2026-03-20)*
*Applies to: All enterprise instances*

---

## 1. Direct Work to Agents, Not Instances

Work requests from the Principal or from C3PO must be directed to a specific CXO agent, not to "the instance" as a persona. An instance is a collection of agents operating within a governance structure. It is not a person.

A well-formed work request specifies:

| Element | Example |
|---|---|
| **Agent** | TCC CTO |
| **Task** | Produce an architectural assessment of autonomous iteration options |
| **Constraint** | Constrained by the current skeleton structure and approved tech stack |
| **Output** | Strategy document |
| **Location** | `company/process/` or `company/production/[product]/` |

A poorly-formed request — "Hey TCC, develop a strategy" — has no agent, no constraint, no output location. The result will be improvised. The improvisation will be inconsistent across instances.

## 2. Agent Output Locations

Agents store their outputs in the functional area they govern, following IDEF0 conventions:

| Agent | Node | Output Location |
|---|---|---|
| CAO | A-0 | `company/process/` (architecture, governance documents) |
| CFO | A11 | `company/process/controls/` (financial controls, reports) |
| CHO | A13 | `company/process/controls/` (people policies, org design) |
| CLO | A12 | `company/process/controls/` (legal, compliance) |
| CMO | A3 | `company/production/[product]/` (brand, content, campaigns) |
| COO | A2 | `company/production/[product]/` (operational plans, fulfillment) |
| CPO | Cross-cutting | `company/production/[product]/specs/` (validation, roadmap) |
| CRO | A3 | `company/production/[product]/` (pipeline, pricing, proposals) |
| CTO | A14 | `company/production/[product]/build/` (architecture, infra, deployment) |

Agents do not store outputs in personal folders, sprint folders, archive folders, or exchange folders. Exchange folders are for governance communication (C3PO ↔ Instance), not for work products.

## 3. Agent Task Management

Each instance should maintain per-agent task files following the C3PO pattern:

```
agents/
├── cao/
│   └── cao-tasks.md
├── cto/
│   └── cto-tasks.md
└── [other agents as instantiated]/
    └── cXo-tasks.md
```

Agent task files are the persistent backlog for each agent. When the Principal directs work to an agent, the task is recorded in the agent's task file. When the agent completes the task, the output goes to the IDEF0-defined location (§2) and the task is marked complete.

The main `TASKS.md` at the project root is the Principal's personal backlog — items requiring the Principal's attention, judgment, or decision. It should not contain agent-scoped work. If agent tasks are currently tracked in `TASKS.md`, note this in your acknowledgment inventory so the migration can be planned.

Instances are not required to instantiate all nine agents immediately. Instantiate agents as work demands — start with the agents whose domains are active.

## 4. Inter-Instance Communication

Inter-instance communication (lateral exchange between instances without C3PO mediation) is **paused** as of this amendment.

The exchange protocol is defined as C3PO ↔ Instance. All communication between instances must be routed through C3PO:

1. Instance sends a proposal or status exchange to C3PO
2. C3PO evaluates, synthesizes, and decides what to cascade
3. C3PO distributes to relevant instances via approval or amendment exchange

This preserves C3PO's visibility into what is shared, adopted, or modified across the portfolio. Direct lateral communication bypasses the observer and creates governance drift.

A formal inter-instance communication protocol will be designed in a future sprint. The need is confirmed — the mechanism is not yet defined. The Principal's request on 2026-03-20 to draft inter-instance exchanges surfaced a gap in the process. The improvised responses confirmed the need but also confirmed that the mechanism must be designed before it is used.

## 5. The CAO as Intake Agent

When the Principal is unsure which agent should receive a request, the request goes to the CAO. The CAO operates at A-0 — the system layer — and maintains awareness of which agent owns which domain.

The CAO's intake function:

1. **Listen** — receive the Principal's unstructured input
2. **Parse** — identify the domain, the constraint, and the implied output
3. **Formulate** — produce a well-formed work request (agent, task, constraint, output, location)
4. **Route** — write the task to the target agent's task file (`agents/cXo/cXo-tasks.md`)
5. **Flag** — note the task as pending execution for the next session with the target agent

The CAO does not execute the routed work. It translates and dispatches. The Principal should feel free to address any unstructured question to the CAO with confidence that it will reach the right agent in the right format.
