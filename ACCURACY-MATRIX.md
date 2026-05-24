# Accuracy matrix

Page claims must match code/UI. Update **Verified** after each pass.

| Page | Must match | Source | Verified |
|------|------------|--------|----------|
| welcome.mdx | Product positioning, provider names | landing `en.ts`, `provider_catalog.go` | 2026-05-24 |
| cloud-quickstart.mdx | Install URL, UI labels, providers | `landing-hero.tsx`, agents UI | 2026-05-24 |
| capabilities.mdx | Feature list vs live UI | routes in `apps/web` | 2026-05-24 |
| concepts/key-concepts.mdx | User vocabulary | `docs/reference/vocabulary.md` | 2026-05-24 |
| tasks.mdx | Board columns, New Task, CLI flags | `e2e/tasks.spec.ts`, `cmd_task.go` | 2026-05-24 |
| agents.mdx | Provider catalog, execution flow | `provider_catalog.go`, daemon | 2026-05-24 |
| conversations.mdx | Ask/Think/Plan/Do pills | `copilot/mode/policy.go` | 2026-05-24 |
| skills.mdx | Local vs workspace skills | skills UI + `cmd_skill.go` | 2026-05-24 |
| workspaces.mdx | Isolation, switcher | `cmd_workspace.go` | 2026-05-24 |
| projects.mdx | Project CRUD | `cmd_project.go` | 2026-05-24 |
| knowledge.mdx | Knowledge UI only | `e2e/knowledge.spec.ts` | 2026-05-24 |
| cli/reference.mdx | Full command tree | `server/cmd/bin/notiky/cmd_*.go` | 2026-05-24 |
| troubleshooting.mdx | Daemon/runtime fixes | daemon + settings UI | 2026-05-24 |
| example-workflows/*.mdx | Recipe steps match UI | e2e + operator guides | 2026-05-24 |
| developers/setup-with-ai.mdx | Install prompt accuracy | cloud-quickstart, CLI | 2026-05-24 |

Automated: `bash scripts/verify-docs-accuracy.sh`
