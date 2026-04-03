# Claude Code Power User Setup

How I configure Claude Code for serious daily use -- permission hooks, custom status line, plugins, project conventions, and the working patterns that make it all productive.

## Permission Management: AutoGate

The biggest quality-of-life improvement. Instead of approving every tool call manually or blindly auto-approving everything, I use a three-mode system:

- **off** -- Manual approval (default Claude Code behavior)
- **on** -- Opus screens each write operation (~2s per call, ~$0.01 each)
- **yolo** -- Full auto-approve, toggleable mid-session

See the [AutoGate guide](../autogate/) for full setup instructions and the [source code](https://github.com/tylerwillis/--safely-skip-permissions).

## Custom Status Line

My terminal always shows: current directory, git branch (with dirty indicator), AutoGate mode (color-coded), and context window remaining percentage.

```
experiments on main* | AG:on | 72%
```

Add to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "/bin/bash ~/.claude/statusline-command.sh"
  }
}
```

The script reads JSON from stdin (workspace info, context window stats), checks git status, reads the autogate mode file, and outputs ANSI-colored text. Color codes: blue for directory, yellow for branch, green/yellow/grey for AG mode, grey for percentage.

## Plugin Stack

These are the plugins I use daily, in rough order of how often they fire:

| Plugin | What It Does | When It Fires |
|--------|-------------|---------------|
| **DeepWork** | Multi-step workflows with quality gates | Explicit `/deepwork` invocation |
| **Compound Engineering** | 27 specialized review agents in parallel | After feature implementation |
| **Frontend Design** | Distinctive UI generation | When building any web UI |
| **Commit Commands** | Git commit/push/PR workflows | `/commit`, `/push` |
| **Playground** | Interactive single-file HTML explorers | When building explorers/demos |
| **PostHog** | Analytics, flags, experiments | When working with product data |
| **Claude MD Management** | CLAUDE.md auditing | Periodic maintenance |

Install plugins via Claude Code settings: `Settings > Plugins > Enable`.

## How I Start Sessions

### Fresh Directories for Experiments

Every experiment gets its own directory. Every directory is a git repo. This gives me a clean slate for each project while preserving full history. I have 100+ experiment directories, each self-contained with its own CLAUDE.md, project-plan.md, and project-log.md.

### Context Repos

For work that spans multiple sessions and projects, I maintain "context repos" -- repositories that contain reference material about a company, product, or domain. When starting a session, I point Claude at the context repo first:

> "Go read ~/experiments/uns-canon to get context on our product. Today we're going to work on the pricing page."

This separates "what Claude needs to know" from "what Claude needs to build." The context repo is stable reference material; the working directory is where changes happen.

### Planning Before Building

I almost never jump straight into coding. The session pattern:

1. **Start with a planning discussion** -- Either Claude Code plan mode or just a freeform chat about what I want to build and why
2. **Build context together** -- Claude asks questions, I share constraints, we align on approach
3. **Then execute** -- Either exit plan mode and let Claude execute the plan, or tell DeepWork to suggest jobs based on our discussion (`/deepwork` with a description of what we discussed)

The better the plan and context, the better the output. This is the single highest-leverage habit.

### Fuzzy Context Engineering

Before starting work on an unfamiliar topic, I ask Claude to do research first:

> "Go read the top papers on [topic]"
> "Look for popular open-source projects that do [task]"
> "Research how [framework] handles [pattern] -- read the actual docs, don't rely on training data"

This isn't precise context engineering (hand-picking exact files and references). It's fuzzy -- I point Claude at a general area and let it gather relevant context. Manual context engineering produces better results, but fuzzy context engineering is a great speed/quality tradeoff for experiments and one-offs.

### Interview-Driven Requirements

When I don't have a clear spec, I tell Claude to interview me:

> "Use the AskUserQuestion tool to interview me. Figure out what I actually need before you start building."

This flips the dynamic -- instead of me trying to write a complete spec upfront, Claude asks targeted questions to uncover requirements, constraints, and preferences. The resulting plan is often better than what I would have written alone.

## Project Conventions

Every project follows the same pattern, enforced via my global `~/.claude/CLAUDE.md`:

### project-plan.md + project-log.md

**project-plan.md** -- What the project does, who it serves, tech stack, how it works. Everything a new developer (or new Claude session) needs to ramp up. Claude reads this at session start.

**project-log.md** -- Chronological record of all development sessions. Claude appends to this at session end. Never deletes entries.

This pair creates persistent memory across sessions. Claude starts each session by reading both files, so it has full context without you explaining anything.

### CLAUDE.md and AGENTS.md

I put AI-specific instructions in CLAUDE.md. These capture hard-won lessons that prevent repeated mistakes:

```markdown
# CLAUDE.md examples from real projects

