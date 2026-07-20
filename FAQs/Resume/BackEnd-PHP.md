# PHP Resume

## Framework Agnostic

In the frontend: https://www.revelo.com/blog/framework-agnostic

The term 'Framework Agnostic' typically mean developing software products and applications without being tied to any specific programming framework or platform technology. It involves building a portable and an extensible program with codes containing the business rules separated carefully from the framework files.
https://radixweb.com/blog/what-is-framework-agnostic
https://stackoverflow.com/questions/64725017/what-does-it-mean-by-framework-agnostic

What is platform agnostic framework?
The concept of 'platform agnostic' refers to a set of specific design attributes and philosophies normally associated to software products. An agnostic type of software would in fact be free from any ties to a specific platform or system and run equally well across more than one platform.


## Difference between GET vs POST
While both are HTTP requests, GET request makes it through URL and can include query parameters but POST request is enclosed in the body of the message.

## Sending files via form
For sending files via form is has to be via POST request specifying `enctype='multipart/form-data'`

- application/x-www-form-urlencoded: *HTML default* is almost the same as a query string on the end of the URL
- multipart/form-data: can contains a file upload
- text/plain: is introduced by HTML 5 and is useful only for debugging
- application/json: jeson header

## Incude vs Require
The include() and require() statements are php functions that differ upon failure: require will produce a fatal error (E_COMPILE_ERROR) and stop the script. include will only produce a warning (E_WARNING) and the script will continue.

## Incude or Require vs include_once or require_once
The include() or require() functions are used to include a PHP file into another irrespective of whether the file is included before or not. By _once() will first check whether a file is already included or not and if it is already included then it will not include or require it again.

## Associative arrays
Associative arrays are used to store key value pairs where the key can be alphanumeric to be assosiated with to access its value.

## Difference between Session and Cookies
Both concepts store persistant useful data for the application related to the client usage meanwhile this perform actions or visits the website pages.
Cookies store all the data directly on the client's browser. Although Session too, it is only store an associative identifier which is sent on every consecutive request to locate the cookie stored on the server side.

## Database connection

- Procedural through mysqli() function
- Object Oriented
- PDO

## Excrypt
- password_hash() creates a new password hash using a strong one-way hashing algorithm and check by password_verify(string $password, string $hash)
    - $hashed_password = password_hash($input_password, \\OPTION\\) // where OPTION could be: PASSWORD_DEFAULT, PASSWORD_BCRYPT, PASSWORD_ARGON2I

md5() is not recommended to use to secure passwords by PHP official documentation due to the fast nature of this hashing algorithm and being insecured.

## Why __construct()
A constructor allows you to initialize an object's properties upon creation of the object. If you create a __construct() function, PHP will automatically call this function when you create an object from a class.

## unset
unset() destroys the specified variables. The behavior of unset() inside of a function can vary depending on what type of variable you are attempting to destroy.

## Client IP
Throught super global variables $_SERVER['HTTP_CLIENT_IP'], $_SERVER['HTTP_X_FORWARDED_FOR'] and/or $_SERVER['REMOTE_ADDR'] *(proxy address)*. Thay could be different from each other or not thus are not completely secure.

##

#### Los 6 patrones de diseño más utilizados
https://www.youtube.com/watch?v=JI_THVXPToQ

#### PHP doesn't suck (anymore)
https://www.youtube.com/watch?v=ZRV3pBuPxEQ