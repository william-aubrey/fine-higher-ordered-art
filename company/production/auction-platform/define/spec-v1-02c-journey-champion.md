# User Journey: The Champion

*Specification v1-02c: Premium bidder journey — Tier 3 commitment*
*Persona: P-02 (Champion)*
*Status: Draft*
*Date: 2026-03-15*

---

## 1. How the Champion Differs

The Champion shares the site experience, navigation, and gallery browsing with all other personas (see `spec-v1-02a`). What's different is the commitment level, the decision process, and the trust requirements. A Champion is bidding Tier 3: $1,600 for a 4"×4" painting up to $345,600 for a 6'×4' Grief painting. At the upper end, this is a major financial commitment that requires legal engagement, not a website checkout flow.

The Champion's journey also includes the **sequential tier progression** — they must bid through Tier 1 and Tier 2 before reaching Tier 3 (see `auction-mechanism.md` §4.5). This means the Champion interacts with the self-service credit card flow (at lower tiers) AND the lawyer-mediated flow (at Tier 3, if above the credit card threshold).

---

## 2. Discovery

### How They Arrive

The Champion arrives through the same channels as everyone else (press, social, auction house promotion) but is hooked by different elements:

- **The art itself** — a Champion who wants a specific painting because it moved them. They may have seen it in an article, on social media, or through the gallery scroller. The emotional connection is primary.
- **The collection as a cultural event** — a Champion who sees the auction as a moment in art history and wants to own a piece of it at the premium tier. The story of the auction is part of the provenance.
- **Patronage / advocacy** — a Champion who wants to support the artist at the highest individual level. Their Tier 3 bid is a statement about the value of the work.

### The Champion's First Visit May Not Be Their Last

Unlike the Collector who might bid in one session, the Champion's discovery-to-bid timeline is likely longer:

1. **First visit:** Browse the gallery, find a painting that resonates, note the Tier 3 price. Read the artist's story and the auction terms.
2. **Research:** Look up the artist outside the site. Verify legitimacy. Possibly discuss with an advisor, partner, or attorney.
3. **Return visit:** Re-engage with the painting. Read the terms more carefully. Note the fiduciary lawyer's credentials.
4. **Decision:** Commit to bidding. Begin the sequential tier process.

---

## 3. The Bidding Threshold

### Two UX Modes

The bidding experience splits at a credit card threshold (`$XXXX` — to be determined by fiduciary lawyer):

**Below threshold (self-service):**
Standard credit card flow per `spec-v1-02a` §9. Click the active tier button, confirm, enter payment, bid placed. This covers most Tier 1 bids and some Tier 2 bids on smaller paintings.

**Above threshold (lawyer-mediated):**
The tier button changes from a standard "Place Bid" to an **"Arrange Purchase"** (or similar) CTA that signals a different process. Clicking it initiates engagement with the fiduciary lawyer rather than a payment form. The buyer:

1. Fills out a contact/inquiry form or is provided with the lawyer's direct contact information
2. Engages with the lawyer to review terms, verify escrow arrangements, and ask questions
3. Signs a formal purchase contract
4. Pays via wire transfer to the escrow account
5. Bid is placed once payment is confirmed by the fiduciary

The fiduciary lawyer's information is **prominently displayed on the website**: name, firm, bar association membership, contact details. A Champion or their attorney can independently verify the lawyer's credentials before engaging.

> **Open — J02c-01:** What is the exact dollar threshold for the credit card / lawyer-mediated split? The fiduciary lawyer should advise based on credit card processing limits, fee economics, and compliance requirements. Likely in the $5,000–$10,000 range.

### Why This Works

At high dollar amounts, the Champion is not trusting a website — they're trusting a licensed attorney whose credentials are verifiable through public bar records. This is a fundamentally stronger trust signal than any website design, SSL certificate, or FAQ page could provide. The lawyer can answer questions, explain the escrow structure, and provide the confidence needed for a five- or six-figure commitment.

---

## 4. Sequential Tier Progression — The Champion's Path

The Champion wants Tier 3. Per `auction-mechanism.md` §4.5, they must progress through tiers sequentially. This creates a multi-step journey:

### Scenario A: Champion Runs the Full Ladder (No Other Bidders)

The painting is Open. The Champion bids through all three tiers:

**Step 1: Bid Tier 1** ($144 on a 12"×12" painting)
- Below credit card threshold — standard self-service flow
- Payment to escrow, bid confirmed

**Step 2: Bid Tier 2** ($1,440)
- May be below or above credit card threshold depending on painting size
- If below: self-service credit card flow
- If above: lawyer-mediated "Arrange Purchase" flow
- Tier 1 payment refunded immediately
- Tier 1 outbid reward earned (payable at settlement)

**Step 3: Bid Tier 3** ($14,400)
- Likely above credit card threshold — lawyer-mediated flow
- Signs purchase contract, wire transfer to escrow
- Tier 2 payment refunded immediately
- Tier 2 outbid reward earned (payable at settlement)

**Net position:** Painting secured at Tier 3. Holding $14,400 in escrow. Will receive ~$7,048 in self-outbid rewards at settlement (50% of each spread). Effective cost: ~$7,352.

### Scenario B: Champion Encounters Other Bidders

The Champion bids Tier 1 intending to run the ladder, but between steps, another bidder grabs Tier 2. Now:

- The Champion's Tier 1 bid is refunded (outbid by the other Tier 2 bidder)
- The Champion earns a Tier 1 outbid reward claim
- Tier 3 becomes available — the Champion bids Tier 3 through the lawyer-mediated flow
- The other Tier 2 bidder is refunded and earns a Tier 2 outbid reward claim

