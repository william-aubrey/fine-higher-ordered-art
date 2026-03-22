---
node: A31
name: Brand & Product Management
sprint: SPR-011
status: Draft
date: 2026-03-12
---

# Skill File: Brand & Product Management

**Node:** A31
**Parent:** A3 Sales
**Function:** Define and Position the Product Offering
**Supreme Constraint:** IP/trademark law (LANHAM); Pricing authority from Finance A11; Brand policy
**Cross-Function Interfaces:** IF-A0-05, IF-A0-06, IF-A1-10
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:** CPQ pricing configuration (A31152); revenue recognition event N/A — A31 is upstream of contract execution

---

## ICOM

| Code | Role | Label |
|---|---|---|
| I1 | Input | Customer Feedback [from CRM A33 — satisfaction, churn signals, expansion blockers] |
| I2 | Input | Market Intelligence [competitive data, analyst reports, win/loss data] |
| I3 | Input | Product Roadmap [from Engineering A14 via Process Plans — feature availability schedule] |
| C1 | Control | [BRAND-POLICY] Brand Policy [internal style guide — color, typography, logo usage rules] |
| C2 | Control | [PRICING-POLICY] Pricing Policy [from Finance A11 via IF-A1-10 — price approval authority matrix] |
| C3 | Control | [LANHAM] [AIA] [DTSA] Trademark, Patent, and Trade Secret constraints from Legal A12 |
| C4 | Control | LANHAM [Lanham Act — trademark registration and infringement avoidance] |
| M1 | Mechanism | MECH-CRM (HubSpot, Salesforce — customer feedback and win/loss data) |
| M2 | Mechanism | MECH-CMS (Webflow, Contentful — website and asset publishing) |
| M3 | Mechanism | MECH-LLM (Anthropic Claude API — positioning analysis, copy generation) |
| M4 | Mechanism | MECH-DOC (Google Workspace — collaborative document creation) |
| O1 | Output | Product Offering [defined, positioned product with value proposition → Marketing Channels A32] |
| O2 | Output | Product Literature [sales deck, one-pager, website copy → Marketing Channels A32] |
| O3 | Output | Product Roadmap (Published) [customer-facing roadmap → CRM A33] |

---

### Boundary Arrow Correspondence (A31)

| A31 Output | Produced By | Notes |
|---|---|---|
| O1 Product Offering | A311.O2 + A311.O3, A312.O2 + A312.O3, A314.O2, A315.O3 | Competitive positioning (A311) + value prop + messaging (A312) + brand standards (A314) + authorized pricing (A315) collectively constitute the defined, positioned product offering |
| O2 Product Literature | A316.O1, A316.O2, A316.O3 | One-pager + sales deck (A316.O1); website copy (A316.O2); version-controlled asset library (A316.O3) |
| O3 Product Roadmap (Published) | A313.O2 | Published Now/Next/Later roadmap; communication package (A313.O3) accompanies distribution |

---

## Decomposition

### A311 — Synthesize Market Intelligence and Define Competitive Position

**Purpose:** Collect and synthesize competitive intelligence and market data to produce a current competitive positioning statement and battle card deck that governs all downstream messaging.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Win/loss call recordings; competitor product updates; analyst reports |
| C1 | Control | GAAP-MATERIALITY [materiality threshold — only track competitors with ≥5% market share or direct overlap] |
| C2 | Control | LANHAM [no deceptive comparative advertising] |
| M1 | Mechanism | MECH-LLM (Claude API — competitive research synthesis) |
| M2 | Mechanism | MECH-SEO (Ahrefs, SEMrush — competitor organic footprint analysis) |
| M3 | Mechanism | MECH-DOC (Google Workspace) |
| O1 | Output | Competitive Intelligence Report [competitor profiles, positioning maps] |
| O2 | Output | Competitive Positioning Statement [one paragraph — our differentiation vs. each named competitor] |
| O3 | Output | Battle Card Deck [one card per competitor — objection handlers, differentiators, landmines] |

#### Leaf Nodes

**A31111 — Collect and Aggregate Competitive Intelligence Data**

