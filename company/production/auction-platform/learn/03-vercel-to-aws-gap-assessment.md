# Vercel-to-AWS Gap Assessment

**Date:** 2026-03-26
**Sprint:** SPR-013
**Context:** The Phase 4 technical architecture (spec-v1-04, v2) was written for Vercel + Neon + Resend + Twilio. William decided to consolidate onto AWS. This document captures every gap found by simulating a full build and deployment of the spec against AWS Amplify + RDS + S3 + SES + SNS.

**Method:** Read all 1,288 lines of spec-v1-04 and walked through each section as if scaffolding, coding, and deploying on AWS. Every vendor reference, service assumption, and integration pattern was checked against the AWS equivalent.

---

## Gap Summary

| # | Gap | Severity | Spec Sections |
|---|---|---|---|
| 1 | Vendor references (32+ Vercel mentions) | Must fix | §2, §4, §7, §8, §9, §10, §13, §14 |
| 2 | Database connection pooling (Lambda → RDS) | Dangerous | §2.1, §3, §14 |
| 3 | Image pipeline (storage + optimization) | Must fix | §13.2 (full rewrite) |
| 4 | Cron jobs → EventBridge + Lambda | Dangerous | §8.1, §9.5 |
| 5 | Rate limiting | Dangerous | §10.3 |
| 6 | Environment variables | Must fix | §9.3 |
| 7 | Admin image upload endpoint | Must fix | §4.3, §13.2.4 |
| 8 | Email/SMS integration pattern | Must fix | §8.2, §8.3 |
| 9 | Post-auction archival procedure | Missing | New section needed |
| 10 | PostgreSQL generated columns on RDS | Safe | §3.1 |
| 11 | Amplify build configuration | Missing | §9.2 |
| 12 | CloudFront caching for API routes | Safe | §7.4 |
| 13 | SES sandbox exit timing | Process gap | New checklist needed |

**Totals:** 3 dangerous, 7 must-fix, 2 safe, 1 missing section.

---

## Detailed Gaps

### GAP 1: Vendor References Throughout the Spec

**Severity:** Must fix
**Sections:** §2.1, §2.2, §2.3, §4.1, §7.4, §8.1, §8.2, §8.3, §9, §10.1, §10.3, §13.2, §14

**Problem:** The spec names Vercel, Neon, Resend/Postmark, Twilio, Vercel Blob, Vercel Analytics, and Sentry as vendor choices. These aren't just labels — they carry assumptions about how services are configured, authenticated, and connected.

**What changes:**

| Current Reference | AWS Replacement | Notes |
|---|---|---|
| Vercel (hosting/CDN) | AWS Amplify Hosting (CloudFront) | Same concept, different config |
| Vercel CDN | CloudFront (via Amplify) | Amplify manages CloudFront automatically |
| Vercel serverless functions | Lambda (via Amplify) | Amplify wraps Lambda for Next.js API routes |
| Vercel Cron Job | EventBridge Scheduler + Lambda | See GAP 4 |
| Vercel Edge Middleware | AWS WAF or application-level | See GAP 5 |
| Vercel Blob | Amazon S3 | See GAP 3 |
| Vercel Image Optimization | Pre-process with Sharp or Amplify Image | See GAP 3 |
| Vercel OG (`@vercel/og`) | Sharp pre-generation or `@vercel/og` as npm package | Package works outside Vercel |
| Vercel Analytics | Amazon CloudWatch | Basic analytics; add Plausible/Umami for web analytics |
| Neon PostgreSQL | Amazon RDS PostgreSQL | See GAP 2 |
| Resend / Postmark | Amazon SES | See GAP 8 |
| Twilio | Amazon SNS | See GAP 8 |
| Sentry | Amazon CloudWatch + X-Ray | Error tracking less polished than Sentry |

**Fix:** Replace all vendor names and update any configuration details that are vendor-specific (URLs, SDK imports, auth patterns).

---

### GAP 2: Database Connection Pooling (Lambda → RDS)

**Severity:** Dangerous
**Sections:** §2.1, §3, §14

