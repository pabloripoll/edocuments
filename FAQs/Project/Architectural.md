
Linux: \
Unwrittable file: $ chattr +i filename \
Revert to writtable file: $ chattr -i filename

What does a typical microservice architecture look like? 👇
.
.
The diagram below shows a typical microservice architecture.

🔹Load Balancer: This distributes incoming traffic across multiple backend services.

🔹CDN (Content Delivery Network): CDN is a group of geographically distributed servers that hold static content for faster delivery. The clients look for content in CDN first, then progress to backend services.

🔹API Gateway: This handles incoming requests and routes them to the relevant services. It talks to the identity provider and service discovery.

🔹Identity Provider: This handles authentication and authorization for users.

🔹Service Registry & Discovery: Microservice registration and discovery happen in this component, and the API gateway looks for relevant services in this component to talk to.

🔹Management: This component is responsible for monitoring the services.

🔹Microservices: Microservices are designed and deployed in different domains. Each domain has its own database. The API gateway talks to the microservices via REST API or other protocols, and the microservices within the same domain talk to each other using RPC (Remote Procedure Call).

Benefits of microservices:
- They can be quickly designed, deployed, and horizontally scaled.
- Each domain can be independently maintained by a dedicated team.
- Business requirements can be customized in each domain and better supported, as a result.

Over to you: 1). What are the drawbacks of the microservice architecture?
2). Have you seen a monolithic system be transformed into microservice architecture? How long does it take?

https://media.licdn.com/dms/image/D4E22AQE8_JmveeMrng/feedshare-shrink_800/0/1694360684716?e=1697673600&v=beta&t=9IZUBRI-yRWXshJ6cMCxMXWK2NzkIP2e251FYzyN6ig

--------------------------------


In software development, architecture plays a crucial role in shaping the structure and behavior of software systems. It provides a blueprint for system design, detailing how components interact with each other to deliver specific functionality. They also offer solutions to common problems, saving time and effort and leading to more robust and maintainable systems.

However, with the vast array of architectural styles and patterns available, it can take time to discern which approach best suits a particular project or system. Aims to shed light on these concepts, helping you make informed decisions in your architectural endeavors.

To help you navigate the vast landscape of architectural styles and patterns, there is a cheat sheet that encapsulates all. This cheat sheet is a handy reference guide that you can use to quickly recall the main characteristics of each architectural style and pattern.

https://media.licdn.com/dms/image/D4E22AQEBF3G6AZWz3w/feedshare-shrink_800/0/1693548539488?e=1697673600&v=beta&t=JNitsK8wYrX1_CsVaTvgZCBHpGAKvUCmvvUHcAZyprA

---------------------------------

Session, cookie, JWT, token, SSO, and OAuth 2.0 - what are they?

These terms are all related to user identity management. When you log into a website, you declare who you are (identification). Your identity is verified (authentication), and you are granted the necessary permissions (authorization). Many solutions have been proposed in the past, and the list keeps growing.

From simple to complex, here is my understanding of user identity management:

🔹WWW-Authenticate is the most basic method. You are asked for the username and password by the browser. As a result of the inability to control the login life cycle, it is seldom used today.
🔹A finer control over the login life cycle is session-cookie. The server maintains session storage, and the browser keeps the ID of the session. A cookie usually only works with browsers and is not mobile app friendly.
🔹To address the compatibility issue, the token can be used. The client sends the token to the server, and the server validates the token. The downside is that the token needs to be encrypted and decrypted, which may be time-consuming.
🔹JWT is a standard way of representing tokens. This information can be verified and trusted because it is digitally signed. Since JWT contains the signature, there is no need to save session information on the server side.
🔹By using SSO (single sign-on), you can sign on only once and log in to multiple websites. It uses CAS (central authentication service) to maintain cross-site information
🔹By using OAuth 2.0, you can authorize one website to access your information on another website

Over to you: nowadays, some website allows you to log in by scanning the QR code using your phone. Do you know how it works?

https://media.licdn.com/dms/image/D4E22AQE5WibDnWDeEg/feedshare-shrink_800/0/1693630418332?e=1697673600&v=beta&t=iOpoPtcL0nf8xPvC-todiuBdW2rQqy5EhmRGqvecwTY

-----------------------------

A nice cheat sheet of different monitoring infrastructure in cloud services.

This cheat sheet offers a concise yet comprehensive comparison of key monitoring elements across the three major cloud providers and open-source / 3rd party tools.

