---
node: A32
name: Marketing Channels
sprint: SPR-012
status: Draft
date: 2026-03-12
---

# Skill File: Marketing Channels

**Node:** A32
**Parent:** A3 Sales
**Function:** Distribute Product Messaging Through Defined Channels to Generate a Qualified Lead Pipeline
**Supreme Constraint:** FTC advertising rules (FTC-5, FTC-ENDORSEMENT); CAN-SPAM Act; GDPR Art. 6 lawful basis; Platform ad policies
**Cross-Function Interfaces:** IF-A0-06 (Marketing Budget from Finance)
**Sprint Date:** 2026-03-12
**Leaf Node Count:** 18
**Mandatory Inclusions Verified:** CAN-SPAM compliance (A32142); multi-touch attribution (A32161); pipeline attribution reporting (A32162)

---

## ICOM

| Code | Role | Label |
|---|---|---|
| I1 | Input | Product Offering [defined, positioned product — from Brand & Product Mgmt A31] |
| I2 | Input | Product Literature [sales deck, one-pager, web copy — from A31.O2] |
| C1 | Control | [MARKETING-BUDGET] Marketing Budget [from Finance A11 via IF-A0-06 — authorized spend by channel] |
| C2 | Control | [BRAND-POLICY] Brand Guidelines [from A314 — style guide governing all content] |
| C3 | Control | [FTC-5] FTC Act §5 — Unfair or Deceptive Acts [no unsubstantiated claims in advertising] |
| C4 | Control | [FTC-ENDORSEMENT] FTC Endorsement Guides [material connections disclosed in any review/testimonial] |
| C5 | Control | [CAN-SPAM] CAN-SPAM Act [opt-out mechanism in all commercial email; honest header] |
| C6 | Control | [GDPR-ART6] GDPR Art. 6 — Lawful Basis [EU/EEA contact processing requires consent or legitimate interest] |
| M1 | Mechanism | MECH-MAP (HubSpot Marketing, Marketo, ActiveCampaign) |
| M2 | Mechanism | MECH-EMAIL-BULK (Mailchimp, Klaviyo, SendGrid) |
| M3 | Mechanism | MECH-AD-PLATFORM (Google Ads API, LinkedIn Campaign Manager, Meta Ads) |
| M4 | Mechanism | MECH-CMS (Webflow, Contentful, WordPress) |
| M5 | Mechanism | MECH-SEO (Ahrefs, SEMrush, Google Search Console) |
| M6 | Mechanism | MECH-WEB-ANALYTICS (Google Analytics 4, Mixpanel) |
| O1 | Output | Leads [qualified MQL contacts → CRM A33] |

---

### Boundary Arrow Correspondence (A32)

| A32 Output | Produced By | Notes |
|---|---|---|
| O1 Leads | A322 (organic/SEO leads via web forms), A323 (paid advertising leads), A324 (email nurture leads), A325 (event lead capture) | All four channel execution nodes produce qualified MQL leads; A321 enables channels via budget allocation; A326 attributes and tracks lead quality by channel |

---

## Decomposition

### A321 — Plan and Allocate Marketing Budget by Channel

**Purpose:** Forecast channel-level pipeline contribution, set quarterly budget allocation by channel, build the marketing calendar, and track spend against budget with a variance report.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Marketing Budget Authorization [from Finance A11 via IF-A0-06 — total authorized spend] |
| I2 | Input | Prior quarter channel performance data [MQL, SQL, CPL, ROAS by channel] |
| C1 | Control | [MATH-NPV] Each channel allocation must project positive pipeline contribution vs. cost |
| C2 | Control | [MARKETING-BUDGET] Marketing Budget [Finance A11 — authorized spend ceiling; cannot be exceeded without CFO approval] |
| M1 | Mechanism | MECH-FPA (Anaplan, Adaptive Planning — marketing budget modeling) |
| M2 | Mechanism | MECH-DOC (Google Workspace — budget tracker) |
| M3 | Mechanism | MECH-WEB-ANALYTICS (GA4 — prior period channel performance) |
| O1 | Output | Channel Budget Allocation [approved spend by channel for the quarter] |
| O2 | Output | Marketing Calendar [campaigns, launches, events with milestones and spend dates] |
| O3 | Output | Marketing Spend Variance Report [weekly actual vs. budget by channel] |

