# SimConv: Practice Conversations with AI Digital Twins

A "pre-flight simulator" for high-stakes interactions. Create AI personas of people in your network, then practice pitch presentations, test email drafts, and rehearse difficult conversations before the real thing.

## The Concept

Instead of getting one shot at critical interactions, iterate infinitely with AI simulations that capture the communication style, preferences, and likely reactions of the actual person.

**Use cases:**
- Test a pitch deck on a simulated version of your VC
- Get predicted responses to a draft email from a simulated boss
- Practice a difficult conversation before having it for real
- Get feedback from a simulated customer on your product messaging

## Tech Stack

- **Framework:** Next.js 14 (App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS + shadcn/ui
- **AI:** Claude API for persona simulation
- **PDF parsing:** For deck review feature

## Features

- **Persona management** -- Create and manage AI personas with detailed profiles (communication style, known preferences, typical reactions)
- **Deck review** -- Upload a PDF pitch deck and get feedback from a simulated persona
- **Email testing** -- Paste an email draft and get a predicted response
- **Conversation mode** -- Free-form back-and-forth with a simulated persona

## How It Works

Each persona is defined by:
1. **Background:** Role, company, industry, seniority
2. **Communication style:** Direct/indirect, detail-oriented/big-picture, formal/casual
3. **Known preferences:** What they care about, what annoys them, typical questions
4. **Context:** Your relationship, recent interactions, shared history

When you interact, the system prompt instructs Claude to respond as that persona would -- using their vocabulary, applying their priorities, raising the objections they'd actually raise.

## What I Learned

- The quality of the simulation depends almost entirely on the persona definition. Vague personas ("a VC") give generic feedback. Detailed personas ("Sarah, Series A partner at Accel who focuses on enterprise SaaS and always asks about unit economics first") give useful feedback.
- Deck review is the killer feature. Uploading a PDF and getting persona-specific feedback is immediately useful.
- The "predicted email response" feature is surprisingly accurate when the persona is well-defined. People have predictable patterns in how they respond to certain types of messages.

## Status

Prototype. Built as an experiment to test the concept. The core insight -- that AI personas can provide useful rehearsal for real interactions -- holds up well in practice.
