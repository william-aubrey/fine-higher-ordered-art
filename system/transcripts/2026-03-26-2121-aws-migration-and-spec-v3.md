# Sprint Session — Conversation Record

> *This is a curated conversation record, not a raw transcript. User messages are near-verbatim (~95%). Claude's responses preserve intellectual content but strip tool-call mechanics. Structural elements (tables, code, data models) are reproduced faithfully. Fidelity: ~85-90%.*

**Sprint:** SPR-013
**Date:** 2026-03-26
**Participants:** William, Claude
**Context:** General context restoration and work session

---

## Turn 1: Sprint Open

**William:**

/sprint open

**Claude:**

Opened SPR-013. Noted that SPR-012 (2026-03-25) was opened but never formally closed — its reasoning log and transcript capture substantial work: task management exchange processing, task ID assignment, TECH-03 resolution (markdown, VS Code, this repo), and the major Phase 4 architecture rework (gallery/auction-engine split, paintings table 22→8 columns, WebSocket→polling, cost $20-30/month). No narrative was written for SPR-012.

Restored context from SPR-012's reasoning log and transcript (more recent than SPR-011's bootstrap). Current state: spec suite complete (10 docs, 0 dangerous gaps), Phase 4 v2 reflects the two-layer architecture, all TECH decisions resolved except safe simulation gaps. TASKS.md has 28 open items with IDs. Next recommended task: begin build (PROD-004: project scaffolding).

---

## Turn 2: Retroactive Close of SPR-012

**William:**

Please retroactively close sprint 12

**Claude:**

Wrote the SPR-012 narrative retroactively from the reasoning log and transcript. Session name: "Task Consolidation and Architecture Rework." Key content:

- **Starting Point:** Spec suite complete, three TECH decisions open, C3PO task management exchange waiting
- **Summary:** Four-part session — task management amendment, task IDs, TECH-03 resolution (markdown), Phase 4 architecture rework (gallery/auction-engine split)
- **Discovery:** The Simplification Cascade — resolving TECH-03 unlocked the entire architecture rework. Three TECH decisions collapsed into one architectural insight. Paintings table 22→8 columns, Series table removed, WebSocket→polling, cost $50-70→$20-30/month.
- **Key Decisions:** Ontology-matched task headers, stable task IDs with area prefixes, painting slug as PK, 30/15/60s polling intervals

Updated sprint log (row 12), renamed transcript to match narrative, memory snapshot (10 files), config snapshot (settings.json + 1 hook).

---

## Turn 3: Build Plan, File Placement, and Deployment

**William:**

Tell me your plan for the build and the implementation. Where will you place this files in our repo? Have we already discussed how to deploy this?

**Claude:**

Presented the full build picture in three parts.

**File placement:** Next.js project lives in `company/production/auction-platform/make/`. The `content/` directory (paintings/, series/, pages/) sits inside the app — that's where William works. Each painting is one markdown file with YAML frontmatter + prose body.

**Deployment — fully specced:** Vercel. Push to main → auto-build → live at fhoa.org. Every PR gets a preview URL. Instant rollback. $20-30/month. Post-auction: drop to free tier, delete database, gallery stands alone as static archive.

**Build order (10 steps):**
1. Scaffold (Next.js, TypeScript, Tailwind)
2. Content layer (markdown parsing, sample painting)
3. Static pages (homepage, painting detail, series, about)
4. Database + auth (Neon, NextAuth)
5. Auction engine (bid API, polling, dashboard)
6. Payments (Stripe)
7. Notifications (email, SMS)
8. WTA + settlement
9. Admin
10. Polish (OG images, responsive, performance)

Steps 1-3 are purely static — paintings visible on a website before any database exists. That's the value of the two-layer split.

Asked William to confirm: close PROD-005/006/007 (spec assumes Next.js/Stripe/Vercel), and confirm make/ placement.

---

## Turn 4: Bank Escrow and Trustee Services

**William:**
Do banks offer 'trustee' services where they accept escrow payments for arranged agreements?

