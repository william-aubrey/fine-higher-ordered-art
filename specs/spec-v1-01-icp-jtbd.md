# ICP/JTBD Framework — Fine Higher Ordered Art

*Specification v1-01: Ideal Customer Profiles and Jobs-to-be-Done*
*Status: Draft — Principal reviewed persona definitions and matrix*
*Date: 2026-03-15*

---

## 1. Overview

This document defines the people who will interact with the Charlotte Collection auction — who they are, what they want, and how they relate to the product. Every persona here is Phase 1: the auction is a single one-time event, and any of these people could appear on day one.

The personas were developed from the auction mechanism specification (see `auction-mechanism.md`) and refined through collaborative design with the Principal. The three-tier pricing structure ($1/$10/$100 per square inch) naturally segments the market into distinct buyer populations with different motivations, decision processes, and trust requirements.

---

## 2. Personas

### P-01: The Magnate

**Tier:** Winner Takes All
**Who:** Ultra-high-net-worth individual. Thinks in collections, not pieces. The type of person who buys entire estates, wine cellars, or car collections. Elon Musk, Jeff Bezos — that tier of wealth and ambition.
**JTBD:** "I want to acquire an artist's entire life work in one move — the collection, the studio, the story."
**Success:** Owns everything — all 52 Charlotte Collection paintings, every other painting William has ever created, all studio equipment, every brush. Gets personal delivery by the artist via U-Haul. Has a story no one else can tell.
**Decision process:** The Magnate evaluates whether the total price is worth the total package. They scrutinize terms but don't agonize over individual paintings. The WTA counter on the front page is their price tag. An early WTA is dramatically cheaper than a late one — this creates urgency without artificial pressure.
**Trust requirements:** Legitimate escrow, clean legal terms, confidence that the transaction is what it claims to be. The Magnate's legal team will read everything.

---

### P-02: The Champion

**Tier:** 3 ($100/sq.in.)
**Who:** Wealthy individual with a personal connection to the work, the artist, or the concept. May be a serious art collector, a patron of emerging artists, or someone who sees a specific painting and decides it must be theirs regardless of cost. Tier 3 prices range from $1,600 (4"×4") to $345,600 (6'×4' Grief painting) — this persona spans a wide economic range but shares the willingness to pay premium.
**JTBD:** "I want to own a specific painting that moved me, and I'm willing to pay premium to guarantee I get it."
**Success:** Wins the painting. Knows they made a statement by bidding Tier 3. Their bid cannot be outbid by individual bidders — only the Magnate's WTA can displace them (and if it does, they earn a massive reward).
**Decision process:** The Champion has already decided they want the painting. Their decision is whether the Tier 3 price is acceptable. For a 4"×4" at $1,600, this is a personal purchase decision. For a Grief painting at $345,600, this involves financial advisors, possibly legal counsel, and significant deliberation. The website must serve both ends.
**Trust requirements:** High. At these prices, provenance, artist legitimacy, escrow security, and legal clarity are non-negotiable.

---

### P-03: The Connoisseur

**Tier:** 1–2 (high dollar range: ~$3,000–$35,000)
**Who:** Experienced art buyer who maintains a collection with intention. Thinks about portfolio — not just "do I like this painting?" but "how does this fit my collection's story and value trajectory?" Likely has bought original art before. Knows what a certificate of authenticity means and why it matters.
**JTBD:** "I want to add a meaningful original work to my collection — one with a strong story and fair value at this stage of the artist's career."
**Success:** Wins a painting they believe in, at a price they can justify in their portfolio. Certificate of authenticity in hand. Clean provenance. The auction's novel structure is itself part of the painting's story — provenance includes *how* it was acquired.
**Decision process:** Deliberate. The Connoisseur researches the artist, evaluates the work, considers the price relative to comparable pieces. At Tier 2 on a large painting ($8,640–$34,560), this is a significant financial commitment. They need trust signals: professional photography, artist credentials, transparent terms, legitimate escrow. They may want to communicate with the artist before bidding.
**Trust requirements:** Very high. Professional presentation, verifiable identity, escrow details, clear terms. The Connoisseur has been burned by amateur art sales before — or knows someone who has.

---

### P-04: The Collector

**Tier:** 1–2 (low dollar range: ~$16–$1,500)
**Who:** Person who appreciates art and buys pieces they connect with. May be building their first collection or adding to a casual one. Not primarily motivated by investment — they want a painting on their wall that means something to them. The auction's accessible Tier 1 pricing opens original art to people who might normally buy prints.
**JTBD:** "I want to own an original painting that speaks to me, at a price I can afford."
**Success:** Wins a painting, hangs it on their wall, tells the story of how they got it. The auction itself becomes part of the painting's narrative — "I got this through a one-time auction of an artist's entire collection."
**Decision process:** Relatively low-friction at Tier 1. A 4"×4" at $16 is an impulse-accessible purchase. A 12"×12" at $144 requires a moment's thought. Tier 2 on a small painting ($160) is still accessible. The Collector browses the gallery, finds a painting that resonates, and bids. The decision is emotional first, financial second.
**Trust requirements:** Moderate. Needs to trust that payment is secure (escrow, PCI compliance), that the painting is real, and that they'll actually receive it. Doesn't need the same depth of provenance verification as the Connoisseur.