#### Leaf Nodes

**A32111 — Forecast Channel-Level Pipeline Contribution and Set Quarterly Budget Allocation**

| ICOM | Content |
|---|---|
| Input | Prior quarter CPL (cost per lead) and SQL conversion rate by channel; authorized marketing budget total |
| Control | [MATH-NPV] Forecasted pipeline contribution = (MQLs projected × SQL conversion rate × ASP × win rate); must exceed channel spend |
| Output | Channel budget allocation table: channel name, prior CPL, projected MQL volume, projected pipeline, allocated spend ($), % of total budget |
| Mechanism | [MECH-FPA] Anaplan or Google Sheets; [MECH-WEB-ANALYTICS] GA4 historical data |

**Binary Definition of Done:**
- ✓ Channel budget allocation table is produced with an entry for every active channel.
- ✓ Every channel allocation has a documented projected pipeline contribution that exceeds the allocated spend per [MATH-NPV].
- ✓ Total allocated spend equals the authorized marketing budget total with zero unallocated budget.

---

**A32112 — Build Marketing Calendar with Campaign Milestones and Spend Commitments**

| ICOM | Content |
|---|---|
| Input | Channel budget allocation (from A32111); planned product launches and events; editorial topics |
| Control | [BRAND-POLICY] |
| Output | Marketing calendar (Google Sheet or project management tool): campaign name, channel, start/end dates, spend commitment, content deliverables, responsible owner, expected MQL output |
| Mechanism | [MECH-DOC] Google Workspace; [MECH-IDE] Linear or Asana (campaign tracking) |

**Binary Definition of Done:**
- ✓ Marketing calendar contains every planned campaign, launch, and event for the quarter with start/end dates and spend commitments.
- ✓ Every calendar entry has an assigned owner, content deliverable list, and expected MQL output.
- ✓ All campaigns align with [BRAND-POLICY] messaging calendar.

---

**A32113 — Track Marketing Spend Against Budget and Produce Variance Report**

| ICOM | Content |
|---|---|
| Input | Actual spend by channel (from ad platforms, email platform, event invoices); approved channel budget |
| Control | [MARKETING-BUDGET] |
| Output | Weekly marketing spend variance report: channel, budgeted spend, actual spend, variance ($), variance (%), forecast-to-go, at-risk flag |
| Mechanism | [MECH-WEB-ANALYTICS] GA4; [MECH-AD-PLATFORM] ad platform spend reports; [MECH-DOC] Google Sheets |

**Binary Definition of Done:**
- ✓ Weekly spend variance report is produced for every active channel.
- ✓ Every channel with variance >10% vs. budget is flagged with dollar and percentage variance documented.
- ✓ Report is delivered within 2 business days of each week end.

---

### A322 — Execute SEO and Content Marketing Program

**Purpose:** Conduct keyword research, produce and publish SEO-optimized content to the company website, and report domain authority and organic traffic KPIs.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Product Literature and message hierarchy [from A31] |
| I2 | Input | Keyword research brief [target topics, ICP search intent] |
| C1 | Control | [FTC-5] No deceptive SEO practices (keyword stuffing, cloaking, hidden text) |
| C2 | Control | [COPY-17] Copyright Act — all content must be original; licensed images only |
| C3 | Control | [BRAND-POLICY] Brand Policy [voice, tone, formatting standards for all published content] |
| M1 | Mechanism | MECH-SEO (Ahrefs, SEMrush, Google Search Console) |
| M2 | Mechanism | MECH-CMS (Webflow, WordPress, Contentful) |
| M3 | Mechanism | MECH-LLM (Claude API — content drafting) |
| M4 | Mechanism | MECH-WEB-ANALYTICS (GA4 — organic traffic measurement) |
| O1 | Output | Target Keyword List [ranked by search volume and ICP intent] |
| O2 | Output | Published SEO Content [blog posts, landing pages, guides — on MECH-CMS] |
| O3 | Output | Organic Traffic KPI Report [domain authority, ranking positions, sessions, conversions] |

