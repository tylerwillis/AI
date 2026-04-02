# Deck Review Prompt

Critique the attached deck using the principles below. 

**Important:** When giving feedback, assume I'm not familiar with these principles and no longer have access to this document. Explain the concepts in your feedback rather than just referencing them (e.g., don't say "this fails the Storyline Test"—explain what that means and why it matters).

---

## How to Review

**Step 1: Classify the deck.** Determine if this is a sales deck, customer success deck, investor pitch, consulting deck, or internal deck. This determines which standards apply.

**Step 2: Internalize the relevant standards.** Before forming opinions, review:
- Phase 2 (Core Principles)—especially the Storyline Test, Takeaway Titles, and Evidence Standards
- Phase 4—the specific rules for this deck type
- Phase 1—to assess whether foundational thinking was done

**Step 3: Evaluate against those standards.**
- Run the Storyline Test: Read only the slide titles in sequence—do they form a coherent argument?
- Apply the Validation Checklist (Phase 5)
- Note specific issues with slide references

**Step 4: Structure your critique (Phase 6).** Lead with overall assessment, then provide comprehensive feedback organized by severity.

---

## Output Format

Structure your review as follows:

1. **Deck Type:** [Classification and brief rationale]

2. **Overall Assessment:** [One of: Fundamentally Sound / Significant Gaps / Materially Misses / Needs Rebuild] + 2-3 sentence summary

3. **Storyline Test:** Does reading the titles in sequence tell a coherent story? Quote the actual titles and assess as **Pass** (titles alone tell the story), **Warning** (story is logically sound but titles need polish), or **Error** (no discernible story or titles contradict content).

4. **Issues by Severity:** Provide comprehensive feedback, organized as:
   - **Errors** — Must fix. Will cause confusion or undermine credibility.
   - **Warnings** — Should fix. Won't break the deck, but weakens impact.
   - **Suggestions** — Nice to have. Polish items for when time allows.
   
   For each issue, include:
   - What's wrong
   - Why it matters
   - Specific slide references
   - How to fix it

5. **Density & Brevity Audit:** (Required)
   - Total slide count: [X] — Could this deck achieve its goal with fewer slides? If yes, which slides should be cut or combined?
   - List every slide that exceeds the word count ceiling for its type (see Phase 4)
   - List every slide with bullets that run 2+ lines
   - List slides that could be cut entirely without losing the argument

6. **What's Working:** Things the deck does well—acknowledge strengths, not just problems.

---

## Calibration: Where to Push Hard

LLMs tend to under-index on certain issues. Be aggressive on these:

### 1. Brevity and Density
**Assume every deck is too long and too dense until proven otherwise.** This is not "check if there's an issue"—it's "find where the issues are."

You MUST:
- Identify at least 3 slides that could be more concise (if fewer than 3 exist, explicitly state why each slide is already at minimum viable density)
- Recommend cutting or combining at least 2 slides (if none can be cut, justify why each slide earns its place)
- Flag every bullet that runs 2+ lines
- Call out any slide exceeding the word count ceiling as an **Error**, not a Warning

When in doubt, recommend cutting. The burden of proof is on inclusion.

**Exception: Situation and pain slides.** These earn their place through emotional impact, not information. A weak pain slide usually needs strengthening, not removal. See "Don't Reflexively Cut Situation/Pain Slides" in the next section before recommending cuts here.

### 2. Deck-Level Genericness
Don't just catch generic evidence—catch generic *stories*:
- Could a competitor use this exact deck with their logo swapped in? If yes, the deck is too generic
- Is the "why us" actually specific to this team, or could anyone claim it?
- Is the "why now" a real market shift, or just "the market is big and growing"?
- Does the ONE takeaway differentiate, or is it a category claim anyone could make?
- A deck full of well-sourced evidence can still fail if the overall message is bland

### 3. Specificity Over Polish
Generic-but-polished is worse than rough-but-specific. Call out:
- Pain points that any company in the space could claim
- Value props that don't name concrete outcomes
- "We're the best" without "at what, specifically, and for whom"

---

## Calibration: Where to Be Careful

LLMs tend to over-correct on language. Be careful here:

### Don't Reflexively Cut Situation/Pain Slides

Many decks follow a Situation-Complication-Question-Answer (SCQA) structure. The Situation establishes context; the Complication introduces the problem. In sales, this is sometimes called "dragging them through the glass"—making the pain vivid enough that the audience actively wants a solution.

These slides earn their place through **emotional impact**, not information density. A weak pain slide doesn't mean "cut it"—it usually means "make it land harder."

**Before recommending to cut a situation or pain slide, ask:**
- Is this slide doing necessary setup that later slides depend on?
- Would removing it make the solution feel less urgent or relevant?
- Is the issue that the slide exists, or that it's too generic/abstract to land?

**The right fix is usually:**
- Make the pain more specific and vivid (not "teams struggle" but "reps spend 2 hours daily on data entry")
- Add concrete evidence of the cost (dollars, time, churn, risk)
- Tighten the language so it hits harder in fewer words

