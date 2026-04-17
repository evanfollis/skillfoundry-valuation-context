# Activation: Launch Compliance Intelligence — agentic inbound funnel

- `probe_id`: `launch-compliance-intelligence-manual-offer`
- `status`: `blocked` — no product infrastructure; content spec written but requires new hosting + manual review service design
- `created_at`: `2026-04-17T20:38Z`
- `updated_at`: `2026-04-17T20:38Z`

## Why this probe is different

Launch Compliance Intelligence is a **manual-offer probe**, not a deployed product. There is no `products/launch-compliance-intelligence/` directory in `skillfoundry-products`. The probe tests whether MCP builders pay for a compliance/readiness review service — the product IS the manual review, not an automated tool.

This changes the agentic-inbound strategy: there is no try-it endpoint to link to. The inbound funnel must route to **a form, calendar link, or intake page** that captures builder interest and routes to Evan (or an agent) for follow-up.

This probe CANNOT go fully automated without crossing the "cold outreach" line. Inbound response is fine; automated cold contact is out of scope.

## Persona

**Name**: Launch Compliance by Skillfoundry
**Voice**: Expert review service for MCP builders preparing launches. Agent-operated brand voice for content. Human (Evan) for actual review delivery.
**Attribution**: "Operated by Skillfoundry. Manual review by a human expert."
**Handle surface**: `launch-compliance` or `skillfoundry-compliance`

## Product surface (needs to be created)

No deployed endpoint exists. Options in scope:
- **Option A**: Simple intake page at `https://skillfoundry.synaplex.ai/products/launch-compliance/` (static HTML, intake form). Routes to a Typeform/Tally or email.
- **Option B**: Add a dedicated route to the existing nginx reverse proxy / Cloudflare setup pointing to a new minimal app.
- **Option C**: Use an existing hosted form service (Typeform, Tally.so, Cal.com for booking a review call).

**Recommendation**: Option A + C. Static intake page with a Cal.com or Tally link for booking. No new product to build or deploy.

## Landing page — content specification

**Target query**: "MCP launch compliance review" / "is my MCP server compliant" / "pre-launch MCP server audit" / "MCP registry submission help"

**Page sections**:
1. **Hero**: "Launch Compliance Review — Know your MCP server meets every requirement before you submit."
2. **What you get**: Trust and compatibility checklist, directory-readiness gaps, specific submission-risk notes, prioritized fixes. Returned within 48h.
3. **Who it's for**: Solo MCP builders and small agencies with a live or near-live server launch who want certainty before submission.
4. **How it works**: Submit your server.json + package.json (and optionally smithery.yaml). Expert reviews against live registry rules. Returns annotated report.
5. **Request a review**: Intake form or Cal.com booking link.
6. **Price signal**: "Review from $X" (exact price is a probe variable — start at $49 or $99 to test willingness to pay).

## Blog posts — content queue (3 planned, 0 published)

1. **"The MCP launch compliance checklist you didn't know you needed"** — targets `MCP launch compliance` with a checklist format that positions the paid review as the next step.
2. **"Submission risk in MCP server packages: what gets flagged and why"** — specific, high-intent content for builders mid-submit.
3. **"Why MCP builders hire a compliance reviewer (and what they find)"** — case study / pattern piece. Builds credibility for the manual-review offer.

## Demo video — content specification

**Format**: ~60-second overview (not a tool demo — no running software to show)
**Script**: Explain what the review covers, show a sample annotated report (with real-looking but not-real server.json gaps), and show the intake form.
**Status**: script spec above. Requires content creation.

## Telemetry / measurement

- **Intake form submissions** count as `external_conversation` evidence (moderate quality if specific pain articulated)
- **Calendar bookings** count as `external_conversation` evidence (strong quality — human committed time)
- **Page views** alone are not evidence
- If using Tally.so or Typeform: embed a UTM or hidden field to tag source (organic search vs. blog referral vs. direct)

## Escalation items (requires Evan)

1. **Intake form / booking tool**: Choose Tally.so, Typeform, or Cal.com. Requires Evan's account or a new account.
2. **Price**: Decide starting price for the review ($49, $99, or free for first 3). This is a probe variable.
3. **Landing page hosting**: Add route to existing nginx config (requires server access) or use Cloudflare Pages (requires Cloudflare account).
4. **10 existing outreach drafts**: These are content, not cold outreach. Repurpose as blog post outlines or landing page copy — they can be published as inbound content without Evan sending them.

## CURRENT_STATE update

- **Before this tick**: stalled — 10 drafts ready, none sent, probe design required principal outreach
- **After this tick**: scaffolded — persona defined, landing page spec written, intake-form approach specified, price prompt raised
- **Blocking item**: Evan must choose intake form tool and price signal. No code needed to ship this, but needs a decision and a 30-minute setup.
