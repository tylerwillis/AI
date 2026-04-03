# Building a TIL (Today I Learned) with Claude Code

A personal knowledge base for capturing things you learn day-to-day, inspired by [Simon Willison's TIL](https://til.simonwillison.net). Tell Claude what you learned and it handles the rest -- creates the file, commits, pushes, and a GitHub Action updates the README index.

## The Key Insight

Most learning happens *during* Claude Code sessions -- you discover something unexpected while debugging, researching, or building. The pattern isn't "tell Claude 'I learned this, make a TIL.'" It's: **when you come across something new in the course of your work, tell Claude to fire up a sub-agent to document it as a TIL.** The learning and the documentation happen in the same session, while the context is fresh.

## The Workflow

```
You're working in Claude Code and discover something unexpected
                    |
                    v
"That's interesting -- write a TIL about that"
                    |
                    v
Claude launches a sub-agent that creates:
claude/cowork-runs-a-linux-vm.md
                    |
                    v
Review the TIL before it ships -- correct subtle
errors while the example is fresh in your mind
                    |
                    v
Commits + pushes to GitHub
                    |
                    v
GitHub Action updates README.md
with the new entry indexed by topic
```

## Setup

### 1. Create the repository structure

```
til/
  README.md          # Auto-generated index (don't edit manually)
  build/
    update_readme.py # GitHub Action script
  .github/
    workflows/
      build.yml      # Auto-index on push
```

### 2. Add the GitHub Action

`.github/workflows/build.yml`:

```yaml
name: Build README
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - name: Update README
        run: python build/update_readme.py
      - name: Commit and push
        run: |
          git config user.name "GitHub Actions"
          git config user.email "actions@github.com"
          git diff --quiet README.md || (git add README.md && git commit -m "Update README index" && git push)
```

### 3. Create the index builder

`build/update_readme.py` scans for all `.md` files in topic directories, extracts titles and dates from git history, and generates a grouped index in the README.

### 4. (Optional) Add a DeepWork job

For a structured workflow with quality checks, create a `til_create` DeepWork job that:
1. Takes the topic and what you learned as input
2. Determines the right topic folder and slug
3. Writes the markdown file with proper formatting
4. Commits and pushes

## Writing a TIL

Each TIL is a markdown file in a topic folder:

```
{topic}/{slug}.md
```

Start with a `# Title` heading, then write the content. Keep it concise -- a TIL is a "here's what I found out" note, not a tutorial.

### Example: `claude/permission-hooks-as-ai-security-gate.md`

```markdown
# Claude Code permission hooks can route to other models as a security gate

Claude Code's `PermissionRequest` hook receives tool call details as JSON on stdin.
You can pipe this to any program -- including another LLM call.

I built a Python script that sends each non-read tool call to Opus for safety
screening. Opus evaluates whether the operation is dangerous and returns
approve/deny. Denied responses are cached for 60 seconds.

Three modes, toggled mid-session: off (manual), on (Opus screens), yolo (auto-approve).

The cost is ~$0.01-0.02 per screening call. Most sessions need 10-20 screenings.
```

### Example: `macos/lunar-cgeventtap-leak.md`

```markdown
# Lunar.app leaks CGEventTaps and causes crippling macOS input lag

Lunar (the monitor brightness app) registers CGEventTaps to intercept keyboard
events for its hotkeys. Under certain conditions, it leaks these event taps --
registering new ones without releasing old ones.

Each leaked tap adds latency to every keyboard and mouse event system-wide.
After a few hours, input lag becomes unusable (200-500ms per keystroke).

Fix: Quit Lunar. If that doesn't help immediately, check with:
`ioreg -l | grep -c "IOHIDEventTap"` (should be < 10, was > 200 when bugged).
```

## What Makes This Work

- **Capture at the moment of discovery:** The best TILs come from in-session surprises. You're already in Claude Code, the context is loaded, the example is right there. A sub-agent documents it without interrupting your main work.
- **Review before publishing:** Always read the TIL before it ships. Claude will get the gist right but may miss a subtle technical detail. Correct it while the example is fresh -- if you wait a week, you won't remember the nuance.
- **Zero friction:** Claude handles file creation, topic routing, formatting, git operations.
- **Auto-indexing:** The README stays current without manual maintenance. New entries appear automatically after push.
- **Topic organization:** Topics emerge naturally as you add entries. No need to predefine categories.
- **Git history as metadata:** Dates come from git commits, not frontmatter. One less thing to manage.

## My TIL

My TIL lives at [github.com/tylerwillis/til](https://github.com/tylerwillis/til) with entries on Claude Code, macOS quirks, and more.
