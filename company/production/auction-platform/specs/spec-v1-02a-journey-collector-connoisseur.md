# User Journey: The Collector & The Connoisseur

*Specification v1-02a: Art buyer journey — accessible through serious commitment*
*Personas: P-04 (Collector), P-03 (Connoisseur)*
*Status: Draft — most decision points resolved*
*Date: 2026-03-15*

---

## 1. Why One Document

The Collector and Connoisseur share the same journey structure: discover → browse → connect with a painting → bid → wait → win (or get outbid) → receive. The difference is economic gravity — the Collector is buying a $16–$1,500 painting with relatively low friction, while the Connoisseur is committing $3,000–$35,000 and needs substantially more trust before paying. This document traces the shared journey and calls out where the two personas diverge.

---

## 2. Discovery

### How They Arrive

The artist does not self-promote. Discovery is driven by:

1. **Press coverage** — a Journalist (P-08) writes about the novel auction mechanic. The article links to `fhoa.org`. The reader arrives knowing the concept but having never seen the paintings.
2. **Auction house promotion** — if/when a fiduciary partner with marketing capability is selected, they drive traffic through their existing collector network and channels.
3. **Social sharing** — a Spectator (P-07) or Patron (P-05) shares a painting page link or the WTA counter on social media. The reader arrives at a specific painting or the homepage.
4. **Word of mouth** — someone who knows the artist or the auction tells a friend. The friend searches "Fine Higher Ordered Art" or goes directly to `fhoa.org`.

### What They See First

**From an article link (most common):** Lands on the homepage at `fhoa.org`. Already has context about the auction concept. Wants to see the paintings.

**From a shared painting link:** Lands directly on a painting detail page (Image Page). Has no context about the auction — the page must be self-contained enough to orient them, with clear navigation to the broader site.

**From a search:** Lands on homepage. May have minimal context ("my friend said something about an art auction").

---

## 3. The Homepage

### Title Treatment

The site title is displayed as **Fine<sup>Higher Ordered</sup> Art** — "Higher Ordered" rendered as a mathematical exponent. This signals the intersection of abstract thinking and artistic expression that defines the collection.

### Layout (top to bottom)

1. **Gallery Scroller** — a horizontal carousel of painting images at the top of the page. Left/right arrows to browse. Each image is clickable and links directly to that painting's Image Page. This is the first thing visitors see — the art leads, not text.

2. **"The Charlotte Collection"** — prominent branding section beneath the scroller. Establishes this as a curated, named collection with a story. Brief introduction to the artist and the auction concept.

3. **Art Auction section** — auction statistics and status: percentage of threshold reached, number of bidders, total square inches bid on, days remaining, and other creative data visualizations. Clear call to action linking to the **Art Auction Page** for the full auction explanation, rules, and bidding interface.

4. **Winner Takes All section** — the current WTA price, what the Magnate receives, and the drama of the number updating in real time. Clear call to action linking to the **Winner Takes All Page** for the full WTA explanation.

### First Impression Requirements

The homepage accomplishes three things in the first 10 seconds:

1. **Show the art.** The gallery scroller dominates the top of the page. High-quality images. The paintings sell themselves.
2. **Establish legitimacy.** Professional photography, clean design, real artist name. "The Charlotte Collection" branding conveys curation, not a garage sale.
3. **Create intrigue.** The auction statistics and WTA counter surface the novel mechanism without requiring the visitor to read an explanation. Numbers that update in real time create urgency and fascination.

---

## 4. Site Structure and Navigation

### Global Navigation

Present on every page:

- **Home** — returns to homepage
- **Art Auction** — auction rules, status, bidding interface
- **Winner Takes All** — WTA explanation and current price
- **How Bidding Works** — auction terms and mechanism explanation
- **Place Bid** — direct entry to the bidding flow (painting selection → tier → payment)

### Page Hierarchy

```
Homepage
├── Art Auction Page (rules, status, gallery scroller, bidding entry)
├── Winner Takes All Page (WTA explanation, price, gallery scroller at bottom)
├── Image Page (per painting — detail, story, bid buttons)
│   └── Theme Series Page (e.g., The Grief Series — group view + narrative)
└── How Bidding Works (terms, mechanism, FAQ)
```

