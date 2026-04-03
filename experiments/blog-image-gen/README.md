# Blog Image Generator

A local-first tool for generating blog header images using Google's Gemini image generation (Imagen 3). Built in a single Claude Code session using Bun.

## What It Does

- **Style presets** -- Pre-configured artistic styles (ink sketch, watercolor, ballpoint, etc.)
- **Aspect ratio control** -- Common blog image dimensions
- **Reference images** -- Upload images to guide generation
- **Iterative refinement** -- Use previous generations as reference for the next round
- **Gallery with history** -- Browse past generations stored in SQLite

## Tech Stack

- **Runtime:** Bun (fast, native TypeScript, built-in SQLite)
- **API:** Google Gemini (Imagen 3) for image generation
- **Storage:** SQLite for generation history, local filesystem for images
- **UI:** Plain HTML served by a Bun HTTP server

## Quick Start

```bash
# Install Bun if you don't have it
curl -fsSL https://bun.sh/install | bash

# Clone and install
cd blog-image-gen
bun install

# Add your Gemini API key
cp .env.example .env
# Edit .env: GEMINI_API_KEY=your_key_here

# Start the server
bun run server.ts
# Open http://localhost:3000
```

## How I Use It

When writing a blog post, I open the tool, describe what I want ("minimalist ink sketch of neural network nodes connecting"), pick a style preset, and iterate. The gallery lets me browse past generations for reuse or reference.

The iterative refinement is the key workflow: generate something close, then use it as a reference image with adjusted prompting to dial in exactly what I want.

## What I Learned

- Bun's built-in SQLite is surprisingly capable for small tools like this -- no ORM, no migration framework, just `import { Database } from "bun:sqlite"`
- Style presets make a bigger difference than detailed prompts. "Ink sketch style" with a simple subject beats a paragraph of description.
- Reference images are the fastest path to consistency across multiple blog images
- The whole thing (server, UI, Gemini integration, gallery, history) was built in one Claude Code session

## Why Bun?

I switched to Bun for newer projects because:
- Native TypeScript execution (no build step)
- Built-in SQLite (no dependencies for simple storage)
- `.env` loading built in (no dotenv)
- Faster startup than Node.js
