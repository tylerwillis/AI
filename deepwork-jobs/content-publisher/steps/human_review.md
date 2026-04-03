# Human Review

## Objective

Present all drafted content to the user for manual review. This is the quality and sensitivity gate before anything goes public.

## Task

### Process

1. **List all drafts**

   Read the `drafts/` directory and list all files grouped by category. For each draft, show:
   - File path
   - Category
   - Brief summary (first 2-3 sentences or title)

2. **Present each draft for review**

   For each draft, read the full content and present it to the user. The user is checking for:

   - **Quality:** Is this worth sharing publicly? Is it well-written and useful?
   - **Sensitivity:** Any API keys, company internals, personal info, or trade secrets that slipped through sanitization?
   - **Accuracy:** Does the content accurately represent what the tool/workflow does?
   - **Completeness:** Is it self-contained enough for a stranger to follow?
   - **Privacy:** Is there anything the user would prefer to keep private, even if it's not technically sensitive?

3. **Collect decisions**

   For each item, ask the user using AskUserQuestion:
   - **Approve** -- ready to publish as-is
   - **Approve with changes** -- needs specific edits before publishing
   - **Reject** -- don't publish this one

4. **Make requested changes**

   For items that need changes, make the edits and re-present the updated version for final approval.

5. **Write review_checklist.md**

   Log every item's status and any notes.

## Output Format

### review_checklist.md

```markdown
# Content Review Checklist

| Item | Category | Status | Notes |
|------|----------|--------|-------|
| [name] | guides | approved | -- |
| [name] | skills | changes-made | Removed company reference in paragraph 3 |
| [name] | experiments | rejected | Too specific to internal tooling |
```

Only items with status "approved" or "changes-made" will proceed to publishing.

## Quality Criteria

- Every draft was presented to the user for review
- User decisions are captured accurately in the checklist
- Requested changes were made and re-approved
- No item proceeds to publishing without explicit user approval

## Context

This is the most important gate in the pipeline. Everything before this is automated; this step ensures a human with full context makes the final call on what goes public. The user knows things the AI doesn't -- internal politics, competitive sensitivity, personal preferences about what to share. Never skip or rush this step.