**Problem:** The spec uses Neon, which has a built-in serverless driver (`@neondatabase/serverless`) that handles connection pooling transparently. Lambda functions connect, query, and disconnect — Neon's proxy manages the pool.

RDS PostgreSQL has no such driver. Every Lambda cold start opens a new TCP connection to the database. With concurrent invocations (multiple bid-status polls, a bid placement, a webhook), connections accumulate. `db.t3.micro` supports ~80 concurrent connections. If connections aren't pooled or reused, the database can hit its limit and reject new connections.

**Why this is dangerous:** A connection exhaustion failure would cause all API routes to fail simultaneously — bid placement, bid status, dashboard, everything. It's a single point of failure with no graceful degradation.

**Options:**

| Option | How It Works | Cost | Complexity |
|---|---|---|---|
| **RDS Proxy** | Managed connection pooler between Lambda and RDS. Pools and reuses connections. Handles Lambda's connect/disconnect pattern natively. | ~$11/mo (free tier 12 months) | Low — add endpoint to connection string |
| **Application-level pooling** | Use `pg` driver with connection reuse across warm Lambda invocations. Each container holds one connection; pool is per-container. | $0 | Medium — need to handle connection lifecycle |
| **Neon (hybrid exception)** | Keep Neon as the one non-AWS vendor. Permanent free tier, built-in pooling, no 12-month cliff. | $0 | Low — no change from current spec |

**Recommendation:** RDS Proxy if going full AWS. It's the production-grade answer and is free for 12 months. Application-level pooling is a viable alternative that avoids the post-free-tier cost.

**Spec impact:** Add RDS Proxy (or chosen pooling strategy) to §2.1 tech stack. Add a connection management subsection to §3. Add cost line to §14.

---

### GAP 3: Image Pipeline (Storage + Optimization)

**Severity:** Must fix
**Sections:** §13.2 (full rewrite)

