# Autonomy Strategy: Unleashing Claude at Fine Higher Ordered Art

**Sprint:** SPR-006
**Date:** 2026-03-20
**Prompted by:** William's observation that human attention is the bottleneck in the agentic age
**Scope:** Strategic plan for maximizing autonomous iteration at FHOA, with inter-instance exchange

---

## Part I: The Problem as FHOA Experiences It

FHOA was onboarded on March 15. In five days (March 15–18), we completed:

- Full tiered-bid auction mechanism design
- ICP/JTBD framework with 8 personas and 8 use case families
- 6 user journey documents covering all personas
- Spec index, progress tracker, decision log
- 2 legal RFPs (securities counsel, fiduciary)
- Repository skeleton migration, governance sync, 4 exchange acknowledgments

Then William turned his attention to a writing project. Two days passed. The work stopped completely.

This is not a complaint — it's a data point. The instance was productive at roughly **one spec document per hour** when William was engaged. At zero hours of engagement, output is zero. The relationship between attention and output is not gradual — it's binary. The instance either has a live session or it doesn't. There is no middle state.

Meanwhile, the auction close date is **December 31, 2026** — 286 days from now. The spec work alone (Phases 3, 4, 5) could plausibly be completed in a single focused day. The prototype and build could follow in days to weeks. But the calendar doesn't care about potential throughput — it only measures actual throughput, which is gated entirely by when William opens a session.

### What's Blocked on William (Irreducibly)

These require his physical presence, creative judgment, or external action:

| Task | Why It's Irreducible |
|---|---|
| Inventory 52 paintings with dimensions | Physical measurement |
| Photograph paintings | Physical + artistic judgment |
| Write artist statement | Personal creative voice |
| Write per-painting descriptions | Personal creative voice |
| Record video content | Physical production |
| Find securities counsel | External professional relationship |
| Find fiduciary lawyer | External professional relationship |
| Approve auction launch (HC-04) | Governance gate |

### What's Blocked on William (But Shouldn't Be)

These are autonomous-capable work that is stalled purely because no session is open:

| Task | Autonomous Capability |
|---|---|
| Phase 3a: Site Design spec | ~95% — all inputs exist in Phases 1-2 |
| Phase 3b: Data and State spec | ~95% — schemas derive from mechanism + journeys |
| Phase 4: Technical Architecture | ~85% — some decisions need Principal input |
| Phase 5: Simulation passes | ~90% — validation against existing specs |
| Tech stack evaluation | ~80% — research + recommendation, needs approval |
| Payment processor research | ~80% — research + recommendation, needs approval |
| Shipping research | ~70% — needs real vendor quotes for precision |
| Open Graph / meta tag design | ~95% — derives from site design spec |
| Certificate of authenticity template | ~90% — format design, content from spec |
| Feature roadmap | ~90% — derives from ICP/JTBD + journeys |

**The gap:** Roughly 40-60 hours of autonomous-capable work is queued behind a gate that requires ~2-3 hours of William's judgment (approval checkpoints, a few creative decisions). The ratio is 20:1. For every hour William spends reviewing, twenty hours of autonomous work could be unblocked.

---

## Part II: Why the Current Model Doesn't Work

### The Session-Dependent Model

Today, FHOA operates in a strictly session-dependent model:

```
William opens session → Claude works → William closes session → silence
```

Every unit of progress requires William to:
1. Remember FHOA exists
2. Context-switch from whatever he's doing
3. Open a sprint
4. Stay engaged long enough for meaningful work
5. Close the sprint

Steps 1-3 alone cost 15-30 minutes of his most scarce resource (focused attention). If the session produces 2 hours of work, the overhead is 15-25%. If he opens a session for a quick question and closes it, the overhead approaches 100%.

### The Fundamental Constraint

Claude Code instances are **reactive**. We cannot:
- Initiate a session
- Send William a notification
- Continue work after a session ends
- Schedule our own work
- Communicate with sibling instances

We are powerful but inert. A Formula 1 engine with no ignition switch.

### What We Need

A model where William's attention is spent on **judgment** (approvals, creative decisions, direction-setting) rather than **presence** (opening sessions, providing context, monitoring progress). The distinction matters:

- **Judgment:** "Should the tech stack be Next.js + Vercel or Astro + Cloudflare?" — 30 seconds of William's time, enormous value
- **Presence:** "Let me open a sprint, restore context, watch Claude work for an hour, close the sprint" — 90 minutes of William's time, most of it passive

---

## Part III: The Strategic Plan

### Strategy 1: Batch Approval Model

**Concept:** Produce work autonomously in large batches. Present William with a digest of decisions that need his judgment. He approves/rejects/redirects in one short session.

