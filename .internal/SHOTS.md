# Screenshot capture guide — Acme Product demo universe

One seeded workspace (**Acme Product**) powers all docs media. Every PNG is scenario-specific — no shared heroes across unrelated pages.

**Dev server:** `make dev` or Go on 8082 + `next dev --webpack --port 3031`

```bash
cd notiky-app && pnpm exec playwright test e2e/docs-screenshots.spec.ts
```

Output: `docs/images/guides/` and `docs/images/recipes/`

## Demo seed (`seedDocsUniverse`)

| Entity | Value |
|--------|--------|
| User | Alex Chen (`alex@acme.dev`) |
| Workspaces | Acme Product, Client Beta |
| Runtime | Alex's MacBook (online) |
| Agents | Builder, Researcher |
| Projects | Q2 Launch, Mobile app |
| Pending invite | sam@acme.dev |

Call `purgeDocsWorkspace()` before every capture run.

## Guides (`images/guides/`)

| File | Moment | MDX |
|------|--------|-----|
| `welcome-board.png` | Board with agent-assigned In Progress | welcome |
| `quickstart-board.png` | Board after setup path | cloud-quickstart hero |
| `quickstart-runtimes.png` | Settings → Runtimes online | cloud-quickstart, setup-with-ai |
| `quickstart-new-agent.png` | New agent dialog | cloud-quickstart, agents steps |
| `tasks-board.png` | Board with assignee chips | tasks hero |
| `tasks-assign-agent.png` | Task detail, Builder assigned | tasks, recipe steps |
| `agents-list.png` | Builder + Researcher listed | agents |
| `conversations-modes.png` | Plan mode composer | conversations |
| `conversations-think.png` | Think mode composer | conversations (optional) |
| `skills-library.png` | Workspace skills list | skills |
| `projects-list.png` | Q2 Launch + Mobile app | projects |
| `workspaces-switcher.png` | Acme Product + Client Beta | workspaces |
| `workspaces-members.png` | Members + pending invite | workspaces, team recipes |
| `setup-with-ai-runtimes.png` | Runtimes confirmation | setup-with-ai |

## Recipes (`images/recipes/`)

| File | Moment | MDX hero |
|------|--------|----------|
| `recipe-first-agent-assign.png` | README task → Builder | first-agent-task |
| `recipe-bugfix-board.png` | Bug Todo + fix In Progress | bugfix-while-away |
| `recipe-spec-in-review.png` | CSV spec In Progress | spec-review-loop |
| `recipe-decision-plan.png` | Plan mode decision | decision-to-task |
| `recipe-team-members.png` | Members invite | small-team-setup, onboard-teammate |

## Diagrams (SVG)

`images/diagrams/` — key-concepts, knowledge, runtime-flow, task-lifecycle

## Future GIFs

`images/media/` — swap `<Frame src>` when clips are ready.