#### Leaf Nodes

**A32121 — Conduct Keyword Research and Publish Target Keyword List**

| ICOM | Content |
|---|---|
| Input | ICP JTBD framework (from A31121); competitor organic keyword analysis; existing content inventory |
| Control | [MATH-STAT] Keywords qualify if search volume ≥100/month AND keyword difficulty ≤60 AND ICP intent score ≥3/5 |
| Output | Target keyword list: keyword, search volume, keyword difficulty, ICP intent score, content gap flag (existing vs. needed), priority tier (1/2/3) |
| Mechanism | [MECH-SEO] Ahrefs or SEMrush; [MECH-LLM] Claude API (intent classification) |

**Binary Definition of Done:**
- ✓ Target keyword list contains keywords that meet all three qualifying criteria: search volume ≥100/month, keyword difficulty ≤60, ICP intent score ≥3/5.
- ✓ Every keyword has a content gap flag (existing vs. needed) and priority tier (1/2/3).
- ✓ Zero keywords in the list fail the qualification criteria.

---

**A32122 — Write and Publish SEO-Optimized Content to Content Management System**

| ICOM | Content |
|---|---|
| Input | Target keyword list (tier 1 priority items); message hierarchy from A312; brand style guide |
| Control | [COPY-17] Copyright Act — original content; [FTC-5] truthful claims; [BRAND-POLICY] voice and format |
| Output | Published content assets: each with target keyword in title/H1/meta description, ≥800 words, internal links ≥2, CTA to conversion page; published URL and indexed status confirmed |
| Mechanism | [MECH-LLM] Claude API (drafting); [MECH-CMS] Webflow or WordPress (publishing); [MECH-SEO] Google Search Console (indexing verification) |

**Binary Definition of Done:**
- ✓ Every published content asset has the target keyword in the title, H1, and meta description.
- ✓ Every article is ≥800 words with ≥2 internal links and a CTA to a conversion page.
- ✓ Published URL and indexed status are confirmed in Google Search Console for each piece.

---

**A32123 — Build and Report Domain Authority Metrics and Organic Traffic KPIs**

| MECH | Content |
|---|---|
| Input | Published content inventory; Google Search Console data; Ahrefs domain metrics |
| Control | [MATH-STAT] Trend requires ≥8 weeks of data before asserting directional claim |
| Output | Monthly organic KPI report: domain authority (Ahrefs DR), organic sessions, keyword rankings (top 10 vs. prior month), MQL conversions from organic, content piece performance ranking |
| Mechanism | [MECH-SEO] Ahrefs and Google Search Console; [MECH-WEB-ANALYTICS] GA4; [MECH-BI] Looker or Sigma |

**Binary Definition of Done:**
- ✓ Monthly organic KPI report contains all five required metrics: domain authority, organic sessions, keyword rankings (top 10 changes), MQL conversions from organic, and content piece performance ranking.
- ✓ Trend direction is only asserted when ≥8 weeks of data are present per [MATH-STAT].
- ✓ Report is delivered within 5 business days of month end.

---

### A323 — Run Paid Digital Advertising Campaigns

