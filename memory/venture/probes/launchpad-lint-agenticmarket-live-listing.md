# Probe: launchpad-lint-agenticmarket-live-listing

- `probe_id`: `launchpad-lint-agenticmarket-live-listing`
- `assumption_id`: `launchpad-lint-first-external-commitment`
- `probe_type`: `remote_mcp_server`
- `artifact_class`: `live_mcp_offering_probe`
- `offer_presented`: `AgenticMarket premium listing at $0.09 per call for @strange_loop/launchpad-lint`
- `target_persona`: `technical MCP builders preparing a first or early marketplace launch`
- `target_evidence_class`: `external_commitment`
- `minimum_evidence_quality`: `moderate`
- `success_rule`: `at least one external builder completes the two-call workflow, reports materially reduced launch ambiguity, and produces an external commitment signal such as willingness to reuse, request for continued use, or other concrete paid-intent behavior`
- `falsification_rule`: `if the lane remains live through the first launch cycle without external commitment, or if users complete the flow but still require heavy rewriting, do not mark the lane as a commercial continue`
- `started_at`: `2026-04-10T20:55:17Z`
- `ended_at`: `(open)`
- `status`: `active`
- `owner`: `skillfoundry`

## External Surface

- listing URL: `https://agenticmarket.dev/strange_loop/launchpad-lint`
- install command: `npx agenticmarket install @strange_loop/launchpad-lint`

## Interpretation

- Operational health and listing visibility are necessary preconditions.
- The probe does not count as commercially successful until external commitment or transaction evidence appears.