---

### P-05: The Patron

**Tier:** 1–2
**Who:** Friends, community members, people who know William or know the story. They're bidding because they want to be part of this moment — to support the artist, to participate in something meaningful. The painting is a bonus; the participation is the point. If they get outbid and earn a reward, that's a great story. If they win the painting, that's a great story too.
**JTBD:** "I want to support William and be part of this moment."
**Success:** Participated. Whether they win the painting or get outbid (and rewarded), they were *there*. They're in the story. They can say "I was one of the bidders in that auction."
**Decision process:** Driven by relationship and narrative, not art evaluation or financial calculus. They bid because they believe in the person and the project. Price sensitivity varies — some Patrons are comfortable at Tier 2, others stretch to afford Tier 1 on a small painting. The emotional bar is low; the financial bar depends on their means.
**Trust requirements:** Low to moderate. They already trust the artist (they know him). They need to trust the platform and payment process, but the personal relationship provides a trust foundation that strangers don't have.

---

### P-06: The Gambler *(threat persona — design against)*

**Tier:** 1
**Who:** Someone who discovers the auction's reward mechanic — probably through social media or a news article — and sees it as a low-risk financial play. Pay $144 for a 12"×12" Tier 1 bid, hope someone bids Tier 2, pocket $648 in reward. The painting is irrelevant to them. They're running a spreadsheet, not browsing a gallery.
**JTBD:** "I want to place a cheap bid and profit when someone outbids me."
**Success (their definition):** Financial return exceeding their bid amount.
**Anti-goal (our definition):** The product must make this person's JTBD feel unwelcome. This is the most legally sensitive persona — their behavior pattern maps directly onto the Howey test for securities (investment of money → common enterprise → expectation of profit → derived from efforts of others). If the auction is perceived as attracting Gamblers, it risks securities regulation.

**Design imperatives:**
- **Terms:** Frame every bid unambiguously as a purchase commitment for a physical painting. The reward is an incidental benefit of the auction structure, not the primary purpose. Per the Principal: *"We need to be careful here to make sure we do not represent the bids as an investment. We need to be clear that the winner may only lose their money and get a painting and nothing else."*
- **UX:** Emphasize the painting on every screen. No ROI calculators, no spread math, no "potential reward" prominently displayed. The reward mechanic is explained in the terms — it is not a selling point.
- **Marketing:** Never position the auction as a financial opportunity. The story is about art, the artist, and the collection — not about making money.
- **Legal:** Securities counsel must review the Gambler persona specifically and advise on terms language, disclosures, and structural mitigations. **Hard prerequisite before launch.**

**Decision process:** Pure financial calculus. They look for the lowest-cost bid with the highest probability of being outbid. Small paintings at Tier 1 are their target. They may bid on many paintings to diversify.
**Trust requirements:** They need to trust they'll actually get paid the reward. Ironically, the escrow and fiduciary structure that protects legitimate bidders also reassures the Gambler.

---

### P-07: The Spectator

**Tier:** None (non-bidder)
**Who:** Anyone who finds the auction concept fascinating enough to follow but doesn't bid. Art enthusiasts, auction watchers, friends-of-friends, social media followers. They may not have the money, the interest in owning art, or the risk tolerance — but the *story* hooks them. The real-time WTA counter ticking up. The Grief Series drama. Which paintings have bids, which are still open.
**JTBD:** "I want to follow this auction because the concept is fascinating and the stakes are real."
**Success:** Stays engaged over time. Watches the WTA counter evolve. Checks back to see which paintings have bids. Shares with friends. Comes back on December 31 to see if the threshold was met.
**Decision process:** No purchase decision. Their "conversion" is engagement — bookmarking, returning, sharing.
**Trust requirements:** None for themselves, but they amplify trust (or distrust) to others. A Spectator who shares enthusiastically may bring in a Champion. A Spectator who shares skeptically may bring in a hostile Journalist.

**Design imperatives:**
- The website must be compelling to browse even without bidding intent
- Real-time auction status (WTA counter, bid activity, threshold progress) gives Spectators a reason to return
- Social sharing should be frictionless — painting pages need to generate good link previews

---

### P-08: The Journalist