**Purpose:** Configure targeting, ad creative, and budget in ad platforms; monitor and optimize paid performance; and report ROAS, CPL, and pipeline attribution weekly.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Product Literature and creative assets [from A31] |
| I2 | Input | Channel budget allocation [from A321 — paid channel spend budget] |
| I3 | Input | ICP firmographic criteria [from A31121 — targeting parameters] |
| C1 | Control | [FTC-5] No deceptive ad claims |
| C2 | Control | [FTC-ENDORSEMENT] Sponsored content must be labeled |
| C3 | Control | [GDPR-ART6] EU/EEA ad targeting requires lawful basis (consent or legitimate interest) |
| C4 | Control | [PLATFORM-ADV] Platform Ad Policies [Google, LinkedIn, Meta — creative content and targeting restrictions] |
| M1 | Mechanism | MECH-AD-PLATFORM (Google Ads API, LinkedIn Campaign Manager, Meta Ads Manager) |
| M2 | Mechanism | MECH-WEB-ANALYTICS (GA4 — conversion tracking) |
| M3 | Mechanism | MECH-LLM (Claude API — ad copy generation) |
| O1 | Output | Live Paid Campaigns [configured, active, within budget — driving leads to CRM] |
| O2 | Output | Paid Channel Performance Report [ROAS, CPC, CPL, CTR, pipeline attributed] |

#### Leaf Nodes

**A32131 — Configure Campaign Targeting, Ad Creative, and Budget in Ad Platform**

| ICOM | Content |
|---|---|
| Input | ICP firmographic criteria; ad creative assets (images, copy, CTAs); channel budget allocation |
| Control | [FTC-5] Ad claims must be factually substantiated; [PLATFORM-ADV] (creative format specs per platform); [GDPR-ART6] EU targeting lawful basis documented |
| Output | Live campaign configuration: audience targeting parameters, ad creative variants (A/B test minimum 2), daily/monthly budget caps, conversion tracking pixel verified active |
| Mechanism | [MECH-AD-PLATFORM] Google Ads, LinkedIn Campaign Manager, Meta Ads Manager; [MECH-LLM] Claude API (copy) |

**Binary Definition of Done:**
- ✓ Live campaign configuration is active with: audience targeting parameters, ≥2 ad creative variants (A/B test), daily/monthly budget caps set.
- ✓ Conversion tracking pixel is verified active for all campaigns.
- ✓ EU-targeted campaigns have documented lawful basis per [GDPR-ART6] before go-live.

---

**A32132 — Monitor Paid Campaign Performance and Optimize Bids and Creative**

| ICOM | Content |
|---|---|
| Input | Live campaign performance data (CTR, CPC, conversion rate) from ad platforms; budget pacing |
| Control | [MATH-STAT] Optimization decisions require ≥100 impressions per variant AND ≥7 days runtime before statistical conclusion |
| Output | Optimization actions log: bid adjustments, creative pauses/launches, audience refinements with rationale; updated campaign configuration |
| Mechanism | [MECH-AD-PLATFORM] Google Ads, LinkedIn, Meta (bid management); [MECH-WEB-ANALYTICS] GA4 |

**Binary Definition of Done:**
- ✓ Optimization actions log documents every bid adjustment, creative change, or audience refinement with a rationale.
- ✓ No optimization decision is made on data with <100 impressions per variant or <7 days runtime per [MATH-STAT].
- ✓ Updated campaign configuration is reflected in the ad platform within 24 hours of optimization decision.

---

**A32133 — Report Paid Channel ROAS, CPC, CPL, and Pipeline Attribution**

| ICOM | Content |
|---|---|
| Input | Ad platform spend and conversion data; CRM pipeline data (opportunities sourced from paid) |
| Control | [MATH-STAT] Attribution model must be consistently applied (last-touch or multi-touch — defined in A32161) |
| Output | Weekly paid channel report: spend by platform, impressions, clicks, CTR, CPC, leads generated, CPL, pipeline attributed ($), ROAS; MoM trend |
| Mechanism | [MECH-AD-PLATFORM] platform reporting APIs; [MECH-WEB-ANALYTICS] GA4; [MECH-BI] Looker or Sigma |

