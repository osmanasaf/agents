# Pinia State Management Rules

## Store Structure
- One store per domain/feature
- Use the setup store syntax
- Keep stores focused and small
- Name stores with `use` prefix: `useAuthStore`

```typescript
// GOOD: Setup Store Syntax
export const useUserStore = defineStore('user', () => {
  // State
  const users = ref<User[]>([])
  const currentUser = ref<User | null>(null)
  
  // Getters (computed)
  const isAuthenticated = computed(() => currentUser.value !== null)
  const activeUsers = computed(() => users.value.filter(u => u.active))
  
  // Actions
  async function fetchUsers() {
    users.value = await api.getUsers()
  }
  
  function setCurrentUser(user: User) {
    currentUser.value = user
  }
  
  return {
    users,
    currentUser,
    isAuthenticated,
    activeUsers,
    fetchUsers,
    setCurrentUser
  }
})
```

## State Rules
- State must be typed
- Use `readonly` for state exposed to components
- Initialize with sensible defaults
- Avoid deeply nested state objects

## Getters
- Use computed properties
- Keep getters pure (no side effects)
- Name with `is`, `has`, `get` prefixes
- Memoization is automatic

## Actions
- All mutations through actions
- Async actions for API calls
- Handle errors within actions
- Return meaningful values

```typescript
async function login(credentials: LoginDTO): Promise<LoginResult> {
  loading.value = true
  error.value = null
  
  try {
    const user = await authApi.login(credentials)
    currentUser.value = user
    return { success: true, user }
  } catch (e) {
    error.value = e instanceof Error ? e.message : 'Login failed'
    return { success: false, error: error.value }
  } finally {
    loading.value = false
  }
}
```

## Store Composition
- Avoid store-to-store dependencies
- If needed, call other stores in actions
- Keep stores independent when possible

## Testing
- Mock stores in component tests
- Test store logic independently
- Use `setActivePinia(createPinia())` in tests

## Anti-Patterns to Avoid
- Mutating state directly from components
- Storing component-local state in global stores
- Circular dependencies between stores
- Storing derived data that can be computed
