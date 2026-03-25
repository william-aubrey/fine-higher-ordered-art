# Data and State — Charlotte Collection Auction Platform

*Phase 3 (WHAT) — Spec-Driven Development*
*Version: v1*
*Date: 2026-03-24*
*Author: CTO Agent*

---

## 1. Overview

This document specifies every data structure, state machine, calculation formula, and event trigger in the Charlotte Collection auction platform. It is the companion to the site design spec (03a) — where 03a defines what the user sees, this document defines what the system knows.

**What this document covers:**
- Entity schemas (paintings, bidders, bids, rewards, the auction itself)
- The auction state machine (painting-level and auction-level)
- Calculation formulas (tier pricing, WTA price, threshold, reward disbursements)
- Notification event triggers and routing
- Content management schema (narratives, videos, series metadata)
- Temporal rules (what changes over time, what is immutable)

**What this document does NOT cover:**
- Visual presentation → `spec-v1-03a-site-design.md`
- Database engine, API contracts, infrastructure → `spec-v1-04-technical-architecture.md`

**Conventions:**
- Field types use generic notation: `string`, `integer`, `decimal`, `boolean`, `datetime`, `enum`, `text`, `url`, `uuid`
- `decimal` means exact decimal arithmetic (not floating point) — financial calculations must never use floats
- `datetime` is always stored in UTC with timezone offset
- All monetary amounts are stored in **cents** (integer) to avoid floating-point precision issues. Display conversion to dollars happens at the presentation layer.
- Required fields marked with `*`. Optional fields unmarked.
- References use `→ Entity` notation

---

## 2. Entity: Painting

A painting is the core product unit. There are exactly 52 paintings in the Charlotte Collection, defined before auction launch and immutable during the auction.

### 2.1 Schema

| Field | Type | Description |
|---|---|---|
| `id` * | uuid | Unique identifier |
| `slug` * | string | URL-safe identifier derived from title (e.g., `acceptance`, `anger`). Immutable after creation. |
| `title` * | string | Display title (e.g., "Acceptance") |
| `width_inches` * | decimal | Width in inches |
| `height_inches` * | decimal | Height in inches |
| `square_inches` * | integer | Computed: `ceil(width_inches × height_inches)`. The pricing basis. |
| `tier1_price_cents` * | integer | Computed: `square_inches × 100` ($1/sq.in. in cents) |
| `tier2_price_cents` * | integer | Computed: `square_inches × 1000` ($10/sq.in. in cents) |
| `tier3_price_cents` * | integer | Computed: `square_inches × 10000` ($100/sq.in. in cents) |
| `tier4_price_cents` * | integer | Computed: `square_inches × 100000` ($1,000/sq.in. in cents). WTA-only. |
| `display_order` * | integer | Artist-curated gallery position (1–52). Not alphabetical, not by size. |
| `series_id` | → Series | Theme series membership (nullable — most paintings have no series) |
| `series_order` | integer | Position within series (nullable) |
| `size_category` * | enum | `small` (≤12" longest side), `medium` (12"–24"), `large` (24"–48"), `oversized` (>48") |
| `shipping_estimate_low_cents` * | integer | Low end of shipping estimate for size category |
| `shipping_estimate_high_cents` * | integer | High end of shipping estimate for size category |
| `narrative` | text | Written description: story, emotion, context. 1–3 paragraphs by the artist. |
| `video_url` | url | Embedded video URL (YouTube, Vimeo). Nullable — not all paintings have video. |
| `image_source_url` * | url | Full-resolution original in Vercel Blob. Next.js Image component handles resizing/format conversion on demand (see 04 §13.2). |
| `image_og_url` * | url | Pre-generated 1200×630px for Open Graph social previews. |
| `alt_text` * | string | Descriptive alt text: "[Title], acrylic on canvas, [W]" × [H]"" |
| `created_at` * | datetime | Record creation timestamp |

### 2.2 Derived Display Values

These are not stored — computed at the presentation layer:

| Value | Formula |
|---|---|
| Width in cm | `width_inches × 2.54` |
| Height in cm | `height_inches × 2.54` |
| Dimensions display (US) | `{width}" × {height}"` or `{width}' × {height}'` if ≥ 12" |
| Dimensions display (metric) | `{width_cm} cm × {height_cm} cm` |

