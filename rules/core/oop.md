# Object-Oriented Programming Rules

## Encapsulation
- All fields private by default
- Expose behavior, not data
- Use getters only when necessary
- Never expose mutable collections

```java
// BAD
public List<Item> items;

// GOOD
private final List<Item> items = new ArrayList<>();
public void addItem(Item item) { items.add(item); }
public List<Item> getItems() { return List.copyOf(items); }
```

## Inheritance vs Composition
- Favor composition over inheritance
- Use inheritance only for "is-a" relationships
- Limit inheritance depth to 2-3 levels
- Prefer interfaces for polymorphism

## Cohesion
- High cohesion within classes
- Methods should use most instance variables
- Split classes with low cohesion

## Coupling
- Minimize dependencies between classes
- Depend on abstractions
- Use dependency injection
- Avoid circular dependencies

## Tell, Don't Ask
- Tell objects what to do
- Don't ask for data and make decisions outside

```java
// BAD (asking)
if (order.getStatus() == PENDING) {
    order.setStatus(APPROVED);
}

// GOOD (telling)
order.approve();
```

## Law of Demeter
- Only talk to immediate friends
- Avoid chaining: `a.getB().getC().doSomething()`
- Delegate behavior

## Immutability
- Prefer immutable objects
- Use final fields
- No setters for value objects
- Return defensive copies

## Polymorphism Over Conditionals
- Replace switch/if-else with polymorphism
- Use strategy or state patterns
- Each type handles its own behavior
