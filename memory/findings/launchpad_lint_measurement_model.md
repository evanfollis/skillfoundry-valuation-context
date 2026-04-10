# Launchpad Lint Measurement Model

## Goal

Translate the current `launchpad-lint` launch plan into a measurable learning model.

## Core Prediction Chain

The current system is implicitly predicting:

1. builders have real pain around launch readiness and listing preparation
2. `launchpad-lint` can reduce that ambiguity in one short session
3. a two-call session at `$0.18` total is cheap enough to try
4. enough users will find the outcome useful to justify keeping the lane alive

## What Must Be Measured

### Activation

- install to first paid call
- completion of the two-call session:
  - `audit_launch_readiness`
  - `draft_launch_package`

### Usefulness

- whether the user reports reduced launch ambiguity
- whether generated output required only light editing

### Economic Signal

- calls per first session
- repeat usage within the first launch cycle

## Failure Modes To Detect Early

- users install but do not make the first call
- users make the audit call but do not continue to the draft call
- users complete both calls but still feel they need substantial manual rewriting
- users perceive the price as high relative to the output quality

## Update Rule

If the failure is:

- positioning: send learning to `growth`
- product surface or output quality: send learning to `designer` and `builder`
- pricing mismatch: send learning to `pricing`
- mistaken bottleneck ranking: send learning back to `researcher`
