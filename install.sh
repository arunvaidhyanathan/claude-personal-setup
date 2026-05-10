#!/bin/bash
# install.sh — Bootstrap Claude setup into ~/.claude/
# Idempotent: safe to run multiple times

set -e

SETUP_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Installing Claude setup from $SETUP_DIR..."

# 1. Global CLAUDE.md
echo "→ Installing global CLAUDE.md"
cp "$SETUP_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

# 2. Skills → ~/.claude/commands/
echo "→ Installing skills"
mkdir -p "$CLAUDE_DIR/commands"
for skill in "$SETUP_DIR/skills/"*.md; do
  name=$(basename "$skill")
  cp "$skill" "$CLAUDE_DIR/commands/$name"
  echo "  ✓ $name"
done

# 3. Hooks → ~/.claude/hooks/
echo "→ Installing hooks"
mkdir -p "$CLAUDE_DIR/hooks"
cp "$SETUP_DIR/hooks/"*.sh "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/"*.sh

# 4. Wire hooks into settings.json
echo "→ Configuring hooks in settings.json"
python3 -c "
import json, os

settings_path = os.path.expanduser('~/.claude/settings.json')
with open(settings_path) as f:
    settings = json.load(f)

hooks_dir = os.path.expanduser('~/.claude/hooks')
settings['hooks'] = {
    'PreToolUse': [
        {
            'matcher': '',
            'hooks': [
                {'type': 'command', 'command': '$hooks_dir/pre-tool-call.sh'}
            ]
        }
    ],
    'PostToolUse': [
        {
            'matcher': 'Edit|Write',
            'hooks': [
                {'type': 'command', 'command': '$hooks_dir/post-tool-call.sh'}
            ]
        }
    ]
}

with open(settings_path, 'w') as f:
    json.dump(settings, f, indent=2)

print('  ✓ settings.json updated')
"

echo ""
echo "Done! Claude setup installed."
echo "Skills available as /review, /test, /debug, /commit, /hybrid-search"
