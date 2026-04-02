# Video to Presentation

Turn a raw screen recording into a polished HTML slide deck -- automatically.

This workflow uses the **Gemini API** to watch and analyze your video, **Claude Code** to generate the deck configuration, **ffmpeg** to extract stills and sped-up clips, and **Slidev** to render the final HTML presentation. The whole pipeline runs from your terminal.

## The Pipeline

```
Raw Video
    │
    ▼
┌─────────────────────┐
│  Gemini Video        │   Upload video to Gemini API.
│  Analysis            │   3-round chat extracts timestamped
│                      │   observations: commands, visual
│  (analyze_video.py)  │   changes, and deep topical breakdown.
└─────────┬───────────┘
          │  video_analysis.md
          ▼
┌─────────────────────┐
│  Deck Configuration  │   Claude Code (or you) reads the
│                      │   analysis and writes a YAML config
│  (config.yaml)       │   defining timestamps, clips, and
│                      │   narrative slides.
└─────────┬───────────┘
          │  config.yaml
          ▼
┌─────────────────────┐
│  Video Extraction    │   ffmpeg extracts JPG stills at each
│                      │   timestamp and MP4 clips (sped up)
│  (convert.py)        │   between timestamps.
└─────────┬───────────┘
          │  stills/ + clips/ + slides.md
          ▼
┌─────────────────────┐
│  HTML Rendering      │   Slidev CLI compiles slides.md into
│                      │   a single-file HTML deck with custom
│  (slidev cli.js)     │   themes and layouts.
└─────────────────────┘
          │
          ▼
      slides.html
```

## Step 1: Analyze the Video with Gemini

The hardest part of making a presentation from a demo video is figuring out *which moments matter*. The `analyze_video.py` script solves this by uploading your video to Gemini and running three focused analysis rounds in a single multi-turn chat session:

**Round 1 -- Commands & Output:**
> "Give me a timestamped list of every command run as well as every response given, just what is the state of everything that's happening inside of this demo video? I'm trying to prepare a list of timestamps that might be good to call out for different parts of a demo."

**Round 2 -- Visual Changes:**
> "Also give me timestamps when what's showing changes (like when something is opened in the browser) -- and note what it's showing."

**Round 3 -- Deep Topical Breakdown:**
> "Explain what each part of that process is showing so that we have enough information to select the best clips to highlight for the demo. Get into the logic that the agent was executing, what it's doing, why it did that, what's unique about it. Really go deep on what each key step in this process is telling us."

You can also pass a **meeting transcript** or planning notes as supplementary context. The script appends this to the Round 1 prompt so Gemini understands what you're trying to demonstrate.

### Usage

```bash
# Set your Gemini API key
echo 'GEMINI_API_KEY=your-key' > .env

# Analyze a video
python3 analyze_video.py /path/to/recording.mp4 -o my-deck/video_analysis.md

# With supplementary context
python3 analyze_video.py /path/to/recording.mp4 --context transcript.txt -o my-deck/video_analysis.md
```

The output is a freeform markdown file (`video_analysis.md`) with timestamped observations across all three rounds. This replaces manually scrubbing through the video to find key moments.

**Model:** `gemini-3.1-pro-preview` (or later). Requires `google-genai` and `python-dotenv` Python packages.

## Step 2: Create the Deck Config

The YAML config is the control surface for the entire deck. It defines the video source, timestamps, clips, and all narrative slides. Here's the structure:

```yaml
video: /path/to/recording.mp4
theme: purple                # Slidev theme (purple or newspaper)
title: "My Presentation"
subtitle: "Subtitle here"
clip_target_duration: 30     # Target seconds for sped-up clips
crf: 23                      # Video quality (lower = better, 18-28)
auto_clips: false            # Auto-generate clips between every still pair

# Narrative slides BEFORE the demo
pre_slides:
  - title: "The Problem"
    layout: statement
    body: "Statement text with **markdown** support."
    note: "Speaker notes go here."

# Demo section: stills, clips, and inline narrative slides
timestamps:
  - at: "00:03"
    filename: 01-prompt
    step: "Step 1 · Prompt"
    title: "The starting point"
    bullets:
      - "What's happening at this moment"

  - clip:
      filename: analysis
      title: "Analysis in progress"
      speed: 25
      start: "00:10"
      end: "04:20"
      step: "Step 2 · Analysis"

  - at: "04:28"
    filename: 02-results
    step: "Step 2 · Analysis"
    title: "Results appear"

  - slide:
      title: "Key insight"
      layout: fact

# Narrative slides AFTER the demo
post_slides:
  - title: "Key takeaway"
    layout: fact
    body: "A single powerful statement."
  - title: "Thank You"
    layout: cover
```