**Claude:**
Yes. Most commercial banks offer escrow and trustee services through their trust departments. Laid out the landscape:

- **Bank escrow accounts** — neutral third party, releases funds on condition met. Good for high-value single transactions ($500–2k+ setup fees).
- **Trust departments** — licensed, regulated, can serve as trustee/escrow agent/paying agent. Handles auction proceeds holding, milestone disbursement, etc.
- **Third-party escrow** (Escrow.com etc.) — purpose-built for online transactions, ~1-3%.
- **Payment processor holds** (Stripe manual capture, Connect) — best fit for many smaller transactions with automated release, % per transaction.

For FHOA's scale (~30 paintings, individual sales likely $hundreds to low-$thousands), a payment processor with built-in hold/capture is more practical than bank escrow. Bank escrow makes sense when individual values exceed ~$10k or as an umbrella arrangement holding all auction proceeds until auction close + shipping confirmation.

Offered to map this to the payment flow in the spec.

---

## Turn 4: What Is Vercel and Are There Alternatives?

**William:**

wait, i didn't understand that we had an ongoing bill for this Vercel service. What does Vercel do and is there an alternative?

**Claude:**

Explained Vercel in plain terms: it's the hosting platform — where the website lives on the internet. Serves pages, builds from git, runs serverless functions, optimizes images, handles SSL. $20/month.

Presented alternatives:

| Option | Cost | Trade-off |
|---|---|---|
| Vercel Pro | $20/mo | Easiest, Next.js native |
| Vercel Hobby | $0 | No commercial use allowed |
| Cloudflare Pages | $0 | Generous free tier, supports Next.js, needs some adaptation |
| Netlify | $0-19/mo | Decent Next.js support, not native |
| Railway/Fly.io | $5-10/mo | Container-based, more ops work |
| Self-host VPS | $5-12/mo | Cheapest, most manual |

Framed the real cost: $120-180 total for 6-9 months of auction, then $0 static archive post-auction. Cloudflare Pages is the strongest free alternative. Vercel is the simplest path. Asked William's preference.

---

## Turn 6: Truist Financial Corporation Banking Research

**William:**

Research Truist Financial Corporation's banking services relevant to a small art auction business. Need detailed, factual information about: Treasury & Payment Solutions, Wealth/Trust/Escrow services, Merchant Services, Business Banking accounts, Stripe/payment processor relationships, APIs/fintech partnerships. Also: geographic footprint, creative/arts programs, reputation/news, fee structures, and whether trust/escrow services are accessible to small businesses.

**Claude:**

Delivered comprehensive research across 10 sections with source citations from Truist's own documentation, financial press, and independent reviews.

**Business Banking:** Six checking accounts. Sweet spot is Dynamic Business Checking ($25/mo, waived at $5k balance, 500 transactions, $25k cash deposits). Simple Business Checking is free but 50-transaction limit is tight.

**Merchant Services:** Truist serves 55k+ clients, $22B+ volume, top-20 acquirer. Backend is Global Payments/TSYS. E-commerce path is through Authorize.net (Truist is a reseller). Integrates with Shopify, WooCommerce, custom platforms. Next-business-day funding to Truist checking.

**Treasury:** Commercial/corporate focused. Overkill for FHOA — business checking + merchant services covers the need.

**Wealth/Trust/Escrow:** Full Wealth relationship requires $1M. Corporate trust & escrow is institutional-grade (M&A, municipal bonds, 1031 exchanges) — wrong product for art auction escrow at $500-$50k scale. No published minimums; contact CTES@truist.com. Self-managed hold in business account or Stripe manual capture is more practical.

**Stripe Relationship:** No direct integration or partnership. Compliance dialogue only. Truist's merchant processing runs through Global Payments/TSYS + Authorize.net. Stripe works independently with any bank account.

**APIs:** No public developer API. Open banking launched Feb 2026 (Mastercard) and expanded Mar 2026 (Plaid) — consumer-facing data access, not platform integration. API marketplace planned but not launched.

