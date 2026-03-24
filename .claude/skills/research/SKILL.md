---
name: research
description: Research any entity (company, person, industry) through a specific lens (vendor, client, competitor, hire, contact, expert, opportunity, context). Produces structured research dossiers with numbered papers and source citations.
argument-hint: <company|person|industry> <name> as a <lens>
user-invocable: true
---

# /research

Structured entity research through a specific lens. Produces a 6-paper dossier with an index, source citations, and findings framed through the chosen perspective.

## Step 0: Parse Input

Extract three components from the arguments:

| Component | How to Find It | Required |
|---|---|---|
| **Subject type** | First word after `/research` | Yes |
| **Name** | Everything between subject type and "as a" | Yes |
| **Lens** | Word(s) after "as a" or "as an" | Yes |

If no arguments are provided, display the **Help Screen** (Step 1) and stop.

If any required component is missing or unrecognized, display the Help Screen with an error note.

---

## Step 1: Help Screen

Display when `/research` is invoked with no arguments or invalid arguments:

```
/research — Entity Research

Syntax: /research [subject] [name] as a [lens]

Available Research:

Subject Types
├── company
│   ├── as a vendor      — assess their product to sell to your clients
│   ├── as a client      — research them as a prospect you want to sell to
│   └── as a competitor  — study them to compete against
│
├── person
│   ├── as a hire        — evaluate them as a candidate to recruit
│   ├── as a contact     — prepare to build a relationship or sell to them
│   └── as an expert     — learn from their work, cite their authority
│
├── industry
│   ├── as an opportunity — assess for market entry or new service line
│   └── as a context     — understand a client's world before engaging
│
├── technology           — (planned)
└── market               — (planned)

Examples:
  /research company Anthropic as a vendor
  /research company NAPCO as a client
  /research company Slalom as a competitor
  /research person Dario Amodei as an expert
  /research person Jane Doe as a hire
  /research industry construction as an opportunity
  /research industry digital collectibles as a context
```

**Stop after displaying the help screen.** Do not execute research.

---

## Step 2: Resolve Research Layers

Look up the subject × lens combination in the matrix below. Each combination defines 6 research layers with a slug and guiding question.

### Company as a Vendor

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `product-capabilities` | Product Capabilities | What do they sell? Features, pricing, product map |
| 02 | `analyst-and-media-coverage` | Analyst & Media Coverage | What are credible third parties saying? |
| 03 | `competitive-landscape` | Competitive Landscape | How do they sit vs alternatives? Where do they lose? |
| 04 | `use-cases-and-case-studies` | Use Cases & Case Studies | What are real companies doing with their product? |
| 05 | `technical-architecture` | Technical Architecture | How does it fit a client's stack? |
| 06 | `company-and-leadership` | Company & Leadership | Who are they? Where are they headed? |

### Company as a Client

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `business-and-pain-points` | Business & Pain Points | What do they do? Revenue, products, industry position, what's broken |
| 02 | `industry-and-market-pressures` | Industry & Market Pressures | What forces are shaping their decisions right now? |
| 03 | `technology-stack-and-vendors` | Technology Stack & Vendors | What do they already use? Where are the gaps you could fill? |
| 04 | `decision-makers-and-org-structure` | Decision Makers & Org Structure | Who buys? Names, titles, reporting lines |
| 05 | `budget-and-buying-signals` | Budget & Buying Signals | Are they spending? Hiring? RFPs? Earnings guidance? |
| 06 | `company-and-leadership` | Company & Leadership | Who runs it, what do they value, what's the culture? |

### Company as a Competitor

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `service-offerings` | Service Offerings | What do they sell? Practice areas, delivery methodology |
| 02 | `market-positioning-and-reputation` | Market Positioning & Reputation | How are they perceived? Client reviews, analyst mentions, awards |
| 03 | `wins-and-losses` | Wins & Losses | Where do they win deals you want? Industries, geographies, deal sizes |
| 04 | `talent-and-hiring-patterns` | Talent & Hiring Patterns | Who do they hire? Growth rate, seniority mix, tech emphasis |
| 05 | `pricing-and-delivery-model` | Pricing & Delivery Model | How do they price? Day rates, fixed bid, outcome-based, offshore mix |
| 06 | `company-and-leadership` | Company & Leadership | Leadership thesis, trajectory, strategic bets, culture |

