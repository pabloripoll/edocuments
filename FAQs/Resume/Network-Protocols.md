# Network Protocols

## The Basics

### Address

### URL
URL stands for Uniform Resource Locator - is the address of a given unique resource on the Web the mechanism used by browsers to retrieve any published resource.

A URL is composed of different parts, some mandatory such as scheme, domain name or IP and path to the resource. The others parts are optional such as port, parameters and anchor.

*cURL* stands for client URL and is a command-line tool, It’s available on all major operating systems and it’s an alternative connection that can be used to transfer data to and from a server. At the most fundamental, cURL lets an application talk to a server by specifying the location (in the form of a URL) and the data is about to be send.

## Protocols

<div style="width:50%;margin:0 0 0 25%"><img src="Networks-Protocols.gif" width="100%" /></div>

1. HTTP (Stands for Hypertext Transfer Protocol):
It uses a request / response model for Web Communication enabling browser-server interaction.

HTTP is used to transfer the hypertext from the client-end to the server-end and vice-versa via a set of rules called "Request Methods" to perform CRUD actions which are used for transferring information like text, graphic image, multimedia files or API data. CRUD stands for:

- Create: POST method
- Read: GET method
- Update: PUT method
- Delete: DELETE method

The requested data is return in the response body with some other information In HTTP/1.0, the connection is closed after a single request or response pair.

For example, the server issues an HTTP Status Code in response to a request of the client made to the server with a a 3-digit integer status code. The first digit of status code is used to specify one of five standard classes of responses. The last two digits do not have any categorization role.

- 200: connection succeded.
- 404: resource not found
- 500: internal server error

In HTTP/1.1, a mechanism was introduced, which is known as keep-alive-mechanism. In this mechanism, Persistent Connections could be reused for more than one request.

2. HTTPS (Hypertext Transfer Protocol Secure):
Secure Web Communication: Ensures confidentiality through SSL/TLS encryption.

HTTP does not have any security but for that type of transfer it’s used HTTPS that stands for Hypertext Transfer Protocol Secure. It secures transfers by encrypting requests and decrypting responses. An HTTP response contains the following things:
- Status Line,
- Response Header Fields or a series of HTTP headers
- Message Body.

3. FTP / SFTP (File Transfer Protocol):
File Transfer: Facilitates file exchange between computers, utilizing separate channels.

4. TCP (Transmission Control Protocol):
Reliable Data Delivery: Ensures ordered and reliable data transfer with error-checking.

5. IP (Internet Protocol):
Data Packet Management: Handles routing and addressing of data packets, assigning unique IP addresses.

6. UDP (User Datagram Protocol):
Swift Data Transfer: Offers connectionless and faster data transfer without reliability features.

7. SMTP (Simple Mail Transfer Protocol):
Email Sending: Manages email sending between servers through a client-server architecture.

8. SSH (Secure Shell):
Secure Remote Access: Enables secure access to remote devices, encrypting client-server communication.

9. IMAP (Internet Message Access Protocol):
Email Access: Allows access and retrieval of emails from a server, maintaining emails on the server.

#### Top 8 Most Popular Network Protocols Explained
https://www.youtube.com/watch?v=P6SZLcGE4us
