Implement or modify hybrid search functionality in the document-search project.

Context:
- Project: /Users/arunvaidhyanathan/Developer/document-search
- Stack: Spring Boot + jOOQ + PostgreSQL/PGVector + Python FastAPI (Gemini embeddings)
- Pattern: Reciprocal Rank Fusion (RRF) combining vector cosine similarity + tsvector keyword search
- Target: Sub-200ms query response

Steps:
1. Read Implementation_Plan.md to understand the full architecture
2. Read relevant entity, repository, service, and controller files
3. For search changes: always use jOOQ DSL — never raw SQL string concatenation
4. For embedding changes: call Python embedding service via REST, never inline embedding logic in Java
5. For schema changes: create a new Liquibase changeset in db/changelog/changesets/
6. Run through RRF logic: both vector score and keyword score must be normalized before fusion
7. Validate with EXPLAIN ANALYZE before finalizing query changes
