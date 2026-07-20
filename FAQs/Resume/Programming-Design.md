# Programming Desing

## Programming Paradigms

Most advanced programming languages enable developers to combine models, because they can be used for different programming methods. For example, JavaScript or PHP can be used for OOP and functional programming.

### Object Oriented Programming
Object-oriented programming (OOP) is a programming paradigm based on the concept of objects, which can contain data and code: data in the form of fields (often known as attributes or properties), and code in the form of procedures (often known as methods). In OOP, computer programs are designed by making them out of objects that interact with one another.

### Functional programming
This includes languages such as Erlang and Scala, which are used for telecommunications and fault tolerant systems.

### Structured or modular programming
This includes languages such as PHP and C#.

### Imperative programming
This alternative to OOP focuses on function rather than models and includes C++ and Java.

### Declarative programming
This programming method involves statements on what the task or desired outcome is but not how to achieve it. Languages include Prolog and Lisp.

### Logical programming
This method, which is based mostly in formal logic and uses languages such as Prolog, contains a set of sentences that express facts or rules about a problem domain. It focuses on tasks that can benefit from rule-based logical queries.

---

## Separation of Concerns
Separation of concerns is a principle used in programming to separate an application into units, with minimal overlapping between the functions of the individual units. The separation of concerns is achieved using modularization, encapsulation and arrangement in software layers.

Separation of concerns(SOC) is one of the core software design principle that is widely adhered to. The main idea of this principle is to isolate the software application into separate sections. Each section should address a distinct concern that has little overlap with other sections.

Separation of concerns can be applied on mainly 2 levels — architectural level and programming level.

https://medium.com/@evon.dong3/key-ideas-about-separation-of-concerns-f971bdb8bd6b

---

## Object-oriented Programming (OOP)

Principles:

### Encapsulation.
This principle states that all important information is contained inside an object and only select information is exposed. The implementation and state of each object are privately held inside a defined class. Other objects do not have access to this class or the authority to make changes. They are only able to call a list of public functions or methods. This characteristic of data hiding provides greater program security and avoids unintended data corruption.

### Abstraction.
Objects only reveal internal mechanisms that are relevant for the use of other objects, hiding any unnecessary implementation code. The derived class can have its functionality extended. This concept can help developers more easily make additional changes or additions over time.

### Inheritance.
Classes can re-use code from other classes. Relationships and subclasses between objects can be assigned, enabling developers to re-use common logic while still maintaining a unique hierarchy. This property of OOP forces a more thorough data analysis, reduces development time and ensures a higher level of accuracy.

### Polymorphism.
Objects are designed to share behaviors and they can take on more than one form. The program will determine which meaning or usage is necessary for each execution of that object from a parent class, reducing the need to duplicate code. A child class is then created, which extends the functionality of the parent class. Polymorphism allows different types of objects to pass through the same interface.

## Benefits of OOP includes:

### Modularity.
Encapsulation enables objects to be self-contained, making troubleshooting and collaborative development easier.

### Reusability.
Code can be reused through inheritance, meaning a team does not have to write the same code multiple times.

### Productivity.
Programmers can construct new programs quicker through the use of multiple libraries and reusable code.

### Easily upgradable and scalable.
Programmers can implement system functionalities independently.

### Interface descriptions.
Descriptions of external systems are simple, due to message passing techniques that are used for objects communication.

### Security.
Using encapsulation and abstraction, complex code is hidden, software maintenance is easier and internet protocols are protected.

### Flexibility.
Polymorphism enables a single function to adapt to the class it is placed in. Different objects can also pass through the same interface.

For example, popular pure OOP languages include:
- Ruby
- Scala
- JADE
- Emerald

Programming languages designed primarily for OOP include:
- Java
- Python
- C++

Other programming languages that pair with OOP include:
- Visual Basic .NET
- PHP
- JavaScript

## SOLID
https://medium.com/@evon.dong3/solid-software-design-principles-interface-segregation-principle-81f603a0bf74

𝗦𝗢𝗟𝗜𝗗 𝗽𝗿𝗶𝗻𝗰𝗶𝗽𝗹𝗲𝘀 is a cornerstone in object-oriented programming that steers developers towards creating maintainable, scalable, and robust software architectures. They were introduced by Robert C. Martin (Uncle Bob), although they were influenced by earlier work from others.

