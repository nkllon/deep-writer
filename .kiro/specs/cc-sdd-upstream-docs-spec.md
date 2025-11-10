# CC‑SDD Docs & CLI Clarity Spec (Upstream Feedback)

## Problem Statement
Agents and users confuse the chat/IDE slash command `/kiro/...` with a filesystem path or a local binary. Some environments also have an unrelated `kiro` executable on PATH, causing mis-execution. Result: failed installs, wrong wrappers, and inconsistent usage across agents.

## Goals
- Make it obvious: “CLI vs Chat” (terminal command vs slash command).
- Provide unambiguous installation and invocation instructions for terminal usage.
- Add machine-friendly discovery/diagnostics to help tools pick the right binary.

## Non‑Goals
- No changes to template content or agent manifests beyond wording/links.
- No mandate on a single package manager; multiple install paths are OK.

## Proposed Changes
1) First‑screen banner in README and docs
   - Bold boxed notice at top: “Terminal CLI = `cc-sdd` (or packaged binary). Chat/IDE slash commands = `/kiro/...` (not a path).”
   - Repeat the callout in quickstart and examples.

2) Dual example blocks for every command
   - Terminal: `cc-sdd --cursor --lang en --yes`
   - Chat/IDE: `/kiro/spec-init <what-to-build>`
   - Always label them “Terminal” vs “Chat/IDE”.

3) Multiple frictionless installers
   - npm global: `npm i -g cc-sdd` (exposes `cc-sdd`)
   - Homebrew tap (optional): `brew install <tap>/cc-sdd`
   - One‑liner script: `curl -fsSL https://…/install.sh | bash` (adds `cc-sdd` to PATH)
   - Verification: `cc-sdd --version`

4) Discovery and diagnostics for agents
   - Resolution order for embedding tools:
     - `$KIRO_CLI` (explicit override to the CLI path)
     - `cc-sdd` on PATH (preferred terminal name)
   - New commands:
     - `cc-sdd where` → prints resolved CLI path
     - `cc-sdd doctor` → checks PATH, permissions, environment; outputs actionable guidance
   - JSON help: `cc-sdd --help --format=json` for machine parsing.

5) “Embedding guide” page
   - How wrappers should resolve the CLI (env → PATH).
   - Non‑interactive flags (`--yes`, fallback behaviors) and exit codes.
   - Example wrappers for bash/PowerShell/Node.

6) Kill ambiguity at the source
   - Never show `/kiro` alone in terminal sections.
   - Where slash commands appear, append: “Slash command (chat/IDE). Terminal equivalent below.”

## Acceptance Criteria
- README front matter includes the CLI vs Chat banner.
- Quickstart shows both Terminal and Chat/IDE usage for spec/steering commands.
- At least one installer method documented (npm); others optional but recommended.
- `cc-sdd where` and `cc-sdd doctor` implemented and documented.
- `--help --format=json` documented and returns stable schema.
- “Embedding guide” exists and is linked from README and templates.

## Risks & Mitigations
- Multiple names (cc‑sdd, kiro) increase confusion → Docs banner + dual examples.
- Agents differ in PATH/env → Provide `$KIRO_CLI` override + `where`/`doctor`.

## References
- Upstream repo: https://github.com/gotalab/cc-sdd (package `tools/cc-sdd`)
- Example consumer repo: this project’s wrapper and Make targets.