### Navigation Flow

**Gallery Scroller → Image Page → Theme Series Page → Home**

The gallery scroller appears on three pages: homepage, Art Auction page, and bottom of WTA page. It is the primary browsing mechanism — not a separate gallery page. Clicking any painting in the scroller navigates to that painting's Image Page.

From an Image Page, if the painting belongs to a themed series (e.g., Grief Series), a link connects to the Theme Series Page showing all paintings in the series with the series narrative. From there, navigation returns home or to any individual painting.

---

## 5. Browsing the Gallery

### The Gallery Scroller

The gallery scroller is a horizontal carousel component displaying all 52 paintings. It appears in three locations:

- **Homepage** — top of page, first thing visitors see
- **Art Auction page** — integrated with auction rules and status
- **Winner Takes All page** — bottom of page, after WTA explanation

Each painting in the scroller shows:
- Painting image (high quality, appropriately sized)
- Title
- Current bid status: **Open** / **Tier 1** / **Tier 2** / **Tier 3**

Clicking a painting navigates to its Image Page.

### The Grief Series

The six Grief paintings (Anger, Denial, Bargaining, Depression, Acceptance, Joy) have their own Theme Series Page with the series narrative prominently featured. Individual Grief painting Image Pages link to the Theme Series Page. The series is a narrative element — no structural auction rule binds them — but the story is a selling point. A collector who values the narrative may choose to bid on multiple Grief paintings.

---

## 6. Image Page (Painting Detail)

The visitor clicks on a painting in the scroller. This is the core product page — where browsing converts to desire, and desire converts to bidding.

### Content

- **High-resolution image(s)** of the painting — multiple angles or detail crops
- **Scale diagram:** inset showing the painting's size next to an average 6' tall person
- **Dimensions** in both US (inches/feet) and metric (centimeters)
- **Written narrative** about the painting — the story, the emotion, the context
- **Video content:** the artist and/or others discussing the piece
- **Current bid status:** Open / Tier 1 Held / Tier 2 Held / Tier 3 Held
- **Bidder display:** public name if the bidder opted for public visibility, otherwise "Private Bidder"
- **Tier bid buttons** (see §7 below)
- **"How Bidding Works" link** — contextual link near the bid buttons, in addition to global nav
- **Estimated shipping cost** by size category (once research is complete)
- **Theme series link** — if the painting belongs to a series (e.g., "Part of The Grief Series →")

### What the Collector Sees

At Tier 1, a small painting might cost $16. The Collector is reacting emotionally to the painting and checking whether the price is comfortable. The detail page needs to be beautiful and immersive — the painting dominates, the story draws them in, the price is clear but not the centerpiece. Low friction to bid.

### What the Connoisseur Sees

At Tier 2, a large painting might cost $8,640. The Connoisseur needs everything the Collector needs plus:
- Confidence in the artist's legitimacy (bio, exhibition history, body of work)
- Confidence in the transaction (escrow details, fiduciary identity, terms link)
- Confidence in what they're receiving (certificate of authenticity mention, shipping logistics)

The detail page serves both without cluttering the Collector's experience. Progressive disclosure: the immersive experience is default, the due-diligence details are accessible but not forced. The "How Bidding Works" link near the bid buttons gives the Connoisseur the deep dive they need; the Collector can ignore it.

---

## 7. The Decision to Bid

### Tier Buttons

Each Image Page displays three tier buttons:

```
[ Tier 1  $144 ]    [ Tier 2  $1,440 ]    [ Tier 3  $14,400 ]
    (active)            (grayed out)           (grayed out)
```

All three tiers are always visible with their prices, but **only the lowest available tier is clickable.** Higher tiers are grayed out / inactive. This communicates the full price spectrum while enforcing sequential tier progression (see `auction-mechanism.md` §4.5).

Once a tier has been bid, it shows as held and the next tier becomes active:

