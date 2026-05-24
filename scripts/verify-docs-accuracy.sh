#!/usr/bin/env bash
# Verify public docs match code truth and founder-voice rules.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP_ROOT="${NOTIKY_APP_ROOT:-$(cd "$ROOT/../notiky-app" 2>/dev/null && pwd || true)}"
CATALOG="${APP_ROOT}/server/internal/daemon/provider_catalog.go"
SHOTS="${ROOT}/SHOTS.md"

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

# PNG assets listed in SHOTS.md must exist and meet minimum size
png_min_bytes() {
  case "$1" in
    workspaces-switcher.png) echo 10000 ;;
    quickstart-new-agent.png) echo 12000 ;;
    *) echo 15000 ;;
  esac
}
if [[ -f "$SHOTS" ]]; then
  while IFS= read -r png; do
    [[ -z "$png" ]] && continue
    if [[ ! -f "images/$png" ]]; then
      echo "verify-docs-accuracy: missing screenshot: images/$png"
      FAIL=1
    elif command -v stat >/dev/null 2>&1; then
      size=$(stat -f%z "images/$png" 2>/dev/null || stat -c%s "images/$png" 2>/dev/null || echo 0)
      min=$(png_min_bytes "$png")
      if [[ "$size" -lt "$min" ]]; then
        echo "verify-docs-accuracy: screenshot too small (${size} bytes, min ${min}): images/$png"
        FAIL=1
      fi
    fi
  done < <(grep -oE '`[a-z0-9-]+\.png`' "$SHOTS" | tr -d '`')
fi

# Operator guides must reference product media (PNG or diagram SVG)
OPERATOR_PAGES=(
  welcome.mdx
  cloud-quickstart.mdx
  tasks.mdx
  agents.mdx
  conversations.mdx
  skills.mdx
  workspaces.mdx
  knowledge.mdx
  projects.mdx
)
for page in "${OPERATOR_PAGES[@]}"; do
  if ! rg -q '/images/(diagrams/)?[a-z0-9-]+\.(png|svg)' "$page" 2>/dev/null; then
    echo "verify-docs-accuracy: $page missing image reference"
    FAIL=1
  fi
done

# docs.json pages must exist on disk
if command -v python3 >/dev/null 2>&1; then
  while IFS= read -r page; do
    [[ -z "$page" ]] && continue
    if [[ ! -f "${page}.mdx" ]]; then
      echo "verify-docs-accuracy: docs.json page missing: ${page}.mdx"
      FAIL=1
    fi
  done < <(python3 - <<'PY'
import json
with open("docs.json") as f:
    data = json.load(f)
for tab in data.get("navigation", {}).get("tabs", []):
    for group in tab.get("groups", []):
        for page in group.get("pages", []):
            print(page)
PY
)
fi

while IFS= read -r -d '' f; do
  lines=$(wc -l < "$f" | tr -d ' ')
  base=$(basename "$f")
  dir=$(basename "$(dirname "$f")")
  case "$base" in
    welcome.mdx|capabilities.mdx|troubleshooting.mdx) min=60 ;;
    faq.mdx) min=80 ;;
    cloud-quickstart.mdx|tasks.mdx|agents.mdx) min=80 ;;
    overview.mdx)
      if [[ "$dir" == "example-workflows" ]]; then min=50; else min=0; fi
      ;;
    *)
      if [[ "$dir" == "example-workflows" ]]; then
        min=100
      else
        min=0
      fi
      ;;
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