"2024 data is incomplete -- always use 2023 as the latest complete year"
"Use `uv run python` with `import duckdb`, NOT sql_query_tool"
"Use Bun instead of Node.js for this project"
"Coverage minimum is 90%. Line length is 100."
```

**The AGENTS.md trick:** Claude Code reads CLAUDE.md but ignores AGENTS.md. Other AI coding tools (Codex, Copilot, etc.) read AGENTS.md but ignore CLAUDE.md. My solution: symlink AGENTS.md to CLAUDE.md so both tools work from the same instructions.

```bash
ln -s CLAUDE.md AGENTS.md
```

## Scheduled Automation

I run Claude Code on a schedule using cron jobs with the `-p` flag (non-interactive mode):

```bash
# Example: run a DeepWork job every morning at 8am
0 8 * * * cd ~/experiments/chats && claude -p "/deepwork browser_anthropologist.daily_digest"
```

This turns Claude Code into a background automation system -- daily digests, periodic data syncs, scheduled reports -- all running unattended.

## Philosophy

**Better plans + better tests solve most problems.** When output quality is low, the fix is almost always upstream: improve the context, write a better plan, add checks that catch issues early. Throwing more compute at a bad plan rarely works.

**Better checks > more instructions.** Instead of writing longer prompts hoping Claude gets it right, add quality gates (DeepWork reviews, test suites, QA skills) that catch problems and force corrections. The feedback loop matters more than the initial prompt.

## Global Settings

Key settings in `~/.claude/settings.json`:

```json
{
  "effortLevel": "high",
  "skipDangerousModePermissionPrompt": true
}
```

- **effortLevel: high** -- Claude always operates at maximum thoroughness. No shortcuts.
- **skipDangerousModePermissionPrompt** -- Relies on AutoGate instead of the built-in prompt.

## MCP Servers

My Claude Code connects to:

- **Chrome automation** -- Browser control for web scraping, site QA, flight booking
- **Slack** -- Read/send messages, search channels
- **Gmail** -- Read/search/draft emails
- **Google Calendar** -- Event management, free time lookup
- **Grain** -- Meeting transcript search and analysis
- **PostHog** -- Full analytics platform access
- **tldraw / Excalidraw** -- Diagram drawing

These turn Claude Code into a general-purpose automation platform, not just a code editor.

## Tools & Integrations

External tools I regularly orchestrate through Claude Code:

| Tool | What For | How Integrated |
|------|----------|----------------|
| Gemini API | Video analysis, image generation | Direct API calls via Python/TypeScript |
| ElevenLabs | Text-to-speech for videos | API call in video producer pipeline |
| DuckDB | Large dataset analysis (227M rows) | Python `import duckdb` |
| ffmpeg | Video extraction, audio processing | CLI via bash/Makefile |
| Slidev | Presentation decks from markdown | Node.js CLI |
| whisper.cpp | Local speech-to-text | C++ build, CLI invocation |
| Bun | Fast TypeScript runtime | Replaces Node.js in newer projects |
| GitHub CLI (gh) | PR creation, repo management | CLI via bash |

## What Makes This Setup Work

The key insight: **Claude Code is not a code editor with AI -- it's a general-purpose automation platform.** The permission hooks, MCP servers, plugins, and project conventions work together to make that viable for daily use. AutoGate gives you trust. The project-plan/log pattern gives you memory. Context repos give you knowledge. MCP servers give you reach. DeepWork gives you structure. Scheduled jobs give you consistency.
