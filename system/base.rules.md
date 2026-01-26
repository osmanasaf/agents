# Base Rules

- SOLID and Clean Code: intent-revealing names; max 20-line methods, 200-line classes; params <=3; no magic numbers.
- No inline comments; no commented-out code; no TODOs in production.
- Do not change unrelated code; ask before large refactors.
- Keep complexity low: extract complex logic and large classes.
- Security baseline: validate inputs, least privilege, no PII in logs/errors, encrypt sensitive data.
- Concurrency: shared state must be thread-safe; guard and test for race conditions.
- Testing: add unit + integration tests for changes; keep domain coverage >=80%.
- Date/time: UTC internally, convert at boundaries.
- Protected files: database migration history and security configuration (no edits without instruction).
