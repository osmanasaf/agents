# JPA/Hibernate Rules

## Entity Mapping
- Use @Entity on domain entities carefully
- Prefer @Embeddable for value objects
- Always define @Id and generation strategy

## Relationships
- Use LAZY fetching by default
- Avoid bidirectional relationships when possible
- Use @ManyToOne with optional=false when not nullable

```java
@Entity
public class OrderLine {
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "order_id")
    private Order order;
}
```

## Queries
- Use JPQL for complex queries
- Criteria API for dynamic queries
- Native queries only when necessary
- Always use parameterized queries

## N+1 Problem
- Use JOIN FETCH for eager loading
- Use @EntityGraph for query-time fetching
- Batch fetching with @BatchSize

```java
@Query("SELECT o FROM Order o JOIN FETCH o.lines WHERE o.id = :id")
Optional<Order> findWithLines(@Param("id") Long id);
```

## Performance
- Enable query logging in development
- Use read-only transactions for queries
- Implement pagination for list queries
- Use projections for read-only data

## Auditing
- Use @CreatedDate, @LastModifiedDate
- Enable JPA auditing
- Store audit user with @CreatedBy

## Transactions
- @Transactional at service level only
- Read-only for query operations
- Proper isolation levels for concurrent access
