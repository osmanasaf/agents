# Java 21 Rules

## Language Features

### Records
Use records for immutable data carriers:
```java
public record CustomerDTO(String id, String name, String email) {}
```

### Sealed Classes
Use for restricted inheritance hierarchies:
```java
public sealed interface Payment permits CreditCard, BankTransfer, Cash {}
```

### Pattern Matching
Use modern pattern matching:
```java
// Switch expressions
String result = switch (status) {
    case PENDING -> "Waiting";
    case APPROVED -> "Done";
    default -> "Unknown";
};

// Pattern matching for instanceof
if (obj instanceof Customer customer) {
    return customer.getName();
}
```

### Virtual Threads
Use for I/O-bound operations:
```java
try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
    executor.submit(() -> blockingOperation());
}
```

## String Handling
- Use text blocks for multi-line strings
- Use `String.formatted()` over `String.format()`

## Collections
- Use `List.of()`, `Set.of()`, `Map.of()` for immutable collections
- Use `Stream.toList()` instead of `Collectors.toList()`

## Null Handling
- Use `Optional` for return types that may be absent
- Never use Optional as method parameter
- Use `Objects.requireNonNull()` for validation

## Date/Time
- Use `java.time` package exclusively
- Store as UTC, display as local
- Use `Instant` for timestamps
- Use `LocalDate` for dates without time
