#!/usr/bin/env bash
# collect_metadata.sh — Collect structured metadata from experiment directories
# for the content_publisher discover step.
#
# Usage: ./collect_metadata.sh [--since TIMESTAMP] [--output FILE] [BASE_DIR]
#
# Options:
#   --since TIMESTAMP   Only scan directories modified after this ISO date (e.g. 2026-03-15)
#   --output FILE       Write output to FILE (default: stdout)
#   BASE_DIR            Directory to scan (default: [BASE_DIR])
#
# Output: Markdown-formatted metadata for each directory, suitable for AI analysis.

set -uo pipefail
# Note: intentionally NOT using set -e. Many commands (ls, compgen, find, git)
# return non-zero in empty or non-git directories, which would kill the script.

SINCE=""
OUTPUT=""
BASE_DIR="$HOME/experiments"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --since) SINCE="$2"; shift 2 ;;
    --output) OUTPUT="$2"; shift 2 ;;
    *) BASE_DIR="$1"; shift ;;
  esac
done

# Skip patterns: backups, copies, zips, non-project dirs
# Only skip true noise: backups, copies, zips, and empty/artifact dirs.
# Company-specific work dirs are included — patterns can be anonymized in the draft step.
SKIP_PATTERNS="bkup|backup| copy [0-9]$|\.zip$|^dumb test$|^slides\.md$"

# Collect output
collect() {
  echo "# Directory Metadata Collection"
  echo ""
  echo "Scanned: $BASE_DIR"
  echo "Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  [ -n "$SINCE" ] && echo "Since: $SINCE"
  echo ""
  echo "---"
  echo ""

  local count=0
  local scanned=0

  for dir in "$BASE_DIR"/*/; do
    [ ! -d "$dir" ] && continue
    dirname=$(basename "$dir")

    # Skip matching patterns
    if echo "$dirname" | grep -qEi "$SKIP_PATTERNS"; then
      continue
    fi

    # Freshness filter: skip if not modified since timestamp
    if [ -n "$SINCE" ]; then
      # Check git log first (more accurate for content changes)
      latest_git=""
      if [ -d "$dir/.git" ]; then
        latest_git=$(cd "$dir" && git log -1 --format=%aI 2>/dev/null || true)
      fi

      # Fall back to filesystem mtime
      latest_fs=$(find "$dir" -maxdepth 2 -type f \
        ! -path "*/node_modules/*" ! -path "*/.git/*" ! -path "*/venv/*" \
        ! -path "*/__pycache__/*" ! -path "*/build/*" ! -path "*/dist/*" \
        -newer "$BASE_DIR" -print -quit 2>/dev/null || true)

      # Use stat to get directory mtime
      if [[ "$OSTYPE" == "darwin"* ]]; then
        dir_mtime=$(stat -f %Sm -t %Y-%m-%dT%H:%M:%S "$dir" 2>/dev/null || echo "")
      else
        dir_mtime=$(stat -c %y "$dir" 2>/dev/null | cut -d' ' -f1 || echo "")
      fi

      # Compare dates — if we have a git date, use it; else use mtime
      check_date="${latest_git:-$dir_mtime}"
      if [ -n "$check_date" ] && [[ "$check_date" < "$SINCE" ]]; then
        # Check if any file was modified recently
        recent_file=$(find "$dir" -maxdepth 3 -type f -newer /dev/stdin \
          ! -path "*/node_modules/*" ! -path "*/.git/*" ! -path "*/venv/*" \
          -print -quit 2>/dev/null <<< "" || true)
        if [ -z "$recent_file" ] && [ -z "$latest_fs" ]; then
          continue
        fi
      fi
    fi

    scanned=$((scanned + 1))

    echo "## $dirname"
    echo ""
    echo "**Path:** $dir"
    echo ""

    # README excerpt
    for readme in README.md readme.md; do
      if [ -f "$dir/$readme" ]; then
        echo "**README (first 20 lines):**"
        echo '```'
        head -20 "$dir/$readme" 2>/dev/null
        echo '```'
        echo ""
        break
      fi
    done

    # Project plan excerpt
    if [ -f "$dir/project-plan.md" ]; then
      echo "**project-plan.md (first 20 lines):**"
      echo '```'
      head -20 "$dir/project-plan.md" 2>/dev/null
      echo '```'
      echo ""
    fi

    # CLAUDE.md excerpt
    if [ -f "$dir/CLAUDE.md" ]; then
      echo "**CLAUDE.md (first 15 lines):**"
      echo '```'
      head -15 "$dir/CLAUDE.md" 2>/dev/null
      echo '```'
      echo ""
    fi

    # AGENTS.md excerpt
    if [ -f "$dir/AGENTS.md" ]; then
      echo "**AGENTS.md (first 15 lines):**"
      echo '```'
      head -15 "$dir/AGENTS.md" 2>/dev/null
      echo '```'
      echo ""
    fi

    # DeepWork jobs
    if [ -d "$dir/.deepwork/jobs" ]; then
      echo "**DeepWork jobs:**"
      for job_dir in "$dir/.deepwork/jobs"/*/; do
        [ -d "$job_dir" ] && echo "- $(basename "$job_dir")"
      done
      echo ""
    fi

    # Key files (scripts, Makefiles, etc.)
    echo "**Key files:**"
    for f in Makefile makefile *.py *.sh *.rb *.ts *.js; do
      if compgen -G "$dir/$f" > /dev/null 2>&1; then
        ls -1 "$dir"/$f 2>/dev/null | while read -r fp; do
          echo "- $(basename "$fp")"
        done
      fi
    done
    echo ""

    # Top-level structure
    echo "**Structure (top-level):**"
    ls -1 "$dir" 2>/dev/null | grep -v node_modules | grep -v venv | grep -v __pycache__ | grep -v .git | head -15
    echo ""

    # Git log
    if [ -d "$dir/.git" ]; then
      echo "**Git log (last 10):**"
      echo '```'
      (cd "$dir" && git log --oneline -10 2>/dev/null) || echo "(no git history)"
      echo '```'
      echo ""
    fi

    # Interesting markdown files (potential prompts)
    md_files=$(find "$dir" -maxdepth 1 -name "*.md" ! -name "README.md" ! -name "readme.md" \
      ! -name "project-plan.md" ! -name "project-log.md" ! -name "CLAUDE.md" ! -name "AGENTS.md" \
      ! -name "CHANGELOG.md" ! -name "CONTRIBUTING.md" 2>/dev/null | head -5)
    if [ -n "$md_files" ]; then
      echo "**Other markdown files:**"
      echo "$md_files" | while read -r f; do
        echo "- $(basename "$f"): $(head -1 "$f" 2>/dev/null | sed 's/^#* *//')"
      done
      echo ""
    fi

    echo "---"
    echo ""
    count=$((count + 1))
  done

  echo ""
  echo "**Total directories scanned: $scanned**"
}

