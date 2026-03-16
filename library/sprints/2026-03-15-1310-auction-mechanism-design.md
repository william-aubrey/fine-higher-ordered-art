# Auction Mechanism Design

**Date:** 2026-03-15
**Project:** Fine Higher Ordered Art

---

## Starting Point

FHOA was freshly onboarded from C3PO with governance documents, an SRS seed, and universal skills in place, but no product work had been done. The SRS seed (FR-2) called for a "tiered-bid auction" but left the mechanism entirely undefined — the tier structure, timing, reserve strategy, buyer experience, financial flows, and legal considerations were all blank. The task backlog had 15+ open items and the first recommended action was to define the auction mechanism.

## Summary

This sprint defined the complete tiered-bid auction mechanism for the Charlotte Collection — 52 paintings sold through a three-tier fixed-price system at $1, $10, and $100 per square inch. The session was a deep collaborative design conversation with William, starting from his stream-of-consciousness vision and progressively refining it through structured Q&A into a formal specification.

The core innovation is the outbid reward mechanic: when a bidder is outbid by a higher tier, they receive 50% of the spread between tiers at settlement. This transforms losing bidders into stakeholders who profit from the painting's upward trajectory. The mechanism also includes a Winner Takes All option (buy the entire collection plus all studio contents at the sum of next-tier-up prices), a single aggregate threshold (total bids must reach the sum of all Tier 1 prices or the auction cancels with full refunds), irrevocable paid bids into third-party escrow, and a target close date of December 31, 2026.

The spec went through several significant design iterations during the session — most notably the removal of the Grief Series constraint, which originally required all six large paintings to sell as a set. William worked through the attachment during the conversation and decided a single aggregate threshold was cleaner and sufficient. The formal spec is at `specs/auction-mechanism.md` with 5 remaining open questions, most requiring external action (legal counsel, fiduciary partner, painting inventory).

## Discoveries

### Discovery 1: The Grief Series Constraint Was Fighting Itself

The original design included an all-or-nothing rule for six thematically linked paintings. Each attempt to handle edge cases (cascade failures, high-aggregate nullification) added complexity without adding value. The conditional nullification at $345,600 was the signal — when a rule needs increasingly sophisticated exceptions, the rule is the problem. The aggregate threshold already prevented selling cheap.

**Consequence:** The Grief Series constraint was removed entirely. The spec simplified from two interacting thresholds with conditional logic to a single clean rule. The Grief Series became a narrative element on the website rather than a structural auction constraint.

### Discovery 2: The Tier Structure Naturally Segments the Market

The three tiers don't just set prices — they define entirely different buyer populations. A $16 Tier 1 bid on a 4"×4" painting and a $345,600 Tier 3 bid on a Grief painting come from fundamentally different people with different motivations. This means ICP/JTBD analysis maps directly onto the tier structure and should drive website UX, trust signals, and marketing strategy.

**Consequence:** ICP/JTBD was identified as the next A31 work item, with the tier structure providing a natural segmentation framework.

### Discovery 3: WTA Needs a Ceiling Rule

With only three tiers for individual bidding, the WTA option had no defined behavior when a painting reached Tier 3 (max). The 10× progression ($1 → $10 → $100) logically extends to $1,000/sq.in. as an implicit "Tier 4" available only through WTA. This keeps the system internally consistent and makes WTA appropriately expensive when Tier 3 bids exist — a 4"×4" painting at Tier 3 adds only $16,000 to WTA (noise), while a 6'×4' at Tier 3 adds $3,456,000 (serious money for serious commitment).

**Consequence:** WTA Tier 4 at $1,000/sq.in. was added to §7.4 of the spec, with worked examples for both small and large paintings.

## What Changed

### Files Created
| File | What it is |
|---|---|
| `exchange/2026-03-15-1004-acknowledgment-onboarding/MANIFEST.md` | Acknowledgment exchange to C3PO confirming onboarding package applied |
| `specs/auction-mechanism.md` | Complete tiered-bid auction mechanism specification |
| `library/sprints/2026-03-15-1310-auction-mechanism-design.md` | This narrative |
| `library/sprints/sprint-log.md` | Sprint log (first entry) |

### Files Modified
| File | What changed |
|---|---|
| `TASKS.md` | Marked completed tasks, added new tasks discovered during session |

## Key Decisions

1. **Single aggregate threshold instead of multiple rules.** The Grief Series constraint was removed in favor of one rule: total bids must reach the sum of all Tier 1 prices. Rationale: every additional structural rule added complexity to terms disclosure (HC-03), implementation, and legal review without meaningfully protecting the artist beyond what the aggregate threshold already provided.

2. **Outbid reward as a feature, not a risk to mitigate.** The incentive to bid early hoping to be outbid (and earn the reward) was explicitly embraced as the auction's distinctive value proposition rather than treated as shill bidding to prevent. Rationale: the reward mechanic IS the story — it gives every participant skin in the game and a reason to tell others about the auction.

3. **Implicit Tier 4 for WTA only.** Rather than blocking WTA when Tier 3 bids exist (Option A) or matching without reward (Option C), the 10× progression was extended one step to $1,000/sq.in. Rationale: internal consistency with the tier system, and the principle that WTA should be the premium path. The extreme numbers are appropriate for the extreme action of buying an entire artist's life work.

4. **US buyers only.** International sales were excluded to avoid compounding complexity in shipping, tax compliance, payment processing, and currency handling for a one-time auction. International buyers can use a US-based proxy. Rationale: scope control — the auction is already novel enough without adding international commerce.

5. **December 31, 2026 close date.** A fixed, symbolic end date rather than a condition-based close. Rationale: creates natural urgency, aligns with platform launch in spring/summer 2026 for ~6 month auction window, and satisfies HC-03's requirement that all terms be disclosed before bidding opens.

## What This Proves

The auction mechanism design validates that FHOA's product thesis — selling original paintings through a custom tiered-bid auction — can be specified with enough precision to build. The mechanism is novel but not arbitrary: every rule traces back to either the artist's values (minimum return, reward for believers, collection integrity through market validation) or legal constraints (HC-03 transparency, HC-04 approval gates, HC-05 data protection). The spec is now detailed enough to drive ICP/JTBD analysis, which in turn drives website UX requirements, which in turn drives technical architecture. The A31 product management pipeline is unblocked.

## Open Questions

1. **Securities counsel.** The outbid reward mechanic may resemble an investment contract under the Howey test. Legal review is a hard prerequisite before launch.
2. **Fiduciary partner.** Need an attorney, escrow company, or auction house to manage all funds. William to research.
3. **Payment methods by amount.** Small bids via credit card, large bids likely wire transfer. Fiduciary to advise.
4. **Painting inventory.** 52 paintings need exact dimensions. Determines the aggregate threshold and all tier prices. Blocks launch.
5. **Art-safe shipping cost estimates.** Research needed to provide buyer guidance on painting detail pages.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `specs/auction-mechanism.md`
3. `specs/srs-fine-higher-ordered-art.md`
4. `governance/ctrl-instance-constraints.md`
5. `governance/ctrl-approval-gates.md`
6. `CLAUDE.md`

**Next task:** Run the ICP/JTBD framework exercise — define ideal customer profiles for each tier and the WTA buyer, map their jobs to be done, and use the output to drive website UX requirements.
