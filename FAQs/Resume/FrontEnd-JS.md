# Javascript

https://www.linkedin.com/embed/feed/update/urn:li:ugcPost:7183397313053114368

## What is a Closure?

A closure gives access to an outer function’s scope from an inner function. When functions are nested, the inner functions have access to the variables declared in the outer function scope, even after the outer function has returned:

```js
const createSecret = (secret) => {
    return {
        getSecret: () => secret,
        setSecret: (newSecret) => {
            secret = newSecret;
        },
    };
};

const mySecret = createSecret("My secret");

console.log(mySecret.getSecret()); // My secret

mySecret.setSecret("My new secret");

console.log(mySecret.getSecret()); // My new secret
```

Closure variables are live references to the outer-scoped variable, not a copy. This means that if you change the outer-scoped variable, the change will be reflected in the closure variable, and vice-versa, which means that other functions declared in the same outer function will have access to the changes.

Common use cases for closures include:

- Data privacy
- Currying and partial applications (frequently used to improve function composition, e.g. to parameterize Express middleware or React higher order components)
- Sharing data with event handlers and callbacks

Data Privacy: \
Encapsulation is a vital feature of object oriented programming. It allows you to hide the implementation details of a class from the outside world. Closures in JavaScript allows to declare private variables for objects:
```js
// Data privacy
const createCounter = () => {
    let count = 0;
    return {
        increment: () => ++count,
        decrement: () => --count,
        getCount: () => count,
    };
};
```

Curried functions and partial applications:
```js
// A curried function takes multiple arguments one at a time.
const add = (a) => (b) => a + b;

// A partial application is a function that has been applied to some,
// but not yet all of its arguments.
const increment = add(1); // partial application

increment(2); // 3
```

## What is a Pure Function?
Pure functions are important in functional programming. Pure functions are predictable, which makes them easier to understand, debug, and test than impure functions. Pure functions follow two rules:

- Deterministic — given the same input, a pure function will always return the same output.
- No side-effects — A side effect is any application state change that is observable outside the called function other than its return value.

### Examples of Non-deterministic Functions

Non-deterministic functions include functions that rely on:

- A random number generator.
- A global variable that can change state.
- A parameter that can change state.
- The current system time.

### Examples of Side Effects

- Modifying any external variable or object property (e.g., a global variable, or a variable in the parent function scope chain).
- Logging to the console.
- Writing to the screen, file, or network.
- Throwing an error. Instead, the function should return a result indicating the error.
- Triggering any external process.

## What is Function Composition?

Function composition is the process of combining two or more functions to produce a new function or perform some computation: (f ∘ g)(x) = f(g(x)) (f composed with g of x equals f of g of x).

```js
const compose = (f, g) => (x) => f(g(x));

const g = (num) => num + 1;
const f = (num) => num * 2;

const h = compose(f, g);

h(20); // 42
```

## What is Functional Programming?

Functional programming is a programming paradigm that uses pure functions as the primary units of composition. Composition is so important in software development that virtually all programming paradigms are named after the units of composition they use:

- Object-oriented programming uses objects as the unit of composition.
- Procedural programming uses procedures as the unit of composition.
- Functional programming uses functions as the unit of composition.

Functional programming is a declarative programming paradigm, which means that programs are written in terms of what they do, rather than how they do it. This makes functional programs easier to understand, debug, and test than imperative programs. They also tend to be a lot more concise, which reduces code complexity and makes it easier to maintain.

Other key aspects of functional programming include:

- Immutability — immutable data structures are easier to reason about than mutable data structures.
- Higher-order functions — functions that take other functions as arguments or return functions as their result.
- Avoiding shared mutable state — shared mutable state makes programs difficult to understand, debug, and test. It also makes it difficult to reason about the correctness of a program.

Since pure functions are easy to test, functional programming also tends to lead to better test coverage and fewer bugs.

## What is a Promise?
A Promise in JavaScript is an object representing the eventual completion or failure of an asynchronous operation. It acts as a placeholder for a value that is initially unknown, typically because the computation of its value is not yet complete.

Key Characteristics of Promises:

### Stateful:

A Promise is in one of three states:
- Pending: Initial state, neither fulfilled nor rejected.
- Fulfilled: The operation completed successfully.
- Rejected: The operation failed.

### Immutable:

Once a Promise is fulfilled or rejected, its state cannot change. It becomes immutable, permanently holding its result. This makes Promises reliable in asynchronous flow control.

### Chaining:

