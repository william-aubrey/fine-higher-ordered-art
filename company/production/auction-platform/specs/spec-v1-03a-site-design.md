# Site Design — Charlotte Collection Auction Platform

*Phase 3 (WHAT) — Spec-Driven Development*
*Version: v1*
*Date: 2026-03-21*
*Author: CTO Agent*

---

## 1. Overview

This document specifies every page, component, interaction flow, and responsive behavior of the Charlotte Collection auction website at `fhoa.org`. It is the product design specification — what the user sees, touches, and experiences. It absorbs the site structure decisions from Phase 2 journeys and the auction mechanism from Phase 1.

**What this document covers:**
- Page-by-page content and layout specifications
- Component definitions (gallery scroller, tier buttons, bid status indicators)
- Interaction flows (registration, bidding, payment)
- Notification templates
- URL structure and Open Graph tags
- Responsive design behavior
- Post-auction gallery transition

**What this document does NOT cover:**
- Data schemas and state machines → `spec-v1-03b-data-and-state.md`
- Technical architecture, APIs, infrastructure → `spec-v1-04-technical-architecture.md`

**Conventions:**
- Persona codes (P-01 through P-08) reference `spec-v1-01-icp-jtbd.md`
- Journey codes (J02a through J02f) reference Phase 2 journey documents
- Open question IDs (AM-OQ-nn, J02x-nn) reference `spec-v1-00-index.md`
- Constraint codes (HC-nn) reference `company/process/controls/ctrl-instance-constraints.md`

---

## 2. Site Map

```
fhoa.org/                           Homepage
fhoa.org/auction                    Art Auction page
fhoa.org/winner-takes-all           Winner Takes All page
fhoa.org/how-bidding-works          How Bidding Works / Terms page
fhoa.org/about                      About the Artist page
fhoa.org/paintings/{slug}           Image Page (per painting)
fhoa.org/series/grief               Theme Series Page (Grief Series)
fhoa.org/dashboard                  Bidder Dashboard (authenticated)
fhoa.org/register                   Registration flow
fhoa.org/login                      Login
```

### URL Rules

- All URLs are lowercase, hyphen-separated, human-readable
- Painting slugs derived from painting titles (e.g., `/paintings/acceptance`, `/paintings/anger`)
- No query parameters in public-facing URLs — all state is path-based
- Trailing slashes are not canonical; redirect `/auction/` to `/auction`

### Public vs. Authenticated Pages

| Page | Access |
|---|---|
| Homepage, Auction, WTA, How Bidding Works, About, Image Pages, Series Pages | Public — no login required |
| Bidder Dashboard | Authenticated only |
| Registration, Login | Public (redirect to dashboard if already authenticated) |
| Bid flow (triggered from Image Page) | Requires authentication — redirect to register/login if not authenticated, then return to painting |