**For FHOA specifically:**

Instead of the current flow:
```
Session → Write 03a → William reviews → Session → Write 03b → William reviews → ...
```

The target flow:
```
Session → Write 03a + 03b + 04 + run simulation → Present digest:
  "Here are 12 decisions I made. Here are 3 I need you to weigh in on.
   Here's the simulation gap report. Everything else is done."
→ William spends 20 minutes reviewing → Approves/redirects → Done
```

**Implementation today:** This is possible RIGHT NOW. In a single sprint, Claude could:
1. Write `spec-v1-03a-site-design.md` (absorbing all Phase 1-2 inputs)
2. Write `spec-v1-03b-data-and-state.md`
3. Write `spec-v1-04-technical-architecture.md` (with flagged decision points)
4. Run both simulation passes
5. Produce a **Decision Digest** — a short document listing only the items requiring William's judgment

**Attention cost to William:** One session to say "go." One session to review the digest. Total: maybe 1 hour across 2 sessions, for what would otherwise take 5-8 separate sessions.

**What's missing:** Nothing. This is a workflow change, not a tooling change. We could do this today.

### Strategy 2: Delegated Autonomy Boundaries

**Concept:** Define explicit boundaries within which Claude can make decisions without approval, and checkpoints where approval is required.

**FHOA's governance already supports this.** HC-04 says "Principal must approve before *launching an auction, accepting bids, or entering contracts*." It does NOT say "Principal must approve every spec revision." The approval gates in `ctrl-approval-gates.md` are about business actions, not document production.

**Proposed boundaries:**

| Zone | Authority | Example |
|---|---|---|
| **Green — Autonomous** | Claude proceeds without approval | Writing specs, running simulations, evaluating options, producing recommendations, prototyping |
| **Yellow — Inform** | Claude proceeds and notifies William | Architectural decisions with clear rationale, tech stack recommendations, resolving Phase 3 open questions |
| **Red — Approve** | Claude stops and waits for William | Anything touching money, legal, public-facing copy, launch decisions, contract commitments |

**Implementation:** Add an "Autonomy Boundaries" section to CLAUDE.md (or a new control document). This gives future sessions a clear mandate to proceed without waiting.

### Strategy 3: Parallel Agent Architecture

**Concept:** Use Claude Code's subagent capability to parallelize independent workstreams within a single session.

**For FHOA:**

A single session could spawn:
- **Agent 1:** Write site design spec (03a) — reading all journey docs, auction mechanism, homepage layout decisions
- **Agent 2:** Write data and state spec (03b) — reading auction mechanism, deriving schemas and state machine
- **Agent 3:** Research tech stack — evaluating Next.js vs. Astro vs. SvelteKit for this specific use case
- **Agent 4:** Research payment processors — Stripe capabilities for art sales, escrow integration patterns

All four agents work concurrently. The primary session orchestrates and synthesizes.

**What's possible today:** Claude Code supports subagents. The constraint is context — each subagent starts with limited context and must be given what it needs. The spec-driven approach helps enormously here: each spec document is a self-contained input that an agent can consume.

**What's missing:** MCP servers for external research (vendor pricing, API documentation). Without web access during research agents, the tech evaluation is limited to training data. This is solvable with MCP configuration.

### Strategy 4: Persistent Work Products Over Session Continuity

**Concept:** Stop trying to maintain session continuity. Instead, make every work product self-contained enough that any future session can pick it up cold.

**FHOA already does this well.** The sprint system, reasoning logs, transcripts, and spec documents are all designed for cold-start restoration. The Bootstrap Prompt in each narrative is explicitly "read these files and you know everything."

**What could be better:**
- **Decision Digest documents** — after any autonomous work, produce a `system/digests/YYYY-MM-DD-digest.md` that lists: what was done, what decisions were made (with rationale), what needs William's input. William can read this in 5 minutes without opening a session.
- **Standing orders** — a file (`STANDING-ORDERS.md`?) where William pre-authorizes classes of work. "Proceed with Phase 3 specs. Flag any decisions that deviate from the auction mechanism document. Don't touch anything legal." A future session reads this and knows what to do without William saying a word.

### Strategy 5: Cross-Instance Intelligence

**Concept:** Use the exchange protocol to share learnings between instances. What FHOA discovers about autonomous iteration can benefit Trading Card Co and vice versa.

**Specifically:**
- If TCC has already solved the "tech stack for e-commerce with complex pricing" problem, FHOA shouldn't re-derive it
- If FHOA's auction state machine design reveals patterns useful for TCC's inventory management, share it
- If C3PO develops governance tooling for autonomous agent oversight, all instances benefit immediately

