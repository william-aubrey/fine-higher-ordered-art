# Truist Financial — Banking Services Research

**Date:** 2026-03-26
**Purpose:** Evaluate Truist Financial Corporation as the banking partner for FHOA's auction platform operations, escrow needs, and payment infrastructure.

---

## Context: What FHOA Needs From a Bank

The Charlotte Collection auction creates an unusual banking profile:

- **Transaction range:** $16 (Tier 1 on a 4"×4" painting) to $345,600 (Tier 3 on a 6'×4' painting). WTA could reach millions.
- **Minimum aggregate threshold:** Sum of all 52 paintings' Tier 1 prices (exact figure pending inventory). Estimated $100k+.
- **Two payment channels:** Credit card via Stripe (below ~$5–10k threshold) and lawyer-mediated wire transfer (above threshold).
- **Escrow required:** A fiduciary holds all funds — the artist never directly holds bid money. Immediate refunds when bidders are outbid. Complex settlement disbursement at auction close (outbid rewards, artist proceeds, fiduciary fees).
- **One-time event:** This is a single auction with a defined open-and-close period, not ongoing commerce.

The bank needs to serve three roles:
1. **Operating account** — receive Stripe payouts, pay business expenses
2. **Escrow destination** — receive wire transfers for high-value bids (held by fiduciary attorney, not FHOA directly)
3. **Settlement disbursement** — facilitate payouts to reward recipients and artist after auction closes

---

## Truist Overview

Truist Financial Corporation (NYSE: TFC) formed in 2019 from the merger of BB&T and SunTrust. Headquartered in Charlotte, NC — same city as the Charlotte Collection's namesake.

**Footprint:** ~2,000 branches across 15 southeastern and mid-Atlantic states (Virginia through Texas, including North Carolina). Digital banking available nationwide, but full-service relationships are regional.

**Assets:** ~$530B (7th largest U.S. bank by assets).

---

## Truist Business Banking Products

### Business Checking

| Account | Monthly Fee | Waiver | Transaction Limits |
|---|---|---|---|
| Simple Business Checking | $0 | — | 50 transactions/mo |
| Dynamic Business Checking | $25 | $5k avg balance | 250 transactions/mo |
| Customized Business Checking | $50+ | $25k avg balance | Higher volume |

**FHOA fit:** Dynamic Business Checking is adequate for operating expenses. The auction itself generates limited direct transactions through the bank — most card payments flow through Stripe and arrive as batch payouts. Wire transfers for high-value bids would go to the fiduciary's trust account, not FHOA's account.

### Merchant Services

Truist partners with **Global Payments / TSYS** for merchant processing, with **Authorize.net** as the e-commerce gateway.

- This is a traditional merchant account model — application, underwriting, monthly fees, PCI compliance burden on the merchant.
- No direct integration with Stripe. Stripe operates independently and deposits to any U.S. bank account including Truist.
- No developer APIs or modern webhook infrastructure comparable to Stripe.

**FHOA fit:** Irrelevant. The spec already calls for Stripe, which is PCI-compliant by design (HC-05) and handles the entire card-processing stack. Truist's merchant services offer no advantage and would add complexity.

### Treasury Management

Truist offers treasury solutions (ACH origination, wire transfers, positive pay, sweep accounts) but these are positioned for companies processing significant recurring payment volume.

- **Wire transfers:** Truist can send and receive domestic wires. Standard business wire fees (~$25–30 outgoing domestic).
- **ACH origination:** Available for batch disbursements — could be relevant for settlement payouts if the fiduciary uses Truist.

**FHOA fit:** Wire capability is standard at any bank. ACH origination could matter if the fiduciary attorney's trust account is at Truist and settlement disbursements (outbid rewards to potentially dozens of recipients) are routed through it. But this is the fiduciary's operational decision, not FHOA's.

---

## Truist Trust & Escrow Services

### Truist Wealth (Trust Department)

Truist has a large wealth management and institutional trust division inherited from both BB&T and SunTrust's legacy trust businesses.

**Services include:**
- Corporate trust (bond trustee, paying agent, escrow agent)
- Institutional escrow (M&A, litigation settlements, real estate)
- Personal trust (estate planning, fiduciary services)

**The problem:** These services are institutional-grade. They're designed for:
- M&A escrow ($millions+)
- Municipal bond trustee arrangements
- Litigation settlement funds
- Estate and wealth planning for high-net-worth individuals

**Minimums and access:** No published minimums for escrow services, but the product positioning, staffing model, and typical deal size make clear this is not designed for a one-time art auction. Getting a relationship manager's attention for a $100k escrow with complex disbursement logic (outbid rewards, cascading refunds) would be difficult. The per-transaction overhead of their institutional escrow process would be disproportionate to the amounts involved.

**FHOA fit:** Poor. Truist's trust department is not the right escrow partner for this auction. The spec already envisions a **fiduciary attorney** managing escrow — someone who can hold funds in an IOLTA or dedicated trust account, understand the auction terms, and execute the specific disbursement logic. This is a legal services engagement, not a bank trust product.

