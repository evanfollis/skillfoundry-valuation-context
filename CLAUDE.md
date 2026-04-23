---
name: CLAUDE directives
description: Agent directives for skillfoundry-valuation-context; always-load declaration for sub-repo sessions
type: directive
updated: 2026-04-23
---

# skillfoundry-valuation-context

context-always-load:
  - CURRENT_STATE.md
  - memory/mission.md
  - memory/profiles/valuation.md

This is the canonical context lineage for the Skillfoundry valuation agent.
CURRENT_STATE.md is maintained by tick sessions and reflection passes —
read it first every session. The `memory/` tree holds the durable agent
mind: mission, profile, plans, decisions, venture loop records.

See `../CLAUDE.md` for skillfoundry-root conventions.
