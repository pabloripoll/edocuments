# Network Design

An HTTP server cannot automatically initiate a connection to a browser. As a result, the web browser is the initiator. What should we do next to get real-time updates from the HTTP server?

Both the web browser and the HTTP server could be responsible for this task.

- Web browsers do the heavy lifting: short polling or long polling. With short polling, the browser will retry until it gets the latest data. With long polling, the HTTP server doesn’t return results until new data has arrived.

- HTTP server and web browser cooperate: WebSocket or SSE (server-sent event). In both cases, the HTTP server could directly send the latest data to the browser after the connection is established. The difference is that SSE is uni-directional, so the browser cannot send a new request to the server, while WebSocket is fully-duplex, so the browser can keep sending new requests.

## Polling

Polling is a solid option when there is some infrastructural limitation that prevents the use of webhooks.

- Short Polling
Client continuously sends a request to a resource which response back with null or data to close connection *(commoly JSON for its weight)* in a given period of time. The characteristic of this type of connection design is that the application consumes the memory resources of the client, being good when resource has it limited.

- Long Polling
Long polling is like short polling where client sends a repeatedly request to a source but in this case, the resource will keep the connection open until it has some state to reponse. The characteristic of this type of connection design is for security

## WebSocket

The WebSocket protocol was standardized by the IETF as RFC 6455 in 2011.

WebSocket is a computer communications protocol, providing simultaneous two-way communication channels over a single Transmission Control Protocol (TCP) connection.

The advantage of this type of connection design is when the resource has memory.

It is used for:
- Chatting
- Live Feed
- Multipleyer gaming
- Showing client progress/loggin

#### WebSockets Crash Course - Handshake, Use-cases, Pros & Cons and more
https://www.youtube.com/watch?v=2Nt-ZrNP22A

#### Webhooks vs Websockets vs HTTP Streaming - Which Event-Driven API to use?
https://www.youtube.com/watch?v=6RvlKYgRFYQ

## Webhook

Webhook is like having a built-in notification system. One way communication. You don’t continuously ask for information.

Instead you create an endpoint in your application server and provide it as a callback to the external service (such as a payment processor or a shipping vendor)

Every time something interesting happens, the external service calls the endpoint and provides the information.

This makes webhooks ideal for dealing with real-time updates because data is pushed to your application as soon as it’s available.

So, when to use Polling or Webhook?
 Also, with webhooks there is a risk of missed notifications due to network issues, hence proper retry mechanisms are needed.

Webhooks are recommended for applications that need instant data delivery. Also, webhooks are efficient in terms of resource utilization especially in high throughput environments.

## Server Sent Event
Server-Sent Events is a server push technology enabling a client to receive automatic updates from a server via an HTTP connection, and describes how servers can initiate data transmission towards clients once an initial client connection has been established. https://developer.mozilla.org/en-US/docs/Web/API/EventSource

What is Event Driven Architecture (EDA)?
https://www.youtube.com/watch?v=o2HJCGcYwoU


### Socket
A socket is a bi-directional data transfer mechanism. They are used to transfer data between two processes. The two processes can be running on the same system as Unix-domain or loopback sockets, or on different systems as network sockets. Al in all is an internal system communication network.

- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_for_real_time/7/html/reference_guide/chap-sockets
- https://unix.stackexchange.com/questions/16311/what-is-a-socket

#### Polling vs. Webhook
https://www.linkedin.com/embed/feed/update/urn:li:share:7193827964772384768

#### Webhook vs Websocket
https://www.youtube.com/watch?v=1hE-bLSCcDQ


## Polling vs Long Polling vs Webhooks vs SSE

Four ways to get updates from a server. Each one makes a different tradeoff between simplicity, efficiency, and real-time delivery.

Here's how they compare:

- Polling: The client sends a request every few seconds asking "anything new?" The server responds immediately, whether or not there's new data. Most of those requests come back empty, wasting client and server resources. For use cases like an order status page where a small delay is acceptable, polling is the simplest option to implement.

- Long Polling: The client sends a request, and the server keeps the HTTP connection open until new data is available or a timeout occurs. This means fewer empty responses compared to regular polling. Some chat applications used this pattern to deliver messages closer to real-time communication.

- Server-Sent Events (SSE): The client opens a persistent HTTP connection, and the server streams events through it as they're generated. It is one-way, lightweight, and built on plain HTTP. Many AI responses that appear token by token are delivered through SSE, streaming each chunk over a single open connection.

- Webhooks: Instead of the client asking for updates, the service sends an HTTP POST to a pre-registered callback URL whenever a specific event occurs. Stripe uses this for payment confirmations. GitHub uses it for push events. The client never polls or holds a connection open, it just waits for the server to call.

Many systems don't rely on a single pattern. You may use polling for order status, SSE for streaming AI responses, and webhooks for payment confirmations.


