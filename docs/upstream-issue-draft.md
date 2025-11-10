# Proposal: Clarify CC‑SDD CLI vs Chat Commands; Add Tooling for Agents

Upstream repo: https://github.com/gotalab/cc-sdd (package `tools/cc-sdd`)

## Summary
Users and agents often confuse the chat/IDE slash commands (`/kiro/...`) with a terminal path or local binary. Some systems also have an unrelated `kiro` executable on PATH. This leads to mis-execution and failed installs.

## What’s happening
- Docs/examples show `/kiro/...`, which looks like a filesystem path.
- Agents (and humans) try to execute `/kiro` in a terminal.
- Environments may contain a different `kiro` binary, causing the wrong tool to run.

## Proposal
1) Add a bold banner to README/docs:
   - “Terminal CLI is `cc-sdd` (or packaged binary). Chat/IDE slash commands are `/kiro/...` (not a path).”
2) Show dual examples everywhere (Terminal vs Chat/IDE) for all common tasks.
3) Document installers:
   - `npm i -g cc-sdd` (exposes `cc-sdd`)
   - Optional: Homebrew and a one-liner installer
4) Add agent-friendly discovery/diagnostics:
   - `$KIRO_CLI` env override → `cc-sdd` on PATH
   - `cc-sdd where` prints resolved CLI
   - `cc-sdd doctor` checks PATH/permissions and outputs guidance
   - `cc-sdd --help --format=json` for machine parsing
5) Provide an “Embedding guide” for wrappers in agents/IDEs.

## Benefits
- Eliminates the path vs slash-command confusion
- Reduces agent integration bugs
- Improves first-run success for both humans and tools

## Suggested acceptance
- README banner + dual examples merged
- At least npm install path documented (others optional)
- `where`, `doctor`, JSON `--help` implemented and documented

Thanks for an excellent tool—happy to PR the docs and CLI enhancements above if desired.


