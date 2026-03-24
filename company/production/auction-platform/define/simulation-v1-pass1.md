# Simulation — Pass 1: Sprint-Level Validation

*Phase 5 — Spec-Driven Development*
*Date: 2026-03-24*
*Method: Walk through the spec as if planning development sprints. For each sprint, ask: "Does the agent know enough to start this sprint?"*

---

## Sprint Plan (12 sprints)

### Sprint 1: Project Scaffolding
**Goal:** Next.js project, database, auth providers, Stripe test mode, deployment pipeline.

**Can the agent start?** Yes.

The tech stack is fully specified (04 §2.1). Database schema is defined (04 §3). Auth providers are listed (04 §5.1). Deployment target is Vercel (04 §9). Environment variables are enumerated (04 §9.3).

**Gap:** ORM not chosen (Prisma vs Drizzle). Agent would need to pick.
**Classification:** Safe — either works, both integrate with Next.js and PostgreSQL. Agent defaults to Prisma (more documentation, larger ecosystem).

---

### Sprint 2: Painting Catalog & Gallery
**Goal:** Seed paintings into database, render gallery scroller, Image Pages, Series Pages.

**Can the agent start?** Yes, with one ambiguity.

Painting schema is complete (03b §2, 04 §3.1). Gallery scroller spec is detailed (03a §12). Image Page layout is fully specified (03a §6). Series Page is specified (03a §10). URL structure is defined (03a §2).

**Gap:** Image processing pipeline undefined. Spec requires 4 image sizes per painting (03b §2.1: thumbnail, primary, full, OG) but doesn't specify who/what creates them. Does the artist upload originals and a script generates variants? Is there a build-time processing step?
**Classification:** Safe — standard pattern. Agent uses Sharp or Cloudflare Image Resizing. Original uploaded, variants generated at build time or on first request.

**Gap:** Seed script format not defined beyond "JSON or CSV" (04 §13.1).
**Classification:** Safe — agent picks JSON, includes all fields from painting schema.

---

### Sprint 3: Registration & Auth
**Goal:** Google/Apple OAuth, email/password signup, registration completion form, email verification.

**Can the agent start?** Yes.

Auth strategy is specified (04 §5). Registration fields are defined (03b §4, 03a §14.1). Authorization rules are clear (04 §5.4).

**Gap:** Email verification mechanism not specified (magic link? verification code?).
**Classification:** Safe — agent defaults to magic link (standard NextAuth.js pattern).

**Gap:** Password reset flow not specified anywhere in the spec suite.
**Classification:** Safe — standard implementation, but notable omission. Agent builds it as a standard "forgot password" email flow.

---

### Sprint 4: Bid Placement (Core)
**Goal:** Tier button click → Stripe payment → bid confirmed → outbid cascade → real-time update.

**Can the agent start?** Yes, with one dangerous ambiguity.

Bid flow is detailed (03a §14.2, §14.3). API contract is complete (04 §4.2 POST /api/bids). Stripe integration is specified (04 §6). Race condition handling is specified (03b §5.4, §5.5, 04 §3.4 unique indexes). Outbid cascade is defined (03b §5.2, 04 §4.4 webhook handler).

**DANGEROUS GAP: Sales tax handling.** The bid amount is the tier price (e.g., $3,456 for Tier 1 on a 3,456 sq.in. painting). But 03b §12.3 says "Sales tax applies per the buyer's state (Wayfair)" and 04 mentions "TaxJar/Avalara" as a Phase 4 decision — but no decision was made. The spec does not answer:
- Is the Stripe charge `tier_price` or `tier_price + sales_tax`?
- If tax is added, the bidder pays more than the displayed price — does the tier button show "$3,456" or "$3,456 + tax"?
- If tax is included in the tier price, the artist receives less than tier_price after tax remittance.
- At what point is tax calculated — bid placement or settlement?

An agent building the payment flow must decide this. A wrong guess creates financial and legal issues.

**Gap:** Grace window implementation. 03b §13.3 says bids initiated before close_at get a 5-minute payment window. The API needs to distinguish "auction is closed" from "auction is within grace period for in-flight bids." The logic isn't spelled out in the API contract.
**Classification:** Safe — the rule is clear (created before deadline = accepted if payment confirms within 5 min), implementation is straightforward (check `created_at < close_at` and `now() < close_at + 5min`).

---

### Sprint 5: Real-Time Updates
**Goal:** WebSocket connections, bid status broadcasts, WTA price updates, auction stats.

**Can the agent start?** Yes.

Requirements are clear (04 §7.1). Channel structure is defined (04 §7.3). Reconnection behavior is specified (04 §7.4).

**Gap:** Choice between Supabase Realtime and Ably (TECH-04) is deferred.
**Classification:** Safe — both are specified, agent picks one. If using Supabase for DB, Realtime is the natural choice.

---

### Sprint 6: Bidder Dashboard
**Goal:** Active bids, outbid history, auction status, notification preferences.

**Can the agent start?** Yes.

Dashboard layout is specified (03a §11). API contract is defined (04 §4.2 GET /api/dashboard). Post-auction states are covered (03a §11.2). Notification toggle is specified (03a §11.1 Section 4).

No gaps found. The dashboard is fully specified.

---

### Sprint 7: Notifications
**Goal:** Email, SMS, push delivery for all 12 event types.

**Can the agent start?** Yes.

