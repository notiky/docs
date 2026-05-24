# Screenshot capture guide

Real product screenshots — not stock art. Run after `make dev` in `notiky-app/`.

**Viewport:** 1280×800 (set in the Playwright spec).

```bash
# Terminal 1
cd notiky-app && make dev

# Terminal 2 (first time: global setup runs via playwright.config.ts)
cd notiky-app && pnpm exec playwright test e2e/docs-screenshots.spec.ts
```

Output directory: `../docs/images/` (committed to `notiky/docs`).

| Filename | Route / action | Used in |
|----------|----------------|---------|
| `welcome-hero.png` | Tasks board (hero stand-in) | welcome |
| `quickstart-runtimes.png` | Settings → Runtimes | cloud-quickstart |
| `quickstart-new-agent.png` | Agents → New agent dialog | cloud-quickstart, agents, first-agent-task |
| `tasks-board.png` | Tasks board | tasks, cloud-quickstart, recipes |
| `tasks-assign.png` | Task detail → Properties | tasks, bugfix-while-away, spec-review-loop |
| `tasks-in-review.png` | Task detail (in progress) | spec-review-loop |
| `agents-board.png` | Agents list | agents |
| `skills-page.png` | Skills | skills |
| `workspaces-switcher.png` | Workspace switcher | workspaces, onboard-teammate |
| `conversations-modes.png` | Conversations/new mode pills | conversations, spec-review-loop |
| `knowledge-graph.png` | Knowledge graph view | knowledge |
| `projects-page.png` | Projects | projects |

Regenerate after UI changes that affect these routes.
