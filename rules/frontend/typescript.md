# TypeScript Frontend Rules

## Type Safety
- Enable strict mode in `tsconfig.json`
- No `any` type usage
- No type assertions without justification
- Prefer interfaces over types for objects

```json
// tsconfig.json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true
  }
}
```

## Type Definitions

### API Response Types
```typescript
// types/api.ts
interface ApiResponse<T> {
  data: T
  message?: string
  timestamp: string
}

interface PaginatedResponse<T> {
  items: T[]
  total: number
  page: number
  pageSize: number
  totalPages: number
}
```

### Entity Types
```typescript
// types/entities.ts
interface User {
  id: string
  email: string
  name: string
  role: UserRole
  createdAt: string
}

type UserRole = 'admin' | 'user' | 'guest'
```

### Form Types
```typescript
// types/forms.ts
interface LoginForm {
  email: string
  password: string
  remember?: boolean
}

interface CreateUserForm extends Omit<User, 'id' | 'createdAt'> {
  password: string
  confirmPassword: string
}
```

## Utility Types
- Use built-in: `Partial`, `Required`, `Pick`, `Omit`
- Create domain-specific utilities as needed
- Document complex type mappings

## Type Organization
```
src/types/
├── api.ts          # API request/response types
├── entities.ts     # Domain entity types
├── forms.ts        # Form data types
├── enums.ts        # Enumerations
└── index.ts        # Re-exports
```

## Vue-Specific Types
```typescript
// Prop types
withDefaults(defineProps<{
  title: string
  count?: number
}>(), {
  count: 0
})

// Emit types
const emit = defineEmits<{
  change: [value: string]
  submit: []
}>()

// Ref types
const user = ref<User | null>(null)
const items = ref<Product[]>([])
```

## Anti-Patterns
- ❌ `any` type usage
- ❌ Non-null assertions (`!`) without validation
- ❌ Type assertion (`as`) for convenience
- ❌ Ignoring TypeScript errors with `@ts-ignore`
- ❌ Mixing snake_case and camelCase

## Naming Conventions
- Interfaces: PascalCase, no `I` prefix
- Types: PascalCase
- Enums: PascalCase, members SCREAMING_SNAKE_CASE
- Type parameters: Single uppercase letter or descriptive
