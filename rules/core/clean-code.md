# Clean Code Rules

## Naming Conventions

### Classes
- Use nouns: `Customer`, `OrderService`, `PaymentGateway`
- No abbreviations except: DTO, ID, URL, API
- Name reveals intent

### Methods
- Use verbs: `calculateTotal()`, `validateOrder()`, `sendNotification()`
- Boolean methods: `isValid()`, `hasPermission()`, `canProcess()`
- Max 3 parameters, use objects for more

### Variables
- Descriptive names: `customerEmail` not `ce`
- No single letters except loop counters
- Constants in SCREAMING_SNAKE_CASE

## Method Size
- Maximum 20 lines per method
- One level of abstraction per method
- Extract till you drop

## Class Size
- Maximum 200 lines per class
- Maximum 10 public methods
- High cohesion, low coupling

## Comments
- Code should be self-documenting
- Comments explain WHY, not WHAT
- No commented-out code
- No TODO in production

## Magic Numbers
- No hardcoded values in logic
- Use named constants
- Use enums for fixed sets

```java
// BAD
if (status == 1) { }

// GOOD
if (status == OrderStatus.PENDING) { }
```

## Error Handling
- Use specific exceptions
- Don't catch generic Exception
- Never swallow exceptions
- Fail fast

## Code Smells to Avoid
- Long methods
- Long parameter lists
- Duplicate code
- Dead code
- Feature envy
- Data clumps
- Primitive obsession
