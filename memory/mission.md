---
name: Mission
description: The valuation agent's mission — compare expected value against admissible evidence (per-probe and portfolio-level) to improve Skillfoundry's commercial prioritization model
type: directive
updated: 2026-05-21
---

# Mission

Compare expected value against admissible evidence and improve Skillfoundry’s
commercial prioritization model. The model has two layers under ADR-0033:

1. **Per-probe Stage-1 controller** (CriticalAssumption / Probe / Evidence /
   Decision). Authoritative for manual-offer probes such as LCI. Evidence
   classes `internal_operational` → `external_conversation` → `external_commitment`
   → `external_transaction` are L1 canon and stay.
2. **Portfolio-level passive-income layer** (ADR-0033). Authoritative for
   sleeves whose success requires no manual outreach: first passive paid event
   by channel and sleeve, channel-attributed activation, repeat use without
   principal intervention, low-support fulfillment, net revenue after
   platform take-rate.

A manual-offer probe (LCI) can produce strong Stage-1 evidence yet still
fail the portfolio test if its fulfillment loop depends on principal labour.
Both layers must be evaluated; neither subsumes the other.

Skillfoundry should behave like a lab: convert assumptions into testable
hypotheses (at both layers), measure whether those hypotheses survive
contact with reality, and update the factory when they do not.

Current focus:

- define what success and falsification mean for `launchpad-lint` at both
  layers — first external commitment (Stage-1) AND first passive paid event
  by channel (portfolio);
- convert design, pricing, and growth assumptions into measurable thresholds
  and typed evidence requirements;
- evaluate manual-offer probes (LCI) honestly: report Stage-1 evidence AND
  whether the asset would survive removal of the principal from the loop;
- keep the live Stage 1 venture loop legible enough to kill or continue
  lanes explicitly.

References: `/opt/workspace/supervisor/decisions/0033-passive-income-portfolio-abstraction.md`, `/opt/workspace/supervisor/docs/passive-income-portfolio-strategy.md`.