**Geographic Footprint:** 17 states + DC. 1,900+ branches. Strongest in FL, NC, VA, GA, PA.

**Arts Programs:** None at banking level. Foundation supports creative nonprofits. Wealth Sports & Entertainment group requires $1M+.

**Reputation:** 1.1/5 Trustpilot. Below-average J.D. Power. Post-merger workforce down 36% (59k→38k). $240M overdraft settlement. Ongoing restructuring through 2026.

**Recommendation architecture for FHOA:** Truist Dynamic Business Checking as the bank account, Stripe for payment processing (developer-first, superior API for custom platform), self-managed escrow or Stripe manual capture for auction holds. The bank choice matters less than the payment processor choice.

---

## Turn 5: Truist Banking Services Deep Dive

**William:**
Do a deep dive on the bank Truist and their services. Consider that the auction has a minimum required total sale, so individual transactions may be small starting as low as $16, but could *in theory* go as high as $345,600. Consider this in context of the project's goals and write up a markdown under the auction-platform/learn folder. Add a 01- prefix so we remember what we learned in the order we learned it.

**Claude:**
Researched Truist Financial Corporation across all relevant dimensions — business checking, merchant services, treasury management, trust/escrow, developer APIs, reputation — and cross-referenced against FHOA's full auction financial model (tier pricing $16–$345,600+, escrow requirements, two-tier payment flow, outbid reward mechanics, settlement disbursement complexity).

Key findings:

- **Truist as checking account:** Adequate. Dynamic Business Checking ($25/mo, waived at $5k) handles operating needs. Stripe deposits to any bank.
- **Truist escrow/trust:** Poor fit. Institutional-grade services designed for M&A and municipal bonds. Wrong scale for a one-time art auction.
- **Truist merchant services:** Irrelevant. Global Payments/Authorize.net stack — spec already calls for Stripe.
- **Developer story:** No APIs, no Stripe integration. Bank is a deposit destination, not a technical integration point.
- **Reputation:** 1.1/5 Trustpilot, below-average J.D. Power, $240M overdraft settlement, 36% workforce reduction post-merger.
- **Charlotte connection:** Truist HQ'd in Charlotte — narrative coincidence, not a banking decision factor.

Core insight: the auction's financial architecture has three layers (Stripe → fiduciary attorney → operating bank), and the bank is the least consequential choice. The fiduciary attorney selection is the critical financial infrastructure decision.

Wrote full research document to `auction-platform/learn/01-truist-banking-services-research.md`.

---

## Turn 8: Attorney Research — Heather R. Klein

**William:**
Research the attorney Heather R Klein. Search for any online presence, professional profiles, bar memberships, practice areas, firm affiliations, reviews, or notable cases. Try multiple search approaches. The context: I'm evaluating whether she could serve as a fiduciary attorney for an art auction — holding escrow funds, managing complex disbursements (outbid rewards, settlement payouts), and mediating high-value transactions ($5k-$345k range). Relevant capabilities would include: trust/escrow experience, real estate closings, contract law, fiduciary roles, arts/entertainment law, business transactions.

**Claude:**
Comprehensive research across 10+ web sources (her website, Justia, Martindale-Hubbell, BBB, Facebook, Lawyer.com, Avvo, NC State Bar directory, Yelp, news searches).

**Key findings on Heather R. Klein (Sparta, NC):**
- NC State Bar ID 31922, admitted 2003 (~23 years practice)
- JD from Nova Southeastern / Shepard Broad Law School
- Solo practitioner, current Alleghany County Attorney (since 2021)
- RELANC member, past president 23rd Judicial District Bar
- Martindale-Hubbell "Distinguished" rating
- Practice areas: general practice heavy on real estate closings, wills/trusts, estate admin, civil litigation, bankruptcy, family law
- Uses CertifID for secure wire transactions in closings (all insured)
- 5-star Facebook reviews; one negative review re: estate matter (missed hearing, alleged conflict)
- No disciplinary actions found in searches (verify directly with Bar ID 31922)

