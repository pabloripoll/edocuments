# PHP Symfony FAQs

Senior-level Symfony interview FAQs with concise but solid answers.

---

## 1) What is Symfony’s HTTP request lifecycle?

A request enters through `public/index.php`, which bootstraps the `Kernel`. The Kernel loads the environment, builds the container, and dispatches the request through the `HttpKernel` component. Symfony resolves the controller, runs event listeners (like routing, security, and locale), executes the controller, converts the response if needed, and returns a `Response` object to the client.

---

## 2) What is the role of the Symfony Kernel?

The Kernel is the application core. It registers bundles, loads configuration, initializes the container, and handles request-to-response flow. It also defines the application environment (`dev`, `prod`, `test`) and controls cache/log directories. In modern Symfony, the Kernel is the central bootstrapper of the app.

---

## 3) What is the Dependency Injection container in Symfony?

The container is a service registry and factory. It stores service definitions, resolves dependencies, injects them automatically, and manages service lifecycles. Symfony compiles the container for performance, turning many service definitions into optimized PHP code in cache.

---

## 4) What is autowiring in Symfony?

Autowiring automatically resolves constructor arguments based on type hints. It reduces boilerplate in service definitions. It is convenient, but senior developers should still understand when explicit wiring is better, especially for scalar arguments, multiple implementations of the same interface, or when the code needs clarity and control.

---

## 5) What is autoconfiguration?

Autoconfiguration automatically applies tags or configuration to services based on implemented interfaces or class attributes. For example, Symfony can automatically tag event subscribers or console commands. It speeds up setup, but can hide behavior if overused.

---

## 6) What are compiler passes used for?

Compiler passes let you modify the service container during compilation. They are used to register tagged services, alter service definitions, or create custom framework behavior before the container is dumped. They are often used in bundles or infrastructure-level code.

---

## 7) What is the Event Dispatcher, and when should you use it?

The Event Dispatcher allows decoupled communication between components. You dispatch an event, and listeners or subscribers react to it. It is useful for cross-cutting concerns like logging, notifications, auditing, or modifying behavior without tight coupling. For simple synchronous domain logic, overusing events can make code harder to follow.

---

## 8) What is the difference between an event listener and a subscriber?

A listener is registered for one or more events, usually via configuration or attributes. A subscriber implements `EventSubscriberInterface` and declares its subscribed events in code. Subscribers are often preferred when a class handles multiple related events because the contract is self-contained.

---

## 9) What is the Symfony Security component used for?

It handles authentication, authorization, firewalls, user providers, password hashing, access control, and security-related events. It is the central place for protecting resources and managing user identity. In modern Symfony, security is configured through firewalls and access rules rather than older patterns like `encoders` or legacy guard authentication.

---

## 10) What is the difference between authentication and authorization?

Authentication answers “Who are you?”; authorization answers “Are you allowed to do this?”. In Symfony, authentication verifies the user identity, while authorization checks permissions via roles, access controls, or voters.

---

## 11) What are voters in Symfony?

Voters make fine-grained authorization decisions. They are used when role checks are not enough, such as “Can this user edit this specific article?” or “Can this manager approve this invoice?”. A voter receives the token, subject, and attribute, and returns whether access is granted, denied, or abstained.

---

## 12) How do forms work in Symfony?

Symfony forms map request data to PHP objects or arrays, validate input, handle CSRF protection, and render HTML. They use a form builder, data mapping, and event hooks. Forms are not just HTML helpers — they are a structured data transformation and validation layer.

---

## 13) What are data transformers in forms?

Data transformers convert data between model, normalized, and view formats. They are useful when the database representation differs from what the user enters, such as converting an entity ID to an object or converting a date string to a DateTime object.

---

## 14) What are form events used for?

Form events let you modify form fields or data during the form lifecycle, such as before setting data, before submit, or after submission. They are useful for dynamic forms, conditional fields, and custom preprocessing.

---

## 15) How does validation work in Symfony?

Symfony validation uses constraints applied to entities, DTOs, or form data. The Validator component checks data against rules like `NotBlank`, `Email`, `Length`, or custom constraints. It integrates tightly with forms and can be used independently for APIs or application services.

---

## 16) How does Symfony integrate with Doctrine?

Symfony commonly uses Doctrine ORM for persistence. Entities represent domain objects, repositories encapsulate queries, and the EntityManager handles persistence, flushing, and lifecycle management. Doctrine lifecycle events can be used, but senior engineers should avoid putting too much business logic into entity hooks.

---

## 17) How do you optimize performance in Symfony?

Common optimizations include:
- using production cache and preloading
- avoiding unnecessary service instantiation
- minimizing database queries with proper joins and indexes
- caching expensive results with Symfony Cache
- reducing listener overhead
- using Messenger for async workloads
- warming up the container and framework cache in deployment

---

## 18) How does caching work in Symfony?

Symfony provides a Cache component with PSR-6 and PSR-16 support. You can cache application data, HTTP responses, fragments, and metadata. Good cache strategy includes choosing proper TTLs, invalidation rules, and cache keys. In production, HTTP caching and reverse proxies can also significantly improve performance.

---

## 19) What is Symfony Messenger used for?

Messenger is used for synchronous and asynchronous message handling. It supports command-style messages, event-driven workflows, background jobs, retries, transports, and dead-letter handling. It is ideal for sending emails, processing files, integrating with external systems, and offloading heavy work from the request cycle.

---

## 20) How do you test Symfony applications?

Symfony supports multiple testing layers:
- **Unit tests** for isolated business logic
- **Functional tests** for controllers and services in the container
- **Integration tests** for persistence or external boundaries
- **End-to-end tests** for full application flows

A senior approach focuses on testing behavior, not implementation details, and uses fixtures/mocks carefully to keep tests reliable and maintainable.

---

If you want, I can also provide:
1. **the same 20 questions with more advanced, senior-grade answers**,
2. **a Symfony interview Q&A PDF-style cheat sheet**, or
3. **20 more questions focused specifically on Symfony 6/7, API Platform, and Docker/deployment**.