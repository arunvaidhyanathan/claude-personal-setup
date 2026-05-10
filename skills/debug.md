Debug the reported issue systematically.

Steps:
1. Understand the symptom: what is expected vs. what actually happens
2. Read the relevant code — do not guess
3. Trace the execution path from entry point to failure
4. Form a hypothesis. State it explicitly before testing.
5. Check logs, stack traces, and error messages for clues
6. For Spring Boot: check @Transactional boundaries, lazy loading, bean wiring
7. For PostgreSQL: check query plans with EXPLAIN ANALYZE if performance issue
8. Fix the root cause — not the symptom
9. Verify the fix does not break adjacent behavior
