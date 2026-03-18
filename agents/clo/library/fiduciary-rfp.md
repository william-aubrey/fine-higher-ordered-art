# Request for Proposal — Fiduciary Counsel for Art Auction

**From:** Fine Higher Ordered Art (William Ryan Aubrey, Principal)
**To:** [Prospective Fiduciary Counsel]
**Date:** 2026-03-15
**Re:** Legal representation and fiduciary services for a one-time tiered-bid art auction

---

## 1. Overview

Fine Higher Ordered Art is seeking an attorney to serve as fiduciary counsel for a single, one-time art auction selling 52 original acrylic paintings through a custom tiered-bid mechanism. The auction will be conducted through a purpose-built website at `fhoa.org`, with a target launch in spring/summer 2026 and a fixed close date of December 31, 2026.

The fiduciary's role is comprehensive: managing escrow, processing payments and refunds, drafting and executing purchase contracts for high-value transactions, drafting terms of service, handling buyer communications at upper price tiers, and managing settlement disbursements. The fiduciary is the financial and legal backbone of the auction — the artist does not hold, manage, or have access to bid funds at any point.

The fiduciary's name, firm, and bar credentials will be prominently displayed on the auction website as a trust signal to prospective bidders.

---

## 2. The Auction

### The Collection

52 original acrylic paintings by William Ryan Aubrey, collectively titled "The Charlotte Collection." Paintings range from 4" × 4" to 6' × 4' (six large paintings forming "The Grief Series"). All are currently located in Charlotte, NC.

### Pricing Mechanism

Fixed pricing at dollars per square inch across three tiers:

| Tier | Price/sq.in. | Range (smallest to largest painting) |
|---|---|---|
| Tier 1 | $1 | $16 – $3,456 |
| Tier 2 | $10 | $160 – $34,560 |
| Tier 3 | $100 | $1,600 – $345,600 |

Bids progress sequentially: a painting must receive a Tier 1 bid before Tier 2 is available, and Tier 2 before Tier 3. Only one active bid exists per painting at any time.

### Bid Mechanics

- **All bids are paid immediately** — funds transferred to escrow at time of bid
- **All bids are irrevocable** — no cancellation or withdrawal
- **When outbid:** the lower-tier bidder's payment is refunded from escrow immediately
- **Outbid reward:** at settlement, outbid bidders receive 50% of the spread between their tier and the next tier up (see §4)
- **Self-outbidding permitted:** a buyer may bid sequential tiers on the same painting, earning their own outbid rewards

### Aggregate Threshold

The auction succeeds only if the sum of all active winning bids (highest tier per painting) meets or exceeds the minimum aggregate at close. The minimum aggregate equals the sum of all Tier 1 prices across 52 paintings (exact figure pending painting inventory — estimated $XX,XXX).

If the threshold is not met: auction cancelled, all escrowed funds returned to active bidders, no rewards paid.

### Winner Takes All (WTA)

A single buyer may purchase the entire collection (plus all non-collection works, studio equipment, and personal delivery by the artist) at a dynamically calculated price equal to the sum of next-tier-up prices for all 52 paintings. WTA immediately closes the auction. All existing bidders are refunded and earn outbid rewards at settlement.

WTA prices range from approximately $XX,XXX (early, few bids) to potentially several million dollars (late, many high-tier bids). An implicit "Tier 4" at $1,000/sq.in. applies to WTA only, for paintings already at Tier 3.

### US Buyers Only

The auction is limited to US buyers. No international transactions.

---

## 3. Scope of Fiduciary Services Requested

### 3.1 Escrow Management

**Primary responsibility:** Hold all bid payments in a trust or escrow account. The artist does not hold or manage bid funds at any time.

| Action | Trigger | Timeline |
|---|---|---|
| Receive bid payment | Bidder completes payment on website | Immediate (real-time) |
| Refund outbid bidder | Higher-tier bid placed on same painting | Immediate |
| Refund all bidders | Auction fails (threshold not met at close) | Within [X] business days of close |
| Disburse rewards | Auction succeeds — settlement | Per settlement schedule |
| Disburse artist proceeds | Auction succeeds — settlement | Per settlement schedule |

**Estimated transaction volume:**
- Up to 52 paintings × up to 3 tiers each = up to 156 individual bid transactions over ~6 months
- Each outbid event generates a refund (immediate) and a reward claim (deferred to settlement)
- Realistic expectation: significantly fewer than 156 total bids. The auction is a one-time event, not a high-frequency trading platform.

### 3.2 Payment Processing

The fiduciary will need to accept payments through multiple channels:

