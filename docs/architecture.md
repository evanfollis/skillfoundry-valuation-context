# Architecture

This `context` repository is the valuation agent’s durable Git-backed lineage
and the authoritative Stage 1 commercial evidence surface. `skillfoundry.toml`
declares identity, front-door pins, and promotion policy. `memory/venture/`
owns assumptions, probes, evidence, and explicit decisions. `.canon/` is a
machine-emitted projection validated against the external discovery-framework
contract; it is not a second source of truth.

`runs/` and raw artifacts are non-canonical execution surfaces. The tracked
`index.md` is a generated navigation projection built by
`scripts/build-index.sh`.

## July 2026 transition exceptions

The provider-neutral instruction front door and existing mission/profile
prompts lack a fresh ADR-0039 baseline. Owner: Skillfoundry valuation context;
milestone: create a production-grounded eval loop before central conformance
advances from `migrating`. `runs/` still contains a tracked placeholder and is
not yet declared as an ignored runtime path. The tracked canon projection’s
absolute provenance URIs require a compatibility migration before any
filesystem rename. Host containment gaps remain supervisor-owned under
ADR-0050.