Let's delve into the essential monitoring aspects covered:
- Data Collection: Gather information from diverse sources to enhance decision-making.
- Data Storage: Safely store and manage data for future analysis and reference.
- Data Analysis: Extract valuable insights from data to drive informed actions.
- Alerting: Receive real-time notifications about critical events or anomalies.
- Visualization: Present data in a visually comprehensible format for better understanding.
- Reporting and Compliance: Generate reports and ensure adherence to regulatory standards.
- Automation: Streamline processes and tasks through automated workflows.
- Integration: Seamlessly connect and exchange data between different systems or tools.
- Feedback Loops: Continuously refine strategies based on feedback and performance analysis.

Over to you: How do you prioritize and leverage these essential monitoring aspects in your domain to achieve better outcomes and efficiency?

https://media.licdn.com/dms/image/D4E22AQH4qJnO8Q3fjg/feedshare-shrink_800/0/1694533517947?e=1697673600&v=beta&t=j8MLgmi2GefxYGrTwbFxAwru73sd_y2PTxYHU2VTyOs


-----------------------------------------------



Which latency numbers you should know?

Please note those are not precise numbers. They are based on some online benchmarks (Jeff Dean’s latency numbers + some other sources).

🔹L1 and L2 caches: 1 ns, 10 ns
E.g.: They are usually built onto the microprocessor chip. Unless you work with hardware directly, you probably don’t need to worry about them.

🔹RAM access: 100 ns
E.g.: It takes around 100 ns to read data from memory. Redis is an in-memory data store, so it takes about 100 ns to read data from Redis.

🔹Send 1K bytes over 1 Gbps network: 10 us
E.g.: It takes around 10 us to send 1KB of data from Memcached through the network.

🔹Read from SSD: 100 us
E.g.: RocksDB is a disk-based K/V store, so the read latency is around 100 us on SSD.

🔹Database insert operation: 1 ms.
E.g.: Postgresql commit might take 1ms. The database needs to store the data, create the index, and flush logs. All these actions take time.

🔹Send packet CA->Netherlands->CA: 100 ms
E.g.: If we have a long-distance Zoom call, the latency might be around 100 ms.

🔹Retry/refresh internal: 1-10s
E.g: In a monitoring system, the refresh interval is usually set to 5~10 seconds (default value on Grafana).

Notes
-----
1 ns = 10^-9 seconds
1 us = 10^-6 seconds = 1,000 ns
1 ms = 10^-3 seconds = 1,000 us = 1,000,000 ns

https://media.licdn.com/dms/image/D4E22AQElub9qZJu3eQ/feedshare-shrink_800/0/1694239618199?e=1697673600&v=beta&t=Pu9Ep9i1n4_T36xEbUnxH5BfKFsAdKSl11_CaGFTv-o

-------------------------------------------

Payment Ecosystem

https://media.licdn.com/dms/image/D4E22AQEr61Z1EwLmig/feedshare-shrink_800/0/1693808943836?e=1697673600&v=beta&t=_-SFG7VxQVUc5SwJ-u9QW0WSdb7I-NRgYTEZcpDph9A

-----------------------------------------------

Uber Tech Stack

https://media.licdn.com/dms/image/D4E22AQFKQXpZ7KO1Mg/feedshare-shrink_800/0/1694619910289?e=1697673600&v=beta&t=-8zGRkntCJwjYPMtuROmwUxfQpNoXiPAzxF77OfN4eQ

----------------------------------

#### What Are Microservices Really All About? (And When Not To Use It)
https://www.youtube.com/watch?v=lTAcCNbJ7KE

#### Top 5 Most Used Architecture Patterns
https://www.youtube.com/watch?v=f6zXyq4VPP8

https://github.com/microsoft/api-guidelines

#### Contract Testing For Microservices IS A MUST
https://www.youtube.com/watch?v=Fh8CqZtghQw

https://about.gitlab.com/why-gitlab/

https://en.wikipedia.org/wiki/Design_by_contract

## DevStack
https://github.com/sd-404/dev-stack/tree/main

## Symfony
https://github.com/Tanya-WebDev/configuration-files-for-the-symfony-project/tree/main
https://github.com/StaffNowa/docker-symfony
https://medium.com/@404sd/how-to-send-notification-asynchronously-using-symfony-rabbitmq-43e3077e9b36
