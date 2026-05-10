Review the changed code for correctness, security, and simplicity.

Steps:
1. Read all modified files in full
2. Check for: SQL injection, XSS, command injection, hardcoded secrets
3. Flag over-engineering: unnecessary abstractions, premature optimization, dead code
4. Check Spring Boot conventions if Java: proper use of @Transactional, DTO boundaries, jOOQ patterns
5. Check Python conventions if Python: type hints, Pydantic models, FastAPI patterns
6. Summarize findings as:
   - MUST FIX (bugs, security issues)
   - SHOULD FIX (code quality, conventions)
   - CONSIDER (minor improvements)
7. Apply MUST FIX items immediately. Ask before applying SHOULD FIX.
