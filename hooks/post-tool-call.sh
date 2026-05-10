#!/bin/bash
# Post-tool-call hook: auto-lint after file edits
# Called by Claude Code after every tool execution

INPUT=$(cat)
TOOL=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null)
FILE=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null)

if [ "$TOOL" = "Edit" ] || [ "$TOOL" = "Write" ]; then
  # Java: checkstyle hint (non-blocking)
  if echo "$FILE" | grep -q "\.java$"; then
    if command -v mvn &>/dev/null && [ -f "pom.xml" ]; then
      echo "[hook] Java file edited: $FILE — run 'mvn checkstyle:check' to lint" >&2
    fi
  fi

  # Python: ruff lint (non-blocking)
  if echo "$FILE" | grep -q "\.py$"; then
    if command -v ruff &>/dev/null; then
      ruff check "$FILE" --quiet 2>&1 | head -20 >&2 || true
    fi
  fi
fi

exit 0