The race condition between tiers creates real tension. A Champion who pauses between Tier 1 and Tier 2 risks losing the intermediate tier to someone else. This is a feature — it makes the auction dynamic and unpredictable.

### Scenario C: Champion Bids Tier 3 on a Large Painting

A 6'×4' Grief painting at Tier 3: $345,600. The Champion's full ladder:
- Tier 1: $3,456 (credit card, self-service)
- Tier 2: $34,560 (lawyer-mediated, contract, wire transfer)
- Tier 3: $345,600 (lawyer-mediated, contract, wire transfer)

This is a multi-day or multi-week process. Each step involves legal engagement for the upper tiers. The fiduciary lawyer manages the sequential escrow movements.

Self-outbid rewards at settlement: ~$171,072. Effective cost: ~$174,528.

---

## 5. The Champion's Trust Requirements

At Tier 3 prices, the Champion needs:

| Trust Signal | How It's Provided |
|---|---|
| **Legitimate escrow** | Fiduciary lawyer's credentials on the site, independently verifiable via bar association |
| **Clear legal terms** | Formal purchase contract for amounts above credit card threshold — reviewed and signed, not just a checkbox |
| **Real art** | High-resolution photography, scale diagrams, detailed provenance. For very large commitments, the Champion or their representative may want to view the painting in person before bidding Tier 3 |
| **Artist legitimacy** | The artist's identity, body of work, and story must be authentic and verifiable. The post-auction gallery (permanent public record) adds provenance value |
| **Escrow verification** | The Champion's attorney can contact the fiduciary lawyer directly to verify the escrow arrangement |
| **Terms transparency** | Full auction terms publicly available per HC-03. The Champion's lawyer will read them |

> **Open — J02c-02:** Should the platform offer in-person viewing for prospective high-tier bidders? A Champion considering $345,600 on a Grief painting may want to see it physically. William is in Charlotte, NC. This could be arranged case-by-case through the fiduciary lawyer. Not a platform feature — a concierge accommodation.

---

## 6. Getting Outbid — WTA

The Champion at Tier 3 can only be outbid by the Magnate's Winner Takes All. If WTA is triggered:

1. The auction immediately closes
2. The Champion's Tier 3 payment is refunded from escrow
3. The Champion earns a massive outbid reward at settlement:
   - Tier 3→Tier 4 spread: ($1,000 - $100) × sq.in. × 50%
   - For a 6'×4' Grief painting: ($1,000 - $100) × 3,456 × 50% = **$1,555,200**

The Champion who was outbid by WTA has the most dramatic story in the entire auction — they committed $345,600 to a painting and walked away with $1.5M+ in reward. The notification must handle this extraordinary moment with appropriate gravity:

- Lead with what happened: "A Winner Takes All bid has been placed. The Charlotte Collection auction has closed."
- Explain the refund: "Your Tier 3 bid of $345,600 has been refunded in full."
- Explain the reward: "As a Tier 3 supporter of *[Painting Title]*, you will receive a reward of $1,555,200 at settlement. The artist thanks you for believing in this work."
- No celebration of ROI. No investment language. The reward is framed as the artist's gratitude for the Champion's commitment.

---

## 7. Winning

If the auction closes and the Champion holds Tier 3, they win the painting. The winning experience is the same as 02a §12, with one distinction: the Champion likely engaged with the fiduciary lawyer during bidding, so settlement communication flows through that existing relationship as well as through the platform.

The Champion's certificate of authenticity and the painting's permanent gallery page carry additional weight at Tier 3 — this is a significant provenance record. "Acquired at Tier 3 during the Charlotte Collection auction" is part of the painting's history.

---

## 8. Cross-Journey Interactions

| Interaction | How it happens |
|---|---|
| **Journalist → Champion** | A press article about the auction reaches someone with the means and motivation to bid Tier 3 |
| **Collector → Champion** | A Collector who is outbid at Tier 2 decides the painting is worth Tier 3 — they become a Champion by escalation |
| **Champion → Spectator** | A Champion's Tier 3 bid on a Grief painting is visible on the site. Spectators watch the drama. |
| **Champion → Journalist** | A $345,600 bid on a painting is newsworthy. The bid itself generates press coverage. |
| **Champion ↔ Magnate** | A Magnate's WTA outbids the Champion. The Champion receives a massive reward. Both parties feature in the auction's story. |

---

## 9. Open Questions (This Journey)

| ID | Question | Urgency | Resolution Path |
|---|---|---|---|
| J02c-01 | Credit card / lawyer-mediated threshold amount | Pre-launch | Fiduciary lawyer to advise |
| J02c-02 | In-person viewing for high-tier bidders | Pre-launch | Case-by-case through fiduciary; not a platform feature |

---

## 10. Decision Log (This Journey)

| # | Decision | Rationale | Date |
|---|---|---|---|
| 1 | Fiduciary is a lawyer (member of the bar) | Verifiable credentials, can manage escrow, contracts, and buyer communication. Information prominently displayed on website. | 2026-03-15 |
| 2 | Above-threshold bids go through lawyer-mediated process with formal contract | A $50K+ commitment requires legal engagement, not a website checkout. Buyer signs a contract, pays by wire transfer. The lawyer provides trust that no website design can. | 2026-03-15 |
| 3 | Below-threshold bids use standard credit card self-service | Low-friction for accessible price points. Same flow as Collector/Connoisseur (02a). | 2026-03-15 |
| 4 | UX changes from "Place Bid" to "Arrange Purchase" above threshold | Visual signal that the process is different. Buyer knows to expect legal engagement, not instant checkout. | 2026-03-15 |
