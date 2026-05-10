# [SERVICE-NAME] — Project Rules

## What This Service Does
[One paragraph: what this microservice is responsible for, what it owns, what it does NOT own]

## Stack
- Language/Framework: [e.g. Java Spring Boot 3.x / Python FastAPI / Node.js]
- Database: [e.g. PostgreSQL / MongoDB / Redis]
- Messaging: [e.g. Kafka / RabbitMQ / SQS]
- Exposed via: [e.g. REST / gRPC / event]

## Key Files
- `[entry point]` — application start
- `[config file]` — environment config
- `[migration dir]` — schema migrations

## Conventions
- [List the naming conventions, patterns, and rules specific to this service]
- [e.g. "All DTOs live in dto/ package and are never exposed as entities"]
- [e.g. "Error handling is centralized in GlobalExceptionHandler"]

## Inter-Service Contracts
- Calls: [services this one calls and how]
- Called by: [services that call this one]
- Events published: [event names and schemas]
- Events consumed: [event names and schemas]

## Hard Rules
- [e.g. No raw SQL — use the ORM/query builder]
- [e.g. No schema changes without a migration file]
- [e.g. No blocking calls in async paths]
- [e.g. No secrets in code or logs]

## Knowledge Graph
If `graphify-out/GRAPH_REPORT.md` exists, read it before answering architecture questions.
To build/rebuild: run `/graphify .` in Claude Code (no bash needed).
View architecture: open `graphify-out/[service]-callflow.html` in browser.
