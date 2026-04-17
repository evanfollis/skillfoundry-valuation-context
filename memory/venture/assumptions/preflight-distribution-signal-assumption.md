# CriticalAssumption: preflight-distribution-signal-assumption

- `assumption_id`: `preflight-distribution-signal-assumption`
- `title`: `Listing Preflight on MCP Registry, Smithery, and GitHub produces organic inbound calls from MCP server developers — not just crawlers`
- `status`: `active`
- `owner`: `skillfoundry`
- `buyer_role`: `solo technical builder or small automation agency operator preparing to publish an MCP server`
- `problem_claim`: `MCP server builders have enough uncertainty about publish-readiness (registry schema, Smithery listing shape, npm metadata) that they will voluntarily invoke a free automated check`
- `economic_claim`: `organic distribution via registries is sufficient to generate real-user signal without active outreach, and that signal validates whether there is a problem worth building a paid fix workflow around`
- `channel_claim`: `MCP Registry + Smithery + GitHub is a credible distribution surface for developer-tool discovery — passive listing alone produces qualifying invocations`
- `falsification_rule`: `if no qualifying tools/call from a non-crawler UA is observed within 14 days of Registry publish, distribution is the bottleneck, not product quality`
- `next_probe_id`: `preflight-distribution-signal`
- `created_at`: `2026-04-17T09:11:00Z`
- `updated_at`: `2026-04-17T09:11:00Z`

## Notes

- Assumption was implicit in probe design from 2026-04-11 but not formally registered. Formalized 2026-04-17 as part of watcher slug alignment (prior skill-config.ts used ad-hoc slug `mcp-builders-need-publish-readiness-check`).
- Prior evidence recorded under probe `preflight-distribution-signal` predates this formal registration but tests exactly this assumption. Cross-reference: `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md`.
