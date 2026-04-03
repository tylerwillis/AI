# Content Publisher

This job published itself. It's a 7-step [DeepWork](https://deepwork.md) workflow that scans your local projects for shareable content, helps you pick what's worth publishing, researches each topic in depth, drafts publication-ready writeups, and opens PRs to a GitHub repo.

I built it to automate the "I should really share this" → actual published content pipeline. On its first run, it scanned 105 experiment directories, identified 17 candidates, and published 8 items (prompts, guides, skills, experiments) in a single session.

## The Pipeline

```
discover → profile → triage → research → draft → human_review → publish
```

| Step | What Happens | Output |
|------|-------------|--------|
| **discover** | Bash script scans directories for metadata. AI analyzes the output. | candidates.md |
| **profile** | Synthesizes scan into a "How I Use Claude Code" report. Skippable for incremental runs. | profile_report.md |
| **triage** | You pick which candidates to publish. Recommends batches of 5-8 for depth. | approved_items.md |
| **research** | Deep dive into source material for each item. Reads actual code, configs, git history. | research_briefs/ |
| **draft** | Writes publication-ready content using research briefs. Sanitizes paths and secrets. | drafts/ |
| **human_review** | You review each draft for quality, sensitivity, and "should this be public?" | review_checklist.md |
| **publish** | Creates branches, copies content, updates README indexes, opens PRs. | published_prs.md |

## Key Design Decision: Scripts for Scanning, AI for Judgment

The discover step uses a 244-line bash script (`scripts/collect_metadata.sh`) to collect metadata from every directory -- READMEs, git logs, file listings, DeepWork jobs, Claude settings. This runs instantly with zero AI cost.

The AI agent then reads the structured output and decides what's worth sharing. This split matters because:
- Scanning 100+ directories token-by-token would consume the context window
- Sub-agents in MCP-heavy environments (PostHog, Slack, Chrome, etc.) fail with "Prompt is too long"
- The bash script is deterministic and fast; the AI judgment is where the value is

## What I Learned Building This

**v1 failed.** I tried parallel sub-agents scanning subsets of directories. Every agent inherited the full MCP tool context and ran out of room before doing any work.

**Batch size matters.** The first run approved 18 items and every draft was shallow. The second run's learn cycle added a hard recommendation: 5-8 items max per run. Fewer topics = more depth per topic.

**Research before drafting.** The original pipeline went straight from triage to drafting. Drafts written from metadata summaries were "okay, not great." Adding a dedicated research step (read actual source code, find real examples, dig into git history) dramatically improved output quality.

**Tone needs examples, not just adjectives.** Saying "write in a builder's notebook voice" produced generic content. Adding `steps/shared/tone-examples.md` with before/after comparisons of generic vs. good writing made a real difference.

## Prerequisites

- [DeepWork](https://deepwork.md) installed and configured
- A target GitHub repository with category directories (prompts/, guides/, skills/, etc.)
- [GitHub CLI](https://cli.github.com/) (`gh`) authenticated
- Branch protection on main (the job creates PRs, doesn't push directly)

## Setup

1. Copy this directory to `.deepwork/jobs/content_publisher/` in your project
2. Edit `job.yml` → `common_job_info_provided_to_all_steps_at_runtime`:
   - Set your target repo location and GitHub remote
   - Define your content categories
   - Set your source material locations
3. Edit `scripts/collect_metadata.sh`:
   - Change `BASE_DIR` to your project root
   - Adjust skip patterns for your directory structure
4. Run: `/deepwork content_publisher`

## Quality Gates

6 of 7 steps have automated reviews that check the output before advancing:

- **candidates.md**: Correct categories, source paths, no duplicates, good descriptions
- **profile_report.md**: Dated, concrete (no filler), evidence-backed patterns
- **approved_items.md**: Batch size ≤ 8, tone guide established, user notes captured
- **research_briefs/**: Source files cited, real examples present, depth beyond metadata
- **drafts/**: No secrets, self-contained, portable paths
- **published_prs.md**: PR URLs present, all approved items accounted for

## Files

```
content-publisher/
├── README.md              # This file
├── job.yml                # Workflow definition (7 steps, reviews, common context)
├── scripts/
│   └── collect_metadata.sh  # Bash metadata scanner (--since for incremental runs)
└── steps/
    ├── discover.md        # Script-based scanning + AI analysis
    ├── profile.md         # "How I Use [Tool]" dated report
    ├── triage.md          # User selection with batch sizing
    ├── research.md        # Deep dive into source material
    ├── draft.md           # Category-specific content creation
    ├── human_review.md    # Quality/sensitivity gate
    ├── publish.md         # Branch + PR creation
    └── shared/
        └── tone-examples.md  # Before/after writing comparisons
```
