# Evidence: preflight first real-user tool invocation

- `evidence_id`: `2026-04-14-preflight-first-real-user-call`
- `assumption_id`: `mcp-builders-need-publish-readiness-check`
- `probe_id`: `preflight-distribution-signal`
- `evidence_class`: `external_conversation`
- `evidence_quality`: `weak` — single invocation, no pain articulated, no follow-up, verdict was `checks_pass` (tool worked but no friction observed)
- `source_type`: `tool_invocation_log`
- `source_identity`: `curl/8.5.0 user, session cb67e62e-6a72-4dd1-ac1e-4ce30ee85544`
- `observed_at`: `2026-04-14T12:58:07Z`
- `summary`: Real user (curl/8.5.0) ran check_publish_readiness on mcp_registry directory on Day 3 of the probe window. Result: checks_pass. User agent not in known-crawler list. preflight-watcher classified this as a real-user signal. Probe activation metric (≥1 qualifying tools/call) is met.
- `raw_pointer`: `/opt/workspace/runtime/.alerts/preflight-real-user.log`
- `supports`: `supports_assumption`
- `confidence`: `moderate` — real user agent confirmed by watcher, but single session with no follow-up

## What actually happened

Raw log entry from preflight-watcher:

```
[2026-04-14T12:58:07+00:00] REAL-USER ua=curl/8.5.0
{
  "environment": "production",
  "sessionId": "cb67e62e-6a72-4dd1-ac1e-4ce30ee85544",
  "userAgent": "curl/8.5.0",
  "verdict": "checks_pass",
  "targetDirectories": ["mcp_registry"],
  "assumptionId": "mcp-builders-need-publish-readiness-check",
  "probeId": "preflight-publish-readiness",
  "probeType": "remote_mcp_server",
  "skillSlug": "preflight",
  "type": "session_completed"
}
```

## ID discrepancy — flag for next session

The watcher log emits `assumptionId: mcp-builders-need-publish-readiness-check` and `probeId: preflight-publish-readiness`. Neither matches a formal file in this venture directory:

- No `memory/venture/assumptions/mcp-builders-need-publish-readiness-check.md` exists
- The probe file is `preflight-distribution-signal.md`, not `preflight-publish-readiness`

This evidence file uses the log's `assumption_id` verbatim (preserving provenance) and maps `probe_id` to the existing probe file slug (`preflight-distribution-signal`). The missing assumption file should be created or the watcher config updated so IDs align. Until then, cross-joins on `assumption_id` will miss this evidence.

## What this does NOT show

- No pain articulated — the user ran the tool and got `checks_pass`. No friction, no follow-up.
- Whether the user is a builder preparing a real launch or testing the tool in isolation is unknown.
- No commitment, no contact, no return visit recorded.

## Apr 16 httpx session — excluded

A `python-httpx` UA session on Apr 16 scanned multiple directories and returned `fixable` results. Filtered by watcher IGNORE_RE. Insufficient attribution — do not record.
