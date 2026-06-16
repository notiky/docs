# Documentation SSOT — where content lives

Every content type has **one canonical home**. Publication flows **canon → public, one-way**. Never copy public guides back into engineering or private repos.

## Audience → canonical home

| Content | Canonical repo | Public? |
|---------|----------------|---------|
| Product guides, quickstart, workflows | **`notiky/docs`** (this repo) | Yes — Mintlify at docs.notiky.com |
| Concepts (how Notiky works, simplified) | **`notiky/docs`** (this repo) | Yes |
| CLI / API / self-host (curated) | This repo (Developers tab) + link to GitHub | Yes — thin layer only |
| ADRs, master-plan, runbooks, WUs | `notiky-app/docs/` | Never — link out only |
| Vision, data-room, fundraising | `docs-private/` | Never |
| Research pillars (agents, memory) | `references/research/` + `marketing/research/` | **Deferred** — see `RESEARCH-BLOG-PIPELINE.md` |
| Changelog (user-visible) | This repo, sourced from engineering release notes | Yes |

## Rules

1. **Edit product how-to here.** No duplicate copy in `notiky-app/apps/`.
2. **Engineering truth** is in `notiky-app/docs/` — use it to fact-check, not to copy wholesale.
3. **Private business content** stays in `docs-private/` — repo boundary blocks leaks.
4. **Research/Blog** tabs are reserved; do not publish until the pipeline gate in `RESEARCH-BLOG-PIPELINE.md` is explicitly opened.

## Clone layout

```
~/Projects/notiky/
  docs/              ← this repo (PUBLIC, Mintlify)
  docs-private/      ← company KB (PRIVATE)
  notiky-app/        ← product + engineering canon
```