𝟭. 𝗦𝗶𝗻𝗴𝗹𝗲 𝗥𝗲𝘀𝗽𝗼𝗻𝘀𝗶𝗯𝗶𝗹𝗶𝘁𝘆 𝗣𝗿𝗶𝗻𝗰𝗶𝗽𝗹𝗲 (𝗦𝗥𝗣):
Each class should have a single focus or responsibility, making the system modular and easier to manage. This means a class should have only one reason to change. When a class encapsulates a single responsibility, changes in specifications will likely affect fewer components, making maintenance less complex. It also reduces coupling between different components.

𝟮. 𝗢𝗽𝗲𝗻/𝗖𝗹𝗼𝘀𝗲𝗱 𝗣𝗿𝗶𝗻𝗰𝗶𝗽𝗹𝗲 (𝗢𝗖𝗣):
Software entities (classes, methods, etc.) should be open for extension but closed for modification, which promotes stability and extensibility. This means you can add a new functionality to a class without changing its existing code.

𝟯. 𝗟𝗶𝘀𝗸𝗼𝘃 𝗦𝘂𝗯𝘀𝘁𝗶𝘁𝘂𝘁𝗶𝗼𝗻 𝗣𝗿𝗶𝗻𝗰𝗶𝗽𝗹𝗲 (𝗟𝗦𝗣):
Subtypes (an object related to a parent object) should be substitutable for their base types, ensuring seamless integration and robustness. This means that if a class inherits some other class, you should be able to use it in the same way as the base class.

𝟰. 𝗜𝗻𝘁𝗲𝗿𝗳𝗮𝗰𝗲 𝗦𝗲𝗴𝗿𝗲𝗴𝗮𝘁𝗶𝗼𝗻 𝗣𝗿𝗶𝗻𝗰𝗶𝗽𝗹𝗲 (𝗜𝗦𝗣):
A class should not be forced to implement interfaces it does not use. This means creating specific interfaces for each class rather than having one large, all-encompassing one.

𝟱. 𝗗𝗲𝗽𝗲𝗻𝗱𝗲𝗻𝗰𝘆 𝗜𝗻𝘃𝗲𝗿𝘀𝗶𝗼𝗻 𝗣𝗿𝗶𝗻𝗰𝗶𝗽𝗹𝗲 (𝗗𝗜𝗣):
High-level modules should not depend on low-level ones; both should depend on abstractions, encouraging a decoupled architecture. Also, abstractions should not rely on details; details should depend on abstractions.

---

## Design Patterns
A software design pattern is a general, reusable solution to a commonly occurring problem within a given context in software design. They are like pre-made blueprints that can be customized to solve a recurring design problem in an application development. Through the several patterns they can be divided into 3 main family patterns: **Creational, Structural & Behavioral**.

### CREATIONAL PATTERNS

**Factory** Method Provides an interface for creating objects in a super-class, but allows sub-classes to alter the type of objects that will be created.

**Abstract Factory** produce families of related objects without specifying their concrete classes.

**Builder** constructs complex objects step by step. The pattern allows to produce different types and representations of an object using the same construction code.

**Prototype** copy existing objects without making its code dependent on their classes. The common use of this pattern is on unit testings.

**Singleton** ensure that a class has only one instance, while providing a global access point to this instance.

### STRUCTURAL PATTERNS

**Adapter** allows objects with incompatible interfaces to collaborate.

**Bridge** splits a large class or a set of closely related classes into two separate hierarchies, abstraction and implementation, which can be developed independently of each other.

**Composite** compose objects into tree structures and then work with these structures as if they were individual objects.

**Decorator** attaches new behaviors to objects by placing these objects inside special wrapper objects that contain the behaviors.

**Facade** provides a simplified interface to a library, a framework, or any other complex set of classes.

**Flyweight** fits more objects into the available amount of RAM by sharing common parts of state between multiple objects instead of keeping all of the data in each object.

**Proxy** provides a substitute or placeholder for another object. A proxy controls access to the original object, allowing you to perform something either before or after the request gets through to the original object.

### BEHAVIORAL PATTERNS

**Chain of Responsibility** passes requests along a chain of handlers. Upon receiving a request, each handler decides either to process the request or to pass it to the next handler in the chain.

