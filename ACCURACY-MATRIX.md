# Accuracy matrix

Page claims must match code/UI. **Media** column tracks interim screenshots vs SVG vs text-only until videos/GIFs ship.

| Page | Must match | Media | Source | Verified |
|------|------------|-------|--------|----------|
| welcome.mdx | Product positioning, provider names | PNG hero + SVG lifecycle | landing `en.ts`, `provider_catalog.go`, Playwright | 2026-05-24 |
| cloud-quickstart.mdx | Install URL, UI labels, providers | 3 PNGs (board, runtimes, new agent) | agents UI, e2e | 2026-05-24 |
| capabilities.mdx | Feature list vs live UI | Cards only (GIF later) | routes in `apps/web` | 2026-05-24 |
| concepts/key-concepts.mdx | User vocabulary | SVG workspace-isolation | `docs/reference/vocabulary.md` | 2026-05-24 |
| troubleshooting.mdx | Daemon/runtime fixes | Text | daemon + settings UI | 2026-05-24 |
| faq.mdx | Product facts, no invented pricing | Text | operator guides, notiky.com/pricing | 2026-05-24 |
| tasks.mdx | Board columns, New Task, CLI flags | 2 PNGs (board, detail) | `e2e/tasks.spec.ts`, `cmd_task.go` | 2026-05-24 |
| agents.mdx | Provider catalog, execution flow | PNG board | `provider_catalog.go`, daemon | 2026-05-24 |
| conversations.mdx | Ask/Think/Plan/Do pills | PNG composer | `copilot/mode/policy.go` | 2026-05-24 |
| skills.mdx | Local vs workspace skills | PNG (seeded skills) | skills UI + `cmd_skill.go` | 2026-05-24 |
| knowledge.mdx | Knowledge UI only | **SVG interim** (no graph PNG) | knowledge UI | 2026-05-24 |
| workspaces.mdx | Isolation, switcher | PNG menu crop | `cmd_workspace.go`, e2e | 2026-05-24 |
| projects.mdx | Project CRUD | PNG main crop | `cmd_project.go` | 2026-05-24 |
| example-workflows/overview.mdx | Recipe hub | Cards only | operator guides | 2026-05-24 |
| example-workflows/*.mdx (6) | Recipe steps match UI | Reused PNGs | e2e + operator guides | 2026-05-24 |
| developers/setup-with-ai.mdx | Install prompt accuracy | Text (GIF later) | cloud-quickstart, CLI | 2026-05-24 |
| developers/connect-your-machine.mdx | CLI daemon flow | SVG runtime-flow | CLI docs | 2026-05-24 |
| cli/installation.mdx | Install steps | Text | install scripts | 2026-05-24 |
| cli/reference.mdx | Full command tree | Text | `cmd_*.go` | 2026-05-24 |
| developers/contributing.mdx | Contribution guide | Text | repo conventions | 2026-05-24 |
| changelog/overview.mdx | Release notes | Text | releases | 2026-05-24 |

## Asset inventory (26 nav pages)

| Type | Count | Files |
|------|-------|-------|
| PNG (Playwright) | 11 | See [`SHOTS.md`](SHOTS.md) |
| SVG (authored) | 4 | `task-lifecycle`, `workspace-isolation`, `runtime-flow`, `knowledge-context` |
| Text / cards only | 11 | capabilities, faq, troubleshooting, overview, setup-with-ai, cli/*, contributing, changelog |

Screenshots: `docs/images/*.png` via `e2e/docs-screenshots.spec.ts` — see [`SHOTS.md`](SHOTS.md).

Future media: `docs/images/media/` for `.gif` / `.mp4` swaps — see [`ASSETS.md`](ASSETS.md).

Automated: `bash scripts/verify-docs-accuracy.sh`
