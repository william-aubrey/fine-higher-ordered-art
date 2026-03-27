# AWS Web Hosting — Research for Charlotte Collection Auction Platform

**Date:** 2026-03-26
**Sprint:** SPR-013
**Context:** The Phase 4 spec assumed Vercel ($20/mo) + Neon (free) for hosting. William wants to eliminate all non-AWS vendor solutions and consolidate onto AWS infrastructure. This document evaluates how to host the full platform — static gallery + auction engine — entirely on AWS.

---

## 1. The Problem with the Current Spec

The Phase 4 architecture depends on five vendors:

| Function | Current Vendor | Cost |
|---|---|---|
| Hosting / CDN / serverless | Vercel Pro | $20/mo |
| Database | Neon (free tier) | $0 |
| Image storage | Vercel Blob | $0 (included in Pro) |
| Image optimization | Next.js Image (Vercel) | $0 (included in Pro) |
| Email | Resend or Postmark | ~$0-20/mo |
| SMS | Twilio | ~$0-5/mo |
| Error monitoring | Sentry | $0 (free tier) |

That's 7 vendor accounts, 7 billing relationships, 7 terms of service. AWS can replace most of these with a single account.

---

## 2. AWS Service Mapping

| Function | AWS Service | Replaces |
|---|---|---|
| **Hosting + CDN + build** | AWS Amplify Hosting | Vercel |
| **Serverless functions** | AWS Lambda (via Amplify) | Vercel Serverless Functions |
| **Database** | Amazon RDS PostgreSQL (or Aurora Serverless v2) | Neon |
| **Image storage** | Amazon S3 | Vercel Blob |
| **Image optimization** | CloudFront + Lambda@Edge (or pre-process at build) | Next.js Image Optimization |
| **Email** | Amazon SES | Resend / Postmark |
| **SMS** | Amazon SNS | Twilio |
| **SSL certificates** | AWS Certificate Manager (ACM) | Vercel auto-SSL |
| **Domain / DNS** | Amazon Route 53 | Domain registrar DNS |
| **Error monitoring** | Amazon CloudWatch | Sentry |
| **CDN** | Amazon CloudFront (via Amplify) | Vercel CDN |

---

## 3. Architecture Options

### Option A: AWS Amplify (Recommended)

**What it is:** Amplify Hosting is AWS's managed platform for web apps. It's the closest thing AWS has to Vercel — connects to a Git repo, auto-builds on push, deploys to CloudFront CDN, runs server-side code as Lambda functions.

**How it works with Next.js:**
- Amplify has first-class Next.js support (App Router, SSG, SSR, API routes)
- Static pages (the gallery) are generated at build time and served from CloudFront
- API routes (the auction engine) run as Lambda functions
- Push to `main` → Amplify auto-builds → live in ~2-3 minutes
- Every PR branch gets a preview deployment (like Vercel preview URLs)

**Architecture:**
```
Route 53 (DNS: fhoa.org)
  │
  ▼
CloudFront CDN (via Amplify)
  │
  ├── Static gallery pages (from markdown, built at deploy)
  ├── Images (S3 origin)
  │
  └── Lambda functions (via Amplify)
        ├── /api/bid-status (polling)
        ├── /api/bids (bid placement)
        ├── /api/auth/* (NextAuth)
        └── /api/webhooks/stripe
              │
              ▼
        RDS PostgreSQL
        (bidders, bids, rewards, paintings ref)
```

**What Amplify handles automatically:**
- Git-triggered builds and deploys
- CloudFront distribution with SSL
- Branch-based preview environments
- Lambda provisioning for API routes
- Environment variable management

**Limitations:**
- On-demand ISR (Incremental Static Regeneration) has limited support on Amplify — but this is a non-issue for FHOA. Bid status is fetched client-side via 30-second polling, not through ISR. Gallery pages are fully static and only change when you push a content update (which triggers a full rebuild).
- Build times may be slightly slower than Vercel (~2-3 min vs ~1 min)
- Next.js middleware support exists but can have edge cases

### Option B: S3 + CloudFront + Lambda (Manual)

**What it is:** Build the deployment pipeline yourself. Export the static gallery to S3, put CloudFront in front, run API routes as standalone Lambda functions behind API Gateway.

**Pros:** Maximum control, potentially cheapest, no framework lock-in.

**Cons:** Significant operational overhead. You manage the build pipeline (CodeBuild or GitHub Actions), CloudFront cache invalidation, Lambda packaging, API Gateway configuration, and environment management yourself. Not recommended for a solo operator building an art auction, not an infrastructure business.