**Binary Definition of Done:**
- ✓ Weekly paid channel report contains all required metrics: spend by platform, impressions, clicks, CTR, CPC, leads generated, CPL, pipeline attributed ($), and ROAS.
- ✓ MoM trend is included for every metric.
- ✓ Attribution model applied is consistent with the model configured in A32161.

---

### A324 — Operate Email Marketing and Lead Nurture Sequences

**Purpose:** Build segmented lead lists, enroll contacts in CAN-SPAM-compliant nurture sequences, and report email sequence performance metrics.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | Contact list [MQLs from CRM A33 and web form submissions] |
| I2 | Input | Product Literature and message hierarchy [from A31] |
| C1 | Control | [CAN-SPAM] CAN-SPAM Act — commercial email must include physical address, opt-out mechanism, honest header, no deceptive subject lines |
| C2 | Control | [GDPR-ART6] EU contacts require explicit consent or legitimate interest legal basis before email send |
| C3 | Control | Brand Policy [email tone, format, cadence standards] |
| M1 | Mechanism | MECH-MAP (HubSpot Marketing, Marketo, ActiveCampaign — sequence automation) |
| M2 | Mechanism | MECH-EMAIL-BULK (Mailchimp, Klaviyo, SendGrid) |
| M3 | Mechanism | MECH-LLM (Claude API — email copy drafting) |
| O1 | Output | Active Nurture Sequences [enrolled contacts receiving automated email cadence → CRM] |
| O2 | Output | Email Performance Report [open rate, click rate, unsubscribe rate, MQL conversion] |

#### Leaf Nodes

**A32141 — Build Segmented Lead Lists and Enroll Contacts in Nurture Sequence**

| ICOM | Content |
|---|---|
| Input | Contact records from CRM; lead source tags; GDPR consent flags; opt-out suppression list |
| Control | [CAN-SPAM] Suppression list must be applied before each send; [GDPR-ART6] EU contacts excluded unless consent = TRUE |
| Output | Segmented lead list with consent flag applied; contacts enrolled in correct nurture sequence by ICP persona and funnel stage; suppression list updated |
| Mechanism | [MECH-MAP] HubSpot or Marketo (segmentation and enrollment); [MECH-CRM] CRM contact export |

**Binary Definition of Done:**
- ✓ Segmented lead list has the CAN-SPAM suppression list applied — zero suppressed contacts are enrolled.
- ✓ All EU contacts have consent = TRUE before enrollment per [GDPR-ART6].
- ✓ Every enrolled contact is assigned to the correct nurture sequence by ICP persona and funnel stage.

---

**A32142 — Execute CAN-SPAM-Compliant Email Sends with Unsubscribe Processing**

| ICOM | Content |
|---|---|
| Input | Enrolled contact lists; email templates with mandatory elements |
| Control | [CAN-SPAM] §5, §6: physical address in footer, functional unsubscribe link, opt-out processed within 10 business days, no deceptive subject lines; [GDPR-ART6] EU consent documented |
| Output | Emails sent with delivery confirmation; unsubscribe requests logged and suppression list updated within 24 hours; bounces removed from active list |
| Mechanism | [MECH-EMAIL-BULK] SendGrid, Mailchimp, or Klaviyo; [MECH-MAP] sequence automation |

**Binary Definition of Done:**
- ✓ All sent emails contain the three mandatory [CAN-SPAM] elements: physical address, functional unsubscribe link, and honest subject line.
- ✓ All unsubscribe requests are processed and logged in the suppression list within 24 hours.
- ✓ All hard bounces are removed from the active send list within 24 hours of bounce.

---

**A32143 — Report Email Sequence Open Rate, Click Rate, and Conversion to MQL**

| ICOM | Content |
|---|---|
| Input | Email platform delivery and engagement metrics; CRM opportunity creation data |
| Control | [MATH-STAT] Statistically significant differences require ≥200 recipients per variant |
| Output | Email performance report: sequence name, total enrolled, open rate, click rate, unsubscribe rate, MQL conversion rate, revenue attributed; A/B test winner determination |
| Mechanism | [MECH-EMAIL-BULK] platform analytics; [MECH-MAP] sequence analytics; [MECH-BI] dashboard |

