# API
API stands for **application programming interface**, is an abstraction of functions, procedures and a set of rules that define how applications or devices can connect to and communicate with each other.

#### Top 6 Most Popular API Architecture Styles
https://www.youtube.com/watch?v=4vLxWqE94l4

There are four widely agreed-upon types of web API and these are: \
• **Open API**: any client can access. \
• **Partner API**: only authorized clients may access. \
• **Internal API**: only internal clients may access. \
• **Composite API**: combination of multiple API types.

## Most common API architectures standards in use

**SOAP**
The SOAP stands for Simple Object Access Protocol. It’s an official protocol for transmitting data across networks and can be used to build an API. It’s standardized and utilizes **only XML** to encode information. SOAP strictly defines how messages should be sent and what must be included in them so, is often implemented for internal data transfers that require high security. The advantage overall is that it works over any communication protocol, not just HTTP.

**REST** https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm
The REST stands for Representational State Transfer. Is an abstract architectural hybrid design pattern for distributed hypermedia systems. REST ignores the details of component implementation and protocol syntax in order to focus on the roles of components, interaction constraints to define a uniform connector interface, the interpretation of significant data elements, and the easy maintenance and scalability to exchange application data between systems.

**RPC**
The RPC stands for Remote Procedural Call. It’s the most straightforward and strict protocol to invoke processes executing scripts on a server or for internal systems to make basic process requests, especially many at once. RPC API may employ either JSON or XML protocol in their calls and because it’s transport-agnostic, it’s used only for HTTP but also for crypto transactions.

**Uniform interface**
Multiple architectural constraints help in obtaining a uniform interface and guiding the behavior of components by: \
• Identification of resources – The interface must uniquely identify each resource involved in the interaction between the client and the server. \
• Manipulation of resources through representations – The resources should have uniform representations in the server response. API consumers should use these Representations to modify the resources state in the server. \
• Self-descriptive messages – Each resource representation should carry enough information to describe how to process the message. It should also provide information of the additional actions that the client can perform on the resource. \
• Hypermedia as the engine of application state – The client should have only the initial URI of the application. The client application should dynamically drive all other resources and interactions with the use of hyperlinks.

**Statelessness**
In REST architecture, statelessness refers to a communication method in which the server completes every client request independently of all previous requests. Clients can request resources in any order, and every request is stateless or isolated from other requests. This REST API design constraint implies that the server can completely understand and fulfill the request every time.

**Layered system**
In a layered system architecture, the client can connect to other authorized intermediaries between the client and server, and it will still receive responses from the server. Servers can also pass on requests to other servers. You can design your RESTful web service to run on several servers with multiple layers such as security, application, and business logic, working together to fulfill client requests. These layers remain invisible to the client.

**Cacheability**
RESTful web services support caching, which is the process of storing some responses on the client or on an intermediary to improve server response time. For example, suppose that you visit a website that has common header and footer images on every page. Every time you visit a new website page, the server must resend the same images. To avoid this, the client caches or stores these images after the first response and then uses the images directly from the cache. RESTful web services control caching by using API responses that define themselves as cacheable or non-cacheable.

**Code on demand**
In REST architectural style, servers can temporarily extend or customize client functionality by transferring software programming code to the client. For example, when you fill a registration form on any website, your browser immediately highlights any mistakes you make, such as incorrect phone numbers. It can do this because of the code sent by the server.

## REST API
REST and RESTful API are the same according to the documentation of all the major vendors like Google, Amazon, Red Hat, between others. It’s a web service designed by the principles of the REST constraints and architectural style, built on a server for the exchange of data with an application from a client, using HTTP protocol to perform CRUD actions through its correspondent analogue verbal term in HTTP methods: GET, POST, PUT and DELETE.

Most professionals REST API offer a secure connection protocol and API Keys or Web Tokens for Authentication on its header to make request and response successfully and a developers guide.

#### Top 6 Most Popular API Architecture Styles
https://www.youtube.com/watch?v=4vLxWqE94l4

#### The Difference Between REST API and RESTful API
https://www.geeksforgeeks.org/know-the-difference-between-rest-api-and-restful-api/ \
https://www.redhat.com/en/topics/api/what-is-a-rest-api \
https://restfulapi.net/http-status-codes/ \
https://stackoverflow.com/questions/32752578/whats-the-appropriate-http-status-code-to-return-if-a-user-tries-logging-in-wit \
https://www.youtube.com/watch?v=-mN3VyJuCjM \
https://restfulapi.net/resource-naming/ \
https://radixweb.com/blog/rest-vs-restful-api \
https://stackoverflow.com/questions/1568834/whats-the-difference-between-rest-restful

## Improving API Performance

#### Top 7 Ways to 10x Your API Performance
https://www.youtube.com/watch?v=zvWKqUiovAM

####
