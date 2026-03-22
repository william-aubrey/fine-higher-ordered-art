# CTO Tasks — Fine Higher Ordered Art

**Agent:** CTO
**Node:** A14
**Output locations:** `company/production/auction-platform/build/` (architecture, infra, deployment), `company/production/auction-platform/specs/` (Phase 3-5 spec work)

---

## Active

- [ ] Phase 3 SDD: Data and State (`company/production/auction-platform/specs/spec-v1-03b-data-and-state.md`) — schemas, auction state machine, notification events

## Backlog

### Spec Work
- [ ] Phase 4 SDD: Technical Architecture (`company/production/auction-platform/specs/spec-v1-04-technical-architecture.md`) — services, APIs, data model, deployment
- [ ] Phase 5: Simulate — two-pass validation (sprint-level + function-level)

### Technical Decisions
- [ ] Evaluate tech stack — static site + serverless auction logic vs. full web app
- [ ] Select payment processor (Stripe, Square, etc.) — must be PCI-compliant per HC-05; Stripe viable for physical art
- [ ] Select hosting / deployment platform
- [ ] Design real-time bid status system (first-come-first-served, payment-in-progress states)
- [ ] Implement Open Graph / social meta tags for link previews (Spectator/Journalist discovery)

## Completed

- [x] Phase 3 SDD: Site Design (`spec-v1-03a-site-design.md`) — 21 sections, 11 page templates, all components and flows — 2026-03-21