**Credit card (below threshold):**
For bids below a dollar threshold to be determined (likely $5,000–$10,000), bidders pay via credit card through the website. The payment processor (Stripe, Square, or similar PCI-compliant service) routes funds to the escrow account.

**Wire transfer (above threshold):**
For bids above the credit card threshold, bidders pay via wire transfer to the escrow account. The fiduciary provides wire instructions and confirms receipt.

**We seek your guidance on:**
- The appropriate dollar threshold for the credit card / wire transfer split
- Which payment processor to use (must be PCI-compliant per our governance constraints)
- The escrow account structure (IOLTA trust account, dedicated escrow account, or other)
- Whether separate accounts are needed for different purposes (bid escrow, refund float, etc.)

### 3.3 High-Value Buyer Engagement

For bids above the credit card threshold, the website UX transitions from self-service to lawyer-mediated. Instead of "Place Bid," the buyer sees "Arrange Purchase" and is directed to engage with the fiduciary.

**The fiduciary's role with high-value buyers:**

1. **Field inquiries** — prospective bidders (or their attorneys) contact the fiduciary to ask questions about the auction structure, escrow, and terms
2. **Draft and execute purchase contracts** — formal contracts for bids above the credit card threshold, covering: painting identification, tier, price, escrow terms, reward mechanics, settlement process, shipping responsibility, IP retention (artist retains all reproduction rights)
3. **Verify payment** — confirm wire transfer receipt and place the bid on behalf of the buyer
4. **Communicate throughout** — the fiduciary is the high-value buyer's primary point of contact, not the artist

### 3.4 Winner Takes All Contract

If a WTA buyer emerges, the fiduciary drafts and executes a comprehensive WTA purchase contract covering:

- Total WTA price (calculated at time of execution)
- Complete inventory of what the buyer receives (52 collection paintings + non-collection works + studio contents + personal delivery)
- Escrow terms for the WTA payment
- Settlement process — refunds and reward disbursements to all existing bidders
- Delivery terms (personal delivery by artist within continental US, or buyer-arranged pickup)
- IP retention per HC-01 (buyer receives physical objects, not reproduction rights)
- Timeline for settlement and delivery

### 3.5 Terms of Service / Auction Terms

The fiduciary drafts the auction's legal terms, to be published on the website before bidding opens (required by HC-03 — full disclosure before bidding). Terms must cover:

