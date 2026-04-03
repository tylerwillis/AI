# Discover Content Candidates

## Objective

Scan all source material to identify content worth sharing publicly. Collect metadata
efficiently via bash script, analyze with AI judgment, and produce a filtered candidates
list at `[WORKING_DIR]/candidates.md`.

## Important: Context Budget

Sub-agents in sessions with many MCP tools (PostHog, Slack, Chrome, etc.) will fail
with "Prompt is too long." The discover step is designed to avoid this:

- **Phase 1** uses a bash script for mechanical data collection (zero AI cost)
- **Phase 2** uses the main agent to analyze the collected metadata
- **Sub-agents are only needed if** the metadata file exceeds ~50KB, in which case
  split it and analyze in chunks

## Task

### Setup: Create Working Directory

All intermediate files for this workflow go in `[WORKING_DIR]/`. Create it
if it doesn't exist:

```bash
mkdir -p [WORKING_DIR]/research_briefs
```

### Phase 0: Check Current Repo State and Last Run Date

Read the current state of [TARGET_REPO]/ to understand what's already published.
List every item in each category directory (prompts/, guides/, skills/, deepwork-jobs/,
experiments/). This is used in Phase 4 to filter out duplicates.

**Freshness check:** Look for `[WORKING_DIR]/candidates.md` from a previous run.
If it exists, read the `Discovered:` date header. Pass this date as `--since` to the
metadata script in Phase 1 to skip unchanged directories. If no previous run exists,
do a full scan.

### Phase 1: Collect Metadata via Script

Run the collection script to gather structured metadata from all source directories:

```bash
bash .deepwork/jobs/content_publisher/scripts/collect_metadata.sh \
  --output [WORKING_DIR]/metadata.md \
  [BASE_DIR]
```

**Freshness filtering** (for subsequent runs): If a previous run's candidates.md
exists, check its date header and pass `--since` to skip unchanged directories:

```bash
bash .deepwork/jobs/content_publisher/scripts/collect_metadata.sh \
  --since 2026-03-15 \
  --output [WORKING_DIR]/metadata.md \
  [BASE_DIR]
```

The script automatically:
- Skips backup/copy directories
- Reads README, project-plan, CLAUDE.md, AGENTS.md excerpts
- Collects git history, file listings, DeepWork job locations
- Scans Claude settings, plugins, and memory files
- Identifies markdown files that might be standalone prompts

### Phase 1.5: Dedicated DeepWork Job Scan

The metadata script collects job names per directory, but may miss the depth of
what's available. Use the Glob tool to find ALL DeepWork jobs across all subdirectories:

```
Glob pattern: **/.deepwork/jobs/*/job.yml
Path: [BASE_DIR]
```

For each job found, read its `job.yml` summary and workflow names. DeepWork jobs are
high-value candidates -- they represent proven, multi-step workflows that others can
reuse. Don't just list them; note which ones look portable (vs. which depend on
project-specific infrastructure).

Key locations with many jobs (check these carefully):
- `[SOURCE_DIR]/.deepwork/jobs/` (browser_anthropologist, manim_video_producer, super_deep_research, etc.)
- `[SOURCE_DIR]/internal-agentspace/.deepwork/jobs/` (30+ jobs)

### Phase 1.75: Session History Scan

Claude Code session transcripts at `~/.claude/projects/[YOUR_PROJECT_PATHS]/` 
contain JSONL files with full conversation history. These are a rich source of
content candidates -- they reveal:
- Multi-step workflows worth documenting as guides
- Creative uses of tools worth sharing
- Effective prompting patterns
- Problems solved in unexpected ways

```bash
# Find recent sessions (last 30 days)
find ~/.claude/projects/[YOUR_PROJECT_PATHS] -name "*.jsonl" -mtime -30
```

Read sessions thoroughly. Look for interesting interactions, not just summaries.
The best content candidates often come from sessions where something surprising
happened -- a novel approach, a hard-won debugging session, or a workflow that
produced unexpectedly good results.

