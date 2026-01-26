# Frontend Testing Rules

## Test Categories

### Unit Tests
- Test composables in isolation
- Test utility functions
- Test Pinia stores
- Test component logic (no DOM)

### Component Tests
- Mount components with `@vue/test-utils`
- Test user interactions
- Test props and events
- Test slots and provide/inject

### E2E Tests
- Critical user flows
- Authentication flow
- Form submissions
- Navigation paths

## File Structure
```
tests/
├── unit/
│   ├── composables/
│   ├── stores/
│   └── utils/
├── components/
│   └── **/*.spec.ts
└── e2e/
    └── **/*.e2e.ts
```

## Naming Conventions
- Unit/component tests: `*.spec.ts`
- E2E tests: `*.e2e.ts`
- Test descriptions: Should describe behavior

```typescript
describe('useAuth', () => {
  it('should return isAuthenticated as false when no user', () => { })
  it('should set user after successful login', () => { })
  it('should clear user on logout', () => { })
})
```

## Component Testing Patterns
```typescript
import { mount } from '@vue/test-utils'
import { createTestingPinia } from '@pinia/testing'
import UserProfile from '@/components/UserProfile.vue'

describe('UserProfile', () => {
  it('should display user name', () => {
    const wrapper = mount(UserProfile, {
      props: { user: { id: '1', name: 'John' } }
    })
    expect(wrapper.text()).toContain('John')
  })
  
  it('should emit edit event on button click', async () => {
    const wrapper = mount(UserProfile, {
      props: { user: mockUser }
    })
    await wrapper.find('[data-testid="edit-btn"]').trigger('click')
    expect(wrapper.emitted('edit')).toBeTruthy()
  })
})
```

## Store Testing
```typescript
import { setActivePinia, createPinia } from 'pinia'
import { useUserStore } from '@/stores/user'

describe('useUserStore', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })
  
  it('should fetch users', async () => {
    const store = useUserStore()
    await store.fetchUsers()
    expect(store.users.length).toBeGreaterThan(0)
  })
})
```

## Test Data
- Use factories for test data
- Keep fixtures in dedicated files
- Avoid hardcoded values in tests

```typescript
// tests/factories/user.factory.ts
export function createMockUser(overrides?: Partial<User>): User {
  return {
    id: faker.string.uuid(),
    name: faker.person.fullName(),
    email: faker.internet.email(),
    ...overrides
  }
}
```

## Coverage Requirements
- Minimum 70% coverage for components
- Minimum 80% coverage for stores
- 100% coverage for utility functions
- All critical paths must be tested
