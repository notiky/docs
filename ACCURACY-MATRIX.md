# Accuracy matrix

Page claims must match code/UI. Update **Verified** after each pass.

| Page | Must match | Source | Verified |
|------|------------|--------|----------|
| welcome.mdx | Product positioning, provider names, hero screenshot | landing `en.ts`, `provider_catalog.go`, Playwright | 2026-05-24 |
| cloud-quickstart.mdx | Install URL, UI labels, providers, runtime/agent shots | `landing-hero.tsx`, agents UI, e2e | 2026-05-24 |
| capabilities.mdx | Feature list vs live UI | routes in `apps/web` | 2026-05-24 |
| faq.mdx | Product facts, no invented pricing tiers | operator guides, notiky.com/pricing | 2026-05-24 |
| concepts/key-concepts.mdx | User vocabulary | `docs/reference/vocabulary.md` | 2026-05-24 |
| tasks.mdx | Board columns, New Task, CLI flags, PNGs | `e2e/tasks.spec.ts`, `cmd_task.go` | 2026-05-24 |
| agents.mdx | Provider catalog, execution flow | `provider_catalog.go`, daemon | 2026-05-24 |
| conversations.mdx | Ask/Think/Plan/Do pills | `copilot/mode/policy.go`, `empty-state.tsx` | 2026-05-24 |
| skills.mdx | Local vs workspace skills | skills UI + `cmd_skill.go` | 2026-05-24 |
| workspaces.mdx | Isolation, switcher | `cmd_workspace.go`, e2e | 2026-05-24 |
| projects.mdx | Project CRUD | `cmd_project.go` | 2026-05-24 |
| knowledge.mdx | Knowledge UI only | `e2e/knowledge.spec.ts` | 2026-05-24 |
| cli/reference.mdx | Full command tree | `server/cmd/bin/notiky/cmd_*.go` | 2026-05-24 |
| troubleshooting.mdx | Daemon/runtime fixes | daemon + settings UI | 2026-05-24 |
| example-workflows/*.mdx | Recipe steps match UI | e2e + operator guides + PNGs | 2026-05-24 |
| developers/setup-with-ai.mdx | Install prompt accuracy | cloud-quickstart, CLI | 2026-05-24 |

Screenshots: `docs/images/*.png` via `e2e/docs-screenshots.spec.ts` — see [`SHOTS.md`](SHOTS.md).

Automated: `bash scripts/verify-docs-accuracy.sh`
