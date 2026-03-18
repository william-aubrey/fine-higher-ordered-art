# User Journey: The Magnate

*Specification v1-02d: Winner Takes All journey*
*Persona: P-01 (Magnate)*
*Status: Draft*
*Date: 2026-03-15*

---

## 1. How the Magnate Differs

The Magnate's journey is entirely unlike every other persona's. They do not browse the gallery to pick a painting. They do not choose a tier. They buy everything — all 52 Charlotte Collection paintings, every other painting William has ever created, all studio equipment, every brush. The WTA option is a single transaction at a single price, mediated entirely through the fiduciary lawyer.

The Magnate never interacts with the standard bidding flow. Their path is: **Discover → Evaluate → Engage lawyer → Contract → Wire transfer → Auction closes → Settlement → Delivery.**

---

## 2. Discovery

### How They Arrive

The Magnate is the rarest persona. There may be zero Magnates. There may be one. Discovery paths:

- **Press coverage** — a story about the auction reaches someone with the means and disposition to buy an artist's entire life work. The article probably focuses on the novel mechanism and the WTA number.
- **Auction house / advisor network** — if the fiduciary lawyer or auction house has connections to ultra-high-net-worth individuals or their advisors, a direct introduction may occur.
- **Social amplification** — the WTA counter on the homepage is inherently shareable. "This number is how much it costs to buy one artist's entire life work." That statement travels.
- **Art world reputation** — if the auction generates enough attention, art-world intermediaries (advisors, gallerists, wealth managers) may bring it to a client's attention.

### What Hooks Them

The Magnate is not hooked by a single painting. They're hooked by the **concept**:

- Acquiring an artist's complete body of work in one transaction
- The "mystery prize" — everything beyond the 52 cataloged paintings
- Personal delivery by the artist
- The story: "I own everything this artist ever created"
- The WTA price relative to comparable acquisitions (entire artist estates, major collection purchases)

---

## 3. The WTA Page

The Winner Takes All page is the Magnate's primary destination. It must convey:

### What You Get

- All 52 Charlotte Collection paintings
- Every other painting William has ever created (non-collection works, drafts, half-finished pieces)
- Paintings by others created in William's home and gifted to him
- All art studio equipment — every brush, every tube of paint, easels, supplies
- Personal delivery by William via U-Haul to any location within the continental United States (or buyer arranges their own pickup)
- The story: sole owner of an artist's complete creative output

The non-collection items are intentionally described as a "mystery prize" — not inventoried, not photographed, not cataloged. The Magnate is buying the known collection plus the unknown remainder. This is part of the appeal.

### The Price

The current WTA price, displayed prominently, updating in real time. Per `auction-mechanism.md` §7.1, the WTA price is the sum of the next-tier-up price for each painting:

- Unbid painting: contributes its Tier 1 price
- Tier 1 held: contributes Tier 2 price
- Tier 2 held: contributes Tier 3 price
- Tier 3 held: contributes Tier 4 price ($1,000/sq.in. — WTA only)

The WTA price escalates as individual bids accumulate. An early WTA is dramatically cheaper than a late one. This urgency should be communicated on the page — not as pressure, but as a factual explanation of the pricing mechanism.

### The CTA

The WTA page does not have a "Place Bid" button. It has an **"Arrange Purchase"** (or equivalent) CTA that leads to engagement with the fiduciary lawyer. The WTA transaction is entirely lawyer-mediated — there is no self-service path.

Below the CTA: the fiduciary lawyer's name, firm, bar credentials, and contact information. The Magnate (or their attorney, advisor, or wealth manager) can independently verify the lawyer and initiate contact.

### Gallery Scroller

Per the Principal's direction, the gallery scroller appears at the bottom of the WTA page. The Magnate can browse what they'd be acquiring — though the individual paintings are only part of the package.

---

## 4. Evaluation and Due Diligence

The Magnate's evaluation is not "do I like this painting?" It's "is this acquisition worth the price?" This involves:

### The Magnate's Team

A Magnate considering WTA likely involves:
- **Personal attorney** — reviews the auction terms, escrow structure, purchase contract
- **Financial advisor / wealth manager** — evaluates the acquisition in the context of the Magnate's portfolio
- **Art advisor** (possibly) — assesses the collection's value and significance
- **Tax advisor** — implications of the purchase, potential charitable donation value, estate planning

### What the Team Needs

| Need | How the platform provides it |
|---|---|
| Full auction terms | Publicly accessible per HC-03 |
| Escrow structure details | Fiduciary lawyer explains directly; lawyer-to-lawyer communication |
| Collection inventory | 52 paintings cataloged on the site with dimensions, images, descriptions |
| Artist verification | Artist bio, body of work visible on site, independently verifiable |
| Purchase contract | Drafted by fiduciary lawyer, reviewed by Magnate's attorney |
| WTA-specific terms | Explained on the WTA page: what's included, delivery terms, settlement process |

