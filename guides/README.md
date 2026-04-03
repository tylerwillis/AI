# Guides

Step-by-step workflows for AI-assisted content creation.

## [Video to Presentation](video-to-presentation/)

Turn a raw screen recording into a polished HTML slide deck. Uses Gemini API to analyze video content, Claude Code to generate the deck config, and ffmpeg + Slidev to build the final output.

## [Image Generation](image-generation/)

Generate and iteratively refine images using the Gemini API with vision-based self-evaluation. The agent sees its own output and improves the prompt autonomously before asking for human feedback.

## [AutoGate](autogate/)

Dynamic permission management for Claude Code. Three-mode system (manual, Opus safety screening, full auto-approve) toggleable mid-session. Uses AI-supervising-AI to screen tool calls for safety.

## [Building a TIL with Claude Code](til/)

A personal "Today I Learned" knowledge base powered by Claude Code. Capture discoveries during sessions, auto-index with GitHub Actions, and build a searchable archive of things you've learned.

## [Claude Code Power User Setup](power-user-setup/)

How to configure Claude Code for serious daily use -- permission hooks, custom status line, plugins, context repos, fuzzy context engineering, scheduled automation, and the working patterns that make it productive.