### Option C: Lightsail Container

**What it is:** Run the entire Next.js app as a Docker container on AWS Lightsail. Fixed monthly pricing ($7-10/mo for the smallest container).

**Pros:** Simple mental model (one container, one price). No Lambda cold starts.

**Cons:** Always-on server (paying even when idle). No auto-scaling. No built-in CDN (need to add CloudFront separately). More operational work than Amplify.

### Recommendation: Option A (Amplify)

Amplify gives us the Vercel-like developer experience (push to deploy, preview URLs, managed infrastructure) within the AWS ecosystem. The gallery + auction engine architecture maps cleanly: static pages via CloudFront, API routes via Lambda.

---

## 4. Cost Analysis

### FHOA Scale Parameters

- 52 static painting pages + ~10 other static pages
- ~100-500 visitors/day during active auction
- ~10-50 bids/day at peak
- 52 high-resolution images (~200MB total)
- Small PostgreSQL database (< 1GB)
- ~100 transactional emails/day at peak
- ~20 SMS notifications/day at peak
- 6-9 month active auction period

### Option A: Amplify + RDS (All AWS)

| Service | What | Monthly Cost | Notes |
|---|---|---|---|
| **Amplify Hosting** | Build + deploy + CDN | $0-2 | Free tier: 1,000 build minutes/mo, 15 GB served/mo. FHOA is well within this. Beyond free tier: $0.01/build minute, $0.15/GB served. |
| **Amplify SSR** | Lambda for API routes | $0-1 | Free tier: 1M Lambda requests/mo, 400,000 GB-seconds. FHOA's polling + bid traffic is a rounding error. |
| **RDS PostgreSQL** | Auction engine database | $0-15 | `db.t3.micro` or `db.t4g.micro`: free tier eligible (12 months). After free tier: ~$13-15/mo. Single-AZ is fine for this use case. |
| **S3** | Image storage (~200MB) | $0.01 | $0.023/GB/mo. 200MB = half a cent. |
| **CloudFront** | CDN (via Amplify) | $0 | 1TB/mo free (permanent, not 12-month). FHOA won't approach this. |
| **SES** | Transactional email | $0-1 | $0.10 per 1,000 emails. 100 emails/day = $0.30/mo. |
| **SNS** | SMS notifications | $0-2 | $0.0075/SMS (US). 20/day = $4.50/mo at peak. Most months less. |
| **Route 53** | DNS | $0.50 | $0.50/hosted zone/mo. Fixed. |
| **ACM** | SSL certificate | $0 | Free with CloudFront/Amplify. |
| **CloudWatch** | Monitoring / logs | $0 | Free tier covers basic monitoring. |
| **Total (free tier active)** | | **$1-4/mo** | First 12 months. RDS free tier is the big one. |
| **Total (after free tier)** | | **$15-22/mo** | RDS dominates. Everything else stays near-free. |

### Comparison: Current Spec vs AWS

| | Vercel + Neon | AWS Amplify + RDS |
|---|---|---|
| **Months 1-9 (auction active)** | $20-30/mo | $1-4/mo (free tier) |
| **Months 10-12 (winding down)** | $20-30/mo | $15-22/mo (RDS free tier expires at month 12) |
| **Post-auction (static archive)** | $0-20/mo | $0.51/mo (S3 + CloudFront + Route 53) |
| **Total cost (9-month auction)** | $180-270 | $9-36 |

**The AWS Free Tier is the key insight.** The auction runs ~9 months. AWS Free Tier covers the first 12 months. That means the entire active auction period could fall within free tier — the database (the biggest cost) is free for the first year.

### Post-Auction Archival

When the auction ends:
1. Run `next export` to generate a fully static site
2. Upload to S3 → CloudFront serves it
3. Delete the RDS instance, Lambda functions, Amplify app
4. **Permanent archive cost: ~$0.51/month** (S3 storage + Route 53 DNS)

This is the strongest advantage over Vercel, where the cheapest option post-auction is either $0 (Hobby tier, but no commercial use) or $20/mo (Pro).

---

## 5. Database Deep Dive

### Option 1: RDS PostgreSQL (Recommended)

- `db.t3.micro` or `db.t4g.micro` — 1 vCPU, 1 GB RAM, 20 GB storage
- **Free tier: 12 months** (750 hours/mo of db.t3.micro, 20 GB storage, 20 GB backup)
- After free tier: ~$13-15/month
- Reliable, mature, well-documented
- Automated backups, point-in-time recovery

### Option 2: Aurora Serverless v2

