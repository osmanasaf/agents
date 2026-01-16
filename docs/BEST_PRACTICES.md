# AI IDE Best Practices

Maximum productivity from your AI coding assistant.

## 🎯 Core Principles

### 1. Context is Everything
- Keep context focused and relevant
- Start fresh chats for new tasks
- Use `/summarize` for long conversations
- Reference files explicitly with `@file`

### 2. Plan Before Execute
- Use Plan Mode (Shift+Tab in Cursor)
- Ask agent to explain before implementing
- Review generated plans before approval
- Break complex tasks into smaller steps

### 3. Iterate, Don't Perfect
- Start simple, refine later
- Use generated code as draft
- Review all changes carefully
- Test incrementally

## 🛠️ Effective Prompting

### Be Specific
```
❌ "Fix the bug"
✅ "Fix the null pointer exception in OrderService.createOrder() 
    when customer address is missing"
```

### Provide Context
```
✅ "Using Spring Boot 3.2 with Java 21, create a REST endpoint 
    that follows our DDD structure in the existing codebase"
```

### Request Explanations
```
✅ "Before implementing, explain your approach and list 
    the files you'll need to modify"
```

## 📁 Workflow Tips

### Starting New Features
1. Run `/context-agent` first
2. Then `/requirement-agent` with your requirements
3. Review outputs before `/planner-agent`
4. Approve plan before `/task-generator-agent`

### Code Reviews
```
/review-agent --reviewers solid,security --file OrderService.java
```

### Full Pipeline
```
/master-pipeline --input "Add customer loyalty points feature"
```

## ⚠️ Common Mistakes

| Mistake | Solution |
|---------|----------|
| Too much context | Focus on relevant files only |
| Vague prompts | Be specific about requirements |
| Blind acceptance | Always review generated code |
| No testing | Include tests in requirements |
| Ignoring warnings | Address linting/analysis issues |

## 🔄 Continuous Improvement

1. Update rules when you find patterns
2. Refine workflows based on experience
3. Share learnings with team
4. Review and prune unused rules
