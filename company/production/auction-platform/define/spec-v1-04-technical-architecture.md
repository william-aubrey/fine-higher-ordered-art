# Technical Architecture — Charlotte Collection Auction Platform

*Phase 4 (BUILD) — Spec-Driven Development*
*Version: v3 — AWS Migration*
*Date: 2026-03-26*
*Author: CTO Agent (v1-v2), Claude (v3 AWS rewrite)*

---

## 1. Overview

This document specifies how the Charlotte Collection auction platform is built: infrastructure, services, API contracts, database schema, authentication, payment integration, deployment, security, and testing. It translates the site design (03a) and data/state specification (03b) into an implementable technical blueprint.

**What this document covers:**
- Architecture pattern: gallery layer (static) vs. auction engine (dynamic)
- Content structure (markdown painting catalog)
- Database schema (auction-engine tables only)
- API contracts (bid status + transactional endpoints)
- Authentication and authorization
- Payment processor integration (Stripe)
- Bid status polling
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

### 2.1 Decision: Two-Layer Architecture (Gallery + Auction Engine)

The platform separates into two distinct layers with different infrastructure needs:

**Gallery layer (static):** The painting catalog — 52 images, titles, dimensions, narratives, series assignments — is static content. Markdown files in the codebase, rendered into HTML at build time. No database, no API, no server. This is most of the website: homepage, painting pages, series pages, about, how bidding works.

**Auction engine (dynamic):** Bids, accounts, payments, threshold calculations, notifications. This is the only part that needs server infrastructure: a database, API routes, Stripe, and auth.

**Rationale:**
- 52 paintings is a fixed catalog written once — putting it in a database adds complexity with no benefit
- Markdown in the repo means content is edited in VS Code, version-controlled in git, and deployed instantly
- Bid volume is low (dozens to hundreds of bids over 6 months, not thousands per second)
- Serverless API routes scale to zero when idle and handle bid spikes without provisioning
- The auction runs once and then becomes a permanent static archive — delete the database, the gallery stands alone
- No real-time infrastructure needed — bid status changes a few times per day; 30-second polling is more than adequate

**Technology stack:**

| Layer | Technology | Rationale |
|---|---|---|
| **Content** | Markdown files in repo | Edited in VS Code, built at deploy time, version-controlled. No CMS dependency. (TECH-03 resolved) |
| **Frontend** | Next.js (App Router, static export + client-side hydration) | React ecosystem, excellent static generation, server components for OG tags. Next.js is open-source (MIT) — runs on any platform, not Vercel-only. |
| **API** | Next.js API Routes (serverless functions on AWS Lambda via Amplify) | Co-located with frontend, TypeScript throughout |
| **Database** | PostgreSQL (managed — Amazon RDS, `db.t3.micro`) | ACID transactions required for bid atomicity. Auction-engine tables only — no painting content. |
| **Connection pooling** | Amazon RDS Proxy | Manages Lambda→RDS connection lifecycle. Prevents connection exhaustion from concurrent Lambda invocations. See §3.10. |
| **Bid status updates** | Client-side polling (30s interval) | Bids happen a few times per day. Polling eliminates WebSocket infrastructure entirely. |
| **Payments** | Stripe | PCI-compliant (HC-05), handles credit card + escrow-like holds, proven for marketplaces. Only non-AWS vendor — AWS has no payment processing service. |
| **Auth** | NextAuth.js (Auth.js) | Google/Apple OAuth + email/password, session management |
| **Email** | Amazon SES | Transactional email. IAM auth (no API keys on Lambda). Excellent deliverability. $0.10/1,000 emails. |
| **SMS** | Amazon SNS | Outbid and closing warning notifications. IAM auth. $0.0075/SMS (US). |
| **CDN / Hosting** | AWS Amplify Hosting (CloudFront) | Global CDN, git-triggered deploys, preview environments per PR. |
| **Image storage** | Amazon S3 + pre-processed variants (Sharp) | 52 source images + pre-generated sizes + OG variants. Served via CloudFront. See §13.2. |
| **Scheduled tasks** | Amazon EventBridge Scheduler + Lambda | Daily auction close check. See §9.5. |
| **DNS** | Amazon Route 53 | DNS management for fhoa.org. $0.50/month. |
| **SSL** | AWS Certificate Manager (ACM) | Free SSL certificate, auto-renewing. Works with CloudFront/Amplify. |
| **Monitoring** | Amazon CloudWatch | Error tracking, logs, basic performance monitoring |

### 2.2 Service Boundaries