```
[ Tier 1  $144 ]    [ Tier 2  $1,440 ]    [ Tier 3  $14,400 ]
   (Tier 1 held)        (active)              (grayed out)
```

A buyer who wants to reach a higher tier must bid sequentially — Tier 1 first, then Tier 2 after their Tier 1 is placed (outbidding themselves or being outbid by someone else), then Tier 3. Each self-outbid earns the buyer their own outbid reward at settlement.

### The Collector's Moment

The Collector has found a painting they love. The price is accessible. They click the active tier button. Low friction — comparable to quality e-commerce.

### The Connoisseur's Moment

The Connoisseur has found a painting they believe in. The price is significant. Their decision process may span multiple visits:
- They may leave and come back
- They may read the terms page completely
- They may research the artist outside the site
- They may contact the auction house with questions (if a partner with inquiry capability is selected)

### Pre-Bid Inquiry

If an auction house is managing the auction, they may provide agents available for inquiries from serious prospective bidders. A contact form on the site routes inquiries to the auction house (not the artist). The artist stays aloof. If the fiduciary is an escrow company or attorney without inquiry capability, a comprehensive FAQ and terms page must serve this need instead.

> **Open — J02a-04:** Pre-bid inquiry capability depends on fiduciary/auction house selection. Resolve after AM-OQ-02.

---

## 8. Registration

The visitor clicks the active bid button on a painting. They hit the registration gate.

### Registration Requirements (per FR-3)

Bidders must register with verified contact information before participating:

- **Full legal name** — required for settlement, certificates of authenticity, potential 1099s
- **Email address** — verified via confirmation link. Primary communication channel.
- **Phone number** — for transaction-critical communications (outbid notifications, settlement)
- **Mailing address** — for shipping and tax purposes (state determines sales tax)

### Login Options

- **Google or Apple sign-in** — lower friction, familiar to most users
- **Email/password account creation** — standard, no third-party dependency

Both options collect the same required information (legal name, phone, mailing address) after initial authentication.

### Registration UX