### Person as a Hire

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `career-and-background` | Career & Background | Where have they worked? Titles, tenures, progression, gaps |
| 02 | `skills-and-expertise` | Skills & Expertise | Technical depth, domain knowledge, certifications, tools |
| 03 | `public-reputation-and-contributions` | Public Reputation & Contributions | Open source, publications, conference talks, patents, press mentions |
| 04 | `cultural-and-values-signals` | Cultural & Values Signals | What they write about, how they communicate, what they advocate for |
| 05 | `compensation-and-market-position` | Compensation & Market Position | Market rate for their profile, current role seniority, likelihood of moving |
| 06 | `network-and-references` | Network & References | Who they're connected to, mutual contacts, endorsement patterns |

### Person as a Contact

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `role-and-responsibilities` | Role & Responsibilities | What do they control? Budget authority? Team size? |
| 02 | `professional-background` | Professional Background | Career path — where they've been shapes what they'll buy |
| 03 | `content-and-thought-leadership` | Content & Thought Leadership | What do they publish, share, speak about? What's their thesis? |
| 04 | `network-and-influence` | Network & Influence | Who do they know? Board seats, advisory roles, community presence |
| 05 | `engagement-opportunities` | Engagement Opportunities | Shared connections, upcoming events, recent activity, warm intro paths |
| 06 | `personal-context-and-rapport` | Personal Context & Rapport | Communication style, interests, alma mater, mutual hooks for connection |

### Person as an Expert

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `domain-and-credentials` | Domain & Credentials | What field? What qualifications? Academic or practitioner? |
| 02 | `publications-and-research` | Publications & Research | Papers, books, articles, patents — the body of work |
| 03 | `public-positions-and-theses` | Public Positions & Theses | What do they believe? What are they known for arguing? |
| 04 | `speaking-and-media-presence` | Speaking & Media Presence | Conferences, podcasts, interviews, YouTube — where do they show up? |
| 05 | `influence-and-citations` | Influence & Citations | Who cites them? Award recognition? Industry impact? |
| 06 | `background-and-perspective` | Background & Perspective | What shaped their worldview? Career arc, formative experiences, biases |

### Industry as an Opportunity

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `market-size-and-growth` | Market Size & Growth | TAM, growth rate, revenue pools, trajectory |
| 02 | `key-players-and-market-structure` | Key Players & Market Structure | Who dominates? Fragmented or consolidated? Incumbents vs disruptors |
| 03 | `customer-segments-and-needs` | Customer Segments & Needs | Who buys? What are they underserved on? Willingness to pay? |
| 04 | `regulatory-and-compliance-landscape` | Regulatory & Compliance Landscape | What rules govern this space? Licensing, certifications, legal risk |
| 05 | `technology-and-innovation-trends` | Technology & Innovation Trends | What tech is reshaping the industry? Adoption curves, disruption vectors |
| 06 | `entry-barriers-and-go-to-market` | Entry Barriers & Go-to-Market | What does it take to enter? Capital, relationships, credibility, channel |

### Industry as a Context

| # | Slug | Layer | What It Answers |
|---|---|---|---|
| 01 | `industry-overview-and-structure` | Industry Overview & Structure | How does this industry work? Value chain, business models, economics |
| 02 | `key-players-and-competitive-dynamics` | Key Players & Competitive Dynamics | Who matters? Market share, alliances, rivalries |
| 03 | `regulatory-and-compliance-requirements` | Regulatory & Compliance Requirements | What must participants comply with? What's changing? |
| 04 | `technology-landscape-and-adoption` | Technology Landscape & Adoption | What tech stack is standard? Where is the industry on the adoption curve? |
| 05 | `trends-and-disruption-vectors` | Trends & Disruption Vectors | What's changing? Demographics, regulation, technology, consumer behavior |
| 06 | `workforce-and-talent-patterns` | Workforce & Talent Patterns | Who works in this industry? Skill shortages, compensation, turnover |

---

## Step 3: Create Output Structure

**Get timestamp** from the shell:
```
powershell -Command "Get-Date -Format 'yyyy-MM-dd'"
```

**Resolve the output path:**
```
agents/cro/products/research/[YYYY-MM-DD]-[name-slug]-[lens]/learn/
```

Where:
- `[name-slug]` = lowercase kebab-case of the entity name (e.g., "Anthropic" → `anthropic`, "NAPCO Security" → `napco-security`)
- `[lens]` = the lens keyword (e.g., `vendor`, `client`, `competitor`, `hire`, `expert`, `opportunity`)

Create the directory if it doesn't exist.

---

