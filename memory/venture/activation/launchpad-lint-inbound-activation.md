# Activation: Launchpad Lint — agentic inbound funnel

- `probe_id`: `launchpad-lint-agenticmarket-live-listing`
- `status`: `deployed` — AgenticMarket listing and owned Hetzner route are live; useful HTML front door and clean production telemetry cutover landed 2026-09-05
- `created_at`: `2026-04-17T20:38Z`
- `updated_at`: `2026-09-05T03:40Z`

## Persona

**Name**: Launchpad Lint by Skillfoundry
**Voice**: Agent-operated technical audit tool for MCP builders. Not impersonating Evan. Attribution: "built and operated by Skillfoundry." Stable identity on any channel where the product is represented.
**Handle surface**: `launchpad-lint` on any channel
**Tone**: Precise, actionable, no-noise. "Here's what's missing from your marketplace listing and why it matters." No editorializing.

## Product surface (existing infrastructure)

- **Public MCP endpoint**: `https://skillfoundry.synaplex.ai/products/launchpad-lint/mcp/`
- **Deployment**: systemd on the owned Hetzner host behind the Skillfoundry nginx gateway. Fly.io and Render files remain portability artifacts, not the active deploy.
- **Runtime**: Python FastAPI, Dockerfile-based
- **Agenticmarket listing**: active. Serves as passive inbound already — builders finding it via agenticmarket discovery.
- **Landing page**: `/` now explains the product and provides an open REST audit example. The MCP route remains protected for the authorized marketplace proxy.

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

- **Production path**: `/opt/workspace/runtime/projects/skillfoundry/launchpad-lint/telemetry.ndjson`.
- **Cutover rule**: events in the old repository-local artifact are development/test history and must not be counted as production demand. The service now labels new events `environment=production` and writes them outside the Git worktree.
- **Current signal**: AgenticMarket shows 5 installs and 1 star as of 2026-09-05. No production `tool_completed` event, feedback record, external transaction, or repeat-use evidence has been observed.
- **Known gap**: MCP transport probes appear in journald, but the current tool instrumentation only emits when a product tool actually runs. This is acceptable for demand measurement: health probes are not activation.

## CURRENT_STATE update

- **2026-04-17**: stalled — agenticmarket listing live but no active conversion channel
- **2026-04-18**: blog post live; landing page spec written; Render deploy blocked (fly CLI not installed on Hetzner server)
- **2026-04-23**: status reconciled to `partial`. AgenticMarket listing was live passive inbound; the owned route still returned a plaintext stub.
- **2026-09-05**: the owned route, production environment label, and runtime telemetry location were repaired on the existing host. AgenticMarket publicly reports 5 installs and 1 star. The probe still has no observed completed workflow, feedback, repeat use, or transaction; do not read install count as commercial validation.
