#!/bin/bash
# Pre-tool-call hook: blocks dangerous commands
# Called by Claude Code before every Bash tool execution
# Input: JSON via stdin with tool name and command

INPUT=$(cat)
TOOL=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null)
COMMAND=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('command',''))" 2>/dev/null)

if [ "$TOOL" = "Bash" ]; then
  # Block destructive git operations
  if echo "$COMMAND" | grep -qE "git push --force|git push -f|git reset --hard|git clean -f"; then
    echo "BLOCKED: Destructive git command requires explicit user confirmation" >&2
    exit 2
  fi

  # Block dangerous filesystem ops
  if echo "$COMMAND" | grep -qE "rm -rf /|rm -rf ~|chmod -R 777"; then
    echo "BLOCKED: Dangerous filesystem operation" >&2
    exit 2
  fi

  # Block credential exposure
  if echo "$COMMAND" | grep -qE "cat.*\.env|echo.*password|echo.*secret|echo.*token"; then
    echo "BLOCKED: Potential credential exposure" >&2
    exit 2
  fi
fi

exit 0
