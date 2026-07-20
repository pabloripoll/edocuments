# Hexagonal FAQs

Senior-level FAQs covering Hexagonal Architecture, Clean Architecture, DDD, and CQRS, with practical answers.

Yes — here’s a practical **tree of an API architecture** that combines **Hexagonal**, **DDD**, **Clean Architecture**, **Event-Driven Architecture**, and **CQRS**.

```text
API System
├── Interface / Delivery Layer
│   ├── HTTP REST Controllers
│   ├── GraphQL Resolvers
│   ├── gRPC Handlers
│   ├── CLI / Admin Tools
│   └── Webhooks / Consumers
├── Application Layer
│   ├── Commands
│   ├── Queries
│   ├── Command Handlers
│   ├── Query Handlers
│   ├── DTOs / Request Models
│   ├── Use Cases / Interactors
│   └── Ports
│       ├── Input Ports
│       └── Output Ports
├── Domain Layer
│   ├── Aggregates
│   ├── Entities
│   ├── Value Objects
│   ├── Domain Services
│   ├── Domain Events
│   ├── Repositories (interfaces)
│   └── Policies / Specifications
├── Infrastructure Layer
│   ├── Database Adapters
│   │   ├── ORM Models
│   │   ├── SQL Repositories
│   │   └── Migrations
│   ├── Message Brokers
│   │   ├── Kafka
│   │   ├── RabbitMQ
│   │   └── SQS / SNS
│   ├── Cache Adapters
│   ├── External API Clients
│   ├── File Storage
│   └── Monitoring / Logging / Tracing
├── CQRS Read Side
│   ├── Read Models
│   ├── Projections / Denormalized Views
│   ├── Query Handlers
│   └── Read Databases / Indexes
├── CQRS Write Side
│   ├── Commands
│   ├── Command Handlers
│   ├── Aggregate Roots
│   ├── Domain Events
│   └── Event Publishers
└── Event-Driven Flow
    ├── Domain Event Emission
    ├── Integration Event Mapping
    ├── Event Bus / Broker
    ├── Event Consumers / Subscribers
    ├── Projection Updaters
    └── Saga / Process Manager
```

### How the pieces fit

#### 1. Hexagonal
The app core is isolated behind **ports and adapters**:
- **Ports** = interfaces your app exposes or depends on
- **Adapters** = HTTP, DB, queues, external APIs

#### 2. DDD
The **Domain Layer** contains business rules:
- Entities, Aggregates, Value Objects
- Domain Events
- Repositories as interfaces, not implementations

#### 3. Clean Architecture
Dependencies point inward:
- Outer layers depend on inner layers
- Domain does not depend on frameworks
- Application coordinates use cases

#### 4. CQRS
Separate:
- **Write side** for commands and state changes
- **Read side** for queries and optimized projections

#### 5. Event Architecture
State changes emit events:
- Domain events inside the model
- Integration events for other services
- Event handlers update projections, trigger workflows, or notify others

---

### Very simplified dependency direction

```text
Delivery -> Application -> Domain
Infrastructure -> Application/Domain via interfaces
Events -> Consumers/Projections -> Read Models
```

### If you want a more concrete version
I can also turn this into:
1. a **folder structure tree** for a real codebase, or
2. a **request flow tree** showing `POST /orders -> command -> domain event -> projection -> GET /orders/{id}`

---

## 1) What is Hexagonal Architecture?

Hexagonal Architecture, also called Ports and Adapters, is an architectural style that keeps the core application logic independent from external concerns like databases, UI, APIs, and messaging systems. The core exposes “ports” and external systems connect through “adapters.” This makes the system easier to test, evolve, and replace integrations.

---

## 2) What is Clean Architecture?

Clean Architecture is an approach that organizes software into concentric layers, with business rules at the center and infrastructure at the edges. Dependencies must point inward, meaning outer layers depend on inner layers, not the other way around. The goal is to keep business logic independent of frameworks, databases, and UI.

---

## 3) What is Domain-Driven Design (DDD)?

DDD is a software design approach focused on modeling complex business domains accurately. It emphasizes collaboration between developers and domain experts, a ubiquitous language, and strategic and tactical patterns such as bounded contexts, entities, value objects, aggregates, and repositories.

---

## 4) What is CQRS?

CQRS stands for Command Query Responsibility Segregation. It separates write operations, which change state, from read operations, which return data. This separation allows different models, performance optimizations, and scaling strategies for reads and writes.

---

## 5) What is the difference between Hexagonal Architecture and Clean Architecture?

Both aim to isolate business logic from infrastructure and both follow dependency inversion principles. Hexagonal Architecture focuses on ports and adapters around the application core, while Clean Architecture emphasizes layered concentric rings. In practice, they are very similar and often used interchangeably.

---

## 6) What is a bounded context in DDD?

A bounded context is a clear boundary within which a specific domain model and ubiquitous language apply. It prevents ambiguity by ensuring that terms have a precise meaning within that context. Large systems usually contain multiple bounded contexts, each with its own model.

