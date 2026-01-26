# Backend Rules

- Target Java 21; prefer modern language features.
- DDD layers: domain/application/infrastructure/interfaces; business logic only in domain.
- Cross-cutting concerns via AOP/interceptors (logging, metrics, security, transactions).
- Spring Boot: thin controllers, DTOs only; @ControllerAdvice for errors; @ConfigurationProperties; @Valid for inputs; Spring Security + JWT.
- JPA/Hibernate: LAZY by default; avoid bidirectional; parameterized queries; join fetch/entity graph for N+1; @Transactional at service (read-only for queries).
- Data safety: no PII in logs; encrypt sensitive data; avoid exposing internal errors.
