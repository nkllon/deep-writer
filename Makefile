setup:
	uv sync

config-check:
	python - << PY
import json,sys; json.load(open(.mcp/config.json)); print([OK]

home-env:
	cp .env ~/.env
	@echo "[OK] Copied .env to ~/.env (edit as needed)"
