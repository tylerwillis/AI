# Agentic Image Generation

Generate and iteratively refine images using the Gemini API -- with the AI evaluating its own output and improving the prompt before you ever see the result.

The key idea: most image generation is one-shot (prompt in, image out, hope for the best). An **agentic** approach adds a feedback loop -- the agent generates an image, *looks at it* using vision, evaluates whether it matches the intent, refines the prompt, and regenerates. By the time you see the result, it's already been through 1-2 rounds of self-improvement.

## How It Works

```
User Prompt
    │
    ▼
┌──────────────────────┐
│  Prompt Optimization  │   Enhance vague prompts with specifics
│                       │   about composition, style, lighting.
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│  Generate Image       │   Call Gemini API with optimized prompt.
│  (Gemini API)         │   Save the result.
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│  Vision Evaluation    │   Agent reads the image file and
│                       │   evaluates: Does it match intent?
│                       │   Artifacts? Text legible?
└──────────┬───────────┘
           │
      ┌────┴────┐
      │ Issues? │
      └────┬────┘
     yes   │   no
      │    │    │
      ▼    │    ▼
  Refine   │  Present
  prompt   │  to user
  & retry  │
  (up to   │
   2x)     │
           │
           ▼
┌──────────────────────┐
│  User Feedback        │   User requests changes.
│  (optional)           │   Agent adjusts prompt or edits
│                       │   the existing image. Repeat.
└──────────────────────┘
```

## API Basics

The Gemini API supports both text-to-image generation and image editing. The default model is `gemini-3-pro-image-preview`.

### Text-to-Image

```python
import os
from google import genai
from google.genai import types

client = genai.Client(api_key=os.environ["GEMINI_API_KEY"])

response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["A photorealistic mountain landscape at golden hour, 85mm lens"],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)

for part in response.parts:
    if part.text:
        print(part.text)
    elif part.inline_data:
        image = part.as_image()
        image.save("landscape.jpg")
```

### Custom Resolution & Aspect Ratio

```python
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=[prompt],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
        image_config=types.ImageConfig(
            aspect_ratio="16:9",   # Wide format
            image_size="2K"        # Higher resolution
        ),
    ),
)
```

**Available aspect ratios:** `1:1`, `2:3`, `3:2`, `3:4`, `4:3`, `4:5`, `5:4`, `9:16`, `16:9`, `21:9`

**Available resolutions:** `1K` (default, fast), `2K` (balanced), `4K` (max quality, slower)

### Image Editing

Pass an existing image along with an edit prompt:

```python
from PIL import Image

img = Image.open("input.png")
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["Add a sunset to this scene", img],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)
```

### Multi-Turn Refinement

Use a chat session for iterative editing -- the model remembers previous images:

```python
chat = client.chats.create(
    model="gemini-3-pro-image-preview",
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)

response = chat.send_message("Create a logo for 'Acme Corp'")
# Save first version...

response = chat.send_message("Make the text bolder and add a blue gradient")
# Save refined version...
```

## The Autonomous Refinement Loop

The agentic workflow structures this into two phases:

### Phase 1: Generate + Auto-Refine

1. Take the user's prompt and **enhance it** -- add specifics about composition, style, colors, lighting, and medium
2. Call the Gemini API to generate the image
3. **Read the image** using vision capabilities and evaluate:
   - Does it match the user's intent?
   - Are there obvious artifacts or distortions?
   - Is text (if requested) legible and correctly spelled?
4. If issues are found, **refine the prompt** to address them and regenerate (up to 2 passes)
5. Present the best result

### Phase 2: User-Guided Refinement

If the user wants changes after seeing the auto-refined result:

1. Gather specific feedback (what to change, whether to re-generate or edit)
2. Choose strategy: **re-prompt** (new generation) for major changes, or **edit** (pass existing image) for targeted adjustments
3. Generate, evaluate, present
4. Repeat until satisfied

The two-phase design keeps things fast -- autonomous refinement handles obvious quality issues without waiting for human input, while user-guided refinement handles subjective preferences that require human judgment.

## Prompting Tips

### Photorealistic Scenes
Include camera details: lens type, lighting, angle, mood.
> "A photorealistic close-up portrait, 85mm lens, soft golden hour light, shallow depth of field"

### Stylized Art
Specify the style explicitly:
> "A kawaii-style sticker of a happy red panda, bold outlines, cel-shading, white background"

### Text in Images
Be explicit about font style and placement:
> "Create a logo with text 'Daily Grind' in clean sans-serif, black and white, coffee bean motif"

### Product Mockups
Describe the lighting setup and surface:
> "Studio-lit product photo on polished concrete, three-point softbox setup, 45-degree angle"

### General Tips
- **Say what you want**, not what you don't want (avoid negatives)
- Be specific about the **medium**: photo, illustration, 3D render, watercolor, etc.
- Include **lighting and perspective** details when they matter
- Gemini returns JPEG by default. Use `.jpg` when saving with `image.save()`, or explicitly convert: `image.save("output.png", format="PNG")`

## Tools Used

- **[Gemini API](https://ai.google.dev/)** (`gemini-3-pro-image-preview`) -- Image generation and editing
- **[Claude Code](https://docs.anthropic.com/en/docs/claude-code)** -- Vision evaluation (reads generated images to assess quality)
- **[DeepWork](https://github.com/unsupervisedcom/deepwork)** -- Structures the generate/refine workflow with quality gates (optional)
- **Python 3** + `google-genai` + Pillow -- API client and image handling

## What Makes This Agentic

Traditional image generation is a slot machine -- you pull the lever and hope. The agentic approach changes the economics:

- **Prompt optimization** means you don't need to be an expert prompt engineer. Describe what you want in plain language and the agent fills in the technical details.
- **Self-evaluation** catches obvious issues (artifacts, wrong composition, misspelled text) before you see the result.
- **Iterative refinement** compounds improvements. Each pass builds on the previous one rather than starting from scratch.
- **The agent can see its own output.** This is the fundamental insight -- a multimodal model that generates an image and then evaluates it with vision has a feedback loop that one-shot generation lacks.