| ICOM | Content |
|---|---|
| Input | Public competitor website content; G2 / Capterra / Gartner reviews; analyst reports; lost-deal notes from CRM |
| Control | [FTC-5] FTC Act §5 — no misrepresentation of competitor capabilities in internal analysis |
| Output | Competitive intelligence raw data file: competitor name, positioning statement, feature list, pricing tier, customer segment, GTM motion |
| Mechanism | [MECH-LLM] Claude API (web research synthesis); [MECH-CRM] win/loss data export |

**Binary Definition of Done:**
- ✓ Competitive intelligence raw data file exists with an entry for every named competitor.
- ✓ Each entry contains: positioning statement, feature list, pricing tier, customer segment, and GTM motion.
- ✓ Each competitor's data is sourced from ≥2 independent sources.

---

**A31112 — Analyze Competitor Positioning and Identify Differentiation Gaps**

| ICOM | Content |
|---|---|
| Input | Competitive intelligence raw data file (from A31111) |
| Control | [MATH-STAT] Statistical significance — patterns require ≥3 data points before asserting a positioning claim |
| Output | Differentiation gap analysis: our strengths vs. competitor weaknesses (3×3 matrix per competitor); whitespace opportunities |
| Mechanism | [MECH-LLM] Claude API; [MECH-DOC] Google Sheets |

**Binary Definition of Done:**
- ✓ Differentiation gap analysis includes a 3×3 matrix entry for every named competitor.
- ✓ Every gap identified is supported by ≥3 data points per [MATH-STAT].
- ✓ Whitespace opportunities list is non-empty with at least one opportunity per competitor.

---

**A31113 — Produce Competitive Positioning Statement and Battle Card Deck**

| ICOM | Content |
|---|---|
| Input | Differentiation gap analysis (from A31112) |
| Control | [LANHAM] Lanham Act — comparative claims must be truthful and substantiated |
| Output | Competitive positioning statement (1 paragraph); battle card deck (1 per competitor: our positioning, 3 objections + responses, deal-winning landmines) |
| Mechanism | [MECH-DOC] Google Workspace; [MECH-LLM] Claude API |

**Binary Definition of Done:**
- ✓ Competitive positioning statement is ≤1 paragraph and references ≥1 named competitor.
- ✓ Battle card deck contains one card per competitor with: our positioning, ≥3 objections + responses, and ≥1 deal-winning landmine.
- ✓ All comparative claims in battle cards are factually substantiated per [LANHAM].

---

### A312 — Define Product Value Proposition and Core Messaging

**Purpose:** Synthesize customer feedback, competitive positioning, and product capability into a canonical value proposition statement and message hierarchy that governs all marketing and sales copy.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Customer Feedback [from A33 — verbatim pain points, desired outcomes] |
| I2 | Input | Competitive Positioning Statement [from A311.O2] |
| I3 | Input | Product Roadmap [from Engineering A14 — what capabilities exist or will exist] |
| C1 | Control | [BRAND-POLICY] Brand Policy [tone of voice, persona, communication standards] |
| M1 | Mechanism | MECH-LLM (Claude API — message drafting and iteration) |
| M2 | Mechanism | MECH-DOC (Google Workspace) |
| O1 | Output | Ideal Customer Profile (ICP) [firmographic + job-to-be-done definition] |
| O2 | Output | Value Proposition Statement [single canonical sentence] |
| O3 | Output | Message Hierarchy Document [headline → sub-claims → proof points — 3 levels] |

#### Leaf Nodes

**A31121 — Draft Ideal Customer Profile and Jobs-to-Be-Done Framework**

| ICOM | Content |
|---|---|
| Input | Customer Feedback verbatim notes; win/loss call data; CRM segment data |
| Control | [MATH-STAT] Patterns must be present in ≥3 customer accounts before inclusion in ICP |
| Output | ICP document: firmographic criteria (industry, size, geography, tech stack); JTBD statement per persona (role, trigger, desired outcome, success metric) |
| Mechanism | [MECH-LLM] Claude API; [MECH-CRM] customer segment export |

