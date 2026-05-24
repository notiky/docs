# Docs asset manifest

Canonical sources live in `notiky-app/apps/web/public/`. This repo holds **copies for the public docs site**.

| File | Source | Use |
|------|--------|-----|
| `logo/light.svg` | `apps/web/public/logos/notiky-logo/full-plain-logo-light.svg` | Header (light theme) |
| `logo/dark.svg` | `apps/web/public/logos/notiky-logo/full-plain-logo-dark.svg` | Header (dark theme) |
| `logo/mark-light.svg` | `logo-plain-light.svg` | Favicon reference |
| `logo/mark-dark.svg` | `logo-plain-dark.svg` | Small contexts |
| `logo/full-boxed.svg` | `full-boxed-logo.svg` | Hero, social |
| `favicon.svg` | `apps/web/public/favicon.svg` | Browser tab |
| `images/providers/*.svg` | `apps/web/public/logos/` | Provider pages |
| `images/diagrams/*.svg` | Authored for docs | Concepts, welcome |
| `images/*.png` | Captured via `notiky-app/e2e/docs-screenshots.spec.ts` | Guide screenshots |

Regenerate PNG screenshots: see [`SHOTS.md`](SHOTS.md).
