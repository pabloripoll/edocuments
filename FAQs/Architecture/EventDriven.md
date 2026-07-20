# event Driven Architecture

An event can be defined as "a significant change in state".[1] For example, when a consumer purchases a car, the car's state changes from "for sale" to "sold". A car dealer's system architecture may treat this state change as an event whose occurrence can be made known to other applications within the architecture. From a formal perspective, what is produced, published, propagated, detected or consumed is a (typically asynchronous) message called the event notification, and not the event itself, which is the state change that triggered the message emission. Events do not travel, they just occur. However, the term event is often used metonymically to denote the notification message itself, which may lead to some confusion. This is due to Event-driven architectures often being designed atop message-driven architectures, where such communication pattern requires one of the inputs to be text-only, the message, to differentiate how each communication should be handled.

https://en.wikipedia.org/wiki/Event-driven_architecture

https://hazelcast.com/glossary/event-driven-architecture/

- [Here's why Event-Driven Architecture might be a BAD choice](https://www.youtube.com/watch?v=ttEYKoP53DM)

- [Kafka vs RabbitMQ](https://www.youtube.com/watch?v=1HOVtQ-_fcE)