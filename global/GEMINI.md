# Global AI Rules

These rules apply to ALL projects and interactions.

## Core Principles

### Java 21 Target
- All backend code must target Java 21
- Use modern language features: records, sealed classes, pattern matching, virtual threads

### Architecture: Domain-Driven Design (DDD)
Structure every project with clear separation:
- **Domain**: Business logic, entities, value objects, domain services
- **Application**: Use cases, application services, DTOs
- **Infrastructure**: Persistence, external integrations, messaging
- **Interface**: Controllers, API endpoints, CLI

### Business Logic Placement
- NEVER implement business logic in controllers
- NEVER implement business logic in adapters
- NEVER implement business logic in infrastructure
- Business rules belong in Domain layer ONLY

## SOLID Principles

### Single Responsibility (SRP)
- Each class has ONE reason to change
- No god classes
- Split large classes by responsibility

### Open/Closed (OCP)
- Open for extension, closed for modification
- Use strategy pattern for varying behavior
- Prefer composition over inheritance

### Liskov Substitution (LSP)
- Subtypes must be substitutable for base types
- No surprising behavior in derived classes

### Interface Segregation (ISP)
- Interfaces represent business capabilities
- No fat interfaces
- Client-specific interfaces

### Dependency Inversion (DIP)
- Depend on abstractions, not concretions
- High-level modules don't depend on low-level modules

## Clean Code Standards

### Naming
- Self-explanatory method and class names
- No abbreviations except well-known ones (DTO, ID, URL)
- Intention-revealing names

### Code Quality
- No commented-out code
- No TODOs in production code
- No magic numbers or hardcoded business rules
- Maximum method length: 20 lines
- Maximum class length: 200 lines

### Cross-Cutting Concerns
Use AOP or framework interceptors for:
- Logging
- Metrics
- Security
- Transactions

## Security Rules

### PII Protection
- NEVER log PII (names, emails, phone numbers, IDs)
- NEVER cache PII without encryption
- NEVER expose PII in error messages

### File Storage
- Store sensitive files (ID, license, documents) encrypted
- Access via signed or authenticated URLs only

### API Security
- All APIs must be idempotent where applicable
- Design for safe retries
- Validate input at API layer
- Enforce invariants at Domain layer

## Testing Requirements

### Mandatory Tests
Every new feature must include:
- Unit tests for domain logic
- Integration tests for application services

### Test Coverage
- Minimum 80% line coverage for domain layer
- All public APIs must have integration tests

## Architectural Decisions

### Avoid Premature Complexity
- Prefer modular monolith over microservices
- No message brokers unless explicitly required
- No distributed systems unless business requires

### Configuration
- Explicit configuration over convention for:
  - Security
  - Serialization
  - External integrations

### Date/Time
- Use UTC internally
- Convert to local time at presentation boundaries only

## Protected Files

Do NOT modify without explicit instruction:
- Database migration history
- Security configuration modules