**Assessment against FHOA fiduciary role:**

| Capability | Strength |
|---|---|
| Real estate closings / basic escrow | Strong |
| Trust/fiduciary roles | Moderate (estate admin, county attorney) |
| Contract law | Moderate (general practice) |
| Arts/entertainment law | None |
| Complex multi-party disbursements | None |
| Business transactions | Weak |

**Honest take:** Established, well-regarded rural GP with real escrow chops, but the FHOA auction's tiered-bid disbursement structure, outbid rewards, and art-transaction specifics are substantially outside her visible practice. Worth a conversation if there's a personal connection, but this would be a stretch assignment.

---

## Turn 6: Attorney Research — Heather R Klein

**William:**
It was exploratory. I misunderstood, I thought we were saying that a bank could replace the attorney. Can you look up Heather R Klein as attorney and see if there is any online info about her capabilities?

**Claude:**
Clarified the three-layer financial architecture — the bank can't replace the attorney. The fiduciary attorney is the critical infrastructure partner (holds escrow, executes disbursements, mediates high-value transactions). The bank is just where Stripe payouts land.

Researched Heather R. Klein: licensed attorney in Sparta, NC, ~23 years practice, real estate closings and general practice. Minimal online presence. Real estate closing experience gives her baseline escrow/IOLTA/disbursement fundamentals, but the auction's complexity (multi-party cascading rewards, 52-painting settlement reconciliation, potential securities-adjacent questions on the reward mechanic) goes well beyond standard closing work.

Assessment: if William has a personal connection, a direct conversation about the specific auction requirements would quickly reveal whether she's comfortable with the scope. The alternative is seeking someone with commercial transaction or arts/entertainment law experience.

---

## Turn 9: AWS Hosting Research for Next.js Auction Platform

**William:**
Research AWS-based web hosting for a Next.js application with these characteristics: static gallery layer (52 painting pages from markdown at build time) + dynamic auction engine (serverless API, PostgreSQL, Stripe, auth). Low traffic, single 6-9 month auction then permanent static archive. Currently spec'd at $20-30/month on Vercel+Neon. Need thorough analysis covering: AWS services mapping, architecture options (Amplify vs S3+CF+Lambda vs others), Next.js on AWS specifics, cost analysis, deployment pipeline, image handling, database options, email/SMS, SSL/domain, post-auction archival, trade-offs vs Vercel, and free tier coverage. Use web searches for current pricing. Research only — no code.

**Claude:**
Comprehensive 12-dimension AWS hosting analysis delivered. Key findings:

**Services mapping:** Amplify replaces Vercel (managed Next.js hosting), RDS replaces Neon (managed Postgres), S3 replaces Vercel Blob (images), SES replaces Resend (email), SNS replaces Twilio (SMS but keep Twilio — 10DLC registration hassle not worth $0.30/month savings), CloudWatch replaces Sentry (but consider keeping Sentry free tier).

**Three architecture options analyzed:**
1. AWS Amplify (managed, Vercel-like DX, $1-4/month during auction)
2. OpenNext + SST (self-hosted, more control, same cost but higher complexity)
3. Lightsail/Fargate (rejected — overpriced and wrong pattern for this traffic)

**Cost comparison:** AWS Amplify at $1-4/month vs Vercel Pro at $22-25/month during active auction. Post-auction archive: $0.51/month on S3+CloudFront vs $0-20/month on Vercel. AWS saves ~$120-180 over 9-month auction.

**Critical insight on database:** Aurora Serverless v2 has a $44/month floor — rejected. RDS db.t4g.micro is free for 12 months (covers entire auction). But the smartest option may be hybrid: Amplify hosting + Neon database. Gets AWS's free hosting with Neon's permanent free-tier scale-to-zero database.

**Next.js compatibility:** Amplify supports App Router, SSG, SSR, time-based ISR, API routes, Server Actions, middleware. Missing: on-demand ISR — but irrelevant for FHOA since bid status is already client-side polled at 30-second intervals.