- Scales to zero (in theory) — pay only when queries run
- Minimum 0.5 ACU when active = ~$43/month if always on
- **Not cost-effective at this scale.** The minimum ACU charge exceeds RDS. Aurora Serverless makes sense for unpredictable high-traffic workloads, not a small auction.

### Option 3: Keep Neon (Hybrid Approach)

- Neon's free tier: 0.5 GB storage, 190 compute hours/month, scales to zero
- No 12-month expiration — free tier is permanent
- Already in the spec, works well with serverless (connection pooling built in)
- **Trade-off:** Adds one non-AWS vendor, but eliminates the RDS cost cliff at month 12

### Recommendation

**RDS PostgreSQL** if going all-AWS. The free tier covers the full auction period. After the auction, delete the instance — the static archive doesn't need a database.

**Neon** if William is open to one exception. Neon's permanent free tier means zero database cost forever, with no 12-month cliff. The hybrid (Amplify + Neon) may be the most cost-effective long-term option.

---

## 6. Image Handling on AWS

### Storage: S3

All painting images (52 source files, ~4MB each, ~200MB total) stored in an S3 bucket. Served through CloudFront CDN. Cost: effectively zero at this scale.

### Optimization: Three Approaches

**Approach 1: Pre-process at build time (Recommended)**
- A build script generates 3-4 sizes per painting (thumbnail, medium, large, OG) using Sharp
- Upload all variants to S3
- CloudFront serves them directly — no runtime processing
- Simple, predictable, no Lambda@Edge complexity
- 52 paintings × 4 sizes = 208 files. One-time generation.

**Approach 2: CloudFront + Lambda@Edge (on-demand)**
- Lambda@Edge function intercepts image requests, resizes on the fly, caches result
- More complex to set up, but handles any size request
- Overkill for 52 static paintings

**Approach 3: CloudFront Image Optimization (new)**
- AWS has been adding image optimization features to CloudFront
- Still maturing — not as seamless as Vercel/Next.js Image

**Recommendation:** Pre-process at build time. 52 paintings is a tiny set. Generate all sizes once, upload to S3, done. No runtime image processing needed.

### Next.js Image Component

The `<Image>` component in Next.js expects an image optimization endpoint. On Vercel this is automatic. On AWS Amplify, Amplify provides its own image optimization handler that works with the Next.js Image component. If using raw S3 + CloudFront (Option B), you'd need to configure a custom loader or pre-process images.

---

## 7. Email and SMS on AWS

### Email: Amazon SES

- **Cost:** $0.10 per 1,000 emails (after free tier of 3,000/mo from EC2, or 200/day from sandbox)
- **Setup:** Request production access (moves out of sandbox — requires a brief review). Verify your domain (`fhoa.org`). Configure DKIM/SPF/DMARC.
- **Deliverability:** Excellent — SES is a tier-1 email provider. Same infrastructure Amazon uses.
- **Complexity:** More setup than Resend/Postmark (DNS records, production access request), but straightforward. Use the `@aws-sdk/client-ses` npm package.
- **Templates:** SES supports HTML email templates. Or send raw HTML from the app.

### SMS: Amazon SNS

- **Cost:** $0.0075 per SMS (US). International varies.
- **Setup:** Request SMS sandbox exit for production use. Configure a sender ID or origination number.
- **Gotcha:** SNS SMS has been deprioritized by AWS in favor of Amazon Pinpoint for marketing. For transactional SMS (outbid notifications), SNS still works fine.
- **Alternative:** Amazon Pinpoint ($0.0075/SMS + $0/mo for the channel). More features, same price.

### Comparison to Current Spec

| | Resend + Twilio | SES + SNS |
|---|---|---|
| Email cost | $0 (free tier) to $20/mo | ~$0.30/mo at FHOA volume |
| SMS cost | ~$0.0079/SMS | ~$0.0075/SMS |
| Setup | API key, done | DNS verification, sandbox exit review |
| Vendor accounts | 2 additional | 0 (same AWS account) |

---

## 8. Deployment Pipeline on Amplify

### Git-Triggered Deploys (Like Vercel)

1. Connect Amplify to your GitHub repo
2. Configure: `main` branch → production, PR branches → preview
3. Push to `main` → Amplify clones, runs `npm run build`, deploys to CloudFront
4. ~2-3 minutes from push to live

### Build Settings

```yaml
# amplify.yml (in repo root)
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm ci
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: .next
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
      - .next/cache/**/*
```

### Environment Variables

Configured in the Amplify Console (web UI) or via `amplify.yml`. Same concept as Vercel environment variables — `DATABASE_URL`, `STRIPE_SECRET_KEY`, etc.