**Binary Definition of Done:**
- ✓ ICP document includes all required firmographic criteria: industry, company size, geography, and tech stack.
- ✓ At least one JTBD statement exists per defined persona with: role, trigger, desired outcome, and success metric.
- ✓ Every inclusion criterion is supported by ≥3 customer data points per [MATH-STAT].

---

**A31122 — Write Value Proposition Statement and Key Message Hierarchy**

| ICOM | Content |
|---|---|
| Input | ICP document (from A31121); Competitive Positioning Statement (from A311) |
| Control | [BRAND-POLICY] |
| Output | Value proposition statement (≤25 words: "We help [ICP] achieve [outcome] by [mechanism]"); message hierarchy (H1 headline, 3 supporting claims, 3 proof points per claim) |
| Mechanism | [MECH-LLM] Claude API; [MECH-DOC] Google Workspace |

**Binary Definition of Done:**
- ✓ Value proposition statement is ≤25 words and follows the format "We help [ICP] achieve [outcome] by [mechanism]".
- ✓ Message hierarchy contains: H1 headline, 3 supporting claims, and ≥3 proof points per claim.
- ✓ All content conforms to [BRAND-POLICY] voice and format standards.

---

**A31123 — Test and Validate Messaging with Target Customer Interviews**

| ICOM | Content |
|---|---|
| Input | Value proposition statement + message hierarchy (from A31122); list of 5 target customer contacts |
| Control | [FTC-ENDORSEMENT] FTC Endorsement Guides — no recording or quoting without consent |
| Output | Message validation report: resonance score per message (1–5), verbatim feedback, recommended revisions; final approved message hierarchy |
| Mechanism | [MECH-VIDEO] Zoom (customer interviews); [MECH-DOC] Google Workspace; [MECH-LLM] Claude API (synthesis) |

**Binary Definition of Done:**
- ✓ Message validation report documents resonance scores from ≥5 target customer interviews.
- ✓ Every tested message has a resonance score (1–5) with verbatim feedback provided.
- ✓ Final approved message hierarchy is signed off by the CMO-equivalent before publication.

---

### A313 — Build and Prioritize Product Feature Roadmap

**Purpose:** Collect, score, and sequence product feature requests by customer impact and engineering capacity to produce a published internal and external product roadmap.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Product Feature Requests [from CRM A33 customer feedback + MECH-CRM] |
| I2 | Input | Engineering Capacity [from Engineering A14 — available sprint capacity] |
| I3 | Input | ICP and JTBD Framework [from A312 — scoring criteria] |
| C1 | Control | [BRAND-POLICY] Brand Policy [external roadmap disclosure norms — no committed delivery dates] |
| C2 | Control | [AIA] [DTSA] No public roadmap disclosure of patent-pending or trade-secret features |
| M1 | Mechanism | MECH-IDE (Linear, Jira — backlog management) |
| M2 | Mechanism | MECH-DOC (Google Workspace) |
| M3 | Mechanism | MECH-LLM (Claude API — scoring assistance) |
| O1 | Output | Scored Feature Backlog [all requests ranked by RICE score] |
| O2 | Output | Published Product Roadmap [Now / Next / Later format — internal + external versions] |
| O3 | Output | Roadmap Communication Package [email to customers; internal briefing to sales and support] |

#### Leaf Nodes

**A31131 — Collect and Score Product Feature Requests by Customer Impact and Effort**

| ICOM | Content |
|---|---|
| Input | Feature requests from CRM notes, support tickets, and customer interviews; engineering effort estimates |
| Control | [MATH-STAT] RICE score = (Reach × Impact × Confidence) / Effort; Reach and Confidence measured from data, not assumption |
| Output | Scored feature backlog: each request with RICE score, requesting account count, ICP alignment flag, engineering effort (S/M/L/XL) |
| Mechanism | [MECH-IDE] Linear or Jira (backlog); [MECH-CRM] feature request export; [MECH-LLM] Claude API |

**Binary Definition of Done:**
- ✓ Scored feature backlog contains every submitted feature request with a complete RICE score.
- ✓ Every RICE score has documented values for Reach, Impact, Confidence, and Effort.
- ✓ Every item has an ICP alignment flag and an engineering effort estimate (S/M/L/XL).

---

**A31132 — Sequence Roadmap by Strategic Priority and Engineering Capacity**

