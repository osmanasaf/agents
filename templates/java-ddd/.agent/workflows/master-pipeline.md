---
description: Runs full engineering analysis pipeline by sequentially invoking all agents and aggregating results.
---

# Master Pipeline

Orchestrate the complete workflow from requirements to validated tasks.

## Parameters
- `--input <requirement-text>`: Raw requirement input
- `--output-dir <path>`: Where to save artifacts (default: `.agent/output/`)
- `--skip <agents>`: Comma-separated agents to skip

## Pipeline Stages

### Stage 1: Context Collection
```
Run: /context-agent
Output: context.json
```

### Stage 2: Requirement Analysis
```
Run: /requirement-agent
Input: User requirement text
Output: requirements.md
```

### Stage 3: Rule Aggregation
```
Run: /rule-agent
Output: active-rules.md
```

### Stage 4: Planning
```
Run: /planner-agent
Input: context.json, requirements.md, active-rules.md
Output: plan.md
```

### Stage 5: Task Generation
```
Run: /task-generator-agent
Input: plan.md, active-rules.md
Output: tasks.md
```

### Stage 6: Validation
```
Run: /validation-agent
Input: requirements.md, plan.md, tasks.md, active-rules.md
Output: validation-report.md
```

### Stage 7: Final Report
Aggregate all outputs into `pipeline-report.md`:
```markdown
# Engineering Pipeline Report

## Execution Summary
- Start Time: 2024-01-15 10:00
- End Time: 2024-01-15 10:15
- Status: SUCCESS

## Artifacts Generated
1. [context.json](./context.json)
2. [requirements.md](./requirements.md)
3. [active-rules.md](./active-rules.md)
4. [plan.md](./plan.md)
5. [tasks.md](./tasks.md)
6. [validation-report.md](./validation-report.md)

## Key Metrics
- Requirements: 5 functional, 3 non-functional
- Plan Phases: 5
- Tasks Generated: 23
- Validation: PASSED (2 warnings)

## Ready for Implementation
[x] All requirements covered
[x] All rules applied
[x] Dependencies mapped
[x] Tests planned
```

## Error Handling
If any stage fails:
1. Log the error
2. Attempt to continue if possible
3. Mark final report as PARTIAL
4. List failed stages and reasons

## Return Condition
Return when `pipeline-report.md` is generated summarizing all stages.