**Tier:** None (non-bidder)
**Who:** Media professionals, bloggers, influencers, podcasters — anyone looking for a story. Two sub-types with opposing intent:

**The Admirer:** Sees a human interest angle. "Artist sells life's work to fund cabin in the mountains." "Novel auction lets early bidders profit from being outbid." Wants the story to be real and the artist to be genuine.

**The Skeptic:** Sees a cautionary tale or controversy. "Is this an unregistered securities offering disguised as an art auction?" "Artist creates scheme where early bidders are incentivized to recruit later bidders." Wants to find the flaw.

**JTBD:** "I want a story — human interest, art world disruption, or cautionary tale."
**Success:** Gets enough material to write the piece. The auction terms, the artist's story, the numbers, the legal structure — it all either holds up under examination (Admirer succeeds) or reveals cracks (Skeptic succeeds).
**Decision process:** They evaluate the auction as content, not as a purchase. Is it novel enough to write about? Is there a narrative arc? Are there numbers that make good headlines?
**Trust requirements:** They need the facts to be verifiable. Transparent terms, a real artist with a real body of work, a legitimate escrow structure. The Admirer needs these to write a credible positive piece. The Skeptic needs access to the same information to write a credible critical piece.

**Design imperatives:**
- Auction terms must be publicly accessible, complete, and unambiguous — they will be quoted
- The artist's story must be authentic and verifiable (real paintings, real history, real mountain property)
- The website must look professional — amateur presentation undermines the Admirer and feeds the Skeptic
- Consider a press/media section or at minimum an easily findable contact for press inquiries

---

## 3. Use Case Families

Use case families are clusters of related actions that share a context. Each family represents a distinct mode of interaction with the auction platform.

### UCF-1: Discovery

Finding the auction, learning what it is, exploring the gallery. Browsing paintings, reading the artist's story, understanding the tier system. This is every persona's entry point — the first impression determines whether they engage further or leave.

### UCF-2: Bidding

Selecting a painting, choosing a tier, paying, receiving confirmation. Includes the trust-building that precedes payment — understanding the terms, seeing real-time bid status, knowing funds go to a third-party escrow. The bidding flow must handle price points from $16 to $345,600 with appropriate friction at each level.

### UCF-3: Getting Outbid

Being notified you've been outbid, receiving your immediate refund, understanding your reward claim. This is its own family because the emotional arc is distinct from bidding — you lost the painting but gained something else. The experience of this moment is the single most important UX challenge in the product. It must reinforce "you supported the artist and you'll be rewarded at settlement" — not "here's your ROI."

### UCF-4: Winning

Auction closes, thresholds met, you won your painting. Arranging pickup or shipping, receiving the certificate of authenticity. The transition from "active bidder" to "painting owner." For the Magnate, this includes coordinating personal delivery of the entire studio.

### UCF-5: Settlement & Reward

Auction closes, you're an outbid bidder with a reward claim. Receiving your reward payment from the fiduciary. Understanding the tax implications (rewards may be taxable income — 1099s may be issued). This is a financial event, not an art event, and the communication must be precise.

### UCF-6: Following

Watching the auction unfold without bidding (or between bids). Checking the WTA counter, seeing which paintings have bids, following the Grief Series narrative, sharing on social media. This is the engagement loop that keeps Spectators returning and may convert Spectators into bidders — or bring in new personas through social amplification.

### UCF-7: Scrutinizing

Reading the terms closely, evaluating the mechanism, forming an opinion, writing about it. This is the Journalist's primary family but also applies to Champions and Connoisseurs doing due diligence before a large bid. The terms page, FAQ, and auction mechanism explanation must hold up under hostile reading. Every claim must be verifiable.

### UCF-8: Auction Failure

Thresholds not met. All escrowed funds returned to active bidders. No rewards paid. Paintings stay with the artist. This is a real scenario — and every persona who participated needs a dignified exit. Communication must be clear, refunds must be prompt, and the website must handle the transition gracefully (the post-failure state of the website is itself a design decision).

---

## 4. Persona × Use Case Matrix

This matrix maps each persona to the use case families they interact with. **●** marks a primary interaction (core to their experience). **○** marks a secondary interaction (may happen, not their main path). Empty cells indicate the persona does not engage with that family.

| | UCF-1 Discovery | UCF-2 Bidding | UCF-3 Outbid | UCF-4 Winning | UCF-5 Settlement | UCF-6 Following | UCF-7 Scrutinizing | UCF-8 Failure |
|---|---|---|---|---|---|---|---|---|
| **P-01 Magnate** | ● | ● | | ● | ● | | ● | ● |
| **P-02 Champion** | ● | ● | | ● | ● | ○ | ● | ● |
| **P-03 Connoisseur** | ● | ● | ○ | ● | ● | ○ | ● | ● |
| **P-04 Collector** | ● | ● | ○ | ● | ○ | ○ | ○ | ● |
| **P-05 Patron** | ● | ● | ● | ● | ● | ● | | ● |
| **P-06 Gambler** | ● | ● | ● | | ● | ● | | ● |
| **P-07 Spectator** | ● | | | | | ● | | ○ |
| **P-08 Journalist** | ● | | | | | ● | ● | ● |

