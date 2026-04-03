# Research: Deep Dive into Approved Items

## Objective

For each approved item, do thorough research into the source material to gather real examples, specific details, anonymized stories, and concrete patterns. The draft step will use these briefs -- shallow research produces shallow drafts.

## Task

### Process

For each item in approved_items.md:

1. **Read the actual source code and configs**

   Don't rely on metadata summaries from the discover step. Go to the source directory and read:
   - The full README, CLAUDE.md, AGENTS.md
   - Key source files (scripts, configs, job definitions)
   - Git log for evolution history and key decisions
   - DeepWork job definitions and step instructions (if applicable)

2. **Look for real examples and stories**

   The difference between a good draft and a great one is specificity:
   - What specific problem did this solve? (not "it helps with X" but "I had 2000 hallucinated lines and reduced to 45")
   - What went wrong during development? What was the "aha" moment?
   - What numbers can you cite? (versions, iterations, performance stats, cost)
   - What would a reader need to know to replicate this?

3. **Check for related session history**

   If there are Claude Code session JSONL files for the project, scan for interesting interactions:
   - Multi-step workflows that produced good results
   - Creative uses of tools
   - Problems that were solved in unexpected ways

4. **Anonymize sensitive details**

   When collecting examples from company-specific work:
   - Replace company names with generic equivalents ("a Fortune 500 telecom")
   - Remove internal URLs, employee names, and proprietary metrics
   - Keep the pattern and insight, strip the identifying details

5. **Write a research brief**

   For each item, write a brief that includes:
   - **Source files read** (with key excerpts)
   - **Real examples** (specific, concrete, with numbers where possible)
   - **Evolution story** (how it developed, what changed, what was learned)
   - **Key details for the draft** (things the metadata scan missed)
   - **Suggested angle** (what makes this interesting to a reader?)

### Batch Size

If there are more than 8 approved items, recommend splitting into batches. Research 5-8 items deeply rather than 18 items shallowly. The user can run the workflow again for the remaining items.

## Output Format

### research_briefs/

```
~/experiments/ai-drafts/research_briefs/
  [item-name].md    # One brief per approved item
```

Each brief should be 200-500 lines with actual excerpts, examples, and specific details. This is working material for the draft step, not a published artifact.

## Quality Criteria

- Each brief cites specific source files that were read (not just directory names)
- Each brief contains at least one real example with specific details (numbers, names, outcomes)
- No brief is purely a restatement of the metadata -- it must add depth beyond what the discover step found
- Sensitive details are anonymized but the patterns and insights are preserved
- Briefs for DeepWork jobs include actual step instructions and job.yml excerpts
