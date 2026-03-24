# Simulation — Pass 2: Function-Level Validation

*Phase 5 — Spec-Driven Development*
*Date: 2026-03-24*
*Method: Walk through the spec as if writing each function. For each function, ask: "Does the agent know enough to write this function without guessing?"*

---

## Core Functions

### `calculateTierPrice(painting, tier)`
**Spec source:** 03b §2.1
**Can write without guessing?** Yes.
```
tier1 = square_inches × 100 (cents)
tier2 = square_inches × 1000
tier3 = square_inches × 10000
tier4 = square_inches × 100000
```
Zero ambiguity. Pure arithmetic on integers.

---

### `calculateWtaPrice()`
**Spec source:** 03b §7.2
**Can write without guessing?** Yes.
```
for each painting:
  if no active bid → add tier1_price_cents
  if active tier1  → add tier2_price_cents
  if active tier2  → add tier3_price_cents
  if active tier3  → add tier4_price_cents
return sum
```
Clear. One query to get all paintings with their highest active bid tier, then a map+sum.

---

### `getPaintingState(paintingId)`
**Spec source:** 03b §8.1
**Can write without guessing?** Yes.
Derived from bids: check for active or payment_processing bids, return the state enum. Five conditions, all specified.

---

### `getAvailableTier(paintingId)`
**Spec source:** 03b §8.1
**Can write without guessing?** Yes.
Derived from painting state: open→tier1, tier1_held→tier2, tier2_held→tier3, tier3_held→none, bid_in_progress→none.

---

### `placeBid(paintingId, tier, bidderId)`
**Spec source:** 04 §4.2 POST /api/bids, 03b §5.3, §5.4
**Can write without guessing?** Mostly — one dangerous gap.

The function must:
1. Check auction is active
2. Verify tier is available (sequential progression)
3. Verify bidder doesn't hold an active bid on this painting
4. Verify bidder's email is verified and terms accepted
5. Compute amount from painting dimensions and tier
6. Create Stripe PaymentIntent
7. Insert bid record with status=payment_processing
8. Return client secret

All steps are specified. But:

**DANGEROUS: Sales tax.** Step 6 creates a Stripe PaymentIntent for `amount_cents`. Is this `tier_price_cents` or `tier_price_cents + sales_tax`? The spec doesn't say. See Pass 1, Sprint 4.

**SAFE: The function doesn't need to check grace window** — it checks `auction.status === 'active'`, which is set to a non-active value at close_at by the evaluation trigger. Grace window applies to payment confirmation, not bid initiation.

Actually — re-reading 03b §13.3: "any bid where payment_processing was created before the deadline." This means the bid initiation (this function) must succeed as long as `now() < close_at`. The auction.status transitions to `evaluation` at close_at, which would block new bids. But bids already in `payment_processing` are allowed to complete. So the function is:
- If `auction.status === 'active'` → allow
- If `auction.status !== 'active'` → reject

The evaluation trigger must allow in-flight bids to complete. This is clear from the spec — the evaluation waits for the grace period before checking.

Wait — the spec doesn't say evaluation waits. It says evaluation happens "at the moment the auction close datetime is reached" (03b §8.3). If evaluation runs immediately at close and freezes state, in-flight bids can't complete. The spec says the grace window exists but doesn't specify how evaluation and grace window interact.

**Upgrade to dangerous:** The auction close / grace window / evaluation timing interaction is under-specified. An agent might freeze everything at close_at and break in-flight bids.

---

### `confirmBid(paymentIntentId)` (Stripe webhook handler)
**Spec source:** 04 §4.4, 03b §5.2
**Can write without guessing?** Yes.

1. Verify Stripe webhook signature
2. Find bid by payment_intent_id
3. Transition bid to `active`
4. If lower-tier active bid exists on this painting → transition to `outbid`
5. Initiate Stripe refund for outbid bid
6. Broadcast painting state change
7. Queue bid_confirmed notification
8. Queue outbid notification (if applicable)

Every step has a clear specification. The unique index prevents duplicate activations.

---

### `calculateRewards(paintingId)`
**Spec source:** 03b §6.2
**Can write without guessing?** Yes.

