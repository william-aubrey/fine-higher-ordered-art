# User Journey: The Patron

*Specification v1-02b: Story-motivated bidder journey*
*Persona: P-05 (Patron)*
*Status: Draft*
*Date: 2026-03-15*

---

## 1. How the Patron Differs

The Patron shares the same site experience, registration flow, and bidding mechanics as the Collector and Connoisseur (see `spec-v1-02a`). This document focuses only on what's different: the motivation, the discovery path, the emotional arc, and the outbid experience.

The Patron is not evaluating art as a portfolio piece. They're not comparison shopping. They encountered the auction's story — an artist selling his life's work through a novel mechanism to fund a cabin in the mountains — and it moved them. They bid because they want to be part of it. The painting is meaningful because of the story, not (primarily) because of aesthetic evaluation.

**Key assumption:** The artist does not have a meaningful personal network that would participate. The Patron discovers the auction the same way everyone else does — through press, social media, or word of mouth. There is no warm audience. The Patron persona is driven entirely by story resonance, not personal relationship.

---

## 2. Discovery

### How They Arrive

The Patron arrives through the same channels as the Collector (press, social sharing, word of mouth) but is hooked by a **different element** of the story:

- **The Collector** is hooked by the paintings themselves
- **The Patron** is hooked by the narrative: the artist, the auction concept, the stakes, the human drama

A press article that covers the mechanism and the artist's story is more likely to generate Patrons than one that focuses on the art itself. Social shares that tell the story ("this artist is selling everything he's ever painted through this wild auction") generate Patrons. Art-focused shares ("look at this painting") generate Collectors.

### What Converts Them

The Patron's conversion trigger is not "I found a painting I love" — it's "I want to be part of this." The site elements that convert Patrons:

- **The artist's story** — who William is, why he's selling, what the paintings mean to him, where he's going next. This must be authentic and accessible. Not a formal artist bio — the real human story.
- **The auction statistics** — seeing that other people are participating, that the threshold is (or isn't) being reached, that this is alive and happening. Social proof matters more to the Patron than to the Collector.
- **The WTA counter** — the sheer audacity of the number and what it represents. Even a Patron who would never bid WTA is fascinated by it.
- **The Grief Series narrative** — the most emotionally charged content on the site. A Patron may bid on a Grief painting not because they're art collectors but because the series' theme resonated with their own experience.

---

## 3. Painting Selection

### How the Patron Chooses

The Collector evaluates art. The Patron chooses differently:

- **Story resonance:** "This painting's narrative connects to something in my life"
- **Price accessibility:** Patrons are more likely to bid at Tier 1 on smaller paintings ($16–$144). The bid is symbolic — they're participating, not investing.
- **Emotional connection to the series:** A Patron who has experienced grief may bid on one of the Grief paintings specifically because of the theme, not the aesthetics.
- **"First available":** Some Patrons will bid on whichever painting speaks to them first, without methodically browsing the full gallery. The gallery scroller facilitates this — they flip through until something stops them.

### Price Sensitivity

The Patron's price range is typically Tier 1, occasionally Tier 2 on small to medium paintings. They're spending discretionary money on an experience. The decision is "can I afford to participate?" not "is this painting worth this price?"

At $16 (Tier 1, 4"×4"), the decision is nearly impulsive — less than a meal out.
At $144 (Tier 1, 12"×12"), it's a considered purchase but still accessible.
At $864 (Tier 1, 24"×36"), the Patron needs to really want to participate.
At $1,440 (Tier 2, 12"×12"), this is a committed Patron making a statement.

---

## 4. The Bidding Experience

The bid flow is identical to 02a §9. Registration, tier selection, terms acknowledgment, payment, confirmation — same mechanics.

What's different is the **internal narrative.** The Patron clicks "Place Bid" feeling:
- "I'm part of this now"
- "This is a cool thing to have done"
- "I hope the auction succeeds — I want this artist to make it"

The confirmation screen and post-bid experience should reinforce this narrative. Not just "Bid placed" but a sense of participation — they've joined something.

---

## 5. Getting Outbid — The Patron's Best Outcome

This is where the Patron's journey diverges most sharply from the Collector's.

**For the Collector,** getting outbid is a loss softened by a reward.
**For the Patron,** getting outbid is the best possible story.

The Patron bid $144 on a 12"×12" painting. Someone else bid Tier 2 ($1,440). The Patron gets:
- Full $144 refund (immediate)
- $648 reward at settlement (50% of the $1,296 spread)

The Patron's reaction: "I spent $144 to participate in this amazing auction. I got my money back AND I'll get $648 when it settles. I have the best story."

### The Narrative Tension

This is exactly the emotional response that makes the Gambler persona dangerous. The Patron's genuine delight in the outbid reward is indistinguishable from the Gambler's calculated play — except in intent. The product cannot (and should not try to) distinguish between them at the system level. The distinction lives in:

1. **Terms framing** — "You are purchasing a painting. If outbid, the artist thanks you with a reward." Not "invest $144, earn $648."
2. **Story emphasis** — the outbid notification leads with the painting and the artist, not the money.
3. **The painting itself** — if the Patron wins (isn't outbid), they own a painting. That's not a failed bet — it's what they committed to. The terms make this explicit: your bid is a purchase commitment.

### Outbid Notification — Patron Framing

The same notification goes to all outbid bidders (no persona-specific messaging), but the framing serves the Patron naturally:

- "You've been outbid on *[Painting Title]*"
- "Your payment of $144 has been refunded"
- "Someone believed in this painting enough to commit at a higher tier. As a thank-you for being an early supporter, you'll receive a reward of $648 at settlement if the auction succeeds."
- "Want to bid on another painting? [Browse the collection]"

This framing reads as gratitude to the Patron and as a purchase-refund-with-bonus to the Gambler's lawyer. Same words, dual-safe.

---

## 6. The Patron as Amplifier

The Patron's most valuable contribution may not be their bid — it's their story.

A Patron who bids $144 and gets outbid will tell that story. "I bid on a painting in this wild auction, got my money back, and I'm getting $648 when it closes." That story reaches the Patron's network, which may include:

- Other potential Patrons (story resonance spreads)
- Spectators (people who follow but don't bid)
- Potential Collectors or Connoisseurs (the art-interested friends of a non-art-collector)
- Journalists (the story itself is newsworthy)

The post-outbid state is the Patron's highest-amplification moment. The platform should make sharing easy — not pushy social sharing buttons, but a shareable painting page that generates good link previews and tells the story when pasted into a message or social post.

### Referral Loop

```
Press Article → Patron discovers auction → Patron bids → Patron gets outbid
→ Patron tells the story → New Patron / Collector / Spectator discovers auction
→ Repeat
```

This loop is the primary organic growth mechanism for the auction. It requires:
1. A story worth telling (the auction mechanism provides this)
2. A low barrier to entry (Tier 1 prices provide this)
3. A satisfying outbid experience (the reward mechanic provides this)
4. Easy sharing (the platform must provide this)

---

## 7. Winning — The Patron's Surprise

If the Patron is NOT outbid, they win the painting. For the Patron, this may be a surprise — they may have expected (or even hoped) to be outbid. Now they own an original painting.

The winning notification should make them feel good about this outcome:
- "You won *[Painting Title]*! This original painting by William Ryan Aubrey is yours."
- Emphasize what they have: an original painting from the Charlotte Collection, with certificate of authenticity, part of a one-time auction that will never be repeated.
- Shipping instructions and next steps.

The Patron who wins is now a Collector by circumstance — they own original art. The post-auction gallery page for their painting becomes part of their personal story.

---

## 8. Auction Failure — The Patron's Disappointment

If the auction fails, the Patron's reaction is different from the Collector's:

- **The Collector** is disappointed they didn't get the painting.
- **The Patron** is disappointed the story didn't work out. They wanted the artist to succeed. The refund is fine — they were never primarily about the money or the painting. They're sad for William.

The failure notification is the same for all personas (see 02a §13), but the Patron feels it more personally because their JTBD was "be part of something meaningful" — and the something didn't come through.

---

## 9. Cross-Journey Interactions

| Interaction | How it happens |
|---|---|
| **Journalist → Patron** | A human-interest article about the artist and the auction concept moves the reader to participate |
| **Spectator → Patron** | A Spectator who has been following the auction decides to bid after all — story engagement converted them |
| **Patron → Spectator** | A Patron who bids tells friends, creating Spectators who follow the auction |
| **Patron → Patron** | A Patron's outbid story inspires someone else to bid — the referral loop |
| **Patron (outbid) → Collector** | A Patron who is outbid browses for another painting and discovers they actually like the art — becomes a Collector |
| **Patron → Gambler (perception)** | A Patron's genuine enthusiasm about the reward ("I got $648!") sounds like gambling promotion to a Skeptic Journalist |

---

## 10. Open Questions (This Journey)

No new open questions. The Patron's journey uses the same mechanics as the Collector/Connoisseur (02a). All open questions from 02a apply.

---

## 11. Decision Log (This Journey)

| # | Decision | Rationale | Date |
|---|---|---|---|
| 1 | Patron discovers through press/social, not personal network | The artist does not have a meaningful personal network that would participate. Patron persona is driven by story resonance, not relationship. | 2026-03-15 |
| 2 | No persona-specific outbid messaging | The same notification serves both Patron and Gambler safely. Gratitude framing works for the Patron; purchase-refund-with-bonus framing satisfies legal review for the Gambler. | 2026-03-15 |
| 3 | Sharing should be easy but not pushy | Good link previews and shareable painting pages, not aggressive social sharing prompts. The Patron will share naturally if the story is worth telling. | 2026-03-15 |
