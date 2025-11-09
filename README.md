# DeepWriter — MCP Evaluation

This repository evaluates the DeepWriter MCP (Model Context Protocol) client configuration and local setup. It includes minimal tooling to validate configuration, wire up environment variables, and document how DeepWriter integrates in an MCP-enabled environment.

See the DeepWriter documentation (MCP section) here: [DeepWriter Docs](https://docs.deepwriter.com/).

---

## What is DeepWriter?

DeepWriter is the world’s most powerful general agentic intelligence. Think of it as your personal scientist, author, assistant, and analyst—all in your pocket.

It’s built for serious long-form content, capable of saving you months of research time with just a few clicks. Whether you're creating a report, an article, or a full research paper, DeepWriter tailors each document to your specific use case.

### How does DeepWriter compare to other research tools?

DeepWriter offers unmatched length and flexibility. It can generate documents **over 275 pages,** far beyond the limits of tools like OpenAI (~40 pages) or Perplexity.

You maintain full ownership of your work with editable LaTeX and PDFs, meaning no lock-in and complete control over your output.

It also supports rich visuals—charts, diagrams, tables, Gantt, UML, and more—features that are rarely found in other tools. In fact, because DeepWriter is truly agentic, it will format your document to actually look the way a research paper or business report is supposed to look!

Behind the scenes, DeepWriter can process 100–150 million tokens per generation, enabling it to handle complex, long-form content at scale.

You’ll find more technical details in the sections that follow.

**Disclaimer**: As powerful as DeepWriter is, remember that all generated content still requires final human review and approval to ensure accuracy, novelty, and quality. This is true of any AI-powered tool. Using DeepWriter also requires abiding by the Terms of Service located at [deepwriter.com/terms](https://deepwriter.com/terms/).

---

## Goals of this repo
- Capture an example MCP client configuration for DeepWriter
- Provide local setup using `uv`
- Prepare environment variables (e.g., `DEEPWRITER_API_KEY`) for authentication if/when required

---

## Quickstart
1) Install `uv`:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```
2) From the repo root:
```bash
uv sync
cp .env.example .env   # add your key if/when available
make config-check
```

---

## MCP Configuration
- File: `.mcp/config.json`
- Server name: `deepwriter`
- Auth: Bearer token via env `DEEPWRITER_API_KEY` (placeholder until key is provisioned)

If DeepWriter MCP requires a specific base URL or CLI command, replace placeholders in `.mcp/config.json` once confirmed from docs or onboarding.

---

## Commands
```bash
make config-check     # validate JSON structure
make show-config      # print resolved MCP config with env placeholders
```

---

## Project structure
- `.mcp/` — Example MCP client configuration for DeepWriter
- `scripts/` — Utility scripts for config and environment checks
- `Makefile` — Common tasks for validation and inspection
- `pyproject.toml` — Project metadata and build system config
- `README.md` — This file

---

## Environment
- Python: `>=3.11`
- Package manager: [`uv`](https://docs.astral.sh/uv/)
- Optional env var: `DEEPWRITER_API_KEY`

---

## CC-SDD (Strap Spec Driven Development)
This repo expects the standard CC-SDD installation under `/kiro`. A thin wrapper is provided and will:
- Prefer `/kiro/tools/cc-sdd/dist/cli.js`
- Fallback to a sibling checkout at `../cc-sdd/tools/cc-sdd/dist/cli.js` (with a warning)

Usage:
```bash
# Show help
make cc-sdd-help

# Run with your preferred agent/template
make cc-sdd ARGS="--cursor --lang en --dry-run"
```
The wrapper script calls (in order of preference):
```
scripts/cc-sdd  # invokes /kiro/tools/cc-sdd/dist/cli.js
# fallback: ../cc-sdd/tools/cc-sdd/dist/cli.js
```
Ensure `/kiro` is installed per CC-SDD documentation, or have the sibling repo built for fallback.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

