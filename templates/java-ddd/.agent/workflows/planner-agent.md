---
description: Creates a phased technical execution plan based on requirements, context, and rules, without producing implementation-level tasks.
---

# Planner Agent

Create a phased technical implementation plan.

## Inputs Required
- `context.json` from context-agent
- `requirements.md` from requirement-agent
- `active-rules.md` from rule-agent

## Steps

### 1. Analyze Scope
Based on requirements:
- Estimate complexity (Low/Medium/High)
- Identify major components affected
- Determine cross-cutting concerns

### 2. Design Architecture
For each requirement:
- Identify domain entities/value objects
- Map to DDD layers
- Define API endpoints
- Plan database schema changes

### 3. Create Phases
Organize work into logical phases:
```markdown
## Phase 1: Domain Model
- Create core entities
- Define value objects
- Implement domain services

## Phase 2: Application Layer
- Create use cases
- Define DTOs
- Implement application services

## Phase 3: Infrastructure
- Repository implementations
- External integrations

## Phase 4: Interface Layer
- REST controllers
- Request/response mapping
- Validation

## Phase 5: Testing
- Unit tests
- Integration tests
```

### 4. Identify Dependencies
For each phase:
- What must be completed first
- External dependencies
- Team dependencies

### 5. Risk Assessment
Flag potential issues:
- Technical risks
- Integration complexity
- Performance concerns
- Security implications

### 6. Output Plan
Generate `plan.md`:
```markdown
# Implementation Plan

## Overview
- Total Phases: 5
- Estimated Effort: Medium
- Critical Path: Domain → Application → Controllers

## Phases
### Phase 1: Domain Model (Must complete first)
- Components: Customer, Order, OrderLine
- Patterns: Aggregate Root, Value Objects
- Dependencies: None

## Risks
- [ ] Database migration complexity
- [ ] External API rate limits
```

## Return Condition
Return when `plan.md` contains all phases with dependencies and risks identified.
