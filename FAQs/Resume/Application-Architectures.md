# Application Types

## Uniform Interface
Uniform interface is the defined way a client interacts with the server independent of the device or application.

Multiple architectural constraints help in obtaining a uniform interface and guiding the behavior of components by:

- Identification of resources – The interface must uniquely identify each resource involved in the interaction between the client and the server.

- Manipulation of resources through representations – The resources should have uniform representations in the server response. API consumers should use these representations to modify the resources state in the server.

- Self-descriptive messages – Each resource representation should carry enough information to describe how to process the message. It should also provide information of the additional actions that the client can perform on the resource.

- Hypermedia as the engine of application state – The client should have only the initial URI of the
application. The client application should dynamically drive all other resources and interactions with the
use of hyperlinks.

## Progressive web apps
A progressive web app (PWA) is an app that's built using web platform technologies, but that provides a user experience like that of a platform-specific app.

Like a website, a PWA can run on multiple platforms and devices from a single codebase. Like a platform-specific app, it can be installed on the device, can operate while offline and in the background, and can integrate with the device and with other installed apps.

https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps

---

## System Design

### Monolith Architecture
Monolithic architecture is a software architecture style where an application is designed and developed as a single unit or a monolith. In a monolithic architecture, all the components of the application, such as the user interface, business logic, data access layer, and other supporting functionalities, are tightly integrated and deployed together as a single package.

The monolithic architecture typically follows a layered architecture style, with distinct layers for presentation, business logic, and data access. The code for each layer is often organized into separate modules or packages within the monolith, but they are still tightly coupled and dependent on each other.

In a monolithic architecture, the entire application runs on a single process and is deployed on a single server or a cluster of servers. This can provide better performance and simplicity, but it also makes it harder to scale and update the application, as any changes or updates to one component of the application require redeploying the entire monolith.

Overall, monolithic architecture is often suitable for smaller applications with straightforward requirements, but it can become difficult to manage and maintain as the application grows in size and complexity.

### Service Oriented Architecture - S.O.A.
SOA is an approach to designing and building software systems that focuses on creating independent and reusable components, or “services,” which can be combined to create larger applications.

Think of it like a restaurant. Each dish on the menu is a service that the restaurant provides. Customers can order individual dishes or combine them to create a full meal. The kitchen prepares each dish independently and they can be combined in any number of ways to meet the customer’s needs.

In SOA, each service is like a dish on the menu, and the larger application is like a full meal. Each service can be developed and maintained independently, and they can be combined in different ways to meet the needs of different applications.

By using this approach, developers can create applications more quickly and with greater flexibility. If a new application needs a particular service, it can be added without having to rewrite the entire system. Similarly, if a service needs to be updated or replaced, it can be done without affecting the other services in the system.

### Micro Service Architecture
Microservices is an architectural style that focuses on breaking down applications into small, independent services that are deployed separately and communicate with each other through lightweight APIs or messaging systems. Each microservice is responsible for a specific function or business capability and can be developed, deployed, and scaled independently of other microservices. Microservices are often associated with distributed architectures where services can be deployed across multiple servers or even across different cloud providers.

https://pathum-liyanagama.medium.com/monolithic-vs-service-oriented-architecture-soa-vs-microservices-cbd6334e4ae3

https://www.atatus.com/blog/monolithic-vs-services-oriented-vs-microservices/

https://www.atlassian.com/microservices/cloud-computing/microservices-vs-web-services


## Services vs Micro-services
Microservices are a modular, component-based approach for building applications, while web services are typically built as monolithic applications. Microservices are typically deployed as independent, self-contained services, while web services are deployed as a single unit.

### Headless Architectures

#### What Is A Webhook - Why Is It Key To Headless Architectures?
https://youtu.be/Mfzucn4f9Xk

---

## Architecture Patterns
Architecture patterns are blueprints for structuring software applications. They abstract solutions to common issues, ensuring efficiency, scalability, and maintainability. Here is the list of the most essential architectural patterns:

### MVC (Model-View-Controller)
It is one of the earliest and most adopted design patterns. Its primary goal is to separate the application's data, user interface, and control logic into three interconnected components. Here, the Model manages data and logic, the View displays the information, and the controller connects the Model and View, handling user input. Usage: For Web applications with a clear separation between data handling and UI.

### MVP (Model-View-Presenter)
The pattern evolved from MVC, aiming to address its shortcomings in event-driven environments by decoupling the View from the Model, with the Presenter acting as a middleman. Here, the Model manages data, views display data, and sends user commands to the Presenter, while the Presenter retrieves data from the Model and presents it to the View. Usage: Applications emphasizing testing and UI logic, such as Android apps.

### MVI (Model-View-Intent)
MVI is a reactive architecture embracing unidirectional data flow, ensuring that, given a state, the UI remains consistent. Here, the Model represents the state, View reflects the state, while intent represents user actions that change the state. Usage: Reactive applications or frameworks like RxJava with a focus on state consistency.

### MVVM (Model-View-ViewModel)
MVVM arose to address complexities in UI development, promoting a decoupled approach with the ViewModel handling view logic without knowing the UI components. Here, the Model manages and displays data, while ViewModel holds and contains UI-related data. Usage: UI-rich applications or platforms with data-binding, such as WPF or Android with LiveData.

### MVVM-C (MVVM with Coordinator)
MVVM-C builds upon MVVM, introducing the Coordinator to handle navigation, decoupling it from View and ViewModel. Usage: larger applications, especially iOS, where complex navigation needs separation from view logic.