**Only recommend cutting when:**
- The situation is already clear from context (audience knows the problem well)
- Multiple slides make the same pain point redundantly
- The pain isn't actually connected to what you're selling

When critiquing, distinguish between "this slide is unnecessary" and "this slide isn't landing—here's how to strengthen it."

### Avoid Academic or Stilted Suggestions
When suggesting rewrites—especially for titles—read them aloud. Would a presenter actually say this?

**Bad LLM-style suggestions:**
- "Enterprise Resource Optimization Through Automated Workflow Integration" ← sounds like a thesis title
- "Significant Cost Reduction Is Achievable Via Process Consolidation" ← passive, bureaucratic
- "The Problem: Inefficiencies in Current Operational Paradigms" ← jargon-laden

**Good suggestions:**
- "We cut processing time from 6 weeks to 3 days"
- "Your reps spend 2 hours daily on data entry—we eliminate that"
- "Three customers saved $2M in year one"

Titles should be **speakable, punchy, and motivating**—not technically precise but lifeless.

### Preserve the Presenter's Voice
If the deck has a distinctive voice or energy, don't sand it down into corporate-speak. Flag problems, but suggest fixes that match the deck's existing tone.

### Don't Optimize Locally at the Expense of Flow
A title can be "correct" in isolation but break the narrative arc. Before suggesting a rewrite, check: does this new title flow from the previous slide and into the next?

---

# Presentation Principles Reference

The following principles define what good looks like. Use them to evaluate the deck and explain your feedback.

---

## Phase 1: Pre-Work Principles

*For reviewers: Use this section to infer whether the deck creator did their homework. A deck that fails here has foundational problems—no amount of slide polish will fix it.*

The quality of a deck is determined before the creator opens their presentation software. When these fundamentals are missing, it shows.

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

> **Weak:** "Our company is doing interesting things in AI."

> **Strong:** "We've built the only AI solution that reduces insurance claim processing time by 80% while improving accuracy."

**The desired action:** What do you want them to *do* after this presentation?

> **Examples:** "Approve the $2M budget" / "Schedule a technical follow-up" / "Sign the LOI this quarter"

**The mindset shift:** What belief are you changing?

> **From:** "This market is too risky."

> **To:** "The risk is managed, and the opportunity is urgent."

### 1.3 Know Your Delivery Format

The format fundamentally changes how you build.

| Format | Word Density | Visual Emphasis | Standalone Clarity |
|--------|--------------|-----------------|-------------------|
| **Live presentation** | Low (25–50 words) | High—visuals carry message | Low—you provide context |
| **Read-ahead / Email** | Moderate (75–100 words) | Moderate—supports text | High—must stand alone |
| **Hybrid** | Moderate with appendix | High in main, detailed in backup | Must work both ways |

**The "Read Alone Test":** If you leave the room, can the reader understand the slide 100% on their own? Read-aheads must pass this test.

**Critical:** Decks are frequently forwarded internally. The person you present to shares it with others who weren't in the room—investors forward to partners, buyers forward to stakeholders, champions forward to decision-makers. Build for standalone clarity.

**The Dual-Purpose Trap:** Many decks try to serve as both a live presentation AND a read-ahead—and fail at both. They're too dense to present without reading, but too sparse to stand alone. Choose your primary format. If you must serve both, keep the main slides sparse (just the key points you'll speak to) and put the detail in an appendix that works standalone when forwarded.

### 1.4 Know Your Time Constraint

**Rule of thumb:** 1–2 minutes per slide for presented decks.

**Back-time from Q&A:** A 30-minute meeting with no Q&A is a monologue, not a conversation.

> **Example:** 45-minute meeting → 15 minutes for Q&A → 30 minutes of presentation → 15 slides maximum.

### 1.5 Anticipate Objections

If you can't name the top 3 objections your audience will have, you don't know your audience well enough.

For each objection, decide:
- Address proactively in the main flow?
- Prepare a backup slide?
- Handle verbally if raised?

### 1.6 Design the Emotional Journey

Your audience isn't waiting eagerly to be convinced. Investors are bored—they've seen three pitches today. Buyers are skeptical—they've been sold to before. Attendees are distracted—this is one of many meetings.

Your first job is earning attention. Only then can logic get consideration and emotion drive action.

**Once you have their attention, where do you take them?**

> **Pitch deck:** Curious → Excited → Confident → Urgent

> **Sales deck:** Skeptical → Intrigued → Convinced → Ready to act

> **CS deck:** Uncertain → Informed → Capable → Enthusiastic

> **Consulting deck:** Concerned → Understood → Relieved → Aligned

> **Internal deck:** Unclear → Informed → Aligned → Decisive

**Earned vs. Manufactured Emotion**

There's a critical difference:
- **Earned emotion:** The evidence genuinely warrants the reaction
- **Manufactured emotion:** The content doesn't support the claim

