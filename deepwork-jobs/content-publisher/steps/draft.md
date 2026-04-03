# Draft Content

## Objective

For each approved item, create publication-ready content in the appropriate format for its category. Write all drafts into a `drafts/` directory organized by category.

## Task

### Process

All draft files go in `~/experiments/ai-drafts/drafts/`, NOT `~/experiments/`.

For each item in approved_items.md:

1. **Read the research brief first**

   The research step produced a brief for each item at `~/experiments/ai-drafts/research_briefs/[item-name].md`.
   Read this before writing -- it contains real examples, specific details, and source excerpts
   that the draft should incorporate. If no research brief exists (e.g., the research step was
   skipped), read the source material thoroughly as a fallback.

2. **Draft the content following category conventions**

   **prompts/** -- Write the prompt as a standalone markdown file. Include a brief header explaining what it does, which models it works with, and how to use it. Then the full prompt text, ideally in a collapsible `<details>` block for readability.

   **guides/** -- Create a subdirectory with README.md. Structure:
   - Title + one-paragraph summary
   - Pipeline diagram (ASCII art showing the flow)
   - Step-by-step walkthrough of each phase
   - Tools used (with links)
   - "What makes this work" reflection
   - Source from project docs, scripts, DeepWork jobs, and session context.

   **skills/** -- For custom skills, include the full SKILL.md content with a brief intro explaining what it does and when to use it. For third-party skills, write a description of what it does, how you use it, example invocations, and link to the original source repo.

   **deepwork-jobs/** -- Create a subdirectory with:
   - README.md explaining what the job does, when to use it, prerequisites, and example invocation
   - job.yml (portable version -- no hardcoded paths)
   - steps/*.md instruction files
   - Ensure the job is self-contained and runnable when dropped into any project

   **Making DeepWork jobs portable:**
   - Replace all absolute paths (`~/experiments/chats/...`) with relative paths or placeholders
   - Replace references to specific MCP servers with generic prerequisites ("requires browser automation")
   - Replace project-specific step_arguments with documented inputs the user provides
   - If a step references external tools (ElevenLabs, Gemini, etc.), list them as prerequisites in README.md
   - If a step references project-specific data (a database, a dataset), describe the expected schema
   - Include the full job.yml AND all step instruction files -- the job must work when dropped into `.deepwork/jobs/`
   - Test mentally: "Could someone with DeepWork installed run this by reading only the README?"

   **Tone:** Read `steps/shared/tone-examples.md` before drafting. It has before/after
   examples showing generic writing vs. builder's notebook voice. The test: if it
   sounds like it could appear on any company's docs site, it's too generic.

   **experiments/** -- Create a subdirectory with:
   - README.md explaining what it does, what was learned, and what's interesting
   - Key source files (scripts, configs, etc.)
   - Don't include venvs, node_modules, or build artifacts

3. **Sanitize all content**

   This is critical -- all drafts will eventually be public:
   - Replace any hardcoded API keys or tokens with `YOUR_API_KEY_HERE` or similar
   - Replace company-specific names with generic equivalents where the company context isn't essential
   - Remove personal email addresses, phone numbers, private URLs
   - Replace machine-specific absolute paths with generic examples (e.g., `/path/to/your/video.mp4`)
   - Remove references to internal tools, repos, or infrastructure that aren't public

4. **Apply user notes**

   If the user provided specific guidance during triage (e.g., "focus on the API patterns"), follow it.

### Parallelism

**Note:** Sub-agents in this environment often fail with "Prompt is too long" due to
MCP tool context bloat. Draft items sequentially in the main agent. If you do attempt
sub-agents, keep prompts under 500 characters and have a fallback plan to draft
sequentially if they fail.

If the main agent's context is getting full after several drafts, save progress and
inform the user how many items remain for a follow-up run.

## Output Format

### drafts/

```
drafts/
  prompts/
    [name].md
  guides/
    [name]/
      README.md
  skills/
    [name].md
  deepwork-jobs/
    [name]/
      README.md
      job.yml
      steps/
        *.md
  experiments/
    [name]/
      README.md
      [other files]
```

Only create subdirectories for categories that have approved items.

## Quality Criteria

- All drafts are free of hardcoded API keys, tokens, and passwords
- Each draft is understandable without access to the original source material
- All file paths use generic placeholders instead of machine-specific absolute paths
- No company-internal information that shouldn't be public
- Guides have pipeline diagrams and explain the "why" not just the "how"
- DeepWork jobs are portable (no project-specific path dependencies)
- Writing style is practical and builder-oriented, not academic or tutorial-like

## Context

This is where the actual content gets created. The drafts are not final -- they go through human review next -- but they should be as close to publication-ready as possible. The human review step is for catching sensitivity issues and making editorial judgment calls, not for fixing sloppy drafts.