### Matrix Analysis

**UCF-3 (Getting Outbid)** is primary for the Patron and the Gambler — same event, fundamentally different emotional response. The Patron celebrates being part of the story. The Gambler calculates their return. The UX for the outbid notification must reinforce the Patron's framing ("you supported the artist") without feeding the Gambler's framing ("you earned X% on your bid"). This is the most important UX design challenge in the product.

**UCF-7 (Scrutinizing)** is primary for the Journalist, the Champion, and the Connoisseur. These are the people reading every word of the terms. The Journalist is looking for the story (positive or negative). The Champion and Connoisseur are doing due diligence before committing serious money. The terms page must serve all three — surviving hostile reading while building confidence for high-commitment buyers.

**UCF-8 (Auction Failure)** touches every persona who participated. The auction failing is a real and legitimate outcome. Every persona needs a dignified exit: prompt refunds, clear communication, and a website that transitions gracefully rather than simply going dark.

**The Magnate never gets outbid.** WTA immediately closes the auction. The Magnate's journey is the shortest and highest-stakes: Discovery → Scrutinize → Bid → Win. No ambiguity, no waiting.

**The Gambler never wins a painting.** Their JTBD is the reward, not the painting. If no one outbids them, they're stuck with a painting they didn't want. This is actually a natural deterrent — the terms should make clear that winning means you own a painting and owe shipping costs, not that you made a bad bet.

---

## 5. Open Questions

### From This Phase

| ID | Question | Owner | Urgency | Resolution Path |
|---|---|---|---|---|
| ICP-OQ-01 | How should the outbid notification frame the reward to serve Patrons without attracting Gamblers? | Instance (UX) | Pre-launch | Resolve during UCF-3 user journey (Phase 2) |
| ICP-OQ-02 | Should the website include a press/media section or contact for Journalists? | Principal | Pre-launch | Decision during website product design (Phase 3) |
| ICP-OQ-03 | Does the Connoisseur need a communication channel with the artist before bidding? | Principal | Pre-launch | Resolve during UCF-2 user journey (Phase 2) |
| ICP-OQ-04 | What is the post-failure state of the website? Archive? Takedown? Redirect? | Principal | Pre-launch | Resolve during UCF-8 user journey (Phase 2) |

### Carried Forward (from auction mechanism spec)

| ID | Question | Owner | Urgency | Resolution Path |
|---|---|---|---|---|
| AM-OQ-01 | Securities counsel review of reward mechanic under Howey test | Principal (external) | **Hard prerequisite** | Find and engage securities attorney |
| AM-OQ-02 | Fiduciary partner selection (attorney, escrow company, or auction house) | Principal (external) | **Hard prerequisite** | Research and select partner |
| AM-OQ-03 | Accepted payment methods by bid amount | Fiduciary | Pre-launch | Fiduciary to advise after selection |
| AM-OQ-04 | Painting inventory — 52 paintings with exact dimensions | Principal (physical) | **Blocks launch** | William to measure and catalog |
| AM-OQ-05 | Art-safe shipping cost estimates by painting size | Instance | Pre-launch | Research after inventory complete |

---

## 6. Key Decisions

| # | Decision | Rationale | Date |
|---|---|---|---|
| 1 | Eight personas, all Phase 1 | The auction is a single one-time event — any persona could appear from day one. Phased rollout doesn't apply. | 2026-03-15 |
| 2 | The Gambler is a threat persona — design against, not for | The reward mechanic creates a financial incentive that maps onto the Howey test. The product must frame bids as art purchases, not investments. Terms, UX, and marketing must discourage reward-seeking behavior. | 2026-03-15 |
| 3 | Gift buying is a use case, not a persona | A Collector or Patron buying a painting as a gift doesn't change their fundamental motivation or decision process enough to warrant a separate persona. | 2026-03-15 |
| 4 | Collectors split into Collector (accessible) and Connoisseur (serious money) | The decision process, trust requirements, and UX needs at $16 vs. $34,560 are fundamentally different even though the "art + portfolio" motivation is shared. The split is by economic gravity, not by tier. | 2026-03-15 |
| 5 | Patrons split into Patron (community/support) and Gambler (financial return) | Same tier range, opposite motivations. The Patron bids to participate; the Gambler bids to profit. This split is the central tension of the auction's legal and UX design. | 2026-03-15 |