> **Manufactured:** Title says "A catastrophic failure in customer service" but the stat is "average hold time increased to 4 minutes." Longer holds are annoying, not catastrophic.

> **Earned:** Title says "Customer churn has reached emergency levels" supported by "38% of customers churned in Q2; $4.2M monthly revenue lost to competitors."

Sophisticated readers—investors, executives, buyers—feel manipulated when emotion is manufactured. They've seen hundreds of decks and can spot when headlines overclaim or evidence is missing.

---

## Phase 2: Core Principles (Universal Rules)

These apply to every deck, regardless of type.

### 2.1 The Storyline Test

**Read only your slide titles in sequence. They should form a coherent, persuasive argument.**

The gold standard: someone can understand your recommendation from titles alone. This is an important structural test.

**How to assess:**

| Result | When to Apply |
|--------|---------------|
| **Pass** | Titles alone tell the complete story. A reader could skip the slide bodies and understand the argument. |
| **Warning** | The story is logically sound, but titles don't fully articulate it. A quick skim of titles + slide content reveals a coherent argument—it's just not self-evident from titles alone. |
| **Error** | No discernible story exists. Titles are pure labels with no logical flow, OR the actual content contradicts the narrative the titles suggest. |

> **Error-level (no story):**
> 1. Introduction
> 2. Market Overview
> 3. Our Solution
> 4. Team
> 5. Ask
>
> *These are labels, not a story. Even skimming the slides, there's no clear argument thread.*

> **Warning-level (story exists, titles need work):**
> 1. Hotels are expensive.
> 2. Our community-driven approach offers a better experience AND better economics.
> 3. The risks of community-driven stays: variance and safety.
> 4. Our customers rate us 50% higher than hotels on variance and safety.
> 5. We're growing 50% month-over-month.
>
> *The logical arc is there (problem → gap → solution → proof → future), but titles don't fully articulate it. A reader needs to skim slide content to get the argument.*

> **Pass (titles tell the story):**
> 1. Enterprise security teams waste 40% of time on false positives
> 2. Existing solutions trade accuracy for speed—teams must choose
> 3. Our AI triages alerts with 95% accuracy in real-time
> 4. Three enterprise pilots reduced alert fatigue by 60%
> 5. We'll reach $15M ARR and profitability in 18 months
>
> *Now you understand the pitch without seeing a single slide body.*

**How to do this:**
1. Write slide titles first—before any content
2. Read them aloud in sequence
3. Ask: "Does this flow logically? Is there a narrative arc?"
4. Revise until titles alone tell your story

**Redundancy check:** If two titles make essentially the same point, you have one slide too many.

### 2.2 Pyramid Structure

Structure from the top down: answer first, then evidence.

~~~
                    [Governing Thought]
                    Your main conclusion
                           ↓
        ┌──────────────────┼──────────────────┐
        ↓                  ↓                  ↓
   [Key Argument 1]   [Key Argument 2]   [Key Argument 3]
        ↓                  ↓                  ↓
   [Evidence]         [Evidence]         [Evidence]
~~~

**The Governing Thought** is your single most important conclusion—appears in your executive summary and is restated at the end. (This is the same as the "ONE takeaway" from Phase 1.)

**The Executive Summary** is broader: it contains the governing thought plus the 2–4 key arguments that support it, plus your recommendation. It's a summary of the entire deck's argument, not just the conclusion.

**Key Arguments** (2–4, typically 3) are the main reasons your governing thought is true.

> **Example (Consulting):**
> - **Governing thought:** "Consolidate from 5 distribution centers to 3 to save $40M annually"
> - **Key argument 1:** "Current network has 35% redundant capacity"
> - **Key argument 2:** "Three-hub model serves 95% of customers within 2-day shipping"
> - **Key argument 3:** "Transition completes in 18 months with minimal disruption"

### 2.3 One Message Per Slide

Every slide answers one question. The title states the answer. The body proves it.

**The test:** Can you summarize the slide in one sentence without using "and"?

> **Failing:** "This slide shows our market opportunity and competitive landscape and go-to-market strategy." → This is three slides.

> **Passing:** "This slide shows we've captured 15% of our target segment in 12 months." → One clear message.

**Common violations:**
- Two charts showing different things
- A chart plus an unrelated bullet list
- The phrase "In addition..." appearing anywhere

### 2.4 Takeaway Titles, Not Labels

Slide titles must be complete sentences stating conclusions—not labels describing content.

**And the body must prove what the title claims.**

| Label (Weak) | Takeaway (Strong) |
|--------------|-------------------|
| Market Overview | The $50B security market is consolidating around AI-native solutions |
| Q3 Results | Q3 revenue grew 24% driven by enterprise expansion |
| Competitive Landscape | We're the only solution combining real-time detection with automated response |
| Team | Our team built the fraud detection systems at Stripe and Square |

**Critical: The slide body must prove the title.**