**Binary Definition of Done:**
- ✓ Email performance report contains all required metrics: open rate, click rate, unsubscribe rate, and MQL conversion rate per sequence.
- ✓ A/B test winner determination is only made when ≥200 recipients per variant per [MATH-STAT].
- ✓ Report is delivered within 5 business days of the reporting period end.

---

### A325 — Execute Event and Conference Marketing

**Purpose:** Select, budget, and register for target events; produce event marketing materials; capture and upload event leads to CRM with campaign attribution tags.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | ICP firmographic criteria [from A31121 — which events attract target buyers] |
| I2 | Input | Event channel budget [from A321 channel allocation] |
| C1 | Control | [FTC-ENDORSEMENT] Any sponsored speaking session or award must be disclosed as paid |
| C2 | Control | [MARKETING-BUDGET] Marketing Budget [Finance A11 — individual events >$5K require CFO pre-approval] |
| C3 | Control | [BRAND-POLICY] Brand Policy [event materials must conform to style guide] |
| M1 | Mechanism | MECH-EVENTMGMT (Eventbrite, Hopin, Cvent) |
| M2 | Mechanism | MECH-CMS (Figma — booth design; Canva — print materials) |
| M3 | Mechanism | MECH-CRM (HubSpot, Salesforce — lead upload) |
| O1 | Output | Event Registrations and Booth Commitments [confirmed events with budget locked] |
| O2 | Output | Event Marketing Materials [booth assets, speaking deck, print collateral] |
| O3 | Output | Event Lead Capture File [uploaded to CRM with campaign attribution tag] |

#### Leaf Nodes

**A32151 — Select, Register, and Budget for Target Events and Conferences**

| ICOM | Content |
|---|---|
| Input | ICP firmographic criteria; events calendar for target verticals; event channel budget allocation |
| Control | [MARKETING-BUDGET] |
| Output | Event selection matrix: event name, date, audience size, ICP match score (1–5), total cost (registration + travel + booth + sponsorship), approval status; confirmed registrations for approved events |
| Mechanism | [MECH-EVENTMGMT] Cvent or Eventbrite; [MECH-DOC] budget tracking spreadsheet |

**Binary Definition of Done:**
- ✓ Event selection matrix covers all target-vertical events evaluated, with an ICP match score and total cost for each.
- ✓ Every event with total cost >$5K has a documented CFO pre-approval per [MARKETING-BUDGET] before registration.
- ✓ Registration confirmation is received and logged for every approved event.

---

**A32152 — Produce Event Materials, Booth Assets, and Speaking Content**

| ICOM | Content |
|---|---|
| Input | Confirmed event specifications (booth size, AV requirements, speaking slot duration); brand style guide |
| Control | [BRAND-POLICY] [all event materials must use approved colors, fonts, logos]; [FTC-ENDORSEMENT] disclose any paid speaking arrangements |
| Output | Physical booth assets (banner, table cover, handouts) print-ready files; digital presentation deck; demo environment configured; giveaway items ordered |
| Mechanism | [MECH-CMS] Figma or Canva (design); [MECH-DOC] Google Drive (asset storage) |

**Binary Definition of Done:**
- ✓ All physical booth assets (banner, table cover, handouts) are print-ready and ordered ≥2 weeks before the event.
- ✓ Digital presentation deck and demo environment are configured and tested before the event date.
- ✓ All materials conform to [BRAND-POLICY] (approved colors, fonts, logos).

---

**A32153 — Capture Event Leads and Upload to CRM with Campaign Tag**

| ICOM | Content |
|---|---|
| Input | Event lead list (badge scan, business card, sign-up sheet); event campaign tag |
| Control | [CAN-SPAM] Express consent required before adding event leads to bulk email list; [GDPR-ART6] EU leads require documented consent |
| Output | CRM upload: each lead record with source = event name, campaign tag, lead owner, qualification score, follow-up task created; upload confirmation from CRM |
| Mechanism | [MECH-CRM] HubSpot or Salesforce (bulk import); [MECH-MAP] sequence enrollment |