### VIPER (View-Interactor-Presenter-Entity-Router)
VIPER is a modular architecture akin to Clean Architecture. It emphasizes testability and the Single Responsibility Principle by breaking down application logic into distinct components. Here, the View displays what the Presenter sends, the interactor contains business logic per use case, the Presenter contains view logic for preparing content, the entity includes a primary model object, and the router contains navigation logic. Usage: Complex applications, especially iOS, need modularity, testability, and clarity.

#### Everything You NEED to Know About Client Architecture Patterns
https://www.youtube.com/watch?v=I5c7fBgvkNY

---

### HEXAGONAL
The hexagonal architecture was invented by Alistair Cockburn in an attempt to avoid known structural pitfalls in object-oriented software design, such as undesired dependencies between layers and contamination of user interface code with business logic, and published in 2005.

Hexagonal architecture is a pattern that uses the mechanism of ports and adapters to achieve separation of concerns and isolate external systems and other external code such as user interfaces and databases from the core application.

https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)

### DDD
Domain-driven design (DDD) is a major software design approach,[1] focusing on modeling software to match a domain according to input from that domain's experts. https://en.wikipedia.org/wiki/Domain-driven_design
https://medium.com/@jonathanloscalzo/domain-driven-design-principios-beneficios-y-elementos-primera-parte-aad90f30aa35

---

## API (subir esto a tipos de applicaciones)
API stands for application programming interface, is an abstraction of functions, procedures and a set of rules that define how applications or devices can connect to and communicate with each other. There are four widely agreed-upon types of web API and these are:
- Open API, any client can access.
- Partner API, only authorized clients may access.
- Internal API, only internal clients may access.
- Composite API, combination of multiple API types.

The most popular API architectures standards in use are REST, SOAP, and RPC. The RPC stands for Remote Procedural Call. It’s the most straightforward and strict protocol to invoke processes executing scripts on a server or for internal systems to make basic process requests, especially many at once. RPC API may employ either JSON or XML protocol in their calls and because it’s transport-agnostic, it’s used only for HTTP but also for crypto transactions.

REST and RESTful API are the same according to the documentation of all the major vendors like Google, Amazon, Red Hat, between others. It’s a web service designed by the principles of the REST constraints and architectural style, built on a server for the exchange of data with an application from a client, using HTTP protocol to perform CRUD actions through its correspondent analogue verbal term in HTTP methods: GET, POST, PUT and DELETE.
Most professionals REST API offer a secure connection protocol and API Keys or Web Tokens for Authentication on its header to make request and response successfully and a developers guide.

### REST
https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm \
The REST stands for Representational State Transfer. Is an abstract architectural hybrid design pattern for distributed hypermedia systems. REST ignores the details of component implementation and protocol syntax in order to focus on the roles of components, interaction constraints to define a uniform connector interface, the interpretation of significant data elements, and the easy maintenance and scalability to exchange application data between systems.

### Statelessness
In REST architecture, statelessness refers to a communication method in which the server completes every client request independently of all previous requests. Clients can request resources in any order, and every request is stateless or isolated from other requests. This REST API design constraint implies that the server can completely understand and fulfill the request every time.

### Layered system
In a layered system architecture, the client can connect to other authorized intermediaries between the client and server, and it will still receive responses from the server. Servers can also pass on requests to other servers. You can design your RESTful web service to run on several servers with multiple layers such as security, application, and business logic, working together to fulfill client requests. These layers remain invisible to the client.

### Cacheability
RESTful web services support caching, which is the process of storing some responses on the client or on an intermediary to improve server response time. For example, suppose that you visit a website that has common header and footer images on every page. Every time you visit a new website page, the server must resend the same images. To avoid this, the client caches or stores these images after the first response and then uses the images directly from the cache. RESTful web services control caching by using API responses that define themselves as cacheable or non-cacheable.

### Code on demand
In REST architectural style, servers can temporarily extend or customize client functionality by transferring software programming code to the client. For example, when you fill a registration form on any website, your browser immediately highlights any mistakes you make, such as incorrect phone numbers. It can do this because of the code sent by the server.

API Design 101: From Basics to Best Practices: https://www.youtube.com/watch?v=7QfswaV0re4

## OpenAPI

#### REST API and OpenAPI: It’s Not an Either/Or Question
https://www.youtube.com/watch?v=pRS9LRBgjYg


## ---
Explaining 9 types of API testing.

🔹 Smoke Testing
This is done after API development is complete. Simply validate if the APIs are working and nothing breaks.

🔹 Functional Testing
This creates a test plan based on the functional requirements and compares the results with the expected results.

🔹 Integration Testing
This test combines several API calls to perform end-to-end tests. The intra-service communications and data transmissions are tested.

🔹 Regression Testing
This test ensures that bug fixes or new features shouldn’t break the existing behaviors of APIs.

🔹 Load Testing
This tests applications’ performance by simulating different loads. Then we can calculate the capacity of the application.

🔹 Stress Testing
We deliberately create high loads to the APIs and test if the APIs are able to function normally.

🔹 Security Testing
This tests the APIs against all possible external threats.

🔹 UI Testing
This tests the UI interactions with the APIs to make sure the data can be displayed properly.

🔹 Fuzz Testing
This injects invalid or unexpected input data into the API and tries to crash the API. In this way, it identifies the API vulnerabilities.

## gRPC
https://www.youtube.com/shorts/JVenO9-d6J4