# AWS Migration and Phase 4 Spec v3

**Sprint:** SPR-013
**Date:** 2026-03-26
**Project:** Fine Higher Ordered Art

---

## Starting Point

The Phase 4 technical architecture (v2) was complete and simulation-validated, but built entirely on Vercel + Neon + Resend + Twilio. William discovered the $20/month Vercel hosting cost and questioned why a paid platform was assumed. The build phase (PROD-004) was next, but the infrastructure foundation needed to be re-examined before any code was written. The tech stack (PROD-005) and hosting platform (PROD-007) were still formally open decisions, and the payment processor (PROD-006) had been assumed but never explicitly closed.

## Summary

This sprint pivoted the entire infrastructure stack from Vercel-ecosystem to AWS. What started as William questioning a $20/month Vercel bill became a full re-architecture: deep research into AWS services, a 13-gap simulation assessment of the spec against AWS, and a complete rewrite of the Phase 4 spec from v2 to v3.

The sprint also included substantial research work outside the AWS pivot: a Truist Financial banking services analysis (written to the learn folder), a fiduciary attorney evaluation for Heather R. Klein, and a Snowflake Hybrid Tables investigation prompted by William's awareness of the feature through his work at phData. The Truist research clarified the three-layer financial architecture (Stripe → fiduciary attorney → operating bank), establishing that the bank is the least consequential choice.

The spec v3 rewrite touched 15 sections and resolved all 20 migration checklist items. Beyond the AWS swap, two significant simplifications emerged from William's questions: the notification processor was eliminated entirely (inline sending replaces the queue-and-process pattern), and the auction close cron was reduced from every-minute to daily. Both simplifications were driven by William asking "do we really need this?" — a recurring pattern that consistently improves the architecture.

## Discoveries

### Discovery 1: William's Questions as Architecture Improvements

Throughout the gap walkthrough, William's non-technical questions consistently exposed over-engineering. "Do we really need to check every minute?" eliminated the every-minute cron. "What is the notification processor doing?" led to eliminating the entire queue-and-process pattern. These weren't corrections — they were a non-engineer's fresh perspective cutting through engineering defaults that had been imported from high-scale system patterns into a small art auction.

**Consequence:** Two significant simplifications to the spec that reduce both code complexity and operational surface area. The pattern is now recognized: William's instinct to question complexity is a reliable architecture improvement mechanism, not resistance to be overcome.

### Discovery 2: AWS Free Tier Covers the Entire Auction

The AWS Free Tier's 12-month window exceeds the auction's 6-9 month active period. If the AWS account qualifies, the entire auction runs at $2-5/month (Route 53 + SES + SNS only). Even without the free tier, the cost is $26-30/month — comparable to the old Vercel+Neon stack but with a clear path to $0.51/month static archive post-auction.

**Consequence:** The infrastructure cost story changes from "$20-30/month ongoing with uncertain post-auction options" to "near-zero during auction, $0.51/month forever after." This removes hosting cost as a factor in the business decision of whether to run the auction.

### Discovery 3: Snowflake Hybrid Tables — Real but Wrong Fit

William asked about Snowflake Hybrid Tables based on his phData experience. Research confirmed they're GA with genuine OLTP capability (sub-ms latency, row-level locking, PK/FK support). But three factors disqualify them for FHOA: cost ($50-100+/mo minimum warehouse), Lambda connection overhead (~200-500ms auth + warehouse resume), and limitations that hit our specific patterns (MERGE not optimized for our seed upserts). The knowledge is valuable for phData client conversations about "can we do OLTP in Snowflake?" — just not applicable here.

**Consequence:** RDS PostgreSQL confirmed with full confidence. The Snowflake investigation wasn't wasted — it validated the choice and gave William transferable knowledge for his day job.

## What Changed

### Files Created
| File | What it is |
|---|---|
| `company/production/auction-platform/learn/01-truist-banking-services-research.md` | Deep dive on Truist Financial — business banking, trust/escrow, merchant services, reputation |
| `company/production/auction-platform/learn/02-aws-web-hosting-research.md` | AWS hosting analysis — services mapping, architecture options, cost analysis, free tier strategy |
| `company/production/auction-platform/learn/02-fiduciary-attorney-research-heather-klein.md` | Attorney evaluation for fiduciary/escrow role — credentials, practice areas, fit assessment |
| `company/production/auction-platform/learn/03-vercel-to-aws-gap-assessment.md` | Simulation of spec against AWS — 13 gaps identified, all resolved, migration checklist, reusable lessons |
| `system/log/2026-03-26.md` | Reasoning log for this sprint |
| `system/transcripts/2026-03-26-2121-aws-migration-and-spec-v3.md` | Curated conversation transcript |
| `system/transcripts/raw/2026-03-26-*.jsonl` | Raw session transcripts (auto-captured) |

