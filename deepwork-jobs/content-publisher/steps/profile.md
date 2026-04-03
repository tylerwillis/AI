# Profile: How Tyler Uses Claude Code

## Objective

Synthesize all scan data from the discover step into a dated report titled "How Tyler Uses Claude Code -- [Date]". The report serves two purposes: (1) a structured artifact that informs triage decisions, and (2) a publishable piece of content in its own right.

## Task

### Process

1. **Read candidates.md** from the discover step

   This contains all discovered candidates, their sources, categories, relationships, and connection annotations. This is your primary source material.

2. **Read the raw scan context**

   To write a rich report, also read `[WORKING_DIR]/metadata.md` (the output
   of the discover step's bash script). It contains:
   - The settings/environment data (what plugins, hooks, MCP servers are configured)
   - Excerpts from CLAUDE.md and AGENTS.md files across projects
   - DeepWork job listings, git histories, and directory structures

   If specific details are thin in the metadata (e.g., a plugin is listed but not
   described), use Read/Glob to inspect the actual source files for more context.

3. **Write the profile report**

   Structure the report as a snapshot of how one person actually uses Claude Code day-to-day. This isn't a tutorial or a feature list -- it's a practitioner's view. What tools does he reach for? What patterns has he developed? What's unique about his setup?

   Use the structure below. Be specific and concrete -- name actual tools, projects, and workflows. Generic observations ("uses Claude Code for coding") are worthless. Interesting observations ("wraps Gemini's video API with a 3-round chat to replace manual video scrubbing") are what readers want.

4. **Flag the report as a candidate**

   If candidates.md doesn't already include the profile report as a candidate (the discover step should have added a placeholder), add it now with category: guides, effort: low (since it's already written).

## Output Format

### profile_report.md

```markdown
# How Tyler Uses Claude Code -- [Date]

## Setup

- **Plugins:** [list of installed plugins with brief descriptions]
- **MCP Servers:** [configured MCP servers and what they enable]
- **Key Settings:** [notable hooks, permissions, or configuration choices]
- **Skills:** [custom and frequently-used third-party skills]

## Active Projects (Last 6 Months)

For each notable project:
### [Project Name]
- **What it does:** [1-2 sentences]
- **How Claude Code is used:** [specific role -- writes configs, orchestrates pipelines, etc.]
- **Key tools/integrations:** [external APIs, CLI tools, etc.]

## Recurring Patterns

Patterns that appear across multiple projects:
- [Pattern]: [where it appears and why it works]
- [Pattern]: ...

## Notable Workflows

End-to-end workflows worth highlighting:
### [Workflow Name]
[3-5 sentence description of the workflow, what triggers it, what it produces, and what's interesting about it]

## Tools & Integrations

External tools orchestrated through Claude Code:
| Tool | What For | How Integrated |
|------|----------|----------------|
| [tool] | [purpose] | [API call, CLI wrapper, MCP server, etc.] |

## What's Unique

Patterns or approaches that go beyond typical Claude Code usage:
- [observation]
- [observation]

## Content Landscape

Summary of what was discovered and what's publishable:
- [N] total candidates found across [M] sources
- [X] guides, [Y] skills, [Z] deepwork-jobs, etc.
- Key themes: [what the collection of candidates reveals about the work]
```

## Quality Criteria

- The report is dated with today's date
- Every section has concrete, specific content (no generic filler)
- Active projects are real projects from the scan data, not invented
- Recurring patterns are backed by evidence (appear in 2+ projects)
- Notable workflows describe actual end-to-end flows, not hypotheticals
- The "What's Unique" section identifies things that aren't obvious or standard
- The Content Landscape section accurately summarizes the candidates.md data

## Context

This report is the bridge between raw discovery data and human editorial judgment. By synthesizing everything into a readable narrative, it helps the user see their own work reflected back -- which often triggers "oh, I should share that" insights that raw candidate lists don't. It also becomes a publishable artifact: a dated snapshot of how one AI practitioner works, which evolves over time as the pipeline runs periodically.