```
Route 53 (DNS: fhoa.org)
  │
  ▼
┌──────────────────────────────────────────────────────────────┐
│                   CloudFront CDN (via Amplify)                 │
│  Static gallery pages (from markdown), images (S3), JS bundles│
└──────────────────────────┬───────────────────────────────────┘
                           │
┌──────────────────────────▼───────────────────────────────────┐
│              Next.js Application (Amplify + Lambda)            │
│                                                               │
│  ┌──────────────────┐  ┌──────────────────┐  ┌────────────┐ │
│  │  Gallery Layer    │  │  Server Pages    │  │    API     │ │
│  │  (SSG from .md)   │  │  (SSR for OG)   │  │   Routes   │ │
│  │                   │  │                  │  │  (auction   │ │
│  │  No database.     │  │                  │  │   engine)  │ │
│  └──────────────────┘  └──────────────────┘  └─────┬──────┘ │
└────────────────────────────────────────────────────┼────────┘
                                                     │
                    ┌────────────────────────────────┼──────────┐
                    │                                │          │
          ┌─────────▼────────┐          ┌────────────▼──┐      │
          │   RDS Proxy       │          │   Stripe API   │      │
          │       │           │          │   (Payments)   │      │
          │   PostgreSQL DB   │          └───────────────┘      │
          │      (RDS)        │                                 │
          │                   │          ┌───────────────┐      │
          │  bidders, bids,   │          │  SES (Email)   │      │
          │  rewards, auction,│          │  SNS (SMS)     │      │
          │  wta_bids,        │          │  (sent inline  │      │
          │  notifications    │          │  with bid events│     │
          └───────────────────┘          └───────────────┘      │
                                                                │
  ┌─────────────────────────────────────────────────────────────┘
  │  Client-side polling (30s) ← GET /api/bid-status
  └─────────────────────────────────────────────────────────────

  EventBridge (daily) → Lambda: checkAuctionClose()
```

### 2.3 Gallery / Auction Engine Separation

| Concern | Gallery Layer | Auction Engine |
|---|---|---|
| **Data source** | Markdown files in `content/` | PostgreSQL (RDS) |
| **When it runs** | Build time (static HTML) | Runtime (serverless functions) |
| **What it serves** | Painting pages, series pages, homepage, about, how bidding works | Bid placement, bid status, dashboard, payments, auth, admin |
| **Infrastructure** | None (static files on CDN) | Database + API routes + Stripe + auth |
| **Post-auction** | Stands alone as a permanent archive | Database can be deleted |

The gallery layer reads painting content from markdown at build time. The auction engine reads only what it needs for bid validation (painting slugs + dimensions → tier prices) from a thin reference table seeded from the same markdown source.

### 2.4 Why Not a Full Backend Framework?

A traditional server (Express, Django, Rails) would work but adds operational complexity disproportionate to the workload. This auction serves ~52 products over 6 months. The critical operations (placing a bid, processing payment, calculating WTA) happen infrequently. Serverless functions handle these spikes efficiently without maintaining idle infrastructure.

---

## 3. Database Schema

The database serves the **auction engine only**. Painting content (titles, narratives, images, series) lives in markdown files and is rendered at build time — it does not belong in the database. The database stores what's transactional: bids, bidders, payments, rewards, auction state, and notifications.

A thin `paintings` reference table provides the auction engine with the data it needs for bid validation and price computation. It is seeded from the markdown source files at deploy time and contains no content — only dimensions and computed prices.

### 3.1 Table: `paintings` (reference — seeded from markdown)

```sql
CREATE TABLE paintings (
  slug            VARCHAR(100) PRIMARY KEY,     -- matches markdown filename, e.g. 'acceptance'
  width_inches    DECIMAL(6,2) NOT NULL,
  height_inches   DECIMAL(6,2) NOT NULL,
  square_inches   INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches)) STORED,
  tier1_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 100) STORED,
  tier2_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 1000) STORED,
  tier3_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 10000) STORED,
  tier4_price_cents INTEGER NOT NULL GENERATED ALWAYS AS (CEILING(width_inches * height_inches) * 100000) STORED
);
```

**What's NOT in this table:** title, narrative, images, display order, series assignment, video URL, alt text, shipping estimates, size category. All of that is in markdown, rendered at build time, and served as static HTML. The database only knows what it needs to validate a bid and compute a price.

**Seeding:** A build-time script reads the markdown frontmatter (slug + dimensions) and upserts into this table. Runs on every deploy. Idempotent.

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
  painting_slug   VARCHAR(100) NOT NULL REFERENCES paintings(slug),
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
  ON bids (painting_slug, tier)
  WHERE status IN ('active', 'payment_processing');

-- Enforce: at most one active bid per bidder per painting
CREATE UNIQUE INDEX idx_bids_active_per_bidder_painting
  ON bids (painting_slug, bidder_id)
  WHERE status = 'active';