### Preview Environments

Every PR branch gets its own deployment URL. Amplify creates and destroys these automatically. Same workflow as Vercel preview deployments.

---

## 9. SSL and Domain

- **Route 53:** $0.50/month for the hosted zone. Manages DNS for `fhoa.org`.
- **ACM (AWS Certificate Manager):** Free SSL certificate. Auto-renews. Works with CloudFront/Amplify.
- **Setup:** Transfer or point `fhoa.org` nameservers to Route 53. Request ACM certificate. Amplify connects them automatically.
- **Result:** `https://fhoa.org` with auto-renewing SSL, same as Vercel.

---

## 10. What You Gain vs What You Lose

### Gains (AWS over Vercel)

1. **Cost:** $1-4/month vs $20-30/month during the auction. Near-free post-auction archival.
2. **Single vendor:** One AWS account, one bill, one identity. No Vercel + Neon + Resend + Twilio + Sentry.
3. **Free tier alignment:** AWS Free Tier's 12-month window covers the entire auction period.
4. **Long-term flexibility:** AWS skills and infrastructure transfer to any future project. Vercel is specific to Vercel.
5. **Static archive path:** S3 + CloudFront is the gold standard for static hosting. $0.51/month forever.
6. **No commercial use restrictions:** Vercel Hobby tier prohibits commercial use. AWS Free Tier does not.

### Losses (AWS vs Vercel)

1. **Setup complexity:** Amplify is simpler than raw AWS, but still more configuration than Vercel's zero-config. Expect a few hours of initial setup vs minutes.
2. **Next.js integration depth:** Vercel is made by the Next.js team. Some bleeding-edge features (on-demand ISR, edge middleware) work best on Vercel first, AWS second. For FHOA this doesn't matter — we don't use those features.
3. **Build speed:** Amplify builds are typically ~2-3 minutes vs Vercel's ~1 minute. Not meaningful for a site that deploys a few times a week.
4. **DX polish:** Vercel's dashboard, deployment logs, and analytics are more polished. Amplify's UI is functional but less refined.

### Net Assessment

For FHOA — a 9-month auction with low traffic, a fixed catalog, and a permanent static archive afterward — AWS is the stronger choice. The cost savings are real ($150-230 over the auction lifetime), the single-vendor simplification is meaningful, and the free tier alignment is fortunate. The additional setup complexity is a one-time cost absorbed during scaffolding.

---

## 11. Revised Service Architecture (All-AWS)

| Layer | AWS Service | Monthly Cost |
|---|---|---|
| **Content** | Markdown files in repo (unchanged) | — |
| **Frontend + CDN** | AWS Amplify Hosting (CloudFront) | $0 (free tier) |
| **API / Serverless** | AWS Lambda (via Amplify) | $0 (free tier) |
| **Database** | Amazon RDS PostgreSQL (`db.t3.micro`) | $0 (free tier, 12 mo) |
| **Image storage** | Amazon S3 | $0.01 |
| **Image optimization** | Pre-processed at build time (Sharp) | — |
| **Email** | Amazon SES | $0.30 |
| **SMS** | Amazon SNS | $1-4 |
| **DNS** | Amazon Route 53 | $0.50 |
| **SSL** | AWS Certificate Manager | $0 |
| **Monitoring** | Amazon CloudWatch | $0 (free tier) |
| **Payments** | Stripe (not an AWS service) | Per-transaction |
| **Auth** | NextAuth.js (runs on Lambda) | — |
| **Total** | | **$1-5/mo** |

**Stripe remains the one non-AWS vendor.** AWS does not have a payment processing service. Stripe is the standard for PCI-compliant payment handling and is not replaceable within AWS.

---

## 12. Open Questions

1. **Amplify vs raw S3+CloudFront+Lambda:** This document recommends Amplify for DX. If cost optimization is paramount post-free-tier, the static archive can move to raw S3+CloudFront.

2. **RDS vs Neon (hybrid):** Keeping Neon as the one non-AWS exception avoids the RDS cost cliff at month 12. If the auction ends before month 12, this is moot — delete RDS while it's still free.

3. **SES production access timing:** SES starts in sandbox mode (can only send to verified emails). Production access requires an AWS review (~24-48 hours). Should be requested early in the build process.

4. **Image optimization on Amplify:** Amplify's built-in image optimization with Next.js Image component needs testing during scaffolding. Pre-processing is the fallback.

5. **Stripe is the remaining external vendor.** No AWS alternative exists for PCI-compliant payment processing. This is a necessary exception.
