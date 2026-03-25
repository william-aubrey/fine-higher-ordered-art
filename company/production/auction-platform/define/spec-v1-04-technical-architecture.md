# Technical Architecture — Charlotte Collection Auction Platform

*Phase 4 (BUILD) — Spec-Driven Development*
*Version: v1*
*Date: 2026-03-24*
*Author: CTO Agent*

---

## 1. Overview

This document specifies how the Charlotte Collection auction platform is built: infrastructure, services, API contracts, database schema, authentication, payment integration, real-time systems, deployment, security, and testing. It translates the site design (03a) and data/state specification (03b) into an implementable technical blueprint.

**What this document covers:**
- Architecture pattern and service boundaries
- Database schema (mapping 03b entities to tables)
- API contracts (every endpoint, request/response, errors)
- Authentication and authorization
- Payment processor integration (Stripe)
- Real-time bid status system
- Notification delivery system
- Deployment and infrastructure
- Security requirements
- Acceptance criteria per functional requirement
- Test strategy

**What this document does NOT cover:**
- What the user sees → `spec-v1-03a-site-design.md`
- What the data means → `spec-v1-03b-data-and-state.md`
- Who uses the product → `spec-v1-01-icp-jtbd.md`

---

## 2. Architecture Pattern

### 2.1 Decision: Static Site + Serverless API

The platform is a **static frontend** (server-side rendered at build time + client-side hydration) backed by **serverless API functions** for all dynamic operations.