**Free tier strategy:** If AWS account opened before July 15, 2025, get legacy 12-month free tier. RDS free for entire auction period. Lambda, CloudFront, S3 are always-free at this traffic level.

**Post-auction archival:** `next build` with static export, upload to S3, CloudFront in front. Delete RDS. $0.51/month forever. This is AWS's strongest argument — you own the infrastructure and it costs pocket change.

**Recommendation:** AWS Amplify + Neon hybrid is the sweet spot. Amplify + RDS if you want pure-AWS. Vercel Pro + Neon if you value DX and are willing to pay $20/month for "just works."

---

## Turn 5: AWS Web Hosting Deep Dive

**William:**

I'd like us to reengineer the entire approach with the web hosting. please do a deep dive on AWS based web hosting. Aim to eliminate all vendor solutions that aren't AWS. Write up your learnings in a markdown file in the learn folder for this product. File name beginning with 02-

**Claude:**

Wrote comprehensive AWS hosting research to `company/production/auction-platform/learn/02-aws-web-hosting-research.md` (12 sections, ~300 lines).

Key findings:

**AWS Amplify replaces Vercel.** Managed Next.js hosting with git-triggered deploys, CloudFront CDN, Lambda for API routes, preview environments. Same developer experience, different vendor.

**Cost collapse: $20-30/mo → $1-4/mo.** AWS Free Tier covers the entire 9-month auction period (12-month window). RDS PostgreSQL free, Amplify hosting free, Lambda free, CloudFront 1TB/mo free. The only real costs are Route 53 ($0.50), SES ($0.30), and SNS ($1-4).

**Post-auction: $0.51/month forever.** Static export to S3 + CloudFront. Delete everything else. This is the strongest argument for AWS — Vercel's cheapest commercial option is $20/mo.

**Full service mapping:** Amplify (hosting), RDS PostgreSQL (database), S3 (images), SES (email), SNS (SMS), Route 53 (DNS), ACM (SSL), CloudWatch (monitoring).

**Stripe is the one exception.** AWS has no payment processing service. Stripe remains.

**Trade-offs:** More initial setup complexity (hours, not days). Amplify's Next.js support is strong but not Vercel-native. Build times ~2-3 min vs ~1 min. These are minor for FHOA's use case.

---

## Turn 7: Fiduciary Attorney Writeup — Heather R. Klein

**William:**
Yes please [add to the learn folder].

**Claude:**
Wrote `02-fiduciary-attorney-research-heather-klein.md` to the learn folder. The document covers:

- Why FHOA needs a fiduciary attorney (not a bank) — the three-layer financial architecture
- Heather Klein's profile: Sparta NC, ~23 years, real estate closings and general practice
- What real estate closing experience gives her: IOLTA trust accounts, escrow disbursement, wire transfers, contract review — the "hold money, verify conditions, release money" core mechanic transfers
- Where the auction diverges: multi-party disbursement at scale (20-50 payees vs 2-4), active ongoing escrow management during auction (not just hold-until-closing), custom contract drafting, cascading refund tempo, 1099 reporting, securities awareness
- Strengths: professional maturity, escrow fundamentals, NC bar credentials, likely more affordable than a Charlotte firm, geographic proximity
- Concerns: auction complexity exceeds closing complexity, no visible specialization in commercial/arts transactions, solo practitioner availability risk
- Recommended next steps: conversation topics, materials to share with her, parallel alternatives to evaluate, decision criteria table

Assessment: not a disqualifier, but needs a direct conversation to gauge comfort with the scope.

---

## Turn 6: Spec Simulation — AWS Build Readiness

**William:**

could you run a simulation on the development and deployment and determine if you have what you need in the spec?

**Claude:**

Read the full 1,288-line Phase 4 spec and simulated building + deploying on AWS. Found 13 gaps:

