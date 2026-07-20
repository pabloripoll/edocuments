# SAGA

Focused, practical overview of the SAGA pattern — what it is, how it works, variants, tradeoffs, and implementation guidance you can act on.

- [Distributed Transactions Explained: 2 Phase Commit vs Saga Pattern](https://www.youtube.com/watch?v=DOFflggE_0Q)

## Summary (short)

- Sagas replace distributed ACID with a sequence of local transactions + compensations to achieve eventual consistency across services.
- Two flavors: choreography (event-driven) and orchestration (central coordinator).
- Focus on durable saga state, idempotency, compensations, retries, observability, and clear design of each step.
- Use orchestrators/workflow engines for complex flows; prefer choreography for small, well-bounded flows.

## When not to use Sagas

- If you need strict, immediate consistency across services and cannot tolerate eventual consistency.
- If the workflow is a simple single-service transaction — use local DB transactions instead.

## What the SAGA pattern is

- A SAGA is a sequence of distributed, local transactions (each executed by a different microservice or component) that together implement a larger business transaction.
- Instead of a single ACID transaction spanning services, each step commits locally. If a later step fails, previously completed steps are compensated (reversed) by compensating actions so the system reaches a consistent state.
- Sagas provide eventual consistency across services.

## When to use it

- You need multi-service transactions but cannot use distributed transactions (XA/2PC) or they are undesirable due to coupling or latency.
- Workflows involve multiple bounded contexts (e.g., order, inventory, payment, shipping).
- Business operations are long-running (minutes to hours) or must tolerate partial failures and recovery.

## Two main styles

1. Choreography (event-driven)

     - Each service emits events on success; other interested services react.
     - No central coordinator; the flow emerges from event subscriptions.
     - Pros: simple to implement for straightforward flows, loosely coupled.
     - Cons: Harder to visualize/control complex flows, debugging and tracing can be harder.

2. Orchestration (central coordinator)

     - A Saga orchestrator (service or workflow engine) sends commands to participants and tells them what to do next based on responses.
     - Pros: Easier to manage complex flows, clearer state machine and monitoring.
     - Cons: Central point of logic (but not necessarily a single failure point if built resiliently).

## Typical lifecycle (orchestration view)

1. Start saga (create saga instance and persistent state).
2. Execute step 1 (local transaction in Service A) and record success/failure.
3. Execute step 2 (Service B), etc.
4. On success of all steps => mark saga completed.
5. On failure of step N => execute compensating steps for completed previous steps in reverse order (B_compensate, A_compensate) and mark saga failed/rolled-back.

## Example (e-commerce)

- Steps: Create Order -> Reserve Inventory -> Charge Payment -> Create Shipment
- Compensations:
     - If payment fails: release reserved inventory, cancel order.
     - If shipping fails after payment: refund payment, release inventory, cancel order.

## Key implementation concerns & patterns

- Persistent saga state: store saga id, current state, pending steps, retries, timestamps. Use durable storage so sagas survive restarts.
- Correlation IDs: include a saga id in messages/events for routing and tracing.
- Idempotency: every action and compensation must be idempotent to safely retry.
- Retries and exponential backoff: transient failures should be retried; use retry limits and move to dead-letter/compensation if exhausted.
- Timeouts and dead-letter handling: define timeouts for steps and a process for manual intervention for stuck sagas.
- Compensations are not necessarily exact inverses: they should restore a consistent business state, not always revert data exactly.
- Observability: logging, distributed tracing (W3C traceparent), metrics for running/completed/failed sagas.
- Security/consistency: auth/ACL for commands and events; validate assumptions when performing compensations.

## Common pitfalls

- Missing or incomplete compensating actions (some external side effects can be irreversible).
- Race conditions when multiple sagas act on same resource; consider optimistic concurrency and proper locking or design choices to avoid conflicts.
- Overly complex choreography leading to spaghetti event flows.
- Relying on eventual consistency where strict ordering is required.

## Tools, libraries, and workflow engines

- Temporal (recommended for durable workflows; supports complex retries, timeouts, strong developer model).
- Cadence (Uber), Netflix Conductor, Camunda (BPMN), Zeebe.
- Language/stack-specific: NServiceBus Sagas (.NET), MassTransit, Axon Framework (Java), Spring State Machine patterns.
- Message brokers: Kafka, RabbitMQ, AWS SQS/SNS, Kinesis (for choreography).

## Simple orchestration pseudo-code (conceptual)

- Orchestrator:
     - createSaga(sagaId, initialData)
     - call reserveInventory(sagaId, order)
     - if success -> call chargePayment(...)
     - if chargePayment fails -> call releaseInventory(...), markSagaFailed()
     - on completion -> markSagaCompleted()

Checklist for designing a saga

- Define the global business flow and required steps.
- For each step, define:
     - The local transaction.
     - The compensating action (and idempotency).
     - Success/failure events/return values and retry rules.
- Decide choreography vs orchestration.
- Choose persistence for saga state and message transport.
- Implement correlation IDs and tracing.
- Define monitoring, SLAs, retry/backoff, and manual intervention paths.
- Test: simulate partial failures, restarts, duplicate messages, and network partitions.
<br><br>

## Sources

- https://microservices.io/patterns/data/saga.html
- https://learn.microsoft.com/en-us/azure/architecture/patterns/saga
- https://learn.microsoft.com/es-es/azure/architecture/reference-architectures/saga/saga
- https://docs.aws.amazon.com/prescriptive-guidance/latest/cloud-design-patterns/saga-orchestration.html

#### Patrón SAGA para transacciones distribuidas en microservicios
- https://www.youtube.com/watch?v=Z_UQ3lLKNA8
- https://refactorizando.com/patron-saga-en-arquitectura-de-microservicios/

#### Implementing the Saga Pattern with Choreography and Orchestration
- https://medium.com/@dinesharney/implementing-the-saga-pattern-using-choreography-and-orchestration-53e66cbd520e

## Softs:

- Orleans
- MassTransit
- Rebus