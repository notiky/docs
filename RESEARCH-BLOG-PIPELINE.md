# Research + Blog — deferred publish pipeline

> **Status: DO NOT PUBLISH YET.** Public site ships without Research/Blog. IA slots are reserved in `docs.json` for a future phase.

## Canonical research homes (internal)

Research today is split — merge before any public copy exists:

| Location | Contents |
|----------|----------|
| `references/research/` | Agents + memory pillar dossiers |
| `marketing/research/` | Campaign-aligned research |

Pick one merged canonical folder before publishing.

## Future pipeline (when founder gate opens)

1. Author or update research in the internal canonical folder.
2. **Sanitization pass** — strip: unreproducible metrics, customer names, internal strategy, data-room references, WU/ADR IDs.
3. Copy sanitized version into `research/` in this public repo.
4. Uncomment the Research tab in `docs.json`.
5. Mintlify preview → `check-public-docs.sh` → merge.

## Gate

Publishing research or blog content requires an explicit **go** decision. Until then:

- Do not add pages under `research/` in this repo.
- Do not enable the Research tab in Mintlify navigation.

## Voice when live

Depth over opinion — pillar dossiers and build logs, not benchmark marketing or thought-leadership grandstanding.
