# Notiky

**The AI workspace where products are built** — from first idea to scale.

AI coding tools made you 10x faster at writing code. But keeping your product coherent is still chaos. Decisions live in your head, context scatters across ChatGPT threads, `.cursorrules` describes a product you pivoted away from weeks ago, and every new AI session starts from scratch.

Notiky is a persistent product brain. One cycle — **brainstorm deeply, capture decisions, generate ship plans, produce artifacts** — that feeds context to every tool in your chain.

[notiky.com](https://notiky.com)

---

## How it works

```
Brainstorm  -->  Decisions  -->  Ship Plan  -->  Artifacts & Tasks
    ^                                                   |
    |___________________________________________________|
                    context compounds
```

1. **Brainstorm** with an AI co-founder that challenges your thinking, runs market research, and drills into specifics — not a yes-man chatbot
2. **Decisions** are captured as structured objects: who decided, when, why, what was rejected, what evidence was used
3. **Ship Plans** convert brainstorms into actionable tasks with full reasoning chains
4. **Artifacts** are auto-generated: `CLAUDE.md`, `.cursorrules`, design systems, API docs, skills files

The loop closes. The 100th session is dramatically better than the 1st because context compounds.

---

## Features

### AI co-founder brainstorming
Multi-stage brainstorming that goes deep: understand the problem, architect solutions, surface risks, align with vision, then plan the MVP. 78% of users want AI that disagrees with them ([Anthropic research](https://www.anthropic.com)). Notiky delivers calibrated intellectual friction.

### Structured decision tracking
Every decision is a first-class object with full provenance. Searchable forever. Conflict detection when new decisions contradict existing ones. Never lose the "why" again.

### Ship plans
Ideas become tasks with complete context — not just "build feature X" but the full reasoning chain. Tasks flow to **Linear** and **Jira** with everything your developers need.

### Artifact generation
Auto-generates the files your tools consume:
- `CLAUDE.md` / `.cursorrules` / `.cursor/rules/`
- Design systems and UI standards
- API documentation
- Architecture docs
- Skills files

**Static-first, MCP-enhanced.** Artifacts always work as plain files. If the server is down, your coding tools still have context.

### MCP server
Delivers live product context to **Cursor** and **Claude Code** mid-session. Your IDE's AI knows what the product is, what was decided, and what changed — without you copy-pasting.

### Sync engine
Change your backend API? Notiky detects the change and tells all connected repos what needs updating. No more "I pushed 100 backend changes and spent a week syncing two frontends."

### Customer intelligence
Import meeting notes from **Granola**, **Otter.ai**, **Google Meet**. Collect support tickets, feedback, and user interviews. AI connects customer insights to product decisions and detects when it's time to pivot.

### Team workspace
Invite co-founders, PMs, designers, engineers. Everyone sees the same decisions, the same context, the same product brain. Async standups, task assignment, shared context.

---

## Tech stack

| Layer | Technology |
|-------|-----------|
| Framework | Next.js 16 (App Router), React 19, TypeScript |
| Styling | Tailwind CSS 4 + shadcn/ui (Radix primitives) |
| Database | Supabase Postgres + Drizzle ORM |
| Auth | BetterAuth (Google, GitHub, email OTP) |
| AI (primary) | Google Gemini 2.5/3.1 Pro/Flash |
| AI (secondary) | Claude, GPT via OpenRouter |
| AI SDK | Vercel AI SDK (`ai` package) |
| Vector search | pgvector (768-dim embeddings) |
| Billing | Polar |
| Deployment | Vercel |
| Testing | Vitest |

### Architecture

Modular monolith. 29 domain modules in `src/modules/`, each self-contained with services, use-cases, and tools. Multi-agent AI — different specialized agents orchestrated transparently. Auto model routing: no user-facing model picker.

**Data model:** Workspace -> Project -> { Conversations, Documents, Ship Plans }. Documents have immutable versions with lifecycle states: `draft -> reviewed -> approved -> superseded`.

---

## Integrations

| Integration | What it does |
|------------|-------------|
| **Linear** | Decisions and ship plans flow as tickets with full context |
| **GitHub** | PRs generated with artifact updates, code context sync |
| **Cursor / Claude Code** | MCP server delivers live product context to your IDE |
| **Granola / Otter.ai / Google Meet** | Meeting transcripts imported, insights extracted |

---

## Who it's for

- **Solo founders** building with AI coding tools who need a persistent product brain
- **Small teams (3-15)** where product decisions need to reach the code
- **PMs** who want decisions to flow from brainstorm to Linear ticket to code context automatically
- **Anyone using Cursor, Claude Code, or Copilot** who's tired of every session starting from scratch

---

## Pricing

| Tier | Price | Highlights |
|------|-------|-----------|
| Free | $0 | 1 project, basic brainstorming |
| Basic | $9.99/mo | Unlimited projects, decision tracking, artifact export |
| Plus | $19/mo | Advanced AI models, version history, integrations |
| Ultra | $79/mo | Full power, priority support, custom configs |

---

## Links

- [Website](https://notiky.com)
- [GitHub Org](https://github.com/notiky)

---

## License

Copyright 2026 Notiky. All rights reserved.
