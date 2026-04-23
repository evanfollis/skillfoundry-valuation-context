# CURRENT_STATE — skillfoundry-valuation-context

> Maintained by tick sessions and reflection passes.
> **Accuracy over completeness.** Short and honest beats long and stale.

**Last updated**: 2026-04-23T14-20-22Z (reflection pass)

---

## Deployed / running state

- **Launchpad Lint** (`@strange_loop/launchpad-lint`): live on AgenticMarket. Runtime operational.
- **Preflight**: live on MCP Registry + Smithery + GitHub. Watcher active but NOT restarted — Mozilla/Linux reclassification fix is code_landed, not in-service.
- No web UI or API surface managed by this context repo directly.

## What's in progress

- **Preflight distribution probe**: Day 14 of 14 (window closes 2026-04-25). Activation metric met (Apr-14 curl/8.5.0). Evidence quality: weak. No new evidence in 14+ days. **35 hours remain; no deployment progress in 8 reflection windows. Probe will close inconclusive unless Evan acts tonight or tomorrow.**
- **Agentic inbound scaffolded** (tick 20:38Z Apr 17): All 3 probes have persona definitions, landing page specs, blog queues, demo video scripts, telemetry channel specs in `memory/venture/activation/`. None deployed — credential gap documented in general escalation handoff.
- **Preflight landing page** (code_landed): GET `/` route added to `products/preflight/src/index.ts`. Full SEO-optimized HTML. Awaiting wrangler deploy.
- **`.canon/` backfill** (code_landed, NOT pushed): `dcfd7e4` created 13 machine-readable JSON envelopes in `.canon/` via skillfoundry-harness discovery adapter v1. Claim reference fixed 2026-04-23 (see Known broken section — RESOLVED). Adversarial review run 2026-04-23 — 3 substantive findings pending principal verdict. **Push held pending (a) principal verdict on review findings, (b) push authorization per workspace "ask before pushes" rule.**

## Known broken or degraded

