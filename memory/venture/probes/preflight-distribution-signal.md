# Probe: Preflight distribution yields real-user calls

**Assumption under test:** Listing Preflight on MCP Registry + Smithery + GitHub produces organic inbound traffic from MCP server developers who actually run `check_publish_readiness` (not just crawlers/indexers).

**Evidence class:** external_conversation (real user invocation = weak conversation signal)

**Probe window:** 2026-04-11 → 2026-04-25 (14 days from Registry publish)

**Activation metric:** ≥1 `tools/call` invocation with a non-crawler User-Agent from a distinct source.

Known crawler/non-user UA substrings (exclude from signal):
- `Chiark` (agent quality index)
- `402.ad-mcp-probe`
- `python-httpx` (unless paired with non-default behavior)
- `test-verify` (our own probes)
- Smithery inspector (no UA / `node` UA from Smithery gateway)

**Falsification threshold:**
- 14 days, zero qualifying `tools/call` → distribution is the problem, not the product.
- Action if falsified: retitle/rewrite Smithery description, audit MCP Registry search ranking, consider GitHub Action variant.

**Do NOT falsify on:**
- Absence of paid conversions. Preflight is the free wedge; paid fix tool doesn't exist yet.
- Crawler volume. High crawler traffic ≠ signal.

**Current state (2026-04-17):**
- Day 6 of 14. Probe window runs through 2026-04-25.
- **Activation metric MET**: 1 qualifying `tools/call` confirmed from `curl/8.5.0` on 2026-04-14T12:58:07Z, session `cb67e62e-6a72-4dd1-ac1e-4ce30ee85544`. preflight-watcher classified as real-user signal (not in IGNORE_RE list).
- Formal evidence recorded: `memory/venture/evidence/2026-04-14-preflight-first-real-user-call.md`
- Evidence quality: `weak` — single invocation, `checks_pass` result, no friction observed, no follow-up.
- Probe continues — activation threshold met but one weak signal does not answer the core question of whether builders have real pain.

**Excluded signal (Apr 16):**
- `python-httpx` UA scanned multiple directories, returned `fixable` results. Filtered by watcher IGNORE_RE. Do not record — insufficient attribution (could be automation or testing).

**Design gap:**
- Probe is passive. Distribution is yielding real-user calls (activation metric met), but converting passive visitors to committed buyers requires an active outreach channel that does not yet exist. No current path from anonymous `curl` invocation to paid engagement.

**Monitoring:**
- `./products/preflight/scripts/usage.sh "24 hours ago"` — daily summary
- `preflight-watcher.service` — real-time alert to `/opt/workspace/runtime/.alerts/preflight-real-user.log`
- Weekly cron: `/var/log/preflight-usage-weekly.log`