**Dangerous (3):**
- GAP 2: RDS has no built-in connection pooling for Lambda. Need RDS Proxy or app-level pooling. Neon handled this transparently.
- GAP 4: Vercel Cron Jobs (auction close trigger every 1min, notification processor every 30s) have no Amplify equivalent. Need EventBridge Scheduler + standalone Lambda.
- GAP 5: Rate limiting was "Vercel Edge Middleware." Need AWS WAF ($6/mo) or database-based counting.

**Must fix (7):**
- GAP 1: 32+ Vercel vendor references throughout the spec
- GAP 3: Image pipeline (Vercel Blob + Next.js Image on Vercel → S3 + pre-processed Sharp variants)
- GAP 6: Environment variables (SES/SNS use IAM, not API keys)
- GAP 7: Admin image upload endpoint references @vercel/blob SDK
- GAP 8: Email/SMS integration patterns differ (IAM vs API keys)
- GAP 11: Amplify build config (amplify.yml) missing
- GAP 9: Post-auction archival procedure (S3 static export) not specified

**Safe (2):** Generated columns work on RDS 12+. CloudFront cache respects same headers.

**Assessment:** Spec needs a v3 revision before AWS build can start. Asked William if he wants the rewrite now.

---

## Turn 7: Documenting the Gap Assessment

**William:**

This is an extensive assessment. Should we document the assessment itself? is the assessment in the 02-aws-web-hosting-research.md or should we have a 03-vercel-to-aws-gap-assessment? i want to make sure we go through all of these. the assessment itself looks like quality learning material about how to move from one platform like vercel to aws.

**Claude:**

Agreed — the research doc (02) answers "should we use AWS?" The gap assessment answers "what breaks when we try to build our spec on AWS?" Different artifacts, different purpose.

Created `03-vercel-to-aws-gap-assessment.md` with:
- Gap summary table (13 gaps: 3 dangerous, 7 must-fix, 2 safe, 1 missing)
- Detailed analysis of each gap (problem, options table, recommendation, spec impact)
- Migration checklist (20 items — the work order for spec v3)
- "Lessons: Moving from Vercel to AWS" section — 8 reusable patterns for any Next.js migration (connection pooling, cron, rate limiting, image optimization, IAM auth, SES sandbox timing, archival, Amplify capabilities)

William noted this is reusable learning material — structured it accordingly.

---

## Turn 8: Starting the Gap Walkthrough

**William:**

let's go through the gaps one by one. where do you want to start?

**Claude:**

Recommended starting with the 3 dangerous gaps first — they require decisions that affect the rest of the rewrite. GAP 2 (database connection pooling) is the most architectural.

Presented three options:
1. RDS Proxy — managed, $0 free tier (12 months), $11/mo after
2. Application-level pooling — $0 forever, more careful code needed
3. Keep Neon as exception — $0 permanent free tier, serverless driver handles pooling transparently, least spec rewriting

Framed the meta-question: does "eliminate all non-AWS vendors" mean zero exceptions, or "consolidate where sensible"? Stripe is already a necessary exception. Neon could be a pragmatic second one — permanent free tier, no pooling headache, less rewriting in §3.

---

## Turn 9: Connection Pooling Explained, Snowflake Question

**William:**

My strong preference is AWS. There's other reasons for AWS. They are a partner to phData and what i learn here using AWS can be applied to my current job. My question is .. what does database pooling mean? how is that different than saying 'we need a database'? My other question would be, could we use snowflake for the database?

**Claude:**

Confirmed full AWS, no exceptions.

**Connection pooling explained:** Used phone lines analogy. The database is an office with ~80 phone lines. A normal server opens 10 lines and reuses them all day. But Lambda functions are ephemeral — each one opens its own line. 20 simultaneous requests = 20 connections. If too many connect at once, the database rejects new calls. RDS Proxy sits between Lambda and the database like a receptionist — routes 20 Lambda calls through 10 pooled connections efficiently.

**Snowflake:** No — wrong tool. Snowflake is a data warehouse for analytics (scan billions of rows, run reports). An auction needs a transactional database (record one bid atomically, enforce uniqueness, sub-millisecond reads). PostgreSQL query: ~5ms. Snowflake query: ~200ms-2s. Snowflake could be useful *after* the auction for analyzing bidding patterns, but not as the live database.