| ICOM | Content |
|---|---|
| Input | Scored feature backlog (from A31131); Engineering capacity plan |
| Control | [TOC] Theory of Constraints — sequence by constraint exploitation; do not overload engineering capacity |
| Output | Sequenced roadmap: Now (current quarter) / Next (following quarter) / Later (backlog) with capacity utilization %  |
| Mechanism | [MECH-IDE] Linear or Jira; [MECH-DOC] Google Workspace |

**Binary Definition of Done:**
- ✓ Sequenced roadmap assigns every Now/Next/Later item to a quarter bucket.
- ✓ Capacity utilization % is calculated for each quarter and does not exceed engineering capacity.
- ✓ Now bucket contains only items within the current quarter's confirmed sprint capacity.

---

**A31133 — Publish and Communicate Roadmap to Internal and External Stakeholders**

| ICOM | Content |
|---|---|
| Input | Sequenced roadmap (from A31132); Legal clearance for public disclosure items |
| Control | [AIA] No patent-pending feature disclosure without CLO clearance |
| Output | Published external roadmap page (on MECH-CMS or portal); internal slide deck; customer email announcement |
| Mechanism | [MECH-CMS] Webflow or Contentful; [MECH-EMAIL-API] SendGrid; [MECH-DOC] Google Workspace |

**Binary Definition of Done:**
- ✓ External roadmap page is live and accessible on MECH-CMS with a confirmed URL.
- ✓ Zero patent-pending features appear on the external roadmap per [AIA].
- ✓ Customer email announcement and internal briefing are distributed on the agreed publication date.

---

### A314 — Design Brand Identity and Visual Standards System

**Purpose:** Define the enterprise brand architecture, produce a comprehensive style guide, and enforce brand consistency across all customer-facing channels.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Company soul / brand principles [from enterprise/c3po-soul.md — immutable north star] |
| C1 | Control | LANHAM [trademark registration status governs logo and name usage rights] |
| C2 | Control | [BRAND-POLICY] Brand Policy [self-referential — this function defines the policy; Principal approves] |
| M1 | Mechanism | MECH-CMS (Figma, Canva — design tool) |
| M2 | Mechanism | MECH-DOC (Google Workspace) |
| M3 | Mechanism | MECH-LLM (Claude API — copy consistency review) |
| O1 | Output | Brand Architecture Document [brand name, tagline, visual identity rules] |
| O2 | Output | Brand Style Guide [published in MECH-CMS — logo, color, typography, image, voice] |
| O3 | Output | Brand Compliance Audit Report [quarterly — flags violations with remediation plan] |

#### Leaf Nodes

**A31141 — Define Brand Architecture, Color Palette, Typography, and Logo Rules**

| ICOM | Content |
|---|---|
| Input | Company soul principles; competitive visual landscape analysis |
| Control | [LANHAM] Existing trademark registrations must be cleared before logo filing |
| Output | Brand architecture document: brand name, tagline, primary/secondary colors (HEX/PANTONE), typefaces (primary and web), logo lockups (primary, stacked, icon-only), minimum size and clear space rules |
| Mechanism | [MECH-CMS] Figma; [MECH-LLM] Claude API; [MECH-DOC] Google Workspace |

**Binary Definition of Done:**
- ✓ Brand architecture document includes all required elements: brand name, tagline, HEX/PANTONE colors, primary typeface, all three logo lockups (primary, stacked, icon-only), minimum size rules, and clear space rules.
- ✓ Trademark search for the logo/name is completed and clearance is documented per [LANHAM] before filing.
- ✓ Document is approved by the Principal with a recorded approval date.

---

**A31142 — Build and Publish Brand Style Guide in Content Management System**

| ICOM | Content |
|---|---|
| Input | Brand architecture document (from A31141) |
| Control | [BRAND-POLICY] |
| Output | Published brand style guide (version-controlled in MECH-CMS); downloadable asset kit (logo files in SVG/PNG/EPS, color swatches) |
| Mechanism | [MECH-CMS] Figma or Notion (style guide); [MECH-DOC] Google Drive (asset storage) |

