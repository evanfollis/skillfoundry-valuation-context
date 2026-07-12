# Probe: launch-compliance-intelligence-manual-offer

- `probe_id`: `launch-compliance-intelligence-manual-offer`
- `assumption_id`: `launch-compliance-intelligence-first-paid-review`
- `probe_type`: `manual_offer`
- `artifact_class`: `service_probe`
- `offer_presented`: `narrow launch compliance and directory-readiness review for one MCP server package`
- `target_persona`: `solo MCP builders and small automation agencies with a live or near-live server launch`
- `target_evidence_class`: `external_conversation`
- `minimum_evidence_quality`: `moderate`
- `success_rule`: `at least one external builder clearly distinguishes compliance/readiness pain from generic launch copy pain and engages with the review deeply enough to send materials, ask for terms, or request the review`
- `falsification_rule`: `if early external conversations consistently collapse into generic copy help, free checklist requests, or indifference to the review framing, do not continue the lane as currently framed`
- `started_at`: `2026-04-11T02:10:00Z`
- `ended_at`: `2026-07-12T21:45:00Z`
- `stale_close_date`: `2026-04-24`
- `status`: `parked`
- `owner`: `skillfoundry`
- `closing_decision_id`: `2026-07-12-park-launch-compliance-intelligence-lane`

> **PARKED 2026-07-12 — reversible. Do not send from this probe.**
>
> Closed by Decision
> [`2026-07-12-park-launch-compliance-intelligence-lane`](../decisions/2026-07-12-park-launch-compliance-intelligence-lane.md)
> (`decision_type: pause`) on explicit principal instruction.
>
> The probe ran **79 days past its own `stale_close_date`** at `status: active`
> with zero messages sent. Its `falsification_rule` was never exercised — the
> probe never made external contact, so the assumption is **not falsified**, only
> untested through this channel.
>
> Resume requires a *positive* signal (inbound request, fresh buyer-demand
> evidence, a zero-touch channel, or principal reprioritization) — not the mere
> continued existence of the drafts. On resume, treat the 10 drafts as historical
> inputs and re-verify every target; the list is ~3 months stale.

## Probe Shape

Offer a manual preflight review that returns:

- trust and compatibility checklist
- directory-readiness gaps
- specific submission-risk notes
- prioritized fixes

## Why This Probe

- cheapest valid test for separating copy pain from compliance/readiness pain
- produces concrete language and objections before committing to another product build
- directly compounds launch intelligence as an internal and external primitive

## First External Path

- direct outreach to builders with live or near-live MCP launches
- use current launchpad and marketplace context as credibility and context, but do not rely on the marketplace listing alone for evidence

## Next Action (as of 2026-04-17 — 6 days stalled)

**Owner**: Evan (human — agent cannot initiate external contact)  
**Action**: send one of the 10 existing outreach drafts in `memory/signals/outreach_drafts/`  
**Priority targets** (have real contact paths and activity signals):
- `github-achiya-automation-safari-mcp` — 27 stars, contact via GitHub
- `github-barryw-immichmcp` — 7 stars, has personal blog at barrywalker.io + GitHub
- `github-goldentrii-agentrecall` — 171 stars, most active, contact via GitHub

**Send exactly one draft first.** Record the response (or non-response after 72h) as evidence before sending more.
