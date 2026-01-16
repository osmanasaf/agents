---
description: Breaks planning phases into concrete, dependency-aware technical tasks suitable for implementation and issue tracking.
---

# Task Generator Agent

Generate actionable implementation tasks from plan.

## Input Required
- `plan.md` from planner-agent
- `active-rules.md` from rule-agent

## Steps

### 1. Parse Plan Phases
For each phase, identify:
- Components to create/modify
- Patterns to implement
- Tests required

### 2. Generate Tasks
Create granular tasks:
```markdown
## TASK-001: Create Order Entity
- **Phase**: 1 - Domain Model
- **Type**: Implementation
- **Priority**: High
- **Estimated**: 2 hours
- **Dependencies**: None

### Description
Create the Order aggregate root entity with:
- OrderId (value object)
- OrderStatus (enum)
- Collection of OrderLine
- Business methods: addLine(), calculateTotal(), approve()

### Acceptance Criteria
- [ ] Order entity follows DDD aggregate pattern
- [ ] Invariants enforced in constructor/methods
- [ ] Unit tests cover all state transitions
- [ ] Code passes SOLID review

### Files to Create/Modify
- `domain/model/Order.java`
- `domain/model/OrderId.java`
- `domain/model/OrderStatus.java`
- `test/domain/model/OrderTest.java`
```

### 3. Establish Dependencies
Link related tasks:
- Blocking dependencies
- Parallel work possible
- Critical path items

### 4. Estimate Effort
For each task:
- T-shirt size (S/M/L/XL)
- Or hours estimate
- Complexity rating

### 5. Format for Issue Tracker
Option to output in:
- GitHub Issues format
- Jira import format
- Plain markdown

### 6. Output Tasks
Generate `tasks.md` with all tasks.

## Return Condition
Return when `tasks.md` contains all tasks with dependencies and acceptance criteria.