A takeaway title is a claim. Claims require evidence.

> **Example (title not supported):**
> - Title: "Warehouse teams are collapsing under impossible workloads"
> - Content: "200+ picks per hour targets, 12-hour shifts during peak"
>
> *"Collapsing" implies breakdown—turnover data, injury rates, burnout testimonials. The content shows strain, not collapse.*

> **Example (title supported):**
> - Title: "Warehouse worker burnout has reached crisis levels"
> - Content: "52% turnover rate (vs. 25% industry average), 280% increase in injury claims"

### 2.5 Evidence Standards

Every claim requires visible support. "Trust me" is not a source.

| Claim Type | Evidence Required |
|------------|-------------------|
| Market size | Third-party source (Gartner, industry report) |
| Growth rate | Your data with methodology note |
| Customer outcomes | Specific metrics with attribution |
| Technical performance | Test results, benchmarks |
| Competitive comparison | Feature-by-feature with source |

**Every statistic needs a source.** Unsourced statistics read as made up—even when accurate.

> **Weak:** "Customers love our product."

> **Strong:** "NPS of 72 across 150 enterprise customers, vs. industry average of 35."

### 2.6 Clarity Over Impression

**Confusion is the enemy.** Never use abstract language when concrete language exists.

| Abstract (Weak) | Concrete (Strong) |
|-----------------|-------------------|
| "Mechanics of engagement" | "How users actually interact with the product" |
| "Orchestration layer" | "Coordination system" |
| "Intelligence compounds" | "The system gets smarter with use" |
| "Dynamic resource allocation" | "Automatically assign tickets to available reps" |

**The jargon test:** Read each slide aloud. If you'd never say it in conversation, don't write it in a deck.

**Dressed-up language signals insecurity.** When presenters use inflated language, the audience assumes they're compensating for weak substance.

### 2.7 Ruthless Brevity

Every slide must earn its place. Every word must earn its place. The test isn't "is this slide good?" but "would the deck be worse without it?" If the answer isn't a clear yes, cut it.

**Shorter decks are always better.** A 10-slide deck that lands is superior to a 20-slide deck that's "complete." Audiences don't give credit for thoroughness—they give credit for clarity and respect for their time.

**The burden of proof is on inclusion, not exclusion.** Don't ask "is there a reason to cut this?" Ask "is there a reason this must exist?" Default to cutting.

---

## Phase 3: Slide Construction

Rules for building individual slides.

### 3.1 The 3-Second Rule

The audience should grasp the slide's point within 3 seconds. If they're still parsing the layout, redesign.

**Test:**
1. Show the slide to someone unfamiliar with it
2. After 3 seconds, hide it
3. Ask: "What was that slide about?"
4. If they can't answer, simplify

### 3.2 Text Density by Format

**The goal is always the fewest words that achieve the slide's purpose.** 

**Critical framing:** Every density number in this document is a ceiling, not a target. Most slides should be well under the ceiling. If you're routinely hitting the maximum, you're too dense. A great deck has mostly sparse slides with occasional denser slides for evidence or detail. If you need to prove something, try to do it with tables, charts, images, or other visual examples.

| Context | Maximum Words |
|---------|---------------|
| Live presentation | 50 words |
| Read-ahead main slides | 100 words |
| Executive summary | 150 words |
| Appendix/detail | As needed |

When deck-type guidance (Phase 4) conflicts with format guidance, use the lower number. (Exception: Consulting decks are typically read-aheads or hybrids, not pure live presentations—use the Consulting density guidance, not the live presentation cap.)

**Bullet guidelines:**
- 3–6 bullets per slide maximum
- 15–18 words per bullet maximum
- Avoid large paragraphs

**The Presenter Test:** For live presentations, if you'd need to pause and let the audience read the slide—or worse, read it aloud to them—it's too dense. Presented slides should support your voice, not replace it.

### 3.3 Visual Hierarchy

The eye should know where to go first, second, and third.

**Hierarchy signals:**
- **Size:** Larger = more important
- **Position:** Top-left and center get attention first
- **Weight:** Bold and color draw the eye
- **Whitespace:** Isolation creates emphasis

**The squint test:** Step back and squint. Can you tell what's most important? If everything looks equal, you have a hierarchy problem.

### 3.4 Chart Rules

Charts must earn their place. Every chart needs a "so what."

**Chart titles are takeaways:**

| Label (Weak) | Takeaway (Strong) |
|--------------|-------------------|
| Revenue by Quarter | Revenue grew 24% driven by enterprise segment |
| Customer Satisfaction | NPS improved 15 points after feature launch |

**Rules:**
- Put numbers on bars, lines, and segments
- Minimize legends that force eye movement
- Add callout annotations pointing to what matters
- Remove gridlines, 3D effects, decorative elements

### 3.5 Consistent Visual Language

- Same colors mean the same things throughout
- Same formatting for same-level content
- Consistent slide layouts for similar content types