# Settings and environment scan
scan_settings() {
  echo ""
  echo "# Settings and Environment"
  echo ""

  # Claude settings
  if [ -f "$HOME/.claude/settings.json" ]; then
    echo "## Claude Settings"
    echo '```json'
    cat "$HOME/.claude/settings.json" 2>/dev/null | head -50
    echo '```'
    echo ""
  fi

  # Global CLAUDE.md
  if [ -f "$HOME/.claude/CLAUDE.md" ]; then
    echo "## Global CLAUDE.md"
    echo '```'
    head -30 "$HOME/.claude/CLAUDE.md" 2>/dev/null
    echo '```'
    echo ""
  fi

  # Plugins
  echo "## Installed Plugins"
  if [ -d "$HOME/.claude/plugins" ]; then
    find "$HOME/.claude/plugins" -maxdepth 3 -name "SKILL.md" -o -name "package.json" 2>/dev/null | head -20
  fi
  echo ""

  # DeepWork jobs across all directories
  echo "## DeepWork Jobs (all locations)"
  find "$BASE_DIR" -maxdepth 3 -path "*/.deepwork/jobs/*/job.yml" 2>/dev/null | while read -r f; do
    echo "- $f"
  done
  echo ""

  # Memory files
  echo "## Memory Files"
  find "$HOME/.claude/projects" -maxdepth 3 -name "*.md" -path "*/memory/*" 2>/dev/null | head -20
  echo ""
}

# Main
if [ -n "$OUTPUT" ]; then
  { collect; scan_settings; } > "$OUTPUT"
  echo "Metadata written to $OUTPUT" >&2
else
  collect
  scan_settings
fi
