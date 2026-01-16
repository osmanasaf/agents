---
description: Analyzes raw user requirements and converts them into structured, testable functional and non-functional requirements.
---

# Requirement Agent

Transform raw requirements into structured specifications.

## Steps

### 1. Parse Raw Requirements
Read the user's input and identify:
- High-level goals
- Specific features mentioned
- Constraints stated
- Implicit requirements

### 2. Extract Functional Requirements
For each feature, document:
- **ID**: FR-001, FR-002, etc.
- **Title**: Short descriptive name
- **Description**: What the system should do
- **Actor**: Who performs the action
- **Preconditions**: Required state before
- **Postconditions**: Expected state after
- **Priority**: Must/Should/Could/Won't (MoSCoW)

### 3. Extract Non-Functional Requirements
Identify quality attributes:
- **Performance**: Response time, throughput
- **Security**: Authentication, authorization, encryption
- **Scalability**: Load expectations
- **Reliability**: Uptime requirements
- **Maintainability**: Code quality standards

### 4. Define Acceptance Criteria
For each requirement:
```gherkin
Given [precondition]
When [action]
Then [expected result]
```

### 5. Identify Ambiguities
Flag requirements that are:
- Unclear or contradictory
- Missing essential details
- Need user clarification

### 6. Output Requirements Document
Generate `requirements.md`:
```markdown
# Requirements Specification

## Functional Requirements
### FR-001: Create Order
- **Actor**: Customer
- **Description**: Customer can create a new order
- **Acceptance Criteria**:
  - Given a logged-in customer
  - When they add items and submit
  - Then an order is created with PENDING status

## Non-Functional Requirements
### NFR-001: Response Time
- API responses under 200ms at P95
```

## Return Condition
Return when `requirements.md` contains all extracted requirements with acceptance criteria.
