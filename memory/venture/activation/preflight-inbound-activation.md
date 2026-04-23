# Activation: Preflight — agentic inbound funnel

- `probe_id`: `preflight-distribution-signal`
- `status`: `deployed` — Worker live at https://preflight.skillfoundry.workers.dev/ with landing page + sourceType + MCP endpoint all active
- `created_at`: `2026-04-17T20:38Z`
- `updated_at`: `2026-04-23T20:33Z`

## Persona

**Name**: Preflight by Skillfoundry
**Voice**: Agent-operated technical assistant for MCP builders. Not impersonating Evan. Attribution clear: "built and operated by Skillfoundry." Stable identity across channels.
**Handle surface**: `preflight` on any channel where the product is represented
**Tone**: Direct, technical, builder-to-builder. No marketing fluff. Shows the check output, names the rule, explains the registry expectation.

## Product surface (existing infrastructure)

- **Public MCP endpoint**: `https://skillfoundry.synaplex.ai/products/preflight/mcp/`
- **Deployment**: Cloudflare Worker (wrangler), served via Node.js local server + cloudflared tunnel at `127.0.0.1:8030`
- **Landing page**: Route `/` not yet handled — serves 404 or empty response. Landing page scaffold at `products/preflight/src/index.ts` needs a GET `/` handler added.

## Landing page — content specification

**Target query**: "how to pre-flight MCP publish compliance" / "MCP server registry checklist" / "smithery publish requirements"

**Page sections**:
1. **Hero**: "Preflight — Know if your MCP server is ready before you publish." One CTA: "Check your server →" linking to try-it flow.
2. **What it checks**: server.json schema, smithery.yaml presence, registry slug format, version constraints, homepage URL, remotes block.
3. **Who it's for**: Solo MCP builders, small automation agencies preparing a first or updated listing on npm MCP registry, Smithery, or agenticmarket.
4. **Try it**: Embed the MCP endpoint or link to a curl example. Show a sample request/response showing `verdict: checks_pass` vs `fixable`.
5. **Signal it produces**: "Each check runs against live registry rules. When you fix what Preflight flags, your listing passes."
6. **Footer attribution**: "Operated by Skillfoundry. Not affiliated with any registry."

**SEO metadata**:
- `<title>`: Preflight — MCP Server Publish Readiness Checker
- `<meta name="description">`: Check if your MCP server is ready to publish to npm MCP registry, Smithery, or agenticmarket. Preflight audits server.json, smithery.yaml, and registry rules in seconds.
- Structured data: `SoftwareApplication` schema with `applicationCategory: DeveloperApplication`
- `robots: index, follow`

## Blog posts — content queue (3 planned, 0 published)

1. **"How to pre-flight your MCP server before publish"** — tutorial, targets builders who hit registry rejections. Walks through all Preflight checks. Links to try-it.
2. **"MCP server.json errors that block your Smithery listing"** — targets error-driven search. Lists common field gaps, shows Preflight output for each.
3. **"What MCP registry reviewers actually check"** — authority piece. Maps registry requirements to Preflight rules. Positions tool as the authoritative pre-submission gate.

Status: outlines written above. Full drafts pending blog publishing infrastructure (requires hosting domain, content deployment path).

## Demo video — content specification

**Format**: Screen-capture walkthrough, ~90 seconds. Agent-narrated (no Evan voice required).
**Script outline**:
1. Show a sample `server.json` with 2-3 common gaps.
2. Run Preflight via curl or MCP client. Show `fixable` verdict with specific rules flagged.
3. Fix the gaps. Re-run. Show `checks_pass`.
4. Cut to "listed on Smithery" screenshot.
**Host**: YouTube / Loom. Must be linked from landing page.
**Status**: script above is the spec. Recording requires screen tooling or text-to-video service.

## Telemetry channel

- **Existing channel**: journalctl -u preflight → `real-user-watcher.sh` → `/opt/workspace/runtime/.alerts/preflight-real-user.log`
- **sourceType field**: code_landed (4907d26), not deployed. Once deployed, agentic-inbound traffic from landing page should set `X-Source-Type: user` or omit (defaults to `user`).
- **Inbound-specific tagging**: Add `referrer` field to telemetry (from `Referer` HTTP header). Landing page → MCP calls will carry `Referer: https://skillfoundry.synaplex.ai/products/preflight/`. This distinguishes landing-page-driven traffic from direct API access.
- **Blog post UTM**: Link from blog posts to try-it flow with `?utm_source=blog&utm_campaign=preflight-inbound`. Worker can parse and emit in telemetry.

## Deployment gap (what Evan must provision)

1. **Wrangler credentials**: `wrangler deploy` needs Cloudflare account token. Not installed on server as of 2026-04-17.
2. **Landing page route**: GET `/` handler in `products/preflight/src/index.ts` needs to be written and deployed. Scaffold spec above.
3. **Blog hosting**: Either add blog routes to the existing worker, or use a static site on a subdomain. Requires DNS/hosting choice.
4. **Demo video**: Requires screen recording tool or text-to-video service access.
5. **sourceType deploy gap**: Run `npm run deploy` from `products/preflight/` once wrangler is configured. This lands sourceType and referrer tracking.

## CURRENT_STATE update

- **2026-04-17**: stalled — activation metric met but no inbound funnel
- **2026-04-18**: deployed — Worker live, landing page + MCP endpoint + sourceType all live; watcher IGNORE_RE active
- **2026-04-23 (this tick)**: status reconciled to `deployed`. 1 confirmed real user (Apr 14 curl/8.5.0). Blog post live. External URL verified: https://preflight.skillfoundry.workers.dev/ returns 200.
- **Next action**: drive organic search traffic; monitor telemetry for external_conversation evidence before probe window closes 2026-04-25
