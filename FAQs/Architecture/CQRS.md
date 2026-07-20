# CQRS - Command Query Responsibility Segregation

Command query responsibility segregation (CQRS) is a programming design pattern that treats retrieving data and changing data differently. CQRS uses command handlers to simplify the query process and hide complex, multi-system changes.

The design pattern was developed by Bertrand Meyer as a way to ensure that a method working with data is only allowed to perform one of two tasks. A method can either retrieve information or it can modify it, but it can't do both. In object-oriented terms, this paradigm separates responsibilities into two different classes -- one for read and the other for delete, create and update.

When CQRS is combined with event sourcing, it guarantees an audit log of changes to the database that maintains transactional consistency.

- https://www.techtarget.com/searchapparchitecture/definition/CQRS-command-query-responsibility-segregation
- https://learn.microsoft.com/en-us/azure/architecture/patterns/cqrs
- https://www.redhat.com/en/blog/illustrated-cqrs
- https://www.redhat.com/en/blog/pros-and-cons-cqrs
- https://docs.aws.amazon.com/prescriptive-guidance/latest/modernization-data-persistence/cqrs-pattern.html


#### CQS vs. CQRS
https://www.youtube.com/watch?v=cqNGAo-9pUE

#### How to Implement the CQRS Pattern in Clean Architecture (from scratch)
https://www.youtube.com/watch?v=85YbMEb1qkQ

#### CQRS (command query responsibility segregation)
https://www.techtarget.com/searchapparchitecture/definition/CQRS-command-query-responsibility-segregation

#### Aprende CQRS en 10 minutos!
https://www.youtube.com/watch?v=oDIXJ8O9kq4

#### Patrón CQRS explicado FÁCIL en 10 minutos
https://www.youtube.com/watch?v=DJCWpUVf5E0

#### Event Sourcing explicado FÁCIL | Arquitectura distribuida #Distribt
https://www.youtube.com/watch?v=ZxfgL5ffgtI

#### Qué es la CONSISTENCIA EVENTUAL en microservicios | Explicación eventual consistency
https://www.youtube.com/watch?v=uDjo1-gfUnE

#### Introducción a los sistemas distribuidos | Aprende con la práctica | #Distribt
https://www.youtube.com/watch?v=a-2T09eV6uw&list=PLesmOrW3mp4jpSbdFMtVWINJZ7OLdSASS

https://learn.microsoft.com/en-us/azure/architecture/patterns/cqrs