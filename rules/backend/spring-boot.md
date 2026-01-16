# Spring Boot Rules

## Controller Layer
- @RestController for REST APIs
- @RequestMapping at class level
- Thin controllers - delegate to services
- No business logic
- Return DTOs, not entities

```java
@RestController
@RequestMapping("/api/v1/orders")
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    
    @PostMapping
    public ResponseEntity<OrderDTO> create(@Valid @RequestBody CreateOrderRequest request) {
        return ResponseEntity.ok(orderService.createOrder(request));
    }
}
```

## Service Layer
- @Service for application services
- @Transactional at service method level
- Handle exceptions gracefully
- Log at appropriate levels

## Repository
- Extend JpaRepository or CrudRepository
- Custom queries with @Query
- Use projections for read models

## Configuration
- Use @ConfigurationProperties over @Value
- Validate configuration with @Validated
- Externalize all environment-specific values

## Exception Handling
- Use @ControllerAdvice for global handling
- Map domain exceptions to HTTP status
- Never expose internal details

## Validation
- @Valid for request body validation
- Custom validators for complex rules
- Domain validation in entities

## Security
- Use Spring Security
- JWT for stateless auth
- Method-level security with @PreAuthorize

## Testing
- @WebMvcTest for controller tests
- @DataJpaTest for repository tests
- @SpringBootTest sparingly
