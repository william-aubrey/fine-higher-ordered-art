---
name: Simplicity over engineering
description: William pushes back hard on unnecessary complexity — gallery is just serving images, don't over-engineer the content layer
type: feedback
---

William wants the simplest possible implementation. When presented with WebSocket real-time infrastructure (Supabase Realtime / Ably) and a database-backed painting catalog, he pushed back: "that seems really complicated when we're just trying to serve images" and "help me understand why this would require a database or an api."

**Why:** The product is 52 paintings on a website. The gallery layer is static content. Only the bidding/payment layer genuinely needs server infrastructure. Conflating content-serving with transactional state creates unnecessary complexity.

**How to apply:** Before proposing infrastructure, ask: does this content actually change at runtime? If not, it's a static file. Default to the simplest architecture that works. Propose complexity only when the use case demands it, and be prepared to justify why static content needs a database.