### 2.3 Immutability Rules

| Field | Mutable? | When |
|---|---|---|
| Physical attributes (dimensions, title, slug) | No | Set at catalog creation. Never changes. |
| Content (narrative, video, images) | Yes | Updatable by the artist at any time, including during auction. |
| Pricing (tier prices) | No | Derived from dimensions. Cannot be overridden. |
| Display order | Yes | Artist can reorder gallery before launch. Frozen at auction open. |

---

## 3. Entity: Series

A thematic grouping of paintings. At launch, only the Grief Series exists.

### 3.1 Schema

| Field | Type | Description |
|---|---|---|
| `id` * | uuid | Unique identifier |
| `slug` * | string | URL-safe identifier (e.g., `grief`) |
| `title` * | string | Display title (e.g., "The Grief Series") |
| `narrative` | text | Series story. Written by the artist. |
| `display_order` * | integer | Order among series (for future expansion) |

### 3.2 Relationships

- A Series has many Paintings (via `painting.series_id`)
- Paintings within a series are ordered by `painting.series_order`
- Series membership has **no structural auction effect** — it is purely presentational (Key Decision, auction-mechanism.md §5.1)

---

## 4. Entity: Bidder

A registered user of the platform. Registration is required before bidding but not for browsing.

### 4.1 Schema

| Field | Type | Description |
|---|---|---|
| `id` * | uuid | Unique identifier |
| `email` * | string | Verified email address. Primary communication channel. |
| `full_legal_name` * | string | Required for settlement, certificates, tax documents |
| `phone` * | string | Required for transaction-critical communications |
| `mailing_address` * | object | Structured address (street, city, state, zip). US addresses only. Required for shipping and sales tax. |
| `auth_provider` * | enum | `email`, `google`, `apple` |
| `auth_provider_id` | string | OAuth provider's user ID (nullable for email auth) |
| `password_hash` | string | Bcrypt hash (nullable — only for email auth) |
| `email_verified` * | boolean | Must be `true` before bidding |
| `notify_email` * | boolean | Always `true` — email notifications cannot be disabled |
| `notify_sms` * | boolean | Default `false`. Bidder opt-in. |
| `notify_push` * | boolean | Default `false`. Bidder opt-in. |
| `terms_accepted_at` * | datetime | Timestamp of first terms acknowledgment (bid flow Screen 2) |
| `terms_version` * | string | Version of terms accepted |
| `created_at` * | datetime | Registration timestamp |
| `updated_at` * | datetime | Last profile update |

### 4.2 Mailing Address Schema

| Field | Type | Description |
|---|---|---|
| `street1` * | string | Street address line 1 |
| `street2` | string | Street address line 2 (apt, suite, etc.) |
| `city` * | string | City |
| `state` * | string | US state (two-letter code) |
| `zip` * | string | ZIP code (5-digit or ZIP+4) |

### 4.3 Constraints

