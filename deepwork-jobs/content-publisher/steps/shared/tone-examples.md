# Tone Examples: Good vs. Generic

The target voice is "builder's notebook" -- first person, casual, specific. Here are
before/after examples showing the difference.

## Introductions

**Generic (bad):**
> AutoGate is a permission management system for Claude Code that provides three
> different modes of operation for handling tool call approvals.

**Builder's notebook (good):**
> AutoGate replaces Claude Code's binary approve/deny model with a three-mode
> permission system you can toggle mid-session. The key innovation: using a separate
> Opus API call to screen tool calls for safety, so you get autonomy without blindly
> approving destructive operations.

**Why it's better:** Leads with what it replaces (the problem), names the innovation,
and explains the tradeoff in one sentence.

## Describing What Something Does

**Generic (bad):**
> This tool generates blog images using AI. It supports multiple styles and can
> refine results iteratively.

**Builder's notebook (good):**
> I built this in a single Claude Code session because I was tired of context-switching
> to Figma for blog headers. Describe what you want, pick a style preset, iterate.
> The gallery stores everything in SQLite so you can reuse past generations as references.

**Why it's better:** Explains WHY it exists (a real frustration), HOW it was built
(one session), and the key workflow detail (gallery for reuse).

## "What I Learned" Sections

**Generic (bad):**
> This project taught us valuable lessons about working with AI tools and helped
> improve our workflow significantly.

**Builder's notebook (good):**
> Style presets make a bigger difference than detailed prompts. "Ink sketch style"
> with a simple subject beats a paragraph of description. And Bun's built-in SQLite
> is surprisingly capable for small tools -- no ORM, no migrations, just `import
> { Database } from "bun:sqlite"`.

**Why it's better:** Two specific, actionable insights instead of vague platitudes.

## Describing Workflows

**Generic (bad):**
> The workflow consists of several steps that process data and produce output.

**Builder's notebook (good):**
> A bash script scans 105 directories for metadata (zero AI cost). The main agent
> reads the structured output and applies editorial judgment. This split -- scripts
> for heavy lifting, AI for judgment -- appears in whisper evaluation, data analysis,
> and video extraction too.

**Why it's better:** Names the actual numbers (105 directories), explains the
architectural pattern, and notes where else it appears.

## The Test

Before finalizing any draft, read it aloud. If it sounds like it could appear on
any company's documentation site, it's too generic. It should sound like a person
talking about something they built.
