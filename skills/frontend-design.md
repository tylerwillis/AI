# Frontend Design

Generate distinctive, production-grade frontend interfaces that avoid generic AI aesthetics.

**Type:** Official Claude Code plugin (by Anthropic)

**Source:** Available in the Claude Code plugin marketplace as `frontend-design@claude-plugins-official`

## What It Does

When you ask Claude Code to build a web UI, the default output tends toward a recognizable "AI-generated" look -- safe gradients, generic component layouts, predictable color schemes. This skill overrides that tendency with opinionated design direction that produces interfaces with actual visual identity.

## When to Use

Invoke with `/frontend-design` when building web components, pages, or applications. It activates automatically when the plugin detects UI generation requests.

## Why I Use It

I've built 6+ complete website experiments using Claude Code. Without this skill, every site starts looking the same -- the "Tailwind + shadcn default" aesthetic. With it, each site gets a distinct visual identity. The difference is especially noticeable with:

- Hero sections that don't look like every other landing page
- Color palettes with personality instead of safe gradients
- Typography choices that match the brand's voice
- Layout compositions that break the grid when it makes sense

## Examples from My Projects

- **Bloomberg Editorial dashboard** (cc-sitroom) -- Monochrome design system with Newsreader serif + JetBrains Mono, inspired by financial terminals
- **Retro-futuristic arcade** (vibecamp-elo) -- Neon colors on dark background, pixel-art inspired elements
- **Warm minimal** (deepworkmd-site) -- Light background (#faf8f5), Instrument Serif + Satoshi, terminal blocks

## Install

In Claude Code settings, enable `frontend-design@claude-plugins-official`.
