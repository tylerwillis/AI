# AutoGate: Dynamic Permission Management for Claude Code

AutoGate replaces Claude Code's binary approve/deny model with a three-mode permission system you can toggle mid-session. The key innovation: using a separate Opus API call to screen tool calls for safety, so you get autonomy without blindly approving destructive operations.

## How It Works

```
Permission Request
       |
       v
+------------------+     YES
| Read-only tool   |----------> Auto-approve (instant, no API call)
| or safe bash cmd?|
+--------+---------+
         | NO
         v
+------------------+     OFF
| Mode?            |----------> Fall through to manual approval prompt
|                  |
|                  |     YOLO
|                  |----------> Auto-approve (instant, no API call)
+--------+---------+
         | ON
         v
+------------------+   APPROVE
| Opus safety      |----------> Allow
| screening        |
+--------+---------+
         | DENY
         v
      Block (cached for 60s to prevent retries)
```

**Three modes** (cycle with keyboard shortcut):
- **off** -- Normal Claude Code behavior. You approve each action manually.
- **on** -- Opus screens every non-read tool call (~2s latency). Safe but slower.
- **yolo** -- Everything auto-approved instantly. Like `--dangerously-skip-permissions` but toggleable mid-session.

## What's Always Auto-Approved

Regardless of mode, these never need screening:

**Read-only tools:** Read, Glob, Grep, WebSearch, WebFetch, TaskList, TaskGet, TaskOutput, TaskCreate, TaskUpdate, ListMcpResourcesTool, ReadMcpResourceTool, Skill, ToolSearch

**Safe bash commands:** `ls`, `cat`, `head`, `tail`, `wc`, `file`, `stat`, `du`, `df`, `pwd`, `which`, `whoami`, `date`, `uname`, `hostname`, `id`, `realpath`, `dirname`, `basename`, `echo`, `printf`, `rg`, `tree`, `diff`, `md5sum`, `shasum`

**Safe git subcommands:** `git status`, `git log`, `git diff`, `git show`, `git blame`, `git rev-parse`, `git describe`, `git ls-files`, `git ls-tree`, `git cat-file`, `git shortlog`

**Shell metacharacter guard:** Bash commands are only auto-approved when they contain no shell metacharacters (`;`, `|`, `&`, `` ` ``, `>`, `<`, `$(`, newlines). This prevents chained or redirected commands from slipping through.

## Setup

### 1. Create the Python virtual environment

```bash
python3 -m venv ~/.claude/permission-gate-venv
~/.claude/permission-gate-venv/bin/pip install anthropic
```

### 2. Get the permission gate script

The script is open source: [github.com/tylerwillis/--safely-skip-permissions](https://github.com/tylerwillis/--safely-skip-permissions)

Clone it or copy the script to `~/.claude/safely-approve-permissions.py`.

### 3. Configure the hook in settings.json

Add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/permission-gate-venv/bin/python3 ~/.claude/safely-approve-permissions.py"
          }
        ]
      }
    ]
  }
}
```

### 4. Set up mode toggling

Create a mode file and bind a keyboard shortcut to cycle through modes:

```bash
echo "off" > ~/.claude/autogate
```

The script reads from `~/.claude/autogate` on each permission request. Set up your preferred method to cycle the file contents between `off`, `on`, and `yolo`.

## What Makes This Work

The Opus safety screening is the interesting part. When a tool call comes in and the mode is `on`, the script:

1. Reads the tool call details from stdin (JSON)
2. Sends them to a separate Opus API call with a safety prompt
3. Opus evaluates whether the operation is dangerous
4. If approved, the script returns an allow response
5. If denied, the response is cached for 60 seconds to prevent Claude from retrying the same denied operation

This costs about $0.01-0.02 per screening call and adds ~2s latency. In practice, most sessions need 10-20 screenings, so the cost is negligible.

## Status Line Integration

I show the current AutoGate mode in my Claude Code status line. Add to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "/bin/bash ~/.claude/statusline-command.sh"
  }
}
```

The status line script reads the autogate mode file and displays it with color coding:

- **AG:off** (grey) -- Manual mode
- **AG:on** (green) -- Opus screening active
- **AG:yolo** (yellow) -- Full auto-approve

Along with the current directory, git branch, and context window remaining percentage.

## AutoGate vs. Claude Code Auto Mode

Anthropic has since shipped a native version of this concept: [Claude Code Auto Mode](https://www.anthropic.com/engineering/claude-code-auto-mode). If you're starting fresh, **try the built-in auto mode first** -- it's simpler to set up and maintained by the Claude Code team.

Reasons you might prefer AutoGate:

- **Model control:** AutoGate uses Opus for screening. I tested Haiku and Sonnet (as of Claude 4.5) but found too many formatting errors and incorrect approvals. Opus's judgment was significantly more reliable. Claude Code's built-in auto mode may use a different screening approach -- I haven't tested whether it's better or worse.
- **Custom allow-lists:** AutoGate lets you define exactly which tools and bash commands are auto-approved. The built-in mode may be more or less permissive than you want.
- **Status line integration:** AutoGate's mode is visible in the terminal status line at all times.
- **Three discrete modes:** The off/on/yolo toggle gives you explicit control. The built-in mode may have different granularity.

I built AutoGate before the native version existed and haven't fully compared the two. If the built-in mode works well for you, use it -- less moving parts is always better.

## Why I Built This

Claude Code's original permission model was binary: approve everything manually, or skip all permissions. Neither worked well for long-running sessions. Manual approval breaks flow every few seconds. Skipping permissions means you can't look away from the terminal.

AutoGate gave me a middle ground: let Opus handle the judgment calls. The AI-supervising-AI pattern sounds meta, but it solves a real problem -- you get autonomy without risk, at the cost of ~2s per write operation.