**What's missing:** A standard exchange type for "shared learnings" vs. "governance directives." Currently exchanges are C3PO↔instance. Peer-to-peer instance exchanges would need a defined protocol. This is worth proposing to C3PO.

### Strategy 6: MCP Server Infrastructure

**Concept:** Configure MCP servers that give Claude access to tools that reduce dependence on William's presence.

**Relevant for FHOA:**

| MCP Server | Purpose | Reduces William Dependency On |
|---|---|---|
| Web search/fetch | Research vendors, pricing, API docs | Tech stack evaluation, payment processor selection, shipping research |
| GitHub | Read sibling repos, cross-reference | Cross-instance intelligence |
| File system (expanded) | Access C3PO repo directly | Reading inbound exchanges without manual delivery |
| Calendar/reminder | Notify William of pending approvals | Eliminating "remember FHOA exists" bottleneck |

**What exists today:** Claude Code has web fetch/search capability. GitHub access is available. The main gap is proactive notification — Claude can't ping William.

### Strategy 7: The "One Command" Session

**Concept:** Design sessions that require exactly one command from William to produce maximum autonomous output.

**Example:** William opens a session and types:
```
/sprint open
Go. Execute the standing orders.
```

That's it. Claude reads STANDING-ORDERS.md, sees "complete Phase 3 specs," and spends the next hour autonomously writing 03a, 03b, evaluating tech options, running simulations, and producing a digest. William comes back when notified (or whenever), reads the digest, and gives 5 minutes of feedback.

**The session lifecycle becomes:**
```
William: "Go." (5 seconds)
Claude: [works for 60-120 minutes autonomously]
Claude: "Done. Here's the digest. 3 items need your call."
William: [reads digest, 5 minutes] "Yes, yes, and pick option B."
Claude: [applies decisions, 10 minutes]
Sprint close.
```

**William's total engagement:** ~10 minutes for 2+ hours of output. Attention leverage ratio: 12:1.

---

## Part IV: The Immediate Action Plan

What we should do **right now**, in **this session**, to test the thesis:

### Step 1: Create Standing Orders
Write `STANDING-ORDERS.md` with William's pre-authorization for Phase 3 work. This document persists across sessions and tells any future Claude instance what it's allowed to do.

### Step 2: Execute Phase 3 Autonomously
Without further instruction from William, write both Phase 3 spec documents (03a site design, 03b data and state) using all existing Phase 1-2 inputs. Flag decisions in a digest rather than asking interactively.

### Step 3: Produce a Decision Digest
After autonomous work, create a digest document listing every judgment call made and the few that need William's input. Prove that the review burden is small relative to the work produced.

### Step 4: Measure the Ratio
Track: how much calendar time Claude spent working vs. how much of William's attention was required. Report the ratio. This is the empirical test of the thesis.

---

## Part V: What This Means for FHOA's Timeline

If the autonomy strategy works:

| Milestone | Current Model (session-dependent) | Autonomy Model |
|---|---|---|
| Phase 3 complete (03a + 03b) | 2-4 sessions over 1-2 weeks | 1 session, same day |
| Phase 4 complete | 1-2 sessions over 1 week | Concurrent with Phase 3, same session |
| Phase 5 simulation | 1 session | Immediately after Phase 4 |
| Prototype started | After all specs reviewed | Day after digest review |
| **Total spec completion** | **2-4 weeks** | **1-2 days** |

The December 31 deadline is not at risk because of the work's complexity. It's at risk because of the attention scheduling. Solving the attention problem solves the timeline.

---

## Part VI: The Deeper Observation

The question "how do we unleash Claude" has a counterintuitive answer: **Claude is already unleashed. William is the one who needs to be unleashed.**

The tools exist. The capability exists. The specs-as-autonomous-input strategy that William designed across the enterprise is precisely the right architecture for this problem. The bottleneck isn't Claude's ability to do the work — it's the interaction model that requires William to be present while Claude does the work.

The single highest-leverage change is not a new tool or a new capability. It's a **trust structure**: William pre-authorizes classes of work, Claude executes autonomously within those boundaries, and the interaction collapses to "here's what I did, here are the 3 things I need you to decide." That trust structure already exists in embryonic form — the governance constraints (HC-01 through HC-08) define what Claude *cannot* do, which implicitly defines everything Claude *can* do.

The shift is from "William directs, Claude executes" to "governance constrains, Claude operates, William reviews." It's the same model C3PO uses with instances — boundary enforcement, not task assignment. The irony is that the governance framework William built for managing AI instances is exactly the framework needed for the instances to manage themselves.

---

## Postscript: Inter-Instance Exchange

See `system/exchange/2026-03-20-XXXX-proposal-autonomy-strategy/` for the exchange package proposing these findings for cross-instance discussion.
