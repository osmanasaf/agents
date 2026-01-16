# Design Patterns

## Creational Patterns

### Factory Method
Use when:
- Object creation logic is complex
- Need to decouple creation from usage
- Different implementations based on context

### Builder
Use when:
- Object has many optional parameters
- Need step-by-step construction
- Want immutable objects with many fields

### Singleton (Use Sparingly)
- Prefer dependency injection
- Only for truly global state
- Make thread-safe

## Structural Patterns

### Adapter
Use when:
- Integrating with external APIs
- Need to convert interfaces
- Wrapping legacy code

### Decorator
Use when:
- Adding behavior dynamically
- Need composable features
- Avoiding class explosion

### Facade
Use when:
- Simplifying complex subsystems
- Providing unified interface
- Reducing coupling

## Behavioral Patterns

### Strategy
Use when:
- Multiple algorithms for same task
- Need runtime algorithm selection
- Eliminating conditionals

### Template Method
Use when:
- Defining algorithm skeleton
- Allowing step customization
- Enforcing workflow structure

### Observer
Use when:
- Broadcasting state changes
- Decoupling publishers/subscribers
- Event-driven architectures

### Command
Use when:
- Encapsulating requests
- Supporting undo/redo
- Queuing operations

## Anti-Patterns to Avoid
- God Object: Too many responsibilities
- Anemic Domain Model: Logic outside entities
- Service Locator: Hidden dependencies
- Spaghetti Code: No structure
- Golden Hammer: Same solution everywhere
- Premature Optimization: Optimize before measuring