### Phase 2: Analyze Metadata and Identify Candidates

Read `[WORKING_DIR]/metadata.md` and evaluate each directory from the
perspective of "what would be useful to someone else?"

For each directory, decide:
1. **Skip** -- nothing shareable (trivial, company-internal, incomplete)
2. **Candidate** -- has shareable content. Assign category and write a fragment.

**If the metadata file is too large to read at once** (>2000 lines), read it in
sections and process each batch. Do NOT spawn sub-agents for analysis -- the main
agent has the full context of what's already published and can make better judgment
calls.

For directories that look promising but need deeper inspection (the README is
interesting but you need to see specific files), use Read/Glob/Grep tools to
inspect further. Keep this targeted -- read specific files, don't explore broadly.

### Phase 3: Find Connections

After identifying individual candidates, review the full list for:
1. **Related clusters** -- directories that share a theme (e.g., presentation tools)
2. **Composite guides** -- multi-tool pipelines that span directories
3. **Prerequisites** -- if publishing X, you should also publish Y

### Phase 4: Merge and Filter

1. **Collect** all candidate fragments into a single list
2. **Deduplicate** -- same source or substantially same content
3. **Add connections** -- annotate related candidates
4. **Filter net-new** -- remove anything already in [TARGET_REPO]/ (from Phase 0)
5. **Add the profile report itself as a candidate** -- the "How Tyler Uses Claude Code" report (created in the next step) is itself a publishable guide
6. **Write `[WORKING_DIR]/candidates.md`**

## Output Format

### candidates.md

```markdown
# Content Candidates

Discovered: [date]
Discovered [N] candidates across [M] sources. [X] filtered as already published.

## Guides

### [Candidate Title]

- **Category:** guides
- **Source:** /path/to/source/material
- **Description:** 1-2 sentences on what this is and why it's worth sharing.
- **Effort:** low | medium | high
- **Dependencies:** Any external tools or services needed
- **Related:** [links to other candidates that connect to this one]
- **Notes:** [any context about relationships or prerequisites]

## DeepWork Jobs

### [Candidate Title]

- **Category:** deepwork-jobs
- **Source:** /path/to/.deepwork/jobs/job_name/
- **Description:** 1-2 sentences on what this job does.
- **Effort:** low | medium | high
- **Dependencies:** DeepWork plugin, [other tools]
- **Related:** [links to related candidates]
- **Notes:** [portability assessment, relationship context]

## Skills

[... same format ...]

## Experiments

[... same format ...]

## Prompts

[... same format ...]

## Composite Guides (Suggested)

These are not single-source candidates but combinations suggested by connection analysis:

### [Composite Title]

- **Category:** guides
- **Sources:** /path/1, /path/2, /path/3
- **Description:** Why these sources form a coherent guide together.
- **Effort:** high
- **Components:** [list of individual candidates this combines]
```

Group candidates by category. Within each category, order by effort (low first).
Composite guide suggestions go in their own section at the end.

## Quality Criteria

- Each candidate is assigned to exactly one category (except composites which are always guides)
- Each candidate has a clear source path
- No candidate duplicates content already in the repo
- Each description explains what it is AND why it's worth sharing
- Effort estimates are realistic (low = copy + light edit, medium = significant rewriting, high = write from scratch)
- Connections are noted where they exist -- related candidates cross-reference each other
- Composite guide suggestions identify which individual candidates they combine

## Context

This is the first step in the pipeline and sets the scope for everything that follows.
Casting a wide net here is intentional -- it's much easier to filter candidates in triage
than to discover them later. The script-first approach (Phase 1) was adopted after the
original parallel sub-agent design failed due to MCP tool context bloat. The bash script
does all mechanical work at zero AI cost; the main agent applies editorial judgment to the
structured output. This division keeps the step reliable even in tool-heavy environments.
