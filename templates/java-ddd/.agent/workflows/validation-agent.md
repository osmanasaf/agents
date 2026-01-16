---
description: Validates plans and tasks against requirements and rules, ensuring completeness and consistency.
---

# Validation Agent

Validate artifacts for completeness and compliance.

## Inputs
- `requirements.md`
- `plan.md`
- `tasks.md`
- `active-rules.md`

## Steps

### 1. Requirements Coverage
Verify every requirement has:
- [ ] At least one plan phase addressing it
- [ ] At least one task implementing it
- [ ] Test tasks for verification

Generate traceability matrix:
```markdown
| Requirement | Phase | Tasks | Tests |
|-------------|-------|-------|-------|
| FR-001 | 1, 2 | TASK-001, TASK-002 | TASK-010 |
| FR-002 | 2 | TASK-003 | TASK-011 |
```

### 2. Rule Compliance
Check plans/tasks against rules:
- [ ] DDD layer separation respected
- [ ] SOLID principles followed
- [ ] Security requirements addressed
- [ ] Testing requirements included

### 3. Dependency Validation
Verify task dependencies:
- [ ] No circular dependencies
- [ ] No orphan tasks
- [ ] Critical path is clear
- [ ] Parallel work identified

### 4. Completeness Check
Ensure nothing is missing:
- [ ] All CRUD operations covered
- [ ] Error handling tasks exist
- [ ] Security tasks included
- [ ] Documentation tasks present

### 5. Consistency Check
Look for contradictions:
- [ ] No conflicting tasks
- [ ] Estimates are reasonable
- [ ] Priorities align with dependencies

### 6. Generate Validation Report
Output `validation-report.md`:
```markdown
# Validation Report

## Summary
- Requirements Coverage: 100%
- Rule Compliance: PASS
- Dependency Check: PASS
- Completeness: 95%

## Issues Found
### WARNING: Missing error handling
- FR-003 has no error handling task
- Recommendation: Add TASK-015 for error handling

### INFO: Optimization opportunity
- TASK-005 and TASK-006 can run in parallel

## Traceability Matrix
[matrix here]
```

## Return Condition
Return when `validation-report.md` is generated with all checks completed.
