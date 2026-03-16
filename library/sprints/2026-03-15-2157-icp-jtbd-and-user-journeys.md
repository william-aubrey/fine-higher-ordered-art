# ICP/JTBD Framework and User Journeys

**Date:** 2026-03-15
**Project:** Fine Higher Ordered Art

---

## Starting Point

The auction mechanism was fully specified in the previous sprint, but the spec existed in isolation — it described *what the auction does* without defining *who participates and how they experience it*. The SDD process (newly delivered from C3PO in `governance/processes/spec-driven-development.md`) prescribed a clear sequence: WHO/WHY → HOW they interact → WHAT it looks like → HOW it's built. The project had a domain spec but no foundation layer (personas, jobs-to-be-done) and no user journeys. Without these, the website couldn't be designed and the tech stack couldn't be evaluated — every downstream decision was blocked by the absence of user-facing specifications.

The task backlog listed "Run ICP/JTBD framework exercise" as the recommended next task, and 15+ open items awaited a product definition foundation to build on.

## Summary

This sprint executed SDD Phases 1 and 2 in a single session — defining all personas, mapping use case families, and writing complete user journeys for every persona in the Charlotte Collection auction.

Phase 1 produced eight personas through collaborative design with the Principal: The Magnate (WTA buyer), The Champion (Tier 3), The Connoisseur (serious-money art buyer), The Collector (accessible art buyer), The Patron (story-motivated participant), The Gambler (threat persona — design against), The Spectator (non-bidder follower), and The Journalist (story-seeker, friendly or hostile). These were mapped against eight use case families in a persona×UCF matrix that revealed key design tensions — most critically, that the outbid notification is the single most important UX challenge because Patrons and Gamblers experience the same event with opposite motivations.

Phase 2 produced six user journey documents covering all eight personas. The journeys resolved 15+ product design decisions including homepage layout (gallery scroller → Charlotte Collection → auction stats → WTA), site page hierarchy (Homepage, Art Auction page, WTA page, Image Pages, Theme Series Pages), tier button UX (all three visible, only lowest active), registration flow (Google/Apple + email/password, payment at bid time), and a critical split in the bidding UX at a dollar threshold — below it, self-service credit card; above it, lawyer-mediated with formal contracts.

The session also produced two legal RFP documents: a securities opinion request for counsel to evaluate the reward mechanic under the Howey test, and a comprehensive RFP for a fiduciary lawyer to manage escrow, payments, contracts, and settlement.

## Discoveries

### Discovery 1: The Patron Has No Warm Audience

The original Patron persona was conceived as "friends, community, people who know William." When asked about his personal network, William estimated zero meaningful participants — possibly one or two at most. This eliminated the assumption of a warm audience driving initial bidding activity.

**Consequence:** The Patron persona was redefined as entirely story-driven — someone moved by the narrative they encountered through press or social media, not someone who knows the artist. This shifted the discovery model: there is no warm launch audience. All traffic, including Patrons, must come through press coverage, auction house promotion, or organic social sharing. The product cannot rely on relationship-based early adoption.

### Discovery 2: Sequential Tier Progression Creates a Better System Than Direct Bidding

The original auction mechanism spec (§4.5) allowed direct high-tier bidding — a buyer could bid Tier 3 on an unbid painting. During the UX design discussion about tier button prominence, William proposed making only the lowest available tier clickable. This initially appeared to be a UX-only decision, but it turned out to be a fundamental rule change.

Forcing sequential progression means every Tier 2 or 3 painting has visible bidding history. A buyer who wants Tier 3 must pass through Tier 1 and 2, creating activity at each step. If they self-outbid, they earn their own rewards (~50% back on net cost). This was concerning until we checked the math — the artist's ~50% share at cascading tiers was already the expected outcome in the original spec. The only scenario removed was direct high-tier bidding with no prior bidders (§6.4), where the artist got 100% — an edge case William never relied on.

**Consequence:** The auction mechanism spec was updated. §4.5 was rewritten from "Direct Tier Bidding" to "Sequential Tier Progression." The self-outbid discount was explicitly documented as intentional. The tier button UX (all three visible, only lowest active) enforces the rule visually while communicating the full price spectrum.

### Discovery 3: The Bidding UX Must Bifurcate at a Dollar Threshold

While writing the Champion journey, the trust problem became clear: no amount of website design can build enough confidence for a $345,600 Tier 3 bid. William's solution was immediate and structural — a fiduciary lawyer whose bar credentials are on the website, with a formal purchase contract for bids above a credit card threshold.

**Consequence:** The bidding experience splits into two modes. Below threshold: standard self-service credit card flow ("Place Bid"). Above threshold: lawyer-mediated engagement with formal contracts and wire transfer ("Arrange Purchase"). The Magnate's WTA path is entirely lawyer-mediated. This resolved the Champion and Magnate trust problems completely — at high dollar amounts, the buyer trusts a verifiable attorney, not a website.

## What Changed