**Binary Definition of Done:**
- ✓ Published brand style guide contains all mandatory sections: logo, color, type, imagery, voice, and misuse examples.
- ✓ Downloadable asset kit is available with files in SVG, PNG, and EPS formats plus color swatches.
- ✓ Style guide is published in MECH-CMS with a version number and publication date.

---

**A31143 — Audit and Enforce Brand Consistency Across Customer-Facing Channels**

| ICOM | Content |
|---|---|
| Input | Live customer-facing assets (website, social media, sales decks, email templates); brand style guide |
| Control | [BRAND-POLICY] |
| Output | Brand compliance audit report: channel by channel deviation log; severity rating (Minor/Major/Critical); remediation assignments with due dates |
| Mechanism | [MECH-LLM] Claude API (visual and copy review); [MECH-CMS] published page audit; [MECH-DOC] audit log |

**Binary Definition of Done:**
- ✓ Brand compliance audit report covers 100% of customer-facing channels listed in the audit scope.
- ✓ Every deviation is rated (Minor/Major/Critical) with a remediation action and due date assigned to an owner.
- ✓ Quarterly audit report is delivered on the defined cadence date.

---

### A315 — Set Product Pricing and Configure Package Options

**Purpose:** Analyze competitive pricing, define the price-to-value framework, configure pricing tiers and bundles in CPQ, and obtain CFO-Agent authorization for price changes before publishing the price list.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Competitive pricing data [from A311]; customer willingness-to-pay signals [from A312] |
| I2 | Input | Cost-of-goods-sold data [from Finance A115 — cost per unit or per seat] |
| C1 | Control | [PRICING-POLICY] Pricing Policy [from Finance A11 via IF-A1-10 — CFO-Agent authorization required for any price change] |
| C2 | Control | [CPQ-RULES] CPQ Discount Authority Matrix [Finance A11 approved — discount tiers by deal size] |
| C3 | Control | [IRC-61] Gross Income Definition [pricing must produce taxable revenue — no sham structure] |
| M1 | Mechanism | MECH-CPQ (HubSpot Quotes, Salesforce CPQ, DealHub) |
| M2 | Mechanism | MECH-DOC (Google Workspace) |
| M3 | Mechanism | MECH-LLM (Claude API — pricing model analysis) |
| O1 | Output | Price-to-Value Framework [pricing rationale document] |
| O2 | Output | Configured CPQ Price Book [tiers, bundles, rules — loaded in MECH-CPQ] |
| O3 | Output | CFO-Authorized Price List [signed approval + published price list] |

#### Leaf Nodes

**A31151 — Analyze Competitive Pricing and Define Price-to-Value Framework**

| ICOM | Content |
|---|---|
| Input | Competitor pricing pages; customer willingness-to-pay interview data; COGS per unit |
| Control | [MATH-NPV] Pricing must produce positive contribution margin after COGS |
| Output | Price-to-value framework: pricing model (per seat / usage / flat / tiered), price points per tier, target gross margin %, competitive price index |
| Mechanism | [MECH-LLM] Claude API; [MECH-DOC] Google Workspace; [MECH-FPA] Anaplan or spreadsheet |

**Binary Definition of Done:**
- ✓ Price-to-value framework specifies the pricing model (per seat, usage, flat, or tiered).
- ✓ Every pricing tier has a documented target gross margin % that is positive after COGS per [MATH-NPV].
- ✓ Competitive price index compares proposed pricing vs. ≥2 named competitors.

---

**A31152 — Configure Pricing Tiers, Packages, and Bundle Rules in CPQ**

| ICOM | Content |
|---|---|
| Input | Price-to-value framework (from A31151); product feature list by tier |
| Control | [CPQ-RULES] CPQ Discount Authority Matrix [must match Finance-approved thresholds]; [MECH-CPQ] configuration rules |
| Output | Configured CPQ price book: product SKUs, tier definitions, bundle inclusions, discount authority tiers, overage rates — all loaded and tested in MECH-CPQ |
| Mechanism | [MECH-CPQ] HubSpot CPQ, Salesforce CPQ, or DealHub |

