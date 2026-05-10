# Corporate Claude Setup — Manual Install Guide

No bash, no curl, no MCP required. All steps are copy-paste.

---

## Step 1 — Global CLAUDE.md

Copy `global-CLAUDE.md` to:
```
~/.claude/CLAUDE.md
```

If `~/.claude/` doesn't exist, create the folder manually in Finder.

---

## Step 2 — Skills (Custom Commands)

Create the folder:
```
~/.claude/commands/
```

Copy every file from `commands/` into it:
```
~/.claude/commands/review.md
~/.claude/commands/test.md
~/.claude/commands/debug.md
~/.claude/commands/commit.md
~/.claude/commands/graphify.md
```

These become slash commands: `/review`, `/test`, `/debug`, `/commit`, `/graphify`

---

## Step 3 — Settings

Copy `settings.json` to:
```
~/.claude/settings.json
```

If the file already exists, merge the contents manually — do not overwrite.

---

## Step 4 — Per-Microservice Setup

For each of your 9 microservices, copy `project-CLAUDE.md` into the repo root
and rename it `CLAUDE.md`. Edit the top section to match the service name and stack.

```
[microservice-repo]/
└── CLAUDE.md   ← copied from project-CLAUDE.md, edited per service
```

---

## Step 5 — Graphify Each Microservice

Open Claude Code in the microservice folder and run:
```
/graphify .
```

Claude builds the knowledge graph using its own file-reading tools.
Outputs:
- `graphify-out/GRAPH_REPORT.md` — Claude reads this automatically next session
- `graphify-out/[service]-callflow.html` — open in browser for architecture view

No API key, no bash, no external process.

---

## Step 6 — View Architecture

Open the generated HTML in any browser:
```
graphify-out/[service]-callflow.html
```

For cross-service architecture questions, run `/graphify .` at the monorepo root
if all services are under one folder.
