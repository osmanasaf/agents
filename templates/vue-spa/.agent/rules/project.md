# Project Rules

## Rule Imports
This project uses the following rules from the shared library:

### Core
- See: rules/core/solid.md
- See: rules/core/clean-code.md
- See: rules/core/oop.md
- See: rules/core/patterns.md

### Frontend
- See: rules/frontend/vue-3.md
- See: rules/frontend/pinia.md
- See: rules/frontend/vue-router.md
- See: rules/frontend/composables.md
- See: rules/frontend/typescript.md
- See: rules/frontend/api-integration.md
- See: rules/frontend/security.md
- See: rules/frontend/testing.md

## Project-Specific Overrides

### Architecture
- Component-based architecture with feature modules
- Composables for shared logic
- Pinia stores for global state
- API layer for backend communication

### Structure
```
src/
├── api/              # API client and endpoints
├── assets/           # Static assets
├── components/       # Reusable components
│   ├── base/         # Base/UI components
│   └── shared/       # Shared feature components
├── composables/      # Reusable composables
├── layouts/          # Layout components
├── router/           # Vue Router config
├── stores/           # Pinia stores
├── types/            # TypeScript types
├── utils/            # Utility functions
└── views/            # Page components
    └── [feature]/    # Feature-specific views
```

### Code Quality
- Maximum component lines: 300
- Maximum composable lines: 150
- Minimum test coverage: 70%

### Team Conventions
- Branch naming: `feature/TICKET-description`
- Commit format: `type(scope): message`
- Component naming: PascalCase
- File naming: PascalCase for components, camelCase for utils

### Environment
- Node.js: 18+
- Package manager: npm/pnpm
- Build tool: Vite
- Testing: Vitest + Vue Test Utils