**Binary Definition of Done:**
- ✓ Configured CPQ price book is loaded and active in MECH-CPQ with all product SKUs, tier definitions, and bundle rules.
- ✓ Discount authority tiers exactly match Finance-approved [CPQ-RULES] thresholds.
- ✓ ≥3 test quotes are generated in MECH-CPQ without pricing errors before go-live.

---

**A31153 — Submit Pricing Change for CFO-Agent Authorization and Update Price List**

| ICOM | Content |
|---|---|
| Input | Configured CPQ price book (from A31152); pricing rationale document |
| Control | [PRICING-POLICY] |
| Output | CFO-Agent authorization (signed); published price list (version-controlled in MECH-DOC and MECH-CMS) |
| Mechanism | [MECH-ESIGN] DocuSign or Adobe Sign (CFO authorization); [MECH-CMS] price list publication; [MECH-DOC] version control |

**Binary Definition of Done:**
- ✓ CFO-Agent digital signature is obtained before the price list is published.
- ✓ Published price list is version-controlled in MECH-DOC with version number and effective date.
- ✓ Prior version is archived and no longer publicly accessible.

---

### A316 — Produce and Publish Product Marketing Collateral

**Purpose:** Write and design the core product marketing assets (one-pager, sales deck, website copy) and publish them in the enterprise asset management system with version control.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Message Hierarchy Document [from A312.O3]; Product Offering definition [from A311–A315] |
| I2 | Input | Brand Style Guide [from A314.O2] |
| C1 | Control | [BRAND-POLICY] Brand Policy [all assets must conform to published style guide] |
| C2 | Control | [FTC-5] FTC Act §5 — no unsubstantiated claims in marketing collateral |
| C3 | Control | [COPY-17] Copyright Act — original authorship required; licensed images only |
| M1 | Mechanism | MECH-CMS (Figma, Canva — design; Webflow — website) |
| M2 | Mechanism | MECH-LLM (Claude API — copy drafting) |
| M3 | Mechanism | MECH-DOC (Google Drive — asset storage and versioning) |
| O1 | Output | Product One-Pager and Sales Deck [→ Sales A33 via Product Literature] |
| O2 | Output | Website Product Page Copy [published to MECH-CMS] |
| O3 | Output | Asset Library [all collateral version-controlled in MECH-DOC] |

#### Leaf Nodes

**A31161 — Write and Design Product One-Pager and Sales Deck**

| ICOM | Content |
|---|---|
| Input | Message Hierarchy Document; value proposition; competitive positioning; product screenshots |
| Control | [FTC-5] All claims must be factually substantiated; [BRAND-POLICY] design must conform to style guide |
| Output | Product one-pager (1-page PDF: headline, 3 value claims, proof points, call to action, logo); sales deck (≤12 slides: problem, solution, product demo flow, pricing, proof, next steps) |
| Mechanism | [MECH-CMS] Figma or Canva (design); [MECH-LLM] Claude API (copy); [MECH-DOC] Google Drive |

**Binary Definition of Done:**
- ✓ Product one-pager (1-page PDF) contains: headline, 3 value claims with proof points, call to action, and logo.
- ✓ Sales deck is ≤12 slides with all required sections: problem, solution, demo flow, pricing, proof, next steps.
- ✓ Both assets conform to [BRAND-POLICY] and all product capability claims are factually substantiated per [FTC-5].

---

**A31162 — Produce Website Product Page Copy and Feature Descriptions**

| ICOM | Content |
|---|---|
| Input | Message Hierarchy Document; product feature list by tier; SEO keyword list (from A32121) |
| Control | [FTC-5] No deceptive product claims; [COPY-17] original copy required; SEO best practices |
| Output | Product page copy: hero headline + subheadline, feature section copy (≥3 features), pricing tier descriptions, social proof section, CTA copy — formatted for MECH-CMS import |
| Mechanism | [MECH-LLM] Claude API; [MECH-CMS] Webflow or Contentful (publishing); [MECH-SEO] SEMrush (keyword optimization) |

**Binary Definition of Done:**
- ✓ Product page copy contains all required sections: hero headline + subheadline, ≥3 feature descriptions, pricing tier descriptions, social proof section, and CTA.
- ✓ Target keyword appears in the page title, H1, and meta description.
- ✓ Published page URL is confirmed with indexed status = verified in Google Search Console.

