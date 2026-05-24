#!/usr/bin/env bash
# Verify public docs match code truth and founder-voice rules.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP_ROOT="${NOTIKY_APP_ROOT:-$(cd "$ROOT/../notiky-app" 2>/dev/null && pwd || true)}"
CATALOG="${APP_ROOT}/server/internal/daemon/provider_catalog.go"

cd "$ROOT"
FAIL=0

echo "verify-docs-accuracy: scanning $ROOT ..."

if rg -n -i 'mintlify|fumadocs' --glob '*.mdx' . 2>/dev/null; then
  echo "verify-docs-accuracy: platform name in user-facing MDX"
  FAIL=1
fi

if [[ -f "$CATALOG" ]]; then
  while IFS= read -r name; do
    [[ -z "$name" ]] && continue
    if ! rg -q "$name" agents.mdx welcome.mdx cloud-quickstart.mdx cli/reference.mdx 2>/dev/null; then
      echo "verify-docs-accuracy: missing provider DisplayName in docs: $name"
      FAIL=1
    fi
  done < <(grep -oE 'DisplayName: "[^"]+"' "$CATALOG" | sed 's/DisplayName: "//;s/"$//')
else
  echo "verify-docs-accuracy: warn — provider catalog not found at $CATALOG"
fi

ENV_VARS=(NOTIKY_CLAUDE_PATH NOTIKY_CODEX_PATH NOTIKY_OPENCODE_PATH NOTIKY_CURSOR_PATH NOTIKY_COPILOT_PATH NOTIKY_OPENCLAW_PATH NOTIKY_HERMES_PATH NOTIKY_GEMINI_PATH NOTIKY_PI_PATH)
for v in "${ENV_VARS[@]}"; do
  if ! rg -q "$v" cli/reference.mdx 2>/dev/null; then
    echo "verify-docs-accuracy: missing env var in cli/reference.mdx: $v"
    FAIL=1
  fi
done

for cmd in "daemon restart" "task search" "setup"; do
  if ! rg -q "$cmd" cli/reference.mdx cloud-quickstart.mdx welcome.mdx 2>/dev/null; then
    echo "verify-docs-accuracy: missing CLI mention: notiky $cmd"
    FAIL=1
  fi
done

while IFS= read -r -d '' f; do
  lines=$(wc -l < "$f" | tr -d ' ')
  base=$(basename "$f")
  case "$base" in
    welcome.mdx|capabilities.mdx|troubleshooting.mdx) min=60 ;;
    cloud-quickstart.mdx|tasks.mdx|agents.mdx) min=80 ;;
    *) min=0 ;;
  esac
  if [[ "$min" -gt 0 && "$lines" -lt "$min" ]]; then
    echo "verify-docs-accuracy: $f too short ($lines lines, min $min)"
    FAIL=1
  fi
done < <(find . -name '*.mdx' ! -path './research/*' -print0)

if [[ "$FAIL" -ne 0 ]]; then
  echo "verify-docs-accuracy: FAILED"
  exit 1
fi

echo "verify-docs-accuracy: OK"