```

### 3.5 Table: `rewards`

```sql
CREATE TABLE rewards (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  painting_slug   VARCHAR(100) NOT NULL REFERENCES paintings(slug),
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
-- Bid queries
CREATE INDEX idx_bids_painting_status ON bids(painting_slug, status);
CREATE INDEX idx_bids_bidder ON bids(bidder_id);
CREATE INDEX idx_bids_status ON bids(status);

-- Reward queries
CREATE INDEX idx_rewards_recipient ON rewards(recipient_id);
CREATE INDEX idx_rewards_painting ON rewards(painting_slug);

-- Notification queries
CREATE INDEX idx_notifications_bidder ON notifications(bidder_id);
CREATE INDEX idx_notifications_status ON notifications(status) WHERE status = 'queued';
```

### 3.10 Connection Management (RDS Proxy)

Lambda functions are ephemeral — each invocation may open a new database connection. Without pooling, concurrent invocations (multiple bid-status polls, a bid placement, a webhook) can exhaust the RDS connection limit (~80 on `db.t3.micro`).

**Solution:** Amazon RDS Proxy sits between Lambda and RDS. It maintains a pool of database connections and routes Lambda requests through them. 30 concurrent Lambdas share 5-10 real database connections.

**Configuration:**
- Application code connects to the RDS Proxy endpoint instead of the RDS instance directly
- The connection string in `DATABASE_URL` points to the proxy
- SQL queries, transactions, and ORM usage are identical — the proxy is transparent
- IAM authentication from Lambda to RDS Proxy (no database password in env vars)

**Cost:** ~$11/month (may be covered by free tier for 12 months).

---

## 4. API Contracts

All API endpoints are Next.js API Routes deployed as serverless functions. All responses are JSON. All authenticated endpoints require a valid session cookie.

### 4.1 Public Endpoints (No Auth)

#### `GET /api/bid-status`

Returns current bid status for all 52 paintings. This is the **only dynamic data** the gallery pages need — everything else (titles, images, narratives) is static HTML from markdown. The client-side JavaScript polls this endpoint every 30 seconds to overlay bid status on the static gallery.

**Response: 200**
```json
{
  "paintings": {
    "acceptance": {
      "currentState": "tier2_held",
      "currentBid": {
        "tier": "tier2",
        "amountCents": 3456000,
        "visibility": "public",
        "displayName": "Jane Smith",
        "placedAt": "2026-07-15T14:30:00Z"
      },
      "bidInProgress": false
    },
    "anger": {
      "currentState": "open",
      "currentBid": null,
      "bidInProgress": false
    }
  }
}
```

**Notes:** Keyed by slug (matches markdown filenames and static page routes). `currentBid` is null if state is `open`. `displayName` is null if `visibility` is `private`. `bidInProgress` is true if a `payment_processing` record exists for the next available tier.

#### `GET /api/bid-status/[slug]`

Returns bid status for a single painting. Used on Image Pages for more frequent polling (every 15 seconds).

**Response: 200** — Same shape as a single entry from the object above.

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

**Note:** `GET /api/series` is not needed — series content is static HTML built from markdown. No dynamic series data exists.

### 4.2 Authenticated Endpoints

#### `POST /api/bids`

Place a bid on a painting. Initiates payment processing.

**Request:**
```json
{
  "paintingSlug": "acceptance",
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

**This endpoint is primarily called by a Stripe webhook**, not the client directly. The client sees the updated bid status on its next poll (within 30 seconds).

**Webhook payload processing:**
1. Verify Stripe webhook signature
2. Match `payment_intent.succeeded` event to bid record
3. Transition bid to `active`
4. If a lower-tier bid exists on this painting, transition it to `outbid` and initiate refund
5. Queue `bid_confirmed` notification for the bidder
6. Queue `outbid` notification for the displaced bidder (if any)

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
      "paintingSlug": "acceptance",
      "tier": "tier2",
      "amountCents": 3456000,
      "placedAt": "2026-07-15T14:30:00Z"
    }
  ],
  "outbidHistory": [
    {
      "bidId": "uuid",
      "paintingSlug": "anger",
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

#### `PUT /api/admin/paintings/[slug]`

Update painting image in S3 (post-launch photo replacement). Uploads source image, generates size variants with Sharp, uploads all to S3. Content updates (narrative, video) are done by editing the markdown file and redeploying. Cannot update dimensions or pricing via API — those come from the markdown frontmatter.

#### `POST /api/admin/auction/launch`

Transition auction from `pre_launch` to `active`. Requires HC-04 Principal approval (enforced by admin auth — only the artist's account can trigger this).

#### `POST /api/admin/auction/evaluate`

Trigger threshold evaluation (normally automated at close_at, but available for manual trigger).

#### `POST /api/admin/bids`

Record a lawyer-mediated bid (above credit card threshold). Entered by admin after fiduciary confirms wire transfer and contract execution.

**Request:**
```json
{
  "paintingSlug": "acceptance",
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
6. Queue `bid_confirmed` notification for the new bidder
7. Queue `outbid` notification for the displaced bidder (if any)
8. Recalculate WTA price

**Important:** The outbid cascade and notifications must fire identically to self-service bids. The only difference is payment confirmation is implicit (admin attests wire receipt). Bid status changes are visible to all clients on their next poll cycle (≤30 seconds).

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
  │ Next poll sees update    │                       │
  │ (within 15-30s)          │                       │
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

## 7. Bid Status Updates (Polling)

### 7.1 Decision: Polling, No Real-Time Infrastructure (TECH-04 Resolved)

Bid status changes happen a few times per day, not per second. WebSocket infrastructure (Supabase Realtime, Ably, Pusher) adds a dependency, a cost line, and operational complexity for a problem that polling solves trivially.

**The polling approach:** Every page with dynamic bid data fetches `GET /api/bid-status` on a regular interval. That's it. No WebSocket connections, no channel subscriptions, no reconnection logic, no third-party real-time service.

### 7.2 Polling Intervals

| Context | Endpoint | Interval | Rationale |
|---|---|---|---|
| Gallery / Auction page | `GET /api/bid-status` | 30 seconds | All paintings, lightweight JSON. Keeps bid badges current. |
| Image Page (single painting) | `GET /api/bid-status/[slug]` | 15 seconds | Bidder is looking at one painting, faster feedback matters. |
| Bidder Dashboard | `GET /api/dashboard` | 30 seconds | Active bids, outbid history. Low urgency. |
| Auction stats (homepage, auction page) | `GET /api/auction` | 60 seconds | Threshold %, WTA price, days remaining. Changes slowly. |

### 7.3 Latency Characteristics

| Data | Update Trigger | Worst-Case Latency |
|---|---|---|
| Painting bid status | Bid placed or outbid | ≤ 30 seconds (gallery), ≤ 15 seconds (image page) |
| Bid-in-progress indicator | Payment processing started/ended | ≤ 30 seconds |
| WTA price | Any bid status change | ≤ 60 seconds |
| Auction aggregate / threshold % | Any bid status change | ≤ 60 seconds |

For an auction where bids arrive hours apart, 15–60 second latency is imperceptible. If viewer experience during the final hours demands faster updates, the polling interval can be shortened to 5 seconds — still simpler than WebSocket infrastructure.

### 7.4 Implementation Notes

- Polling is a `useEffect` + `setInterval` in the client component. ~10 lines of code.
- The API responses are lightweight (bid status keyed by slug — no painting content).
- CloudFront can cache `GET /api/bid-status` with a short TTL (e.g., `Cache-Control: s-maxage=10`) to reduce database hits from concurrent viewers. Amplify configures CloudFront automatically for Next.js apps; CloudFront respects `Cache-Control` headers from the Lambda origin.
- No stale-data indicator needed — the bid volume doesn't warrant it.

---

## 8. Notification Delivery

### 8.1 Architecture

Notifications are sent **inline** when the triggering event occurs (bid confirmed, outbid, auction milestone). No background processor.

```
Bid event → Send email/SMS immediately → Log to notifications table
```

**Why inline instead of a queue + processor:** FHOA's notification volume is a few per day, not thousands per minute. The overhead of a separate scheduled processor (EventBridge + Lambda) adds complexity for negligible benefit. Inline sending is simpler — the API route that confirms a bid also sends the outbid email in the same execution.

**Failure handling:** If SES or SNS is temporarily unavailable, the notification row is written with `status = 'failed'`. A daily EventBridge sweep (piggybacks on the auction close check) retries failed notifications. At FHOA's volume, a few-hour delay on a retry is acceptable.

**The `notifications` table is still used** — it serves as an audit log (what was sent, when, to whom) and enables retry of failed sends. It just isn't a processing queue.

### 8.2 Email (Amazon SES)

| Setting | Value |
|---|---|
| **From address** | `auction@fhoa.org` |
| **Reply-to** | Press inquiry email (not the artist's personal email) |
| **SDK** | `@aws-sdk/client-ses` — `SendEmailCommand` |
| **Auth** | IAM role (automatic on Lambda — no API keys in environment variables) |
| **Templates** | HTML + plain text. Art-first design consistent with site. |
| **Cost** | $0.10 per 1,000 emails. ~$0.30/month at FHOA volume. |

**Setup requirements (do early — not at launch):**
1. Verify `fhoa.org` domain in SES (DNS records: DKIM, SPF, DMARC)
2. Request SES production access (exits sandbox mode — 24-48 hour AWS review)
3. Configure a configuration set for bounce/complaint tracking

### 8.3 SMS (Amazon SNS)

| Setting | Value |
|---|---|
| **SDK** | `@aws-sdk/client-sns` — `PublishCommand` with `PhoneNumber` |
| **Auth** | IAM role (automatic on Lambda) |
| **Opt-in** | Bidder must explicitly enable SMS in Dashboard |
| **Content** | Plain text, ≤ 160 characters when possible |
| **Cost** | $0.0075 per SMS (US). ~$1-4/month at FHOA volume. |
| **Compliance** | TCPA compliance — explicit opt-in tracked in `bidders.notify_sms`, STOP keyword handling implemented in application code (SNS does not auto-handle STOP like Twilio) |

**Setup requirements:**
1. Request SNS SMS sandbox exit for production sending
2. Configure origination number or sender ID

### 8.4 Push Notifications

Browser push via web push API (service worker). Optional — lowest priority channel. Implementation details deferred; the pattern is standard.

---

## 9. Deployment

### 9.1 Environments

| Environment | Purpose | URL |
|---|---|---|
| **Development** | Local development | `localhost:3000` |
| **Staging** | Pre-production testing | `staging.fhoa.org` (Amplify branch deploy) |
| **Production** | Live auction | `fhoa.org` |

### 9.2 Deployment Pipeline

```
Git push → Amplify auto-build → Next.js build → Deploy to CloudFront edge
```

- **Preview deployments:** Every PR branch gets a unique preview URL (Amplify branch deploys)
- **Production deployment:** Merges to `main` auto-deploy to production
- **Rollback:** Amplify supports instant rollback to any previous deployment
- **Build time:** ~2-3 minutes

**Amplify build configuration** (`amplify.yml` in repo root):

```yaml
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm ci
    build:
      commands:
        - npm run build
    postBuild:
      commands:
        - node scripts/seed-paintings.js
  artifacts:
    baseDirectory: .next
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
      - .next/cache/**/*
```

The `postBuild` phase seeds the thin paintings reference table (§3.1) from markdown frontmatter. Runs on every deploy. Idempotent.

### 9.3 Environment Variables

Configured in the Amplify Console. AWS services (SES, SNS, S3) authenticate via IAM roles on Lambda — no API keys needed for AWS services.

| Variable | Purpose | Example |
|---|---|---|
| `DATABASE_URL` | RDS Proxy PostgreSQL connection string | `postgresql://...` |
| `STRIPE_SECRET_KEY` | Stripe API key | `sk_live_...` |
| `STRIPE_WEBHOOK_SECRET` | Webhook signature verification | `whsec_...` |
| `STRIPE_PUBLISHABLE_KEY` | Client-side Stripe.js | `pk_live_...` |
| `NEXTAUTH_SECRET` | Session encryption | Random 32+ char string |
| `NEXTAUTH_URL` | Canonical URL | `https://fhoa.org` |
| `GOOGLE_CLIENT_ID` | Google OAuth | `...apps.googleusercontent.com` |
| `GOOGLE_CLIENT_SECRET` | Google OAuth | `GOCSPX-...` |
| `APPLE_CLIENT_ID` | Apple OAuth | `org.fhoa.signin` |
| `APPLE_CLIENT_SECRET` | Apple OAuth | JWT |
| `AWS_REGION` | AWS region (auto-set on Lambda, needed for local dev) | `us-east-1` |
| `S3_BUCKET_NAME` | Image storage bucket | `fhoa-paintings` |
| `CLOUDFRONT_URL` | Image delivery URL | `https://d1234.cloudfront.net` |
| `SES_FROM_EMAIL` | Verified sender address | `auction@fhoa.org` |
| `ADMIN_EMAIL` | Admin role check | William's email |

### 9.4 Domain Configuration

- `fhoa.org` → Route 53 hosted zone → CloudFront distribution (via Amplify)
- SSL: AWS Certificate Manager (ACM) — free, auto-renewing
- `www.fhoa.org` → redirect to `fhoa.org`

### 9.5 Auction Close Trigger

The auction close is the single most critical automated event in the system. It must execute reliably at `2026-12-31T23:59:59-05:00`.

**Mechanism: EventBridge Scheduler + Standalone Lambda**

```
EventBridge schedule: rate(1 day) — runs daily at midnight ET
Lambda function: checkAuctionClose()
```

The auction close Lambda is a **standalone function** — separate from the Next.js app — so it runs even if the web application is down. It shares database connection logic with the app via a shared library.

**`checkAuctionClose()` logic:**

```
1. Read auction record
2. IF auction.status !== 'active' → return (no-op)
3. IF now() < auction.close_at → return (not yet)
4. IF now() >= auction.close_at:
     a. Set auction.status = 'closing'
     b. Wait 5 minutes (grace window for in-flight payments)
     c. Sweep: any remaining payment_processing bids
        with payment still unconfirmed → transition to payment_failed, cancel PaymentIntent
     d. Set auction.status = 'evaluation'
     e. Run evaluateThreshold()
     f. Based on result: set status to 'settlement' or 'failed'
     g. Send notifications inline (SES/SNS)
```

**In the final week of the auction** (Dec 25-31), the schedule increases to `rate(1 hour)` to provide more granular close timing. On Dec 31 itself, it can be set to `rate(5 minutes)` to ensure the close fires promptly after midnight.

**The `closing` status** is a transitional state (added to auction status enum). It means:
- No new bids can be initiated
- Existing `payment_processing` bids are still allowed to confirm (Stripe webhook still processes `payment_intent.succeeded`)
- After 5 minutes, any unconfirmed in-flight bids are swept and evaluation proceeds

**Failsafe:** The logic is idempotent — running checkAuctionClose() multiple times in `closing` state just re-checks if the grace period has elapsed. Running it in `evaluation` or later states is a no-op. EventBridge has 99.99% SLA.

**Manual override:** `POST /api/admin/auction/evaluate` exists as a fallback if EventBridge fails. The admin can trigger evaluation manually.

**Daily sweep (piggyback):** The same daily Lambda also retries any failed notifications from the `notifications` table (§8.1).

**Update to auction status enum:**

Add `closing` to the auction status values:
```sql
CHECK (status IN ('pre_launch', 'active', 'closing', 'evaluation', 'settlement', 'wta_settlement', 'failed', 'archive'))
```

**Update to `POST /api/bids` validation:**
- `auction.status === 'active'` → allow bid creation
- `auction.status === 'closing'` → reject with `{ "error": "auction_closing", "message": "The auction is closing. No new bids can be placed." }`
- Any other status → reject with `auction_not_active`

### 9.6 Post-Auction Archival

After settlement completes, the site transitions from a live auction to a permanent static gallery archive.

**Procedure:**

1. **Static export:** Configure `output: 'export'` in `next.config.ts`. Run `next build` to generate a folder of HTML/CSS/JS with no server dependency.
2. **Dynamic pages:** Dashboard, bid flows, and registration pages are excluded from the export. They redirect to an "The auction has ended" message. Painting pages show final sale status (sold, unsold) as static content.
3. **S3 static hosting:** Create an S3 bucket with static website hosting enabled. Upload the exported site.
4. **CloudFront:** Create a CloudFront distribution pointed at the S3 bucket (or reuse the existing one with updated origin).
5. **DNS cutover:** Update Route 53 records from Amplify → CloudFront/S3.
6. **Data export:** Run `pg_dump` to export the final database state for records and fiduciary.
7. **Infrastructure teardown:** Delete RDS instance, RDS Proxy, Amplify app, EventBridge schedules. Keep: S3 bucket (images + static site), CloudFront, Route 53.

**Archive cost:** ~$0.51/month (S3 storage + Route 53 hosted zone). Effectively permanent.

### 9.7 Deployment Prerequisites

Complete these during development, not at launch:

- [ ] Request SES production access (24-48 hour AWS review)
- [ ] Verify `fhoa.org` domain in SES (DKIM, SPF, DMARC DNS records)
- [ ] Request SNS SMS sandbox exit
- [ ] Configure SNS origination number
- [ ] Set up RDS instance and RDS Proxy
- [ ] Create S3 bucket for images
- [ ] Configure CloudFront distribution (or let Amplify handle it)
- [ ] Set up Route 53 hosted zone and ACM certificate
- [ ] Connect Amplify to GitHub repo

---

## 10. Security

### 10.1 PCI Compliance (HC-05)

- **SAQ-A eligible:** Card data handled entirely by Stripe.js on the client. Our servers never see, transmit, or store card numbers.
- **No direct storage of payment credentials** (HC-05 requirement — met by design).
- **HTTPS everywhere** — enforced by CloudFront + ACM (auto-renewing SSL certificate).

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
| **Rate limiting** | Database-based rate limiting: track recent bid attempts per IP in a `rate_limits` table. Reject if >10 bid attempts per minute per IP. Application-level middleware in Next.js checks before processing. Upgrade to AWS WAF (~$6/month) if abuse is observed post-launch. |
| **Bid manipulation** | Amount is server-computed from painting dimensions and tier — client cannot set the amount. |
| **Enumeration** | Bidder IDs are UUIDs, not sequential. No endpoint exposes bidder lists. |
| **Webhook spoofing** | Stripe webhook signature verification on every webhook call. |

### 10.4 Privacy

- Bidder personal data (name, address, phone) is never exposed via public API endpoints
- `GET /api/bid-status` only returns `displayName` if the bidder chose `public` visibility
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
| AC-10 | Bid-in-progress state shows on all clients within one poll cycle (≤30s) | Start payment processing, verify other clients see indicator on next poll |

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
| AC-22 | WTA price updates within one poll cycle | Place individual bid, verify WTA price changes within 60s |
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
- 500 concurrent polling clients hitting `GET /api/bid-status` (Spectators during final hours)

---

## 13. Content Deployment

### 13.1 Painting Catalog (Markdown Content)

The painting catalog lives as markdown files in the codebase. Each painting is a single `.md` file with YAML frontmatter for structured data and body content for the narrative.

**Content structure:**

```
content/
  paintings/
    acceptance.md
    anger.md
    bargaining.md
    ... (52 files)
  series/
    grief.md
  pages/
    about.md
    how-bidding-works.md
    artist-statement.md
```

**Painting markdown format:**

```markdown
---
title: Acceptance
slug: acceptance
width_inches: 48
height_inches: 72
series: grief
series_order: 6
display_order: 1
size_category: oversized
shipping_estimate_low: 200
shipping_estimate_high: 500
image: acceptance.jpg
alt_text: "Acceptance, acrylic on canvas, 48\" × 72\""
video_url: https://...
---

[Narrative content — William writes this in VS Code as markdown prose]
```

**Build-time processing:**

1. Next.js reads all `content/paintings/*.md` at build time
2. Frontmatter is parsed into structured data for page generation (titles, dimensions, tier prices computed from dimensions, images, series grouping)
3. Narrative body is rendered as HTML
4. Static pages are generated: one per painting (`/paintings/[slug]`), gallery pages, series pages
5. A deploy-time script also seeds/upserts the thin `paintings` reference table in the database (slug + dimensions only — §3.1)

**Editing workflow:** William edits markdown files in VS Code. Push to git. Amplify auto-deploys. Live within ~3 minutes. No CMS, no admin panel, no database migration.

### 13.2 Image Infrastructure

#### 13.2.1 Decision: S3 Storage + Pre-Processed Variants (Sharp)

Store the full-resolution source image plus **pre-generated size variants** per painting. All images are processed once at upload time using Sharp and stored in S3. Served through CloudFront CDN.

**Rationale:**
- 52 paintings is a tiny, fixed catalog — pre-processing all sizes once is simpler than on-demand resizing infrastructure
- S3 + CloudFront is the gold standard for static asset delivery — fast, cheap, globally distributed
- Pre-processed variants mean zero runtime image processing — every request is a simple CDN file fetch
- Sharp is a proven image processing library used in production across the Node.js ecosystem
- Total storage is trivially small (~600MB for all variants of all 52 paintings)

**Size variants per painting:**

| Variant | Dimensions | Use Case | Format | Quality |
|---|---|---|---|---|
| Thumbnail | 400px wide | Gallery scroller | WebP + JPEG fallback | 80 |
| Medium | 1200px wide | Image Page primary view | WebP + JPEG fallback | 85 |
| Full | Original resolution | Lightbox / zoom | JPEG | 95 |
| OG | 1200×630 crop | Open Graph meta tags, social previews | JPEG | 85 |

#### 13.2.2 Storage Architecture

```
S3 Bucket: fhoa-paintings
└── paintings/
    ├── acceptance/
    │   ├── source.jpg          ← full-resolution original (~3-8MB)
    │   ├── thumb.webp          ← 400px thumbnail (~30KB)
    │   ├── thumb.jpg           ← JPEG fallback (~50KB)
    │   ├── medium.webp         ← 1200px primary (~100KB)
    │   ├── medium.jpg          ← JPEG fallback (~150KB)
    │   ├── full.jpg            ← original resolution, optimized (~2-4MB)
    │   └── og.jpg              ← 1200×630 social preview (~80KB)
    ├── anger/
    │   └── ...
    └── ... (52 paintings × 7 files = 364 files)

Total storage: ~400-600MB
```

**URL pattern:** `https://[cloudfront-distribution].cloudfront.net/paintings/[slug]/medium.webp`

**CloudFront CDN:** A CloudFront distribution sits in front of the S3 bucket. Images are cached at edge locations worldwide. Cache headers set to `max-age=31536000` (1 year) — images never change after upload (a re-upload creates new files with cache busting).

#### 13.2.3 OG Image Generation

Open Graph meta tags require a static image URL. OG images are pre-generated once per painting during the upload step.

**Pipeline:**

1. Source image uploaded to S3
2. The upload script (`scripts/upload-images.ts`) reads each source, crops/scales to 1200×630, optimizes as JPEG (quality 85), and uploads to S3 as `paintings/[slug]/og.jpg`
3. The painting's markdown frontmatter references the slug; the build-time template constructs the OG URL from `CLOUDFRONT_URL + /paintings/[slug]/og.jpg`

#### 13.2.4 Upload Workflow

**Pre-launch (bulk load):**

1. William photographs all 52 paintings (high-res, color-accurate, consistent lighting)
2. Photos named by slug: `acceptance.jpg`, `anger.jpg`, etc.
3. Upload script (`scripts/upload-images.ts`) iterates the folder:
   - Validates image dimensions (minimum 2000px on shortest side)
   - Validates color profile (sRGB — converts if needed via Sharp)
   - Generates all size variants using Sharp (thumb, medium, full, OG)
   - Generates WebP variants for thumb and medium
   - Uploads all files to S3 via `@aws-sdk/client-s3` PutObjectCommand
4. No database URL columns needed — URLs are deterministic from slug + CloudFront domain

**Post-launch (individual updates via admin):**
- Admin API endpoint `PUT /api/admin/paintings/[slug]` accepts a new image file
- Server-side: generate variants with Sharp, upload to S3, invalidate CloudFront cache for that slug's files
- New images are live within minutes (CloudFront invalidation)

#### 13.2.5 Color Accuracy

The paintings are the product. Color accuracy is non-negotiable.

| Concern | Mitigation |
|---|---|
| Photography color cast | William: photograph under consistent, neutral (5000K-5500K) lighting. Include color checker card in one reference shot per session. |
| Color profile loss | Upload script validates sRGB profile. Non-sRGB images are converted via Sharp before upload. |
| Compression artifacts | Thumbnail at q80, medium at q85, full at q95. These quality levels preserve color fidelity. |
| Format conversion | WebP preserves color fidelity at q80+. JPEG fallback for older browsers. |
| Display calibration | Out of scope — viewer's monitor is their responsibility. But sRGB is the web standard and renders consistently across calibrated and uncalibrated displays. |

#### 13.2.6 Performance

| Metric | Target | How |
|---|---|---|
| Gallery scroller LCP | < 2.0s | First 5 thumbnail images preloaded (`priority` prop), remaining lazy-loaded via intersection observer |
| Image Page LCP | < 2.5s | Medium image uses `priority` prop (preloaded), full-res loaded on lightbox click |
| Total page weight (Image Page) | < 500KB initial | Medium WebP ~100KB, everything else deferred |
| CDN hit rate | > 95% after warm-up | 364 static files with 1-year cache headers. CloudFront caches indefinitely. |

#### 13.2.7 Cost

| Item | Cost |
|---|---|
| S3 storage (~600MB) | $0.014/month ($0.023/GB) |
| CloudFront data transfer | $0 (1TB/month free — permanent, not 12-month) |
| CloudFront requests | $0 (10M requests/month free) |
| **Total image infrastructure cost** | **~$0.01/month** |

This closes **SIM-05** (image processing pipeline) and resolves the image storage decision.

### 13.3 Static Content

All site copy — homepage intro, auction explanation, How Bidding Works, About the Artist, painting narratives, series descriptions — is stored as markdown files in `content/` and rendered at build time. Updates require a code deployment (push to git → Amplify auto-builds → live within ~3 minutes).

**TECH-03 resolved:** Markdown in the codebase, edited in VS Code. No headless CMS. The content is written once for 52 paintings, not updated daily. A CMS would add a third-party dependency for content that barely changes.

---

## 14. Infrastructure Costs (Estimated)

All services are AWS except Stripe (no AWS payment processing alternative exists).

| Service | What | Estimated Monthly Cost |
|---|---|---|
| **Amplify Hosting** | Build, deploy, CDN (CloudFront) | $0 (free tier: 1,000 build min/mo, 15 GB served) |
| **Lambda** | API routes (via Amplify) + auction close check | $0 (free tier: 1M requests/mo, 400K GB-sec) |
| **RDS PostgreSQL** | Auction engine database (`db.t3.micro`) | ~$13/month (free tier may cover first 12 months) |
| **RDS Proxy** | Connection pooling for Lambda | ~$11/month (free tier may cover first 12 months) |
| **S3** | Image storage (~600MB) | $0.01 |
| **CloudFront** | Image CDN | $0 (1TB/mo free — permanent) |
| **SES** | Transactional email | $0.30 (~100 emails/mo) |
| **SNS** | SMS notifications | $1-4 (~20 SMS/day at peak) |
| **Route 53** | DNS hosting | $0.50 |
| **ACM** | SSL certificate | $0 |
| **CloudWatch** | Monitoring and logs | $0 (free tier) |
| **EventBridge** | Scheduled auction close check | $0 (14M invocations/mo free — permanent) |
| **Stripe** | Payment processing | 2.9% + $0.30 per charge (passed through) |
| **Domain** | fhoa.org renewal | ~$12/year |
| **Total (with free tier)** | | **~$2-5/month** |
| **Total (without free tier)** | | **~$26-30/month** |

**Post-auction (archive mode):** Static export to S3 + CloudFront. Delete RDS, RDS Proxy, Amplify, EventBridge. **~$0.51/month** (S3 storage + Route 53). Effectively permanent at near-zero cost.

---

## 15. Open Questions (Technical)

| ID | Question | Impact | Owner |
|---|---|---|---|
| TECH-01 | Stripe Connect vs. direct account for fiduciary fund flow? | Payment architecture, escrow handling | Fiduciary (AM-OQ-02) |
| TECH-02 | Credit card / lawyer-mediated threshold amount? | Bid flow routing in API | Fiduciary (J02c-01) |
| TECH-03 | ~~Headless CMS for content or markdown in codebase?~~ | ~~Content update workflow~~ | **Resolved:** Markdown in repo, edited in VS Code. No CMS. (SPR-012) |
| TECH-04 | ~~Supabase vs. Neon? Real-time vs. polling?~~ | ~~Architecture simplicity vs. flexibility~~ | **Resolved:** RDS PostgreSQL (database only). Polling (no WebSocket/real-time infrastructure). Gallery is static markdown; only auction engine uses the database. (SPR-012, updated SPR-013: Neon → RDS as part of AWS consolidation) |
| TECH-06 | AWS infrastructure as code? | Amplify handles most infra, but RDS, RDS Proxy, EventBridge, S3 buckets need provisioning. Manual setup for now; consider CloudFormation or CDK if complexity grows. | Agent decides at build time |
| TECH-05 | Settlement disbursement: automated via Stripe Connect or manual by fiduciary? | Settlement automation level | Fiduciary (AM-OQ-02) |

---

## 16. Cross-Reference: Data/State → Technical Implementation

| Data Entity (03b) | Source | Primary API Endpoints | Polling Endpoint |
|---|---|---|---|
| Painting (§2) | Markdown files (`content/paintings/*.md`) + thin DB reference | Static pages (build-time) | `GET /api/bid-status` |
| Series (§3) | Markdown files (`content/series/*.md`) | Static pages (build-time) | — |
| Bidder (§4) | `bidders` table | Auth endpoints, `GET /api/dashboard` | — |
| Bid (§5) | `bids` table | `POST /api/bids`, `POST /api/bids/[id]/confirm` | `GET /api/bid-status/[slug]` |
| Reward (§6) | `rewards` table | `GET /api/dashboard` (post-settlement) | — |
| WTABid (§7) | `wta_bids` table | `POST /api/admin/wta` | `GET /api/auction` |
| Auction (§9) | `auction` table | `GET /api/auction` | `GET /api/auction` |
| Notifications (§10) | `notifications` table | Sent inline with bid events (SES/SNS). Daily retry sweep for failures. | — |
