# Antigravity Integration Guide

Google Antigravity IDE workflow configuration.

## 📁 File Locations

### Global Configuration
```
~/.gemini/
├── GEMINI.md                    # Global rules (always active)
└── antigravity/
    └── global_workflows/        # Global workflows
        └── global-workflow.md
```

### Workspace Configuration
```
your-project/
└── .agent/
    ├── rules/                   # Project-specific rules
    │   └── project.md
    └── workflows/               # Project workflows
        ├── context-agent.md
        ├── requirement-agent.md
        └── ...
```

## 🔧 Setup

### 1. Install Global Rules
```powershell
.\setup.ps1 -TargetProject "C:\Projects\myapp" -InstallGlobal $true
```

### 2. Verify Installation
Check that `~/.gemini/GEMINI.md` exists and contains your rules.

### 3. Open Project in Antigravity
Rules and workflows will be automatically detected.

## 📋 Rules vs Workflows

| Feature | Rules | Workflows |
|---------|-------|-----------|
| Purpose | Always-on constraints | On-demand procedures |
| Activation | Automatic | User-triggered (`/workflow`) |
| Format | Markdown with constraints | Markdown with steps |
| Location | `.agent/rules/` | `.agent/workflows/` |

## 🚀 Using Workflows

### Trigger a Workflow
Type `/` followed by workflow name:
```
/master-pipeline --input "Add user authentication feature"
```

### Available Workflows
- `/context-agent` - Collect project context
- `/requirement-agent` - Structure requirements
- `/rule-agent` - Aggregate rules
- `/planner-agent` - Create implementation plan
- `/task-generator-agent` - Generate tasks
- `/validation-agent` - Validate artifacts
- `/review-agent` - Code review
- `/master-pipeline` - Full pipeline

## 💡 Tips

### Optimize Context
- Use `@file` to reference specific files
- Keep prompts focused
- Start fresh conversations for new tasks

### Rule Precedence
1. Project rules override global
2. More specific rules win
3. Explicit overrides take precedence

### Agent Mode
Enable Agent Mode for autonomous file operations with human-in-the-loop approval.

## 🔗 Resources

- [Antigravity Documentation](https://antigravity.google)
- [Gemini CLI GitHub](https://github.com/google-gemini/gemini-cli)
