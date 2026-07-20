# API Vs SDK!

API (Application Programming Interface) and SDK (Software Development Kit) are essential tools in the software development world, but they serve distinct purposes:

API: An API is a set of rules and protocols that allows different software applications and services to communicate with each other.

1. It defines how software components should interact.
2. Facilitates data exchange and functionality access between software components.
3. Typically consists of endpoints, requests, and responses.

SDK: An SDK is a comprehensive package of tools, libraries, sample code, and documentation that assists developers in building applications for a particular platform, framework, or hardware.

1. Offers higher-level abstractions, simplifying development for a specific platform.
2. Tailored to specific platforms or frameworks, ensuring compatibility and optimal performance on that platform.
3. Offer access to advanced features and capabilities specific to the platform, which might be otherwise challenging to implement from scratch.

The choice between APIs and SDKs depends on the development goals and requirements of the project.

Over to you: Which do you find yourself gravitating towards – APIs or SDKs – Every implementation has a unique story to tell. What's yours?

# 6 Must Know Software Architectural Patterns

Event-Driven Architecture:
Decoupled Components and Asynchronous Communication.
Application: Ideal for systems where events trigger actions, fostering scalability and responsiveness.

Layered Architecture:
Hierarchical Structure with Distinct Layers (Presentation, Business Logic, Data).
Application: Common in enterprise applications, enhancing maintainability through compartmentalization and modular development.

Monolithic Architecture:
Unified Codebase and Deployment Unit.
Application: Suited for smaller applications or simplicity-focused instances. Streamlines development and deployment with potential scaling challenges.

Microservices Architecture:
Distributed System with Independent, Interoperable Services.
Application: Ideal for large and intricate systems, improving scalability, fault isolation, and enabling independent service development.

Model-View-Controller (MVC):
Segregation of Concerns into Model, View, and Controller Components.
Application: Common in web applications, enhancing code organization and maintenance by separating complex UI logic.

Master-Slave Architecture:
Centralized Control (Master) with Multiple Worker Nodes (Slaves).
Application: Ubiquitous in distributed computing, optimizing parallel processing and load balancing.

# Linux file system explained.

The Linux file system used to resemble an unorganized town where individuals constructed their houses wherever they pleased. However, in 1994, the Filesystem Hierarchy Standard (FHS) was introduced to bring order to the Linux file system.

By implementing a standard like the FHS, software can ensure a consistent layout across various Linux distributions. Nonetheless, not all Linux distributions strictly adhere to this standard. They often incorporate their own unique elements or cater to specific requirements.

To become proficient in this standard, you can begin by exploring. Utilize commands such as "cd" for navigation and "ls" for listing directory contents. Imagine the file system as a tree, starting from the root (/). With time, it will become second nature to you, transforming you into a skilled Linux administrator.

Have fun exploring!

Over to you: which directory did you use most frequently?

# How do companies ship code to production?

The following describes a typical software delivery workflow. Companies have diverse environments using different tools. This is one representative workflow that demonstrates some common practices. Details will differ across organizations. With that context established, the general steps are as follows:

Step 1: The product owner creates requirements and stories.

Step 2: The development team prioritizes stories and organizes sprints.

Step 3: Developers commit code to the version control system.

Step 4: An automation server builds the code and runs tests. Code coverage and quality checks are performed.

Step 5: If the build succeeds, artifacts are stored in the artifact repository. The build is deployed to the developer environment.

Step 6: Features are tested independently in multiple isolated environments.

Step 7: The QA team tests the features in QA environments. Various forms of testing are performed.

Step 8: Once verified, the build is deployed to a user acceptance testing environment for final validation.

Step 9: Release candidates that pass testing can be deployed to production based on the release schedule. Feature flags and incremental rollout techniques manage risk.

Step 10: The site reliability team monitors production and reports issues. Teams prioritize and fix issues according to defined policies.

How does your organization's software delivery workflow differ from the process outlined here? What tools and techniques have you found most effective? I'm interested to hear about the various approaches across the industry.

# 6 Popular API Architecture Styles you MUST KNOW

gRPC: Stands for "Google Remote Procedure Call." It is an open-source remote procedure call (RPC) framework developed by Google. gRPC uses HTTP/2 for transport, Protocol Buffers as the interface description language, and provides features such as bidirectional streaming and flow control.

SOAP: Stands for "Simple Object Access Protocol." It is a protocol for exchanging structured information in web services. SOAP uses XML for message format and typically relies on HTTP or SMTP as the transport protocol.

GraphQL: A query language for APIs and a runtime for executing those queries with your existing data. GraphQL provides a more efficient, powerful, and flexible alternative to the traditional REST API.

Webhook: A mechanism for event notification in web development. Webhooks allow web applications to send real-time data to other applications when specific events occur.

REST: Stands for "Representational State Transfer." It is an architectural style for designing networked applications. RESTful APIs use standard HTTP methods (GET, POST, PUT, DELETE) to perform CRUD operations on resources, and data is typically exchanged in JSON format.

WebSocket: A communication protocol that provides full-duplex communication channels over a single TCP connection. It is commonly used for real-time applications, such as chat applications and online gaming, where low latency communication is crucial.

# GET, POST, PUT... Common HTTP “verbs” in one figure. Next week's topics will be listed at the end.

1. HTTP GET
This retrieves a resource from the server. It is idempotent. Multiple identical requests return the same result.

2. HTTP PUT
This updates or Creates a resource. It is idempotent. Multiple identical requests will update the same resource.

3. HTTP POST
This is used to create new resources. It is not idempotent, making two identical POST will duplicate the resource creation.

4. HTTP DELETE
This is used to delete a resource. It is idempotent. Multiple identical requests will delete the same resource.

5. HTTP PATCH
The PATCH method applies partial modifications to a resource.

6. HTTP HEAD
The HEAD method asks for a response identical to a GET request but without the response body.

7. HTTP CONNECT
The CONNECT method establishes a tunnel to the server identified by the target resource.

8. HTTP OPTIONS
This describes the communication options for the target resource.

9. HTTP TRACE
This performs a message loop-back test along the path to the target resource.

# The Five Stages of Software Release

Stage 1: Planning
Objective: Define vital release requirements.Process:
Product owners meticulously gather and outline the essential prerequisites.

Stage 2: Development
Objective: Craft and compile code changes.
Process: Developers commit changes to version control (e.g., Git) and initiate the build process.

Stage 3: Build and Pack Brilliance
Objective: Generate a deployable build for testing.
Process: The application is deployed to a development environment, ready for rigorous testing.

Stage 4: Testing Vigilance
Objective: Rigorously assess features for quality assurance.
Process: QA engineers conduct thorough testing, identifying and reporting bugs for prompt resolution.

Stage 5: Release Culmination
Objective: Deploy features to production after successful testing.
Process: Features that pass testing and User Acceptance Testing (UAT) gracefully transition to the production environment.