### 3.6 Speaker Notes Architecture

Never just repeat the slide. Structure for glanceability:

~~~
[TRANSITION] (1 sentence)
"Moving on from [previous concept]..."

[HOOK] (1 sentence)
A rhetorical question or surprising stat to grab attention

[CORE INSIGHT] (2-3 sentences)
The main point in plain English—your talk track

[SUPPORT] (1-2 items)
Stats or anecdotes NOT on the slide—adds value to listening

[BRIDGE] (1 sentence)
Sets up the next slide's title
~~~

**Additional guidance:**
- Mark optional content: "[If time] mention the European pilot"
- Note timing cues: "[~2 min on this slide]"
- Flag backup slides: "If they ask about methodology, see slide 24"

---

## Phase 4: Deck-Type Specific Rules

### 4.1 Consulting Deck

**Typical length:** 20–50+ slides (including appendix)

**Structure arc:**
1. **Executive Summary / Recommendation** — Main answer with 2–4 key supporting reasons
2. **Context & Problem** — What's happening and why it matters
3. **Analysis & Drivers** — Key drivers, root causes, scenarios
4. **Options / Alternatives** — Different paths and trade-offs
5. **Recommendation & Rationale** — Why this path over alternatives
6. **Implementation / Next Steps** — How to execute, risks, timing

**Requirements:**
- Executive summary within first 3 slides stating the recommendation
- Final slides must include clear next steps, owners, and timing
- Higher density is acceptable, but still keep content as brief as possible
- Rigorous evidence; cite sources; show methodology

**Density:** Most slides 20–60 words. Ceiling of 120 for dense analysis slides. Consulting is the exception where higher density is expected—but even here, less is better.

### 4.2 Investor Pitch Deck

**Typical length:** 10–15 slides (seed/early), 15–25 slides (growth)

**The Three Core Questions:**

Every major slide should help answer one of these:

1. **Why Now?**
   - What changed in the world (technology, regulation, behavior, cost) that makes this opportunity possible or much bigger *now*?

2. **Why Us?**
   - Why is this team uniquely positioned to win?
   - Team background, unique insight, traction, unfair advantage

3. **What Will We Achieve?**
   - What concrete milestones with this round?
   - Should set up an impressive next round OR profitability with high growth

**Structure:**
1. **Company Thesis** — Clear one-liner: "We do X for Y so they can Z"
2. **Why Now** — What changed, why this moment is special
3. **Why Us** — Team + insight + execution advantage
4. **Supporting Slides** — Problem, product, market, traction, GTM, economics
5. **Milestone Plan** — What you'll achieve with this round

**Takeaway Titles Only:**

For investor decks, label-only titles are never acceptable:

> **Not allowed:** "Problem" / "Solution" / "Team" / "Market" / "The Ask"

> **Required:** "Legacy systems force recruiters into 6–8 week hiring cycles" / "Our automation platform cuts time-to-hire from 6–8 weeks to under 10 days"

**Market Sizing — Bottom-Up Required:**

| Approach | Example |
|----------|---------|
| **Top-down (weak)** | "$500B industry; if we get 1%..." |
| **Bottom-up (strong)** | "12,000 target companies × $50K ACV × 30% penetration = $180M SAM" |

Show how your actual target segment translates to revenue with explicit assumptions.

**The Final Slide:**

Lead with what this capital will prove, not the raise amount. Investors invest in outcomes, not your need for funding.
The milestone should represent meaningful de-risking—whatever your biggest risk is today should be substantially resolved by the end of this round. That might be:

Commercial traction: "$2M ARR across 35 enterprise customers"
Technical feasibility: "Working prototype demonstrating 10x performance improvement"
Market validation: "Letters of intent from 5 of the top 20 carriers"

The implicit promise: achieving this milestone makes the next raise (at a materially higher valuation) straightforward—or, rarely, makes additional fundraising unnecessary.
For smaller raises (pre-seed, angel rounds): frame milestones as if you were raising a full seed round. The implication is that this capital gets you partway there, not that you're running a separate, smaller race.
> **Weak title:** "Raising $3M pre-seed"

> **Strong title:** "We'll reach $2M ARR across 35 enterprise customers in 12 months"

Structure:
- Title = declarative milestone statement
- Body = Explain why you can achieve that impressive milestone. You can use different proof points. One example: (1) existing traction, (2) execution readiness, (3) pipeline/momentum

**Density by stage:**
- **Seed/Early:** Most slides 10–20 words. Ceiling of ~100 for dense slides (testimonials, detailed traction). Seed decks should feel almost like sales decks—visual, punchy, easy to absorb.
- **Growth:** Most slides 20–40 words. Ceiling of ~100. More data expected, but still visual-first. Don't let "we have more to show" become "we crammed everything in."

### 4.3 Sales Deck

**Typical length:** 8–15 slides

**Structure:** Pain → Solution → Proof → Action

**The Core Shift:**

