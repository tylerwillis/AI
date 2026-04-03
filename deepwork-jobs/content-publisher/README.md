# Content Publisher

A 7-step [DeepWork](https://deepwork.md) workflow that scans your local projects for shareable content, helps you pick what's worth publishing, researches each topic in depth, drafts writeups, and opens PRs to a GitHub repo.

This job published itself -- it discovered and published everything in this repository.

## Quick Start

```
/deepwork let's make a content publisher job like this: https://github.com/tylerwillis/AI/tree/main/deepwork-jobs/content-publisher
```

DeepWork will read this reference, ask you about your setup (what repo, what directories, what categories), and generate a customized version.

The files here are the real implementation from my setup, not an abstract template. The `new_job` workflow uses them as reference material to understand the pattern, then adapts it for you.

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

## Key Patterns

These are the design decisions worth preserving when you adapt this for your own use:

**Scripts for scanning, AI for judgment.** The discover step uses a bash script to collect metadata from every directory -- READMEs, git logs, file listings, DeepWork jobs. This runs instantly with zero AI cost. The AI agent reads the structured output and decides what's worth sharing. This split matters because scanning 100+ directories token-by-token would consume the context window.

**Research before drafting.** The original pipeline went straight from triage to drafting. Drafts were shallow because they were written from metadata summaries. Adding a dedicated research step (read actual source code, find real examples, dig into git history) improved output quality significantly.

**Batch sizing.** The first run approved 18 items and every draft was shallow. 5-8 items per run produces much better depth. The workflow recommends splitting when there are many candidates.

**Quality gates on most steps.** 6 of 7 steps have automated reviews that check the output before advancing. This catches categorization errors, missing sources, unsanitized secrets, and shallow research.

**Tone guide with examples.** Saying "write in a casual voice" produces generic content. `steps/shared/tone-examples.md` has specific before/after pairs showing what good and bad writing looks like for this kind of content.

## What I Learned Building This

**v1 failed.** I tried parallel sub-agents scanning subsets of directories. Every agent inherited the full MCP tool context (PostHog, Slack, Chrome, etc.) and ran out of room before doing any work.

**Tone needs examples, not adjectives.** "Builder's notebook voice" is meaningless to an AI agent. Concrete before/after pairs are what actually shift the output quality.

**Only publish if there's generalizable value.** The triage step should ask: is there something here someone else could use? If the answer is just "I did a thing" with no transferable insight, skip it.

## Files

```
content-publisher/
├── README.md                    # This file
├── job.yml                      # Workflow definition (7 steps, reviews, common context)
├── scripts/
│   └── collect_metadata.sh      # Bash metadata scanner (--since for incremental runs)
└── steps/
    ├── discover.md              # Script-based scanning + AI analysis
    ├── profile.md               # "How I Use Claude Code" dated report
    ├── triage.md                # User selection with batch sizing
    ├── research.md              # Deep dive into source material
    ├── draft.md                 # Category-specific content creation
    ├── human_review.md          # Quality/sensitivity gate
    ├── publish.md               # Branch + PR creation
    └── shared/
        └── tone-examples.md     # Before/after writing comparisons
```

## Manual Setup

If you prefer to adapt the files directly instead of using `/deepwork`:

1. Copy this directory to `.deepwork/jobs/content_publisher/` in your project
2. Edit `job.yml` → `common_job_info_provided_to_all_steps_at_runtime` with your repo location, categories, and source directories
3. Edit `scripts/collect_metadata.sh` → change `BASE_DIR` and skip patterns
4. Update paths in step files to match your working directory
5. Run: `/deepwork content_publisher`