Event catalog is defined (03b §10.1). Templates are specified (03a §15). Channel routing rules are clear (03b §10.2). Timing constraints are stated (03b §10.3). Deduplication rules are defined (03b §10.4, 04 §3.8).

**Gap:** Background processor choice not decided (Vercel Cron vs Supabase Edge Function vs Inngest).
**Classification:** Safe — all three work. Agent picks Vercel Cron for simplicity (no additional service).

**Gap:** HTML email templates must be created from prose templates in 03a §15. The spec gives content and framing but not visual design.
**Classification:** Safe — agent builds simple, clean HTML templates matching the site's visual language (03a §3.4).

---

### Sprint 8: WTA Flow
**Goal:** WTA page real-time price, Arrange Purchase button, admin endpoint for recording WTA bid.

**Can the agent start?** Yes, with one gap.

WTA page is specified (03a §7). WTA price calculation is defined (03b §7.2). WTA trigger sequence is specified (03b §7.3). Admin endpoint exists (04 §4.3 POST /api/admin/wta).

**Gap:** Admin endpoint for lawyer-mediated individual bids. 04 §6.5 mentions `POST /api/admin/bids` but this endpoint is not defined in the API contracts (04 §4). The agent doesn't know the request/response format for recording an above-threshold individual bid via admin.
**Classification:** Dangerous — above-threshold bids are a core flow for Champions (P-02) and Connoisseurs (P-03) on large paintings. An agent guessing the admin bid endpoint might miss required fields (escrow reference, contract reference) or handle the outbid cascade incorrectly for admin-entered bids.

---

### Sprint 9: Auction Lifecycle
**Goal:** Launch gate (HC-04), close evaluation, settlement, failure refunds.

**Can the agent start?** Mostly, with one dangerous gap.

Launch is an admin action (04 §4.3 POST /api/admin/auction/launch). Threshold evaluation logic is clear (03b §8.3). Settlement sequence is defined (03b §8.4). Failure handling is specified (03b §8.4, auction-mechanism.md §8.5).

**DANGEROUS GAP: Auction close trigger mechanism.** The spec says evaluation happens "at the moment the auction close datetime is reached" (03b §8.3) and there's an admin manual trigger (04 §4.3 POST /api/admin/auction/evaluate). But the automated trigger isn't specified. Options:
- A cron job that runs at midnight ET on Dec 31
- A cron job that runs every minute and checks if close_at has passed
- A scheduled function set at deploy time

An agent who picks a client-side trigger or a daily cron could miss the exact close moment. The spec should specify the mechanism.

**Gap:** Settlement disbursement is partially deferred (TECH-05). The system calculates amounts, but how are they delivered to bidders? Automated Stripe transfers? Manual by fiduciary?
**Classification:** Safe (for the building sprint) — the agent can build the calculation and present results in an admin interface. The actual money movement is the fiduciary's responsibility.

---

### Sprint 10: Post-Auction Archive
**Goal:** Transition site from active auction to permanent gallery.

**Can the agent start?** Yes.

Post-auction states are specified for every page (03a §4.3, §6.2, §7.3, §11.2). The archive state is defined (03b §8.2). The site becomes read-only with frozen data.

No gaps. The agent checks `auction.status` and renders the appropriate state per page.

---

### Sprint 11: Admin Tools
**Goal:** Content management, auction operations, monitoring.

**Can the agent start?** With notable gaps.

Admin API endpoints exist (04 §4.3) but are minimal. There is no admin UI specification anywhere in the suite.

**Gap:** No admin frontend specified. The artist needs to: update painting narratives, add video URLs, view bid activity, trigger auction launch, record WTA bids, view settlement calculations. Is this a dedicated admin panel? A headless CMS? Direct API calls?
**Classification:** Safe — the agent builds a simple admin page at `/admin` with forms for each operation. But the scope is undefined — the agent might over- or under-build.

---

### Sprint 12: Polish & Launch Prep
**Goal:** SEO, OG tags, accessibility, performance, final testing.

**Can the agent start?** Yes.

OG tags are fully specified per page (03a §16). Accessibility requirements are stated (03a §18). Performance targets are defined (03a §19). Touch targets are specified (03a §17.3).

No gaps. These are well-specified quality requirements with clear acceptance criteria.

---

## Pass 1 Summary

| Sprint | Can Start? | Gaps |
|---|---|---|
| 1. Scaffolding | ✅ Yes | 1 safe (ORM choice) |
| 2. Painting Catalog | ✅ Yes | 2 safe (image pipeline, seed format) |
| 3. Registration | ✅ Yes | 2 safe (email verification, password reset) |
| 4. Bid Placement | ⚠️ With caution | 1 **dangerous** (sales tax), 1 safe (grace window) |
| 5. Real-Time | ✅ Yes | 1 safe (realtime provider choice) |
| 6. Dashboard | ✅ Yes | 0 gaps |
| 7. Notifications | ✅ Yes | 2 safe (processor choice, HTML templates) |
| 8. WTA Flow | ⚠️ With caution | 1 **dangerous** (admin bid endpoint undefined) |
| 9. Auction Lifecycle | ⚠️ With caution | 1 **dangerous** (close trigger mechanism), 1 safe (disbursement) |
| 10. Archive | ✅ Yes | 0 gaps |
| 11. Admin Tools | ✅ Yes | 1 safe (admin UI scope) |
| 12. Polish | ✅ Yes | 0 gaps |

**Dangerous gaps: 3**
**Safe gaps: 11**