Walk the bid chain for this painting. For each tier transition (tier1→tier2, tier2→tier3, or any→tier4_wta):
```
spread = upper_price - lower_price
reward = spread / 2
```
Create Reward record with source_bid_id and recipient_id from the outbid bid. Precision is guaranteed (03b §6.3).

---

### `evaluateThreshold()`
**Spec source:** 03b §8.3
**Can write without guessing?** Yes.

```
aggregate = SUM(amount_cents) from bids WHERE status='active'
  GROUP BY painting_id, select MAX(amount_cents) per painting
threshold = auction.threshold_cents

if aggregate >= threshold → auction.status = 'settlement'
if aggregate < threshold → auction.status = 'failed'
```

Clear. One query.

---

### `processSettlement()`
**Spec source:** 03b §8.4
**Can write without guessing?** Mostly.

1. Freeze auction state ✅
2. Calculate rewards per painting ✅ (calls calculateRewards)
3. Calculate artist disbursements ✅ (formula in 03b §8.4)
4. Deduct fiduciary fees ❓ (percentage? flat? unknown — deferred to fiduciary)
5. Disburse rewards ❓ (mechanism undefined — TECH-05)
6. Disburse artist proceeds ❓ (same)
7. Generate certificates ❓ (PDF generation not specified — what template? what fields?)
8. Notify all participants ✅ (event catalog)
9. Transition to archive ✅

**Gap:** Certificate of authenticity PDF generation. 03a §11.2 says "Your digital certificate of authenticity (PDF) is available for download." But no spec defines the certificate's content, layout, or generation method.
**Classification:** Safe — agent generates a simple PDF with painting title, dimensions, winning bidder name, date, artist signature image. Standard content for art certificates.

**Gap:** Fiduciary fee deduction (step 4) — no rate or formula specified.
**Classification:** Safe for building — agent stores fee as a configurable parameter. Actual rate comes from fiduciary engagement.

---

### `processWtaTrigger(wtaBidId)`
**Spec source:** 03b §7.3
**Can write without guessing?** Yes.

1. Freeze auction
2. Snapshot per_painting_amounts
3. Find all bids with status=active → set to refunded_wta, initiate refunds
4. Abort any payment_processing bids → reverse charges
5. Calculate rewards using WTA tier-equivalents
6. Queue wta_triggered notification (consolidated)

The step about aborting payment_processing bids during WTA is specified (03b §7.3 step 1). The Stripe PaymentIntent can be cancelled before confirmation. Clear.

---

### `sendNotification(eventType, bidderId, payload)`
**Spec source:** 03b §10, 04 §8
**Can write without guessing?** Yes.

1. Check bidder notification preferences
2. For each enabled channel, insert notification record (queued)
3. Background processor picks up queued records
4. Send via appropriate provider (Resend/Twilio/Web Push)
5. Update status to sent or failed
6. Deduplication via unique index

All routing rules are specified. Templates provide content guidance.

---

### `renderImagePage(slug)`
**Spec source:** 03a §6
**Can write without guessing?** Yes.

Server component fetches painting data + current bid state. Renders primary image, title, dimensions, scale diagram, tier buttons, narrative, video, shipping estimate. All element positions and states are specified in 03a §6.1 and §6.2.

**Minor gap:** Scale diagram implementation. 03a §6.1 says "inset showing the painting's size next to a 6' (183 cm) person silhouette." The exact rendering (SVG? Canvas? CSS?) is unspecified.
**Classification:** Safe — SVG with proportional rectangles is the obvious implementation.

---

### `renderGalleryScroller(paintings)`
**Spec source:** 03a §12
**Can write without guessing?** Yes.

Horizontal scrolling carousel with lazy loading. Responsive breakpoints specified (03a §12.4). Item content defined (03a §12.2). Performance requirements clear (03a §19.2 — 400px WebP thumbnails).

---

### `renderTierButtons(painting, currentState)`
**Spec source:** 03a §13
**Can write without guessing?** Yes.

Three buttons, five states (available, grayed, held, in_progress, sold). Layout specified (horizontal desktop, stacked mobile). Label content per state (03a §13.3). Threshold-dependent behavior for above-threshold tiers (03a §13.4).

---