**Rationale:**
- 52 paintings is a fixed catalog — the gallery pages are static content with dynamic bid overlays
- Bid volume is low (dozens to hundreds of bids over 6 months, not thousands per second)
- Serverless scales to zero when idle (most of the auction's lifetime) and handles bid spikes without provisioning
- The auction runs once and then becomes a permanent static archive — the infrastructure naturally degrades to pure static hosting
- Reduces operational burden: no servers to maintain, no uptime monitoring during a 6-month auction

**Technology stack:**

| Layer | Technology | Rationale |
|---|---|---|
| **Frontend** | Next.js (App Router, static export + SSR for dynamic pages) | React ecosystem, excellent static generation, server components for OG tags, Vercel-native |
| **API** | Next.js API Routes (serverless functions on Vercel) | Co-located with frontend, zero cold-start on Vercel, TypeScript throughout |
| **Database** | PostgreSQL (managed — Neon or Supabase) | ACID transactions required for bid atomicity, relational model matches 03b entities |
| **Real-time** | Supabase Realtime (Postgres changes → WebSocket) or Ably | Push bid status updates to all connected clients |
| **Payments** | Stripe | PCI-compliant (HC-05), handles credit card + escrow-like holds, proven for marketplaces |
| **Auth** | NextAuth.js (Auth.js) | Google/Apple OAuth + email/password, session management |
| **Email** | Resend or Postmark | Transactional email with high deliverability |
| **SMS** | Twilio | Outbid and closing warning notifications |
| **CDN / Hosting** | Vercel | Global CDN, edge functions, zero-config deployment from Git |
| **Image storage** | Vercel Blob + Next.js Image Optimization | 52 source images + 52 OG variants. On-demand resizing/format conversion. See §13.2. |
| **Monitoring** | Vercel Analytics + Sentry | Error tracking, performance monitoring |

### 2.2 Service Boundaries

```
┌──────────────────────────────────────────────────┐
│                    Vercel CDN                     │
│  Static pages, images, JS bundles                 │
└──────────────────┬───────────────────────────────┘
                   │
┌──────────────────▼───────────────────────────────┐
│              Next.js Application                  │
│                                                   │
│  ┌─────────────┐  ┌──────────────┐  ┌─────────┐ │
│  │ Static Pages │  │ Server Pages │  │   API   │ │
│  │ (ISR/SSG)   │  │ (SSR for OG) │  │ Routes  │ │
│  └─────────────┘  └──────────────┘  └────┬────┘ │
└──────────────────────────────────────────┼──────┘
                                           │
              ┌────────────────────────────┼────────────────┐
              │                            │                │
    ┌─────────▼────────┐    ┌─────────────▼──┐    ┌───────▼──────┐
    │   PostgreSQL DB   │    │    Stripe API   │    │  Real-time   │
    │  (Neon/Supabase)  │    │   (Payments)    │    │  (WebSocket) │
    └──────────────────┘    └────────────────┘    └──────────────┘
              │
    ┌─────────▼────────┐
    │ Notification Queue│
    │  (Email/SMS/Push) │
    └──────────────────┘
```

### 2.3 Why Not a Full Backend Framework?

A traditional server (Express, Django, Rails) would work but adds operational complexity disproportionate to the workload. This auction serves ~52 products over 6 months. The critical operations (placing a bid, processing payment, calculating WTA) happen infrequently. Serverless functions handle these spikes efficiently without maintaining idle infrastructure.

---

## 3. Database Schema

All entities from 03b §2–§9 map to PostgreSQL tables. This section defines the physical schema.

### 3.1 Table: `paintings`

```sql
CREATE TABLE paintings (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug            VARCHAR(100) UNIQUE NOT NULL,
  title           VARCHAR(200) NOT NULL,
  width_inches    DECIMAL(6,2) NOT NULL,
  height_inches   DECIMAL(6,2) NOT NULL,
  square_inches   INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches)) STORED,
  tier1_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 100) STORED,
  tier2_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 1000) STORED,
  tier3_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 10000) STORED,
  tier4_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 100000) STORED,
  display_order   INTEGER NOT NULL,
  series_id       UUID REFERENCES series(id),
  series_order    INTEGER,
  size_category   VARCHAR(20) NOT NULL CHECK (size_category IN ('small', 'medium', 'large', 'oversized')),
  shipping_estimate_low_cents  INTEGER NOT NULL,
  shipping_estimate_high_cents INTEGER NOT NULL,
  narrative       TEXT,
  video_url       VARCHAR(500),
  image_source_url    VARCHAR(500) NOT NULL,   -- full-res original in Vercel Blob (§13.2)
  image_og_url        VARCHAR(500) NOT NULL,   -- pre-generated 1200x630 for meta tags (§13.2.3)
  alt_text        VARCHAR(500) NOT NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 3.2 Table: `series`

```sql
CREATE TABLE series (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug            VARCHAR(100) UNIQUE NOT NULL,
  title           VARCHAR(200) NOT NULL,
  narrative       TEXT,
  display_order   INTEGER NOT NULL
);
```

### 3.3 Table: `bidders`

```sql
CREATE TABLE bidders (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email           VARCHAR(320) UNIQUE NOT NULL,
  full_legal_name VARCHAR(200) NOT NULL,
  phone           VARCHAR(20) NOT NULL,
  street1         VARCHAR(200) NOT NULL,
  street2         VARCHAR(200),
  city            VARCHAR(100) NOT NULL,
  state           CHAR(2) NOT NULL,
  zip             VARCHAR(10) NOT NULL,
  auth_provider   VARCHAR(20) NOT NULL CHECK (auth_provider IN ('email', 'google', 'apple')),
  auth_provider_id VARCHAR(200),
  password_hash   VARCHAR(200),
  email_verified  BOOLEAN NOT NULL DEFAULT FALSE,
  notify_email    BOOLEAN NOT NULL DEFAULT TRUE,
  notify_sms      BOOLEAN NOT NULL DEFAULT FALSE,
  notify_push     BOOLEAN NOT NULL DEFAULT FALSE,
  terms_accepted_at TIMESTAMPTZ,
  terms_version   VARCHAR(20),
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 3.4 Table: `bids`

```sql
CREATE TABLE bids (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  painting_id     UUID NOT NULL REFERENCES paintings(id),
  bidder_id       UUID NOT NULL REFERENCES bidders(id),
  tier            VARCHAR(10) NOT NULL CHECK (tier IN ('tier1', 'tier2', 'tier3')),
  amount_cents    INTEGER NOT NULL,
  status          VARCHAR(30) NOT NULL CHECK (status IN (
    'payment_processing', 'active', 'outbid',
    'won', 'refunded_auction_failed', 'refunded_wta', 'payment_failed'
  )),
  visibility      VARCHAR(10) NOT NULL DEFAULT 'private' CHECK (visibility IN ('public', 'private')),
  display_name    VARCHAR(200),
  payment_intent_id VARCHAR(200) NOT NULL,
  escrow_reference  VARCHAR(200),
  refund_id       VARCHAR(200),
  refund_initiated_at TIMESTAMPTZ,
  placed_at       TIMESTAMPTZ,
  outbid_at       TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Enforce: at most one active or payment_processing bid per painting per tier
CREATE UNIQUE INDEX idx_bids_active_per_tier
  ON bids (painting_id, tier)
  WHERE status IN ('active', 'payment_processing');

-- Enforce: at most one active bid per bidder per painting
CREATE UNIQUE INDEX idx_bids_active_per_bidder_painting
  ON bids (painting_id, bidder_id)
  WHERE status = 'active';
```

### 3.5 Table: `rewards`

```sql
CREATE TABLE rewards (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  painting_id     UUID NOT NULL REFERENCES paintings(id),
  recipient_id    UUID NOT NULL REFERENCES bidders(id),
  lower_tier      VARCHAR(10) NOT NULL,
  upper_tier      VARCHAR(10) NOT NULL,
  spread_cents    INTEGER NOT NULL,
  reward_cents    INTEGER NOT NULL,
  source_bid_id   UUID NOT NULL REFERENCES bids(id),
  winning_bid_id  UUID REFERENCES bids(id),
  wta_bid_id      UUID REFERENCES wta_bids(id),
  status          VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'disbursed', 'cancelled')),
  disbursement_reference VARCHAR(200),
  disbursed_at    TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 3.6 Table: `wta_bids`

```sql
CREATE TABLE wta_bids (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bidder_id       UUID NOT NULL REFERENCES bidders(id),
  total_amount_cents INTEGER NOT NULL,
  per_painting_amounts JSONB NOT NULL,
  contract_reference VARCHAR(200) NOT NULL,
  escrow_reference   VARCHAR(200) NOT NULL,
  status          VARCHAR(30) NOT NULL CHECK (status IN (
    'pending_contract', 'pending_payment', 'payment_confirmed', 'settled', 'cancelled'
  )),
  placed_at       TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 3.7 Table: `auction`

```sql
CREATE TABLE auction (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name            VARCHAR(200) NOT NULL DEFAULT 'The Charlotte Collection',
  status          VARCHAR(20) NOT NULL CHECK (status IN (
    'pre_launch', 'active', 'evaluation', 'settlement', 'wta_settlement', 'failed', 'archive'
  )),
  threshold_cents INTEGER NOT NULL,
  open_at         TIMESTAMPTZ NOT NULL,
  close_at        TIMESTAMPTZ NOT NULL DEFAULT '2026-12-31T23:59:59-05:00',
  closed_early_at TIMESTAMPTZ,
  settlement_started_at TIMESTAMPTZ,
  settlement_completed_at TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

### 3.8 Table: `notifications`

```sql
CREATE TABLE notifications (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_type      VARCHAR(50) NOT NULL,
  bidder_id       UUID NOT NULL REFERENCES bidders(id),
  channel         VARCHAR(10) NOT NULL CHECK (channel IN ('email', 'sms', 'push')),
  status          VARCHAR(20) NOT NULL CHECK (status IN ('queued', 'sent', 'failed', 'skipped')),
  payload         JSONB NOT NULL,
  sent_at         TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Deduplication: one notification per event per bidder per channel
CREATE UNIQUE INDEX idx_notifications_dedup
  ON notifications (event_type, bidder_id, channel, (payload->>'reference_id'))
  WHERE status != 'failed';
```

### 3.9 Indexes

```sql
-- Painting lookups
CREATE INDEX idx_paintings_slug ON paintings(slug);
CREATE INDEX idx_paintings_display_order ON paintings(display_order);
CREATE INDEX idx_paintings_series ON paintings(series_id);

-- Bid queries
CREATE INDEX idx_bids_painting_status ON bids(painting_id, status);
CREATE INDEX idx_bids_bidder ON bids(bidder_id);
CREATE INDEX idx_bids_status ON bids(status);

-- Reward queries
CREATE INDEX idx_rewards_recipient ON rewards(recipient_id);
CREATE INDEX idx_rewards_painting ON rewards(painting_id);

-- Notification queries
CREATE INDEX idx_notifications_bidder ON notifications(bidder_id);
CREATE INDEX idx_notifications_status ON notifications(status) WHERE status = 'queued';
```

---

## 4. API Contracts

All API endpoints are Next.js API Routes deployed as serverless functions. All responses are JSON. All authenticated endpoints require a valid session cookie.

### 4.1 Public Endpoints (No Auth)

#### `GET /api/paintings`

Returns all 52 paintings with current bid status.

**Response: 200**
```json
{
  "paintings": [
    {
      "id": "uuid",
      "slug": "acceptance",
      "title": "Acceptance",
      "widthInches": 48,
      "heightInches": 72,
      "squareInches": 3456,
      "tier1PriceCents": 345600,
      "tier2PriceCents": 3456000,
      "tier3PriceCents": 34560000,
      "displayOrder": 1,
      "seriesId": "uuid|null",
      "sizeCategory": "oversized",
      "shippingEstimateLowCents": 20000,
      "shippingEstimateHighCents": 50000,
      "narrative": "...",
      "videoUrl": "https://...|null",
      "imageSourceUrl": "https://...",
      "imageOgUrl": "https://...",
      "altText": "Acceptance, acrylic on canvas, 48\" × 72\"",
      "currentState": "tier2_held",
      "currentBid": {
        "tier": "tier2",
        "amountCents": 3456000,
        "visibility": "public",
        "displayName": "Jane Smith",
        "placedAt": "2026-07-15T14:30:00Z"
      },
      "bidInProgress": false
    }
  ]
}
```

**Notes:** `currentBid` is null if state is `open`. `displayName` is null if `visibility` is `private`. `bidInProgress` is true if a `payment_processing` record exists for the next available tier.

#### `GET /api/paintings/[slug]`

Returns a single painting with full detail.

**Response: 200** — Same shape as array item above. (The `imageSourceUrl` serves all sizes via Next.js Image component — no separate full-resolution URL needed.)

**Response: 404** — `{ "error": "Painting not found" }`

#### `GET /api/auction`

Returns auction-level computed values.

**Response: 200**
```json
{
  "status": "active",
  "thresholdCents": 15000000,
  "aggregateCents": 8750000,
  "thresholdPercent": 58.3,
  "paintingsWithBids": 34,
  "totalBidders": 47,
  "wtaPriceCents": 95000000,
  "closeAt": "2026-12-31T23:59:59-05:00",
  "daysRemaining": 168
}
```

#### `GET /api/series`

Returns all series with their paintings.

**Response: 200**
```json
{
  "series": [
    {
      "id": "uuid",
      "slug": "grief",
      "title": "The Grief Series",
      "narrative": "...",
      "paintings": ["uuid", "uuid", "uuid", "uuid", "uuid", "uuid"]
    }
  ]
}
```

### 4.2 Authenticated Endpoints

#### `POST /api/bids`

Place a bid on a painting. Initiates payment processing.

**Request:**
```json
{
  "paintingId": "uuid",
  "tier": "tier1"
}
```

**Response: 201** (payment processing initiated)
```json
{
  "bidId": "uuid",
  "paymentIntentClientSecret": "pi_xxx_secret_xxx",
  "amountCents": 345600,
  "expiresAt": "2026-07-15T14:35:00Z"
}
```

The client uses `paymentIntentClientSecret` with Stripe.js to complete payment on the frontend (PCI-compliant — card details never touch our server).

**Response: 409** (tier not available)
```json
{
  "error": "tier_not_available",
  "message": "This tier already has an active bid or a bid in progress.",
  "currentState": "tier1_held"
}
```

**Response: 409** (bidder already holds a bid on this painting)
```json
{
  "error": "existing_active_bid",
  "message": "You already hold an active bid on this painting.",
  "existingTier": "tier1"
}
```

**Response: 400** (sequential progression violated)
```json
{
  "error": "sequential_progression",
  "message": "Tier 2 is not available. This painting must have a Tier 1 bid first.",
  "currentState": "open"
}
```

**Response: 403** (auction not active)
```json
{
  "error": "auction_not_active",
  "message": "The auction is not currently accepting bids."
}
```

#### `POST /api/bids/[bidId]/confirm`

Called by webhook or client after Stripe payment succeeds. Transitions bid from `payment_processing` to `active`.

**This endpoint is primarily called by a Stripe webhook**, not the client directly. The client receives real-time confirmation via WebSocket.

**Webhook payload processing:**
1. Verify Stripe webhook signature
2. Match `payment_intent.succeeded` event to bid record
3. Transition bid to `active`
4. If a lower-tier bid exists on this painting, transition it to `outbid` and initiate refund
5. Broadcast painting state change via real-time channel
6. Queue `bid_confirmed` notification for the bidder
7. Queue `outbid` notification for the displaced bidder (if any)

#### `PATCH /api/bids/[bidId]/visibility`

Update bid visibility (public/private).

**Request:**
```json
{
  "visibility": "public",
  "displayName": "Jane Smith"
}
```

**Response: 200**
```json
{
  "visibility": "public",
  "displayName": "Jane Smith"
}
```

#### `GET /api/dashboard`

Returns the authenticated bidder's complete auction state.

**Response: 200**
```json
{
  "activeBids": [
    {
      "bidId": "uuid",
      "painting": { "slug": "acceptance", "title": "Acceptance", "imageSourceUrl": "..." },
      "tier": "tier2",
      "amountCents": 3456000,
      "placedAt": "2026-07-15T14:30:00Z"
    }
  ],
  "outbidHistory": [
    {
      "bidId": "uuid",
      "painting": { "slug": "anger", "title": "Anger", "imageSourceUrl": "..." },
      "tier": "tier1",
      "amountCents": 345600,
      "refundedAt": "2026-08-01T10:00:00Z",
      "rewardStatus": "pending"
    }
  ],
  "notificationPreferences": {
    "email": true,
    "sms": false,
    "push": false
  }
}
```

**Note:** `rewardStatus` is `pending` until settlement. No dollar amount is shown (03b §14 — reward amount hidden until settlement).

#### `PATCH /api/dashboard/notifications`

Update notification preferences.

**Request:**
```json
{
  "sms": true,
  "push": false
}
```

**Response: 200** — Updated preferences object.

### 4.3 Admin Endpoints

These endpoints are used by the artist/admin for content management and auction operations. Protected by admin role.

#### `PUT /api/admin/paintings/[id]`

Update painting content (narrative, video, images). Cannot update dimensions or pricing.

#### `POST /api/admin/auction/launch`

Transition auction from `pre_launch` to `active`. Requires HC-04 Principal approval (enforced by admin auth — only the artist's account can trigger this).

#### `POST /api/admin/auction/evaluate`

Trigger threshold evaluation (normally automated at close_at, but available for manual trigger).

#### `POST /api/admin/bids`

Record a lawyer-mediated bid (above credit card threshold). Entered by admin after fiduciary confirms wire transfer and contract execution.

**Request:**
```json
{
  "paintingId": "uuid",
  "tier": "tier2",
  "bidderId": "uuid",
  "escrowReference": "FHOA-ESC-2026-0042",
  "contractReference": "FHOA-CONTRACT-2026-0042"
}
```

**Response: 201**
```json
{
  "bidId": "uuid",
  "status": "active",
  "amountCents": 3456000
}
```

**Behavior:**
1. Validate sequential progression (same rules as self-service bids)
2. Compute amount from painting dimensions and tier (server-side — never trust client)
3. Create bid record with `status = active` (no payment_processing phase — wire already received)
4. Set `escrow_reference` and mark `placed_at = now()`
5. **Execute outbid cascade:** if a lower-tier active bid exists, transition to `outbid`, initiate Stripe refund for the displaced bidder
6. Broadcast painting state change via real-time channel
7. Queue `bid_confirmed` notification for the new bidder
8. Queue `outbid` notification for the displaced bidder (if any)
9. Recalculate WTA price

**Important:** The outbid cascade, real-time broadcast, and notifications must fire identically to self-service bids. The only difference is payment confirmation is implicit (admin attests wire receipt).

#### `POST /api/admin/wta`

Record a WTA bid (entered by admin after fiduciary confirms wire transfer). Triggers the WTA sequence (03b §7.3).

### 4.4 Webhook Endpoints

#### `POST /api/webhooks/stripe`

Handles Stripe webhook events. Verifies signature. Processes:

| Event | Action |
|---|---|
| `payment_intent.succeeded` | Confirm bid, transition to active, handle outbid cascade |
| `payment_intent.payment_failed` | Transition bid to payment_failed, release tier hold |
| `payment_intent.expired` | Same as payment_failed |
| `charge.refunded` | Update bid refund_id and refund_initiated_at |

### 4.5 Error Response Format

All errors follow a consistent shape:

```json
{
  "error": "error_code",
  "message": "Human-readable description",
  "details": {}
}
```

HTTP status codes:
- `400` — Invalid request (bad input, validation failure)
- `401` — Not authenticated
- `403` — Not authorized (auction not active, admin-only)
- `404` — Resource not found
- `409` — Conflict (race condition, constraint violation)
- `500` — Internal server error

---

## 5. Authentication

### 5.1 Strategy

NextAuth.js (Auth.js) with three providers:

| Provider | Method | Notes |
|---|---|---|
| **Google** | OAuth 2.0 | Provides email, name. Additional registration fields required (phone, address). |
| **Apple** | OAuth 2.0 (Sign in with Apple) | Provides email (may be relay). Additional fields required. |
| **Email** | Email + password (credentials provider) | Email verification required before bidding. Bcrypt hash with cost factor 12. |

### 5.2 Session Management

- **Session strategy:** JWT stored in HTTP-only, secure, SameSite=Strict cookie
- **Session lifetime:** 30 days (the auction runs 6 months — frequent re-auth is hostile)
- **Refresh:** Silent refresh before expiry

### 5.3 Registration Completion

OAuth provides email and sometimes name. After OAuth callback, check if the bidder record is complete (all required fields from 03b §4.1). If incomplete, redirect to a registration completion form before allowing any bids.

### 5.4 Authorization Rules

| Action | Requirement |
|---|---|
| Browse gallery, view paintings | None (public) |
| Place a bid | Authenticated + email verified + registration complete + terms accepted |
| View dashboard | Authenticated |
| Update notification preferences | Authenticated |
| Admin operations | Authenticated + admin role |

---

## 6. Payment Integration (Stripe)

### 6.1 Why Stripe

- **PCI DSS compliance** (HC-05): Stripe.js + Stripe Elements means card data never touches our servers. We are SAQ-A eligible (lowest PCI burden).
- **Payment Intents API**: Supports the "create intent → confirm → capture" flow needed for bid atomicity
- **Refunds API**: Programmatic refund for outbid bidders — immediate, automated
- **Stripe Connect** (optional): If the fiduciary operates as the platform account, Stripe Connect handles the escrow-like fund flow
- **Established for art/marketplace**: Stripe is widely used by art platforms and marketplaces
- **Webhook reliability**: Stripe's webhook system handles the async payment confirmation flow

### 6.2 Payment Flow

```
Client                    Our API                  Stripe
  │                          │                       │
  │ POST /api/bids           │                       │
  │ {paintingId, tier}       │                       │
  │─────────────────────────►│                       │
  │                          │ Create PaymentIntent   │
  │                          │──────────────────────►│
  │                          │ ◄─── client_secret     │
  │                          │                       │
  │                          │ Create bid record      │
  │                          │ (payment_processing)   │
  │◄─────────────────────────│                       │
  │ {bidId, clientSecret}    │                       │
  │                          │                       │
  │ stripe.confirmPayment()  │                       │
  │ (Stripe.js on client)    │                       │
  │──────────────────────────────────────────────────►│
  │                          │                       │
  │                          │ Webhook:               │
  │                          │ payment_intent.succeeded│
  │                          │◄──────────────────────│
  │                          │                       │
  │                          │ Bid → active           │
  │                          │ Outbid cascade          │
  │                          │ Notifications           │
  │                          │                       │
  │ Real-time update         │                       │
  │◄─────────────────────────│                       │
```

### 6.3 Stripe Configuration

| Setting | Value |
|---|---|
| **Payment methods** | Card (Visa, Mastercard, Amex, Discover) |
| **Currency** | USD |
| **Capture method** | Automatic (charge immediately — bids are paid, not held) |
| **Refund method** | Full refund via Stripe API on outbid |
| **Statement descriptor** | "FHOA AUCTION" |
| **Metadata on PaymentIntent** | `bid_id`, `painting_id`, `tier`, `bidder_id` |

### 6.4 Escrow Consideration

Stripe is the payment processor, but the fiduciary is the legal custodian of funds. Two possible models:

**Model A — Stripe Connect (recommended):**
The fiduciary operates a Stripe Connect account as the "platform." Payments flow to the fiduciary's connected account. The fiduciary controls disbursement.

**Model B — Direct + Transfer:**
Payments go to a standard Stripe account controlled by the fiduciary. Our platform initiates charges but the fiduciary's account receives the funds.

**Decision deferred to fiduciary engagement (AM-OQ-02).** The API contracts above work with either model. The `escrow_reference` field on bids accommodates the fiduciary's tracking number regardless of Stripe configuration.

### 6.5 Sales Tax Handling

**Decision: Sales tax is collected at settlement, not at bid placement.**

Rationale:
- The bid amount is the tier price — $1/$10/$100 per sq.in. These are the published, transparent prices per HC-03.
- Adding tax at bid placement creates a confusing UX: "Tier 1 — $3,456" but the charge is $3,456 + $276.48 (8% NC tax). The displayed price would not match the charged price.
- Tax rates depend on the buyer's state, which is known at registration but may change (buyer moves). Tax is most accurately calculated at settlement.
- The fiduciary handles settlement disbursements, including tax remittance.

**Implementation:**
1. **Stripe PaymentIntent amount** = `tier_price_cents` (no tax added)
2. **Bid.amount_cents** = `tier_price_cents` (matches Stripe charge)
3. **At settlement:** Calculate applicable sales tax per buyer's state using Stripe Tax or a tax service (TaxJar, Avalara)
4. **Tax is collected from the winning bidder as a separate settlement charge** — not deducted from the artist's proceeds
5. **The platform issues a settlement invoice** showing: painting price + sales tax = total due. The tier price was already charged; the tax delta is collected at settlement.
6. **Outbid bidders** owe no tax (they received a refund, not a product). Rewards may be taxable income — the fiduciary handles 1099s.
7. **WTA buyer:** Tax calculated on the full WTA amount at settlement, handled by the fiduciary as part of the lawyer-mediated contract.

**Tier button display:** Shows tier price only. No "+ tax" suffix. The How Bidding Works page (03a §8) discloses: "Applicable sales tax will be calculated and collected at settlement based on your shipping address."

### 6.6 High-Value Bids (Above Threshold)

Bids above the credit-card/lawyer-mediated threshold (J02c-01 — pending fiduciary advice, estimated $5,000–$10,000) are NOT processed through Stripe self-service. Instead:

1. The "Arrange Purchase" button displays fiduciary contact info (03a §14.4)
2. The buyer contacts the fiduciary directly
3. Wire transfer goes to the fiduciary's trust account
4. The fiduciary confirms receipt to the admin
5. The admin uses `POST /api/admin/wta` (or a similar admin endpoint for high-value individual bids) to record the bid
6. An admin endpoint for recording lawyer-mediated bids: `POST /api/admin/bids` with `{ paintingId, tier, bidderId, escrowReference }`

---

## 7. Real-Time System

### 7.1 Requirements

The following must update in real time for all connected clients (03a §4.1, §6.2, §7.2, §12.2):

| Data | Update Trigger | Latency Target |
|---|---|---|
| Painting bid status | Bid placed or outbid | < 2 seconds |
| Bid-in-progress indicator | Payment processing started/ended | < 2 seconds |
| WTA price | Any bid status change | < 5 seconds |
| Auction aggregate / threshold % | Any bid status change | < 5 seconds |
| Paintings with bids count | Any bid status change | < 5 seconds |

### 7.2 Implementation: Supabase Realtime

If using Supabase for the database:

- Supabase Realtime listens to Postgres changes (via logical replication)
- Client subscribes to the `bids` table changes
- On bid insert/update, client receives the change and updates local state
- No custom WebSocket server needed

If using Neon (no built-in realtime):

- Use Ably or Pusher as a dedicated real-time channel
- After bid confirmation (webhook handler), publish an event to the channel
- Client subscribes to the channel and updates on events

### 7.3 Channel Structure

```
auction:paintings          → all painting state changes (bid placed, outbid)
auction:stats              → aggregate values (threshold %, WTA price, counts)
auction:painting:{id}      → per-painting updates (for Image Page viewers)
```

### 7.4 Reconnection Behavior

- On WebSocket disconnect, client falls back to polling (`GET /api/paintings` every 30 seconds)
- On reconnect, client fetches full state to reconcile any missed events
- Visual indicator: no stale-data warnings needed for an auction with bid volume this low

---

## 8. Notification Delivery

### 8.1 Architecture

Notifications are queued in the `notifications` table and processed by a background job.

```
Bid event → Insert notification rows → Background processor → Send via provider
```

The background processor can be:
- A Vercel Cron Job (runs every 30 seconds, processes queued notifications)
- A Supabase Edge Function triggered by database insert
- An Inngest or Trigger.dev function for reliable async execution

### 8.2 Email (Resend or Postmark)

| Setting | Value |
|---|---|
| **From address** | `auction@fhoa.org` |
| **Reply-to** | Press inquiry email (not the artist's personal email) |
| **Templates** | HTML + plain text. Art-first design consistent with site. |
| **Rate limits** | Per-provider defaults (Resend: 100/sec, Postmark: 500/sec). More than sufficient. |

### 8.3 SMS (Twilio)

| Setting | Value |
|---|---|
| **From number** | Dedicated Twilio number (or short code) |
| **Opt-in** | Bidder must explicitly enable SMS in Dashboard |
| **Content** | Plain text, ≤ 160 characters when possible |
| **Compliance** | TCPA compliance — explicit opt-in, easy opt-out via STOP |

### 8.4 Push Notifications

Browser push via web push API (service worker). Optional — lowest priority channel. Implementation details deferred; the pattern is standard.

---

## 9. Deployment

### 9.1 Environments

| Environment | Purpose | URL |
|---|---|---|
| **Development** | Local development | `localhost:3000` |
| **Staging** | Pre-production testing | `staging.fhoa.org` |
| **Production** | Live auction | `fhoa.org` |

### 9.2 Deployment Pipeline

```
Git push → Vercel auto-deploy → Build (Next.js) → Deploy to edge
```

- **Preview deployments:** Every PR gets a unique preview URL
- **Production deployment:** Merges to `main` auto-deploy to production
- **Rollback:** Vercel instant rollback to any previous deployment

### 9.3 Environment Variables

| Variable | Purpose | Example |
|---|---|---|
| `DATABASE_URL` | PostgreSQL connection string | `postgresql://...` |
| `STRIPE_SECRET_KEY` | Stripe API key | `sk_live_...` |
| `STRIPE_WEBHOOK_SECRET` | Webhook signature verification | `whsec_...` |
| `STRIPE_PUBLISHABLE_KEY` | Client-side Stripe.js | `pk_live_...` |
| `NEXTAUTH_SECRET` | Session encryption | Random 32+ char string |
| `NEXTAUTH_URL` | Canonical URL | `https://fhoa.org` |
| `GOOGLE_CLIENT_ID` | Google OAuth | `...apps.googleusercontent.com` |
| `GOOGLE_CLIENT_SECRET` | Google OAuth | `GOCSPX-...` |
| `APPLE_CLIENT_ID` | Apple OAuth | `org.fhoa.signin` |
| `APPLE_CLIENT_SECRET` | Apple OAuth | JWT |
| `RESEND_API_KEY` | Email delivery | `re_...` |
| `TWILIO_ACCOUNT_SID` | SMS delivery | `AC...` |
| `TWILIO_AUTH_TOKEN` | SMS delivery | Token |
| `TWILIO_FROM_NUMBER` | SMS sender | `+1...` |
| `REALTIME_URL` | WebSocket connection | Provider-dependent |
| `ADMIN_EMAIL` | Admin role check | William's email |

### 9.4 Domain Configuration

- `fhoa.org` → Vercel (A record or CNAME)
- SSL: Automatic via Vercel (Let's Encrypt)
- `www.fhoa.org` → redirect to `fhoa.org`

### 9.5 Auction Close Trigger

The auction close is the single most critical automated event in the system. It must execute reliably at `2026-12-31T23:59:59-05:00`.

**Mechanism: Vercel Cron Job + Grace Window**

```
Cron schedule: */1 * * * * (every minute)
Function: checkAuctionClose()
```

**`checkAuctionClose()` logic:**

```
1. Read auction record
2. IF auction.status !== 'active' → return (no-op)
3. IF now() < auction.close_at → return (not yet)
4. IF now() >= auction.close_at AND now() < auction.close_at + 5 minutes:
     a. Set auction.status = 'closing' (new transitional status)
     b. Reject new bid CREATION (POST /api/bids returns 403)
     c. Allow in-flight bids (payment_processing created before close_at) to complete
     d. Return (wait for grace window)
5. IF now() >= auction.close_at + 5 minutes:
     a. Sweep: any remaining payment_processing bids created before close_at
        with payment still unconfirmed → transition to payment_failed, cancel PaymentIntent
     b. Set auction.status = 'evaluation'
     c. Run evaluateThreshold()
     d. Based on result: set status to 'settlement' or 'failed'
     e. Queue appropriate notifications
```

**The `closing` status** is a new transitional state (added to auction status enum). It means:
- No new bids can be initiated
- Existing `payment_processing` bids are still allowed to confirm (Stripe webhook still processes `payment_intent.succeeded`)
- After 5 minutes, any unconfirmed in-flight bids are swept and evaluation proceeds

**Failsafe:** The cron runs every minute. If it misses one cycle (Vercel hiccup), the next cycle catches it. The logic is idempotent — running checkAuctionClose() multiple times in `closing` state just re-checks if the grace period has elapsed. Running it in `evaluation` or later states is a no-op.

**Manual override:** `POST /api/admin/auction/evaluate` exists as a fallback if the cron fails entirely. The admin can trigger evaluation manually.

**Update to auction status enum:**

Add `closing` to the auction status values:
```sql
CHECK (status IN ('pre_launch', 'active', 'closing', 'evaluation', 'settlement', 'wta_settlement', 'failed', 'archive'))
```

**Update to `POST /api/bids` validation:**
- `auction.status === 'active'` → allow bid creation
- `auction.status === 'closing'` → reject with `{ "error": "auction_closing", "message": "The auction is closing. No new bids can be placed." }`
- Any other status → reject with `auction_not_active`

---

## 10. Security

### 10.1 PCI Compliance (HC-05)

- **SAQ-A eligible:** Card data handled entirely by Stripe.js on the client. Our servers never see, transmit, or store card numbers.
- **No direct storage of payment credentials** (HC-05 requirement — met by design).
- **HTTPS everywhere** — enforced by Vercel.

### 10.2 Data Encryption

- **At rest:** PostgreSQL managed service provides encryption at rest (AES-256)
- **In transit:** TLS 1.2+ for all connections (HTTPS, database connections, API calls)
- **Sensitive fields:** Password hashes (bcrypt), payment intent IDs (reference only — not card data)

### 10.3 Application Security

| Threat | Mitigation |
|---|---|
| **SQL injection** | Parameterized queries via ORM (Prisma or Drizzle). No raw SQL with user input. |
| **XSS** | React's default escaping. Content Security Policy headers. No `dangerouslySetInnerHTML` with user content. |
| **CSRF** | SameSite=Strict cookies. Next.js CSRF protection on API routes. |
| **Rate limiting** | Vercel Edge Middleware rate limiting: 10 bid attempts per minute per IP. |
| **Bid manipulation** | Amount is server-computed from painting dimensions and tier — client cannot set the amount. |
| **Enumeration** | Bidder IDs are UUIDs, not sequential. No endpoint exposes bidder lists. |
| **Webhook spoofing** | Stripe webhook signature verification on every webhook call. |

### 10.4 Privacy

- Bidder personal data (name, address, phone) is never exposed via public API endpoints
- `GET /api/paintings` only returns `displayName` if the bidder chose `public` visibility
- Email addresses, phone numbers, and mailing addresses are only accessible to the bidder themselves (via Dashboard) and admin

---

## 11. Acceptance Criteria

Each criterion is traceable to the spec documents and testable.

### 11.1 Bidding (03a §14, 03b §5, §8)

| ID | Criterion | Test |
|---|---|---|
| AC-01 | A visitor can browse all 52 paintings without registering | Load `/auction`, verify all paintings visible |
| AC-02 | Registration collects name, email, phone, address | Complete registration flow, verify all fields stored |
| AC-03 | Only the lowest available tier is clickable | View painting at each state, verify button states |
| AC-04 | Placing a bid charges the bidder via Stripe and holds funds | Place bid, verify Stripe charge, verify `active` status |
| AC-05 | Only one bid at `active` or `payment_processing` per tier per painting | Attempt concurrent bids, verify only one succeeds |
| AC-06 | When a higher-tier bid is placed, the lower-tier bid is refunded immediately | Place tier 2 bid on tier 1 painting, verify tier 1 refund initiated |
| AC-07 | A bidder who was outbid can bid again at the next tier | Outbid a bidder, verify they can bid at the next tier |
| AC-08 | Self-outbidding is permitted and triggers refund | Bid tier 1, then bid tier 2 as same user, verify refund |
| AC-09 | Bids are irrevocable — no cancel/withdraw endpoint exists | Verify no DELETE or cancel endpoint for bids |
| AC-10 | Bid-in-progress state shows on all clients within 2 seconds | Start payment processing, verify other clients see indicator |

### 11.2 Auction Lifecycle (03b §8.2, §8.3, §8.4)

| ID | Criterion | Test |
|---|---|---|
| AC-11 | Auction does not accept bids before launch (pre_launch status) | Attempt bid, verify 403 |
| AC-12 | Threshold evaluation runs at close_at | Set close_at to near-future, verify evaluation triggers |
| AC-13 | If aggregate < threshold, all active bids are refunded | Simulate failure scenario, verify all refunds |
| AC-14 | If aggregate ≥ threshold, settlement begins | Simulate success, verify settlement status |
| AC-15 | 5-minute grace window for in-flight payments at close | Start bid at T-30s, complete payment at T+3m, verify accepted |
| AC-16 | WTA triggers immediate auction close | Record WTA bid, verify no new bids accepted |

### 11.3 Rewards (03b §6)

| ID | Criterion | Test |
|---|---|---|
| AC-17 | Rewards calculated correctly: 50% of spread | Run settlement, verify reward amounts match formula |
| AC-18 | Self-outbid rewards calculated identically to other outbids | Self-outbid scenario, verify reward matches |
| AC-19 | No rewards if auction fails | Simulate failure, verify zero reward records |
| AC-20 | Reward amounts not visible to bidders before settlement | Check dashboard API response, verify no amounts |

### 11.4 WTA (03b §7)

| ID | Criterion | Test |
|---|---|---|
| AC-21 | WTA price computed correctly per formula | Verify against manual calculation for known bid states |
| AC-22 | WTA price updates in real time | Place individual bid, verify WTA price changes within 5s |
| AC-23 | WTA trigger refunds all active bidders | Record WTA, verify all active bids → refunded_wta |
| AC-24 | WTA rewards include tier 4 pricing for tier 3 paintings | Tier 3 painting + WTA, verify tier4 spread calculated |

### 11.5 Notifications (03b §10)

| ID | Criterion | Test |
|---|---|---|
| AC-25 | Outbid notification sent within 60 seconds | Outbid a bidder, verify notification timing |
| AC-26 | Outbid notification does NOT include reward dollar amount | Inspect notification content |
| AC-27 | WTA notification sent to all affected bidders as one email | Trigger WTA, verify consolidated email |
| AC-28 | Milestone notifications sent at most once per level | Cross 50% twice, verify one notification |
| AC-29 | SMS only sent to bidders who opted in | Outbid a non-SMS bidder, verify no SMS sent |

### 11.6 Security (HC-05, §10)

| ID | Criterion | Test |
|---|---|---|
| AC-30 | Card data never reaches our server | Inspect network requests during payment, verify Stripe.js handles card input |
| AC-31 | Bid amount cannot be set by client | Send modified amount in POST /api/bids, verify server ignores and uses computed price |
| AC-32 | Webhook signature verification rejects unsigned requests | Send forged webhook, verify 401 |
| AC-33 | Public API does not expose bidder PII | Call GET /api/paintings, verify no email/phone/address in response |

---

## 12. Test Strategy

### 12.1 Test Pyramid

| Level | Tool | Coverage Focus |
|---|---|---|
| **Unit tests** | Vitest | Business logic: price calculation, reward computation, state transitions, threshold evaluation |
| **Integration tests** | Vitest + test database | API endpoints with real database: bid placement, outbid cascades, concurrent bids |
| **E2E tests** | Playwright | Full user flows: browse → register → bid → outbid → dashboard. Payment via Stripe test mode. |

### 12.2 Critical Test Scenarios

| Scenario | What It Tests |
|---|---|
| **Happy path:** Browse → register → bid tier 1 → confirmation | Full bidding flow end-to-end |
| **Outbid cascade:** Tier 1 bid → Tier 2 bid → verify refund + notification | Core auction mechanic |
| **Self-outbid:** Same user bids tier 1 then tier 2 | Reward-earning behavior |
| **Race condition:** Two users bid same tier simultaneously | Atomicity and conflict resolution |
| **Payment failure:** Card declined during bid | Graceful recovery, tier released |
| **Threshold evaluation (success):** Set up bids ≥ threshold, trigger eval | Settlement flow |
| **Threshold evaluation (failure):** Set up bids < threshold, trigger eval | Refund-all flow |
| **WTA trigger:** Place WTA bid with existing individual bids | Immediate close, mass refund, reward calc |
| **Close grace window:** Bid started before deadline, payment after | 5-minute window acceptance |
| **Post-auction archive:** After settlement, verify read-only state | Gallery transition |

### 12.3 Stripe Test Mode

All development and staging testing uses Stripe test mode:
- Test card numbers (`4242424242424242` for success, `4000000000000002` for decline)
- Test webhooks via Stripe CLI (`stripe listen --forward-to localhost:3000/api/webhooks/stripe`)
- No real money ever touches development or staging environments

### 12.4 Load Testing

Not a primary concern — bid volume is low (dozens to hundreds over months). However, test for:
- 52 concurrent Image Page loads (all paintings viewed simultaneously)
- 10 concurrent bid attempts (auction launch spike)
- WebSocket connections from 500 simultaneous viewers (Spectators during close)

---

## 13. Content Deployment

### 13.1 Painting Catalog Loading

Before auction launch, the 52 paintings must be loaded into the database with:

1. **Dimensions** — from William's physical inventory (AM-OQ-04 — pending)
2. **Images** — professionally photographed, uploaded as full-resolution source + OG variant (§13.2.4)
3. **Narratives** — written by William
4. **Display order** — curated by William
5. **Series assignment** — Grief Series paintings linked to series record

Loading method: a seed script (`scripts/seed-paintings.ts`) that reads a structured data file (JSON or CSV) and inserts records. Run once before launch; updates via admin API thereafter.

### 13.2 Image Infrastructure

#### 13.2.1 Decision: Vercel Blob + Next.js Image Optimization

Store **one source image per painting** (the full-resolution original). Let the Next.js `<Image>` component handle resizing, format conversion (WebP/AVIF), and CDN caching automatically. This eliminates the need to pre-process and store 4 separate image files per painting.

**Rationale:**
- 52 source images is well within Vercel's free optimization tier (1,000 source images included with Pro)
- Next.js Image generates responsive variants on first request, then caches at the edge — subsequent loads are CDN-fast
- Eliminates a manual processing pipeline (no Sharp scripts, no build-time image generation)
- Format negotiation is automatic — modern browsers get AVIF, older browsers get WebP, fallback to JPEG
- The `sizes` prop + `srcset` output means the browser downloads only the size it needs per viewport
- Vercel Blob is the simplest storage option: upload via API or dashboard, get a permanent URL, served from Vercel's edge network

**What about the 4 sizes in 03a §19.2?** They become `<Image>` component configurations, not stored files:

| 03a Context | Implementation |
|---|---|
| Gallery scroller thumbnail (400px) | `<Image width={400} ... sizes="200px" />` — Next.js generates on demand |
| Image Page primary (1200px) | `<Image width={1200} ... sizes="(max-width: 768px) 100vw, 70vw" />` |
| Lightbox full-resolution | `<Image fill quality={95} ... />` — loads original at device resolution |
| Open Graph (1200×630) | **Pre-generated** — see §13.2.3. OG images cannot use `<Image>` component |

#### 13.2.2 Storage Architecture

```
Vercel Blob Storage
└── paintings/
    ├── acceptance.jpg          ← full-resolution source (e.g., 4000×3000px, ~3-8MB)
    ├── acceptance-og.jpg       ← pre-generated OG image (1200×630, ~150KB)
    ├── anger.jpg
    ├── anger-og.jpg
    └── ... (52 paintings × 2 files = 104 files)

Total storage: ~200-400MB (52 full-res sources + 52 OG images)
```

**URL pattern:** `https://[blob-store-id].public.blob.vercel-storage.com/paintings/[slug].jpg`

**Database schema change** — simplify from 4 URL columns to 2:

```sql
-- Replace:
--   image_thumbnail_url VARCHAR(500) NOT NULL,
--   image_primary_url   VARCHAR(500) NOT NULL,
--   image_full_url      VARCHAR(500) NOT NULL,
--   image_og_url        VARCHAR(500) NOT NULL,

-- With:
  image_source_url    VARCHAR(500) NOT NULL,   -- full-res original in Vercel Blob
  image_og_url        VARCHAR(500) NOT NULL,   -- pre-generated 1200x630 for meta tags
```

The `<Image>` component takes `image_source_url` as `src` and handles all sizing. This is cleaner: the database stores what's stored, not what's derived.

#### 13.2.3 OG Image Generation

Open Graph meta tags require a static image URL — they cannot use Next.js Image optimization. OG images are pre-generated once per painting during the catalog loading step (§13.1).

**Pipeline:**

1. Source image uploaded to Vercel Blob
2. A one-time script (`scripts/generate-og-images.ts`) reads each source, crops/scales to 1200×630, optimizes as JPEG (quality 85), and uploads to Vercel Blob as `[slug]-og.jpg`
3. The `image_og_url` column is populated during seeding

**Alternative for dynamic OG:** Vercel OG (`@vercel/og`) can generate OG images at the edge using the painting image + overlay text (title, bid status). This enables dynamic OG descriptions that show current bid state in the preview image itself. Cost: negligible (edge function invocation). Decision deferred to build time — static OG images are sufficient for launch, dynamic is a polish feature.

#### 13.2.4 Upload Workflow

**Pre-launch (bulk load):**

1. William photographs all 52 paintings (high-res, color-accurate, consistent lighting)
2. Photos named by slug: `acceptance.jpg`, `anger.jpg`, etc.
3. Upload script (`scripts/upload-images.ts`) iterates the folder:
   - Validates image dimensions (minimum 2000px on shortest side)
   - Validates color profile (sRGB — converts if needed)
   - Uploads source to Vercel Blob via `@vercel/blob` SDK
   - Generates + uploads OG variant
   - Returns URL mapping for database seeding
4. Seed script (§13.1) uses the URL mapping to populate `image_source_url` and `image_og_url`

**Post-launch (individual updates via admin):**
- Admin API endpoint `PATCH /api/admin/paintings/[slug]` accepts a new image file
- Server-side: upload to Blob, generate OG, update DB URLs
- Next.js Image cache automatically serves the new image (Blob URL changes)

#### 13.2.5 Color Accuracy

The paintings are the product. Color accuracy is non-negotiable.

| Concern | Mitigation |
|---|---|
| Photography color cast | William: photograph under consistent, neutral (5000K-5500K) lighting. Include color checker card in one reference shot per session. |
| Color profile loss | Upload script validates sRGB profile. Non-sRGB images are converted via Sharp before upload. |
| Compression artifacts | Next.js Image default quality is 75 — override to `quality={85}` for painting images. Lightbox uses `quality={95}`. |
| Format conversion | WebP and AVIF preserve color fidelity at the quality levels specified. No concern at q85+. |
| Display calibration | Out of scope — viewer's monitor is their responsibility. But sRGB is the web standard and renders consistently across calibrated and uncalibrated displays. |

#### 13.2.6 Performance

| Metric | Target | How |
|---|---|---|
| Gallery scroller LCP | < 2.0s | First 5 images preloaded (`priority` prop), remaining lazy-loaded via intersection observer |
| Image Page LCP | < 2.5s | Primary image uses `priority` prop (preloaded), lightbox loaded on click |
| Total page weight (Image Page) | < 500KB initial | Primary image ~150KB (1200px WebP q85), everything else deferred |
| CDN hit rate | > 95% after warm-up | 52 paintings × ~3 popular sizes = ~156 cached variants. Vercel edge caches indefinitely until source changes. |

#### 13.2.7 Cost

| Item | Cost |
|---|---|
| Vercel Blob storage (400MB) | Included in Pro plan (1GB free) |
| Vercel Image Optimization (52 source images) | Included in Pro plan (1,000 free) |
| Bandwidth (CDN-served images) | Included in Pro plan (1TB/month) |
| **Total image infrastructure cost** | **$0 incremental** (covered by existing Vercel Pro $20/month) |

This closes **SIM-05** (image processing pipeline for 4 sizes) and resolves the image storage decision from §2.1 line 60.

### 13.3 Static Content

Site copy (homepage intro, auction explanation, How Bidding Works, About the Artist) is stored as markdown files in the codebase and rendered at build time. Updates require a code deployment (which is instant on Vercel).

Alternative: headless CMS (Sanity, Contentful) for non-technical content editing. Decision deferred — depends on whether William needs to edit copy without developer involvement.

---

## 14. Infrastructure Costs (Estimated)

| Service | Tier | Estimated Monthly Cost |
|---|---|---|
| **Vercel** | Pro | $20/month |
| **Neon/Supabase** | Free or Pro | $0–$25/month |
| **Stripe** | Pay-per-transaction | 2.9% + $0.30 per charge (passed through — not a platform cost) |
| **Resend** | Free tier (3,000 emails/month) | $0 |
| **Twilio** | Pay-per-SMS | ~$0.01/SMS × estimated 500 SMS = ~$5 |
| **Domain** | fhoa.org renewal | ~$12/year |
| **Vercel Blob** | Included in Pro (1GB) | $0 (104 images ≈ 400MB) — see §13.2.7 |
| **Sentry** | Free tier | $0 |
| **Total** | | **~$25–$50/month** during active auction |

Post-auction (archive mode): Vercel Hobby ($0) + static site only. Near-zero ongoing cost.

---

## 15. Open Questions (Technical)

| ID | Question | Impact | Owner |
|---|---|---|---|
| TECH-01 | Stripe Connect vs. direct account for fiduciary fund flow? | Payment architecture, escrow handling | Fiduciary (AM-OQ-02) |
| TECH-02 | Credit card / lawyer-mediated threshold amount? | Bid flow routing in API | Fiduciary (J02c-01) |
| TECH-03 | Headless CMS for content or markdown in codebase? | Content update workflow | CTO decision after William's input |
| TECH-04 | Supabase (DB + realtime bundled) vs. Neon + Ably (separate)? | Architecture simplicity vs. flexibility | CTO decision during build |
| TECH-05 | Settlement disbursement: automated via Stripe Connect or manual by fiduciary? | Settlement automation level | Fiduciary (AM-OQ-02) |

---

## 16. Cross-Reference: Data/State → Technical Implementation

| Data Entity (03b) | Database Table | Primary API Endpoints | Real-Time Channel |
|---|---|---|---|
| Painting (§2) | `paintings` | `GET /api/paintings`, `GET /api/paintings/[slug]` | `auction:paintings` |
| Series (§3) | `series` | `GET /api/series` | — |
| Bidder (§4) | `bidders` | Auth endpoints, `GET /api/dashboard` | — |
| Bid (§5) | `bids` | `POST /api/bids`, `POST /api/bids/[id]/confirm` | `auction:painting:{id}` |
| Reward (§6) | `rewards` | `GET /api/dashboard` (post-settlement) | — |
| WTABid (§7) | `wta_bids` | `POST /api/admin/wta` | `auction:stats` |
| Auction (§9) | `auction` | `GET /api/auction` | `auction:stats` |
| Notifications (§10) | `notifications` | Background processor | — |
