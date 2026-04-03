# Triage Candidates

## Objective

Present the discovered candidates to the user for review and selection. The user decides which items to proceed with drafting.

## Task

### Process

1. **Read candidates.md, profile_report.md, and existing published content**

   The profile report gives a narrative overview of the user's Claude Code usage.
   The candidates list has the specific items to choose from.

   Also read 2-3 existing published items from ~/experiments/AI/ (one guide, one
   experiment, one prompt) to calibrate quality expectations. New content should
   match or exceed the quality and depth of what's already published. Note the
   format patterns, level of detail, and voice used in existing content.

2. **Summarize for the user**

   Start with a brief overview from the profile report (setup, key patterns, notable
   workflows), then present the candidates grouped by category with counts:
   - "Found X candidates: Y guides, Z deepwork-jobs, W skills, ..."
   - For each candidate, show the title, description, and effort level

3. **Ask the user to select items**

   Ask structured questions using AskUserQuestion with multiSelect: true to let the user pick which candidates to draft. Group options by category. Include the effort level in each option's description.

   If there are many candidates (10+), present them in batches by category rather than one massive list.

   **Batch sizing recommendation:** If the user approves more than 8 items, strongly
   recommend splitting into batches of 5-8 for deeper treatment. The first run approved
   18 items and every draft was shallow as a result. Fewer topics at once = more depth
   per topic = better output. The workflow can be run again for remaining items. Frame
   this as a quality tradeoff: "I can draft all 18 now (shallow) or 6 now (deep) --
   which do you prefer?"

   **Establish tone early:** During triage, ask the user about writing voice, audience
   assumptions, and experiment polish level. Record these decisions in approved_items.md
   as a "Tone & Style Guide" section. These decisions flow into the research step
   (what examples to look for) and the draft step (how to write), so getting them
   right here saves rework later.

   Offer these as sensible defaults (from prior runs) and let the user adjust:
   - Voice: Builder's notebook (first person, casual -- "Here's what I built and why")
   - Audience: Assumes Claude Code familiarity; skip basics
   - Experiments: Cleaned up but casual; remove cruft, keep the experimental feel
   - Identity: "An AI practitioner's toolkit" -- personal but framed as useful to others

4. **Clarify uncertain items**

   For any candidates the user is unsure about, offer to read the source material and provide more detail to help them decide.

5. **Write approved_items.md**

   Write to `~/experiments/ai-drafts/approved_items.md` (create the directory if it
   doesn't exist). All intermediate files for this workflow go in `~/experiments/ai-drafts/`,
   NOT in `~/experiments/` root.

   Create the approved list containing only the selected items, plus any notes the user
   provided during triage (e.g., "focus on the API patterns, skip the deployment section").
   Include the Tone & Style Guide section at the top so downstream steps can reference it.

## Output Format

### approved_items.md

```markdown
# Approved Items

Selected [N] of [M] candidates for drafting.

## Tone & Style Guide

- **Voice:** [e.g., Builder's notebook, first person, casual]
- **Audience:** [e.g., Assumes Claude Code familiarity]
- **Polish level:** [e.g., Cleaned up but casual for experiments]
- **Identity:** [e.g., "An AI practitioner's toolkit"]
- **Additional notes:** [Any user-specific guidance]

## [Candidate Title]

- **Category:** guides
- **Source:** /path/to/source/material
- **Description:** 1-2 sentences on what this is and why it's worth sharing.
- **Effort:** medium
- **Dependencies:** Gemini API, ffmpeg
- **User Notes:** [Any specific guidance the user provided during triage]

## [Another Candidate]

[... same format ...]
```

## Quality Criteria

- Every selected item has the user's explicit approval
- User notes are captured accurately
- Items the user rejected are not included
- The approved list preserves all metadata from candidates.md (source path, category, effort, dependencies)
- A Tone & Style Guide section is included at the top of approved_items.md
- Batch size is 8 or fewer items (if user approved more, they were warned about the quality tradeoff)
- approved_items.md is written to ~/experiments/ai-drafts/, not ~/experiments/ root

## Context

This step is the human judgment gate. The discover step casts a wide net; triage lets the user apply editorial judgment about what's worth their time to publish. Don't skip this step or auto-approve -- the user's sense of what's interesting and what's private is essential.
