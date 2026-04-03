# QA: Website Quality Assurance Skill

Run adversarial QA validation on any website. Checks for placeholder content, dead links, broken anchors, source verification, and credibility issues.

**Type:** Custom Claude Code skill

## What It Does

Systematically validates website content through multiple passes: site completeness, placeholder detection, source verification, asset utilization, and credibility review. The mindset is adversarial -- assume every testimonial is invented, every link is broken, every number is wrong, then prove otherwise.

## When to Use

Run after generating or editing website pages. Catches the kinds of issues that LLM-generated sites frequently have: placeholder text that slipped through, invented testimonials, broken anchor links, and unsourced statistics.

## Usage

```
/qa              # Full validation (all checks)
/qa quick        # Just placeholders + dead links
/qa sources      # Just source verification
/qa recursive    # Keep checking/fixing until clean (max 3 passes)
```

## The Skill

<details>
<summary><strong>SKILL.md</strong></summary>

```markdown
---
name: qa
description: Run QA validation on website content. Checks for placeholder content, dead links, invented testimonials, missing assets, incomplete pages, and credibility issues. Use after generating or editing website pages.
---

# Website QA Validation Skill

Run comprehensive quality assurance checks on website content before publishing.

## Mindset

**Be adversarial.** Assume every testimonial is invented, every link is broken, every number is wrong. Your job is to PROVE each element is correct by finding its source, not to assume it's correct because it sounds plausible.

## Full QA Process

### Pass 0: Site Completeness (DO THIS FIRST)

The site is not done until every link goes somewhere real.

1. List all pages that exist in the project
2. List all links in navigation (header/nav component)
3. List all links in footer
4. For each nav/footer link, verify the destination page exists AND has real content
5. Check for "coming soon", placeholder pages, or pages with just headers

**If the site is incomplete, stop here.** Fix missing pages before other QA passes.

### Pass 0.25: Navigation Structure

Check that navigation follows B2B SaaS best practices:
- 4-6 top-level items maximum
- Industry/solution pages should NOT be individual top-level items
- Login link present
- Clear CTA button
- MECE principle (Mutually Exclusive, Collectively Exhaustive)

### Pass 1: Placeholder Detection

Search the codebase for these patterns (should find ZERO matches):

**Text placeholders:**
- Lorem ipsum, [TODO], [PLACEHOLDER], TBD, Coming soon
- XX%, $XX, example@, 555- (placeholder numbers/contacts)

**Link placeholders:**
- href="#", href="javascript:void(0)", href=""

**Broken anchor links:**
- Links like href="#demo" where no matching id="demo" exists

**Visual placeholders:**
- Gray boxes, "Image placeholder" text, broken image references

### Pass 2: Source Verification

For each item, actually open the source file and verify. Don't trust memory.

**Testimonials:** Find every quote, verify against your canonical source (word-for-word match required).

**Statistics:** Find every number, verify against your facts reference (including qualifiers like "+" or ">").

**Customers:** Verify each customer is listed and nameable (or using correct anonymous label).

**Logos:** Verify file exists at the path and is approved for use.

### Pass 3: Asset Utilization

Check that you're using what you have:
- Case study links present where mentioned
- PDF downloads offered where available
- Real screenshots used instead of mockups

### Pass 4: Credibility Review

1. **Claims constraints**: Check for overclaims (e.g., "causes" vs "associated with", "predicts" vs "surfaces")
2. **Domain knowledge**: Do industry-specific claims make real-world sense?
3. **Math coherence**: Do numbers add up? Are percentages reasonable?

## Output Format

Provide a clear report with checkmarks for passing items and ISSUE flags for failures. Group by pass. Include summary with total issues, auto-fixable count, and items requiring decisions.

## Auto-Fixing

When possible, fix issues automatically:
- Replace placeholder links with real destinations
- Fix statistics to match source exactly
- Remove placeholder text

Always show what was changed. For ambiguous issues, ask the user.
```

</details>

## Why This Exists

LLM-generated websites have a specific failure mode: they produce content that *looks* right but contains invented quotes, placeholder links, and unsourced statistics. This skill catches those issues systematically. I built it after finding too many "testimonials" in AI-generated sites that didn't match any real customer quote.

## Adapting for Your Project

The skill references a "canonical source" for testimonials, stats, and customers. To use this for your own project:
1. Create a reference file with your verified quotes, statistics, and customer names
2. Update the source verification pass to point at your reference files
3. Run `/qa` after any content generation
