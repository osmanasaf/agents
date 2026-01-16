# Integration Testing Rules

## Scope
Test interactions between:
- Service → Repository → Database
- Controller → Service → Repository
- External API integrations

## Spring Boot Testing

### Repository Tests
```java
@DataJpaTest
class OrderRepositoryTest {
    @Autowired
    private OrderRepository repository;
    
    @Test
    void shouldFindOrdersByStatus() {
        // Given
        repository.save(new Order(OrderStatus.PENDING));
        
        // When
        List<Order> orders = repository.findByStatus(OrderStatus.PENDING);
        
        // Then
        assertThat(orders).hasSize(1);
    }
}
```

### Controller Tests
```java
@WebMvcTest(OrderController.class)
class OrderControllerTest {
    @Autowired
    private MockMvc mockMvc;
    
    @MockBean
    private OrderService orderService;
    
    @Test
    void shouldCreateOrder() throws Exception {
        mockMvc.perform(post("/api/orders")
            .contentType(APPLICATION_JSON)
            .content(orderJson))
            .andExpect(status().isCreated());
    }
}
```

## Database
- Use Testcontainers for real DB
- H2 for simple tests only
- Reset data between tests
- Use @Transactional with rollback

## Test Data
- Builders for test objects
- Fixtures for common scenarios
- Minimal data per test
- Clear, readable setup

## Async Operations
- Use Awaitility for async assertions
- Set reasonable timeouts
- Handle race conditions