**Iterator** traverses elements of a collection without exposing its underlying representation (list, stack, tree, etc.)

**Memento** saves and restore the previous state of an object without revealing the details of its implementation.

**State** lets an object alter its behavior when its internal state changes. It appears as if the object changed its class.

**Template Method** defines the skeleton of an algorithm in the super-class but lets sub-classes override specific steps of the algorithm without changing its structure.

**Command** turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request's execution, and support undo-able operations.

**Mediator** reduces chaotic dependencies between objects. The pattern restricts direct communications between the objects and forces them to collaborate only via a mediator object.

**Observer** defines a subscription mechanism to notify multiple objects about any events that happen to the object they're observing.

**Strategy** defines a family of algorithms, put each of them into a separate class, and make their objects interchangeable.

**Visitor** separates algorithms from the objects on which they operate.

---

𝗪𝗵𝗲𝗻 𝘁𝗼 𝘀𝗲𝗹𝗲𝗰𝘁 𝗗𝗲𝘀𝗶𝗴𝗻 𝗣𝗮𝘁𝘁𝗲𝗿𝗻𝐬?

Choosing the correct design pattern in software engineering is critical to practical problem-solving.

This post will try to simplify the process, helping you decide between patterns based on specific needs.

To select a pattern, we must first go through the problem identification. If the problem is related to:

 🔸 Object Creation? → Creational Patterns
 🔸 Object Assembly? → Structural Patterns
 🔸 Object Interactions? → Behavioral Patterns

1. Singleton: Ensures only one instance exists.
2. Factory Method: Delegates object instantiation to subclasses.
3. Abstract Factory: Creates related object families without specifying their concrete classes.
4. Prototype: Clones objects for a prototypical instance.
5. Builder: Constructs complex objects step by step.
6. Adapter: Bridges incompatible interfaces.
7. Bridge: Separates abstraction from implementation.
8. Composite: Treats single and composite objects uniformly.
9. Decorator: Adds behaviors to objects dynamically.
10. Facade: Simplifies complex system interfaces.
11. Flyweight: Shares objects to reduce memory.
12. Proxy: Controls object access.
13. Observer: Notifies changes to multiple objects.
14. Strategy: Encapsulates interchangeable algorithms.
15. Command: Encapsulates a request as an object.
16. State: Changes object behavior with internal state.
17. Visitor: Adds operations to object structures without modifying them.
18. Memento: Captures and restores object states externally.
19. Iterator: Sequentially accesses elements of a collection.
20. Mediator: Centralizes complex communications.
21. Chain of Responsibility: Passes requests along a chain of handlers.
22. Template Method: Defines the skeleton of an algorithm.

---

## Dependency Injection
https://en.wikipedia.org/wiki/Dependency_injection \
https://www.manning.com/books/dependency-injection-principles-practices-patterns \
https://www.codemag.com/Article/2212041/Dependency-Injection-and-Service-Container-in-Laravel

---
The Four Major Roles in Dependency Injection
To implement dependency injection into your code, there are four main roles you need to know about:

The service you want to use, such as a payment service or an email service.
The client that uses the service. This is the class that you'll inject the service into.
An interface that's used by the client and implemented by the service. This is optional. You can inject a concrete class without an interface. But by injecting an interface, you get the chance to swap out concrete implementations at runtime.
The injector creates a service instance and injects it into the client. This is usually known as a dependent injection container. Its responsibility is to manage object instantiation and keep track of their dependencies.
---

Dependency Injection is a programming technique in which an object or function receives other objects or functions programming required for itself instead of having to construct it. Thus dependency injection aims to separate the concerns of constructing objects and using them, leading to loosely coupled programs.

Object or function that receives a dependency injection becomes a client which uses the injection as its dependencies.

Because dependency injection separates how objects are constructed from how they are used, they must not be the client, as this would create a circular dependency.

DI Container: a software library that provides DI functionality and allows automating many of the tasks involved in Object Composition, Interception, and Lifetime Management. DI Containers are also known as Inversion of Control (IoC) Containers.

The injection has one of four common roles:

**As Service** \
A service is any class which contains useful functionality. In turn, a client is any class.

