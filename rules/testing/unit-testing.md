# Unit Testing Rules

## Test Structure (AAA Pattern)
```java
@Test
void shouldCalculateTotalWithDiscount() {
    // Arrange
    Order order = new Order();
    order.addItem(new Item("A", 100));
    
    // Act
    Money total = order.calculateTotal(10); // 10% discount
    
    // Assert
    assertThat(total.amount()).isEqualTo(new BigDecimal("90"));
}
```

## Naming Convention
- `should[ExpectedBehavior]When[Condition]`
- Or: `methodName_stateUnderTest_expectedBehavior`

## What to Test
- Business logic in domain layer
- Value object behavior
- Entity state transitions
- Domain service operations
- Edge cases and boundaries

## What NOT to Unit Test
- Getters/setters without logic
- Framework code
- Third-party libraries
- Integration points

## Mocking
- Mock external dependencies only
- Use real objects when possible
- Never mock domain entities
- Prefer fakes over mocks when complex

## Assertions
- One logical assertion per test
- Use AssertJ for fluent assertions
- Test exceptions with assertThrows
- Verify state, not interactions

## Test Independence
- No shared mutable state
- Each test can run alone
- No order dependency
- Setup in @BeforeEach

## Coverage Targets
- 80% line coverage minimum
- 100% for critical business logic
- Branch coverage for conditionals
