# Tiered-Bid Auction Mechanism

*Specification for FR-2: Tiered-Bid Auction*
*Status: Draft — requires Principal review and legal counsel*
*Date: 2026-03-15*

---

## 1. Overview

The Charlotte Collection auction is a single, one-time event selling 52 original acrylic paintings through a three-tier fixed-price bidding system. The auction is all-or-nothing: if aggregate thresholds are not met, all bids are refunded and no paintings change hands.

The mechanism is designed around two principles:

1. **Minimum return to the artist.** The aggregate threshold ensures the auction only succeeds if it meaningfully funds the artist's next chapter. If the market doesn't show up, everyone gets their money back and the paintings stay home.
2. **Reward for early believers.** Bidders who are outbid don't just lose — they earn a share of the upward movement. This creates a story for every participant.

---

## 2. The Collection

**52 paintings** selected from 100+ works as the core "Charlotte Collection."

- Sizes range from 4" × 4" to 6' × 4'
- All are original acrylic paintings by William Ryan Aubrey
- Mixed subject matter: abstract expressionist works expressing emotional and spiritual themes

### The Grief Series

Six large paintings (each 6' × 4') forming a thematic series:

| # | Title | Sq. In. | Tier 1 | Tier 2 | Tier 3 |
|---|---|---|---|---|---|
| 1 | Anger | 3,456 | $3,456 | $34,560 | $345,600 |
| 2 | Denial | 3,456 | $3,456 | $34,560 | $345,600 |
| 3 | Bargaining | 3,456 | $3,456 | $34,560 | $345,600 |
| 4 | Depression | 3,456 | $3,456 | $34,560 | $345,600 |
| 5 | Acceptance | 3,456 | $3,456 | $34,560 | $345,600 |
| 6 | Joy | 3,456 | $3,456 | $34,560 | $345,600 |

