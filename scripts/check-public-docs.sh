#!/usr/bin/env bash
# Fail if public Mintlify docs contain internal references or secret patterns.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

PUBLIC_DOCS_DIR="${PUBLIC_DOCS_DIR:-.}"

FAIL=0

echo "check-public-docs: scanning $ROOT ..."

FORBIDDEN_PATTERNS=(
  'docs/roadmap/'
  'docs/master-plan/'
  'docs/operations/production'
  'docs-private'
  'data-room'
  'WU-[0-9]'
  'D-0[0-9]'
  'Q-0[0-9]'
  'server/internal/'
  'open-questions/'
  'MemoryBench'
  'llms\.txt'
  'notiky-brain'
  'INVESTOR_PAGE_KEY'
  'NOTIKY_ENCRYPTION_KEY'
  'github\.com/notiky/notiky'
  'never publish'
  'founder gate'
  'DO NOT PUBLISH'
)

SECRET_PATTERNS=(
  'sk-[A-Za-z0-9]{20,}'
  'AKIA[0-9A-Z]{16}'
  'postgresql://[^ ]+'
  'Bearer eyJ[A-Za-z0-9._-]+'
  'JWT_SECRET=[^ ]+'
  '-----BEGIN (RSA |OPENSSH )?PRIVATE KEY-----'
)

INTERNAL_LINK_PATTERNS=(
  'github\.com/[^/]+/[^/]+/tree/[^/]+/docs/'
  'notiky-app/docs/'
)

CONTENT_GLOBS=(--glob '*.mdx' --glob 'docs.json')

for pat in "${FORBIDDEN_PATTERNS[@]}"; do
  if matches=$(rg -n "$pat" "$PUBLIC_DOCS_DIR" "${CONTENT_GLOBS[@]}" 2>/dev/null || true); then
    if [[ -n "$matches" ]]; then
      echo ""
      echo "check-public-docs: forbidden pattern '$pat':"
      echo "$matches"
      FAIL=1
    fi
  fi
done

# README is visible on GitHub — same internal guardrails as published pages.
for pat in 'docs-private' 'data-room' 'github\.com/notiky/notiky' 'never publish' 'founder gate' 'DO NOT PUBLISH'; do
  if matches=$(rg -n "$pat" README.md 2>/dev/null || true); then
    if [[ -n "$matches" ]]; then
      echo ""
      echo "check-public-docs: forbidden pattern '$pat' in README.md:"
      echo "$matches"
      FAIL=1
    fi
  fi
done

for pat in "${SECRET_PATTERNS[@]}"; do
  if matches=$(rg -n "$pat" "$PUBLIC_DOCS_DIR" "${CONTENT_GLOBS[@]}" 2>/dev/null || true); then
    if [[ -n "$matches" ]]; then
      echo ""
      echo "check-public-docs: possible secret pattern '$pat':"
      echo "$matches"
      FAIL=1
    fi
  fi
done

for pat in "${INTERNAL_LINK_PATTERNS[@]}"; do
  if matches=$(rg -n "$pat" "$PUBLIC_DOCS_DIR" "${CONTENT_GLOBS[@]}" 2>/dev/null || true); then
    if [[ -n "$matches" ]]; then
      echo ""
      echo "check-public-docs: internal link pattern '$pat':"
      echo "$matches"
      FAIL=1
    fi
  fi
done

echo "check-public-docs: verifying publish folder allowlist..."
while IFS= read -r -d '' file; do
  rel="${file#"$ROOT/"}"
  rel="${rel#./}"
  case "$rel" in
    .internal/*) ;;
    *.mdx|docs.json|README.md|logo/*|images/*|favicon.*|style.css|.gitignore|scripts/check-public-docs.sh|scripts/verify-docs-accuracy.sh|.github/workflows/*) ;;
    .gitkeep) ;;
    *)
      echo "check-public-docs: disallowed file in publish folder: $rel"
      FAIL=1
      ;;
  esac
done < <(find "$PUBLIC_DOCS_DIR" -type f ! -path '*/.git/*' ! -path '*/.cursor/*' ! -path '*/scripts/*' ! -path '*/.internal/*' -print0)

if [[ "$FAIL" -ne 0 ]]; then
  echo ""
  echo "check-public-docs: FAILED"
  exit 1
fi

echo "check-public-docs: OK"