### Files Created
| File | What it is |
|---|---|
| `specs/spec-v1-00-index.md` | Spec index — reading order, phase summary, 20-entry key decisions log, consolidated open questions |
| `specs/spec-v1-01-icp-jtbd.md` | Phase 1: 8 personas, 8 use case families, persona×UCF matrix, open questions, key decisions |
| `specs/spec-v1-02a-journey-collector-connoisseur.md` | Phase 2: Art buyer journey — discovery through settlement, 15 resolved decisions |
| `specs/spec-v1-02b-journey-patron.md` | Phase 2: Story-motivated bidder — referral loop as organic growth engine |
| `specs/spec-v1-02c-journey-champion.md` | Phase 2: Premium bidder — sequential tier ladder, lawyer-mediated flow above threshold |
| `specs/spec-v1-02d-journey-magnate.md` | Phase 2: WTA journey — entirely lawyer-mediated, contract-based |
| `specs/spec-v1-02e-journey-gambler.md` | Phase 2: Threat persona anti-journey — deflection points, structural deterrents |
| `specs/spec-v1-02f-journey-spectator-journalist.md` | Phase 2: Non-bidder journeys — amplification, scrutiny, press story arc |
| `library/legal/securities-opinion-request.md` | RFP for securities counsel — 8 specific questions on Howey test |
| `library/legal/fiduciary-rfp.md` | RFP for fiduciary lawyer — escrow, payments, contracts, ToS, 17 response questions |
| `library/sprints/2026-03-15-2157-icp-jtbd-and-user-journeys.md` | This narrative |

### Files Modified
| File | What changed |
|---|---|
| `TASKS.md` | Marked 6 tasks complete, added new tasks for Phase 3/4, legal RFPs, shipping research, Open Graph tags |
| `specs/auction-mechanism.md` | §4.5 rewritten: "Direct Tier Bidding" → "Sequential Tier Progression." §4.7 updated for self-outbidding mechanics. |
| `library/sprints/sprint-log.md` | Added this sprint's entry |

## Key Decisions

1. **Followed SDD process strictly.** The governance document prescribed WHO → HOW → WHAT → HOW-BUILT. Phases 1 and 2 were completed in order, with blocking questions resolved before writing the next document. The temptation to jump to site design was resisted — the personas and journeys had to come first.

2. **Eight personas, not four.** William proposed four (Magnate, Champion, Collector, Patron). Analysis revealed that Collectors needed splitting by economic gravity (Collector vs. Connoisseur) and Patrons needed splitting by motivation (Patron vs. Gambler). Adding Spectator and Journalist as non-bidder personas completed the ecosystem. Each split was driven by a concrete UX need, not taxonomic completeness.

3. **The Gambler is designed against, not for.** Instead of trying to prevent reward-seeking behavior through friction (which would hurt Patrons and Collectors), the product deflects through framing: terms call bids "purchases," rewards are "artist gratitude," and the UX emphasizes paintings over money. Structural deterrents (irrevocable bids, shipping costs, threshold contingency) provide natural friction.

4. **Legal RFPs written as self-contained documents.** A lawyer receiving either document can understand the auction and respond without reading the full spec suite. Reference materials are listed for deeper engagement. This makes the documents immediately actionable.

5. **Liberal image dissemination.** William confirmed the paintings are "iconic abstractions" that work at any size. Press gets editorial use. Social previews show paintings. No gatekeeping of imagery — wider dissemination drives discovery.

## What This Proves

The SDD process works for FHOA. In a single session, the project went from "we have an auction mechanism but no user-facing spec" to a complete foundation (8 personas, 8 use case families) and six user journey documents with 20+ resolved design decisions. The spec suite is now detailed enough to drive Phase 3 (Product Design) — page templates, component specifications, data schemas — without ambiguity about who the pages serve or how users flow through them.

More importantly, the journey work surfaced structural decisions (sequential tier progression, lawyer-mediated high-value bids, the Gambler anti-pattern) that would have been missed or made ad hoc in a design-first approach. The WHO → HOW → WHAT sequence forced these decisions to emerge from user needs rather than implementation convenience.

The legal RFPs mean William can begin the two hardest external dependencies (securities counsel, fiduciary lawyer) immediately, in parallel with Phase 3 spec work.

## Open Questions

1. **Press contact on website** (J02f-01) — depends on fiduciary capability. Resolve in Phase 3.
2. **About the Artist page** (J02f-03) — FR-7 calls for it. Resolve in Phase 3.
3. **Outbid notification reward amount** (J02e-03) — should the notification show the specific dollar figure? Resolve in Phase 3.
4. **In-person viewing for high-tier bidders** (J02c-02) — case-by-case through fiduciary, not a platform feature.
5. **WTA page copy for mystery prize** (J02d-01) — tone and framing for non-collection items. Resolve in Phase 3.
6. **All fiduciary-dependent questions** — threshold amount, payment methods, inquiry channel, coordinated bidding ToS provisions. Resolve after lawyer engagement.

## Bootstrap Prompt

Read these files in order to restore context for the next session:

1. `TASKS.md`
2. `specs/spec-v1-00-index.md`
3. `specs/spec-v1-01-icp-jtbd.md`
4. `specs/spec-v1-02a-journey-collector-connoisseur.md`
5. `specs/auction-mechanism.md`
6. `governance/processes/spec-driven-development.md`
7. `governance/ctrl-instance-constraints.md`

**Next task:** Begin Phase 3 SDD (Product Design) — define the site's page templates, gallery scroller component specification, Image Page layout, auction statistics display, and the "Arrange Purchase" vs. "Place Bid" UX split. Start from the homepage layout decisions already captured in spec-v1-02a §3 and build out each page.