Promises can be chained, meaning the output of one Promise can be used as input for another. This is done using .then() for success or .catch() for handling failures, allowing for elegant and readable sequential asynchronous operations. Chaining is the async equivalent of function composition.

```js
const promise = new Promise((resolve, reject) => {
    setTimeout(() => {
        resolve("Success!");
        // You could also reject with a new error on failure.
    }, 1000);
});

promise
.then((value) => {
    console.log(value); // Success!
})
.catch((error) => {
    console.log(error);
});
```

In JavaScript, you can treat promises and promise returning functions as if they are synchronous, using the async/await syntax. This makes asynchronous code much easier to read and reason about.

```js
const processData = async () => {
  try {
    const data = await fetchData(); // Waits until the Promise is resolved
    console.log("Processed:", data); // Process and display the data
  } catch (error) {
    console.error("Error:", error); // Handle any errors
  }
};
```

## What is a Web Component?

Web Components are a set of web platform APIs that allow you to create new custom, reusable, encapsulated HTML tags to use in web pages and web apps. They are built using open web technologies such as HTML, CSS, and JavaScript. They are part of the browser, and do not require external libraries or frameworks.

Web Components are particularly useful on large teams with many engineers who may be using different frameworks. They allow you to create reusable components that can be used in any framework, or no framework at all. For example, Adobe’s Spectrum design system is built using Web Components, and integrates smoothly with popular frameworks like React.

Web Components have existed for a long time, but have grown in popularity recently, especially in large organizations. They are supported by all major browsers, and are a W3C standard.

```html
<!-- Defining a simple Web Component -->
<script>
// Define a class that extends HTMLElement
class SimpleGreeting extends HTMLElement {
    // Define a constructor that attaches a shadow root
    constructor() {
        super();
        const shadowRoot = this.attachShadow({ mode: "open" });
        // Use a template literal for the shadow root's innerHTML
        shadowRoot.innerHTML = `
                <style>
                /* Style the web component using a style tag */
                p {
                    font-family: Arial, sans-serif;
                    color: var(--color, black); /* Use a CSS variable for the color */
                }
                </style>
                <!-- The <slot> element is a placeholder for user-provided content. -->
                <!-- If no content is provided, it displays its own default content. -->
                <p><slot>Hello, Web Components!</slot></p>
            `;
    }

    // Define a static getter for the observed attributes
    static get observedAttributes() {
        return ["color"]; // Observe the color attribute
    }

    // Define a callback for when an attribute changes
    attributeChangedCallback(name, oldValue, newValue) {
        // Update the CSS variable when the color attribute changes
        if (name === "color") {
            this.style.setProperty("--color", newValue);
        }
    }
}

// Register the custom element with a tag name
customElements.define("simple-greeting", SimpleGreeting);

</script>

<!-- Using the Web Component -->

<!-- Pass a custom greeting message using the slot -->
<simple-greeting>Hello, reader!</simple-greeting>

<!-- Pass a custom color using the attribute -->
<simple-greeting color="blue">Hello, World!</simple-greeting>
```

## Arrow Functions

The main difference between arrow functions and normal functions in JavaScript is that arrow functions do not have their own this binding. Instead, they inherit the this binding of the scope in which they are defined

Arguments objects are not available in arrow functions, but are available in regular functions.

Regular functions created using function declarations or expressions are ‘constructible’ and ‘callable’. Since regular functions are constructible, they can be called using the ‘new’ keyword. However, the arrow functions are only ‘callable’ and not constructible. Thus, we will get a run-time error on trying to construct a non-constructible arrow function using the new keyword.

Arrow functions are a more concise syntax for writing function expressions. It allows creating functions more cleanly compared to regular functions.

Key differences between regular and arrow functions are

Syntax
No arguments (arguments are array-like objects)
No prototype object for the Arrow function
Cannot be invoked with a new keyword (Not a constructor function)
No own this (call, apply & bind won’t work as expected)
Duplicate-named parameters are not allowed
It cannot be used as a Generator function

https://programwithjayanth.com/posts/arrow-functions/

## Spread Operator / Rest Parameters
```js
const resParameteres = (...res) => {
    console.log(typeof res) // true
    console.log(res) // 1,2,3
}
restParameters(1,2,3)

const spreadOperator = () => {
    const arr = [1,2,3]
    const newArr = [...arr]
    console.log(newArr) // 1,2,3
}
spreadOperator()
```
#### What is DOM?

#### What is the difference between DOM and Virtual DOM?