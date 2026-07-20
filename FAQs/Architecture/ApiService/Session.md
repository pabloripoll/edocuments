# Users Authentication

## # Session / Cookie
The traditional approach on a web application is cookie-based server side sessions. The process begins with user filling out their user name and password and then submitting it to a server which then validates it, creating a session in a dedicated directory file in the server or, in a row in a database table with the session data.
The server then response with a session id which the browser stores it in its own cookies jar as key value pairs ready to send it back to the server on each subsequent request. This allows the application to response back with content designed for the currently logged end user.

### · Advantages:
It's a stateful session between the front-end client and the back-end server, it's handle on the server side and it's the fastest way to check user session in a monolith infrastructure.

### · Disadvanteges:
The major disadvantage comes when an application is designed to scale horizontally with different micro-services as the login application stores the session id in its database or server memory, becoming a bottleneck in production when other services must have these session key pairs.

### · Security:
This type of authentication has a vulnerability attack konwn as cross-site request forgery *(CSRF)* when an attacker steels a user session cookie from a site it's logged into, to perform actions it didn't intend to, like submitting a payment or changing its credentials. Therefore, if the user is currently authenticated to the site, the site will have no way to distinguish between the forged request sent by the victim and a legitimate request sent by the victim.
Altough this risk is low, modern frameworks implements a CSRF validation process for the usage of the application requests and modern web browsers by using `same-origin policy restrictions` but, in some cases web applications use **CORS** without security measures with the HEADER `Access-Control-Allow-Origin: *`.

https://owasp.org/www-community/attacks/csrf
