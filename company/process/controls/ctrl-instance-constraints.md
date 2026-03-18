# FHOA Instance Constraints

*Layer 1 — C3PO-owned, read-only in subsidiary*
*Source: ctrl-instance-governance-standard.md*
*Authored: 2026-03-15*

---

## Purpose

Non-negotiable rules that Fine Higher Ordered Art must obey. These constraints derive from intellectual property law, consumer protection law, tax law, enterprise policy, and the nature of original artwork as a unique physical asset. FHOA may not waive or modify these constraints — changes require a C3PO amendment exchange.

---

## Hard Constraints

### HC-01: Artist Retains Intellectual Property

The Principal retains all intellectual property rights to every original painting. Sale of a physical painting transfers ownership of the physical object only — not reproduction rights, digital rights, or derivative work rights. No reproduction, print, or digital copy of any artwork may be created or distributed without explicit written authorization from the Principal.

### HC-02: Accurate Representation of Artwork

All artwork listed for sale must be accurately represented. Product listings must include accurate photographs, dimensions, medium, and condition. No digital manipulation that misrepresents the appearance of the physical work. Buyers must receive what they saw.

### HC-03: Auction Terms Disclosed Before Bidding

All auction terms — including bid tiers, timing, payment terms, shipping costs, return policy, and any reserve — must be clearly disclosed to bidders before the auction opens. No term changes after bidding begins. The auction mechanism must be transparent.

### HC-04: Human Approval for Irreversible Financial Commitments

The Principal must approve before: launching an auction, accepting a final bid, initiating payment processing setup, or entering any contract with a payment processor, shipping provider, or gallery. AI agents may prepare decision packages but may not authorize commitments.

### HC-05: Customer Data Protection

Customer personal and financial data must be encrypted at rest and in transit. Payment processing must use a PCI-compliant third-party processor — FHOA must not store credit card numbers, bank account details, or payment credentials directly. Customer contact information may be retained for relationship management but must not be sold or shared.

### HC-06: Tax Compliance

All sales must comply with applicable sales tax requirements (state-by-state for online sales per *South Dakota v. Wayfair*). Income from art sales must be reported per IRS requirements. Art-specific tax considerations (hobby vs. business, material deductions, home studio deduction) must be handled correctly. CFO approval gate applies to all tax posture decisions.

### HC-07: Art-Safe Shipping and Handling

Physical artwork must be shipped using art-appropriate packaging (rigid corners, acid-free wrapping, insured shipment). Shipping insurance must cover replacement value. The Principal must approve the shipping method and carrier for each sale until a standard process is established and validated.

### HC-08: Secrets and Credentials Security

API keys, payment processor credentials, and any authentication secrets must never appear in application code, version control, logs, or any artifact accessible without explicit Principal authorization. Use environment variables or a secret management service.
