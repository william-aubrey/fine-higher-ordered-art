#!/bin/bash
# SessionEnd hook — automatically copies the raw session transcript to the project's
# system/transcripts/ directory as a JSONL file.
#
# Input (from stdin): JSON with session_id, transcript_path, cwd, hook_event_name
# Output: copies transcript to system/transcripts/ with timestamp and session ID
#
# No jq dependency — uses bash string manipulation for JSON parsing.
# Handles Windows paths (Git Bash converts automatically).

INPUT=$(cat)

# Parse JSON fields without jq — extract values between quotes after each key
extract_json_field() {
  local key="$1"
  local json="$2"
  # Match "key":"value" or "key": "value", handling escaped quotes
  echo "$json" | sed -n "s/.*\"${key}\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p"
}

TRANSCRIPT_PATH=$(extract_json_field "transcript_path" "$INPUT")
SESSION_ID=$(extract_json_field "session_id" "$INPUT")
CWD=$(extract_json_field "cwd" "$INPUT")

# Debug log (remove after confirming hook works)
DEBUG_LOG="$HOME/.claude/hooks/session-end-debug.log"
echo "$(date '+%Y-%m-%d %H:%M:%S') — SessionEnd fired" >> "$DEBUG_LOG"
echo "  transcript_path: $TRANSCRIPT_PATH" >> "$DEBUG_LOG"
echo "  session_id: $SESSION_ID" >> "$DEBUG_LOG"
echo "  cwd: $CWD" >> "$DEBUG_LOG"

# Only proceed if we have a transcript path and it exists
if [ -z "$TRANSCRIPT_PATH" ] || [ ! -f "$TRANSCRIPT_PATH" ]; then
  echo "  SKIP: transcript_path empty or file not found" >> "$DEBUG_LOG"
  exit 0
fi

# Only proceed if the project has a system/transcripts/ directory
# (indicates it follows the sprint convention)
TRANSCRIPTS_DIR="$CWD/system/transcripts"
if [ ! -d "$TRANSCRIPTS_DIR" ]; then
  echo "  SKIP: no system/transcripts/ dir at $TRANSCRIPTS_DIR" >> "$DEBUG_LOG"
  exit 0
fi

# Raw JSONLs go in system/transcripts/raw/
RAW_DIR="$TRANSCRIPTS_DIR/raw"
mkdir -p "$RAW_DIR"

# Check if a file for this session ID already exists in raw/
SHORT_ID="${SESSION_ID:0:8}"
EXISTING=$(ls "$RAW_DIR/"*"-session-${SHORT_ID}.jsonl" 2>/dev/null | head -1)

SOURCE_SIZE=$(wc -c < "$TRANSCRIPT_PATH")

if [ -n "$EXISTING" ]; then
  # Session file exists — overwrite if source is larger (session grew since last copy)
  EXISTING_SIZE=$(wc -c < "$EXISTING")
  if [ "$SOURCE_SIZE" -gt "$EXISTING_SIZE" ]; then
    cp "$TRANSCRIPT_PATH" "$EXISTING"
    echo "  UPDATED: $EXISTING (${EXISTING_SIZE}B → ${SOURCE_SIZE}B)" >> "$DEBUG_LOG"
  else
    echo "  SKIP: session $SHORT_ID already up-to-date at $EXISTING (${EXISTING_SIZE}B >= ${SOURCE_SIZE}B)" >> "$DEBUG_LOG"
  fi
else
  # New session — copy with timestamp and session ID
  TIMESTAMP=$(date +%Y-%m-%d-%H%M)
  DEST="$RAW_DIR/${TIMESTAMP}-session-${SHORT_ID}.jsonl"
  cp "$TRANSCRIPT_PATH" "$DEST"
  echo "  SUCCESS: copied to $DEST (${SOURCE_SIZE}B)" >> "$DEBUG_LOG"
fi

exit 0
