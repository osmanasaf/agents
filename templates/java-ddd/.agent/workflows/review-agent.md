---
description: Unified code review with configurable specialized reviewers (SOLID, Clean Code, OOP, Patterns, Security, Performance).
---

# Review Agent

Perform comprehensive code review with multiple perspectives.

## Parameters
- `--file <path>`: Specific file to review
- `--scope <file|package|module>`: Review scope
- `--reviewers <all|solid,cleancode,oop,patterns,security,performance>`
- `--severity <error|warning|info>`: Minimum severity to report

## Reviewers

### SOLID Reviewer
Checks for:
- **SRP**: Classes with multiple responsibilities
- **OCP**: Direct modifications instead of extensions
- **LSP**: Subtype behavioral violations
- **ISP**: Fat interfaces
- **DIP**: Concrete dependencies

### Clean Code Reviewer
Checks for:
- Poor naming (abbreviations, unclear intent)
- Long methods (>20 lines)
- Long classes (>200 lines)
- Magic numbers and strings
- Commented-out code
- TODO/FIXME in production

### OOP Reviewer
Checks for:
- Public fields (breaks encapsulation)
- Inheritance misuse
- Low cohesion
- Tight coupling
- Tell-don't-ask violations
- Law of Demeter violations

### Patterns Reviewer
Checks for:
- Anti-patterns (God Object, Anemic Domain Model)
- Pattern misuse
- Suggests applicable patterns
- Factory/Builder opportunities

### Security Reviewer
Checks for:
- OWASP Top 10 vulnerabilities
- PII exposure in logs
- Missing input validation
- Hardcoded secrets
- SQL injection risks
- Authentication/authorization gaps

### Performance Reviewer
Checks for:
- N+1 query patterns
- Unnecessary object creation
- Memory leaks
- Inefficient algorithms
- Missing caching opportunities
- Blocking operations

## Output Format
```markdown
# Code Review Report

## Summary
- Files Reviewed: 5
- Issues Found: 12
- Critical: 2, Warning: 7, Info: 3

## Issues

### [CRITICAL] SOLID/SRP Violation
**File**: `OrderService.java:45`
**Issue**: Service handles both order creation and email sending
**Suggestion**: Extract EmailService

### [WARNING] Clean Code
**File**: `CustomerController.java:23`  
**Issue**: Method `proc()` has unclear name
**Suggestion**: Rename to `processCustomerRequest()`

### [INFO] Patterns
**File**: `Order.java:15`
**Issue**: Multiple optional parameters in constructor
**Suggestion**: Consider Builder pattern
```

## Return Condition
Return when review report is generated with all selected reviewers' findings.
