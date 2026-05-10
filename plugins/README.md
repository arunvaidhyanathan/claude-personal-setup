# Plugins — Distribution

Bundle the Claude setup for team distribution.
Each plugin is a self-contained install that gives a teammate the same skills, hooks, and agents.

## Structure
```
plugins/
└── [plugin-name]/
    ├── install.sh       ← idempotent install script
    ├── skills/          ← skill files to copy
    ├── hooks/           ← hook scripts to copy
    └── CLAUDE.md        ← project-specific rules
```

## Usage
```bash
./plugins/[plugin-name]/install.sh
```
