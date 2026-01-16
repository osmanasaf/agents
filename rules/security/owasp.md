# OWASP Security Rules

## Injection Prevention
- Use parameterized queries always
- Validate and sanitize all inputs
- Use ORM/JPA instead of raw SQL
- Escape output for context

## Authentication
- Strong password policies
- Multi-factor authentication for sensitive ops
- Secure session management
- Account lockout after failed attempts

## Authorization
- Principle of least privilege
- Role-based access control (RBAC)
- Validate authorization on every request
- Deny by default

## Sensitive Data
- Encrypt data at rest
- Use TLS for data in transit
- Hash passwords with bcrypt/argon2
- Rotate encryption keys regularly

## Security Misconfiguration
- Disable debug in production
- Remove default credentials
- Keep dependencies updated
- Minimal error information to users

## XSS Prevention
- Sanitize HTML output
- Use Content Security Policy
- HttpOnly cookies
- Validate redirects

## CSRF Protection
- Use anti-CSRF tokens
- SameSite cookie attribute
- Verify origin headers

## API Security
- Rate limiting
- API key rotation
- Request signing
- Audit logging

## Headers
```
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
Content-Security-Policy: default-src 'self'
Strict-Transport-Security: max-age=31536000
```
