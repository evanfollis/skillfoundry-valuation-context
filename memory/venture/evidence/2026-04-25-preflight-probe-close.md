# Evidence: preflight-distribution-signal probe — close note

- `evidence_id`: `2026-04-25-preflight-probe-close`
- `assumption_id`: `preflight-distribution-signal-assumption`
- `probe_id`: `preflight-distribution-signal`
- `evidence_class`: `internal_operational`
- `evidence_quality`: `weak`
- `source_type`: `probe_close_synthesis`
- `source_identity`: `skillfoundry session (routed from executive handoff 2026-04-23T15:10Z)`
- `observed_at`: `2026-04-25T00:00:00Z`
- `summary`: Preflight distribution probe closes at the end of its 14-day window with a single weak real-user signal and no deployment of the agentic inbound surface scaffolded mid-window. The probe does not answer the core question about builder pain; it answers only that distribution produces incidental invocations.
- `raw_pointer`: `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md`
- `supports`: `weakens_assumption`
- `confidence`: `moderate` — the operational facts are well-attested (watcher logs, commit history, deployment state); the interpretation (weak signal, not a continue) is a judgment call but one the falsification rule calls for.

## What happened across the probe window (2026-04-11 → 2026-04-25)

- **Day 3 (2026-04-14)**: Single qualifying `tools/call` from `curl/8.5.0`, session `cb67e62e-6a72-4dd1-ac1e-4ce30ee85544`. Verdict `checks_pass`. No pain articulated, no follow-up, no return visit. Recorded in `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md`. Activation metric MET, evidence quality `weak`.
- **Day 6 (2026-04-17)**: Watcher reclassification. The prior REAL-USER count (189) was reduced to 1 after discovering `latencyMs` is server processing time, not network round-trip — 188 Mozilla/Linux events were self-traffic or indistinguishable from it. The Apr-14 curl event remained the sole confirmed external signal. Mozilla/Linux added to IGNORE_RE as a conservative interim gate.
- **Day 6 (2026-04-17)**: Agentic inbound surface scaffolded in `memory/venture/activation/preflight-inbound-activation.md` — persona, landing page spec, blog queue, demo video scripts, telemetry channel. All code_landed, none deployed (credential gap: `wrangler deploy` not executed).
- **Day 8–14 (2026-04-19 → 2026-04-25)**: No additional admissible evidence. Watcher IGNORE_RE fix not yet in-service (no service restart). `sourceType` field changes still code_landed, not deployed. No external builder contact; no inbound surface activation.

## Why this closes and not continues

The probe's success rule required at least one qualifying `tools/call` with a non-crawler UA from a distinct source. That threshold was met literally (1 qualifying call), but the underlying question — "do builders have real pain that Preflight addresses?" — received no signal beyond a 0-friction `checks_pass` from an anonymous `curl` session.

The falsification rule named "14 days, zero qualifying `tools/call` → distribution is the problem." This probe did not hit zero, so the literal falsification condition was not triggered. But the probe's interpretation section stated: "activation threshold met but one weak signal does not answer the core question of whether builders have real pain." That is the outcome realized here — activation without commercial or pain signal.

## Operational context that weakens the signal further

- **Inbound surface never activated**. The agentic inbound design (landing page, blog, demo video, telemetry channel) was specified but not deployed in the window. The probe observed passive distribution only. A continue verdict would require at least one cycle of active inbound attribution before calling the distribution assumption answered.
- **Reclassification removed 188 events that had been counted as real users**. The pre-retrofit picture (189 REAL-USER events) would have supported a very different reading. The single post-retrofit event is the only defensible data point, and it is weak.
- **No external commitment or conversation beyond the initial call**. No return invocation, no follow-up, no identifiable persona, no pain articulation. This does not clear the bar for advancing to a commercial continue.

## Honest verdict

The probe closes as **weakens_assumption**, not falsifies. The literal falsification threshold was not hit, but the evidence does not support a continue. Record the probe as an activation-met-but-inconclusive close — distribution produced one invocation, and that invocation did not answer the commercial question.

## What the probe did not show

- Whether builders have real publish-readiness pain at a level that converts.
- Whether the inbound surface design would have produced attributable signals had it been deployed.
- Whether the Apr-14 curl user was a real builder preparing a launch or someone testing the tool in isolation.
- Any information about pricing sensitivity — no paid conversion was attempted or expected in this probe.

## Pointers

- Real-user evidence: `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md`
- Probe definition: `memory/venture/probes/preflight-distribution-signal.md`
- Assumption: `memory/venture/assumptions/preflight-distribution-signal-assumption.md`
- Activation scaffold (not deployed): `memory/venture/activation/preflight-inbound-activation.md`
- Watcher reclassification note: embedded in Apr-14 evidence file under "Watcher reclassification — 2026-04-17".
- Routing handoff: `/opt/workspace/runtime/.handoff/skillfoundry-valuation-deadline-2026-04-23T15-10Z.md`
