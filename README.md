# Notiky public documentation

Product guides and developer reference for [docs.notiky.com](https://docs.notiky.com).

**This repo is the single source of truth for public product documentation.** Mintlify deploys from here on merge to `main`.

## SSOT rules

Read [`SSOT.md`](SSOT.md) — one canonical home per content type, one-way publish (canon → public).

## Local preview

```bash
npm i -g mint
mint dev
```

## CI

```bash
bash scripts/check-public-docs.sh
```

## Mintlify setup

1. [mintlify.com](https://mintlify.com) → connect **`notiky/docs`** (this repo), path `/`
2. Custom domain: `docs.notiky.com`
3. Enable PR preview deploys

## Other doc repos

| Repo | Purpose |
|------|---------|
| `notiky/docs-private` | Company KB — **never publish** |
| `notiky/notiky` → `notiky-app/docs/` | Engineering canon — link out only |

## Deferred

Research + Blog — see [`RESEARCH-BLOG-PIPELINE.md`](RESEARCH-BLOG-PIPELINE.md).
