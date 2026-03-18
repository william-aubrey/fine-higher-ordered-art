# User Journey: The Spectator & The Journalist

*Specification v1-02f: Non-bidder journeys — engagement and scrutiny without purchase*
*Personas: P-07 (Spectator), P-08 (Journalist)*
*Status: Draft*
*Date: 2026-03-15*

---

## 1. Why One Document

The Spectator and Journalist are both non-bidders who engage with the auction as observers. Neither goes through registration, bidding, or settlement. Their journeys are about **what they see, what they share, and what they write** — which determines what bidders see before they arrive. These two personas control the auction's public narrative.

They differ in intent: the Spectator watches for entertainment and personal interest; the Journalist watches for a story. But they interact with the same pages and the same public information.

---

## 2. The Spectator

### Who They Are

Anyone who finds the auction concept fascinating enough to follow but doesn't bid. Art enthusiasts, auction watchers, friends-of-friends, social media followers. They may not have the money, the interest in owning art, or the risk tolerance — but the story hooks them.

### Discovery

The Spectator arrives through:
- **Social media** — someone shares a painting page, the WTA counter, or a reaction to the auction concept
- **Press** — a news article about the auction
- **Word of mouth** — "have you seen this art auction thing?"

The Spectator's first click is driven by curiosity, not purchase intent.

### What Keeps Them Engaged

The Spectator returns because the auction is a **live, evolving story.** The site must give them reasons to come back:

| Content | Why it works |
|---|---|
| **WTA counter** | A single number that encapsulates the entire auction's drama. It moves. It's incomprehensibly large (or not yet). |
| **Auction statistics** | Percentage of threshold reached. Number of paintings with bids. Number of bidders. Total square inches. These numbers change over the auction's 6-month life. |
| **Bid activity** | Which paintings just received bids. Which tier. New bid status visible on the gallery scroller and Image Pages. |
| **The Grief Series** | Six large paintings with an emotionally charged narrative. The Spectator follows which ones have bids, which don't, and at what tier. |
| **The countdown** | Days remaining until December 31. As the date approaches, tension builds — will the threshold be met? |

### What They Do

- Browse the gallery scroller — flip through paintings casually
- Visit Image Pages for paintings that catch their eye — read the narrative, watch the video
- Check the homepage for auction stats and WTA counter
- Share painting pages or the homepage with friends
- Return periodically to check progress

### What They Don't Do

- Register
- Bid
- Contact the auction house
- Read the terms (usually)

### Conversion to Bidder

Some Spectators become bidders. The conversion triggers:
- A specific painting resonates and the Tier 1 price is accessible ("I could actually own this for $16")
- The auction is close to the threshold and they want to help push it over
- Someone they know bids and they want to participate too
- The countdown creates urgency — "if I'm going to do this, it has to be now"

The platform should not aggressively push conversion (no pop-ups, no "bid now!" banners). The gallery, the prices, and the urgency speak for themselves. The Spectator converts when they're ready.

### Sharing

The Spectator's primary value is amplification. The platform must make sharing natural:

- **Painting pages generate good link previews** — when pasted into social media, messaging apps, or email, the link preview should show: painting image, title, current bid status, and the site name. This requires proper Open Graph / social meta tags.
- **The homepage link preview** should feature the WTA counter or a compelling painting image — something that generates curiosity.
- **No aggressive social sharing buttons.** The Spectator shares by copying a URL, not by clicking a Facebook button. The platform needs good URLs and good previews, not social widgets.

---

## 3. The Journalist

### Who They Are

Media professionals, bloggers, influencers, podcasters — anyone looking for a story. Two sub-types:

**The Admirer** sees human interest: "Artist sells life's work to fund cabin in the mountains." They want the story to be real.

**The Skeptic** sees a cautionary tale: "Is this an unregistered securities offering disguised as an art auction?" They want to find the flaw.

Both are valuable — the Admirer drives Patrons and Collectors to the site; the Skeptic forces the platform to be bulletproof.

### Discovery

- **Art / culture media** — the auction's novel mechanism is newsworthy in itself
- **Financial / tech media** — the reward mechanic, the game theory, the WTA structure appeal to analytical audiences
- **Local media** — "Charlotte artist sells life's work" is a local human interest story
- **Social media** — a viral moment (a large bid, a WTA trigger, the threshold being reached) creates news

### What They Need

**The Admirer needs:**
- The artist's real story — who William is, why he paints, why he's selling, where he's going
- High-resolution images they can use (with attribution per HC-01)
- The auction mechanism explained clearly enough to paraphrase accurately
- A human angle that isn't manufactured — authentic emotion, real stakes
- Numbers that make good headlines ("52 paintings," "$X million WTA price," "artist delivers everything via U-Haul")

**The Skeptic needs:**
- Full auction terms — publicly accessible per HC-03
- The reward mechanic explained in enough detail to analyze
- The escrow / fiduciary structure — who holds the money, what credentials do they have
- The legal posture — has this been reviewed by securities counsel?
- Any disclaimers or risk factors disclosed

Both need:
- Facts that are verifiable
- A website that looks professional (amateur presentation undermines both the positive and negative story)
- Access to information without requiring registration

### What They Scrutinize