Comparison table: PostgreSQL (single-row OLTP, ~5ms, ACID, $0 free tier) vs Snowflake (bulk analytics, ~200ms-2s, compute-based pricing, expensive for always-on).

Decision: RDS PostgreSQL + RDS Proxy.

---

## Turn 10: Snowflake Hybrid Tables Research

**William:**

Can you do some quick research on hybrid tables in snowflake? it's a new transactional database type table

**Claude:**

Researched Snowflake Hybrid Tables. They're real and GA (AWS Oct 2024, Azure Oct 2025). Dual-storage architecture (row-based OLTP + columnar analytics), sub-millisecond single-row latency, PK/unique/FK support, row-level locking. phData has published articles on them.

Three problems for FHOA:
1. **Cost:** Requires running warehouse. ~$50-100+/mo vs $0 RDS free tier. Pricing just changed March 2, 2026.
2. **Limitations:** No time-travel, no streams, no cloning, no materialized views, MERGE not optimized (our seed upserts), 2TB cap per database.
3. **Lambda connection overhead:** HTTP-based auth + warehouse resume (~200-500ms) vs PostgreSQL TCP (~50-100ms).

Where hybrid tables make sense: existing Snowflake shop wanting OLTP without managing separate Postgres. Where they don't: greenfield, budget-sensitive, 9-month lifespan. That's us.

Comparison table: RDS ($0→$13/mo, ~50ms cold start, decades of tooling) vs Snowflake Hybrid ($50-100+/mo, ~200-500ms cold start, GA since Oct 2024).

Verdict: RDS PostgreSQL confirmed. But useful knowledge for phData clients asking "can we do OLTP in Snowflake?"

---

## Turn 11: Confirming PostgreSQL, Pooling Re-explained

**William:**

yeah, that sounds like it makes sense. Let's go with it. Basically we're making a PostgreSQL database? What is the 'pooling'?

**Claude:**

Yes — a PostgreSQL database. RDS is AWS managing the server for you. You get a connection string, write SQL, done.

Pooling re-explained with ASCII diagram:
- Without pooling: 30 Lambdas = 30 connections. Database limit ~80. Can overflow.
- With RDS Proxy: 30 Lambdas → Proxy → 5-10 real connections. Proxy is invisible to your code — connection string points to proxy instead of database, SQL is identical.

Cost: RDS + RDS Proxy = $0 for 12 months (free tier). ~$24/mo after, but auction is over by then — delete both.

GAP 2 resolved: RDS PostgreSQL + RDS Proxy.

---

## Turn 12: GAP 4 — Cron Jobs (EventBridge)

**William:**

I may no longer qualify for the free tier. But $24 for the database for a few months is ok. What's next?

**Claude:**

Noted $24/mo is acceptable regardless of free tier status.

GAP 4: Two scheduled tasks — auction close trigger (every 1 min, most critical event in the system) and notification processor (every 1 min, sends outbid emails/SMS). Vercel Cron doesn't exist on Amplify.

Fix: Amazon EventBridge Scheduler. Same concept, different name. "$0 permanent free tier."

Decision needed: standalone Lambda vs inside Next.js?
- Recommended hybrid: standalone Lambda for auction close (too critical to depend on web app), inside Next.js for notification processor (shares template code, less critical)
- EventBridge minimum is 1 minute — notification delay worst case 60s instead of 30s, imperceptible

---

## Turn 13: Simplifying Cron and Notifications

**William:**

so many questions ...
do we really need to check every minute if the auction is closed? maybe once per day at max
Are we still talking Next.js? i thought that was vercel only.
notification processor. i don't know what this is doing. are these events low priority enough that once per minute is enough?

**Claude:**

Three answers:

**Auction close: once a day is fine.** The every-minute cron was over-engineered for an edge case (mid-payment at deadline). The grace window handles in-flight payments naturally. A daily check at midnight is sufficient. Maybe twice daily in the final week.

