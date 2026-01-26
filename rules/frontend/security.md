# Frontend Security Rules

## XSS Prevention
- Never use `v-html` with user input
- Sanitize HTML if dynamic content is required
- Use Content Security Policy headers
- Escape special characters in templates

```typescript
// BAD: XSS vulnerability
<div v-html="userInput"></div>

// GOOD: Safe text interpolation
<div>{{ userInput }}</div>

// If HTML needed, sanitize first
import DOMPurify from 'dompurify'
const safeHtml = DOMPurify.sanitize(userInput)
```

## Authentication
- Store tokens in httpOnly cookies when possible
- If localStorage is used, clear on logout
- Implement token refresh flow
- Validate token expiration client-side

```typescript
// Token management
interface AuthTokens {
  accessToken: string
  refreshToken: string
  expiresAt: number
}

function isTokenExpired(tokens: AuthTokens): boolean {
  return Date.now() >= tokens.expiresAt - 60000 // 1 min buffer
}
```

## Authorization
- Check permissions before showing UI elements
- Never trust frontend-only authorization
- Implement route guards for protected pages
- Hide features users can't access

```vue
<template>
  <button v-if="can('users:delete')" @click="deleteUser">
    Delete
  </button>
</template>
```

## Sensitive Data
- Never log sensitive data to console
- Clear sensitive data when component unmounts
- Don't store PII in localStorage
- Use environment variables for configuration

```typescript
// BAD: Logging sensitive data
console.log('User password:', form.password)

// GOOD: Mask sensitive data
console.log('User authenticated:', !!user.value)
```

## API Security
- Use HTTPS for all API calls
- Implement CSRF protection
- Add request timeouts
- Validate response data structure

## Input Validation
- Validate all form inputs
- Use allowlists over blocklists
- Sanitize file uploads client-side
- Limit file sizes and types

```typescript
const MAX_FILE_SIZE = 5 * 1024 * 1024 // 5MB
const ALLOWED_TYPES = ['image/jpeg', 'image/png', 'application/pdf']

function validateFile(file: File): boolean {
  if (file.size > MAX_FILE_SIZE) return false
  if (!ALLOWED_TYPES.includes(file.type)) return false
  return true
}
```

## Dependency Security
- Regularly audit dependencies: `npm audit`
- Keep dependencies updated
- Pin dependency versions
- Review before adding new packages

## Error Handling
- Never expose stack traces to users
- Log errors securely (no PII)
- Use generic error messages in UI
