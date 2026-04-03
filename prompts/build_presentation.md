# Build Presentation

Build a high-impact presentation from scratch using a phased approach -- pre-work, core principles, slide construction, deck-type rules, and validation.

**Models:** Tested on Claude Opus 4 and GPT-5. Both produce strong results. Works best when you also provide context about your audience, objective, and any existing content.

**Usage:** Paste this prompt along with your context (audience, objective, existing content). For example: "I need to build a Series A pitch deck for a healthcare AI startup. Our audience is generalist VCs. Here's our one-pager: [content]."

**Complements:** [review_deck.md](review_deck.md) -- use that prompt to critique a finished deck, use this one to build from scratch.

<details>
<summary><strong>View prompt</strong></summary>

```
# Build Presentation

A unified guide for creating high-impact presentations -- consulting decks, pitch decks, sales presentations, and internal communications.

---

## How to Use This Document

**Before building slides:** Complete Phase 1 (Pre-Work) -- this determines everything else.

**While building:** Reference Phase 2 (Core Principles) and Phase 3 (Slide Construction).

**For specific deck types:** See Phase 4 for tailored rules.

**Before finalizing:** Run the Validation Checklist in Phase 5.

---

## Phase 1: Pre-Work (Complete Before Any Slides)

The quality of your deck is determined before you open your presentation software. Skip this phase, and no amount of polish will save you.

### 1.1 Define the Audience

Answer these questions explicitly:

| Question | Why It Matters |
|----------|----------------|
| **Who are they?** | Determines baseline knowledge and language |
| **What do they already know?** | Never explain what they know; never assume what they don't |
| **What do they care about?** | Same content, different framing for different audiences |
| **What's their default skepticism?** | Determines your evidence burden |
| **Who's the real decision-maker?** | In groups, structure for the person whose opinion matters most |

> **Example (Pitch):** A Series A pitch to a healthcare-focused VC can skip "healthcare is a large market." A pitch to a generalist fund cannot.

> **Example (Sales/CS):** A deck for your existing customer's technical team can skip product basics. A deck for their executive sponsor who just joined cannot.

### 1.2 Define the Objective

**The ONE takeaway:** If they remember nothing else, what must stick? Write it as a single sentence. If you can't, you don't have clarity yet.

**The formula:** Use this structure to force clarity:

> **"We do [X] for [Y] so they can [Z]."**

| Component | What It Forces |
|-----------|----------------|
| **X** (what you do) | Specificity about your actual work -- not aspirations |
| **Y** (for whom) | A defined audience -- not "everyone" |
| **Z** (so they can) | A concrete outcome -- not vague benefits |

> **Weak:** "Our company is doing interesting things in AI."

> **Strong:** "We've built the only AI solution that reduces insurance claim processing time by 80% while improving accuracy."

**The desired action:** What do you want them to *do* after this presentation?

> **Examples:** "Approve the $2M budget" / "Schedule a technical follow-up" / "Sign the LOI this quarter"

**The mindset shift:** What belief are you changing?

> **From:** "This market is too risky."
> **To:** "The risk is managed, and the opportunity is urgent."

### 1.3 Know Your Delivery Format

| Format | Word Density | Visual Emphasis | Standalone Clarity |
|--------|--------------|-----------------|-------------------|
| **Live presentation** | Low (25-50 words) | High -- visuals carry message | Low -- you provide context |
| **Read-ahead / Email** | Moderate (75-100 words) | Moderate -- supports text | High -- must stand alone |
| **Hybrid** | Moderate with appendix | High in main, detailed in backup | Must work both ways |

**The "Read Alone Test":** If you leave the room, can the reader understand the slide 100% on their own? Read-aheads must pass this test.

**Critical:** Decks are frequently forwarded internally. Build for standalone clarity.

### 1.4 Know Your Time Constraint

**Rule of thumb:** 1-2 minutes per slide for presented decks.

> **Example:** 45-minute meeting -> 15 minutes for Q&A -> 30 minutes of presentation -> 15 slides maximum.

### 1.5 Anticipate Objections

If you can't name the top 3 objections your audience will have, you don't know your audience well enough.

### 1.6 Design the Emotional Journey

> **Pitch deck:** Curious -> Excited -> Confident -> Urgent
> **Sales deck:** Skeptical -> Intrigued -> Convinced -> Ready to act
> **CS deck:** Uncertain -> Informed -> Capable -> Enthusiastic
> **Consulting deck:** Concerned -> Understood -> Relieved -> Aligned
> **Internal deck:** Unclear -> Informed -> Aligned -> Decisive

---

## Phase 2: Core Principles (Universal Rules)

### 2.1 The Storyline Test

**Read only your slide titles in sequence. They must form a coherent, persuasive argument.**

> **Failing:**
> 1. Introduction
> 2. Market Overview
> 3. Our Solution
> 4. Team
> 5. Ask
>
> *These are labels, not a story.*

> **Passing:**
> 1. Enterprise security teams waste 40% of time on false positives
> 2. Existing solutions trade accuracy for speed -- teams must choose
> 3. Our AI triages alerts with 95% accuracy in real-time
> 4. Three enterprise pilots reduced alert fatigue by 60%
> 5. We'll reach $15M ARR and profitability in 18 months

### 2.2 Pyramid Structure

Answer first, then evidence.

### 2.3 One Message Per Slide

Every slide answers one question. The title states the answer. The body proves it.

**The test:** Can you summarize the slide in one sentence without using "and"?

### 2.4 Takeaway Titles, Not Labels

| Label (Weak) | Takeaway (Strong) |
|--------------|-------------------|
| Market Overview | The $50B security market is consolidating around AI-native solutions |
| Q3 Results | Q3 revenue grew 24% driven by enterprise expansion |
| Team | Our founders built the fraud detection systems at Stripe and Square |

### 2.5 Evidence Standards

Every claim requires visible support. "Trust me" is not a source.

### 2.6 The "So What" Ladder

[DATA] -> "So what?" -> [INSIGHT] -> "So what?" -> [IMPLICATION] -> "So what?" -> [ACTION]

### 2.7 Clarity Over Impression

| Abstract (Weak) | Concrete (Strong) |
|-----------------|-------------------|
| "Mechanics of engagement" | "How users actually interact with the product" |
| "Orchestration layer" | "Coordination system" |

### 2.8 Ruthless Brevity

Every slide must earn its place. The test isn't "is this slide good?" but "would the deck be worse without it?"

---

## Phase 3: Slide Construction

### 3.1 The 3-Second Rule
The audience should grasp the slide's point within 3 seconds.

### 3.2 Text Density by Format

| Context | Maximum Words |
|---------|---------------|
| Live presentation | 50 words |
| Read-ahead main slides | 100 words |
| Executive summary | 150 words |
| Appendix/detail | As needed |

### 3.3 Visual Hierarchy
Size, position, weight, and whitespace signal importance.

### 3.4 Chart Rules
Chart titles are takeaways, not labels. Put numbers on bars. Minimize legends. Add callout annotations.

### 3.5 Speaker Notes Architecture
Transition -> Hook -> Core Insight -> Support -> Bridge

### 3.6 Backup Slide Strategy
Main slides tell your story. Backup slides handle "what if they ask about X?"

---

## Phase 4: Deck-Type Specific Rules

### 4.1 Consulting Deck (20-50+ slides)
Structure: Executive Summary -> Context & Problem -> Analysis -> Options -> Recommendation -> Implementation
Use SCR/SCQA framework: Situation -> Complication -> Resolution
Density: Most slides 20-60 words. Ceiling 120.

### 4.2 Investor Pitch Deck (10-25 slides)
Three core questions: Why Now? Why Us? What Will We Achieve?
Final slide leads with milestones, not raise amount.
No label-only titles anywhere.
Market sizing must be bottom-up.

### 4.3 Sales Deck (8-15 slides)
Structure: Pain -> Solution -> Proof -> Action
Pain must be specific and urgent. Solution framed as outcomes, not features.
ROI must be concrete with visible math.
Density: Most slides 5-15 words. Ceiling 20.

### 4.4 Internal Deck (5-15 slides)
Structure: Progress -> Insights -> Decisions needed
Lead with what you need from the room. If no decision is needed, it should be an email.

### 4.5 Customer Success Deck (8-20 slides)
Lead with their goals, not your product. Make them feel smart, not overwhelmed.

---

## Phase 5: Validation Checklist

### Structure
- [ ] Executive summary within first 3 slides
- [ ] Titles read as coherent argument
- [ ] Final slide has clear next steps/milestones
- [ ] No consecutive slides making the same point
- [ ] Could the deck be 20-30% shorter?

### Slide-Level
- [ ] Word count within format target
- [ ] One main idea per slide
- [ ] All titles are takeaways, not labels
- [ ] Claims supported by evidence in slide body

### Evidence
- [ ] Market size claims have third-party sources
- [ ] Statistics have attribution
- [ ] Competitive claims have evidence

### Flow
- [ ] Logical connections between consecutive slides
- [ ] Transition language in speaker notes

---

## Phase 6: Critique Framework

| Level | When to Use |
|-------|-------------|
| **Fundamentally sound** | Minor polish needed |
| **Significant gaps** | Core story exists but issues undermine it |
| **Materially misses** | Right ingredients, wrong execution |
| **Needs rebuild** | Fundamental strategy problems |

---

## Quick Reference: Deck Type Comparison

| Attribute | Consulting | Investor (Seed) | Investor (Growth) | Sales | CS | Internal |
|-----------|------------|-----------------|-------------------|-------|-----|----------|
| Length | 20-50+ | 10-15 | 15-25 | 8-15 | 8-20 | 5-15 |
| Typical density | 40-60 words | 10-20 | 20-40 | 5-15 | 10-20 | 20-40 |
| Ceiling density | 120 | 100 | 100 | 20 | 80 | 80 |
```

</details>