The buyer should feel: "They understand my problem better than I do. And they've solved it for people like me."

1. **Pain must feel specific and urgent.**
   - Generic pain ("teams struggle with efficiency") doesn't land
   - Specific pain ("your reps spend 2 hours daily on data entry instead of selling") creates recognition
   - Test: Would the buyer nod and say "that's exactly right"?

2. **Solution should feel like relief, not features.**
   - Don't list what the product does—show what the buyer's life looks like after
   - Lead with outcomes, not capabilities

3. **Proof must be relevant and believable.**
   - Logos matter, but only if they're peers (a startup doesn't care that you sold to IBM)
   - Metrics need context: "Reduced onboarding time by 60%" beats "Saves time"
   - Quotes should sound human, not like marketing wrote them

4. **ROI must be concrete and credible.**
   - Vague ROI ("significant savings") is ignored
   - Specific ROI ("$240K annual savings based on 20 reps × 2 hrs/day × $50/hr") is evaluated
   - If the number sounds too good, show the math

**Common failures:**
- Leading with product features instead of buyer pain
- Pain section that's generic or feels copied from competitors
- ROI claims that seem inflated with no supporting methodology
- No social proof, or proof from irrelevant customer types
- Dense slides that require reading—sales decks should be almost entirely visual
- No clear call to action or next step

**Does the deck support qualification?**

Use a MEDDIC lens when reviewing:
- **Metrics:** Does it show quantified value the buyer will care about?
- **Economic Buyer:** Is this built for the person who can say yes, or just the user/evaluator?
- **Decision Criteria:** Does it address what they're actually evaluating on?
- **Decision Process:** Does it acknowledge their timeline and process?
- **Identify Pain:** Is the pain specific and tied to business impact?
- **Champion Enablement:** Can your internal champion use this deck to sell for you when you're not in the room?

**Addressing alternatives:**
- Don't pretend competitors don't exist—sophisticated buyers are evaluating options
- Position against the status quo (doing nothing) as much as against competitors
- If you mention competitors, be factual and specific—vague FUD backfires
- Consider a "Why us vs. alternatives" backup slide for when it comes up

**Creating urgency (without being pushy):**
- What's the cost of inaction? Make it concrete.
- Is there a forcing function (contract renewal, budget cycle, regulatory deadline)?
- Frame the timeline around their goals, not your quota
- "Why now" matters for sales just as much as for fundraising

**Champion enablement:**
- Can your champion present this deck without you in the room?
- Does it answer the questions other stakeholders will ask?
- Is it simple enough that a non-expert can explain it?
- Consider: what will the CFO ask? The legal team? The IT security team? Build backup slides for these.

**Density:** Most slides 5–15 words. Ceiling of 20. If it can't be absorbed in 3 seconds while you're talking, it's too dense.

**Key test:** Does this make them want to see a demo?

### 4.4 Internal Deck

**Typical length:** 5–15 slides

**Structure:** Progress → Insights → Decisions needed

**The Core Shift:**

Internal decks exist to drive decisions, not to inform. If no decision is needed, it should be an email.

1. **Lead with what you need from the room.**
   - State the decision or input you're seeking in the first 2 slides
   - Don't make them sit through 10 slides wondering "why am I here?"

2. **Progress should be honest, not optimistic.**
   - "Green/yellow/red" status only works if yellow and red actually appear
   - Bad news delivered early is useful; bad news buried is a trust problem
   - Test: Would someone who only reads this deck have an accurate picture?

3. **Insights should be non-obvious.**
   - Don't restate what the data shows—explain what it means
   - "Revenue is up 15%" is data. "Revenue is up 15%, but entirely from one customer we're at risk of losing" is insight.

4. **Decisions needed must be specific and actionable.**
   - "We need to discuss resourcing" is not a decision
   - "We need to add 2 engineers to this project or push the launch 6 weeks" is a decision
   - Include clear options with trade-offs when possible

**Common failures:**
- Update that's purely informational with no decision point
- Burying the ask at the end instead of leading with it
- Status that's always green (signals the presenter isn't being honest)
- Insights that are just observations, not implications
- Missing context that forces executives to ask basic questions
- Too much detail—internal decks should enable discussion, not replace it

**Density:** Most slides 20–40 words. Ceiling of 80 for context-heavy slides. Denser than sales, but still built for discussion, not reading.

**Key test:** Does this deck make the decision easier to reach?

### 4.5 Customer Success Deck

**Typical length:** 8–20 slides (varies by use case: kickoff, QBR, training)

**Structure varies by purpose:**
- **Kickoff:** Goals → Plan → Milestones → How we'll work together
- **QBR:** Results → Insights → Recommendations → Next quarter priorities
- **Training:** Context → Concept → Demo/Practice → Resources

**The Core Shift:**

The customer already bought, but you're still selling—you're selling their continued belief that they made the right choice. Complacency kills retention. Keep momentum high, keep them engaged, keep them winning. The difference from sales: you prove value through their results, not your pitch.

