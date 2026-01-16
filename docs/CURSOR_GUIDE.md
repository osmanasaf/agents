# Cursor Integration Guide

Cursor AI editor workflow configuration.

## 📁 File Locations

### Global Rules
```
~/.cursorrules          # User-level rules
```

### Project Rules
```
your-project/
├── .cursorrules        # Project root rules
└── .cursor/
    └── rules/          # Scoped rules (by path pattern)
        ├── backend.md
        └── frontend.md
```

## 🔧 Setup

### 1. Copy Template
```powershell
.\setup.ps1 -TargetProject "C:\Projects\myapp" -Template "java-ddd"
```

### 2. Verify .cursorrules
Ensure `.cursorrules` exists in project root with your rules.

### 3. Configure Scoped Rules (Optional)
Create `.cursor/rules/` files for path-specific rules:
```yaml
# .cursor/rules/domain.md
---
globs:
  - "**/domain/**/*.java"
---
# Domain Layer Rules
- All classes must follow DDD patterns
- No infrastructure dependencies
```

## 📋 Rules Format

### Basic .cursorrules
```markdown
# You are an expert Java developer

## Architecture
- Follow DDD principles
- Keep business logic in domain layer

## Code Style
- Use meaningful names
- Max 20 lines per method
```

### Scoped Rules (.cursor/rules/)
```yaml
---
globs:
  - "**/test/**"
alwaysApply: false
---
# Test-specific rules
Use JUnit 5 and AssertJ
```

## 🔄 Mapping Workflows

Antigravity workflows can be converted to Cursor commands:

| Antigravity | Cursor Custom Command |
|-------------|----------------------|
| `/context-agent` | `.cursor/commands/context.md` |
| `/review-agent` | `.cursor/commands/review.md` |

### Custom Command Example
```markdown
<!-- .cursor/commands/review.md -->
Review the current file for:
1. SOLID principle violations
2. Clean code issues
3. Security vulnerabilities

Format findings as a table.
```

## 💡 Tips

### Context References
Use `@` to add context:
- `@file` - Reference specific file
- `@folder` - Reference directory
- `@docs` - Reference documentation
- `@web` - Search web

### Composer (Agent Mode)
- Use Ctrl+I for inline edits
- Cmd+K for quick actions
- Tab to accept suggestions

### Chat Best Practices
- New chat for new topics
- Use `/summarize` for long chats
- Keep context lean

## 🔗 Resources

- [Cursor Documentation](https://cursor.com/docs)
- [Awesome Cursorrules](https://github.com/PatrickJS/awesome-cursorrules)