---

**A31163 — Publish and Version-Control All Collateral in Asset Management System**

| ICOM | Content |
|---|---|
| Input | All completed collateral assets (one-pager, deck, web copy, battle cards) |
| Control | [BRAND-POLICY] |
| Output | Asset library in MECH-DOC: all assets filed by type with metadata (version, date, owner, expiry); shared link distributed to Sales and Marketing teams; prior versions archived |
| Mechanism | [MECH-DOC] Google Drive (asset library); [MECH-MESSAGING] Slack (distribution notification) |

**Binary Definition of Done:**
- ✓ Asset library contains all completed collateral (one-pager, deck, web copy, battle cards) filed by type with metadata.
- ✓ Every asset has required metadata: version number, author, approval date, and expiry review date per [BRAND-POLICY].
- ✓ Distribution notification is sent to Sales and Marketing teams with a shared asset library link.

---

## Leaf Node Summary

| Node | Name | L4 Parent |
|---|---|---|
| A31111 | Collect and Aggregate Competitive Intelligence Data | A311 |
| A31112 | Analyze Competitor Positioning and Identify Differentiation Gaps | A311 |
| A31113 | Produce Competitive Positioning Statement and Battle Card Deck | A311 |
| A31121 | Draft Ideal Customer Profile and Jobs-to-Be-Done Framework | A312 |
| A31122 | Write Value Proposition Statement and Key Message Hierarchy | A312 |
| A31123 | Test and Validate Messaging with Target Customer Interviews | A312 |
| A31131 | Collect and Score Product Feature Requests by Customer Impact and Effort | A313 |
| A31132 | Sequence Roadmap by Strategic Priority and Engineering Capacity | A313 |
| A31133 | Publish and Communicate Roadmap to Internal and External Stakeholders | A313 |
| A31141 | Define Brand Architecture, Color Palette, Typography, and Logo Rules | A314 |
| A31142 | Build and Publish Brand Style Guide in Content Management System | A314 |
| A31143 | Audit and Enforce Brand Consistency Across Customer-Facing Channels | A314 |
| A31151 | Analyze Competitive Pricing and Define Price-to-Value Framework | A315 |
| A31152 | Configure Pricing Tiers, Packages, and Bundle Rules in CPQ | A315 |
| A31153 | Submit Pricing Change for CFO-Agent Authorization and Update Price List | A315 |
| A31161 | Write and Design Product One-Pager and Sales Deck | A316 |
| A31162 | Produce Website Product Page Copy and Feature Descriptions | A316 |
| A31163 | Publish and Version-Control All Collateral in Asset Management System | A316 |

**Total leaf nodes: 18** ✓

---

## Mandatory Inclusion Checklist (A3 Sales)

| Requirement | Node | Status |
|---|---|---|
| CPQ rules engine configuration — [CPQ-RULES] | A31152 (Configure Pricing Tiers, Packages, and Bundle Rules in CPQ) | ✓ |
| Commission SPiFF calculation | N/A — A31 is upstream of contract execution; owned by A33 | — |
| Revenue recognition event logging — [GAAP-ASC606] | N/A — owned by A33 | — |
| Customer health score model construction | N/A — owned by A33 | — |

---

## Cross-Function Interfaces

| Interface | Flow | Artifact |
|---|---|---|
| IF-A0-06 | Governance A1 → A31 | Sales & Marketing Budget (pricing authority, brand spend) |
| IF-A1-10 | Finance A11 → A31 | Deal Approval Authority Matrix (CPQ discount tiers, pricing change sign-off) |
| IF-A1-03 | Legal A12 → A31 | Compliance Operating Envelope (trademark, IP constraints) |

---

## Audit Status

- [ ] R1.2a check: all box names are active verb phrases (no gerunds)
- [ ] R1.4 check: all L5 outputs are named in parent L4 ICOM
- [ ] R2.1 check: ICOM complete at every level
- [ ] Mandatory inclusion: CPQ configuration ✓ (A31152)
- [ ] Leaf count: 18 ✓
