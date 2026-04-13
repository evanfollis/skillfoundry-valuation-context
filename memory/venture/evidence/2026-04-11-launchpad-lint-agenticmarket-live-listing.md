# Evidence: 2026-04-11 launchpad-lint AgenticMarket live listing

- `evidence_id`: `2026-04-11-launchpad-lint-agenticmarket-live-listing`
- `assumption_id`: `launchpad-lint-first-external-commitment`
- `probe_id`: `launchpad-lint-agenticmarket-live-listing`
- `evidence_class`: `internal_operational`
- `evidence_quality`: `strong`
- `source_type`: `public_listing_and_runtime_verification`
- `source_identity`: `agenticmarket.dev listing plus public skillfoundry health check`
- `observed_at`: `2026-04-11T01:39:34Z`
- `summary`: `The AgenticMarket listing for @strange_loop/launchpad-lint returned HTTP 200 and rendered a live premium listing showing $0.09 per call. The Skillfoundry runtime health endpoint also returned 200 OK, confirming the backing service was live.`
- `raw_pointer`: `https://agenticmarket.dev/strange_loop/launchpad-lint ; https://skillfoundry.synaplex.ai/products/launchpad-lint/health`
- `supports`: `operational_readiness_only`
- `confidence`: `high`

## Interpretation

- This evidence supports that the probe is live and externally reachable.
- It does not satisfy the probe's required evidence class of `external_commitment`.
- It must not be used to promote the lane into Stage 2 or to claim commercial success.
