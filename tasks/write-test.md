# Write Test

- Use AAA structure; name tests `shouldXWhenY`.
- Unit tests: domain logic, value objects, entity state transitions, edge cases.
- Integration tests: controller/service/repository interactions.
- Mock only external dependencies; never mock domain entities.
- One logical assertion per test; prefer state over interaction checks.