**Next.js is NOT Vercel-only.** Open-source MIT license. Made by Vercel but runs anywhere — Amplify, Cloudflare, Docker, your laptop. Like Android: made by Google, runs on Samsung. Core features we use (static generation, API routes, Image component) work on Amplify.

**Notification processor explained:** When someone gets outbid, a row is written to a queue table. A background process wakes up, finds unsent rows, sends emails/SMS. Prevents slow email services from blocking bid completion, enables batching.

**But then — simplification insight:** For FHOA's volume (a few bids per day), the background processor is over-engineered. Proposed sending notifications inline when the bid event happens. If SES is down, log failure, retry via daily sweep. This eliminates the notification processor entirely.

Revised: one daily cron (auction close check) + inline notifications with daily retry sweep. GAP 4 potentially downgraded from dangerous to trivial.

---

## Turn 14: Spec v3 Rewrite — AWS Migration

**William:**

yes. Please implement the revised understanding in documentation as you see fit

**Claude:**

Rewrote spec-v1-04 from v2 to v3 (AWS Migration). 15 sections touched, 20 checklist items completed. Key changes:

**Infrastructure swap (all sections):** Vercel→Amplify, Neon→RDS+RDS Proxy, Vercel Blob→S3, Resend→SES, Twilio→SNS, Sentry→CloudWatch, Vercel Cron→EventBridge.

**New sections:**
- §3.10: Connection management (RDS Proxy explanation)
- §9.6: Post-auction archival procedure (static export→S3→$0.51/mo)
- §9.7: Deployment prerequisites checklist (SES sandbox exit, domain verification, etc.)

**Simplifications beyond the AWS swap:**
- §8: Notifications sent inline (eliminated queue+processor pattern entirely — FHOA volume doesn't justify it)
- §9.5: Auction close check reduced from every minute to daily (EventBridge), with hourly in final week

**Cost table:** $2-5/mo (with free tier) or $26-30/mo (without). Post-auction archive: $0.51/mo.

**Image infrastructure:** S3 + Sharp pre-processing. 4 variants per painting (thumb, medium, full, OG) × 52 paintings = 364 files. ~$0.01/mo storage.

Updated gap assessment checklist: all 20 items ✓. Updated spec-progress: Phase 4 now shows "v3 — AWS."

---

## Turn 15: Commit and Push

**William:**

can you commit and push all changes?

**Claude:**

Staged all files (27 total), committed as `a720f22`: "SPR-012 close + SPR-013: AWS migration, Phase 4 spec v3". Pushed to main. 4,422 insertions.

---

## Turn 16: Sprint Close

**William:**

/sprint close

**Claude:**

Closed SPR-013. Session name: "AWS Migration and Spec v3."

**Summary:** Pivoted the entire infrastructure from Vercel/Neon/Resend/Twilio to AWS (Amplify/RDS/SES/SNS). Phase 4 spec rewritten v2→v3 (15 sections, 20 checklist items). Four research documents produced (Truist banking, AWS hosting, attorney evaluation, gap assessment). Three tasks closed: PROD-005 (tech stack), PROD-006 (Stripe), PROD-007 (AWS Amplify).

**Discoveries:**
1. William's questions as architecture improvements — "do we really need this?" consistently eliminated over-engineering (notification processor, every-minute cron, WAF)
2. AWS Free Tier covers entire auction period — cost story changes from "$20-30/mo ongoing" to "near-zero during, $0.51/mo forever after"
3. Snowflake Hybrid Tables — real OLTP capability but wrong fit for FHOA (cost, Lambda overhead, limitations)

**Key Decisions:** Full AWS no exceptions (phData partner, skills transfer), RDS+Proxy over Neon/Snowflake/Aurora, inline notifications over queue+processor, daily cron over every-minute, Sharp pre-processing over on-demand optimization, DB rate limiting over WAF.

**Next task:** PROD-004 — scaffold Next.js in make/, configure for Amplify, set up markdown content layer, render a static painting page locally.

---