**Binary Definition of Done:**
- ✓ Every event lead is uploaded to CRM with source = event name, campaign tag, lead owner, and a follow-up task created.
- ✓ All EU event leads have documented consent before being enrolled in any bulk email sequence per [GDPR-ART6].
- ✓ CRM upload confirmation is received and logged within 2 business days of the event.

---

### A326 — Track and Report Marketing Channel Attribution and ROI

**Purpose:** Configure a multi-touch attribution model, produce weekly pipeline-sourced reports by channel, and present monthly marketing ROI reviews with budget recommendations to the Principal.

**ICOM**

| Code | Role | Label |
|---|---|---|
| I1 | Input | CRM pipeline data [opportunities with campaign source tags — from A33] |
| I2 | Input | Channel spend data [from A321 variance report] |
| C1 | Control | [GAAP-ASC606] Revenue attribution to campaign must be consistent with revenue recognition timing |
| C2 | Control | [MATH-STAT] Attribution model must be defined and applied consistently; model changes require 90-day parallel run before switching |
| M1 | Mechanism | MECH-WEB-ANALYTICS (GA4, Mixpanel — multi-touch attribution) |
| M2 | Mechanism | MECH-BI (Looker, Sigma, Power BI — pipeline reporting) |
| M3 | Mechanism | MECH-CRM (HubSpot, Salesforce — opportunity source data) |
| O1 | Output | Multi-Touch Attribution Model [configured in MECH-WEB-ANALYTICS] |
| O2 | Output | Weekly Pipeline Sourced Report [MQLs, SQLs, Opps, Pipeline $ by channel] |
| O3 | Output | Monthly Marketing ROI Review [budget vs. pipeline, ROAS, budget recommendation] |

#### Leaf Nodes

**A32161 — Configure Multi-Touch Attribution Model in Web Analytics Platform**

| ICOM | Content |
|---|---|
| Input | Channel touchpoint data (UTM parameters, form fills, ad clicks, email opens); CRM opportunity data |
| Control | [MATH-STAT] Attribution model choice (first-touch, last-touch, linear, data-driven) must be documented with rationale; consistent application required |
| Output | Configured attribution model in MECH-WEB-ANALYTICS: all UTM parameters mapped to campaigns; CRM integration verified (opportunities tagged with source campaign); attribution model documentation |
| Mechanism | [MECH-WEB-ANALYTICS] GA4 or Mixpanel; [MECH-CRM] campaign source field configuration |

**Binary Definition of Done:**
- ✓ Attribution model is configured in MECH-WEB-ANALYTICS with all UTM parameters mapped to campaigns.
- ✓ CRM integration is verified: opportunities are tagged with source campaign in the CRM opportunity record.
- ✓ Attribution model type and rationale are documented before the model goes live.

---

**A32162 — Produce Weekly Pipeline Sourced Report by Channel**

| ICOM | Content |
|---|---|
| Input | CRM opportunity data with campaign source tags; attribution model (from A32161) |
| Control | [GAAP-ASC606] Pipeline credited to campaign only after contract execution triggers revenue recognition start |
| Output | Weekly pipeline report: by channel — MQLs created, SQLs created, Opportunities created, Pipeline $ created, Closed-Won $ attributed; WoW % change; channel contribution % of total |
| Mechanism | [MECH-BI] Looker or Sigma; [MECH-CRM] CRM reporting; [MECH-WEB-ANALYTICS] GA4 |

**Binary Definition of Done:**
- ✓ Weekly pipeline report contains all required metrics for each channel: MQLs, SQLs, Opportunities, Pipeline ($), and Closed-Won ($) attributed.
- ✓ WoW % change and channel contribution % of total are populated for every channel.
- ✓ Report is delivered every Monday covering the prior week.