| Element | Admirer asks | Skeptic asks |
|---|---|---|
| **The reward mechanic** | "How does this work? Can you explain it simply?" | "Is this a security? Has the SEC been consulted?" |
| **The escrow** | "Who holds the money? Are bidders protected?" | "Is the fiduciary properly licensed? What's the fee structure?" |
| **The artist** | "What's your story? Why are you doing this?" | "Is this a real artist with a real body of work?" |
| **The terms** | "Are these fair to bidders?" | "What happens if the auction fails? What are the exit conditions?" |
| **The WTA** | "Someone could really buy everything?" | "What's the legal structure of a WTA contract?" |
| **The Gambler angle** | "Is the reward a nice bonus for bidders?" | "Are you marketing this as an investment opportunity?" |

### Where They Look

1. **How Bidding Works page** — the primary terms and mechanism explanation. Must be comprehensive, clear, and unambiguous. Will be quoted.
2. **WTA page** — the most dramatic element. Numbers that make headlines.
3. **Image Pages** — specific paintings they might feature in their story.
4. **Auction statistics on homepage** — current state of the auction.
5. **The artist's story** — wherever it lives on the site (about page, Charlotte Collection narrative, video content).
6. **Fiduciary credentials** — the lawyer's name, firm, and bar association, prominently displayed.

### Press Contact

> **Open — J02f-01:** Should the website include a dedicated press/media contact? Options:
> - Contact form routed to the fiduciary lawyer or auction house
> - Email address for press inquiries (not the artist's personal email)
> - No dedicated press contact — let journalists find information from the public site
>
> A press contact increases the likelihood of accurate coverage (Admirer can ask clarifying questions) but also invites Skeptic inquiries that require careful handling. If a press contact exists, the fiduciary lawyer or a designated representative should field it — not the artist.

### The Story Arc

The auction generates multiple potential news moments:

| Moment | Story |
|---|---|
| **Launch** | "Charlotte artist launches novel auction for life's work" |
| **First bid** | "First painting sells in unique tiered auction" |
| **Threshold progress** | "Art auction reaches 50% of minimum — will it make it?" |
| **Large bid** | "Buyer commits $345,600 to single painting in Charlotte auction" |
| **WTA trigger** | "Buyer purchases entire art collection for $X million" |
| **Threshold met** | "Charlotte Collection auction succeeds — 52 paintings find new homes" |
| **Threshold failed** | "Charlotte Collection auction falls short — artist keeps everything" |
| **Settlement** | "Outbid bidders receive $X in rewards from art auction" |

Each moment is a potential press cycle. The platform should be ready for each — the information is already public (HC-03 requires it), but the presentation should be polished at each stage.

---

## 4. The Spectator and Journalist as Ecosystem Drivers

These non-bidder personas are the auction's **discovery and trust infrastructure:**

```
Journalist writes article → Spectators and Patrons discover auction
Spectator shares on social media → More Spectators, Collectors, potentially Champions
Journalist scrutinizes terms → Connoisseurs and Champions gain confidence (or don't)
Spectator follows the WTA counter → Social buzz around the number
Journalist covers a large bid → New wave of Spectators and potential bidders
```

The auction's success depends more on how well it serves Spectators and Journalists than on how well it converts them to bidders. They are the pipeline. Every bidder passed through their influence.

---

## 5. Site Requirements for Non-Bidders

| Requirement | Serves | Rationale |
|---|---|---|
| **No registration to browse** | Both | The gallery must be fully accessible without any gate. Already decided in 02a. |
| **Good link previews (Open Graph tags)** | Spectator | Social sharing is the Spectator's primary action. Bad previews = no sharing. |
| **Professional photography and design** | Both | The Admirer needs it for a positive story. The Skeptic notes its absence. |
| **Comprehensive terms page** | Journalist | HC-03 requires it. The Journalist will read every word. |
| **Fiduciary credentials visible** | Journalist | Independent verification of the escrow structure. |
| **Real-time auction data** | Spectator | Changing numbers give Spectators a reason to return. |
| **Painting narratives and video** | Both | Content that tells the story — for the Spectator's entertainment and the Journalist's article. |
| **Clean, shareable URLs** | Both | `fhoa.org/paintings/acceptance` not `fhoa.org/page?id=42&view=detail` |

---

## 6. Open Questions (This Journey)

| ID | Question | Urgency | Resolution Path |
|---|---|---|---|
| J02f-01 | Dedicated press/media contact on the website | Pre-launch | Resolve during Phase 3 Product Design. Depends on fiduciary capability. |
| J02f-02 | Image usage rights for press — can Journalists use painting images in articles? | Pre-launch | HC-01 retains all IP. Need a press-use license or policy. William to decide. |
| J02f-03 | Should the site include a dedicated "About the Artist" page? | Pre-launch | Phase 3 Product Design. FR-7 calls for artist identity, portfolio, statement. |

---

## 7. Decision Log (This Journey)

| # | Decision | Rationale | Date |
|---|---|---|---|
| 1 | No aggressive conversion tactics for Spectators | The gallery and prices speak for themselves. Pop-ups and "bid now" banners degrade the experience and the brand. Spectators convert when ready. | 2026-03-15 |
| 2 | Link previews and Open Graph tags are a platform requirement | Social sharing is the primary non-bidder action. Without good previews, sharing doesn't propagate. | 2026-03-15 |
| 3 | All auction information public without registration | HC-03 requires term disclosure. Spectators and Journalists need access to make the auction visible. Registration gates would kill the discovery pipeline. | 2026-03-15 |
