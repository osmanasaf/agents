# Composables Rules

## Naming & Structure
- Prefix with `use`: `useAuth`, `useFetch`, `useForm`
- One composable per file
- Locate in `src/composables/` directory
- Export as named export

```typescript
// composables/useAuth.ts
export function useAuth() {
  const user = ref<User | null>(null)
  const isLoggedIn = computed(() => user.value !== null)
  
  async function login(credentials: Credentials) { }
  function logout() { }
  
  return {
    user: readonly(user),
    isLoggedIn,
    login,
    logout
  }
}
```

## Return Value Patterns
- Return refs, not raw values
- Use `readonly()` for state that shouldn't be modified
- Return computed values as-is
- Export functions for mutations

```typescript
// GOOD: Readonly for internal state
return {
  items: readonly(items),
  loading: readonly(loading),
  addItem,
  removeItem
}

// BAD: Exposing mutable ref directly
return { items, loading }
```

## Composable Categories

### Data Fetching
```typescript
export function useFetch<T>(url: string) {
  const data = ref<T | null>(null)
  const error = ref<Error | null>(null)
  const loading = ref(false)
  
  async function execute() {
    loading.value = true
    try {
      data.value = await api.get(url)
    } catch (e) {
      error.value = e as Error
    } finally {
      loading.value = false
    }
  }
  
  return { data, error, loading, execute }
}
```

### Side Effects
- Use `onMounted` / `onUnmounted` for lifecycle
- Clean up subscriptions and timers
- Return cleanup function if needed

### Form Handling
- Handle validation state
- Track dirty/pristine state
- Expose submit handler

## Anti-Patterns
- ❌ No side effects in composable body (use lifecycle hooks)
- ❌ Don't call composables conditionally
- ❌ Don't mutate props inside composables
- ❌ Avoid synchronous heavy computations

## Testing
- Test composables in isolation
- Mock dependencies (API calls, stores)
- Test returned values and functions
- Use `@vue/test-utils` with `mount` for lifecycle
