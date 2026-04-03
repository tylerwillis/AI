# Tone Guide

The voice is a shared lab notebook -- cleaned-up notes from someone who builds things
and wants to share what they learned. Think Simon Willison's blog: practical, specific,
shows the actual thing.

## Reference

Read 2-3 entries from the TIL repo before drafting. Those are the canonical examples
of the right voice. The TIL entries are short, but the tone carries to longer pieces.

## Rules

1. **Never invent details.** No fake backstories ("I was tired of X so I built Y")
   unless you KNOW that's true. If you need a detail you don't have, ask.

2. **No selling.** The goal is sharing something useful, not content marketing.
   "Here's a thing I found that worked" -- not "This revolutionary tool transforms
   your workflow."

3. **No unnecessary flourishes.** "Locks you into" → "you have to choose." "Enables
   developers to balance safety with productivity" → "helps me run Claude Code more
   autonomously." Plain words over dressed-up words, always.

4. **Call out the unique thing.** What's different about this compared to the obvious
   approach? Lead with that, not with the general category it belongs to.

5. **Only publish if there's generalizable value.** Before drafting, ask: is there
   something here that someone else could use? If the answer is just "I did a thing"
   with no transferable insight, skip it.

## Bad Patterns (with fixes)

### Corporate jargon
> "AutoGate is a comprehensive permission management framework for Claude Code that
> provides three configurable operational modes for handling tool call approvals,
> enabling developers to balance safety with productivity."

**What's wrong:** "Comprehensive permission management framework," "configurable
operational modes," and "enabling developers to balance safety with productivity"
are all overwrought. This is trying to sound important instead of being clear.

**Fix:** "A permission hook for Claude Code that I can toggle on and off mid-session.
When it's on, write operations get screened by Opus. When it's off, normal permissions.
The toggle is the key thing -- you don't have to choose between skip-all-permissions
and normal mode for an entire session."

### Recipe blog intro
> "Claude Code makes you approve every tool call or skip all permissions. I wanted
> a middle ground, so I wrote a hook that sends write operations to Opus for a
> safety check."

**What's wrong:** Oversells the problem, fake conversational, sets up Claude Code
as the bad guy. Also not accurate -- Claude Code has more nuance than "approve
everything or skip everything."

**Fix:** Same as above. Start with what the thing IS, not with a dramatic framing
of the problem it solves.

### Vague learnings
> "This project taught me valuable lessons about working with AI permission systems
> and helped improve my development workflow significantly."

**What's wrong:** Says nothing. What lessons? What improvement?

**Fix:** "Sonnet kept ignoring the 'reply with one word' instruction and returning
verbose responses. Going straight to Opus is simpler and more reliable."

### Feature-list description
> "This tool generates blog images using AI. It supports multiple styles and can
> refine results iteratively."

**What's wrong:** Lists features without saying why anyone would care or what
you actually learned.

**Fix:** Think about what's generalizable. Maybe: "I built this to understand how
image generation over API actually works -- what controls matter, what to hardcode
vs. expose to the user. The tool itself was useful for about a week, but the lessons
fed into the composable skill I use now in my DeepWork workflows." Or if there's no
generalizable takeaway, don't publish it.

## Good Patterns (from the TIL repo)

### Plain context, then the thing
> "Claude Code supports hooks -- shell commands that fire on lifecycle events. The
> PermissionRequest hook fires every time Claude wants to use a tool that requires
> approval, and your script can return JSON to allow or deny it."

One sentence of context, then straight to how it works.

### Specific and surprising learnings
> "I initially had a two-tier system (Sonnet for fast screening, Opus as escalation),
> but Sonnet kept ignoring the 'reply with one word' instruction. Going straight to
> Opus is simpler and more reliable."

This is the kind of thing someone else would hit. It's specific, surprising, and
saves them the same wrong turn.

### Honest about limitations
> "I'd need to test this more before being confident it generalized, but I was
> impressed by the hallucination reduction on this audio."

Publishing as you go. Not overclaiming, not hiding limitations, just being straight
about where things stand.

## The Quality Bar

Before publishing any piece, ask:
- Is there something here someone else could actually use or learn from?
- Am I sharing a real insight, or just "I did a thing"?
- If I removed all the filler, would there be anything left?

If the answer to any of these is no, it stays a personal experiment.
