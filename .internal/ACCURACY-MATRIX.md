# Accuracy matrix

Page claims must match code/UI. **Media** column tracks scenario-specific screenshots from the Acme Product demo universe.

| Page | Must match | Media | Source | Verified |
|------|------------|-------|--------|----------|
| welcome.mdx | Product positioning, provider names | `guides/welcome-board.png` + SVG lifecycle | landing `en.ts`, `provider_catalog.go`, Playwright | 2026-07-19 |
| cloud-quickstart.mdx | Install URL, UI labels, providers | 3 guides PNGs (board, runtimes, new agent) | agents UI, e2e | 2026-05-24 |
| capabilities.mdx | Feature list vs live UI | Cards only (GIF later) | routes in `apps/web` | 2026-05-24 |
| concepts/key-concepts.mdx | User vocabulary | SVG workspace-isolation | `docs/reference/vocabulary.md` | 2026-07-19 |
| troubleshooting.mdx | Daemon/runtime fixes | Text | daemon + settings UI | 2026-05-24 |
| faq.mdx | Product facts, no invented pricing | Text | operator guides, notiky.com/pricing | 2026-07-19 |
| tasks.mdx | Board columns, assignee chips, Properties | `guides/tasks-board.png`, `guides/tasks-assign-agent.png` | `e2e/tasks.spec.ts`, `cmd_task.go` | 2026-05-24 |
| agents.mdx | Named agents on connected runtime | `guides/agents-list.png` | `provider_catalog.go`, daemon | 2026-05-24 |
| conversations.mdx | Ask/Think/Plan/Do mode dropdown | `guides/conversations-modes.png` | `copilot/mode/policy.go` | 2026-05-24 |
| skills.mdx | Workspace skills library | `guides/skills-library.png` | skills UI + `cmd_skill.go` | 2026-05-24 |
| knowledge.mdx | Knowledge UI only | SVG knowledge-context | knowledge UI | 2026-05-24 |
| workspaces.mdx | Isolation, switcher, members | `guides/workspaces-switcher.png`, `guides/workspaces-members.png` | `cmd_workspace.go`, e2e | 2026-05-24 |
| projects.mdx | Named projects list | `guides/projects-list.png` | `cmd_project.go` | 2026-05-24 |
| example-workflows/overview.mdx | Recipe hub | Cards only | operator guides | 2026-05-24 |
| example-workflows/first-agent-task.mdx | Runtime → agent → assign | `recipes/recipe-first-agent-assign.png` hero | e2e seedDocsUniverse | 2026-05-24 |
| example-workflows/bugfix-while-away.mdx | Bug Todo + fix In Progress | `recipes/recipe-bugfix-board.png` hero | e2e | 2026-05-24 |
| example-workflows/spec-review-loop.mdx | Spec with acceptance criteria | `recipes/recipe-spec-in-review.png` hero | e2e | 2026-05-24 |
| example-workflows/decision-to-task.mdx | Plan mode decision prompt | `recipes/recipe-decision-plan.png` hero | e2e | 2026-05-24 |
| example-workflows/small-team-setup.mdx | Members + shared board | `recipes/recipe-team-members.png` hero | e2e | 2026-05-24 |
| example-workflows/onboard-teammate.mdx | Invite + shared board | `recipes/recipe-team-members.png` hero | e2e | 2026-05-24 |
| developers/setup-with-ai.mdx | Runtimes online after setup | `guides/setup-with-ai-runtimes.png` | cloud-quickstart, CLI | 2026-05-24 |
| developers/connect-your-machine.mdx | CLI daemon flow | SVG runtime-flow | CLI docs | 2026-05-24 |
| cli/installation.mdx | Install steps | Text | install scripts | 2026-05-24 |
| cli/reference.mdx | Full command tree | Text | `cmd_*.go` | 2026-05-24 |
| developers/feedback.mdx | Help and feedback | Text | support channels | 2026-06-17 |
| developers/integrations.mdx | CLI, MCP, connectors | Text | product + MCP setup | 2026-07-19 |
| changelog/overview.mdx | Release notes | Text | releases | 2026-07-19 |

## Asset inventory (26 nav pages)

| Type | Count | Location |
|------|-------|----------|
| PNG guides | 14 | `images/guides/` — see [`SHOTS.md`](SHOTS.md) |
| PNG recipes | 5 | `images/recipes/` — one hero per workflow story |
| SVG (authored) | 4 | `images/diagrams/` |
| Text / cards only | 7 | capabilities, faq, troubleshooting, overview, cli/*, contributing, changelog |

Screenshots: `notiky-app/e2e/docs-screenshots.spec.ts` seeds **Acme Product** (`seedDocsUniverse`) after `purgeDocsWorkspace()`.

Future media: `docs/images/media/` for `.gif` / `.mp4` swaps — see [`ASSETS.md`](ASSETS.md).

Automated: `bash scripts/verify-docs-accuracy.sh`
