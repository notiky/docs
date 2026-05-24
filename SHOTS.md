# Screenshot capture guide

Real product screenshots — not stock art. Run after dev stack is up in `notiky-app/`.

**Viewport:** 1440×900. Captures crop to the center `main` panel (no sidebar, no assistant rail, no cookie banner).

**Dev server:** Use **`next dev --webpack --port 3031`** — Turbopack can panic on `/tasks`. Either `make dev` or run the Go server plus webpack separately.

**Clean capture rules:**

- Consent cookie in `e2e/global-setup.ts` (`notiky_analytics_consent=denied`) plus per-test dismiss
- Close assistant rail via top-bar **Toggle conversation rail** (never on `/conversations/new`)
- Seed demo data via `seedDocsDemoData()` — realistic tasks and workspace skills
- Dialog shots: dialog content only (New agent, Settings → Runtimes)
- Workspace switcher: dropdown menu only
- Post-capture QA: each PNG ≥ 15 KB; no cookie banner in DOM

```bash
# Terminal 1 — if not already running
cd notiky-app && make dev
# or: Go server on 8082 + apps/web: pnpm exec next dev --webpack --port 3031

# Terminal 2 (global setup runs via playwright.config.ts)
cd notiky-app && pnpm exec playwright test e2e/docs-screenshots.spec.ts
```

Output directory: `../docs/images/` (committed to `notiky/docs`).

| Filename | Route / action | Used in |
|----------|----------------|---------|
| `welcome-hero.png` | Tasks board (hero stand-in) | welcome |
| `quickstart-runtimes.png` | Settings → Runtimes | cloud-quickstart |
| `quickstart-new-agent.png` | Agents → New agent dialog | cloud-quickstart, agents, first-agent-task |
| `tasks-board.png` | Tasks board (seeded) | tasks, cloud-quickstart, recipes |
| `tasks-assign.png` | Task detail → Properties | tasks, bugfix-while-away, spec-review-loop |
| `tasks-in-review.png` | Task detail (in progress) | spec-review-loop |
| `agents-board.png` | Agents list | agents |
| `skills-page.png` | Skills (seeded workspace skills) | skills |
| `workspaces-switcher.png` | Workspace switcher | workspaces, onboard-teammate |
| `conversations-modes.png` | Conversations/new mode pills | conversations, spec-review-loop |
| `projects-page.png` | Projects | projects |

**Knowledge** uses [`images/diagrams/knowledge-context.svg`](images/diagrams/knowledge-context.svg) — not a PNG (E2E graph data is not demo-safe).

## Future: videos and GIFs

Drop files under `images/media/` and swap the Frame `src`:

```mdx
<Frame>
  <img src="/images/media/tasks-board.gif" alt="..." />
</Frame>
```

Priority clips: Conversations modes, Tasks assign flow, New agent dialog, Skills create/import.

Regenerate PNGs after UI changes that affect these routes.