- Registration should be fast — minimal fields, no unnecessary steps
- After registration, redirect back to the painting they were viewing (don't dump them on a dashboard)
- Account creation enables: bidding, bid tracking, notification preferences
- **Payment is not collected at registration** — it is collected at the moment of bidding (see §9)

### Returning Users

Registered bidders log in and can bid immediately. The site remembers their context (last viewed painting, active bids).

---

## 9. Placing a Bid

The registered bidder is on an Image Page. They've decided. They click the active tier button.

### Bid Flow

**Step 1: Confirm painting and tier.** Summary screen: painting title, image thumbnail, tier, exact dollar amount. "You are committing to purchase this painting."

**Step 2: Review terms (first bid only).** Before their first bid, the bidder must acknowledge the auction terms. Key points surfaced in the review:
- This bid is a **paid, irrevocable commitment** to purchase this painting
- Payment is charged immediately and held in third-party escrow
- If outbid, you receive a full refund immediately and may receive a reward at settlement
- If you win, you own the painting after settlement — shipping is your responsibility and cost
- All sales are final

This acknowledgment happens once (first bid). Subsequent bids on other paintings don't re-trigger it, but the terms are always accessible.

**Step 3: Enter payment.** Credit card or other accepted method. Payment is processed immediately into escrow.

> **Open — J02a-08:** Wire transfer threshold and accepted payment methods depend on fiduciary partner and payment processor. Deferred to AM-OQ-02/AM-OQ-03.

**Step 4: Confirm and pay.** Final confirmation screen showing: painting title, tier, exact amount, escrow destination, terms acknowledgment. One click to confirm.

**Step 5: Payment processing.** Real-time status: "Processing payment..." → "Payment confirmed" → "Bid placed!"

If payment fails: clear error message, option to retry or use a different payment method. The painting remains available — no hold is placed until payment succeeds.

### Real-Time Contention (per auction-mechanism.md §4.6)

First come, first served. If another bidder is currently in the payment process for the same painting and tier, the Image Page shows: **"Bid in progress — another bidder is completing payment for this tier."** The visitor can wait (the in-progress bid may fail) or return later.

This status must update in real time. A bidder should never complete a payment only to be told someone else got there first.

---

## 10. After Bidding — The Wait

The bidder has placed their bid. Payment is in escrow. Now they wait — potentially months — for the auction to close on December 31, 2026.

### Bidder Dashboard

After placing a bid, the bidder has a personal dashboard showing:

- **Active bids:** painting thumbnail, title, tier, amount, bid date
- **Bid status:** Active / Outbid (refunded) / Won / Auction Failed
- **Outbid rewards:** if applicable — "You were outbid on [painting]. Your refund of $[X] has been processed. If the auction succeeds, you'll receive a reward at settlement as a thank-you from the artist for being an early supporter."
- **Auction status:** days remaining, aggregate progress toward threshold (percentage and absolute: "72% — $72,000 of $100,000"), number of paintings with bids

### Notifications

**Channels:** Email (primary) + optional SMS + optional push notifications (browser/mobile). Bidder configures preferences at registration or in dashboard settings.

### Notification Events

| Event | Channel | Content |
|---|---|---|
| Bid confirmed | Email | Painting, tier, amount, escrow confirmation |
| Outbid | Email + SMS + push (per preferences) | Painting, new tier, refund processed, reward at settlement |
| Auction milestone | Email | Aggregate threshold progress, notable bid activity |
| Auction closing soon | Email + SMS | 7 days, 24 hours, 1 hour warnings |
| Auction result | Email | Success (your painting ships!) or failure (refund processed) |
| Settlement complete | Email | Reward payment sent (if applicable), shipping instructions (if winner) |

---

## 11. Getting Outbid

A higher-tier bid is placed on the Collector's or Connoisseur's painting. The outbid flow triggers.

### Immediate Actions (automated)

1. **Refund** the outbid bidder's full payment from escrow. Immediate.
2. **Notify** via configured channels:
   - "You've been outbid on [Painting Title]"
   - "Your full payment of $[X] has been refunded to [payment method]"
   - "If the auction succeeds on December 31, you'll receive a reward at settlement — a thank-you from the artist for being an early supporter of this painting"
   - Options: "Bid again at the next tier" (link to painting) / "Browse other paintings" (link to gallery scroller)

### The Critical Framing

This notification is the single most important piece of copy in the entire product. It must:

- **Lead with the painting**, not the money — "You've been outbid on *Acceptance*"
- **Acknowledge the loss** — they wanted this painting and someone else committed more
- **Explain the refund** — their money is coming back, full, now
- **Frame the reward as gratitude** — "a thank-you from the artist for being an early supporter" — not as a return on investment
- **Offer a next action** — bid at the next tier on the same painting, or find another one

What it must NOT do:
- Show ROI percentages or spread calculations
- Use investment language ("your return," "your earnings," "profit")
- Lead with the reward amount
- Suggest that getting outbid was a desirable outcome

### Collector vs. Connoisseur Divergence

**The Collector** ($16–$1,500 outbid): Mild disappointment, pleasant surprise at the reward. May browse for another painting. The outbid notification should emphasize "lots of paintings still available."

**The Connoisseur** ($3,000–$35,000 outbid): Significant emotional event. They chose this painting deliberately. The reward is substantial (potentially thousands of dollars), which softens the blow, but they may want to rebid at the next tier. The outbid notification should emphasize the option to bid again — "You can still win this painting at Tier [X]."

### Rebidding

Per auction-mechanism.md §4.7, a person who was outbid may bid again on the same painting at the next available tier. A Tier 1 bidder outbid by Tier 2 may bid Tier 3. They earn the Tier 1→2 outbid reward AND win the painting. The bid flow for rebidding is the same as the initial bid flow (§9), with the previous outbid reward claim preserved.

---

## 12. Winning

The auction closes on December 31, 2026. Thresholds are met. The bidder's painting is theirs.

### Notification

Email: "Congratulations — you've won [Painting Title]!"
- Settlement summary: what you paid, what the artist receives, any outbid rewards being distributed for this painting
- Certificate of authenticity: digital version attached (PDF)
- Shipping instructions: options for pickup or buyer-arranged shipping
- Timeline: when to expect the painting to be available for collection

### Shipping

Shipping is not included in the bid price. The platform offers art-safe shipping boxes at an added charge, researched with FedEx and UPS for quality and pricing by painting size. Options:

1. **Local pickup** from the artist's Charlotte, NC location — no additional cost
2. **Platform-facilitated shipping** — art-safe shipping boxes (rigid packaging, acid-free wrapping, insured per HC-07) offered through the site at an added charge. Buyer selects their painting's shipping option and pays during settlement.

> **Open — J02a-11:** Research FedEx and UPS art-safe shipping box options and pricing by painting size. Needed for buyer guidance on Image Pages and settlement shipping selection.

### Certificate of Authenticity (per FR-6)

Each sold painting includes a hand-signed physical certificate of authenticity created by the artist. Shipped with (or inside) the painting packaging. A digital version (PDF) is also provided at settlement for immediate confirmation.

The certificate includes:
- Painting title
- Dimensions and medium
- Date created
- Artist's name and signature (hand-signed on physical)
- Unique identifier / catalog number
- Statement that this is an original work by William Ryan Aubrey
- Note that sale transfers physical ownership only — IP rights retained per HC-01

---

## 13. Auction Failure

December 31 arrives. The aggregate threshold is not met. The auction is cancelled.

### Notification

Email: "The Charlotte Collection auction has ended"
- Acknowledge the outcome honestly — the threshold was not met
- Confirm full refund of escrowed payment — already processing
- No rewards are paid (no outbid rewards, no settlement)
- Thank them for participating
- Explain what happens next: the paintings remain with the artist, the website transitions to a permanent gallery

### Emotional Register

This is a real loss for the bidder — they wanted a painting and the market didn't show up. The communication should be:
- Honest (not euphemistic)
- Grateful (they did bid, they did participate)
- Clear on money (refund timeline, no ambiguity)
- Brief (not a long letter — they don't want to read a lot right now)

The Connoisseur who bid $8,640 is having a different day than the Collector who bid $16. But the communication is the same — the difference is felt, not written.

---

## 14. Post-Auction: The Gallery Endures

Per auction-mechanism.md §8.7, the website transitions from an active auction platform to a **permanent online gallery**. Sold paintings are marked with their winning tier (and buyer name if they chose public visibility). Unsold paintings remain displayed. The Grief Series narrative lives on.

For the Collector and Connoisseur, the post-auction gallery is provenance. Their painting's page becomes a permanent public record: "Sold at Tier 2 during the Charlotte Collection auction, December 2026." This is part of the painting's story and adds value to the work over time.

---

## 15. Cross-Journey Interactions

The Collector and Connoisseur interact with other personas at several points:

| Interaction | How it happens |
|---|---|
| **Journalist → Collector** | A press article about the auction drives a Collector to `fhoa.org` |
| **Spectator → Collector** | A shared painting link on social media brings a Collector to an Image Page |
| **Patron → Connoisseur** | A friend of William's mentions the auction to an art-collecting friend |
| **Collector → Spectator** | A Collector who doesn't bid becomes a Spectator — follows the auction, may bid later |
| **Collector → Patron (outbid)** | A Collector who is outbid and receives a reward tells the story, driving new Patrons and Spectators |
| **Connoisseur → Champion** | A Connoisseur who is outbid at Tier 2 may return at Tier 3 — becoming a Champion by commitment level |
| **Gambler → Collector (outbid framing)** | A Gambler's bid looks identical to a Collector's bid at Tier 1. The system cannot distinguish intent — only the framing can influence behavior. |

---

## 16. Collector vs. Connoisseur: Divergence Summary

| Dimension | Collector (P-04) | Connoisseur (P-03) |
|---|---|---|
| **Price range** | $16–$1,500 | $3,000–$35,000 |
| **Decision speed** | Fast — emotional, accessible | Slow — deliberate, researched |
| **Trust needs** | Secure payment, real paintings | Escrow details, artist credentials, terms review |
| **Registration friction tolerance** | Low — wants it fast | Medium — expects some process for this amount |
| **Outbid emotional response** | Mild disappointment + pleasant surprise (reward) | Significant — may rebid at next tier |
| **Shipping preference** | Simple, affordable | Willing to pay for premium art-safe shipping |
| **Certificate importance** | Nice to have | Expected — part of provenance |
| **Post-auction value** | Story to tell ("I own an original") | Portfolio asset with documented provenance |

---

## 17. Open Questions (This Journey)

| ID | Question | Urgency | Resolution Path |
|---|---|---|---|
| J02a-04 | Pre-bid inquiry channel — depends on fiduciary/auction house capability | Pre-launch | Resolve after AM-OQ-02 (fiduciary selection) |
| J02a-08 | Wire transfer threshold and accepted payment methods | Pre-launch | Resolve after AM-OQ-02/AM-OQ-03 (fiduciary + payment processor) |
| J02a-11 | Art-safe shipping box options and pricing (FedEx, UPS) by painting size | Pre-launch | Research task — needed for Image Pages and settlement |

---

## 18. Decision Log (This Journey)

| # | Decision | Rationale | Date |
|---|---|---|---|
| 1 | Open gallery — register to bid | Gallery is the product's best marketing. Gating it reduces Spectator and Journalist amplification. Registration only needed when committing money. | 2026-03-15 |
| 2 | Artist does not self-promote | William stays aloof. Discovery driven by press coverage, auction house promotion, and social sharing. The work and the mechanism are the story. | 2026-03-15 |
| 3 | Primary discovery path is press/media | The novel auction mechanic is the hook. Journalists drive initial traffic. Auction house (if selected) drives collector-network traffic. | 2026-03-15 |
| 4 | Homepage: gallery scroller → Charlotte Collection → auction stats → WTA | Art first (scroller at top), then branding, then the two big CTAs (Art Auction page, WTA page). Title rendered as Fine^(Higher Ordered) Art — mathematical exponent styling. | 2026-03-15 |
| 5 | Gallery is a scroller component, not a separate page | Appears on homepage, Art Auction page, and WTA page. Clicking a painting goes to its Image Page. No dedicated gallery page needed. | 2026-03-15 |
| 6 | "How Bidding Works" in global nav + contextual on Image Pages + Art Auction page | Multiple touchpoints for terms/mechanism explanation. WTA page has its own explanation. | 2026-03-15 |
| 7 | Payment collected at bid time, not registration | Collecting payment before the bidder has chosen a painting is premature. Registration captures contact info; payment happens when they commit. | 2026-03-15 |
| 8 | Login via Google/Apple sign-in or email/password | Both options available. Social login for convenience, email/password for those who prefer independence. Auction house agents may also be available by phone if a partner is selected. | 2026-03-15 |
| 9 | All three tier buttons visible, only lowest available is active | Shows the full price spectrum (communicates the tier structure) while enforcing sequential progression. Higher tiers grayed out until the lower tier is bid. | 2026-03-15 |
| 10 | Sequential tier progression — no direct high-tier bidding | Bids must progress T1→T2→T3. A motivated buyer who self-outbids earns their own rewards (~50% back). Creates visible activity and real tension between tier steps. Updates auction-mechanism.md §4.5. | 2026-03-15 |
| 11 | Threshold progress: percentage + absolute numbers + creative stats | Full transparency per HC-03. Homepage shows percent reached, number of bidders, total square inches, etc. Creative data visualization encouraged. | 2026-03-15 |
| 12 | Notifications: email + optional SMS + optional push | All channels available. Bidder configures preferences. Email is primary and mandatory for all events. | 2026-03-15 |
| 13 | Shipping: platform-facilitated with art-safe boxes at added charge | Research FedEx and UPS for art-safe shipping boxes by size. Offered through the site. Local pickup also available. | 2026-03-15 |
| 14 | Certificate of authenticity: physical (hand-signed) + digital (PDF) | Physical ships with painting. Digital provided at settlement for immediate confirmation. Connoisseur expects physical as provenance. | 2026-03-15 |
| 15 | Domain: fhoa.org | Already owned by William. | 2026-03-15 |
