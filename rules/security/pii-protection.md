# PII Protection Rules

## Definition
PII (Personally Identifiable Information) includes:
- Full name
- Email address
- Phone number
- National ID / SSN
- Passport number
- Address
- Date of birth
- Financial information
- Biometric data
- IP address (in some contexts)

## Logging
- NEVER log PII directly
- Use masking: `email: j***@example.com`
- Log only identifiers when necessary
- Audit who accessed PII

```java
// BAD
log.info("User registered: " + user.getEmail());

// GOOD
log.info("User registered: userId={}", user.getId());
```

## Storage
- Encrypt PII at rest
- Use field-level encryption for sensitive fields
- Separate storage for highly sensitive data
- Implement data retention policies

## Transmission
- TLS 1.3 for all connections
- Encrypt sensitive fields in payloads
- Never send PII in URLs/query strings

## Access Control
- Need-to-know basis
- Log all PII access
- Time-limited access tokens
- Regular access reviews

## Display
- Mask by default
- Show partial: `***-***-1234`
- Require explicit action to reveal
- Time-limited display

## Error Messages
- Never expose PII in errors
- Use generic error messages
- Log details server-side only

## Data Deletion
- Hard delete when possible
- Anonymize for analytics
- Delete from backups
- Document retention periods