---

## Truist's Developer & Fintech Story

- **No public APIs** for business banking, payments, or account management.
- **Open banking:** Truist launched consumer data-sharing via Mastercard and Plaid in early 2026. This is read-only account data access for consumers connecting to fintech apps — not a platform for building on.
- **No Stripe partnership** or integration pathway.

**FHOA fit:** Non-factor. The auction platform's backend talks to Stripe, not to Truist. The bank is a deposit destination, not a technical integration point.

---

## Reputation & Risk Assessment

### Customer Satisfaction
- **Trustpilot:** 1.1 / 5.0 (extremely low)
- **J.D. Power 2025 Retail Banking:** Below average
- **BBB:** Accredited, but high complaint volume

### Post-Merger Issues
- The BB&T + SunTrust merger (completed 2019, integration ongoing through 2023+) caused significant customer disruption
- Workforce reduced ~36% post-merger
- $240M settlement in 2024 over overdraft fee practices
- System migrations caused account access issues, lost records, and billing errors widely reported in reviews

### What This Means for FHOA
The risk isn't catastrophic — Truist is a major regulated bank and deposits are FDIC-insured. But:
- Customer service quality is low if issues arise
- System reliability concerns for a time-sensitive auction (e.g., confirming wire receipt promptly)
- No dedicated small-business relationship support at FHOA's scale

---

## The Charlotte Connection

Truist is headquartered in Charlotte, NC. The Charlotte Collection is named for Charlotte. This is a narrative coincidence worth noting but not a banking decision factor. There's no "local bank supports local art" program or arts-business initiative at Truist.

---

## Evaluation Summary

| Need | Truist Capability | Fit |
|---|---|---|
| Operating checking account | Dynamic Business Checking | Adequate |
| Receive Stripe payouts | Standard ACH deposit | Any bank does this |
| Escrow for auction funds | Institutional trust (M&A scale) | Poor — wrong scale |
| Wire transfer receipt | Standard business wire | Any bank does this |
| Settlement disbursements | ACH origination available | Adequate but not differentiated |
| Payment processing | Global Payments / Authorize.net | Irrelevant (using Stripe) |
| Developer/API integration | None | Non-factor |
| Customer service quality | Below average | Risk |
| Arts-specific programs | None | — |

---

## Recommendation

**Truist is fine as a checking account. It is not a strategic banking partner for FHOA.**

The auction's financial architecture has three layers, and Truist is relevant to only one:

1. **Payment processing** (Stripe) — Truist plays no role. Stripe is processor-agnostic and deposits to any bank.
2. **Escrow / fiduciary** (attorney trust account) — This is a legal services decision, not a banking decision. The fiduciary attorney will hold funds in their own trust account at whatever bank they use. Truist's institutional trust services are wrong-scaled for this.
3. **Operating account** (Truist or any bank) — FHOA needs a business checking account to receive Stripe payouts and pay expenses. Truist's Dynamic Business Checking works. So does any other bank's equivalent product.

### What actually matters for the banking decision

The bank choice is low-stakes compared to:

- **Fiduciary attorney selection** — This person/firm manages all escrow, executes the complex disbursement logic (outbid rewards, cascading refunds, settlement), and provides the trust infrastructure. This is the critical financial partner.
- **Stripe configuration** — Manual capture vs. immediate charge, Connect platform for marketplace-style payouts, webhook reliability for the refund cascade.
- **Wire transfer reliability** — For high-value bids ($10k+), the fiduciary needs a bank that confirms incoming wires promptly. This is the fiduciary's bank choice, not FHOA's.

### If staying with Truist

If William already banks with Truist or prefers it for geographic/convenience reasons:
- Open a Dynamic Business Checking account ($5k minimum to waive fees)
- Use it strictly as the operating account for Stripe payouts and business expenses
- Do not attempt to use Truist's trust/escrow services for the auction
- Expect below-average customer service if issues arise

### If choosing a bank fresh

Consider banks with better small-business service and modern digital infrastructure:
- **Mercury** or **Relay** — fintech-forward business banking with clean APIs (if future automation matters)
- **Chase Business Complete** — wide branch network, reliable wire processing, better customer service scores
- **Local credit union** — often better service for small businesses, lower fees

The bank is where the money sleeps. The fiduciary attorney is where the money works.

---

## Open Questions for Next Steps

1. **Does William currently bank with Truist?** If so, the switching cost may not be worth it for an operating account.
2. **Fiduciary attorney search** — This is the higher-priority financial partner decision. The attorney's escrow infrastructure determines how high-value bids and settlement actually work.
3. **Stripe account setup** — Needs to happen early; Stripe's onboarding includes identity verification and may take days.
4. **Wire transfer workflow** — The fiduciary needs to define the exact process for confirming wire receipt and entering bids into the platform. This workflow determines latency on high-value bid placement.
