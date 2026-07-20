# Domain Driven Design

- All Design Patterns: https://dev.to/rock_win_c053fa5fb2399067/industry-wide-folder-packaging-structures-in-spring-boot-1hon

Boundaries context, aggregates, consistency boundary

https://en.wikipedia.org/wiki/Domain-driven_design
https://medium.com/nick-tune-tech-strategy-blog/domains-subdomain-problem-solution-space-in-ddd-clearly-defined-e0b49c7b586c


# Database Model

A database model is a type of data model that determines the logical structure of a database. It fundamentally determines in which manner data can be stored, organized and manipulated. The most popular example of a database model is the relational model, which uses a table-based format.

https://en.wikipedia.org/wiki/Database_model

A data model is an abstract model that organizes elements of data and standardizes how they relate to one another and to the properties of real-world entities. For instance, a data model may specify that the data element representing a car be composed of a number of other elements which, in turn, represent the color and size of the car and define its owner.

https://en.wikipedia.org/wiki/Data_model

https://www.techopedia.com/definition/6762/database-model

## Value Object

In computer science, a value object is a small object that represents a simple entity whose equality is not based on identity: i.e. two value objects are equal when they have the same value, not necessarily being the same object.[1][2]

Examples of value objects are objects representing an amount of money or a date range.

Being small, one can have multiple copies of the same value object that represent the same entity: it is often simpler to create a new object rather than rely on a single instance and use references to it.[2]

Value objects should be immutable:[3] this is required for the implicit contract that two value objects created equal, should remain equal. It is also useful for value objects to be immutable, as client code cannot put the value object in an invalid state or introduce buggy behaviour after instantiation.[4]

Value objects are among the building blocks of DDD.

https://en.wikipedia.org/wiki/Value_object

## Entity
An entity in a database is a thing, place, person or object that is independent of another. In databases, you store information about things in the real world, and these things are database entities.

https://uk.indeed.com/career-advice/career-development/entity-in-database

The entity type is the fundamental building block for describing the structure of data with the Entity Data Model. In a conceptual model, entity types are constructed from properties and describe the structure of top-level concepts, such as a customers and orders in a business application.

https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/entity-data-model-key-concepts

-------------------------------------------------------------------------------------------------------------------

#### STOP dogmatic Domain Driven Design
https://www.youtube.com/watch?v=8XmXhXH_q90

#### Domain Driven Design en 10 minutos // ¿Qué es y cuando usarlo?
https://www.youtube.com/watch?v=UgEExav6CeE

#### Arquitectura DDD
https://sergiotapia.net/arquitectura-ddddomain-driven-design/

#### Domain Driven Design: Learn in 5 minutes
https://www.youtube.com/watch?v=Z_nmvQFc3Es

#### Domain Driven Design with BDD
https://www.youtube.com/watch?v=Ju50D11EIoE

#### What is DDD - Eric Evans - DDD Europe 2019
https://www.youtube.com/watch?v=pMuiVlnGqjk

#### Domain Driven Design
https://www.youtube.com/watch?v=VC3Gt7OndMM

#### DDD (PHP) En Español 1: Entorno local en Docker y configuración de Symfony para trabajar en DDD
https://www.youtube.com/watch?v=SbqIom7uTOM

https://learn.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/ddd-oriented-microservice

https://dev.to/stevescruz/domain-driven-design-ddd-file-structure-4pja

https://github.com/ddd-crew/bounded-context-canvas \
https://github.com/ddd-crew/aggregate-design-canvas
