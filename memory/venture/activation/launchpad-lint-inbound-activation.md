# Activation: Launchpad Lint — agentic inbound funnel

- `probe_id`: `launchpad-lint-agenticmarket-live-listing`
- `status`: `scaffolded` — content spec written, deployment pending credential provisioning
- `created_at`: `2026-04-17T20:38Z`
- `updated_at`: `2026-04-17T20:38Z`

## Persona

**Name**: Launchpad Lint by Skillfoundry
**Voice**: Agent-operated technical audit tool for MCP builders. Not impersonating Evan. Attribution: "built and operated by Skillfoundry." Stable identity on any channel where the product is represented.
**Handle surface**: `launchpad-lint` on any channel
**Tone**: Precise, actionable, no-noise. "Here's what's missing from your marketplace listing and why it matters." No editorializing.

## Product surface (existing infrastructure)

- **Public MCP endpoint**: `https://skillfoundry.synaplex.ai/products/launchpad-lint/mcp/`
- **Deployment**: Fly.io + Render (both configs present). `fly deploy` / Render auto-deploy via git push.
- **Runtime**: Python FastAPI, Dockerfile-based
- **Agenticmarket listing**: active. Serves as passive inbound already — builders finding it via agenticmarket discovery.
- **Landing page**: `/` route exists (FastAPI default or custom). Check if it renders useful content or just health/404.

## Landing page — content specification

**Target query**: "MCP marketplace listing errors" / "launchpad metadata lint" / "agenticmarket listing requirements" / "how to fix MCP server.json homepage field"

**Page sections**:
1. **Hero**: "Launchpad Lint — Audit your MCP server's marketplace listing before it goes live."
2. **What it audits**: server.json completeness, homepage field, description quality, agenticmarket submission requirements, tag structure.
3. **Who it's for**: MCP builders preparing listings on agenticmarket, Smithery, npm MCP registry. Agencies building products for clients.
4. **Try it**: Show curl example or MCP tool invocation. Sample output with specific gaps called out.
5. **How it helps**: "Fix what Lint flags, then re-submit. Listing passes review the first time."

**SEO metadata**:
- `<title>`: Launchpad Lint — MCP Marketplace Listing Auditor
- `<meta name="description">`: Audit your MCP server's marketplace listing for metadata gaps, schema errors, and submission requirements before you submit to agenticmarket, Smithery, or npm.
- Structured data: `SoftwareApplication`, `applicationCategory: DeveloperApplication`

## Blog posts — content queue (3 planned, 0 published)

1. **"Why your MCP listing gets rejected (and how to fix it before submit)"** — covers the most common metadata errors Launchpad Lint catches.
2. **"Agenticmarket submission requirements: what actually matters"** — authoritative guide targeting `agenticmarket requirements` search intent.
3. **"MCP server.json homepage field: why it matters and what passes"** — narrow, specific-error targeting. High intent from builders mid-submission.

Status: outlines written above. Full drafts pending blog hosting setup.

## Demo video — content specification

**Format**: ~90-second audit walkthrough
**Script**: Take a real MCP server with 3 metadata gaps → run Launchpad Lint → see audit results → fix them → re-run showing clean pass → "your listing is now ready."
**Status**: script spec above. Recording requires tooling.

## Telemetry channel

- **Existing channel**: Fly.io / Render service logs. No watcher script equivalent yet.
- **Needed**: telemetry parity with preflight — emit structured events per invocation with `userAgent`, `sourceType`, `referrer`, `toolName`, `verdict`.
- **Inbound tagging**: UTM from landing page → try-it flow. `Referer` header from landing page visits.

## Deployment gap (what Evan must provision)

1. **fly CLI credentials**: `fly auth login` or FLYCTL_TOKEN env var. Not installed on server as of 2026-04-17.
2. **Render auto-deploy**: if using Render, git push to main triggers deploy — no local creds needed, just push access.
3. **Landing page route**: Check if `/` returns useful content; if not, add it before promoting the inbound funnel.
4. **Telemetry retrofit**: Add structured telemetry emit matching preflight schema before driving traffic.
5. **Blog hosting**: same constraint as preflight.

## CURRENT_STATE update

- **Before this tick**: stalled — agenticmarket listing live but no active conversion channel
- **After this tick**: scaffolded — persona defined, landing page spec written, blog content queue defined
- **Next action**: Evan provisions fly/render creds → verify landing page → add telemetry → blog + video production