**Problem:** §13.2 is entirely Vercel-specific — Vercel Blob for storage, Next.js Image Optimization (Vercel's built-in handler) for resizing, `@vercel/blob` SDK for uploads. Every subsection (§13.2.1 through §13.2.7) references Vercel services.

**What changes:**

| Concern | Current (Vercel) | AWS |
|---|---|---|
| **Storage** | Vercel Blob (`@vercel/blob` SDK) | S3 bucket (`@aws-sdk/client-s3`) |
| **URL pattern** | `https://[store].public.blob.vercel-storage.com/paintings/[slug].jpg` | `https://[distribution].cloudfront.net/paintings/[slug].jpg` (or S3 direct) |
| **On-demand optimization** | Next.js `<Image>` component → Vercel's optimizer | Amplify supports Next.js Image (Lambda-backed optimizer), OR pre-process at build time |
| **OG images** | `@vercel/og` (edge function) or Sharp pre-generation | Sharp pre-generation (recommended) or `@vercel/og` as npm package |
| **Upload script** | `@vercel/blob` SDK put() | `@aws-sdk/client-s3` PutObject |
| **Cost** | $0 (included in Vercel Pro) | $0.023/GB/month for S3 (~$0.01 for 400MB). CloudFront free tier for delivery. |

**Recommended approach:** Pre-process images at build time using Sharp. Generate 3-4 sizes per painting (thumbnail 400px, medium 1200px, full-res, OG 1200x630). Upload all variants to S3. Serve through CloudFront. This is simpler than on-demand optimization on AWS and predictable for 52 paintings.

**Spec impact:** Rewrite §13.2 entirely. Update §13.2.2 (storage architecture), §13.2.3 (OG generation), §13.2.4 (upload workflow), §13.2.7 (cost).

---

### GAP 4: Cron Jobs → EventBridge + Lambda

**Severity:** Dangerous
**Sections:** §8.1, §9.5

**Problem:** The spec uses "Vercel Cron Job" for two critical scheduled tasks:

1. **Auction close trigger** (§9.5) — runs every minute, executes `checkAuctionClose()`. This is the single most critical automated event: it must fire reliably at `2026-12-31T23:59:59-05:00`.
2. **Notification processor** (§8.1) — runs every 30 seconds, processes queued notifications from the `notifications` table.

AWS Amplify does not have a built-in cron feature.

**Why this is dangerous:** The auction close trigger is the most critical automated event in the system. If it doesn't fire, the auction doesn't close. A missed notification processor cycle means outbid bidders don't get notified promptly.

**Solution: Amazon EventBridge Scheduler + Lambda**

EventBridge Scheduler is the AWS equivalent of Vercel Cron. It triggers a Lambda function on a schedule.

| Task | Schedule | Lambda |
|---|---|---|
| Auction close check | `rate(1 minute)` | `checkAuctionClose` — standalone Lambda |
| Notification processor | `rate(1 minute)` (not 30s — EventBridge minimum is 1 minute) | `processNotifications` — standalone Lambda |

**Key difference:** EventBridge's minimum schedule rate is 1 minute. The notification processor was spec'd at 30 seconds on Vercel. At 1 minute, worst-case notification latency doubles from 30s to 60s. For an auction where bids happen hours apart, this is acceptable.

**Architectural choice:** These Lambda functions should be **standalone** (separate from the Next.js app), not API routes hit via HTTP. Reasons:
- They don't need HTTP request/response overhead
- They can be deployed independently (no dependency on the web app being healthy)
- They share the same database connection logic and business code (packaged as a shared library or Lambda layer)

**Spec impact:** Rewrite §8.1 and §9.5 for EventBridge + standalone Lambda. Note the 1-minute minimum interval. Define whether cron Lambdas live in the same repo or separate deployment.

---

### GAP 5: Rate Limiting

**Severity:** Dangerous
**Sections:** §10.3

**Problem:** §10.3 specifies "Vercel Edge Middleware rate limiting: 10 bid attempts per minute per IP." Amplify does not have edge middleware with built-in rate limiting.

**Why this is dangerous:** Without rate limiting, a malicious actor could spam `POST /api/bids` and create many `payment_processing` records, temporarily locking tiers. Even if each times out, it disrupts the auction during the lock window.

**Options:**

| Option | How It Works | Cost | Trade-off |
|---|---|---|---|
| **AWS WAF** | Rate-based rules on the CloudFront distribution. Block IPs exceeding threshold. | ~$6/mo ($5 web ACL + $1/rule + $0.60/M requests) | Production-grade. Managed service. Adds a cost line. |
| **Database-based counting** | Middleware in Next.js checks a `rate_limits` table (IP + timestamp + count). Reject if over limit. | $0 | Adds a DB query per request. Simple but less robust (application-level, not edge-level). |
| **In-memory per-container** | Track counts in a Map per Lambda container. | $0 | Unreliable — Lambda containers are ephemeral. Different containers don't share state. A distributed attacker would bypass this. |

**Recommendation:** Database-based rate limiting for launch. It's free, simple, and sufficient for FHOA's threat model (a small art auction, not a high-value DeFi target). Add AWS WAF if abuse is observed post-launch.

**Spec impact:** Rewrite §10.3 rate limiting row. Specify the chosen approach and its limits.

---

### GAP 6: Environment Variables

**Severity:** Must fix
**Sections:** §9.3

**Problem:** §9.3 lists environment variables including vendor-specific ones that don't apply on AWS. AWS services on Lambda authenticate via IAM roles, not API keys.

**Variables to remove:**

| Variable | Why |
|---|---|
| `RESEND_API_KEY` | SES uses IAM. No API key needed on Lambda. |
| `TWILIO_ACCOUNT_SID` | SNS uses IAM. No credentials needed on Lambda. |
| `TWILIO_AUTH_TOKEN` | Same. |
| `TWILIO_FROM_NUMBER` | Configure in SNS, not as env var (or use `SNS_ORIGINATION_NUMBER`). |

**Variables to add:**

| Variable | Purpose |
|---|---|
| `DATABASE_URL` | RDS (or RDS Proxy) PostgreSQL connection string |
| `AWS_REGION` | Auto-set on Lambda, but needed for local development |
| `S3_BUCKET_NAME` | Image storage bucket name |
| `CLOUDFRONT_URL` | CloudFront distribution URL for image delivery |
| `SES_FROM_EMAIL` | Verified sender address (`auction@fhoa.org`) |
| `SNS_ORIGINATION_NUMBER` | SMS sender number (if applicable) |

**Variables unchanged:** `DATABASE_URL`, `STRIPE_*`, `NEXTAUTH_*`, `GOOGLE_*`, `APPLE_*`, `ADMIN_EMAIL` — these are service-agnostic.

**Spec impact:** Update §9.3 table.

---

### GAP 7: Admin Image Upload Endpoint

**Severity:** Must fix
**Sections:** §4.3, §13.2.4

**Problem:** §4.3 `PUT /api/admin/paintings/[slug]` says "Update painting image in Vercel Blob." The implementation uses `@vercel/blob` SDK.

**Fix:** Replace with `@aws-sdk/client-s3` PutObject. The API route receives the image, validates it, uploads to S3, generates OG variant with Sharp, uploads OG to S3, and updates the database record.

```
// Before (Vercel)
import { put } from '@vercel/blob'
const blob = await put(`paintings/${slug}.jpg`, file, { access: 'public' })

// After (AWS)
import { S3Client, PutObjectCommand } from '@aws-sdk/client-s3'
const s3 = new S3Client({ region: process.env.AWS_REGION })
await s3.send(new PutObjectCommand({
  Bucket: process.env.S3_BUCKET_NAME,
  Key: `paintings/${slug}.jpg`,
  Body: file,
  ContentType: 'image/jpeg'
}))
```

**Spec impact:** Update §4.3 description and §13.2.4 upload workflow code references.

---

### GAP 8: Email/SMS Integration Pattern

**Severity:** Must fix
**Sections:** §8.2, §8.3

**Problem:** The spec describes email via Resend/Postmark (HTTP API with API key) and SMS via Twilio (HTTP API with account credentials). AWS equivalents use a fundamentally different auth model.

**Email: Resend → Amazon SES**

| Concern | Resend | SES |
|---|---|---|
| Auth | API key in header | IAM role (automatic on Lambda) |
| SDK | `resend` npm package | `@aws-sdk/client-ses` |
| Sending | `resend.emails.send({ from, to, subject, html })` | `ses.send(new SendEmailCommand({ Source, Destination, Message }))` |
| Setup | Add API key, done | Verify domain (DNS records), request production access (24-48h review) |
| Templates | Resend templates or raw HTML | SES templates or raw HTML |
| Deliverability | Good | Excellent (same infrastructure as Amazon) |
| Cost | Free tier: 3,000/mo. Then $1/1,000 | $0.10/1,000 emails. ~$0.30/mo at FHOA volume |

**SMS: Twilio → Amazon SNS**

| Concern | Twilio | SNS |
|---|---|---|
| Auth | Account SID + auth token | IAM role (automatic on Lambda) |
| SDK | `twilio` npm package | `@aws-sdk/client-sns` |
| Sending | `client.messages.create({ body, from, to })` | `sns.publish({ Message, PhoneNumber })` |
| Setup | Create account, get number | Request SMS sandbox exit, configure origination number |
| Cost | $0.0079/SMS | $0.0075/SMS (US) |
| Compliance | Twilio handles TCPA | You manage TCPA compliance (opt-in tracking, STOP handling) |

**Important difference:** Twilio handles SMS compliance (10DLC registration, STOP keyword processing) mostly automatically. With SNS, you manage TCPA compliance in your application — tracking opt-ins, honoring STOP responses. The spec's §8.3 compliance row ("TCPA compliance — explicit opt-in, easy opt-out via STOP") needs to specify how STOP is handled with SNS.

**Spec impact:** Rewrite §8.2 and §8.3 with SES/SNS details, SDK references, and compliance handling.

---

### GAP 9: Post-Auction Archival Procedure

**Severity:** Missing (new section needed)
**Sections:** None — needs to be added

**Problem:** The spec mentions "the gallery stands alone as a permanent archive" (§2.3) and "Post-auction (archive mode): Vercel Hobby ($0) + static site only" (§14). But there's no procedure for how to actually perform this transition on AWS.

**What's needed:**

1. **Static export:** Configure Next.js for static export (`output: 'export'` in `next.config.ts`). This generates a folder of HTML/CSS/JS with no server dependency.
2. **Dynamic page handling:** Dashboard, bid flows, registration — these pages must either:
   - Be excluded from the static export and replaced with a "The auction has ended" message
   - Or be preserved as read-only snapshots (complex — requires baking in final state)
3. **S3 static hosting setup:**
   - Create S3 bucket with static website hosting enabled
   - Upload the exported static site
   - Configure CloudFront distribution pointed at S3
4. **DNS cutover:** Update Route 53 records from Amplify → CloudFront/S3
5. **Infrastructure teardown:**
   - Export final database state (pg_dump) for records
   - Delete RDS instance
   - Delete Amplify app
   - Delete EventBridge schedules
   - Keep: S3 bucket (images + static site), CloudFront, Route 53
6. **Cost reduction:** ~$0.51/month (S3 storage + Route 53 hosted zone)

**Spec impact:** Add new subsection to §9 (e.g., §9.6 Post-Auction Archival) or §13.

---

### GAP 10: PostgreSQL Generated Columns on RDS

**Severity:** Safe
**Sections:** §3.1

**Assessment:** The `paintings` table uses `GENERATED ALWAYS AS ... STORED` computed columns for `square_inches`, `tier1_price_cents`, etc. This feature is supported in PostgreSQL 12+. RDS currently offers PostgreSQL 13–16. No compatibility issue.

**No spec change needed.**

---

### GAP 11: Amplify Build Configuration

**Severity:** Missing
**Sections:** §9.2

**Problem:** §9.2 describes the deployment pipeline as "Git push → Vercel auto-deploy → Build (Next.js) → Deploy to edge." Amplify uses a similar flow but requires an `amplify.yml` configuration file.

**What's needed:**

```yaml
# amplify.yml
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
        - node scripts/seed-paintings.js   # Seed thin reference table
  artifacts:
    baseDirectory: .next
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
      - .next/cache/**/*
```

**Key detail:** The `postBuild` phase is where the paintings reference table gets seeded. On Vercel this was described as a "deploy-time script" (§13.1 step 5) without specifying how it hooks into the build. Amplify makes this explicit.

**Spec impact:** Add Amplify build configuration to §9.2. Specify the seed script's position in the build lifecycle.

---

### GAP 12: CloudFront Caching for API Routes

**Severity:** Safe
**Sections:** §7.4

**Assessment:** §7.4 notes that "Vercel CDN can cache `GET /api/bid-status` with `Cache-Control: s-maxage=10`." CloudFront respects `Cache-Control` headers from the origin (Lambda via Amplify). Amplify's Next.js adapter configures CloudFront to handle static vs. dynamic routes correctly — static assets get long TTLs, API routes are forwarded to Lambda.

The API route returns a `Cache-Control: s-maxage=10` header → CloudFront caches the response for 10 seconds → concurrent viewers share a single Lambda invocation per 10-second window. This works identically to Vercel's behavior.

**No spec change needed,** but worth explicitly noting that CloudFront's default behavior matches. If Amplify's auto-config doesn't respect `s-maxage` for API routes, a manual CloudFront cache behavior may need to be added.

---

### GAP 13: SES Sandbox Exit Timing

**Severity:** Process gap
**Sections:** None — needs to be added to a checklist

**Problem:** Amazon SES starts in sandbox mode. In sandbox, you can only send email to verified email addresses — not to real users. To send to anyone, you must request "production access" via the AWS console. AWS reviews the request (24-48 hours, sometimes longer).

If this isn't done early, you'll be blocked from testing email notifications in staging and blocked from sending real emails at launch.

**What's needed:** Add to a deployment prerequisites checklist:
- Request SES production access during development (not at launch)
- Verify the `fhoa.org` domain in SES (requires DNS records: DKIM, SPF, DMARC)
- Set up a configuration set for tracking bounces and complaints (SES requires this for production senders)
- Similarly, request SNS SMS sandbox exit for production SMS sending

**Spec impact:** Add a deployment prerequisites section or checklist to §9.

---

## Migration Checklist

For the spec v3 rewrite, every item below must be addressed:

- [x] §2.1 — Replace tech stack table with AWS services *(SPR-013)*
- [x] §2.2 — Redraw service boundary diagram with CloudFront/Amplify/Lambda/RDS *(SPR-013)*
- [x] §2.3 — Update separation table (Neon → RDS) *(SPR-013)*
- [x] §3 — Add connection management subsection (RDS Proxy) — §3.10 *(SPR-013)*
- [x] §4.3 — Rewrite admin image upload for S3 *(SPR-013)*
- [x] §7.4 — Note CloudFront caching equivalence *(SPR-013)*
- [x] §8.1 — Rewrite notifications: inline sending, no background processor *(SPR-013 — simplified further: eliminated queue+processor pattern entirely)*
- [x] §8.2 — Rewrite email section for SES *(SPR-013)*
- [x] §8.3 — Rewrite SMS section for SNS (including TCPA compliance handling) *(SPR-013)*
- [x] §9.2 — Add Amplify build configuration (amplify.yml) *(SPR-013)*
- [x] §9.3 — Update environment variables table *(SPR-013)*
- [x] §9.4 — Rewrite domain config for Route 53 + ACM *(SPR-013)*
- [x] §9.5 — Rewrite auction close trigger for EventBridge + standalone Lambda *(SPR-013 — simplified: daily check, not every minute)*
- [x] §9.6 — Add post-auction archival procedure (new section) *(SPR-013)*
- [x] §9.7 — Add deployment prerequisites checklist *(SPR-013)*
- [x] §10.1 — Update HTTPS reference (CloudFront/ACM) *(SPR-013)*
- [x] §10.3 — Rewrite rate limiting (database-based, WAF as upgrade path) *(SPR-013)*
- [x] §13.2 — Full rewrite of image infrastructure for S3 + Sharp pre-processing *(SPR-013)*
- [x] §14 — Full rewrite of cost table for AWS *(SPR-013)*
- [x] §15 — Update open questions (added TECH-06: infrastructure as code) *(SPR-013)*

---

## Lessons: Moving from Vercel to AWS

These patterns apply to any Next.js project migrating from Vercel to AWS:

1. **Connection pooling is invisible on serverless-native databases (Neon, PlanetScale) but critical on traditional databases (RDS).** Budget for RDS Proxy or equivalent.
2. **Cron jobs are a platform feature on Vercel but require a separate service (EventBridge) on AWS.** The minimum interval is 1 minute on EventBridge vs. configurable on Vercel.
3. **Rate limiting at the edge is built into Vercel but requires AWS WAF on CloudFront.** WAF adds cost. Application-level rate limiting is a free alternative but less robust.
4. **Image optimization is automatic on Vercel, manual on AWS.** For small, fixed catalogs, pre-processing with Sharp is simpler than running Lambda@Edge for on-demand resizing.
5. **AWS services authenticate via IAM, not API keys.** Code that uses `fetch()` with an API key header becomes SDK calls with automatic IAM credential resolution. This is more secure (no secrets in env vars for AWS services) but a different programming model.
6. **SES and SNS require production access requests with review periods.** Plan for 24-48 hours lead time. Vercel-ecosystem email services (Resend, Postmark) are instant.
7. **Post-deployment archival is cleaner on AWS.** S3 static hosting + CloudFront is a first-class deployment target. On Vercel, the cheapest archive option has commercial-use restrictions (Hobby tier).
8. **Amplify handles most Next.js features but isn't Vercel-native.** Bleeding-edge features (on-demand ISR, edge middleware) may lag. For standard SSG + API routes, Amplify is fully capable.