The Grief Series is presented as a thematic set on the website with its story prominently featured, but no structural auction rule binds them. Each painting sells (or doesn't) on its own merits. A collector who values the series can choose to keep it together.

---

## 3. Tier Structure

Pricing is fixed at dollars per square inch. There are exactly three tiers. Bidders choose a tier — they do not name their own price.

| Tier | Price | Multiplier | Positioning |
|---|---|---|---|
| **Tier 1** | $1 / sq. in. | 1× | Accessible entry point — broad audience |
| **Tier 2** | $10 / sq. in. | 10× | Serious collector commitment |
| **Tier 3** | $100 / sq. in. | 100× | Premium acquisition / patron level |

### Price Examples by Painting Size

| Painting Size | Sq. In. | Tier 1 | Tier 2 | Tier 3 |
|---|---|---|---|---|
| 4" × 4" | 16 | $16 | $160 | $1,600 |
| 12" × 12" | 144 | $144 | $1,440 | $14,400 |
| 24" × 36" | 864 | $864 | $8,640 | $86,400 |
| 48" × 72" (6' × 4') | 3,456 | $3,456 | $34,560 | $345,600 |

The tier structure scales naturally with painting size. Small paintings are accessible at every tier. Large paintings command significant commitment at Tiers 2 and 3.

---

## 4. Bidding Rules

### 4.1 Paid Bids

All bids are paid at the time of bidding. Bid amounts are transferred to a third-party escrow or trust account managed by a fiduciary (not the artist). Bids are not pledges — they are actual payments held in trust until the auction resolves.

### 4.2 One Bid Per Painting Per Tier

Each tier on each painting holds at most one active bid. A painting's state is one of:

| State | Meaning |
|---|---|
| **Open** | No bids placed. Available at Tier 1. |
| **Tier 1 Held** | One active bid at $1/sq.in. Next available bid: Tier 2. |
| **Tier 2 Held** | One active bid at $10/sq.in. Tier 1 bidder was refunded. Next available bid: Tier 3. |
| **Tier 3 Held** | One active bid at $100/sq.in. Tier 2 bidder was refunded. No further bids possible. |

### 4.3 Irrevocable Bids

All bids are irrevocable once placed. A bidder cannot withdraw, cancel, or reduce a bid under any circumstances. This is disclosed clearly before bidding.

No bidder takes possession of their painting until the auction is complete and all thresholds are met. Winning a bid during the auction secures a claim — not immediate ownership.

### 4.4 Outbid Refund

When a higher-tier bid is placed, the lower-tier bidder's payment is refunded from escrow **immediately** — not at auction close.

### 4.5 Sequential Tier Progression

Bids must progress through tiers in order. A painting must receive a Tier 1 bid before a Tier 2 bid is available, and a Tier 2 bid before a Tier 3 bid is available. There is no direct high-tier bidding — every painting that reaches Tier 3 has passed through Tier 1 and Tier 2.

A single buyer may bid sequential tiers on the same painting (see §4.7 Rebidding After Outbid). In this case, each lower-tier bid is refunded immediately and the buyer earns outbid rewards at settlement for each tier transition they created. This is intentional — a motivated buyer who runs the full tier ladder earns their own rewards, effectively reducing their net cost by approximately 50%.

*Changed 2026-03-15: Replaced direct tier bidding with sequential progression. Rationale: every painting should progress visibly through tiers, creating activity and tension. A motivated buyer's self-outbid rewards are a feature of the system, not a loophole.*

### 4.6 First Come, First Served

Only one bid may exist per tier per painting. If two people attempt to bid on the same painting at the same tier simultaneously, the first to enter the payment process wins. The website must reflect bid status in real time — including when a bidder has entered the purchase queue and payment is in progress — so that other prospective bidders see the painting's current state before committing.

### 4.7 One Active Bid Per Person Per Painting

A single person may not hold active bids at multiple tiers on the same painting. A person may bid on multiple different paintings.

### 4.7 Rebidding After Outbid

A person who was outbid may bid again on the same painting at the next available tier. For example, a Tier 1 bidder who is outbid by a Tier 2 bidder may bid Tier 3 (the next available tier). They would earn the Tier 1 outbid reward *and* win the painting. This is permitted.

A single buyer may also outbid themselves by bidding sequential tiers on the same painting (see §4.5). Each self-outbid follows the same refund and reward mechanics as any other outbid — the buyer receives an immediate refund of the lower tier and earns the outbid reward at settlement.

---

## 5. Auction Thresholds

The auction has one threshold. If it is not met by the auction close date, the entire auction is cancelled and all escrowed funds are returned to bidders in full.

### 5.1 Aggregate Threshold

The sum of all active winning bids (the highest tier bid on each painting) must equal or exceed the **minimum aggregate** at auction close.

The minimum aggregate equals the sum of all Tier 1 prices across the 52 paintings (total collection area in square inches × $1). The exact figure will be determined when the painting inventory is complete.

> **PENDING:** William to inventory all 52 paintings with exact dimensions. The aggregate threshold will be set to the sum of all Tier 1 prices (total sq. in. × $1/sq. in.).

**Rationale:** The aggregate threshold is the single mechanism that protects the artist. If the market doesn't collectively value the collection at the minimum, the auction didn't work and everyone gets their money back. Individual paintings — including the Grief Series — sell or don't sell on their own merits. The Grief Series is presented as a thematic set and its story is told, but no structural rule binds them. A collector who values the series will keep it together by choice.

### 5.2 Threshold Evaluation

Thresholds are evaluated at the moment the auction closes (end date reached):

1. **Calculate aggregate.** Sum all active winning bids (highest tier per painting).
2. **Check aggregate threshold.** If the aggregate is below the minimum, cancel the entire auction and refund all bids.
3. **If it passes:** the auction succeeds. Proceed to settlement.

---

## 6. Outbid Reward Mechanic

This is the distinctive feature of the auction. When a bidder is outbid, they don't just get refunded — they earn a reward at settlement.

### 6.1 The Rule

When a painting sells at a tier higher than a previous bid, the **spread** between adjacent tiers is split 50/50 between the outbid bidder and the artist. This applies at each tier transition independently.

### 6.2 Single Outbid (Tier 1 → Tier 2 Win)

| Flow | Amount | Recipient |
|---|---|---|
| Base (Tier 1 equivalent) | $3,456 | Artist |
| Spread: Tier 2 − Tier 1 | $34,560 − $3,456 = $31,104 | Split 50/50 |
| → 50% of spread | $15,552 | Tier 1 bidder (reward) |
| → 50% of spread | $15,552 | Artist |
| **Artist total** | **$19,008** | |
| **Tier 1 bidder total** | **$15,552** | (on top of full refund at time of outbid) |
| **Winning bidder (Tier 2)** | **Painting** | |
| **Escrow in** | **$34,560** | ✓ Balances |

### 6.3 Double Outbid (Tier 1 → Tier 2 → Tier 3 Win)

| Flow | Amount | Recipient |
|---|---|---|
| Base (Tier 1 equivalent) | $3,456 | Artist |
| Spread 1: Tier 2 − Tier 1 | $31,104 | Split 50/50 |
| → 50% | $15,552 | Tier 1 bidder |
| → 50% | $15,552 | Artist |
| Spread 2: Tier 3 − Tier 2 | $311,040 | Split 50/50 |
| → 50% | $155,520 | Tier 2 bidder |
| → 50% | $155,520 | Artist |
| **Artist total** | **$174,528** | |
| **Tier 1 bidder total** | **$15,552** | |
| **Tier 2 bidder total** | **$155,520** | |
| **Winning bidder (Tier 3)** | **Painting** | |
| **Escrow in** | **$345,600** | ✓ Balances |

### 6.4 Direct High-Tier Bid (No Prior Bidder)

If someone bids at Tier 2 or Tier 3 with no prior lower-tier bid, there is no outbid bidder to reward. The artist receives the full bid amount.

| Scenario | Artist Receives |
|---|---|
| Tier 1 only (no outbid) | 100% of Tier 1 bid |
| Tier 2 direct (no Tier 1 existed) | 100% of Tier 2 bid |
| Tier 3 direct (no Tier 1 or 2 existed) | 100% of Tier 3 bid |

### 6.5 Reward Timing

- **Refund** of the outbid bidder's original payment: **immediate** (at time of outbid)
- **Reward** payment to the outbid bidder: **at auction settlement** (after all thresholds pass)
- The artist's proceeds: **at auction settlement**

The reward is paid from the winning bidder's escrowed funds during the settlement process. The fiduciary manages all disbursements.

### 6.6 No Reward If Auction Fails

If the auction is cancelled (thresholds not met), no rewards are paid. All escrowed funds are refunded to the current active bidders. Former bidders who were already refunded at time of outbid have no further claim — they already received their full refund.

---

## 7. Winner Takes All (WTA)

An option for a single buyer to acquire the entire collection — and more — in one transaction.

### 7.1 WTA Price

The WTA price is the sum of the **current minimum acquisition cost** for each of the 52 paintings:

| Painting State | Contributes to WTA Price |
|---|---|
| No bid (Open) | Tier 1 price |
| Tier 1 bid active | Tier 2 price (next tier up) |
| Tier 2 bid active | Tier 3 price (next tier up) |
| Tier 3 bid active | Tier 4 price ($1,000/sq.in. — WTA only, see §7.4) |

The WTA price is displayed prominently on the website and updates in real time as bids come in. Because WTA always requires the next tier up, every existing bidder becomes an outbid bidder with a reward claim at settlement. This means the WTA price escalates aggressively as individual bids accumulate — an early WTA is dramatically cheaper than a late one.

### 7.2 What the WTA Buyer Receives

The WTA buyer receives **everything**:

- All 52 Charlotte Collection paintings
- Every other painting William has ever created (non-collection works, drafts, half-finished pieces)
- Paintings by others created in William's home and gifted to him
- All art studio equipment — every brush, every tube of paint, easels, supplies
- Personal delivery by William via U-Haul to any location within the continental United States (or buyer arranges their own pickup)

This is intentionally described as a "mystery prize" beyond the 52 cataloged paintings. The exact inventory of non-collection items is not enumerated.

### 7.3 WTA Settlement

When a WTA bid is placed:

1. The auction **immediately closes** — no further individual bids accepted.
2. WTA payment is placed in escrow.
3. All existing individual bidders are **immediately refunded** their escrowed amounts.
4. Outbid rewards are calculated for each painting where a prior bidder existed, using the WTA tier-equivalent as the winning bid.
5. All disbursements (artist proceeds, bidder rewards) are made at settlement.

WTA constitutes a next-tier-up bid on every painting. All existing bidders become outbid bidders and earn their 50% spread reward at settlement.

### 7.4 WTA Tier 4 — The Ceiling Rule

For individual bidding, Tier 3 ($100/sq.in.) is the maximum. But WTA follows the 10× progression one step further:

| Tier | $/sq.in. | Context |
|---|---|---|
| Tier 1 | $1 | Individual + WTA |
| Tier 2 | $10 | Individual + WTA |
| Tier 3 | $100 | Individual + WTA |
| **Tier 4** | **$1,000** | **WTA only** — not available for individual bids |

When a painting has a Tier 3 bid, the WTA buyer pays $1,000/sq.in. for that painting. The spread ($1,000 − $100 = $900/sq.in.) splits 50/50 between the Tier 3 bidder and the artist, consistent with all other tier transitions.

**Example — 6' × 4' Grief painting at Tier 3:**

| | Amount |
|---|---|
| WTA contribution for this painting | $3,456,000 |
| Tier 3 bidder reward (50% of spread) | ($3,456,000 − $345,600) / 2 = $1,555,200 |
| Artist share of spread | $1,555,200 |
| Artist share of base + prior spreads | per §6.3 |

**Example — 4" × 4" painting at Tier 3 (blocking scenario):**

| | Amount |
|---|---|
| WTA contribution for this painting | $16,000 |
| Tier 3 bidder reward | ($16,000 − $1,600) / 2 = $7,200 |
| Artist share of spread | $7,200 |

A Tier 3 bid on the smallest painting adds only $16,000 to the WTA price — not a meaningful barrier for an ultra-wealthy buyer. The system absorbs strategic blocking bids gracefully.

---

## 8. Settlement Process

Settlement occurs after the auction closes and both thresholds are confirmed met.

### 8.1 Shipping

**Shipping is not included in the bid price.** Winning bidders are responsible for arranging and paying for pickup or shipment of their paintings after settlement. All shipping must comply with HC-07 (art-safe packaging, insured).

Options for winning bidders:
- **Local pickup** from the artist's Charlotte, NC location (no additional cost)
- **Buyer-arranged shipping** using an art shipping service (buyer pays)

The website should provide guidance on art-safe shipping options and estimated costs by painting size.

> **PENDING:** Research art-safe shipping costs by size to provide estimates on painting detail pages.

**Exception — Winner Takes All:** The WTA buyer receives personal delivery by the artist to one location within the continental United States, included in the WTA price.

### 8.2 Fiduciary Fees

The fiduciary (attorney, escrow company, or auction house) will charge fees for managing escrow, processing payments/refunds, and handling settlement disbursements. These fees are deducted from the artist's proceeds, not from bidder payments or rewards.

> **PENDING:** Identify fiduciary partner. Possibilities include an entertainment/art attorney, a licensed escrow company, or an established auction house experienced with this structure.

### 8.3 Settlement Sequence

1. **Threshold check** (§5.3) — confirm Grief Series and $100,000 aggregate
2. **Freeze state** — no further changes to bids
3. **Calculate disbursements** for each painting:
   - Artist's share (base + 50% of each spread)
   - Outbid rewards (50% of each spread to each outbid bidder)
4. **Disburse** — fiduciary releases funds to artist and all reward recipients
5. **Transfer paintings** — winning bidders arrange collection or shipping (per HC-07: art-safe packaging, insured)
6. **Certificates of authenticity** issued per FR-6

### 8.4 Fiduciary Role

A third-party fiduciary (attorney, escrow company, or auction house) manages:

- Receiving and holding all bid payments
- Processing immediate refunds when bidders are outbid
- Processing full refunds if the auction is cancelled
- Calculating and disbursing all settlement payments
- Maintaining records for tax compliance (HC-06)

The artist does not hold or manage bid funds at any point.

### 8.5 If Auction Fails

If thresholds are not met at auction close:

1. All escrowed funds are returned to active bidders in full
2. No rewards are paid (no outbid rewards, no artist proceeds)
3. All paintings remain with the artist
4. Previously refunded bidders (who were outbid during the auction) have already received their refunds and have no further claim or obligation

---

### 8.6 Unsold Paintings

If the auction succeeds but some paintings received no bids, those paintings remain with the artist. They are not re-auctioned, discounted, or offered through the platform. They move to the mountains with William.

### 8.7 Post-Auction

After settlement, the website transitions from an active auction platform to a **permanent online gallery** — an archive of the Charlotte Collection and the auction event. Sold paintings are marked with their buyer (if public) and winning tier. Unsold paintings remain displayed as part of the collection's history.

If the auction generates interest in the artist's future work, the gallery may evolve into a new platform. But that's a separate chapter.

---

## 9. Website Presentation

### 9.1 Gallery

- All 52 paintings displayed in a browsable gallery
- Each painting links to a dedicated detail page

### 9.2 Painting Detail Page (Infographic Style)

Each painting page includes:

- High-resolution image(s) of the painting
- **Scale diagram:** inset showing the painting's size next to an average 6' tall person
- Dimensions in both US (inches/feet) and metric (centimeters) units
- Written narrative about the painting
- Video content: the artist and/or others sharing thoughts about the piece
- Current bid status (Open / Tier 1 / Tier 2 / Tier 3)
- Bidder display: public name if the bidder opted for public visibility, otherwise "Private Bidder" (bidder chooses at time of bid)
- Available tier(s) with price

### 9.3 Front Page

- Featured: the current **Winner Takes All** minimum price, updating in real time
- Auction status: time remaining, number of paintings bid on, aggregate total vs. $100,000 threshold
- The Grief Series: visual prominence for the six-painting series and its story

---

## 10. Timeline

**Target close date: December 31, 2026.**

Platform launch: spring/summer 2026. The auction runs from launch until end of year — approximately 6 months. The December 31 deadline is symbolic: the collection either finds its new homes before the new year, or it stays with the artist and moves to the mountains.

The close date is fixed at launch and disclosed per HC-03. No extensions.

---

## 11. Legal Considerations

### 11.1 Securities Risk — Critical

The outbid reward mechanic creates a scenario where a person pays money (Tier 1 bid) and may receive a financial return (reward if outbid) based on the actions of others (a subsequent higher-tier bidder). This pattern resembles an investment contract under the **Howey test**:

1. ✅ Investment of money (paid bid)
2. ⚠️ Common enterprise (auction pool)
3. ⚠️ Expectation of profit (outbid reward)
4. ⚠️ Derived from efforts of others (subsequent bidder)

**This must be reviewed by legal counsel before launch.** Possible mitigations:

- Frame the bid as a purchase commitment for artwork, not as an investment
- The reward is an incidental benefit of the auction structure, not the primary purpose
- The primary transaction is "pay money, get painting" — not "pay money, get return"
- Clear disclosures: "You are bidding to buy a painting. If you win, you receive a painting. If you are outbid, you receive a full refund plus a reward. The reward is not guaranteed and depends on whether someone else bids at a higher tier."
- Per William: **"We need to be careful here to make sure we do not represent the bids as an investment. We need to be clear that the winner may only lose their money and get a painting and nothing else."**

### 11.2 Escrow and Money Transmission

Holding bid payments in escrow may trigger money transmitter licensing requirements depending on the state. The fiduciary structure must be reviewed for compliance.

### 11.3 Consumer Protection

Per HC-03: all auction terms must be disclosed before bidding opens. The mechanism described here — tiers, thresholds, reward splits, WTA — must be clearly communicated in the auction terms.

### 11.4 Tax Implications

Per HC-06: sales tax applies per state (Wayfair). Outbid rewards may be taxable income to recipients. The fiduciary may need to issue 1099s. Artist income reporting applies.

---

## 12. Open Questions

### Resolved

- ~~WTA outbid mechanics~~ → WTA requires next tier up for each painting. All existing bidders earn outbid rewards. (2026-03-15)
- ~~Aggregate threshold amount~~ → Will equal the sum of all Tier 1 prices (total sq. in.). Pending inventory. (2026-03-15)
- ~~Bid withdrawal~~ → All bids irrevocable. No possession until auction complete. (2026-03-15)
- ~~Rebidding after outbid~~ → Permitted. A Tier 1 bidder who was outbid can return and bid Tier 3. (2026-03-15)
- ~~Bid visibility~~ → Bidder chooses public or private at time of bid. Painting status always visible. (2026-03-15)
- ~~Return policy~~ → All sales final. (2026-03-15)
- ~~International buyers~~ → US buyers only. International buyers may use a US-based proxy. No international delivery. (2026-03-15)
- ~~One person buying all paintings individually~~ → Permitted but differs from WTA: individual bids can be outbid, auction continues, no bonus package. WTA's value is certainty + extras. (2026-03-15)
- ~~WTA ceiling (Tier 3 exists)~~ → Option B: implicit Tier 4 at $1,000/sq.in. for WTA only. Consistent 10× progression. See §7.4. (2026-03-15)
- ~~Grief Series constraint~~ → Removed entirely. Single aggregate threshold replaces all Grief-specific rules. The series is a narrative element, not a structural one. (2026-03-15)

### Open

### Also Resolved

- ~~Shill bidding~~ → Embraced as a feature, not a problem. The reward mechanic IS the incentive to bid early. Terms should frame this honestly. (2026-03-15)
- ~~Auction duration~~ → Close date: December 31, 2026. Launch: spring/summer 2026. Fixed, no extensions. (2026-03-15)
- ~~Shipping~~ → Not included. Buyer arranges pickup or pays separately. WTA gets personal delivery. (2026-03-15)
- ~~Simultaneous bids~~ → First come, first served. Real-time status updates including payment-in-progress state. (2026-03-15)
- ~~Return policy~~ → All sales final. (2026-03-15)
- ~~Unsold paintings~~ → Stay with the artist. (2026-03-15)
- ~~Post-auction website~~ → Converts to permanent online gallery / auction archive. (2026-03-15)
- ~~Grief Series~~ → Constraint removed entirely. Single aggregate threshold. (2026-03-15)

### Remaining Open

1. **Securities counsel.** Legal review of the reward mechanic under federal and state securities law. **Hard prerequisite before launch.**

2. **Fiduciary selection.** Attorney, escrow company, or auction house? Must handle escrow, payment processing, refunds, and settlement disbursements. Fiduciary fees deducted from artist proceeds. William to research options.

3. **Payment methods.** Small bids ($16–$864) via credit card. Large bids ($34,560+) likely require wire transfer. Fiduciary partner to advise on accepted methods.

4. **Painting inventory.** William to measure and catalog all 52 paintings with exact dimensions. This determines the aggregate threshold and all tier prices. **Blocks launch.**

5. **Art-safe shipping cost estimates.** Research needed to provide guidance on painting detail pages. Cost varies significantly by size.

---

## Appendix: Financial Model — Example Scenarios

### Scenario A: Minimum Success (All Tier 1)

All 52 paintings sell at Tier 1. No outbids. Total = sum of all Tier 1 prices.

Requires: sum of all paintings' sq. in. × $1 ≥ $100,000 → total collection area must be ≥ 100,000 sq. in.

> **NOTE:** The 6 Grief paintings alone = 6 × 3,456 = 20,736 sq. in. The remaining 46 paintings need to contribute ≥ 79,264 sq. in. at Tier 1 to reach $100,000. This is plausible if many are large, but should be verified against actual inventory.

### Scenario B: Mixed Tiers

20 paintings at Tier 1, 10 at Tier 2, 2 at Tier 3. Rest unsold (if not in Grief Series). This easily clears $100,000 — even a single large Tier 2 painting contributes $34,560.

### Scenario C: Early WTA

Before many bids come in, WTA price is near the Tier 1 total (close to Scenario A numbers). An early WTA buyer gets the best deal but also takes the most risk on the collection's value.

### Scenario D: Threshold Failure

Bidding is light. Only 20 paintings receive Tier 1 bids. Aggregate is below the minimum threshold. Auction cancelled. All money returned. All paintings stay with the artist.