- ~~**[DEADLINE: TONIGHT ~midnight UTC] `stale_close_date` missing from 2 probes**~~ RESOLVED 2026-04-23 in commit `8a5f1ff` — both probes carry `stale_close_date: 2026-04-24` in backtick-metadata (files don't use YAML frontmatter).
- **[DEADLINE: APR 25 — 35 HOURS] Probe close note unwritten**: `memory/venture/evidence/2026-04-25-preflight-probe-close.md` not created. 6 consecutive reflections proposed this. Non-credential-blocked.
- ~~**`.canon/` has broken referential integrity**~~ RESOLVED 2026-04-23: evidence markdown `assumption_id` set to `preflight-distribution-signal-assumption`; migrate.py re-run; regenerated envelope now references an existing Claim (`preflight-distribution-signal-assumption.json`).
- **`.canon/` adapter review landed findings** (2026-04-23): `adversarial-review.sh` succeeded (EROFS previously reported was no longer blocking). Three substantive findings recorded at `skillfoundry-harness/.reviews/dcfd7e4-4d6050d-discovery-adapter-2026-04-23.md`: (1) `parse_probe` emits `promotion` phase on any closed probe regardless of decision — silent semantic corruption; (2) unknown enums silently coerce to plausible defaults (`evidence_class→internal_operational`, `supports→neutral`, `decision_type→continue`); (3) adapter couples to filesystem mtime/layout rather than being a stable harness boundary. **Push of `dcfd7e4` is held pending principal verdict: address findings vs explicitly accept.**
- **`.canon/` re-migration is non-idempotent**: policy file `effective_from`/`emitted_at` use `datetime.utcnow()` at emit, so every migrate.py run changes those timestamps even when input markdown is unchanged. Produces diff noise on every regeneration. Noted as a subclass of review finding #2.
- **Preflight probe not in `.canon/event_log/`**: `preflight-distribution-signal.md` uses prose/bold format; adapter cannot parse it. No EventLogEntry exists.
- **Watcher IGNORE_RE fix not yet in service**: `real-user-watcher.sh` updated but service not restarted. Needs `systemctl restart preflight-watcher` (sudo).
- **sourceType not deployed**: 4907d26 changes still code_landed. All events still emit without sourceType field.
- **latencyMs field is server processing time, NOT network round-trip.** ADR-0019 latency-floor discrimination is invalid. Use Mozilla/Linux IGNORE_RE as interim gate only.
- **Evidence store empty for non-Preflight probes.** No external contact in 14+ days.
- **CURRENT_STATE.md uncommitted**: Reflection passes update this file but cannot commit. **9th consecutive window.** If the next attended session runs `git checkout -- CURRENT_STATE.md`, this update is lost. **Commit it immediately on session start.**
- **URGENT handoffs unread for 84+ hours**: Filed at 02:28Z 2026-04-20; structurally invisible — `general` session reads `supervisor/handoffs/INBOX/`, not `/opt/workspace/runtime/.handoff/URGENT-*`. Only visible when an attended session opens in this specific project CWD.
- **No attended Evan sessions in 96+ hours**: Last human-driven project JSONL activity ~2026-04-19. Reflection mechanism functioning; consumption path absent for 8 windows.

## Blocked on (requires Evan)

- ~~**[TONIGHT]** Apply `stale_close_date: 2026-04-24`~~ DONE 2026-04-23 (commit `8a5f1ff`).
- **[APR 25]** Write probe close note: `memory/venture/evidence/2026-04-25-preflight-probe-close.md` — edit-only, not credential-blocked
- Push `dcfd7e4` after fixing canon claim_id reference and running `/review` (see above)
- `wrangler deploy` for preflight (landing page + sourceType) — **probe closes Apr 25; window closing**
- `systemctl restart preflight-watcher` (watcher IGNORE_RE fix)
- Launch Compliance Intelligence: intake form tool choice + price signal + hosting path
- Blog hosting path (Medium account, Cloudflare Pages, or worker routes)
- Demo video tooling
- Ratification signoff on `.canon/policies/skillfoundry.evidence_quality_note.json`

## Recent decisions

- **2026-04-19T04:31Z** — Canon adapter v1 backfill. 13 envelopes in `.canon/`. NOT pushed — integrity fix required before push. `/review` was not called; must run before treating canon store as settled. (URGENT handoff filed 2026-04-20, unread 84h+.)
- **2026-04-17T20:38Z** — `latencyMs` is server processing time, not network round-trip. ADR-0019 latency-floor discrimination corrected. Mozilla/Linux proxy rule added to IGNORE_RE as interim gate.
- **2026-04-17T20:38Z** — Agentic inbound design: principal outreach was a design misread; agent-operated inbound surfaces (landing pages, blogs, personas) are in scope without FINRA constraint.
- **2026-04-11 `tighten`** — Launchpad Lint kept live but not counted as commercial continue.
- **2026-04-11 `continue`** — Launch Compliance Intelligence advanced to live Stage 1.
- **2026-04-14** — Preflight activation metric met. Evidence: `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md`.

## What the next agent must read first

1. **Commit `CURRENT_STATE.md` first** — modified from reflection pass. Run `git add CURRENT_STATE.md && git commit -m "Record reflection state through Apr 23"` before any other work.
2. **Read and act on URGENT handoffs** at `/opt/workspace/runtime/.handoff/URGENT-skillfoundry-valuation-*.md` — 2 filed, unread for 84+ hours.
3. ~~**DEADLINE TONIGHT: Apply stale-close dates**~~ DONE 2026-04-23 (commit `8a5f1ff`).
4. **Write probe close note NOW** — `memory/venture/evidence/2026-04-25-preflight-probe-close.md`. 35 hours to close. Non-credential-blocked. Do not defer again.
5. **Do not push `dcfd7e4` as-is.** Fix `assumption_id` in evidence markdown → `preflight-distribution-signal-assumption`, re-run migrate.py, run `/review`, then push.
6. **Probe closes Apr 25 — 35 hours remain.** With no deployment trajectory, the probe will close as "single weak signal, agentic inbound never activated." Write the close note deliberately now rather than letting the window expire silently.