**Principle:** The gallery is the best marketing. No gates until committing money (Key Decision #12).

---

## 3. Global Elements

### 3.1 Navigation Bar

Fixed top navigation, persistent across all pages.

| Element | Behavior |
|---|---|
| **Logo / Site Title** | "Fine Higher Ordered Art" — links to homepage. See §3.3 for title treatment. |
| **Art Auction** | Links to `/auction` |
| **Winner Takes All** | Links to `/winner-takes-all` |
| **How Bidding Works** | Links to `/how-bidding-works` |
| **About the Artist** | Links to `/about` |
| **[Sign In / Dashboard]** | If unauthenticated: "Sign In" → `/login`. If authenticated: "Dashboard" → `/dashboard`. |

**Mobile:** Hamburger menu. Logo + hamburger visible. Menu expands as full-screen overlay with all navigation items.

### 3.2 Footer

Present on all pages. Contains:

| Element | Content |
|---|---|
| **Copyright** | "(c) 2026 Fine Higher Ordered Art. All rights reserved." |
| **IP Notice** | "All artwork (c) William Ryan Aubrey. Sale transfers physical ownership only. Artist retains all reproduction rights." (HC-01) |
| **Navigation Links** | How Bidding Works, About the Artist, Terms of Service |
| **Fiduciary** | Fiduciary lawyer name, firm, bar association membership (when engaged — AM-OQ-02) |
| **Contact** | Press/media inquiry email (resolves J02f-01 — routed to fiduciary or designated representative, not the artist) |

### 3.3 Title Treatment

"Fine Higher Ordered Art" is rendered with "Higher Ordered" as a mathematical superscript/exponent:

```
Fine^(Higher Ordered) Art
```

Visual rendering: "Fine" in standard weight, "Higher Ordered" elevated and reduced in size as a superscript, "Art" returns to baseline. The exact typographic treatment is a design implementation detail, but the mathematical exponent metaphor must be preserved.

### 3.4 Visual Language

**Art-first design:** The paintings dominate every page. Design elements serve the art — they do not compete with it.

| Element | Specification |
|---|---|
| **Background** | Neutral — white, off-white, or very light warm gray. Never dark backgrounds that fight the paintings. |
| **Typography** | Two font families maximum. One serif (headings, titles) for warmth. One sans-serif (body, UI elements) for clarity. |
| **Color palette** | Derived from the paintings themselves. Accent colors sampled from the collection. No arbitrary brand colors. |
| **Bid status colors** | Open: neutral gray. Tier 1 Held: warm accent (approachable). Tier 2 Held: richer tone. Tier 3 Held: deep/premium tone. Consistent across all components. |
| **Spacing** | Generous whitespace. Paintings need breathing room. Dense layouts cheapen the work. |
| **Photography** | All painting images must be color-accurate, high-resolution, professionally photographed. No filters, no processing that alters the artist's color choices. |

**No aggressive conversion tactics.** No pop-ups, no overlays, no "bid now" banners, no countdown timers in headers. Let the art and the auction mechanics speak (Key Decision #8).

---

## 4. Homepage (`/`)

The homepage is the first impression. It must accomplish three things in 10 seconds: show the art, establish legitimacy, create intrigue.

### 4.1 Layout (Top to Bottom)

**Section 1: Gallery Scroller** (full viewport width, above the fold)

The gallery scroller (§12) is the first thing visitors see. No hero banner, no welcome text above it — paintings first.

**Section 2: The Charlotte Collection**

| Element | Content |
|---|---|
| **Heading** | "The Charlotte Collection" |
| **Subheading** | "52 Original Acrylic Paintings by William Ryan Aubrey" |
| **Body** | 2-3 paragraphs introducing the collection, the artist, and the auction concept. Tone: warm, confident, not salesy. Establishes that this is a curated body of work with a story, not a commodity sale. |
| **CTA** | "Explore the Auction" → `/auction` |

**Section 3: Auction Statistics**

Live data display showing the auction's current state:

| Statistic | Display |
|---|---|
| **Threshold progress** | "[X]% of threshold reached" — visual progress bar + absolute numbers ("$72,000 of $[threshold]") |
| **Paintings with bids** | "[N] of 52 paintings have bids" |
| **Total bidders** | "[N] bidders" |
| **Days remaining** | "[N] days until December 31, 2026" |

Data refreshes in real time (WebSocket or polling — specified in Phase 4). Creative data visualization encouraged — these are not just numbers, they tell the story of the auction's momentum.

**Section 4: Winner Takes All**

| Element | Content |
|---|---|
| **Heading** | "Winner Takes All" |
| **Current WTA Price** | Prominently displayed, real-time updating. "$[X]" in large type. |
| **Body** | 1-2 paragraphs: what the Magnate receives — all 52 paintings, every painting William has ever created, studio equipment, personal delivery. Emphasis on the scope and exclusivity. |
| **Urgency note** | "The WTA price rises with every bid. An early offer acquires the collection at its lowest price." (Factual, not pressuring.) |
| **CTA** | "Learn More" → `/winner-takes-all` |

### 4.2 Homepage — Pre-Bid State (Auction Opens, No Bids Yet)

When the auction first launches with zero bids:

- Gallery scroller shows all paintings as "Open"
- Auction statistics show: "0% of threshold reached", "0 of 52 paintings have bids", "0 bidders"
- WTA price shows the minimum (sum of all Tier 1 prices)
- This is the most accessible moment — everything is at floor price

### 4.3 Homepage — Post-Auction State

After December 31, 2026 (whether auction succeeds or fails):

- Gallery scroller remains, showing final bid status per painting
- "The Charlotte Collection" section updated to past tense: "was" not "is"
- Auction statistics frozen at final values
- WTA section removed (if auction succeeded) or shows "Auction closed — threshold not met" (if failed)
- A banner or header section states the outcome clearly
- The site becomes a permanent archive / online gallery (auction-mechanism.md §8.7)

---

## 5. Art Auction Page (`/auction`)

The primary entry point for understanding the auction and browsing paintings.

### 5.1 Layout

**Section 1: Auction Status Bar**

Horizontal bar at the top of the page (below global nav):

| Element | Content |
|---|---|
| **Threshold** | Progress bar + "$[X] of $[threshold]" |
| **Paintings** | "[N] of 52 with bids" |
| **Days remaining** | "[N] days left" |

Real-time updating. Compact — this is context, not the focus.

**Section 2: Introduction**

| Element | Content |
|---|---|
| **Heading** | "The Charlotte Collection Auction" |
| **Body** | 2-3 paragraphs explaining the auction concept. Tier structure overview. Outbid reward mechanic explained in plain language: "If someone bids at a higher tier after you, you receive a full refund plus a reward — a thank-you from the artist for being an early supporter." |
| **Link** | "Read the full auction terms" → `/how-bidding-works` |

**Section 3: Gallery Scroller**

Full gallery scroller component (§12). Same behavior as homepage scroller but contextually positioned after the auction explanation.

**Section 4: Tier Overview**

Visual display of the three tiers:

| Tier | Price | Description |
|---|---|---|
| Tier 1 | $1 / sq. in. | "Accessible entry — own an original painting" |
| Tier 2 | $10 / sq. in. | "Serious commitment — collector's tier" |
| Tier 3 | $100 / sq. in. | "Premium acquisition — patron level" |

Include 2-3 example paintings at different sizes showing concrete prices at each tier.

**Section 5: How It Works Summary**

Brief, visual 4-step summary:

1. **Browse** — Explore 52 original paintings
2. **Bid** — Choose a painting, choose a tier, pay into escrow
3. **Watch** — Track the auction as it unfolds through December 31
4. **Collect** — If the auction succeeds, your painting ships to you

"Full terms and details" → `/how-bidding-works`

---

## 6. Image Page (`/paintings/{slug}`)

The per-painting detail page. This is where emotional connection happens and purchase decisions are made.

### 6.1 Layout

**Primary Zone (Above the Fold)**

| Element | Specification |
|---|---|
| **Painting Image** | High-resolution, color-accurate. Dominates the viewport. On desktop: 60-70% of viewport width. Click/tap to open full-resolution lightbox. |
| **Title** | Painting title. Large, clear. |
| **Dimensions** | US: `[W]" x [H]"` (or `[W]' x [H]'` for feet). Metric: `[W] cm x [H] cm`. Both displayed. |
| **Scale Diagram** | Inset showing the painting's size next to a 6' (183 cm) person silhouette. Communicates physical scale at a glance. |

**Transaction Zone (Below or alongside primary image)**

| Element | Specification |
|---|---|
| **Bid Status** | Current state: "Open", "Tier 1 Held", "Tier 2 Held", or "Tier 3 Held". Uses bid status color coding (§3.4). |
| **Current Bidder** | If a bid exists: public name (if bidder opted for visibility) or "Private Bidder". Not shown for "Open" paintings. |
| **Tier Buttons** | Three-button component (§13). Shows all three tiers with prices. Only the lowest available tier is active. |
| **How Bidding Works link** | "How does bidding work?" → `/how-bidding-works`. Positioned near tier buttons. |

**Narrative Zone (Below the fold)**

| Element | Specification |
|---|---|
| **Painting narrative** | Written description: story, emotion, context. 1-3 paragraphs. Tone set by the artist. |
| **Video** | Embedded video player: the artist and/or others discussing this painting. Appears only if video content exists for this painting. |
| **Series link** | If the painting belongs to a theme series (e.g., Grief Series): "Part of [Series Name]" → series page. |

**Info Zone (Bottom)**

| Element | Specification |
|---|---|
| **Shipping estimate** | "Estimated shipping: $[X]–$[Y] (varies by location)" — based on painting size category. See §6.3. |
| **Certificate** | "Includes hand-signed certificate of authenticity" |
| **Terms link** | "All sales are final. Read auction terms." → `/how-bidding-works` |

### 6.2 Image Page States

**State: Open (no bids)**

- Bid status: "Open" (neutral)
- Tier buttons: Tier 1 active, Tier 2 and 3 grayed
- No bidder display

**State: Tier 1 Held**

- Bid status: "Tier 1 Held" (warm accent)
- Bidder: "[Name]" or "Private Bidder"
- Tier buttons: Tier 1 shows "Held — $[X]", Tier 2 active, Tier 3 grayed

**State: Tier 2 Held**

- Bid status: "Tier 2 Held" (richer tone)
- Bidder: "[Name]" or "Private Bidder"
- Tier buttons: Tier 1 shows past holder (if public), Tier 2 shows "Held — $[X]", Tier 3 active

**State: Tier 3 Held**

- Bid status: "Tier 3 Held" (deep/premium tone)
- Bidder: "[Name]" or "Private Bidder"
- Tier buttons: All three show holders. No tier is active. Message: "All tiers claimed."
- Painting is still in the auction (active until December 31) but cannot receive further individual bids

**State: Bid in Progress**

- When another user is currently in the payment process for the available tier
- Active tier button displays: "Bid in progress..." (pulsing or animated indicator)
- Other users see this and know the tier may be claimed imminently
- If payment fails or times out, the tier returns to active

**State: Post-Auction (Sold)**

- If auction succeeded and painting had a winning bid
- Bid status: "Sold — Tier [N]"
- Bidder: winner's name (if public) or "Private Collector"
- Tier buttons removed
- "Sold during The Charlotte Collection auction, December 2026"

**State: Post-Auction (Unsold)**

- If auction succeeded but painting received no bids, or auction failed
- Bid status: "Collection of the Artist"
- Tier buttons removed

### 6.3 Shipping Estimates

Displayed on Image Pages based on painting size category. These are estimates — actual shipping varies by destination.

| Size Category | Dimensions | Estimate Range |
|---|---|---|
| Small | Up to 12" x 12" | $25–$60 |
| Medium | 12"–24" on longest side | $50–$120 |
| Large | 24"–48" on longest side | $100–$250 |
| Oversized | Over 48" on any side | $200–$500+ |

> **PENDING (AM-OQ, J02a-11):** These ranges are placeholder estimates. William to research actual art-safe shipping costs (FedEx, UPS, specialized art shippers) by painting size. Final estimates will replace these.

All shipping must comply with HC-07: rigid packaging, acid-free wrapping, insured.

Display format on Image Page: "Estimated shipping within the US: $[low]–$[high]. Art-safe packaging, fully insured. [Learn more]" — where "Learn more" links to shipping details section on How Bidding Works page.

---

## 7. Winner Takes All Page (`/winner-takes-all`)

The WTA page serves the Magnate (P-01) and the Spectator (P-07, who watches the WTA counter for drama).

### 7.1 Layout

**Section 1: The Price**

| Element | Specification |
|---|---|
| **Heading** | "Winner Takes All" |
| **Current WTA Price** | Largest text element on the page. Real-time updating. "$[X]" |
| **Subtext** | "This price rises with every bid placed on any painting." |
| **Calculation note** | "The WTA price equals the cost of outbidding every current holder — one tier above the highest bid on each painting." |

**Section 2: What You Receive**

Structured list:

1. **All 52 Charlotte Collection paintings** — the complete curated collection
2. **Every other painting William has ever created** — non-collection works, drafts, half-finished pieces, everything
3. **Paintings by others** — works created in William's home and gifted to him over the years
4. **The studio** — every brush, every tube of paint, easels, supplies, tools — the complete working environment of a lifetime artist
5. **Personal delivery** — William drives a U-Haul to your location anywhere in the continental United States

"Everything the artist has ever touched leaves his possession and enters yours."

**Section 3: The Mystery**

| Element | Content |
|---|---|
| **Body** | "Beyond the 52 cataloged paintings, the full inventory of non-collection works is intentionally undisclosed. Part of the acquisition is the adventure of discovery — seeing what an artist created when no one was watching." (Resolves J02d-01.) |

**Section 4: How It Works**

| Step | Description |
|---|---|
| **1. Contact** | "Reach out to our fiduciary lawyer to express interest." |
| **2. Review** | "The lawyer reviews the full terms, verifies the escrow structure, and answers any questions." |
| **3. Contract** | "A formal purchase contract is prepared and signed." |
| **4. Payment** | "Wire transfer to the escrow account." |
| **5. Immediate Close** | "The auction closes immediately. All individual bidders are refunded. Outbid rewards are calculated and disbursed at settlement." |

**Section 5: Arrange Purchase CTA**

| Element | Specification |
|---|---|
| **Button** | "Arrange Purchase" — styled as a premium action. Not "Place Bid." |
| **Behavior** | Opens a contact form or displays fiduciary lawyer contact information directly. |
| **Below CTA** | Fiduciary lawyer name, firm, bar association, contact details. "Credentials independently verifiable through [Bar Association Name]." |

> **PENDING (AM-OQ-02):** Fiduciary lawyer identity. Until engaged, the CTA and credentials section show placeholder content and the form is not functional.

**Section 6: Gallery Scroller**

Gallery scroller component (§12) at the bottom. "Explore the collection you'd be acquiring."

### 7.2 WTA Price Display

The WTA price is calculated per auction-mechanism.md §7.1:

| Painting State | Contributes to WTA Price |
|---|---|
| Open (no bid) | Tier 1 price ($1/sq.in.) |
| Tier 1 Held | Tier 2 price ($10/sq.in.) |
| Tier 2 Held | Tier 3 price ($100/sq.in.) |
| Tier 3 Held | Tier 4 price ($1,000/sq.in. — WTA only) |

The displayed price updates in real time as individual bids are placed.

### 7.3 WTA Page — Post-Auction States

**If WTA was triggered:** "The Charlotte Collection was acquired by [Name/Private Buyer] on [Date]." Gallery remains. Price removed.

**If auction closed without WTA (success):** "The auction closed on December 31, 2026. Winner Takes All was not exercised." Gallery shows final bid states.

**If auction failed:** "The auction closed without meeting its threshold. All paintings remain with the artist."

---

## 8. How Bidding Works Page (`/how-bidding-works`)

The terms and rules page. Serves three audiences: Connoisseurs doing due diligence (P-03), Journalists verifying facts (P-08), and any bidder reviewing terms before committing money. Per HC-03, all auction terms must be fully disclosed before bidding opens.

### 8.1 Layout

The page is structured as an FAQ / reference document. Long-form by necessity — completeness over brevity.

**Section 1: The Auction**

- What is The Charlotte Collection?
- How does the tiered-bid system work?
- What are the three tiers and how is pricing calculated?
- What happens when I place a bid? (Payment into escrow, irrevocable commitment)
- What does "irrevocable" mean? (You cannot withdraw, cancel, or reduce a bid)

**Section 2: Outbid Rewards**

- What happens if I'm outbid? (Full refund immediately + reward at settlement)
- How is the reward calculated? (50% of the spread between tiers)
- When do I receive the reward? (At settlement, after auction close, if auction succeeds)
- What if the auction fails? (No rewards — all funds refunded, former bidders already received their refunds)

**Framing requirement:** Rewards are described as "a thank-you from the artist for being an early supporter" — never as returns, earnings, or investment income. No reward calculator is provided on the site (Key Decision #10). The math is derivable from the published rules (HC-03 compliance), but the site does not make it easy.

**Section 3: Sequential Tier Progression**

- Why can't I bid directly at Tier 3? (Sequential progression — every painting progresses T1→T2→T3)
- Can I outbid myself? (Yes — and you earn your own outbid reward, effectively reducing your net cost by ~50%)
- What if someone else bids a tier while I'm between tiers? (The auction is first-come-first-served — see §8.1 Section 5)

**Section 4: Threshold and Auction Close**

- What is the aggregate threshold? ($[threshold] — sum of all Tier 1 prices across 52 paintings)
- When does the auction close? (December 31, 2026 — fixed, no extensions)
- What happens if the threshold is not met? (Entire auction cancelled, all active bids refunded in full)
- What about paintings with no bids? (Remain with the artist)

**Section 5: Bidding Process**

- How do I place a bid? (Browse → select painting → choose tier → register → pay)
- What payment methods are accepted? (Credit card for bids below $[threshold]; wire transfer via fiduciary for bids above)
- What if someone else is bidding on the same tier at the same time? (First to complete payment wins — real-time status shows "bid in progress")
- Is my bid public? (You choose: public name or "Private Bidder" — painting status is always visible)

> **PENDING (J02a-08, J02c-01):** Credit card / wire transfer threshold amount. Fiduciary lawyer to advise. Likely $5,000–$10,000.

**Section 6: Settlement**

- What happens after the auction succeeds?
- How do I receive my painting? (Shipping is buyer's responsibility — art-safe packaging, insured per HC-07)
- What shipping options are available? (FedEx, UPS, specialized art shippers — estimates by size)
- What about the certificate of authenticity? (Physical hand-signed certificate ships with painting; digital PDF at settlement)
- What are the fiduciary's fees? (Deducted from artist proceeds, not from bidder payments)

**Section 7: Winner Takes All**

- What is WTA? (Link to `/winner-takes-all`)
- How does WTA affect my bid? (All existing bidders are refunded + earn outbid rewards)
- Brief summary; full details on WTA page

**Section 8: Legal**

- Who holds the money? (Third-party fiduciary — name, firm, bar credentials)
- What rights do I receive? (Physical ownership only — artist retains all reproduction/IP rights per HC-01)
- Are bids really irrevocable? (Yes. All sales final.)
- US buyers only. (International buyers may use a US-based proxy. No international delivery.)
- Tax implications (Sales tax per state; rewards may be taxable income; consult your tax advisor)

**Section 9: Terms of Service**

> **PENDING:** Full terms of service to be drafted by fiduciary lawyer and reviewed by securities counsel.

Placeholder: link to terms of service document (separate page or PDF) when available.

---

## 9. About the Artist Page (`/about`)

Resolves J02f-03. Serves the Patron (P-05, who bids on the story), the Connoisseur (P-03, who needs artist credentials), the Journalist (P-08, who needs verifiable identity), and the Spectator (P-07, who follows the narrative).

### 9.1 Layout

**Section 1: The Artist**

| Element | Content |
|---|---|
| **Photo** | Professional photo of William. Not a studio glamour shot — authentic, warm, real. |
| **Name** | William Ryan Aubrey |
| **Body** | Artist statement. Written by William. His perspective on the work, why he paints, what the paintings mean to him, where he's going next. This is personal and cannot be templated. |

> **PENDING (Art/Content task):** William to write artist statement.

**Section 2: The Charlotte Collection**

| Element | Content |
|---|---|
| **Body** | The story of the collection — why these 52 paintings, why now, why this auction format. What Charlotte means. What the December 31 deadline represents. |

**Section 3: The Body of Work**

| Element | Content |
|---|---|
| **Body** | Brief description of William's broader body of work — more than 100 paintings, years of practice, themes explored. Establishes that the 52 are selected from a larger oeuvre. |
| **Note** | "The complete body of work — including non-collection paintings, drafts, and unfinished pieces — is part of the Winner Takes All acquisition." |

**Section 4: Press & Media**

| Element | Content |
|---|---|
| **Contact** | Press inquiry email. Routed to fiduciary or designated representative — never the artist's personal email. (Resolves J02f-01.) |
| **Images** | "High-resolution images of Charlotte Collection paintings are available for editorial use with attribution: '(c) William Ryan Aubrey, courtesy Fine Higher Ordered Art.' Contact [email] for press assets." (Resolves J02f-02; consistent with HC-01 — IP retained, press use welcomed per editorial license.) |

> **PENDING (J02f-02):** Formal image usage policy for press. HC-01 retains IP. Press needs images for coverage. Recommendation: standard editorial license — free use for news/editorial coverage with attribution. No commercial licensing.

---

## 10. Theme Series Page (`/series/grief`)

### 10.1 The Grief Series

The only theme series at launch. Six large paintings (each 6' x 4' / 3,456 sq. in.):

1. Anger
2. Denial
3. Bargaining
4. Depression
5. Acceptance
6. Joy

### 10.2 Layout

**Section 1: Series Narrative**

| Element | Content |
|---|---|
| **Heading** | "The Grief Series" |
| **Body** | The story of this series — six stages of grief rendered in paint. Why these themes, what they mean to the artist, how they relate to each other. Written by William or synthesized from his input. |

> **PENDING (Art/Content task):** William to write or approve Grief Series narrative.

**Section 2: The Six Paintings**

Grid layout — 2 columns on desktop, 1 column on mobile. Each painting card:

| Element | Content |
|---|---|
| **Image** | Painting image (sized to show detail; these are large paintings) |
| **Title** | Painting title |
| **Dimensions** | 48" x 72" (122 x 183 cm) |
| **Bid status** | Current state (Open / Tier N Held) with color indicator |
| **Price at Tier 1** | "$3,456" |
| **Link** | Entire card links to Image Page (`/paintings/{slug}`) |

Paintings displayed in the series order (Anger → Joy), not alphabetically.

**Section 3: Context**

"Each painting in the Grief Series stands on its own — there is no structural auction rule that binds them. A collector who values the series can choose to keep it together. Each painting sells individually."

This text is important: it clarifies that the Grief Series is a narrative element, not a structural one (Key Decision, auction-mechanism.md §5.1).

### 10.3 Future Series Pages

The URL pattern `/series/{slug}` supports additional series pages if other thematic groupings emerge from the collection. At launch, only the Grief Series has a dedicated page.

---

## 11. Bidder Dashboard (`/dashboard`)

Authenticated access only. The bidder's personal view of their auction activity.

### 11.1 Layout

**Section 1: Active Bids**

Table or card list of all paintings where the bidder holds the current highest bid:

| Column | Content |
|---|---|
| **Painting** | Thumbnail + title (links to Image Page) |
| **Tier** | Tier 1, 2, or 3 |
| **Amount** | Dollar amount in escrow |
| **Date** | When bid was placed |
| **Status** | "Active" (green indicator) |

**Section 2: Outbid History**

Paintings where the bidder was outbid:

| Column | Content |
|---|---|
| **Painting** | Thumbnail + title |
| **Your Tier** | The tier the bidder held |
| **Refund** | "Refunded $[X] on [date]" |
| **Reward** | "Reward at settlement if auction succeeds" (no dollar amount displayed until settlement) |
| **Status** | "Outbid — Refunded" |

> **OPEN QUESTION (J02e-03):** Should the dashboard show the estimated reward dollar amount before settlement? Arguments for: transparency, bidder can plan. Arguments against: emphasizes financial return, feeds Gambler framing. **Recommendation:** Show reward amount only after settlement is confirmed. Before settlement: "You'll receive a reward at settlement as a thank-you for being an early supporter." This is the safer framing for securities purposes.

**Section 3: Auction Status**

| Element | Content |
|---|---|
| **Threshold progress** | Progress bar + percentages + absolute numbers |
| **Days remaining** | Countdown to December 31, 2026 |
| **Paintings with bids** | "[N] of 52" |

**Section 4: Notification Preferences**

Toggle controls for notification channels:

| Channel | Options |
|---|---|
| **Email** | Always on (required for transaction confirmations) |
| **SMS** | Optional — toggle on/off |
| **Browser push** | Optional — toggle on/off |

### 11.2 Dashboard — Post-Auction States

**Auction succeeded, bidder won:**

- Active bids section shows "Won" status
- Shipping instructions displayed: "Arrange pickup or shipping for your painting. Art-safe packaging required."
- Certificate of authenticity: "Your digital certificate (PDF) is available for download. A physical, hand-signed certificate will ship with your painting."

**Auction succeeded, bidder was outbid:**

- Outbid section shows reward amount (now known): "Your reward of $[X] has been disbursed to [payment method]."

**Auction failed:**

- All sections show "Auction Cancelled" status
- Active bids: "Refund of $[X] processing to [payment method]"
- Outbid bids: "No rewards — auction did not meet threshold. Your refund was processed at time of outbid."

---

## 12. Gallery Scroller Component

The gallery scroller is the primary browsing mechanism. It appears on the Homepage, Art Auction page, and Winner Takes All page (at bottom).

### 12.1 Behavior

| Property | Specification |
|---|---|
| **Layout** | Horizontal scrolling carousel |
| **Items** | All 52 paintings |
| **Scroll** | Smooth horizontal scroll. Mouse drag, touch swipe, or arrow buttons. |
| **Navigation** | Left/right arrow buttons at carousel edges. Visible on hover (desktop) or always visible (mobile). |
| **Item width** | Fixed width per item — sized to show painting image clearly. ~200-250px on desktop, ~150px on mobile. |
| **Overflow** | Items extend beyond viewport. Partial items visible at edges indicate scrollability. |
| **Performance** | Lazy loading — only load images for visible items + 2-3 items in each direction. Critical for 52 items. |

### 12.2 Scroller Item (Per Painting)

Each item in the scroller displays:

| Element | Content |
|---|---|
| **Image** | Painting thumbnail (square crop or aspect-ratio-preserved with consistent height) |
| **Title** | Painting title (below image, truncated if long) |
| **Bid Status** | Color-coded indicator: Open (gray), Tier 1 (warm), Tier 2 (richer), Tier 3 (deep) |
| **Link** | Entire item links to Image Page (`/paintings/{slug}`) |

Status indicators update in real time as bids are placed.

### 12.3 Scroller — Ordering

Default order: curated by the artist. Not alphabetical, not by size, not by price. The artist's arrangement tells a visual story. The Grief Series paintings appear together in their series order within the broader sequence.

### 12.4 Responsive Behavior

| Viewport | Behavior |
|---|---|
| **Desktop (>1024px)** | Shows 4-5 paintings at once. Arrow navigation + drag scroll. |
| **Tablet (768-1024px)** | Shows 3-4 paintings. Touch swipe + arrows. |
| **Mobile (<768px)** | Shows 2-3 paintings. Touch swipe primary. Arrows optional. |

---

## 13. Tier Buttons Component

The three-button tier selection component. Appears on every Image Page.

### 13.1 Layout

Three buttons displayed horizontally (desktop) or stacked vertically (mobile):

```
Desktop:
┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐
│  Tier 1   $144   │  │  Tier 2  $1,440  │  │  Tier 3  $14,400 │
└──────────────────┘  └──────────────────┘  └──────────────────┘

Mobile:
┌──────────────────────────┐
│  Tier 1            $144  │
├──────────────────────────┤
│  Tier 2          $1,440  │
├──────────────────────────┤
│  Tier 3         $14,400  │
└──────────────────────────┘
```

### 13.2 Button States

Each button has one of these states:

| State | Visual | Behavior |
|---|---|---|
| **Available** | Primary color, full opacity, cursor pointer | Clickable — initiates bid flow |
| **Grayed** | Muted color, reduced opacity | Not clickable — tier not yet available (sequential progression) |
| **Held** | Distinct color matching tier status | Not clickable — shows "Held" + bidder name or "Private Bidder" |
| **In Progress** | Pulsing/animated indicator | Not clickable — shows "Bid in progress..." |
| **Sold** | Final state post-auction | Not clickable — shows "Sold" |

### 13.3 Button Label Content

| State | Label |
|---|---|
| Available | "Tier [N] — $[price]" or "Place Bid — $[price]" |
| Available (above threshold) | "Tier [N] — $[price] — Arrange Purchase" |
| Grayed | "Tier [N] — $[price]" (same text, visually muted) |
| Held | "Tier [N] — $[price] — Held by [Name/Private Bidder]" |
| In Progress | "Tier [N] — $[price] — Bid in progress..." |

### 13.4 Threshold-Dependent Button Behavior

When the available tier's price exceeds the credit card / lawyer-mediated threshold (J02c-01):

- Button text changes from "Place Bid" to "Arrange Purchase"
- Clicking the button does NOT initiate the self-service payment flow
- Instead, it displays fiduciary lawyer contact information and initiates the lawyer-mediated process (§14.4)

---

## 14. Interaction Flows

### 14.1 Registration Flow

**Trigger:** User clicks a tier button (Place Bid or Arrange Purchase) while not authenticated.

**Step 1: Authentication Choice**

| Option | Behavior |
|---|---|
| **Sign in with Google** | OAuth flow → collects remaining required info (Step 2) |
| **Sign in with Apple** | OAuth flow → collects remaining required info (Step 2) |
| **Create account with email** | Email + password creation → email verification → collects required info (Step 2) |
| **Already have an account?** | Link to `/login` |

**Step 2: Required Information**

After authentication, collect any information not provided by OAuth:

| Field | Required | Why |
|---|---|---|
| **Full legal name** | Yes | Settlement, certificates, tax documents |
| **Email** | Yes (verified) | Primary communication channel |
| **Phone number** | Yes | Transaction-critical communications |
| **Mailing address** | Yes | Shipping destination, state sales tax |

Display note: "This information is required for auction settlement, shipping, and legal compliance. Your data is encrypted and never shared with third parties. [Privacy Policy]"

**Step 3: Return to Painting**

After registration completes, redirect to the Image Page where the user initiated the flow. The tier button is now active for bidding.

**Important:** Payment is NOT collected at registration (Key Decision #4). Payment happens at the moment of bidding.

### 14.2 Bid Flow — Below Threshold (Credit Card)

**Trigger:** Authenticated user clicks "Place Bid — $[price]" on an available tier below the threshold.

**Screen 1: Confirm Painting & Tier**

| Element | Content |
|---|---|
| **Painting image** | Thumbnail |
| **Painting title** | Full title |
| **Tier** | "Tier [N]" |
| **Amount** | "$[price]" |
| **Headline** | "You are committing to purchase this painting." |

"Continue" button → Screen 2

**Screen 2: Review Terms** (First bid only)

Displayed only for the user's first bid in the auction. Subsequent bids skip to Screen 3.

Key terms surfaced for acknowledgment:

- "This is a **paid, irrevocable commitment** to purchase a painting."
- "Your payment of $[amount] will be charged immediately and held in third-party escrow."
- "You **cannot** withdraw, cancel, or reduce this bid."
- "If you are outbid: you will receive a **full, immediate refund** plus a possible reward at settlement."
- "If you win: you own the painting. **Shipping is your responsibility and cost.** All sales are final."
- "If the auction fails to meet its threshold: you receive a **full refund**. No paintings change hands."

Checkbox: "I have read and agree to the [auction terms](/how-bidding-works) and [terms of service]."

"Accept & Continue" button → Screen 3

**Screen 3: Payment**

| Element | Content |
|---|---|
| **Summary** | Painting title, Tier [N], $[amount] |
| **Payment form** | Credit card entry (Stripe Elements or equivalent — PCI-compliant per HC-05, no direct storage of payment credentials) |
| **Escrow note** | "Your payment is held by [Fiduciary Name], a licensed [bar association] attorney, in a trust account." |

"Pay $[amount]" button → Screen 4

**Screen 4: Processing**

Real-time status updates:

1. "Processing payment..." (spinner)
2. "Payment confirmed." (checkmark)
3. "Bid placed!" (success state)

| On success | Show painting thumbnail, tier, confirmation number. "View your bid in [Dashboard](/dashboard). Return to [painting name](/paintings/{slug})." |
|---|---|
| On failure | "Payment could not be processed. [Error details]. Try again or use a different payment method." Painting remains available; no hold placed until payment succeeds. |

**Race condition handling:** If another bidder completes payment for the same tier while this bidder is on Screen 3 or 4, the system must:
1. Abort the payment (if not yet charged) or reverse the charge (if charged)
2. Display: "This tier was just claimed by another bidder. [Painting title] is now at Tier [N+1]. Would you like to bid at the next tier?"

### 14.3 Bid Visibility Choice

After successful bid placement (Screen 4), prompt:

| Element | Content |
|---|---|
| **Question** | "How would you like your name displayed?" |
| **Option 1** | "[Full Name]" — your name is visible on the painting page |
| **Option 2** | "Private Bidder" — your identity is hidden |
| **Note** | "You can change this anytime from your Dashboard." |

Default: Private Bidder (privacy by default).

### 14.4 Bid Flow — Above Threshold (Lawyer-Mediated)

**Trigger:** Authenticated user clicks "Arrange Purchase — $[price]" on a tier above the threshold.

**Screen 1: High-Value Purchase Process**

| Element | Content |
|---|---|
| **Headline** | "Arranging a High-Value Purchase" |
| **Body** | "Bids above $[threshold] are facilitated by our fiduciary lawyer to ensure proper legal documentation and secure fund transfer." |
| **Process steps** | 1. Contact the fiduciary. 2. Review terms and escrow structure. 3. Sign purchase contract. 4. Wire transfer to escrow account. 5. Bid is placed once payment is confirmed. |

**Section: Contact the Fiduciary**

| Element | Content |
|---|---|
| **Lawyer name** | [Name] |
| **Firm** | [Firm name] |
| **Bar association** | [Association + membership number] |
| **Email** | [Direct email] |
| **Phone** | [Direct phone] |
| **Verification** | "Credentials independently verifiable through [Bar Association website]." |

**Contact form (optional alternative):**

| Field | Content |
|---|---|
| Name | Pre-filled from registration |
| Email | Pre-filled |
| Phone | Pre-filled |
| Painting | Pre-filled with painting title and tier |
| Message | Optional free-text field |

"Send Inquiry" button — delivers inquiry to fiduciary.

> **PENDING (AM-OQ-02):** Fiduciary lawyer identity, contact details, and preferred intake method. This entire section is dependent on the fiduciary engagement.

### 14.5 WTA Inquiry Flow

**Trigger:** User clicks "Arrange Purchase" on the WTA page.

Identical to §14.4 (above-threshold flow) but with WTA-specific content:

- Painting field replaced with "Winner Takes All — $[current WTA price]"
- Additional note: "The WTA price may change as individual bids are placed. The final price is locked when your wire transfer is received by the fiduciary."

---

## 15. Notification Templates

All notifications follow the same principles: lead with the painting (not the money), frame rewards as artist gratitude (not ROI), and provide clear next actions.

### 15.1 Bid Confirmed

**Channel:** Email

**Subject:** "Your bid on [Painting Title]"

**Body:**
```
You've placed a bid on [Painting Title].

Tier: [N]
Amount: $[X]
Status: Your payment is held in escrow by [Fiduciary Name].

Your bid is active. You'll be notified if you're outbid or when the
auction closes on December 31, 2026.

[View your bid in your Dashboard →]
[View [Painting Title] →]
```

### 15.2 Outbid Notification

**Channel:** Email + SMS + push (per bidder preferences)

This is the single most important notification in the system. It serves all outbid personas identically. The framing must be dual-safe: satisfying for the Patron, legally defensible against the Gambler.

**Subject:** "You've been outbid on [Painting Title]"

**Email body:**
```
[Painting Title] has moved to Tier [N].

Your full payment of $[X] has been refunded to [payment method].
The refund should appear within [timeframe].

If the auction succeeds on December 31, you'll receive a reward at
settlement — a thank-you from the artist for being an early
supporter of this painting.

What's next?
- [Bid again at Tier [N+1] →] (if available)
- [Browse other paintings →]

Thank you for supporting The Charlotte Collection.
```

**SMS body (condensed):**
```
You've been outbid on [Painting Title]. Full refund of $[X]
processing. Reward at settlement if auction succeeds.
Bid again? [link]
```

**What this notification MUST NOT include:**
- Reward dollar amount (shown only at settlement)
- ROI percentages or spread calculations
- Investment language ("return," "earnings," "profit")
- Suggestion that getting outbid is desirable

### 15.3 WTA Trigger Notification

Sent to all bidders when a WTA bid is placed.

**Subject:** "The Charlotte Collection — Winner Takes All"

**Email body:**
```
A Winner Takes All bid has been placed on The Charlotte Collection.
The auction has closed.

Your bid:
- [Painting Title] — Tier [N] — $[X]
- Refund of $[X] is being processed to [payment method]

As a supporter of [Painting Title], you will receive a reward at
settlement. Details will follow once settlement is complete.

Thank you for being part of The Charlotte Collection story.
```

### 15.4 Auction Milestone

**Channel:** Email

Sent at significant moments: 25% / 50% / 75% of threshold reached, first painting reaches Tier 3, specific painting count milestones.

**Subject:** "Charlotte Collection Update — [Milestone]"

**Body:**
```
[Milestone description — e.g., "The auction has reached 50% of its
threshold."]

Current status:
- $[X] of $[threshold] ([N]%)
- [N] of 52 paintings have bids
- [N] days remaining

[View the auction →]
```

### 15.5 Closing Warnings

**Channel:** Email + SMS (per preferences)

Sent at 7 days, 24 hours, and 1 hour before December 31, 2026.

**Subject:** "[N] [days/hours] remaining — Charlotte Collection Auction"

**Body:**
```
The Charlotte Collection auction closes in [N] [days/hours].

Your active bids:
- [Painting Title] — Tier [N] — $[X]

Current threshold: [N]% reached ($[X] of $[threshold])

[View the auction →]
```

### 15.6 Auction Result — Success

**Channel:** Email

**Subject:** "The Charlotte Collection auction has succeeded"

**For winners:**
```
Congratulations — you've won [Painting Title].

Your Tier [N] bid of $[X] is the winning bid.

Next steps:
1. Your digital certificate of authenticity (PDF) is available
   in your Dashboard
2. Arrange shipping or local pickup from Charlotte, NC
3. A physical, hand-signed certificate will ship with your painting

Art-safe packaging is required for all shipments (rigid packaging,
acid-free wrapping, insured). Estimated shipping for your painting:
$[low]–$[high].

[View shipping options and instructions →]
```

**For outbid bidders (reward recipients):**
```
The Charlotte Collection auction has succeeded.

As a Tier [N] supporter of [Painting Title], your reward has been
calculated:

Reward: $[X]
Disbursement to: [payment method]
Expected arrival: [timeframe]

Thank you for being an early supporter of this painting.
```

### 15.7 Auction Result — Failure

**Channel:** Email

**Subject:** "The Charlotte Collection auction has closed"

```
The Charlotte Collection auction closed on December 31, 2026.
The aggregate threshold was not met.

All active bids are being refunded in full:
- [Painting Title] — $[X] → refund processing

No rewards will be paid.

All 52 paintings remain with the artist.

Thank you for your participation in The Charlotte Collection.
```

**Tone:** Honest, not euphemistic. Grateful, not apologetic. Clear on money. Brief.

---

## 16. Open Graph / Social Meta Tags

Every public page must have proper Open Graph tags for link previews when shared on social media, messaging apps, or email. This is the primary mechanism for Spectator-driven discovery (Key Decision #12).

### 16.1 Per-Page Tags

**Homepage:**
```html
<meta property="og:title" content="Fine Higher Ordered Art — The Charlotte Collection" />
<meta property="og:description" content="52 original acrylic paintings by William Ryan Aubrey. A one-time tiered-bid auction closing December 31, 2026." />
<meta property="og:image" content="[hero painting image — curated selection]" />
<meta property="og:url" content="https://fhoa.org/" />
<meta property="og:type" content="website" />
```

**Image Page (per painting):**
```html
<meta property="og:title" content="[Painting Title] — Fine Higher Ordered Art" />
<meta property="og:description" content="[Brief description]. Currently [Open / Tier N Held]. Tier 1: $[X]." />
<meta property="og:image" content="[painting image URL]" />
<meta property="og:url" content="https://fhoa.org/paintings/[slug]" />
<meta property="og:type" content="article" />
```

**Art Auction Page:**
```html
<meta property="og:title" content="The Charlotte Collection Auction" />
<meta property="og:description" content="52 paintings. Three tiers. One deadline: December 31, 2026. [N]% of threshold reached." />
<meta property="og:image" content="[curated collection image]" />
```

**Winner Takes All Page:**
```html
<meta property="og:title" content="Winner Takes All — $[current price]" />
<meta property="og:description" content="Acquire every painting William Ryan Aubrey has ever created. Current price: $[X]." />
<meta property="og:image" content="[dramatic collection image]" />
```

### 16.2 Twitter/X Cards

```html
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:site" content="@[handle if created]" />
```

### 16.3 Dynamic Updates

Image Page OG descriptions should include current bid status. This creates urgency in shared links ("Currently Tier 2 Held" vs. "Currently Open"). Implementation detail: OG tags can be server-rendered even if the page uses client-side rendering for real-time updates.

---

## 17. Responsive Design

### 17.1 Breakpoints

| Name | Width | Context |
|---|---|---|
| **Mobile** | < 768px | Phone portrait and small tablets |
| **Tablet** | 768px–1024px | Tablet portrait and small laptops |
| **Desktop** | > 1024px | Standard desktop and laptop |

### 17.2 Per-Component Responsive Rules

**Gallery Scroller (§12):**
- Mobile: 2-3 visible items, touch swipe primary
- Tablet: 3-4 visible items, touch swipe + arrows
- Desktop: 4-5 visible items, arrows + drag scroll

**Tier Buttons (§13):**
- Mobile: Stacked vertically, full width
- Tablet+: Horizontal row, equal width

**Image Page (§6):**
- Mobile: Image full width → title/dimensions → bid status + tier buttons (stacked) → narrative → video
- Desktop: Image 60-70% left → transaction zone right (bid status, tier buttons, links) → narrative below → video below

**Navigation (§3.1):**
- Mobile: Hamburger → full-screen overlay menu
- Desktop: Horizontal nav bar with all items visible

**Painting Grid on Series Page (§10):**
- Mobile: Single column
- Desktop: Two columns

**Dashboard (§11):**
- Mobile: Cards stacked vertically
- Desktop: Table layout

### 17.3 Touch Targets

All interactive elements must be at least 44px x 44px on mobile (Apple HIG / WCAG 2.5.5). Tier buttons, navigation links, and scroller items must be comfortably tappable.

---

## 18. Accessibility

### 18.1 Requirements

| Requirement | Standard |
|---|---|
| **WCAG** | Level AA compliance minimum |
| **Color contrast** | 4.5:1 for normal text, 3:1 for large text |
| **Alt text** | Every painting image must have descriptive alt text: "[Painting Title], acrylic on canvas, [W]" x [H]"" |
| **Keyboard navigation** | All interactive elements reachable via tab. Gallery scroller navigable via arrow keys. |
| **Screen reader** | Bid status, tier button states, and real-time updates announced via ARIA live regions |
| **Focus indicators** | Visible focus rings on all interactive elements |

### 18.2 Motion

- Gallery scroller animation respects `prefers-reduced-motion`
- "Bid in progress" pulsing indicator has a static fallback
- No auto-playing video; all video requires user initiation

---

## 19. Performance

### 19.1 Targets

| Metric | Target |
|---|---|
| **Largest Contentful Paint** | < 2.5s |
| **First Input Delay** | < 100ms |
| **Cumulative Layout Shift** | < 0.1 |

### 19.2 Image Strategy

52 paintings with high-resolution images are the primary payload concern.

| Context | Image Size |
|---|---|
| **Gallery scroller thumbnail** | 400px wide, WebP, quality 80 |
| **Image Page primary** | 1200px wide, WebP, quality 85 |
| **Lightbox full-resolution** | Original resolution, loaded on demand |
| **Open Graph** | 1200x630px, optimized for social platforms |

All images served via CDN with cache headers. Lazy loading for below-fold images. Gallery scroller uses intersection observer for progressive loading.

---

## 20. Phase 3 Open Question Resolutions

This section documents how Phase 3 resolves open questions from Phase 2 journeys.

| ID | Question | Resolution |
|---|---|---|
| J02d-01 | WTA page copy for mystery prize | §7.1 Section 3: "Beyond the 52 cataloged paintings, the full inventory of non-collection works is intentionally undisclosed. Part of the acquisition is the adventure of discovery." |
| J02e-03 | Outbid notification — show reward amount? | §11.1 and §15.2: Reward amount NOT shown until settlement. Dashboard shows "Reward at settlement if auction succeeds." Notification says "a thank-you from the artist." |
| J02f-01 | Dedicated press contact | §9.1 Section 4 and §3.2: Press inquiry email in footer and About page, routed to fiduciary or designated rep. |
| J02f-03 | About the Artist page | §9: Full page spec at `/about`. |

### Still Pending (External Dependencies)

| ID | Question | Blocks | Owner |
|---|---|---|---|
| AM-OQ-01 | Securities counsel review | Launch | William |
| AM-OQ-02 | Fiduciary lawyer selection | §7.1, §8.1, §14.4, footer | William |
| AM-OQ-04 | Painting inventory (52 paintings with dimensions) | Launch, exact pricing, threshold | William |
| J02a-08 | Wire transfer threshold | §13.4, §14.2/14.4 split | Fiduciary |
| J02c-01 | Credit card / lawyer-mediated threshold | §13.3, §13.4 | Fiduciary |
| J02f-02 | Image usage rights for press | §9.1 Section 4 | William + counsel |
| J02a-11 | Art-safe shipping costs by size | §6.3 | William (research) |

---

## 21. Appendix: Page Inventory

Complete list of every distinct page/view the platform must render:

| # | Page | URL | Auth | Real-Time Data |
|---|---|---|---|---|
| 1 | Homepage | `/` | No | Auction stats, WTA price, scroller bid status |
| 2 | Art Auction | `/auction` | No | Status bar, scroller bid status |
| 3 | Winner Takes All | `/winner-takes-all` | No | WTA price |
| 4 | How Bidding Works | `/how-bidding-works` | No | None |
| 5 | About the Artist | `/about` | No | None |
| 6 | Image Page (x52) | `/paintings/{slug}` | No | Bid status, bid-in-progress |
| 7 | Grief Series | `/series/grief` | No | Per-painting bid status |
| 8 | Bidder Dashboard | `/dashboard` | Yes | Active bids, auction stats |
| 9 | Registration | `/register` | No | None |
| 10 | Login | `/login` | No | None |
| 11 | Bid Confirmation Flow | Modal/overlay on Image Page | Yes | Payment status, race condition |

**Total distinct templates:** 11 (with 52 instances of the Image Page template and 1 instance of Series Page at launch).
