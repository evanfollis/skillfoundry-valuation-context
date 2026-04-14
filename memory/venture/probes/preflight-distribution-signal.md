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

**Current state (2026-04-14):**
- Day 3 of 14.
- ~271 events/day, majority from `Chiark/0.1` and `node` UAs.
- 0 qualifying `tools/call` from non-crawler UAs.

**Monitoring:**
- `./products/preflight/scripts/usage.sh "24 hours ago"` — daily summary
- `preflight-watcher.service` — real-time alert to `/opt/projects/.alerts/preflight-real-user.log`
- Weekly cron: `/var/log/preflight-usage-weekly.log`
