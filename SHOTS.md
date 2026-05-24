# Screenshot capture guide

Real product screenshots — not stock art. Run after `make dev` in `notiky-app/`.

```bash
# Terminal 1
cd notiky-app && make dev

# Terminal 2 (first time: global setup runs via playwright.config.ts)
cd notiky-app && pnpm exec playwright test e2e/docs-screenshots.spec.ts
```

Output directory: `../docs/images/` (committed to `notiky/docs`).

| Filename | Route / action | Used in |
|----------|----------------|---------|
| `welcome-hero.png` | Dashboard or landing `#product` | welcome |
| `quickstart-runtimes.png` | Settings → Runtimes | cloud-quickstart |
| `quickstart-new-agent.png` | Agents → New agent | cloud-quickstart, agents |
| `tasks-board.png` | Tasks board | tasks |
| `tasks-assign.png` | Task detail assignee | tasks |
| `agents-board.png` | Agent on board | agents |
| `skills-page.png` | Skills | skills |
| `workspaces-switcher.png` | Workspace switcher | workspaces |
| `conversations-modes.png` | Chat Ask/Think/Plan/Do | conversations |
| `knowledge-graph.png` | Knowledge | knowledge |
| `projects-page.png` | Projects | projects |

Until captures exist, guides use branded SVG diagrams under `images/diagrams/`.