- US addresses only (Key Decision #5: US buyers only)
- Email must be verified before any bid can be placed
- One account per email address
- Full legal name is immutable after first bid placement (used on legal documents)

---

## 5. Entity: Bid

A bid is a paid commitment to purchase a specific painting at a specific tier. Bids are irrevocable, paid at time of placement, and held in third-party escrow.

### 5.1 Schema

| Field | Type | Description |
|---|---|---|
| `id` * | uuid | Unique identifier |
| `painting_id` * | → Painting | The painting being bid on |
| `bidder_id` * | → Bidder | The person placing the bid |
| `tier` * | enum | `tier1`, `tier2`, `tier3` |
| `amount_cents` * | integer | Bid amount in cents. Equal to `painting.tier{N}_price_cents`. |
| `status` * | enum | See §5.2 |
| `visibility` * | enum | `public`, `private`. Default: `private`. Changeable by bidder. |
| `display_name` | string | The bidder's name shown if `visibility = public`. Nullable if private. |
| `payment_intent_id` * | string | Payment processor's transaction reference |
| `escrow_reference` | string | Fiduciary's escrow tracking number (populated after escrow confirmation) |
| `refund_id` | string | Payment processor's refund reference (populated on refund) |
| `refund_initiated_at` | datetime | Timestamp of refund initiation |
| `placed_at` * | datetime | Timestamp of successful payment and bid placement |
| `outbid_at` | datetime | Timestamp when this bid was superseded by a higher tier |
| `created_at` * | datetime | Record creation timestamp (may differ from `placed_at` due to payment processing time) |

### 5.2 Bid Status Enum

| Status | Meaning | Transitions From |
|---|---|---|
| `payment_processing` | Payment initiated, not yet confirmed | (initial) |
| `active` | Payment confirmed, bid is the current holder for this painting/tier | `payment_processing` |
| `outbid` | A higher-tier bid was placed. Refund initiated. | `active` |
| `won` | Auction succeeded, this is the highest-tier bid on the painting | `active` |
| `refunded_auction_failed` | Auction failed threshold check. Full refund. | `active` |
| `refunded_wta` | WTA bid was placed. Refund initiated. | `active` |
| `payment_failed` | Payment could not be processed | `payment_processing` |

### 5.3 Constraints

- **One active bid per tier per painting.** At most one bid with `status = active` may exist for a given (`painting_id`, `tier`) pair.
- **One active bid per person per painting.** A bidder may not hold `active` bids at multiple tiers on the same painting.
- **Sequential tier progression.** A `tier2` bid on a painting requires an existing `active` bid at `tier1` on that painting. A `tier3` bid requires an existing `active` bid at `tier2`. (See §8 Auction State Machine.)
- **A bidder who was outbid may bid again** at the next available tier on the same painting. The outbid refund and the new bid are independent transactions.
- **Self-outbidding is permitted.** A bidder holding `tier1` may place `tier2` on the same painting. The `tier1` bid transitions to `outbid`, the bidder is refunded, and they earn the tier1 outbid reward at settlement.
- **Irrevocable.** No transition from `active` to any cancelled/withdrawn state. Only `outbid`, `won`, `refunded_auction_failed`, or `refunded_wta`.
- **All bids are paid.** A bid cannot reach `active` status without confirmed payment.

### 5.4 Payment Processing Window

When a bidder initiates a bid (clicks "Place Bid"), a `payment_processing` record is created. This establishes a **soft hold** on the tier:

- Other bidders see "Bid in progress..." on the tier button (03a §6.2)
- The hold expires after a configurable timeout (recommended: 5 minutes)
- If payment succeeds → transition to `active`
- If payment fails or times out → transition to `payment_failed`, tier becomes available again
- Only one `payment_processing` record may exist per (`painting_id`, `tier`) at a time

### 5.5 Race Condition Resolution

If two bidders click "Place Bid" on the same tier within milliseconds:

1. The first to create a `payment_processing` record wins the hold
2. The second receives an immediate response: "Bid in progress — another bidder is currently completing a transaction for this tier"
3. If the first bidder's payment fails, the tier reopens and the second bidder can try again
4. This is enforced by a database-level unique constraint or atomic lock on (`painting_id`, `tier`, `status = payment_processing OR active`)

---

## 6. Entity: Reward

A reward is the outbid bidder's 50% share of the tier spread. Rewards are calculated at settlement and paid from the winning bidder's escrowed funds.

### 6.1 Schema

| Field | Type | Description |
|---|---|---|
| `id` * | uuid | Unique identifier |
| `painting_id` * | → Painting | The painting this reward relates to |
| `recipient_id` * | → Bidder | The outbid bidder who earns this reward |
| `lower_tier` * | enum | The tier the recipient held (`tier1`, `tier2`, or `tier3`) |
| `upper_tier` * | enum | The tier that outbid them (`tier2`, `tier3`, or `tier4_wta`) |
| `spread_cents` * | integer | `upper_tier_price - lower_tier_price` (in cents) |
| `reward_cents` * | integer | `spread_cents / 2` (50% of spread — always exact because spread is always even in this pricing model) |
| `source_bid_id` * | → Bid | The outbid bid that generated this reward |
| `winning_bid_id` | → Bid | The bid that outbid the recipient (nullable for WTA — WTA is not a standard bid) |
| `wta_bid_id` | → WTABid | If this reward was triggered by WTA (nullable) |
| `status` * | enum | `pending`, `disbursed`, `cancelled` |
| `disbursement_reference` | string | Fiduciary's payment reference (populated at disbursement) |
| `disbursed_at` | datetime | Timestamp of reward payment |
| `created_at` * | datetime | Record creation timestamp |

### 6.2 Reward Calculation Rules

Rewards are **not calculated at time of outbid** — they are calculated at settlement, after the auction succeeds. The reason: if the auction fails, no rewards are paid. Calculating rewards early would create misleading expectations.

**At settlement, for each painting that has at least one outbid bid:**

1. Identify the chain of bids: tier1 → tier2 → tier3 (or tier4 for WTA)
2. For each tier transition, calculate:
   - `spread = upper_tier_price - lower_tier_price`
   - `reward = spread / 2`
3. Create a Reward record for each transition

**Example: Painting (3,456 sq.in.) sold at Tier 3 with full chain:**

| Transition | Spread | Reward (to outbid bidder) | Artist share of spread |
|---|---|---|---|
| Tier 1 → Tier 2 | $31,104 | $15,552 | $15,552 |
| Tier 2 → Tier 3 | $311,040 | $155,520 | $155,520 |
| **Artist also receives base** | | | **$3,456** (Tier 1 equivalent) |

### 6.3 Reward Precision Guarantee

The tier prices are always `square_inches × {1, 10, 100, 1000}` dollars, stored in cents. The spread between any two adjacent tiers is always `square_inches × {9, 90, 900}` dollars. Dividing by 2 always yields an exact cent amount because `square_inches` is an integer and `{9, 90, 900}` are all odd multiples — but the product in cents is always even (since we multiply by 100 for cents conversion first). No rounding is ever needed.

### 6.4 Self-Outbid Rewards

When a bidder outbids themselves (§5.3), the reward recipient is the same person as the new bidder. This is intentional — they earn their own outbid reward, effectively reducing their net cost by ~50% of each spread they traversed. The Reward entity treats self-outbid identically to any other outbid: `recipient_id` happens to match the new bid's `bidder_id`.

---

## 7. Entity: WTABid

The Winner Takes All bid is structurally different from individual bids: it covers all 52 paintings, is always lawyer-mediated, and immediately closes the auction.

### 7.1 Schema

| Field | Type | Description |
|---|---|---|
| `id` * | uuid | Unique identifier |
| `bidder_id` * | → Bidder | The WTA buyer |
| `total_amount_cents` * | integer | Total WTA price at time of placement (sum of next-tier-up for all 52 paintings) |
| `per_painting_amounts` * | json | Array of 52 objects: `{painting_id, tier_equivalent, amount_cents}` — snapshot of each painting's contribution |
| `contract_reference` * | string | Legal contract document reference |
| `escrow_reference` * | string | Fiduciary's escrow tracking number |
| `status` * | enum | `pending_contract`, `pending_payment`, `payment_confirmed`, `settled`, `cancelled` |
| `placed_at` | datetime | When wire transfer was confirmed by fiduciary |
| `created_at` * | datetime | Record creation timestamp |

### 7.2 WTA Price Calculation

The WTA price is a real-time computation, not a stored value:

```
wta_price = SUM over all 52 paintings of:
  IF painting has no active bid     → tier1_price_cents
  IF painting has active tier1 bid  → tier2_price_cents
  IF painting has active tier2 bid  → tier3_price_cents
  IF painting has active tier3 bid  → tier4_price_cents
```

Display updates in real time on the WTA page and homepage.

### 7.3 WTA Trigger Sequence

When a WTA payment is confirmed:

1. **Freeze the auction.** No new bids accepted. Any `payment_processing` bids are aborted and their payments reversed.
2. **Snapshot the WTA price breakdown.** Record `per_painting_amounts` — this is the binding price.
3. **Refund all active bidders.** Every bid with `status = active` transitions to `refunded_wta`. Refunds initiated immediately.
4. **Calculate rewards.** For each painting with an outbid history, create Reward records as if the WTA tier-equivalent were the winning bid.
5. **Proceed to settlement.** Threshold check is skipped — WTA always meets the threshold.

---

## 8. Auction State Machine

### 8.1 Painting-Level State Machine

Each painting independently tracks its bid state. The painting's state is derived from its bids, not stored separately — it's a computed property.

```
                    ┌─────────┐
                    │  Open   │
                    └────┬────┘
                         │ Tier 1 bid placed
                         ▼
                  ┌──────────────┐
                  │ Tier 1 Held  │
                  └──────┬───────┘
                         │ Tier 2 bid placed (Tier 1 bidder refunded)
                         ▼
                  ┌──────────────┐
                  │ Tier 2 Held  │
                  └──────┬───────┘
                         │ Tier 3 bid placed (Tier 2 bidder refunded)
                         ▼
                  ┌──────────────┐
                  │ Tier 3 Held  │ ← No further individual bids possible
                  └──────────────┘
```

**State derivation rules:**

| Condition | State | Available Tier |
|---|---|---|
| No `active` bid exists | `open` | Tier 1 |
| `active` bid at `tier1` exists | `tier1_held` | Tier 2 |
| `active` bid at `tier2` exists | `tier2_held` | Tier 3 |
| `active` bid at `tier3` exists | `tier3_held` | None |
| `payment_processing` bid at available tier | `bid_in_progress` | None (temporarily) |

**Post-auction states** (after December 31 or WTA trigger):

| Condition | State |
|---|---|
| Auction succeeded, painting has active bid | `sold` |
| Auction succeeded, painting has no bid | `unsold` |
| Auction failed | `auction_failed` |
| WTA triggered | `sold_wta` |

### 8.2 Auction-Level State Machine

The auction itself has a lifecycle:

```
  ┌────────────┐
  │  Pre-Launch │  ← Content loading, paintings cataloged, no bidding
  └─────┬──────┘
        │ Principal approval (HC-04)
        ▼
  ┌────────────┐
  │   Active   │  ← Bidding open, real-time updates
  └─────┬──────┘
        │
        ├── December 31, 2026 reached ──► Closing
        │
        └── WTA bid confirmed ──► WTA Settlement

  ┌────────────┐
  │  Closing   │  ← Grace window: no new bids, in-flight bids may complete (5 min)
  └─────┬──────┘
        │ Grace window expires
        ▼
  ┌────────────┐
  │ Evaluation │  ← Threshold check (§8.3)
  └─────┬──────┘
        │
        ├── Threshold met ──► Settlement
        │
        └── Threshold not met ──► Failed

  ┌────────────┐
  │ Settlement │  ← Disbursements, rewards, certificates
  └─────┬──────┘
        │
        └── All disbursements complete ──► Archive

  ┌────────────┐
  │   Failed   │  ← All active bids refunded, no rewards
  └─────┬──────┘
        │
        └── All refunds complete ──► Archive

  ┌──────────────┐
  │ WTA Settlement│ ← WTA-specific disbursement
  └──────┬────────┘
         │
         └── Complete ──► Archive

  ┌────────────┐
  │  Archive   │  ← Permanent online gallery
  └────────────┘
```

### 8.3 Threshold Evaluation

Performed exactly once, at the moment the auction close datetime is reached:

```
aggregate = SUM of (highest active bid amount_cents) for each painting that has at least one active bid

threshold = SUM of tier1_price_cents for all 52 paintings

IF aggregate >= threshold → Auction succeeds → proceed to Settlement
IF aggregate < threshold → Auction fails → proceed to Failed
```

**Important:** Paintings with no bids contribute $0 to the aggregate, not their Tier 1 price. The threshold is the sum of all Tier 1 prices — the auction must collectively generate at least that amount.

### 8.4 Settlement Sequence

After threshold passes (or WTA is confirmed):

1. **Freeze state.** Auction status → `settlement`. No further mutations.
2. **Calculate rewards.** For each painting, walk the bid chain and create Reward records (§6.2).
3. **Calculate artist disbursements.** For each painting:
   - Base: Tier 1 equivalent price
   - Per-spread artist share: 50% of each spread
   - Total: base + sum of artist spread shares
4. **Deduct fiduciary fees** from artist's total proceeds (not from bidder funds).
5. **Disburse rewards** to outbid bidders via fiduciary.
6. **Disburse artist proceeds** via fiduciary.
7. **Generate certificates of authenticity** (digital PDF per won painting).
8. **Notify all participants** (§10).
9. **Transition to archive** when all disbursements confirmed.

---

## 9. Entity: Auction

A singleton entity representing the auction itself. There is exactly one auction.

### 9.1 Schema

| Field | Type | Description |
|---|---|---|
| `id` * | uuid | Unique identifier |
| `name` * | string | "The Charlotte Collection" |
| `status` * | enum | `pre_launch`, `active`, `closing`, `evaluation`, `settlement`, `wta_settlement`, `failed`, `archive` |
| `threshold_cents` * | integer | Sum of all 52 paintings' `tier1_price_cents`. Computed at catalog finalization. |
| `open_at` * | datetime | Auction launch datetime (spring/summer 2026 — exact date TBD) |
| `close_at` * | datetime | `2026-12-31T23:59:59-05:00` (Eastern Time — Charlotte, NC) |
| `closed_early_at` | datetime | If WTA triggered, the datetime of early close |
| `settlement_started_at` | datetime | When settlement processing began |
| `settlement_completed_at` | datetime | When all disbursements were confirmed |
| `created_at` * | datetime | Record creation timestamp |

### 9.2 Real-Time Computed Values

These are not stored — computed on demand and pushed to clients:

| Value | Formula | Display Location |
|---|---|---|
| **Aggregate** | Sum of highest active bid per painting | Homepage, Auction page, Dashboard |
| **Threshold progress %** | `(aggregate / threshold_cents) × 100` | Homepage, Auction page, Dashboard |
| **Paintings with bids** | Count of paintings with ≥1 active bid | Homepage, Auction page |
| **Total bidders** | Count of distinct bidders with ≥1 active bid | Homepage |
| **Days remaining** | `close_at - now()` | Homepage, Auction page, Dashboard |
| **WTA price** | See §7.2 | Homepage, WTA page |

---

## 10. Notification Events

Notifications are triggered by state transitions and temporal milestones. Each event has a defined trigger, audience, channel, and content template (templates specified in 03a §15).

### 10.1 Event Catalog

| Event | Trigger | Audience | Channels | Template (03a ref) |
|---|---|---|---|---|
| `bid_confirmed` | Bid status → `active` | The bidder | Email | §15.1 |
| `outbid` | Bid status → `outbid` | The outbid bidder | Email + SMS + Push (per prefs) | §15.2 |
| `wta_triggered` | WTA payment confirmed | All bidders with active or outbid bids | Email + SMS + Push | §15.3 |
| `milestone_threshold` | Aggregate crosses 25% / 50% / 75% of threshold | All registered bidders | Email | §15.4 |
| `milestone_painting` | First painting reaches Tier 3, or bid count milestones (10, 25, 40, 52) | All registered bidders | Email | §15.4 |
| `closing_warning_7d` | 7 days before close_at | All bidders with active bids | Email + SMS | §15.5 |
| `closing_warning_24h` | 24 hours before close_at | All bidders with active bids | Email + SMS | §15.5 |
| `closing_warning_1h` | 1 hour before close_at | All bidders with active bids | Email + SMS | §15.5 |
| `auction_success` | Threshold evaluation passes | All bidders (active + outbid) | Email | §15.6 |
| `auction_failed` | Threshold evaluation fails | All bidders (active + outbid) | Email | §15.7 |
| `reward_disbursed` | Reward status → `disbursed` | Reward recipient | Email | §15.6 (reward variant) |
| `refund_processed` | Refund confirmed by payment processor | The refunded bidder | Email | (confirmation email) |

### 10.2 Channel Routing Rules

| Channel | When Used | Controllable by Bidder? |
|---|---|---|
| **Email** | All events | No — always on (required for legal/transactional) |
| **SMS** | Outbid, WTA trigger, closing warnings | Yes — opt-in toggle in Dashboard |
| **Push** | Outbid, WTA trigger | Yes — opt-in toggle in Dashboard |

### 10.3 Timing Constraints

- `outbid` notification: sent within **60 seconds** of the outbid event. This is the highest-priority notification — the bidder needs to know immediately.
- `bid_confirmed`: sent within **5 minutes** of payment confirmation.
- `wta_triggered`: sent within **15 minutes** to all affected bidders.
- Milestone and closing warnings: sent within **1 hour** of trigger (not real-time-critical).
- `refund_processed`: sent when payment processor confirms the refund (processor-dependent timing).

### 10.4 Notification Deduplication

- A bidder should never receive duplicate notifications for the same event.
- If a bidder is outbid on multiple paintings simultaneously (e.g., WTA trigger), send one consolidated email listing all affected paintings, not 52 separate emails.
- Milestone notifications are sent at most once per milestone level (e.g., one email at 50%, not repeated if the aggregate dips and re-crosses).

---

## 11. Content Management

Content is created by William (the artist) and loaded before auction launch. Some content is updatable during the auction.

### 11.1 Painting Content

| Content | Source | Updatable During Auction? |
|---|---|---|
| Title | Artist | No — affects slug, references |
| Dimensions | Physical measurement | No — affects pricing |
| Narrative text | Artist | Yes — artist can refine descriptions |
| Video URL | Artist / production | Yes — new video can be added |
| Images (all sizes) | Photography | Yes — better photos can replace originals |
| Alt text | Derived from title + dimensions | No — auto-generated |

### 11.2 Site Content

| Content | Location (in site design) | Source |
|---|---|---|
| Charlotte Collection intro | Homepage §4.1 | Artist + editor |
| Auction explanation | Auction page §5.1 | Instance (CTO) |
| How Bidding Works full text | §8 | Instance + fiduciary |
| Terms of Service | §8.1 Section 9 | Fiduciary lawyer |
| Artist statement | About page §9.1 | Artist |
| Charlotte Collection story | About page §9.1 | Artist |
| Grief Series narrative | Series page §10.2 | Artist |
| Press / media section | About page §9.1 | Instance |
| Footer legal text | §3.2 | Instance + legal |

### 11.3 Content Pipeline

Content entry method is a Phase 4 decision (CMS admin interface vs. code deployment vs. headless CMS). This spec defines what content exists and its lifecycle constraints — not how it's entered.

---

## 12. Financial Summary Schema

For settlement reporting, the system must produce a complete financial summary.

### 12.1 Per-Painting Settlement Record

| Field | Value |
|---|---|
| Painting | Title, dimensions, square inches |
| Winning tier | Tier 1/2/3 (or "Unsold" or "WTA") |
| Winning bid amount | Dollar amount |
| Winning bidder | Name (legal) |
| Bid chain | Ordered list of all bids placed (tier, bidder, amount, timestamp) |
| Tier 1→2 spread reward | Amount, recipient |
| Tier 2→3 spread reward | Amount, recipient |
| Tier 3→4 spread reward (WTA only) | Amount, recipient |
| Artist base (Tier 1 equivalent) | Amount |
| Artist spread shares | Per-tier amounts |
| Artist total for this painting | Sum of base + spread shares |

### 12.2 Auction-Level Summary

| Field | Value |
|---|---|
| Total escrow received | Sum of all winning bids |
| Total rewards disbursed | Sum of all reward payments |
| Total artist gross | Total escrow - total rewards |
| Fiduciary fees | Amount (deducted from artist gross) |
| Artist net | Artist gross - fiduciary fees |
| Total paintings sold | Count |
| Total paintings unsold | Count |
| Total unique bidders | Count |
| Total bids placed | Count (including outbid bids) |

### 12.3 Tax Reporting

- **Rewards** may be taxable income. The fiduciary may need to issue **1099-MISC** forms to reward recipients receiving $600+ in a calendar year.
- **Sales tax** applies per the buyer's state (Wayfair). Rate determination and collection is a Phase 4 decision (likely handled by the payment processor or a tax service like TaxJar/Avalara).
- **Artist income** reported as business revenue. The fiduciary maintains records per HC-06.

---

## 13. Temporal Rules

### 13.1 Auction Lifecycle Timeline

| Phase | Start | End | What's Possible |
|---|---|---|---|
| **Pre-launch** | Catalog creation | Principal approval (HC-04) | Content loading, painting CRUD, no bidding |
| **Active** | Auction open | Dec 31 2026 23:59:59 ET (or WTA trigger) | Bidding, content updates, real-time data |
| **Evaluation** | Close datetime reached | Threshold check complete | No mutations — read-only moment |
| **Settlement / Failed** | After evaluation | All disbursements / refunds complete | Financial processing only |
| **Archive** | After settlement | Forever | Read-only permanent gallery |

### 13.2 Immutability Schedule

| Data | Becomes Immutable At |
|---|---|
| Painting catalog (titles, dimensions, pricing) | Auction open |
| Gallery display order | Auction open |
| Bid records | Immediately on creation (append-only — status transitions are the only mutations) |
| Reward calculations | Settlement initiation |
| Terms of service | Auction open (HC-03) |

### 13.3 Close Datetime

`2026-12-31T23:59:59-05:00` (Eastern Time, Charlotte NC). Fixed. No extensions (Key Decision #6, HC-03). The system must handle:

- Bids submitted in the final seconds (any bid where `payment_processing` was created before the deadline and payment confirms within a grace window — recommended: 5 minutes — is accepted)
- Time zone display for bidders outside Eastern Time
- Leap second edge cases (treat as non-issue; standard datetime libraries handle this)

---

## 14. Phase 3 Open Question Resolutions (Data/State)

| ID | Question | Resolution |
|---|---|---|
| J02e-03 | Show reward dollar amount in dashboard before settlement? | **No.** Dashboard shows "Reward at settlement if auction succeeds." Amount revealed only at settlement. Matches 03a §11.1 and §15.2. |

### Still Pending (External Dependencies)

| ID | Question | Impact on Data/State | Owner |
|---|---|---|---|
| AM-OQ-01 | Securities counsel review | May affect reward display rules, terms language | William |
| AM-OQ-02 | Fiduciary lawyer selection | Escrow reference formats, settlement API integration | William |
| AM-OQ-04 | Painting inventory (52 with dimensions) | Populates all Painting records, sets threshold_cents | William |
| J02a-08 | Wire transfer threshold | Determines which tier buttons trigger credit card vs. lawyer-mediated flow | Fiduciary |
| J02c-01 | Credit card / lawyer-mediated threshold | Same — affects bid flow routing logic | Fiduciary |

---

## 15. Cross-Reference: Site Design ↔ Data/State

This table maps every dynamic element in 03a to the data entity and computation that powers it.

| Site Design Element (03a ref) | Data Source | Computation |
|---|---|---|
| Gallery scroller bid status (§12.2) | Painting state (§8.1) | Derived from active bids |
| Tier button states (§13.2) | Painting state + Bid.status | Available/Held/InProgress/Grayed |
| Tier button prices (§13.3) | Painting.tier{N}_price_cents | Direct lookup |
| Current bidder name (§6.1) | Bid.display_name + Bid.visibility | Show name if public, "Private Bidder" if private |
| Threshold progress bar (§4.1) | Auction computed values (§9.2) | aggregate / threshold_cents |
| WTA price (§7.2) | WTA calculation (§7.2) | Sum of next-tier-up per painting |
| Days remaining (§4.1) | Auction.close_at | close_at - now() |
| Paintings with bids count (§4.1) | Bid entity | Count distinct painting_id where status = active |
| Dashboard active bids (§11.1) | Bid entity | Where bidder_id = current_user AND status = active |
| Dashboard outbid history (§11.1) | Bid entity + Reward entity | Where bidder_id = current_user AND status = outbid |
| Shipping estimate (§6.3) | Painting.size_category | Lookup from size_category → estimate range |
| Notification templates (§15.*) | Notification events (§10) | Template populated from Bid, Painting, Bidder, Reward entities |
| Open Graph dynamic descriptions (§16.3) | Painting state | Server-rendered from current bid status |