---

**A32163 — Present Monthly Marketing ROI Review to Principal with Budget Recommendation**

| ICOM | Content |
|---|---|
| Input | Weekly pipeline reports (4 weeks); channel spend variance report; channel CPL trends |
| Control | [MARKETING-BUDGET] |
| Output | Monthly marketing ROI deck: total pipeline sourced by channel, total spend by channel, ROAS by channel, CPL by channel, recommended budget reallocation for next quarter (with rationale), Principal decision required items |
| Mechanism | [MECH-BI] Looker or Sigma (dashboards); [MECH-DOC] Google Slides (presentation) |

**Binary Definition of Done:**
- ✓ Monthly marketing ROI deck contains: total pipeline sourced by channel, total spend by channel, ROAS by channel, CPL by channel, and a budget reallocation recommendation with rationale.
- ✓ Every budget reallocation recommendation is flagged as requiring CFO approval per [MARKETING-BUDGET] before execution.
- ✓ Deck is presented to the Principal within 5 business days of month end.

---

## Leaf Node Summary

| Node | Name | L4 Parent |
|---|---|---|
| A32111 | Forecast Channel-Level Pipeline Contribution and Set Quarterly Budget Allocation | A321 |
| A32112 | Build Marketing Calendar with Campaign Milestones and Spend Commitments | A321 |
| A32113 | Track Marketing Spend Against Budget and Produce Variance Report | A321 |
| A32121 | Conduct Keyword Research and Publish Target Keyword List | A322 |
| A32122 | Write and Publish SEO-Optimized Content to Content Management System | A322 |
| A32123 | Build and Report Domain Authority Metrics and Organic Traffic KPIs | A322 |
| A32131 | Configure Campaign Targeting, Ad Creative, and Budget in Ad Platform | A323 |
| A32132 | Monitor Paid Campaign Performance and Optimize Bids and Creative | A323 |
| A32133 | Report Paid Channel ROAS, CPC, CPL, and Pipeline Attribution | A323 |
| A32141 | Build Segmented Lead Lists and Enroll Contacts in Nurture Sequence | A324 |
| A32142 | Execute CAN-SPAM-Compliant Email Sends with Unsubscribe Processing | A324 |
| A32143 | Report Email Sequence Open Rate, Click Rate, and Conversion to MQL | A324 |
| A32151 | Select, Register, and Budget for Target Events and Conferences | A325 |
| A32152 | Produce Event Materials, Booth Assets, and Speaking Content | A325 |
| A32153 | Capture Event Leads and Upload to CRM with Campaign Tag | A325 |
| A32161 | Configure Multi-Touch Attribution Model in Web Analytics Platform | A326 |
| A32162 | Produce Weekly Pipeline Sourced Report by Channel | A326 |
| A32163 | Present Monthly Marketing ROI Review to Principal with Budget Recommendation | A326 |

**Total leaf nodes: 18** ✓

---

## Mandatory Inclusion Checklist (A3 Sales)

| Requirement | Node | Status |
|---|---|---|
| CPQ rules engine configuration | N/A — A32 is upstream of quoting; CPQ owned by A33 | — |
| Commission SPiFF calculation | N/A — owned by A33 | — |
| Revenue recognition event logging — [GAAP-ASC606] | A32162 (pipeline attribution timing per ASC 606) | ✓ (partial) |
| Customer health score model construction | N/A — owned by A33 | — |
| CAN-SPAM compliance | A32142 (Execute CAN-SPAM-Compliant Email Sends) | ✓ |
| Multi-touch attribution configuration | A32161 (Configure Multi-Touch Attribution Model) | ✓ |

---

## Audit Status

- [ ] R1.2a check: all box names are active verb phrases (no gerunds)
- [ ] R1.4 check: all L5 outputs are named in parent L4 ICOM
- [ ] R2.1 check: ICOM complete at every level
- [ ] Leaf count: 18 ✓
