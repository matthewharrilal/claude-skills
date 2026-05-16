---
name: youtube-research
description: Fetch YouTube video transcripts and perform deep research analysis. Use when the user provides a YouTube URL or video ID and wants to understand the content, find similar videos, extract key concepts, or get recommendations based on video content. Also use when the user asks to analyze, summarize, or research a YouTube video.
---

# YouTube Research Skill

Fetches transcripts from YouTube videos and performs deep research analysis on the content.

## Prerequisites

Requires the `youtube-transcript-api` Python package:
```bash
pip install youtube-transcript-api
```

## Instructions

When the user provides a YouTube URL or video ID:

### Step 1: Extract the Transcript

Run the transcript fetcher script:
```bash
python3 ~/.claude/skills/youtube-research/scripts/get_transcript.py "<youtube_url_or_video_id>"
```

Supported URL formats:
- `https://www.youtube.com/watch?v=VIDEO_ID`
- `https://youtu.be/VIDEO_ID`
- `https://www.youtube.com/embed/VIDEO_ID`
- `https://www.youtube.com/shorts/VIDEO_ID`
- Just the video ID directly (11 characters)

### Step 2: Analyze the Content

After fetching the transcript, analyze it for:

1. **Main Topics & Themes**
   - What is the video primarily about?
   - What key concepts are introduced?
   - What problems or use cases are discussed?

2. **Tools, Frameworks & Technologies**
   - List all tools, libraries, platforms mentioned
   - Note any specific versions or requirements
   - Identify the tech stack being used

3. **Actionable Insights**
   - What can the viewer build or implement?
   - What workflows or processes are demonstrated?
   - What are the key takeaways?

4. **Speaker/Creator Context**
   - Who is presenting (if identifiable)?
   - What is their expertise or background?
   - What channel or brand is this from?

### Step 3: Find Similar Content

Use web search to find:
- Other videos by the same creator on related topics
- Videos from other creators covering similar concepts
- Blog posts, tutorials, or documentation related to the topics
- GitHub repos or tools mentioned in the video

### Step 4: Generate Recommendations

Based on the analysis, provide:
- **Related videos** - Similar content to explore
- **Project ideas** - Things the user could build based on the concepts
- **Learning path** - Suggested next steps for going deeper
- **Resources** - Links to documentation, courses, or communities

## Output Format

Structure the research output as:

```markdown
## Video Summary
[Brief 2-3 sentence summary]

## Key Topics
- Topic 1
- Topic 2
- ...

## Tools & Technologies Mentioned
| Tool | Purpose | Link |
|------|---------|------|
| ... | ... | ... |

## Main Takeaways
1. ...
2. ...
3. ...

## Similar Videos & Content
- [Video/Article Title](URL) - Brief description
- ...

## What You Could Build
- Project idea 1
- Project idea 2
- ...

## Recommended Next Steps
1. ...
2. ...
```

## Example Usage

User: "Research this video: https://www.youtube.com/watch?v=abc123xyz"

1. Run: `python3 ~/.claude/skills/youtube-research/scripts/get_transcript.py "https://www.youtube.com/watch?v=abc123xyz"`
2. Read and analyze the transcript
3. Search for related content
4. Provide structured analysis with recommendations

## Troubleshooting

- **No transcript available**: Some videos don't have captions. Suggest the user try a different video or look for a written summary.
- **Package not installed**: Run `pip install youtube-transcript-api`
- **Video unavailable**: The video may be private, deleted, or region-locked.
