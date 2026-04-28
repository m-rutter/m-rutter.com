# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

- `zola serve` — dev server with hot reload at localhost:1111
- `zola build` — build static site to `public/`
- `zola check` — validate internal links and content

Zola is managed via `mise` (pinned to v0.19.2 in `mise.toml`).

## Deployment

Push to the `zola` branch triggers GitHub Actions, which builds and deploys to the `master` branch (GitHub Pages) at m-rutter.com. The `master` branch should not be edited directly.

## Architecture

Standard Zola static site:

- `content/` — Markdown posts with TOML frontmatter. Top-level `.md` files are blog posts; sections use `_index.md`. The `projects/` section has `render = false` (used as data only).
- `templates/` — Tera (Jinja2-like) templates. `base.html` defines the nav/footer shell; `page.html` renders individual posts; `index.html` handles the paginated home feed. Shortcodes live in `templates/shortcodes/`.
- `sass/` — Modular SCSS. `style.scss` imports everything. Variables (colors, fonts) are CSS custom properties in `variables.scss`. Dark mode is handled via `prefers-color-scheme` media query.
- `static/` — Static assets served as-is: favicons, SVG icons, CNAME, and Berkeley Mono font files.

## Content Authoring

Post frontmatter fields:

```toml
+++
title = ""
date = 2025-01-01
description = ""
[taxonomies]
tags = ["tag"]
+++
```

Set `draft = true` to keep a post from rendering. The `updated` field in frontmatter displays a "last updated" date on the post.

The `note` shortcode (`{{ note(text="") }}`) renders a callout block.

Code highlighting uses the `ayu-mirage` theme (configured in `config.toml`).
