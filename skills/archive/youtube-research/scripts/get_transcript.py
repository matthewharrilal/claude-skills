#!/usr/bin/env python3
"""
YouTube Transcript Fetcher
Extracts transcripts from YouTube videos for analysis.
"""

import sys
import re
import json
from typing import Optional

try:
    from youtube_transcript_api import YouTubeTranscriptApi
    from youtube_transcript_api.formatters import TextFormatter
except ImportError:
    print("ERROR: youtube-transcript-api not installed.")
    print("Install it with: pip install youtube-transcript-api")
    sys.exit(1)


def extract_video_id(url_or_id: str) -> str:
    """Extract video ID from various YouTube URL formats or return ID directly."""
    # Already a video ID (11 characters, alphanumeric with - and _)
    if re.match(r'^[a-zA-Z0-9_-]{11}$', url_or_id):
        return url_or_id

    # Standard YouTube URL patterns
    patterns = [
        r'(?:youtube\.com\/watch\?v=)([a-zA-Z0-9_-]{11})',
        r'(?:youtube\.com\/embed\/)([a-zA-Z0-9_-]{11})',
        r'(?:youtube\.com\/v\/)([a-zA-Z0-9_-]{11})',
        r'(?:youtu\.be\/)([a-zA-Z0-9_-]{11})',
        r'(?:youtube\.com\/shorts\/)([a-zA-Z0-9_-]{11})',
    ]

    for pattern in patterns:
        match = re.search(pattern, url_or_id)
        if match:
            return match.group(1)

    raise ValueError(f"Could not extract video ID from: {url_or_id}")


def get_transcript(url_or_id: str, language: str = 'en') -> dict:
    """
    Fetch transcript for a YouTube video.

    Args:
        url_or_id: YouTube URL or video ID
        language: Preferred language code (default: 'en')

    Returns:
        Dictionary with video_id, transcript text, and metadata
    """
    video_id = extract_video_id(url_or_id)
    ytt_api = YouTubeTranscriptApi()

    # List available transcripts
    transcript_list = ytt_api.list(video_id)

    # Try to find the requested language, fall back to auto-generated or first available
    transcript = None
    used_language = None
    is_generated = False

    try:
        # Try manual transcript first
        transcript = transcript_list.find_transcript([language])
        used_language = language
        is_generated = transcript.is_generated
    except Exception:
        try:
            # Try auto-generated
            transcript = transcript_list.find_generated_transcript([language])
            used_language = language
            is_generated = True
        except Exception:
            # Fall back to any available transcript
            for t in transcript_list:
                transcript = t
                used_language = t.language_code
                is_generated = t.is_generated
                break

    if not transcript:
        raise ValueError(f"No transcripts available for video: {video_id}")

    # Fetch and format
    fetched = transcript.fetch()
    formatter = TextFormatter()
    text = formatter.format_transcript(fetched)

    # Also get timestamped version for reference
    timestamped = []
    for entry in fetched:
        timestamped.append({
            'time': f"{int(entry.start // 60)}:{int(entry.start % 60):02d}",
            'start': entry.start,
            'duration': entry.duration,
            'text': entry.text
        })

    return {
        'video_id': video_id,
        'video_url': f'https://www.youtube.com/watch?v={video_id}',
        'language': used_language,
        'is_auto_generated': is_generated,
        'transcript_text': text,
        'timestamped': timestamped,
        'word_count': len(text.split()),
        'duration_seconds': timestamped[-1]['start'] + timestamped[-1]['duration'] if timestamped else 0
    }


def main():
    if len(sys.argv) < 2:
        print("Usage: python get_transcript.py <youtube_url_or_id> [language]")
        print("Example: python get_transcript.py https://www.youtube.com/watch?v=dQw4w9WgXcQ en")
        sys.exit(1)

    url_or_id = sys.argv[1]
    language = sys.argv[2] if len(sys.argv) > 2 else 'en'

    try:
        result = get_transcript(url_or_id, language)

        # Print summary
        print(f"=" * 60)
        print(f"VIDEO: {result['video_url']}")
        print(f"Language: {result['language']} ({'auto-generated' if result['is_auto_generated'] else 'manual'})")
        print(f"Duration: {int(result['duration_seconds'] // 60)}:{int(result['duration_seconds'] % 60):02d}")
        print(f"Word count: {result['word_count']}")
        print(f"=" * 60)
        print()
        print("TRANSCRIPT:")
        print("-" * 60)
        print(result['transcript_text'])
        print("-" * 60)

    except Exception as e:
        print(f"ERROR: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