### `handleBidRaceCondition(paintingId, tier)`
**Spec source:** 03b §5.5, 04 §3.4
**Can write without guessing?** Yes.

The unique partial index on `(painting_id, tier) WHERE status IN ('active', 'payment_processing')` handles this at the database level. The INSERT will fail with a unique constraint violation. The API catches this and returns 409.

---

### `renderPostAuctionState(page, auctionStatus, paintingState)`
**Spec source:** 03a §4.3, §6.2, §7.3, §11.2
**Can write without guessing?** Yes.

Every page has post-auction state variants specified. The rendering decision is based on `auction.status` (archive/failed) and per-painting state (sold/unsold/wta).

---

## Additional Functions (Infrastructure)

### `triggerAuctionClose()`
**DANGEROUS: Not specified.** See Pass 1, Sprint 9. The function that runs at midnight ET on Dec 31 to transition the auction from active to evaluation and trigger threshold check. The spec says it happens but doesn't say how. Agent needs to know:
- Is this a Vercel Cron Job scheduled at deployment?
- Does it need to wait for the grace window before evaluating?
- What if the function fails? Is there a retry mechanism?

### `sweepExpiredPaymentProcessing()`
**Not specified.** 03b §5.4 says payment_processing has a configurable timeout (recommended 5 min) but no function or mechanism is specified for sweeping expired holds.
**Classification:** Safe — a cron job running every minute that transitions expired payment_processing bids to payment_failed and cancels the Stripe PaymentIntent.

### `recordAdminBid(paintingId, tier, bidderId, escrowReference, contractReference)`
**DANGEROUS: Endpoint mentioned (04 §6.5) but not defined.** The admin needs to record above-threshold bids that were processed outside the self-service flow. This function creates a bid record with status=active, skipping the Stripe payment flow (payment was wire transfer to fiduciary). The outbid cascade must still trigger.

An agent might:
- Forget the outbid cascade for admin-entered bids
- Not include escrow/contract references
- Not broadcast the real-time update

### `generateCertificatePDF(paintingId, bidderId)`
**Safe gap.** No template specified. Agent creates a reasonable certificate with: painting title, dimensions, medium, artist name, buyer name, date, unique certificate number, artist signature image.

---

## Pass 2 Summary

### Dangerous Gaps (3 unique — same as Pass 1, now confirmed at function level)

| # | Gap | Phase | Severity | Impact |
|---|---|---|---|---|
| 1 | **Sales tax handling** — bid charge amount undefined (tier_price or tier_price + tax) | build (04) | Dangerous | Wrong guess creates financial/legal error. Every bidder's charge is wrong. |
| 2 | **Admin endpoint for lawyer-mediated bids** — mentioned but not specified | build (04) | Dangerous | Agent may miss outbid cascade, escrow refs, or real-time broadcast |
| 3 | **Auction close trigger + grace window interaction** — mechanism unspecified, grace/evaluation timing unclear | build (04) + what (03b) | Dangerous | In-flight bids at close could be lost; evaluation could preempt grace window |

### Safe Gaps (14)

| # | Gap | Phase | Impact |
|---|---|---|---|
| 4 | ORM choice (Prisma vs Drizzle) | build | Agent picks one |
| 5 | Image processing pipeline for 4 sizes | build | Standard pattern |
| 6 | Email verification mechanism | build | Magic link default |
| 7 | Password reset flow | build | Standard pattern, notable omission |
| 8 | Apple Sign-in setup details | build | Apple developer docs |
| 9 | Admin UI scope and design | what/build | Agent builds minimal admin |
| 10 | Background notification processor choice | build | Agent picks Vercel Cron |
| 11 | Supabase vs Neon + Ably | build | Agent picks one |
| 12 | Payment processing timeout sweep | build | Cron job, standard pattern |
| 13 | Slug collision for duplicate painting titles | what | Unique constraint catches it |
| 14 | Headless CMS vs markdown (TECH-03) | build | Start with markdown |
| 15 | Stripe Connect vs direct (TECH-01) | build | Deferred to fiduciary |
| 16 | Settlement disbursement automation (TECH-05) | build | Admin calculates, fiduciary executes |
| 17 | Certificate of authenticity PDF template | build | Agent designs reasonable certificate |