---

## 7) What is a ubiquitous language?

A ubiquitous language is a shared vocabulary used by developers and domain experts to describe the business domain consistently. It reduces misunderstanding and improves the alignment between code, conversations, and requirements. Senior teams intentionally model code and documentation using this language.

---

## 8) What is the difference between an entity and a value object?

An entity has a stable identity over time, even if its attributes change. A value object has no identity and is defined purely by its attributes. Value objects are usually immutable, while entities are often mutable and lifecycle-aware.

---

## 9) What is an aggregate in DDD?

An aggregate is a cluster of domain objects treated as a consistency boundary. It has a root entity called the aggregate root, which controls access and enforces invariants. Aggregates help keep transactional consistency manageable in complex systems.

---

## 10) What is an aggregate root?

The aggregate root is the entry point to an aggregate. External code should interact with the aggregate through the root, not directly with internal entities. This preserves consistency rules and protects invariants.

---

## 11) What is a repository in DDD?

A repository provides a collection-like interface for retrieving and storing aggregates. It abstracts persistence concerns away from the domain model. In DDD, repositories usually work at the aggregate level rather than exposing raw database tables.

---

## 12) What is the role of domain services?

Domain services contain domain logic that does not naturally belong to a single entity or value object. They are used when behavior spans multiple domain objects or when the logic is conceptually part of the domain but not tied to one model.

---

## 13) What is the role of application services?

Application services orchestrate use cases. They coordinate repositories, transactions, domain objects, and external services, but they should not contain core business rules themselves. Their job is to execute the workflow, not to model the domain.

---

## 14) What is CQRS good for?

CQRS is useful when read and write concerns differ significantly, such as when reads need denormalized views, heavy querying, or separate scaling. It is also helpful in domains with complex business logic where command processing and query processing benefit from different models.

---

## 15) Do you always need CQRS in a system?

No. CQRS adds complexity and is not necessary for every application. It is most valuable when the system has clear read/write asymmetry, complex workflows, or scalability needs. For many applications, a simpler CRUD approach is sufficient and better.

---

## 16) How does CQRS relate to event sourcing?

CQRS and event sourcing are related but independent. CQRS separates command and query models, while event sourcing stores state changes as a sequence of domain events. They are often used together, but you can use CQRS without event sourcing and vice versa.

---

## 17) What are invariants in DDD?

Invariants are business rules that must always remain true within a domain model, such as “an order cannot be shipped before payment.” Aggregates are commonly used to enforce invariants consistently within transactional boundaries.

---

## 18) What is the difference between domain events and integration events?

Domain events represent something meaningful that happened inside a domain model, such as `OrderPlaced`. Integration events are used to communicate across system boundaries or bounded contexts. Domain events are about internal domain consistency; integration events are about integration and messaging.

---

## 19) What are the main benefits of using these approaches together?

Using Hexagonal Architecture, Clean Architecture, DDD, and CQRS together can produce systems that are easier to evolve, test, and reason about. The domain model remains protected from infrastructure changes, use cases are clearer, and reads/writes can be optimized independently. The tradeoff is increased design and implementation complexity.

---

## 20) What is the biggest mistake teams make with these patterns?

The biggest mistake is applying the patterns mechanically without understanding the problem they solve. For example, introducing CQRS or heavy DDD modeling in a simple CRUD application can create unnecessary complexity. Senior engineering is about choosing the right level of abstraction for the actual domain complexity.

---

## 21) What is the biggest mistake teams make with these patterns?

Ports and adapters is an architectural style that keeps the core application logic independent from external systems.

- **Ports** are the interfaces the application exposes or requires.
  - **Inbound ports**: ways to talk to the application, like use-case interfaces.
  - **Outbound ports**: ways the application talks to the outside world, like repository or email interfaces.

- **Adapters** are the implementations that connect those ports to real technologies.
  - **Inbound adapters**: controllers, CLI commands, message consumers, UI handlers.
  - **Outbound adapters**: database repositories, HTTP clients, file storage, SMTP senders.

### Simple idea
The core defines **what it needs** or **what it offers**.
The adapters define **how it is done** with concrete frameworks or services.

### Example
If your application needs to save an order:

- The core defines an interface like `OrderRepository` → this is an **outbound port**
- A Doctrine/MySQL repository implements it → this is an **outbound adapter**
- A controller that receives an HTTP request and calls the use case → this is an **inbound adapter**

### Why it matters
- Keeps business logic independent from frameworks
- Improves testability
- Makes technology replacement easier
- Reduces coupling to databases, APIs, or UI

---

If you want, I can also provide:
- **20 more advanced questions on Hexagonal/Clean Architecture/DDD/CQRS**
- **a comparison table between all four approaches**
- **a senior interview cheat sheet with examples and code sketches**
- **questions specifically about aggregates, bounded contexts, and event-driven architecture**
- If you want, I can also show you a **code example in Symfony, Java, or Node.js**.