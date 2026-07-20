# Users Authentication

## # Token-Based Auth / JWT
The process begins the same as a cookie-based server aunthentication by the client sending its login details to the server but in this case, instead of storing session id on the server, it generates an encoded in Base64 string known as JSON Web Token *(JWT)* encrypted with a private key inside provided by the application back-end, and it's send back as the response to the client's browser on where normally is kept in its local storage. On subsequent requests, the client must add the token in the Authorization Header prefixed by Bearer. The application then only needs to validate the signature private key. \
A JWT consists of 3 parts: a header, a payload, and a signature. These are each separated by a dot.

### · Advantages
It's a signed JSON document and is the best option for stateless connections where there's no need for the back-end to lookup for somewhere else in the infrastructure once the Json Web Token was set and in this way, it's more efficient when dealing with a distributed system on the cloud or through different application platforms, sharing information between services specially in API Rest connections.

### · Disadvanteges
The disadvantage is only for a monolyth web application where no complixity auth infrastructure is needed.

### · Security
Altough the risk of using JWT is very low if the application is not properly designed, private key can be exposed or leak some sensitive information and it would be a worst scenario than dealing with the session id because there's no server storage signature to validate the connection. \
In most cases, this data can be easily read or modified by anyone with access to the token. Therefore, the security of any JWT-based mechanism is heavily reliant on the cryptographic signature.

https://jwt.io/ \
https://jerrynsh.com/all-to-know-about-auth-and-cookies/ \
https://book.hacktricks.xyz/pentesting-web/hacking-jwt-json-web-tokens \
https://portswigger.net/web-security/jwt
