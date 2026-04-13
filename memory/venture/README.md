# Stage 1 Venture Loop

This directory is the canonical home of the live Stage 1 commercial controller for
Skillfoundry.

Stage 1 objects:

- `CriticalAssumption`
- `Probe`
- `Evidence`
- `Decision`

Subdirectories:

- `assumptions/`: live critical assumptions owned by the current venture owner
- `probes/`: live and recently closed probes
- `evidence/`: typed evidence records linked to one assumption and one probe
- `decisions/`: explicit continue, tighten, pivot, pause, kill, or promote decisions

Rules:

- every active assumption must have one next probe
- every probe must pre-register a falsification rule
- every decision must cite evidence ids
- internal operational evidence may improve execution quality, but it may not justify promotion by itself