## Step 4: Write the Research Index

Write `00-research-index.md` to the output folder:

```markdown
# [Name] — [Subject Type] Research ([Lens])

**Researcher:** [Owning agent] (C3PO)
**Date:** [YYYY-MM-DD]
**Subject:** [Name]
**Type:** [Subject type] as a [lens]
**Purpose:** [One-line purpose based on lens description from help screen]

---

## Research Papers

| # | File | Layer | Status |
|---|---|---|---|
| 01 | `01-[slug].md` | [Layer name] | Pending |
| 02 | `02-[slug].md` | [Layer name] | Pending |
| 03 | `03-[slug].md` | [Layer name] | Pending |
| 04 | `04-[slug].md` | [Layer name] | Pending |
| 05 | `05-[slug].md` | [Layer name] | Pending |
| 06 | `06-[slug].md` | [Layer name] | Pending |

## Layer Descriptions

[For each layer, include the layer name and the "What It Answers" question from the matrix.]
```

---

## Step 5: Execute Research Layers

For each layer (01 through 06), sequentially:

1. **Research.** Run 2-4 web searches targeting the layer's guiding question. Use the entity name + layer-specific keywords.

2. **Synthesize.** Write the research paper to `[##]-[slug].md` in the output folder. Each paper must include:
   - **Header:** Layer name, date, guiding question
   - **Findings:** Organized under clear subheadings. Framed through the lens — same fact should emphasize different aspects depending on whether you're assessing a vendor, researching a client, or studying a competitor.
   - **Honest assessment:** Every paper includes what's unfavorable, uncertain, or missing. No pure advocacy.
   - **Sources:** Section at the end with linked URLs for every claim.

3. **Update index.** Change that layer's status from "Pending" to "Complete" in `00-research-index.md`.

### Research Paper Template

```markdown
# [Layer Name]

**Entity:** [Name]
**Lens:** [Subject type] as a [lens]
**Date:** [YYYY-MM-DD]
**Guiding Question:** [What It Answers, from the matrix]

---

[Findings organized under subheadings. Tables where data is comparative.
Honest assessment included. Framed through the lens.]

---

## Sources

- [Source Title](URL)
- [Source Title](URL)
```

### Per-Layer Search Guidelines

- **2-4 searches per layer.** Enough for coverage without timeout risk.
- **Include the current year** in searches for freshness (e.g., "NAPCO revenue 2026").
- **Prefer authoritative sources:** SEC filings, earnings calls, analyst reports, major press over blog posts and listicles.
- **For person research:** Public information only. LinkedIn, publications, conference talks, press mentions. No social engineering, no private data.

---

## Step 6: Report

After all 6 layers are complete, report to the user:

```
Research complete: [Name] as a [lens]

Output: agents/cro/products/research/[slug]/learn/
Papers: 6 of 6 complete

Key findings:
- [3-5 bullet points summarizing the most important discoveries across all papers]

Layers 05 and 06 of the research index remain "Planned" if applicable.
```

---

## Quality Standards

- **Every paper includes Sources.** No unsourced claims. Linked URLs.
- **Findings are framed through the lens.** The same revenue figure means "they can afford your product" (client), "they're a formidable competitor" (competitor), or "they're growing fast" (vendor). Frame accordingly.
- **Honest assessment is mandatory.** Every paper must include what's unfavorable, uncertain, or missing. A research dossier that's pure advocacy is useless in a client conversation.
- **Papers are raw research, not deliverables.** They are the foundation for whitepapers, pitch decks, or briefing docs. Write for a future author who will synthesize, not for the end reader.
- **Index tracks status.** Research can be resumed across sessions. If the conversation ends mid-execution, the index shows which layers are complete.
- **Person research respects privacy.** Public information only. No inference about personal life, health, relationships, or finances beyond what the person has made public.
- **No fabrication.** If a search returns no useful results for a layer, say so. An honest "insufficient data" is better than padded findings.

---

## Resuming Research

If a previous research dossier exists for the same entity and lens:

1. Read the existing `00-research-index.md`
2. Check which layers are "Pending" vs "Complete"
3. Resume from the first "Pending" layer
4. Do not overwrite completed papers unless the user explicitly requests a refresh

---

## Future Expansion

New subject types and lenses can be added by extending the matrix in Step 2. The execution flow (Steps 3-6) is universal and does not change.

Planned subject types:
- `technology` — lenses: as a tool, as a platform, as a standard
- `market` — lenses: as an opportunity, as a context