### Files Modified
| File | What changed |
|---|---|
| `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` | v2 → v3: full AWS migration (15 sections rewritten) + notification simplification + cron simplification |
| `company/production/auction-platform/define/spec-progress.md` | Phase 4 updated to show v3 (AWS) |
| `TASKS.md` | Closed PROD-005, PROD-006, PROD-007 |
| `system/sprints/sprint-log.md` | Added SPR-013 row |
| `system/log/completed-tasks.csv` | Archived 3 completed tasks |
| `system/memory/*.md` | Memory snapshot updated |
| `system/config/claude/settings.json` | Config snapshot updated |

## Key Decisions

1. **Full AWS, no exceptions (except Stripe).** William's preference was driven by phData being an AWS partner and skills transferring to his day job. Neon was a pragmatic alternative (permanent free tier, less rewriting), but the learning value of pure AWS outweighed the cost savings.

2. **RDS PostgreSQL + RDS Proxy over alternatives.** Snowflake Hybrid Tables rejected on cost ($50-100+/mo) and Lambda connection overhead. Neon rejected per the full-AWS decision. Aurora Serverless rejected ($44/mo floor). Application-level pooling rejected in favor of the managed RDS Proxy solution.

3. **Inline notification sending, no background processor.** For FHOA's volume (a few bids per day), the queue-and-process pattern adds code complexity and an EventBridge schedule for no user-perceptible benefit. Notifications are sent synchronously when bid events occur. A daily sweep catches any failed sends.

4. **Daily auction close check, not every-minute.** The auction closes on a known date. A daily cron at midnight is sufficient. The 5-minute grace window handles in-flight payments. Hourly in the final week as a courtesy.

5. **Pre-processed images with Sharp, not on-demand optimization.** For a fixed catalog of 52 paintings, pre-generating 4 variants each (208 files) at build time is simpler and more predictable than Lambda@Edge on-demand resizing.

6. **Database-based rate limiting, not AWS WAF.** WAF adds $6/month for a threat model that doesn't justify it (small art auction, not a financial platform). Database counting in middleware is free and sufficient. WAF documented as an upgrade path if abuse is observed.

## What This Proves

This sprint validates the spec-driven development thesis in a way that's hard to appreciate without context. The Phase 4 spec was written for one infrastructure stack. When the business owner (correctly) questioned the assumptions, the entire stack changed — but the spec absorbed the change cleanly. Every gap was identifiable by reading the spec against the new platform. Every fix was locatable by section number. The 20-item migration checklist was completed in a single pass.

This is what specs are for: they make pivots survivable. If this had been code instead of a spec, the AWS migration would have been a rewrite. Because it was a specification, it was a revision.

The session also demonstrates the value of William's non-technical perspective in architecture decisions. Three of the five key decisions (inline notifications, daily cron, skip WAF) came from William questioning complexity, not from technical analysis. The spec is simpler and cheaper because the business owner asked "do we really need this?"

## Open Questions

1. **AWS Free Tier eligibility.** William may not qualify. Total cost without free tier is ~$26-30/month — acceptable, but worth confirming before build.
2. **TECH-06: Infrastructure as Code.** Should AWS resources be defined in CDK/CloudFormation/Terraform, or manually provisioned? Matters for reproducibility and teardown. Added to spec §15.
3. **SES sandbox exit timing.** Must request production access before testing email notifications. Takes 24-48 hours. Should be done early in the build phase.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `company/production/auction-platform/define/spec-v1-04-technical-architecture.md` (v3 — AWS)
3. `company/production/auction-platform/define/spec-progress.md`
4. `company/production/auction-platform/learn/03-vercel-to-aws-gap-assessment.md`
5. `company/production/auction-platform/learn/02-aws-web-hosting-research.md`

**Next task:** Begin build — PROD-004: Project scaffolding. Scaffold a Next.js project in `company/production/auction-platform/make/`, configure for Amplify deployment, set up the content layer (markdown parsing with sample painting), and get a single static painting page rendering locally.