**As Interface** \
Clients should not know how their dependencies are implemented, only their names and API. A service which retrieves emails, for instance, may use the IMAP or POP3 protocols behind the scenes, but this detail is likely irrelevant to calling code that merely wants an email retrieved. By ignoring implementation details, clients do not need to change when their dependencies do.

**As Injector** \
The injector, sometimes also called as an assembler, container, provider or factory, introduces services into the client where can be many objects working together.

**As Analogy** \
As an analogy, the injection is unimportant to the client as it only carries it to their destination. As such, which dependency was 'injected' with, the client behaves as factory which can switch between any kind of dependencies as needed.

---

## Bounded Context
Bounded Context refers to the limits defined around a specific sub-system. Within this boundary, all terms and concepts have specific and unambiguous meanings. It provides clarity and ensures that all services inside these boundaries speak the same language.

## Difference between Entity, Model and DTO

**Entities** may be part of a business domain. Thus, they can implement behavior and be applied to different use cases within the domain.

**DTOs** *Data Transfer Objects* are used only to transfer data from one processor context to another.

https://www.linkedin.com/pulse/difference-between-entity-dto-what-use-instead-omar-ismail/

* Entity - is a class with an ID. In the case of relational DB it's usually a class that's mapped to a DB table with some primary key.
* DTO is a class that maps well on what you're sending over the network. E.g. if you exchange JSON or XML data, it usually has fields just enough to fill those requests/responses. Note, that it may have fewer or more fields than an Entity.
* VO (Value Object) is a class-value. E.g. you could create class like Grams or Money - it will contain some primitives (e.g. some double value) and it's possible to compare Value Objects using these primitives. They don't have a database ID. They help replacing primitives with more object-oriented classes related to our particular domain.
* Domain Model contains all Entities and Value Objects. And some other types of classes depending on the classification you use.

https://stackoverflow.com/questions/72025894/list-differences-dto-vo-entity-domain-model

The definition of these terms is quite ambiguous. You will find different definitions at different places.

Entity: An entity represents a single instance of your domain object saved into the database as a record. It has some attributes that we represent as columns in our tables.

Model: A model typically represents a real world object that is related to the problem or domain space. In programming, we create classes to represent objects. These classes, known as models, have some properties and methods (defining objects behavior).

ViewModel: The term ViewModel originates from the MVVM (Model View ViewModel) design pattern. There are instances in which the data to be rendered by the view comes from two different objects. In such scenarios, we create a model class which consists of all properties required by the view. It’s not a domain model but a ViewModel because, a specific view uses it. Also, it doesn’t represent a real world object.

DataModel: In order to solve a problem, objects interact with each other. Some objects share a relationship among them and consequently, form a data model that represents the objects and the relationship between them.

In an application managing customer orders, for instance, if we have a customer and order object then these objects share a many to many relationship between them. The data model is eventually dependent on the way our objects interact with each other. In a database, we see the data model as a network of tables referring to some other tables.

https://stackoverflow.com/questions/8743995/what-is-difference-between-a-model-and-an-entity

In order to get acquainted with these you should read:
* Enterprise Application Patterns by Fowler. Mentions Value Object and Domain Model.
* Domain Driven Design by Eric Evans. Mentions Entity, Value Object and Domain Model.
* And maybe get acquainted with Java EE design patterns. They mention DTO. But these are pretty badly written articles (if they are still even available on the internet). Confusingly, they also had Value Object which was defined very similarly to DTO, but no one uses that definition of VO.

---

#### The size of your variables matters.
https://www.youtube.com/watch?v=hwyRnHA54lI

#### The purest coding style, where bugs are near impossible
https://www.youtube.com/watch?v=HlgG395PQWw

#### Premature Optimization
https://www.youtube.com/watch?v=tKbV6BpH-C8

#### Instal·lació Arch Linux
https://www.youtube.com/watch?v=KaWg4eC10mQ

#### 20 System Design Concepts Explained in 10 Minutes
https://www.youtube.com/watch?v=i53Gi_K3o7I

#### System Design Interview: A Step-By-Step Guide
https://www.youtube.com/watch?v=i7twT3x5yv8

#### Los 6 patrones de diseño más utilizados
https://www.youtube.com/watch?v=JI_THVXPToQ

#### 5 Patrones de Diseño en BACKEND
https://www.youtube.com/watch?v=IOGLHb4jKv8
