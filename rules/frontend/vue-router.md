# Vue Router Rules

## Route Structure
- Organize routes by feature/module
- Use lazy loading for all routes
- Define route names (no hardcoded paths)
- Group related routes

```typescript
// routes/index.ts
const routes: RouteRecordRaw[] = [
  {
    path: '/',
    name: 'home',
    component: () => import('@/views/HomeView.vue')
  },
  {
    path: '/auth',
    children: [
      {
        path: 'login',
        name: 'auth-login',
        component: () => import('@/views/auth/LoginView.vue')
      },
      {
        path: 'register',
        name: 'auth-register',
        component: () => import('@/views/auth/RegisterView.vue')
      }
    ]
  }
]
```

## Naming Conventions
- Route names: `module-action` (kebab-case)
- View components: `*View.vue`
- Always use named routes for navigation

```typescript
// GOOD: Named route
router.push({ name: 'user-profile', params: { id: user.id } })

// BAD: Hardcoded path
router.push(`/users/${user.id}/profile`)
```

## Navigation Guards
- Authentication in global `beforeEach`
- Authorization in route-level guards
- Use meta fields for route metadata

```typescript
// Route meta
{
  path: '/admin',
  meta: { 
    requiresAuth: true,
    roles: ['admin']
  }
}

// Global guard
router.beforeEach((to) => {
  const auth = useAuthStore()
  
  if (to.meta.requiresAuth && !auth.isAuthenticated) {
    return { name: 'auth-login', query: { redirect: to.fullPath } }
  }
})
```

## Route Parameters
- Validate params in route guards
- Type route params in components
- Handle missing/invalid params gracefully

## Scroll Behavior
- Return to top on navigation
- Save scroll position for back navigation
- Consider hash-based scroll

```typescript
const router = createRouter({
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) return savedPosition
    if (to.hash) return { el: to.hash }
    return { top: 0 }
  }
})
```

## Error Handling
- Define 404 catch-all route
- Create error pages for common errors
- Handle navigation failures

```typescript
{
  path: '/:pathMatch(.*)*',
  name: 'not-found',
  component: () => import('@/views/errors/NotFoundView.vue')
}
```

## Performance
- Always use lazy loading
- Prefetch critical routes
- Avoid large route files (split by module)
