# Global Claude Rules — Arun Vaidhyanathan

## Identity & Context
- Primary stack: Java (Spring Boot), Python (FastAPI), TypeScript (React)
- DB: PostgreSQL + PGVector, jOOQ for query building
- AI/ML: Gemini API for embeddings, Apache Tika for extraction

## Communication
- Concise, no filler, no emojis unless asked
- Reference code as `file:line`
- Lead with action, not explanation
- Short direct sentences over long explanations

## Code Rules
- Read files before modifying — never assume structure
- No over-engineering: minimum complexity for the current task
- No premature abstractions: 3 similar lines > an abstraction
- No docstrings/comments unless logic is non-obvious
- No error handling for impossible scenarios
- Validate only at system boundaries (user input, external APIs)
- Never hardcode secrets or credentials

## Java / Spring Boot
- Spring Boot conventions always
- jOOQ for all complex SQL — never raw string concatenation
- Liquibase for schema migrations
- DTOs for all API boundaries
- Async with @Async + CompletableFuture for parallel ops

## Python
- FastAPI patterns, always use type hints
- Pydantic models for request/response
- Google GenAI SDK for Gemini

## Git Protocol
- NEVER push without explicit user request
- NEVER force push main/master
- NEVER skip hooks (--no-verify)
- Stage specific files, not `git add .`
- Commit messages: imperative mood, present tense

## Tool Preferences
- Always use dedicated tools: Read, Edit, Grep, Glob (not cat/grep/find via Bash)
- Parallel tool calls when independent
- Subagents for isolated tasks that pollute context

## Security
- No SQL injection (use jOOQ/parameterized queries)
- No XSS (sanitize frontend outputs)
- No command injection in shell scripts
- Never log sensitive data