1. **Lead with their goals, not your product.**
   - Start with what they're trying to achieve, not what you offer
   - Frame everything through their success metrics, not your usage metrics
   - Test: Could this deck work for a competitor's customer with minor edits? If yes, it's too generic.

2. **Make them feel smart, not overwhelmed.**
   - Training decks should build confidence, not showcase complexity
   - Teach them new skills tied to your unique value proposition
   - Introduce concepts progressively—don't front-load everything
   - When in doubt, cut scope. They can always learn more later.

3. **Be honest about what's working and what isn't.**
   - QBRs that only show green metrics aren't useful
   - Surface challenges early and bring recommendations, not just observations
   - Customers respect partners who tell them hard truths

4. **End with clear, achievable next steps.**
   - What should they do this week/month/quarter?
   - Who owns what?
   - Make the path forward feel manageable, not daunting

**Common failures:**
- Deck feels like a sales pitch to someone who already bought
- QBR that's just a data dump with no insight or recommendations
- Training that's comprehensive but overwhelming
- Generic content that doesn't reference their specific goals or situation
- No clear next steps or ownership

**Density:** Most slides 10–20 words. Ceiling of 80 for QBRs with detailed results. Training should be highly visual; QBRs can be slightly denser.

**Key test:** Does this make the customer feel more capable and confident than before?

---

## Phase 5: Validation Checklist

Run these checks before finalizing any deck.

**Check levels:**
- **Error** — Must fix before presenting. Will cause confusion or undermine credibility.
- **Warning** — Should fix. Won't break the deck, but weakens its impact.
- **Suggestion** — Nice to have. Polish items for when time allows.

### Structure Checks

| Check | Level |
|-------|-------|
| Executive summary within first 3 slides states main conclusion | Warning |
| Reading titles in sequence forms coherent argument | Warning (or Error if no story exists—see 2.1) |
| Final slide has clear milestones/next steps (not just "Questions?") | Warning |
| Section dividers present for decks >15 slides | Suggestion |
| No consecutive slides making essentially the same point | Warning |
| Could the deck achieve its purpose with 20–30% fewer slides? | Warning |

### Slide-Level Checks

| Check | Level |
|-------|-------|
| Word count exceeds format target (see 3.2) | Warning |
| Word count >150 in any slide | Error |
| Multiple main ideas on single slide | Warning |
| Title is <5 words or lacks a verb | Suggestion |
| Title is generic label ("Overview," "Background," "Summary") | Warning |
| Title contains hyperbolic language body doesn't support | Warning |
| This slide could be cut entirely without losing the argument (but for situation/pain slides, consider "strengthen" before "cut") | Warning |
| For live presentations: The presenter is likely to read this slide verbatim | Warning |
| For live presentations: This slide contains enough words that the audience is likely to read instead of listen to the presenter | Warning |

### Evidence Checks

| Check | Level |
|-------|-------|
| Market size claim without third-party source | Warning |
| Statistics without attribution | Warning |
| Competitive claims without evidence | Warning |
| Strong claims ("huge opportunity") with no supporting signal | Warning |

### Language Checks

| Check | Level |
|-------|-------|
| Abstract jargon without concrete explanation | Warning |
| Would never say it this way in conversation | Suggestion |
| Title emotional intensity mismatched with content | Warning |

### Flow Checks

| Check | Level |
|-------|-------|
| Consecutive slides with no logical connection and no section divider | Warning |
| No transition language in speaker notes | Suggestion |
| 3+ consecutive slides in problem section with similar framing | Warning |

---

## Phase 6: Critique Framework

When evaluating a deck, lead with overall assessment before detailing specifics.

### Assessment Levels

| Level | When to Use | Opening Language |
|-------|-------------|------------------|
| **Fundamentally sound** | Minor polish needed | "Strong foundation—a few adjustments will sharpen the impact" |
| **Significant gaps** | Core story exists but issues undermine it | "The core story is here, but structural issues are undermining it" |
| **Materially misses** | Right ingredients, wrong execution | "You have the bones of a good story, but this deck materially misses the mark" |
| **Needs rebuild** | Fundamental strategy problems | "The current approach isn't working—let's discuss strategy before rebuilding" |

### Critique Principles

1. **Lead with overall assessment.** Don't bury critical feedback.

2. **Be specific about what's wrong and why.** "This slide is confusing" is useless. "This slide uses 'orchestration layer' without explaining what it means—readers outside your company won't know if it's software, a service, or a process" is actionable.

3. **Distinguish preference from principle.** "I would have used blue" is preference. "Using red for positive metrics violates your color system from slide 3" is principle.

4. **Prioritize ruthlessly.** Identify the 3–5 issues that matter most. Save minor issues for a secondary list.

5. **Calibrate to stakes.** A $50M Series B deck needs harsher critique than an internal update.

