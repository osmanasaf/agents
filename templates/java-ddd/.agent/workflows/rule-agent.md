---
description: Aggregates global, project, and domain-specific rules into enforceable constraints for planning and task generation.
---

# Rule Agent

Aggregate and prioritize applicable rules.

## Steps

### 1. Load Global Rules
Read from standard locations:
- `~/.gemini/GEMINI.md` (Antigravity global)
- `~/.cursorrules` (Cursor global)

### 2. Load Project Rules
Read from project locations:
- `.agent/rules/*.md`
- `.cursorrules`
- `.cursor/rules/*.md`

### 3. Load Rule Library
From the shared rules repository:
- `rules/core/solid.md`
- `rules/core/clean-code.md`
- `rules/core/oop.md`
- `rules/core/patterns.md`
- `rules/backend/java-21.md`
- `rules/backend/ddd.md`
- `rules/backend/spring-boot.md`
- `rules/security/owasp.md`
- `rules/security/pii-protection.md`
- `rules/testing/unit-testing.md`
- `rules/testing/integration-testing.md`

### 4. Resolve Conflicts
When rules conflict:
1. Project rules override global
2. Explicit overrides win
3. More specific wins over general

### 5. Categorize Rules
Group by enforcement level:
- **MUST**: Mandatory, fail on violation
- **SHOULD**: Recommended, warn on violation
- **MAY**: Optional, inform only

### 6. Output Active Rules
Generate `active-rules.md`:
```markdown
# Active Rules

## MUST (Mandatory)
- Java 21 target
- DDD layer separation
- No business logic in controllers
- No PII in logs

## SHOULD (Recommended)
- 80% test coverage
- Max 20 lines per method
- Use records for DTOs

## MAY (Optional)
- Virtual threads for I/O
```

## Return Condition
Return when `active-rules.md` contains prioritized, conflict-resolved rules.
