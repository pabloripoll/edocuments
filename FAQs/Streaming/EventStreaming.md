# Event Streaming

Event streaming is the technological foundation for the practice of capturing data in real-time from event sources like databases, sensors, mobile devices, cloud services, and software applications in the form of streams of events; storing these event streams durably for later retrieval; manipulating, processing, and reacting to the event streams in real-time as well as retrospectively; and routing the event streams to different destination technologies as needed. Event streaming thus ensures a continuous flow and interpretation of data so that the right information is at the right place, at the right time.

Any application, service, or software that consists of multiple parts communicating with each other, after reaching moderate complexity, requires some form of event/message management. Such event/message management platforms may come in a message queue(MQ) such as RabbitMQ or a message broker platform like Apache Kafka.

Both RabbitMQ and Apache Kafka use asynchronous messaging to pass information from producers to consumers. The producer can deliver a message, and if the consumer is at max capacity, down, or otherwise not ready, then the message is stored. Storing messages can allow producers and consumers to be active at different times, thus reducing coupling and increasing the system’s fault tolerance.

While Kafka is best suited for big data use cases requiring the best throughput, RabbitMQ is perfect for low latency message delivery and complex routing.
- https://kafka.apache.org/documentation/

https://www.interviewbit.com/blog/rabbitmq-vs-kafka/

#### Apache Kafka in 6 minutes
https://www.youtube.com/watch?v=-SxtMWxBW1Q

## Kafka Managers
- ZooKeeper
- Kraft