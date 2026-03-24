# CTO Tasks — Fine Higher Ordered Art

**Agent:** CTO
**Node:** A14
**Output locations:** `company/production/auction-platform/make/` (architecture, infra, deployment), `company/production/auction-platform/define/` (Phase 3-5 spec work)

---

## Active

- [ ] Resolve TECH-04: Supabase (DB + realtime bundled) vs. Neon + Ably
- [ ] Begin build — Sprint 1: Project scaffolding

## Backlog

### Spec Work
(Phase 5 moved to Active)

### Technical Decisions
- [ ] Evaluate tech stack — static site + serverless auction logic vs. full web app
- [ ] Select payment processor (Stripe, Square, etc.) — must be PCI-compliant per HC-05; Stripe viable for physical art
- [ ] Select hosting / deployment platform
- [ ] Design real-time bid status system (first-come-first-served, payment-in-progress states)
- [ ] Implement Open Graph / social meta tags for link previews (Spectator/Journalist discovery)

## Completed

- [x] Phase 3 SDD: Site Design (`spec-v1-03a-site-design.md`) — 21 sections, 11 page templates, all components and flows — 2026-03-21
- [x] Phase 3 SDD: Data and State (`spec-v1-03b-data-and-state.md`) — 15 sections: 6 entity schemas, auction state machine, reward calculations, notification events, temporal rules — 2026-03-24
- [x] Phase 4 SDD: Technical Architecture (`spec-v1-04-technical-architecture.md`) — 16 sections: Next.js + Vercel + Postgres + Stripe, full API contracts, database schema, auth, real-time, notifications, security, acceptance criteria, test strategy — 2026-03-24
- [x] Phase 5: Simulate — two-pass validation, 3 dangerous gaps found and fixed (sales tax, admin bids endpoint, auction close trigger), 14 safe gaps documented — 2026-03-24
