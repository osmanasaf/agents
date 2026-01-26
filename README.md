# AI Workflow Agents Repository

Enterprise-grade, modüler ve genişletilebilir AI workflow agent sistemi. Antigravity ve Cursor ile uyumlu.

## 🚀 Quick Start

### Windows
```powershell
.\setup.ps1 -TargetProject "C:\path\to\your\project" -Template "java-ddd"
```

### Linux/Mac
```bash
./setup.sh --target /path/to/your/project --template java-ddd
```

## 📁 Repository Structure

```
├── global/                 # Global AI configurations
│   └── GEMINI.md          # Global rules for ~/.gemini/
├── rules/                  # Modular rule library
│   ├── core/              # SOLID, Clean Code, OOP, Patterns
│   ├── backend/           # Java 21, DDD, Spring Boot
│   ├── frontend/          # Vue 3, Pinia, TypeScript, Security
│   ├── security/          # OWASP, PII protection
│   └── testing/           # Unit & Integration testing
├── templates/             # Project templates
│   ├── java-ddd/          # Java 21 DDD template
│   │   └── .agent/        # Agent config
│   │       ├── rules/     # Project rules
│   │       └── workflows/ # Workflow agents
│   └── vue-spa/           # Vue 3 SPA template
│       └── .agent/        # Agent config
│           ├── rules/     # Project rules
│           └── workflows/ # Workflow agents
└── docs/                  # Documentation
```

## 🤖 Available Agents

| Agent | Description |
|-------|-------------|
| `/context-agent` | Collects project technical context |
| `/requirement-agent` | Structures requirements into testable specs |
| `/rule-agent` | Aggregates applicable rules |
| `/planner-agent` | Creates phased technical plans |
| `/task-generator-agent` | Generates implementation tasks |
| `/validation-agent` | Validates plans and tasks |
| `/review-agent` | Unified code review with 6 reviewers |
| `/master-pipeline` | Orchestrates full workflow |

## 📚 Documentation

- [Best Practices](docs/BEST_PRACTICES.md)
- [Antigravity Guide](docs/ANTIGRAVITY_GUIDE.md)
- [Cursor Guide](docs/CURSOR_GUIDE.md)