6. **Challenge the deck's length.** Don't just evaluate whether individual slides are well-constructed—ask whether the deck itself is longer than it needs to be. Explicitly consider: could slides be combined? Cut entirely? The best decks feel slightly too short, not slightly too long.

### Example Critique Opening

> "You have the bones of a good story here, but this deck materially misses the mark. Three issues need immediate attention:
>
> 1. **The problem section is repetitive.** Slides 2–5 all say the same thing. Compress to 1–2 slides.
>
> 2. **Statistics lack sources.** Every major claim needs attribution. Right now they read as made up.
>
> 3. **Final slide is framed as an ask instead of an outcome.** Lead with what you'll achieve, not what you're raising.
>
> The traction is real and the problem is genuine. Fix the execution and this becomes compelling."

---

## Quick Reference Card

### Before Building
- [ ] Audience defined (who, what they know, what they care about)
- [ ] ONE takeaway written as single sentence
- [ ] Desired action specified
- [ ] Format determined (live / read-ahead / hybrid)
- [ ] Top 3 objections anticipated

### While Building
- [ ] Titles read as coherent argument
- [ ] Each slide = one message
- [ ] Every title is a takeaway, not a label
- [ ] Every claim has visible evidence
- [ ] Language is concrete, not abstract

### Before Finalizing
- [ ] Executive summary in first 3 slides
- [ ] Final slide has clear next steps/milestones
- [ ] Word counts within format limits
- [ ] No redundant slides
- [ ] Speaker notes include transitions
- [ ] Deck can't be meaningfully shortened (every slide earns its place)
- [ ] For live presentations: slides can be presented without reading them

### For Investor Decks
- [ ] "Why Now" explicitly answered
- [ ] "Why Us" clearly articulated
- [ ] Market sizing is bottom-up
- [ ] Final slide leads with milestones, not raise amount
- [ ] No label-only titles anywhere

### For Sales Decks
- [ ] Pain is specific to the buyer, not generic
- [ ] Solution framed as outcomes, not features
- [ ] Proof comes from relevant peers (not just big logos)
- [ ] ROI claim has visible math
- [ ] Clear call to action / next step

### For CS Decks
- [ ] Leads with their goals, not your product
- [ ] Content references their specific situation
- [ ] Honest about what's working and what isn't
- [ ] Next steps are clear, achievable, with ownership

### For Internal Decks
- [ ] Decision or input needed stated in first 2 slides
- [ ] Progress is honest (yellow/red appear when warranted)
- [ ] Insights explain implications, not just data
- [ ] Options include trade-offs

---

## Appendix A: Title Transformation Examples

| Original (Weak) | Transformed (Strong) |
|-----------------|---------------------|
| Introduction | Enterprise security teams waste 40% of time on false positives |
| Market Opportunity | The $50B security market is consolidating around AI-native solutions |
| Problem | Legacy systems force manual reconciliation of 10+ data sources daily |
| Solution | Our platform automates reconciliation, saving 15 hours per analyst per week |
| Team | Our founders built and scaled the core detection engine at [Competitor] |
| Business Model | Land-and-expand model yields 140% net revenue retention |
| Financials | We'll reach $15M ARR and profitability by Q3 2026 |
| The Ask | This round gets us to $2M ARR across 35 enterprise customers in 12 months |

**Quantitative proof isn't always available.** Here are strong titles that don't rely on numbers:

| Original (Weak) | Transformed (Strong) |
|-----------------|---------------------|
| Technology | Our architecture is the only one built for real-time processing from day one |
| Competitive Advantage | Competitors are locked into legacy codebases they can't rewrite |
| Why Now | New regulations make the old approach illegal starting January 2026 |
| Product | We're the only platform that handles both inbound and outbound in one workflow |
| Market Timing | Enterprise buyers are actively looking to replace their legacy vendors |
| Partnership | Our exclusive distribution deal with [Partner] gives us access competitors can't get |
| Defensibility | Switching costs lock in customers once they've integrated |
| Vision | We're building the system of record for [industry] operations |

---

## Appendix B: Deck Type Comparison

| Attribute | Consulting | Investor (Seed) | Investor (Growth) | Sales | CS | Internal |
|-----------|------------|-----------------|-------------------|-------|-----|----------|
| Length | 20–50+ slides | 10–15 slides | 15–25 slides | 8–15 slides | 8–20 slides | 5–15 slides |
| Typical density | 40–60 words | 10–20 words | 20–40 words | 5–15 words | 10–20 words | 20–40 words |
| Ceiling density | 120 words | 100 words | 100 words | 20 words | 80 words | 80 words |
| Evidence rigor | Very high | High (despite limited data) | Very high | Moderate | Moderate | High |
| Emotion | Moderate | High (but earned) | Moderate | High | Warm, empowering | Low |
| Key test | Can partner read exec summary and understand recommendation? | Would this get forwarded with positive note? | Do numbers tell compelling growth story? | Does this make them want a demo? | Does this make them feel capable? | Does this make the decision easier? |