### Entry types

| Type | What it does |
|------|-------------|
| `at:` | Extracts a JPG still frame at the timestamp. Renders a `demo` layout slide. |
| `clip:` | Extracts a sped-up video segment. Speed is auto-calculated from `clip_target_duration` or set explicitly. |
| `slide:` | A narrative slide inserted within the demo section. Supports any layout. |

### Available layouts

| Layout | Use for |
|--------|---------|
| `cover` | Title and closing slides (dark background) |
| `statement` | Bold claims with supporting text |
| `fact` | Single big stat or statement (centered) |
| `section` | Transition/divider slides |
| `demo` | Stills and clips with caption panel (auto-generated) |
| `two-cols` | Side-by-side content |
| `quote` | Blockquotes |

### How to create the config

If you have a `video_analysis.md` from Step 1, feed it to Claude Code and ask it to write the config. The analysis has everything needed: timestamped moments, visual state changes, and deep context about what each section demonstrates.

This step can also be automated with a [DeepWork](https://github.com/unsupervisedcom/deepwork) job that structures the process: extract candidate stills, select hero moments, write the config with pre/post narrative slides and speaker notes, then run the converter.

## Step 3: Build the Deck

The converter script (`convert.py`) does two things:
1. **Extracts assets** -- JPG stills at each `at:` timestamp and sped-up MP4 clips for each `clip:` entry
2. **Generates `slides.md`** -- Slidev markdown with the correct layouts, media embeds, and speaker notes

Then the Slidev CLI compiles `slides.md` into a single-file `slides.html`.

```bash
# Full pipeline: extract assets + generate slides + build HTML
make build CONFIG=my-deck/config.yaml OUT=my-deck

# Or step by step:
python3 convert.py my-deck/config.yaml -o my-deck           # Extract + generate slides.md
node slidev/cli.js my-deck/slides.md -o my-deck/slides.html  # Render HTML
```

The output directory structure:

```
my-deck/
  config.yaml
  slides.md           # Generated Slidev markdown
  slides.html         # Final HTML presentation
  public/
    stills/           # Extracted JPG frames
    clips/            # Sped-up MP4 segments
```

## Step 4: Review and Iterate

The fastest iteration loop is editing slide content without re-extracting video:

```bash
# Regenerate slides.md + HTML without re-running ffmpeg
make slides CONFIG=my-deck/config.yaml OUT=my-deck

# Re-extract just one still at a different timestamp
ffmpeg -ss 00:12:48 -i video.mp4 -frames:v 1 -q:v 2 my-deck/public/stills/error.jpg

# Rebuild HTML only (slides.md already exists)
make html OUT=my-deck

# Serve locally for review
make serve OUT=my-deck  # http://localhost:8848
```

The key insight: `--skip-extract` (used by `make slides`) skips the ffmpeg step entirely. You can edit the YAML config -- changing titles, bullets, speaker notes, adding/removing narrative slides -- and rebuild in seconds.

## Tools Used

- **[Claude Code](https://docs.anthropic.com/en/docs/claude-code)** -- Writes the YAML config from the video analysis, iterates on slide content
- **[DeepWork](https://github.com/unsupervisedcom/deepwork)** -- Structures the multi-step workflow with quality gates (optional but recommended)
- **[Gemini API](https://ai.google.dev/)** -- Watches the video and produces timestamped analysis
- **[ffmpeg](https://ffmpeg.org/)** -- Extracts still frames and sped-up video clips
- **[Slidev](https://sli.dev/)** -- Renders markdown slides into HTML presentations
- **Python 3** + PyYAML -- Converter script and video analysis script

## What Makes This Work

The traditional approach to making a presentation from a demo video is painful: manually scrub through the recording, take notes on what happens when, decide which moments to highlight, take screenshots, edit clips, arrange slides. It's hours of tedious work.

This pipeline replaces the tedious parts:

- **Gemini sees the video** so you don't have to manually scrub. It watches the full recording and produces timestamped observations with context about what's happening and why it matters.
- **Claude Code writes the config** from the analysis. It understands the YAML format and can make editorial decisions about which moments to highlight, what the narrative arc should be, and what speaker notes to include.
- **ffmpeg does the mechanical extraction** -- pulling frames and clips at exact timestamps with precise speed control.
- **Slidev renders it all** into a clean, presentable HTML deck with custom themes.

The human stays in the loop for editorial judgment (which moments matter most, what story to tell) while the AI handles the mechanical work (watching the video, writing the config, extracting assets, rendering slides).
