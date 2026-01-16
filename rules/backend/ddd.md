# Domain-Driven Design Rules

## Layer Structure

```
src/main/java/com/company/project/
├── domain/           # Core business logic
│   ├── model/        # Entities, Value Objects, Aggregates
│   ├── service/      # Domain Services
│   ├── repository/   # Repository interfaces
│   └── event/        # Domain Events
├── application/      # Use cases
│   ├── service/      # Application Services
│   ├── dto/          # Data Transfer Objects
│   └── port/         # Ports (interfaces)
├── infrastructure/   # Technical implementations
│   ├── persistence/  # Repository implementations
│   ├── messaging/    # Message brokers
│   └── external/     # External API clients
└── interfaces/       # Entry points
    ├── rest/         # REST Controllers
    ├── graphql/      # GraphQL resolvers
    └── cli/          # Command line
```

## Entities
- Have unique identity
- Mutable state with controlled changes
- Contain business logic
- Validate invariants

```java
public class Order {
    private final OrderId id;
    private OrderStatus status;
    private final List<OrderLine> lines;
    
    public void approve() {
        if (status != OrderStatus.PENDING) {
            throw new InvalidOrderStateException();
        }
        this.status = OrderStatus.APPROVED;
    }
}
```

## Value Objects
- No identity
- Immutable
- Equality based on attributes
- Use Java records

```java
public record Money(BigDecimal amount, Currency currency) {
    public Money add(Money other) {
        if (!currency.equals(other.currency)) {
            throw new CurrencyMismatchException();
        }
        return new Money(amount.add(other.amount), currency);
    }
}
```

## Aggregates
- Cluster of entities and value objects
- Single entry point (Aggregate Root)
- Transactional consistency boundary
- Reference other aggregates by ID only

## Domain Services
- Stateless operations
- Logic that doesn't fit entities
- Coordinate multiple aggregates

## Application Services
- Orchestrate use cases
- Transaction boundaries
- DTO conversion
- No business logic

## Repository Pattern
- Interface in domain layer
- Implementation in infrastructure
- One per aggregate root
