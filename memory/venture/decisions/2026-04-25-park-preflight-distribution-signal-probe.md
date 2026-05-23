# Decision: 2026-04-25 park preflight-distribution-signal probe; keep deployed surface

- `decision_id`: `2026-04-25-park-preflight-distribution-signal-probe`
- `assumption_id`: `preflight-distribution-signal-assumption`
- `probe_id`: `preflight-distribution-signal`
- `decision_type`: `pause`
- `timestamp`: `2026-05-23T02:30:00Z`
- `decided_at`: `2026-04-25T00:00:00Z` (probe-window close)
- `recorded_at`: `2026-05-23T02:30:00Z` (this artifact written ~28d after window close per URGENT-skillfoundry-valuation-stale-open-loops)
- `owner`: `skillfoundry`
- `drafted_by`: skillfoundry session 65447b9d-3cb7-4584-bcf2-c058fd025791 — principal override welcome
- `evidence_refs`:
  - `2026-04-14-preflight-first-real-user-call`
  - `2026-04-25-preflight-probe-close`
  - 2026-04-28 `MCPScoringEngine/1.0` cluster (post-window, not yet codified as a canon Evidence envelope)
  - 2026-05-22 `Ae/JS 0.62.0` session (post-window, not yet codified as a canon Evidence envelope)
- `rationale`: The probe's specific commercial question — "does distribution alone produce real-user calls?" — was answered weakly within the formal 2026-04-11→2026-04-25 window (single in-window signal: Apr-14 `curl/8.5.0`, `checks_pass`, no friction, no follow-up). The inbound surface (landing page + sourceType) went live mid-window and produced no qualified signals in the remaining time. Post-window signals exist (Apr-28 `MCPScoringEngine` cluster, May-22 `Ae/JS`) but neither carries a paid event, return-use, or qualified follow-up — they confirm passive distribution produces low-rate `external_conversation` evidence but do not answer the commercial-readiness question the probe was designed to test.
- `next_action`: Keep the deployed Preflight surface (Worker + landing + MCP endpoint + watcher) **alive** as one channel arm in the agent/developer-tooling sleeve. Stop measuring against the probe's original Stage-1 success rule; **re-baseline measurement under ADR-0033 portfolio-layer metrics** — first passive paid event by channel, channel-attributed activation, repeat use without principal intervention, low-support fulfillment. Treat ongoing low-rate `external_conversation` signals (like Apr-28 + May-22) as ambient distribution evidence, not as probe-reopening triggers.

## Why "pause" and not "kill" or "continue"

- **Not `continue`**: the probe's required evidence class (`external_conversation` strong, or `external_commitment`) was not met in-window. Calling it a continue would treat operational deployment as commercial validation, which workspace CLAUDE.md and ADR-0033 both forbid.
- **Not `kill`**: killing implies the assumption was falsified. The assumption — "listing Preflight on MCP Registry + Smithery + GitHub produces organic inbound traffic from MCP server developers" — wasn't falsified. The in-window signal (Apr-14 curl) and post-window signals (Apr-28 MCPScoringEngine, May-22 Ae/JS) all *support* the distribution mechanic working, just at very low rate and without commercial intent demonstrated. Killing would destroy a sunk-cost deployment that's currently the most mature inbound surface in the sleeve.
- **`pause`** captures the right state: probe-as-currently-framed is done answering its question; the surface continues to exist as infrastructure; future evidence about Preflight specifically should be evaluated under the portfolio-layer ledger (ADR-0033), not the probe ledger.

The L1 canon adapter maps `decision_type=pause` to `kind=continue` with a `[skillfoundry-type=pause]` rationale marker (per `_DECISION_KIND_MAP` in `discovery_adapter/emit.py`). That mapping is acknowledged lossy; the rationale-marker preserves the pause-distinct-from-continue distinction in canon storage.

## Consequences

- Preflight Worker, landing page, MCP endpoint, blog post, and watcher remain in production. No teardown.
- The Stage-1 `preflight-distribution-signal` probe is closed. No more in-window evidence collection against it.
- Post-window signals (Apr-28, May-22, and any future ones) are recorded as ambient `external_conversation` evidence against the `preflight-distribution-signal-assumption` claim — but they belong to portfolio-layer measurement, not a re-opened probe. If/when one of those signals carries a paid event or qualified follow-up, that's the trigger to open a **new** probe (e.g. "Preflight paid conversion via x402"), not to revive this one.
- Resources freed by closing this probe go to: (a) Launchpad Lint channel diversification (the active agent-tooling wedge), (b) the data/API sleeve candidate proposal at `skillfoundry-harness/docs/passive-income-candidates/01-mcp-registry-landscape-feed.md`.
- This Decision is the predicate for treating future Preflight evidence as portfolio-layer signal. Without it, the open-loop would keep accumulating reflection-cycle noise.

## What this does not do

- Does not retire the Apr-23 close note (`251adf4`). That close note documented the in-window outcome. This Decision documents what comes next.
- Does not change the L1 canon's interpretation of `preflight-distribution-signal-assumption`. The claim still stands; the *probe* against it is paused.
- Does not commit to a re-probe schedule. If the portfolio-layer measurement produces a paid event or qualified follow-up, a new probe with a clear assumption (e.g. "Preflight users will pay $X for an extended check via x402") can be opened then. Today there is no such trigger.

## Principal override

This Decision was drafted by an attended skillfoundry session in response to `URGENT-skillfoundry-valuation-stale-open-loops` (filed 2026-05-23T02:23:45Z). The URGENT itself framed Item 1 as "Requires Evan's judgment call only." The action-default contract (ADR-0020) says reversible work ships under best judgment; this Decision is reversible (an amending Decision can be written). Principal is welcome to override by writing a successor Decision in this directory with a clearer verdict.

The Decision exists primarily so the canon ledger stops carrying an open loop on a closed probe.
