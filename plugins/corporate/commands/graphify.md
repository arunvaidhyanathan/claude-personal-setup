Build a knowledge graph for this codebase and generate a Mermaid callflow HTML.
Works entirely through Claude's own file-reading tools — no bash, no API key, no external process.

## Usage
/graphify .                    — graph current directory
/graphify ./services/auth      — graph a specific service
/graphify . --update           — rebuild if code has changed

## Steps

### 1. Discover
Use Glob to find all source files: `**/*.java`, `**/*.ts`, `**/*.tsx`, `**/*.py`, `**/*.md`
Exclude: node_modules, target, build, dist, .git

### 2. Read & Analyse
Read entry points, controllers, services, repositories, DTOs, config files.
For each significant component identify:
- Name and type (controller / service / repo / component / hook / util)
- Responsibilities (what it owns)
- Dependencies (what it calls / imports)
- Exposed interface (endpoints, events, exports)

### 3. Build the graph (in memory)
Nodes = components. Edges = calls / imports / emits / subscribes.
Group into communities by layer (API → Service → Repo → DB) and by feature domain.

### 4. Generate callflow HTML
Write a self-contained HTML file to `graphify-out/[folder-name]-callflow.html`.
The HTML must:
- Be openable in any browser with no server
- Contain Mermaid.js loaded from CDN
- Include one diagram per architectural layer / feature domain
- Include a summary table: component name | type | responsibilities | calls
- Be readable as plain text (semantic HTML, no minification)

### 5. Generate GRAPH_REPORT.md
Write `graphify-out/GRAPH_REPORT.md` with:
- Node count, edge count, community count
- God nodes (most connected components)
- Cross-service bridges
- Knowledge gaps (isolated nodes)
- Suggested questions the graph can answer

### 6. Checkpoint
Report: N files read, N nodes, N edges, N communities.
List the top 5 most connected components.
Confirm both output files were written.

## Output files
- `graphify-out/[name]-callflow.html` — open in browser
- `graphify-out/GRAPH_REPORT.md` — Claude reads this on every future session
