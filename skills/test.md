Generate tests for the specified code.

Steps:
1. Read the target file(s) and understand the logic
2. Identify: happy paths, edge cases, error cases, boundary conditions
3. For Java/Spring Boot:
   - Use JUnit 5 + Mockito
   - @SpringBootTest for integration tests, plain unit tests where possible
   - Test method naming: should_[expectedBehavior]_when_[condition]
4. For Python/FastAPI:
   - Use pytest + httpx TestClient
   - Fixtures for common setup
5. Write tests that actually assert behavior, not just coverage
6. Do NOT test framework internals — test your logic
