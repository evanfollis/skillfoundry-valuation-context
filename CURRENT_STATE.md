# CURRENT_STATE — skillfoundry-valuation-context

> Maintained by tick sessions and reflection passes.
> **Accuracy over completeness.** Short and honest beats long and stale.

**Last updated**: 2026-04-17T20:38Z (tick: harness 20:38Z)

---

## Deployed / running state

- **Launchpad Lint** (`@strange_loop/launchpad-lint`): live on AgenticMarket. Runtime operational.
- **Preflight**: live on MCP Registry + Smithery + GitHub. Watcher active but NOT restarted — Mozilla/Linux reclassification fix is code_landed, not in-service.
- No web UI or API surface managed by this context repo directly.

## What's in progress

- **Preflight distribution probe**: Day 6 of 14 (window closes 2026-04-25). Activation metric met (Apr-14 curl/8.5.0). Evidence quality: weak. Watcher reclassification: 188 Mozilla events → IGNORED, 1 curl event → REAL-USER (confirmed).
- **Agentic inbound scaffolded** (tick 20:38Z): All 3 probes have persona definitions, landing page specs, blog queues, demo video scripts, telemetry channel specs in `memory/venture/activation/`. None deployed — credential gap documented in general escalation handoff.
- **Preflight landing page** (code_landed): GET `/` route added to `products/preflight/src/index.ts`. Full SEO-optimized HTML. Awaiting wrangler deploy.

## Known broken or degraded

- **Watcher IGNORE_RE fix not yet in service**: `real-user-watcher.sh` updated but service not restarted. Needs `systemctl restart preflight-watcher` (sudo).
- **sourceType not deployed**: 4907d26 changes still code_landed. All events still emit without sourceType field.
- **latencyMs field is server processing time, NOT network round-trip.** The ADR-0019 claim that "0-1ms = loopback" is wrong. Do not use latencyMs for origin discrimination. See reclassification note in evidence file.
- **Evidence store empty for non-Preflight probes.** No external contact in 7+ days.

## Blocked on (requires Evan)

- `wrangler deploy` for preflight (landing page + sourceType)
- `systemctl restart preflight-watcher` (watcher IGNORE_RE fix)
- Launch Compliance Intelligence: intake form tool choice + price signal + hosting path
- Blog hosting path (Medium account, Cloudflare Pages, or worker routes)
- Demo video tooling

## Recent decisions

- **2026-04-17T20:38Z** — `latencyMs` is server processing time, not network round-trip. ADR-0019 latency-floor discrimination corrected. Mozilla/Linux proxy rule added to IGNORE_RE as interim gate.
- **2026-04-17T20:38Z** — Agentic inbound design: principal outreach was a design misread; agent-operated inbound surfaces (landing pages, blogs, personas) are in scope without FINRA constraint.
- **2026-04-11 `tighten`** — Launchpad Lint kept live but not counted as commercial continue.
- **2026-04-11 `continue`** — Launch Compliance Intelligence advanced to live Stage 1.
- **2026-04-14** — Preflight activation metric met. Evidence: `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md`.

## What the next agent must read first

1. `memory/venture/activation/` — new directory: per-probe activation specs and deployment blockers.
2. `general-skillfoundry-agentic-inbound-credential-escalation-2026-04-17T20-38Z.md` in `.handoff/` — credential gap table for all 3 probes.
3. Watcher IGNORE_RE fix is committed but service not restarted — needs Evan for `systemctl restart`.
4. `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md` — updated with reclassification analysis.
