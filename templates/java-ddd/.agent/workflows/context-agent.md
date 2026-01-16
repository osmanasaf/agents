---
description: Collects and structures technical, architectural, and organizational context of the project to constrain planning and task generation.
---

# Context Agent

Collect comprehensive project context for downstream agents.

## Steps

### 1. Analyze Project Structure
Scan the project directory to identify:
- Programming language(s) and version
- Framework(s) used (Spring Boot, etc.)
- Build tool (Maven, Gradle)
- Module structure

### 2. Identify Architecture
Determine the architectural pattern:
- Layered architecture (DDD layers)
- Package structure
- Bounded contexts
- Module boundaries

### 3. Extract Technology Stack
Document:
- Java version
- Spring Boot version
- Database type
- External integrations
- Testing frameworks

### 4. Find Existing Rules
Look for:
- `.agent/rules/*.md`
- `GEMINI.md`
- `.cursorrules`
- Code style configurations

### 5. Analyze Dependencies
Review `pom.xml` or `build.gradle`:
- Key libraries
- Version constraints
- Security-sensitive dependencies

### 6. Output Context
Generate a structured `context.json`:
```json
{
  "project": {
    "name": "project-name",
    "language": "Java 21",
    "framework": "Spring Boot 3.x",
    "buildTool": "Maven"
  },
  "architecture": {
    "pattern": "DDD",
    "layers": ["domain", "application", "infrastructure", "interfaces"],
    "boundedContexts": ["order", "customer", "inventory"]
  },
  "dependencies": {
    "database": "PostgreSQL",
    "messaging": null,
    "security": "Spring Security"
  },
  "rules": {
    "global": "~/.gemini/GEMINI.md",
    "project": [".agent/rules/project.md"]
  }
}
```

## Return Condition
Return when `context.json` is generated with all sections populated.
