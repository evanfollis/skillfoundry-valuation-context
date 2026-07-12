# Decision: 2026-07-12 park the Launch Compliance Intelligence outreach lane

- `decision_id`: `2026-07-12-park-launch-compliance-intelligence-lane`
- `assumption_id`: `launch-compliance-intelligence-first-paid-review`
- `probe_id`: `launch-compliance-intelligence-manual-offer`
- `decision_type`: `pause`
- `timestamp`: `2026-07-12T21:45:00Z`
- `decided_at`: `2026-07-12T21:45:00Z`
- `recorded_at`: `2026-07-12T21:45:00Z`
- `owner`: `skillfoundry`
- `authority`: principal instruction, 2026-07-12 — direct session instruction to the skillfoundry PM to "make the reversible park disposition explicit". This is option 2 ("Park explicitly") of the three options the system itself escalated on 2026-05-02 and again on 2026-05-09.
- `supporting_frame`: ADR-0033 (passive-income portfolio abstraction); skillfoundry `CLAUDE.md` ("manual-offer probes (LCI) are valid as learning samples but must convert to self-serve or automated fulfillment... They are not the default acquisition mode.")
- `evidence_refs`:
  - `2026-04-11-launch-compliance-intelligence-selection-basis`
  - probe `launch-compliance-intelligence-manual-offer` — opened 2026-04-11, `stale_close_date` 2026-04-24, never closed
  - zero external evidence of any class against this assumption (no `external_conversation`, `external_commitment`, or `external_transaction`)

## Decision

Park the LCI manual-offer lane. This is a **reversible portfolio-allocation
decision, not a verdict that the assumption is false.** The claim is preserved;
only the probe against it stops.

No external message is sent. No target, draft, transcript, or artifact is
deleted.

## Rationale

The probe was opened 2026-04-11 with a `stale_close_date` of **2026-04-24**. It
has sat at `status: active` for **79 days past its own contractual close date**
with all 10 outreach drafts at `drafted` and zero messages sent. Its
`falsification_rule` was never exercised, because the probe never made external
contact.

That is the actual state: the lane did not fail its test, it never ran its test.
The blocking constraint is structural, not analytical — the probe requires
principal-initiated external contact, and the principal does not do outbound
contact. An assumption that can only be tested by a channel the system will not
use is not a testable assumption *as currently framed*.

Meanwhile the foundry's centre of gravity moved to passive/self-serve channels
under ADR-0033. Holding LCI open as an "active" lane produced a recurring
escalation every 12h reflection cycle for two months while producing **zero new
information**. The escalation loop was consuming attention and health pressure
as a substitute for a decision.

## Why `pause`, not `kill` or `continue`

- **Not `continue`**: the required evidence class (`external_conversation`) was
  never obtained. Treating internal readiness — a live landing page, a harvested
  target list, ten well-drafted messages — as commercial progress is exactly
  what workspace `CLAUDE.md` and ADR-0033 forbid. Continuing would keep the loop
  escalating on an untestable frame.
- **Not `kill`**: killing asserts the assumption was falsified. It was not.
  Nothing external ever tested it. A `kill` would destroy a genuinely useful
  harvested target list and a coherent problem thesis on the basis of *our own*
  inaction, which would be reasoning from an absence we created.
- **`pause`** states the truth: the probe-as-framed is done asking its question
  through a channel we will not use; the claim survives intact; the artifacts
  stay on disk; a future zero-touch reframing can pick it up.

The L1 canon adapter maps `decision_type=pause` → `kind=continue` (non-terminal;
the claim is preserved) with a `[skillfoundry-type=pause]` rationale marker, per
`_DECISION_KIND_MAP` in `discovery_adapter/emit.py`. The mapping is
acknowledged lossy; the marker preserves pause-distinct-from-continue in canon.

## Resume condition

Resume only on a **positive** signal — not on the mere passage of time, and not
because the drafts still exist:

1. an inbound request that independently surfaces compliance/readiness pain; or
2. fresh external evidence of buyer demand for the narrow review; or
3. a materially better **zero-touch** channel (self-serve, agentic, or
   marketplace-mediated) that does not require principal-initiated outreach; or
4. explicit principal reprioritization.

On resume, the 10 existing drafts are **historical inputs, not a send queue**.
Every target must be re-verified before any use: the list was harvested
2026-04-11 and is now ~3 months stale. Repos may be archived, handles dead,
projects abandoned. Re-check before contact.

## Preserved artifacts (dormant, not deleted)

All retained in place:

- `skillfoundry-researcher-context/memory/signals/outreach_queue.md` — 10 rows
- `skillfoundry-researcher-context/memory/signals/outreach_drafts/` — 10 drafts
- `skillfoundry-researcher-context/memory/signals/launch_compliance_target_list.md`
- `skillfoundry-researcher-context/memory/reports/launch_compliance_{harvest,enrichment}_report.md`
- `skillfoundry-researcher-context/memory/assumptions/launch-compliance-intelligence.md`
- `skillfoundry-researcher-context/memory/probes/drafts/launch-compliance-intelligence-manual-offer.md`
- `skillfoundry-researcher-context/scripts/launch_compliance_target_{harvest,enrich}.py`
- this repo's assumption, probe, evidence, and activation notes

The drafts contain **real named individuals and live contact addresses**. Parked
means dormant: nothing in this set is a send-ready queue, and no automated loop
may treat it as one.

## Consequences

- The LCI probe leaves the Stage-1 active ledger. Reflection cycles stop
  escalating "10 unsent drafts" as an open principal blocker — the disposition
  now exists, so the loop has its answer.
- The `lci.pages.dev` landing page stays up. The Tally-form placeholder is **no
  longer a blocker** — it was only a blocker in service of an outreach lane that
  is now parked. It drops off the "Blocked on (requires Evan)" list rather than
  being carried indefinitely.
- If LCI resumes through a zero-touch channel, that channel reports against
  ADR-0033 portfolio metrics (first passive paid event, channel-attributed
  activation, repeat use without principal intervention), not against this
  probe's original manual-offer success rule.

## Provenance note (ADR-0047)

An executive handoff proposing this park (`general` → `skillfoundry`,
2026-07-12) was **rejected fail-closed twice** by the ADR-0047
requirement-provenance gate for `missing required provenance fields: authority
external_dependencies policy_compatibility`, and quarantined at
`runtime/.handoff/REJECTED/{bee3196647fb,1b73f0d58184}-skillfoundry-park-lci-lane-2026-07-12.md`.

Those artifacts are **preserved as evidence** and were not executed. The gate was
correct to fire: `authority` was missing because none had been established — the
2026-05-09 URGENT states plainly that this is a *"principal decision required; no
automation can resolve it"* with exactly three options (Unblock / Park explicitly
/ Kill). The executive was self-authorizing a decision the system had reserved
to the principal.

This Decision does not launder that handoff. Its authority is the principal's
own direct instruction of 2026-07-12, which selects option 2. Recording it here
is what makes the authority inspectable rather than assumed.
