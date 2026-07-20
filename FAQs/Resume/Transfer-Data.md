# Data Interchange Format Transfer

[https://aws.amazon.com/what-is/restful-api/](https://aws.amazon.com/what-is/restful-api/)

### SOAP
The SOAP stands for Simple Object Access Protocol. It’s an official protocol for transmitting data across networks and can be used to build an API. It’s standardized and utilizes only XML to encode information. SOAP strictly defines how messages should be sent and what must be included in them so, is often implemented for internal data transfers that require high security. The advantage overall is that it works over any communication protocol, not just HTTP.

### WHAT IS JSON?
JSON stands for JavaScript Object Notation and is a lightweight format, self-describing and easy to read, for storing and transporting data, often used when data is sent from an application to a API endpoint or to store data in no relational databases.

JSON WEB TOKEN: https://www.youtube.com/watch?v=P2CPd9ynFLg

### WHAT IS XML?
XML stands for Extensible Markup Language. It is a simple and flexible markup language. It is known as universal language for data on the web because XML documents can be created and used in any language. It is universal standard for information interchange. XML technology facilitates applications to create its own markup language.

### SYNCH VS ASYNC PROCESSING

Synchronous Processing:
- Executes tasks sequentially, one after the other.
- Requires each task to complete before the next one starts.
- Follows a blocking mechanism, simplifying control flow understanding.
- May lead to inefficiencies, especially with time-consuming tasks like I/O operations.
- Suitable for independent tasks with sequential execution, simpler control flow.
- Example: Traditional procedural programming with sequential execution.
Asynchronous:

Asynchronous Processing:
- Allows tasks to start without waiting for the completion of previous ones.
- Enables parallel execution, efficient resource utilization.
- Common in scenarios with waiting for external events, such as I/O operations or network requests.
- Relies on mechanisms like callbacks, promises, or async/await in supporting languages.
- Beneficial for tasks involving waiting for external events, optimizing resource utilization.
- Example: Modern web development, e.g., fetching data without blocking the user interface.