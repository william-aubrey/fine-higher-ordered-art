---
name: Tiered-bid auction mechanism — principal's original vision
description: Stream-of-consciousness capture of the auction design as described by William on 2026-03-15 — tiers, escrow, reward splits, thresholds, Winner Takes All
type: project
---

The auction mechanism as envisioned by the Principal (captured 2026-03-15). This is the raw vision that the formal spec should implement.

**Collection:** 52 paintings (from 100+), the "Charlotte Collection." Sizes range from 4"x4" to 6'x4'. Includes a 6-painting "Grief" series (6'x4' each): Anger, Denial, Bargaining, Depression, Acceptance, Joy.

**Pricing:** Fixed $/sq.in. tiers, not negotiable bidding.
- Tier 1: $1/sq.in.
- Tier 2: $10/sq.in.
- Tier 3: $100/sq.in.

**Paid bids:** All bids are paid into escrow/trust at time of bid. Not pledges — actual payments.

**Outbid mechanics:** When a higher-tier bid arrives, the lower-tier bidder is immediately refunded 100%. At auction close (if requirements met), the outbid person receives 50% of the difference between the winning tier and their tier. Artist receives the other 50%. This cascades through all tiers.

Example: Tier 1 = $3,456, Tier 2 = $34,560, Tier 3 = $345,600.
- If Tier 2 wins: Tier 1 bidder gets ($34,560 - $3,456) / 2 = $15,552. Artist gets $15,552.
- If Tier 3 wins: Tier 2 bidder gets ($345,600 - $34,560) / 2 = $155,520. Tier 1 bidder still gets their $15,552 from the Tier 1→2 split. Artist gets both their halves.

**Auction thresholds (both must be met or auction cancelled, full refunds):**
1. All 6 Grief series paintings must sell — no partial sales of the series.
2. Total aggregate bids must exceed $100,000.

**Winner Takes All:** Any person can buy the entire collection at the current aggregate minimum bid. This short-circuits the auction immediately. The WTA buyer receives: every painting William has ever done (not just the 52), all drafts, sketches, half-finished work, paintings by others done in his home, all studio equipment, brushes, paint — everything. William personally delivers via U-Haul within continental US (or buyer arranges pickup).

**Website:** Gallery with all 52 paintings. Each painting gets an infographic-style page: image(s), size comparison diagram (painting next to 6' person), dimensions in metric + US units, written narrative, video content. Front page features the current Winner Takes All minimum bid.

**Why:** William needs ~$100k+ to build a cabin in the mountains and move from Charlotte. The paintings are personal — he won't sell for less than meaningful money. The tiered structure ensures a minimum return to himself, a financial reward to early believers (outbid bonus), and a story for the winner.

**Refined details (from Q&A, 2026-03-15):**

- Fiduciary required: William will not manage escrow himself. Lawyer or escrow company handles all funds.
- Reward distributions happen at settlement (auction close), not at time of outbid. Refunds are immediate; rewards are deferred.
- Single-bid paintings: artist receives 100%, winner gets painting.
- Securities risk acknowledged: must not represent bids as investments. Legal counsel required before launch.
- Grief series threshold: all 6 need at least a Tier 1 bid. Failure refunds all 6, which may cascade into aggregate threshold failure.
- $100,000 threshold = sum of all active winning bids (net proceeds to artist + reward recipients).
- Direct high-tier bidding allowed (can bid Tier 3 with no prior Tier 1/2).
- Timeline: 6–12 months, undecided. Needs to balance media attention vs. drag.
- WTA non-collection items are intentionally a "mystery prize" — not inventoried.
- Formal spec drafted: `specs/auction-mechanism.md`
