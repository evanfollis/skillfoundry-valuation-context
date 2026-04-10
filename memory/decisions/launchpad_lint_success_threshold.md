# Decision: Launchpad Lint Success Threshold

## Decision

Treat the first `launchpad-lint` launch cycle as successful only if it clears all of
these conditions:

1. at least one user completes the full two-call activation path,
2. the user reports that launch ambiguity was materially reduced,
3. the output required only light editing before being considered usable,
4. there is no immediate evidence that the price is obviously mis-set.

## Date

2026-04-06

## Why

- Raw installs are too weak a signal for a narrow MCP product.
- One-call usage is not enough because the product promise depends on the two-step
  workflow.
- Quality matters as much as activation; cheap activation with bad outputs is false
  progress.
- Pricing should be judged only after the output has actually delivered value.

## Kill Threshold

If the first launch cycle fails on output quality or activation clarity, redesign the
product before trying to scale distribution.

If it fails mainly on price perception while quality is strong, revisit pricing before
changing the product shape.
