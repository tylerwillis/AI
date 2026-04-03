# Publish to GitHub

## Objective

For each approved item from the review checklist, copy it into the repo, create a branch, update the relevant README indexes, and open a PR.

## Task

### Process

For each item with status "approved" or "changes-made" in review_checklist.md:

1. **Create a feature branch**

   ```bash
   cd [TARGET_REPO]
   git checkout main && git pull origin main
   git checkout -b content/[category]/[item-name]
   ```

   Use a descriptive branch name: `content/guides/video-to-presentation`, `content/skills/gemini-imagegen`, etc.

2. **Copy draft content into the repo**

   Copy from `[WORKING_DIR]/drafts/[category]/[item-name]/` to `[category]/[item-name]/` in the repo root.

   For single-file items (prompts, skills), copy the file directly into the category directory.

3. **Update the category README**

   Add the new item to the category's README.md index. Follow the existing pattern:
   - For guides/README.md: add a `## [Title](subdirectory/)` section with 1-2 sentence description
   - For prompts/README.md: add a section with the prompt description and collapsible content
   - For skills/README.md, deepwork-jobs/README.md, experiments/README.md: add an entry following the existing format

4. **Update the top-level README if needed**

   If the new content changes the overall description of a category (e.g., adding the first skill when skills/ was empty), update the top-level README.md entry for that category.

5. **Commit and push**

   ```bash
   git add [category]/[item-name]/ [category]/README.md
   # Also add README.md if it was updated
   git commit -m "Add [item-name] to [category]"
   git push -u origin content/[category]/[item-name]
   ```

6. **Create a PR**

   ```bash
   gh pr create \
     --title "Add [item-name]" \
     --body "## Summary

   [1-2 sentence description of what this content is]

   **Category:** [category]
   **Source:** [original source path]

   ## Checklist
   - [ ] Content is accurate
   - [ ] No sensitive information
   - [ ] README index updated"
   ```

7. **Log the PR**

   Record the PR URL in published_prs.md.

8. **Return to main before the next item**

   ```bash
   git checkout main
   ```

### After all items are published

Ask the user if they want to clean up the working directory:

```bash
rm -rf [WORKING_DIR]/
```

**Note:** Only clean up after all PRs have been created and the user has confirmed.
If any PRs need revision after publishing, the drafts and research briefs will be
needed. Suggest keeping `[WORKING_DIR]/` until all PRs are merged.

## Output Format

### published_prs.md

```markdown
# Published PRs

| Item | Category | PR URL | Status |
|------|----------|--------|--------|
| [name] | guides | https://github.com/[USER]/[REPO]/pull/N | open |
| [name] | skills | https://github.com/[USER]/[REPO]/pull/M | open |
```

## Quality Criteria

- Each approved item has a corresponding PR
- Each PR has a descriptive title and body
- Category README indexes are updated
- Each branch is created from an up-to-date main
- No draft content is left uncommitted

## Context

This is the final step. The repo has branch protection on main, so all content goes through PRs. The user will review and merge each PR on GitHub. Creating separate PRs per item (rather than one batch PR) lets the user merge content independently and makes the git history cleaner.
