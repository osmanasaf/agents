# SOLID Principles

## Single Responsibility Principle (SRP)
- Each class has exactly ONE reason to change
- A class should have only one job
- Split large classes into focused components

### Violations to Avoid
- God classes with multiple responsibilities
- Services that handle both business logic and persistence
- Controllers that contain business rules

### Examples
```java
// BAD: Multiple responsibilities
class UserService {
    void createUser() { }
    void sendEmail() { }
    void generateReport() { }
}

// GOOD: Single responsibility
class UserService { void createUser() { } }
class EmailService { void sendEmail() { } }
class ReportService { void generateReport() { } }
```

## Open/Closed Principle (OCP)
- Open for extension, closed for modification
- Add new functionality without changing existing code
- Use abstraction and polymorphism

### Implementation Patterns
- Strategy pattern for varying algorithms
- Template method for workflow variations
- Decorator for adding behaviors

## Liskov Substitution Principle (LSP)
- Subtypes must be substitutable for base types
- Child classes must honor parent contracts
- No surprising behavior in derived classes

### Violations
- Throwing unexpected exceptions
- Returning different types
- Requiring stronger preconditions

## Interface Segregation Principle (ISP)
- No client should depend on methods it doesn't use
- Prefer many small interfaces over one large interface
- Interfaces represent business capabilities

### Signs of Violation
- Methods throwing UnsupportedOperationException
- Empty method implementations
- Clients ignoring interface methods

## Dependency Inversion Principle (DIP)
- High-level modules should not depend on low-level modules
- Both should depend on abstractions
- Abstractions should not depend on details

### Implementation
- Define interfaces in domain layer
- Implement in infrastructure layer
- Use dependency injection
