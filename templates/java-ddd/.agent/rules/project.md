# Project Rules

## Rule Imports
This project uses the following rules from the shared library:

### Core
- See: rules/core/solid.md
- See: rules/core/clean-code.md
- See: rules/core/oop.md
- See: rules/core/patterns.md

### Backend
- See: rules/backend/java-21.md
- See: rules/backend/ddd.md
- See: rules/backend/spring-boot.md
- See: rules/backend/jpa-hibernate.md

### Security
- See: rules/security/owasp.md
- See: rules/security/pii-protection.md

### Testing
- See: rules/testing/unit-testing.md
- See: rules/testing/integration-testing.md

## Project-Specific Overrides

### Architecture
- Bounded Contexts: [Define your contexts here]
- Main aggregate roots: [List here]

### Code Quality
- Maximum method lines: 20
- Maximum class lines: 200
- Minimum test coverage: 80%

### Team Conventions
- Branch naming: `feature/TICKET-description`
- Commit format: `type(scope): message`
- PR template required

### Environment-Specific
- Database: PostgreSQL
- Cache: Redis (optional)
- Queue: None (modular monolith)