- Bid mechanics (tiers, sequential progression, irrevocability, paid bids)
- Escrow structure (who holds funds, how they're managed)
- Outbid refund process (immediate, from escrow)
- Outbid reward mechanic (50% of spread, paid at settlement, contingent on auction success)
- Self-outbidding rules and disclosure
- Aggregate threshold (all-or-nothing)
- Winner Takes All option and its effect on existing bidders
- Auction failure conditions (threshold not met → full refund, no rewards)
- Settlement process and timeline
- Shipping responsibility (buyer arranges and pays, HC-07 art-safe requirements)
- All sales final — no returns
- Certificate of authenticity terms
- IP retention (HC-01 — sale transfers physical object only)
- Tax obligations — bidders' responsibility to report rewards as income if applicable
- Privacy / data handling (HC-05 — customer data encrypted, PCI-compliant processing)
- US buyers only
- Dispute resolution mechanism

**Securities language:** The terms must include disclosure language addressing the outbid reward mechanic, framing bids unambiguously as art purchases and rewards as incidental benefits. A separate securities opinion is being sought (see §6 below) and its recommendations will inform the terms.

### 3.6 Settlement

When the auction closes and thresholds are confirmed met, the fiduciary manages the complete settlement:

1. **Freeze auction state** — no further changes
2. **Calculate disbursements** for each painting:
   - Artist's share: base (Tier 1 equivalent) + 50% of each tier spread
   - Outbid rewards: 50% of each tier spread to each outbid bidder
3. **Disburse** funds to artist and all reward recipients
4. **Issue tax documentation** — 1099s to reward recipients and artist as applicable
5. **Deduct fiduciary fees** from artist's proceeds (not from bidder payments or rewards)
6. **Provide final accounting** — complete record of all transactions, refunds, rewards, and disbursements

### 3.7 Auction Failure

If the aggregate threshold is not met at auction close:

1. Return all escrowed funds to active bidders in full
2. No rewards paid, no artist proceeds disbursed
3. Provide final accounting
4. Fiduciary fees — **we seek your guidance on fee structure in the failure scenario** (flat fee? reduced fee? hourly only?)

---

## 4. The Outbid Reward — Detailed Mechanics

The reward mechanic is central to the auction's design and to the fiduciary's settlement calculations. Full worked examples:

### Single Outbid: Tier 1 → Tier 2 Win

*Example: 6' × 4' painting (3,456 sq. in.)*

| Flow | Amount | Recipient |
|---|---|---|
| Tier 2 bid (in escrow) | $34,560 | — |
| Base (Tier 1 equivalent) | $3,456 | Artist |
| Spread (T2 − T1): $31,104 | 50% = $15,552 | Tier 1 bidder (reward) |
| | 50% = $15,552 | Artist |
| **Artist total** | **$19,008** | |
| **Tier 1 bidder total** | **$15,552** | (refund already returned + reward at settlement) |

### Double Outbid: Tier 1 → Tier 2 → Tier 3 Win

| Flow | Amount | Recipient |
|---|---|---|
| Tier 3 bid (in escrow) | $345,600 | — |
| Base | $3,456 | Artist |
| Spread 1 (T2 − T1): $31,104 | $15,552 each | Tier 1 bidder + Artist |
| Spread 2 (T3 − T2): $311,040 | $155,520 each | Tier 2 bidder + Artist |
| **Artist total** | **$174,528** | |
| **Tier 1 bidder** | **$15,552** | |
| **Tier 2 bidder** | **$155,520** | |
| **Escrow balance** | **$345,600** | ✓ Balances |

### No Outbid (Direct Tier 1 Win, No Higher Bid)

Artist receives 100% of Tier 1 bid. No rewards paid.

---

## 5. Key Constraints

The following non-negotiable constraints apply:

| Constraint | Requirement |
|---|---|
| **HC-01** | Artist retains all IP. Sale transfers physical object only. |
| **HC-03** | All auction terms disclosed before bidding opens. No changes mid-auction. |
| **HC-04** | Principal (William) must approve auction launch, final bids, and contracts. |
| **HC-05** | Customer data encrypted. PCI-compliant payment. No direct storage of credentials. |
| **HC-06** | Sales tax per state (Wayfair). Income reporting. Art-specific tax handling. |
| **HC-07** | Art-safe shipping: rigid packaging, acid-free wrapping, insured. |

---

## 6. Related Engagements

A **separate securities opinion** is being sought regarding the outbid reward mechanic's risk under the Howey test. The securities counsel's recommendations may affect the terms of service drafted by the fiduciary. We anticipate coordination between the two engagements.

---

## 7. What We Need in Your Proposal

Please address the following in your response:

### Scope Confirmation
1. Can you serve as fiduciary for this auction as described?
2. Are there any elements of the scope (§3.1–3.7) that you cannot or would not handle?
3. What additional services or roles do you recommend that we haven't identified?

### Escrow and Payment
4. What escrow account structure do you recommend?
5. What payment processor do you recommend for credit card transactions?
6. What dollar threshold do you recommend for the credit card / wire transfer split?
7. How do you handle real-time refunds from escrow when a bidder is outbid?

### Fee Structure
8. What is your proposed fee structure? (Flat fee, hourly, percentage of auction proceeds, or combination)
9. How are fees structured in the failure scenario (auction cancelled, all funds returned)?
10. Are fees deducted from artist proceeds only, or are there bidder-facing fees?

### Timeline and Capacity
11. Can you be engaged and operational by [target launch date]?
12. What is your availability for buyer inquiries during the 6-month auction window?
13. How many high-value buyer engagements can you handle concurrently?

### Terms of Service
14. Can you draft the auction terms of service as described in §3.5?
15. What is your timeline for a terms draft, assuming engagement begins [date]?

### Experience
16. Have you handled escrow or fiduciary duties for an art auction or similar mechanism before?
17. Are you familiar with the securities considerations described in §6?

---

## 8. Reference Materials

The following documents are available upon engagement:

| Document | Contents |
|---|---|
| `specs/auction-mechanism.md` | Complete auction mechanism — tiers, thresholds, rewards, WTA, settlement |
| `specs/spec-v1-01-icp-jtbd.md` | Buyer personas — who participates and why |
| `specs/spec-v1-02a` through `02f` | User journey specifications — how each persona interacts with the auction |
| `governance/ctrl-instance-constraints.md` | Hard constraints (HC-01 through HC-08) |
| `governance/ctrl-approval-gates.md` | Approval requirements |
| `library/legal/securities-opinion-request.md` | The separate securities opinion request |

---

## 9. Contact

**William Ryan Aubrey**
Fine Higher Ordered Art
Charlotte, NC
[Email — to be added]
[Phone — to be added]

Website (in development): `fhoa.org`