### Timeline

The Magnate's evaluation may take days, weeks, or the entire auction period. They may monitor the WTA price as individual bids come in, waiting for the right moment — early (cheapest) vs. late (most information about what's selling).

---

## 5. The Transaction

### Engagement

The Magnate or their representative contacts the fiduciary lawyer through the website's contact mechanism or directly.

### Contract

The fiduciary lawyer prepares a WTA purchase contract covering:
- Total WTA price (calculated at time of contract execution)
- What the Magnate receives (complete inventory + non-collection works + studio + delivery)
- Escrow terms — payment held until settlement
- Settlement timeline and process
- What happens to existing individual bidders (all refunded, all earn outbid rewards)
- Delivery terms — personal delivery by artist to one continental US location
- IP retention notice per HC-01

The contract is signed by the Magnate (or authorized representative) and the fiduciary.

### Payment

Wire transfer to the escrow account. The amount is the WTA price at the moment the contract is executed.

### Auction Closure

Per `auction-mechanism.md` §7.3, when the WTA payment is confirmed:

1. The auction **immediately closes** — no further individual bids accepted
2. The website updates to reflect WTA status
3. All existing individual bidders are notified and refunded immediately
4. Settlement process begins

---

## 6. Settlement and Delivery

### Disbursements

The fiduciary lawyer calculates and distributes:
- Outbid rewards to every prior bidder (each existing bidder was outbid by WTA at next-tier-up)
- Artist's proceeds (base + 50% of each spread on every painting that had prior bids)
- Fiduciary fees deducted from artist's proceeds

### Delivery

The Magnate receives personal delivery from the artist:
- William drives a U-Haul to the Magnate's specified location within the continental United States
- Alternatively, the Magnate arranges their own pickup from Charlotte, NC
- The delivery includes everything: all paintings (collection and non-collection), studio equipment, supplies, miscellaneous items
- No shipping boxes needed — this is a personal handoff

### What the Magnate Receives

- All 52 Charlotte Collection paintings with individual certificates of authenticity
- Non-collection works — not cataloged, delivered as-is
- Studio equipment and supplies — delivered as-is
- The permanent online gallery becomes the Magnate's provenance record — "The Charlotte Collection, acquired via Winner Takes All, [date]"

---

## 7. The Magnate's Story

The Magnate who buys WTA has an extraordinary story:
- They own an artist's complete creative output
- They ended an auction that dozens (or hundreds) of other people were participating in
- Every prior bidder earned a reward because of them
- The artist personally delivered everything in a U-Haul
- The online gallery permanently records their acquisition

This story has press value. The WTA event itself will generate coverage — which feeds back into the auction's narrative even after it's closed. The permanent gallery becomes a monument to the event.

---

## 8. Cross-Journey Interactions

| Interaction | How it happens |
|---|---|
| **All bidders → Magnate** | Every existing bid increases the WTA price. Bidders collectively price the Magnate in or out. |
| **Magnate → All bidders** | WTA immediately closes the auction. Every bidder is refunded and earns a reward. The Magnate's action benefits everyone who participated. |
| **Journalist → Magnate** | Press coverage of the auction reaches someone with the means to consider WTA. |
| **Magnate → Journalist** | A WTA event is the biggest story the auction can generate. Major press coverage. |
| **Champion ↔ Magnate** | A Champion's Tier 3 bid increases the WTA price significantly (especially on large paintings). If WTA happens, the Champion earns the largest individual reward. |

---

## 9. Open Questions (This Journey)

| ID | Question | Urgency | Resolution Path |
|---|---|---|---|
| J02d-01 | WTA page copy and tone — how to present the "mystery prize" non-collection items | Pre-launch | Phase 3 Product Design |
| J02d-02 | WTA contract template — scope and terms for the fiduciary lawyer to draft | Pre-launch | Fiduciary lawyer engagement |
| J02d-03 | Delivery logistics — insurance, timing, liability during transport | Pre-launch | Resolve with fiduciary lawyer and artist |

---

## 10. Decision Log (This Journey)

| # | Decision | Rationale | Date |
|---|---|---|---|
| 1 | WTA is entirely lawyer-mediated — no self-service bid path | The transaction size, complexity, and legal requirements make self-service inappropriate. The fiduciary lawyer is the Magnate's primary interface. | 2026-03-15 |
| 2 | WTA page CTA is "Arrange Purchase," not "Place Bid" | Signals that this is a formal legal transaction, not an e-commerce checkout. | 2026-03-15 |
| 3 | Non-collection items remain a "mystery prize" — not inventoried | Intentional. The unknown adds to the story. The Magnate is buying the known collection plus the adventure of the unknown. | 2026-03-15 |
| 4 | Fiduciary lawyer's credentials displayed prominently on website | Bar membership and contact info allow independent verification. Builds trust for both the Magnate and the Champion. | 2026-03-15 |
