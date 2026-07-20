# React

React is a Javascript Library for building out user interfaces providing a setup tools and structure to make the UI development faster and easier.

It can be build single page applications.

React Components let split the UI into independent, reusable pieces, and think about each piece in isolation. A components can hold more components into it.

**JSX** stands for Javascript XML.
Browsers cannot read .jsx files so it needs a transpiler to convert it into traditional HMTL and JS code.

https://medium.com/javascript-scene/why-every-react-developer-should-learn-function-composition-23f41d4db3b1

#### React JS Explained In 10 Minutes
https://www.youtube.com/watch?v=s2skans2dP4

#### All The JavaScript You Need To Know For React
https://www.youtube.com/watch?v=m55PTVUrlnA

## Pure Function - Side Effects
In Redux, all reducers must be pure functions. If they are not, the state of the application will be unpredictable, and features like time-travel debugging will not work. Impurity in reducer functions may also cause bugs that are difficult to track down, including stale React component state.

## Function Composition
React developers can clean up large component trees with function composition. Instead of nesting components, you can compose them together to create a new higher-order component that can enhance any component you pass to it with additional functionality.

## What is a React Hook?
Hooks are functions that let you use state and other React features without writing a class. Hooks allow you to use state, context, refs, and component lifecycle events by calling functions instead of writing class methods. The additional flexibility of functions allows you to organize your code better, grouping related functionality together in a single hook call, and separating unrelated functionality by implementing it in separate function calls. Hooks offer a powerful and expressive way to compose logic inside a component.

Important React Hooks

- useState - allows you to add state to functional components. State variables are preserved between re-renders.
- useEffect - lets you perform side effects in functional components. It combines the capabilities of componentDidMount, componentDidUpdate, and componentWillUnmount into a single function call, reducing the required code and creating better code organization than class components.
- useContext - allows you to consume context in function components.
- useRef - allows you to create a mutable reference that persists for the lifetime of the component.
- Custom Hooks — to encapsulate reusable logic. This makes it easy to share logic across different components.

### Rules of Hooks:
Hooks must be used at the top level of React functions (not inside loops, conditions, or nested functions) and only in React function components or custom Hooks.

Hooks solved some common pain points with class components, such as the need to bind methods in the constructor, and the need to split functionality into multiple lifecycle methods. They also make it easier to share logic between components, and to reuse stateful logic without changing your component hierarchy.

## How Do you Create a Click Counter in React?
You can create a click counter in React by using the useState hook as follows:

```js
import React, { useState } from "react";

const ClickCounter = () => {
    const [count, setCount] = useState(0); // Initialize count to 0

    return (
        <div>
        <p>You clicked {count} times</p>
        <button onClick={() => setCount((count) => count + 1)}>Click me</button>
        </div>
    );
};

export default ClickCounter;
```

Note that passing a function to setCount is best practice when you are deriving the new value from existing state, to ensure that you're always working with the latest state.

#### Vue explained to React Developers in 6 mins
https://www.youtube.com/watch?v=sUH7PDUswio

#### ¡Resuelvo Prueba Técnica de React para Juniors y Trainee!
https://www.youtube.com/watch?v=XYpadB4VadY

#### Custom Hooks + Testing con Playwright: Curso de React desde cero - Parte 4
https://www.youtube.com/watch?v=x-LcbVw99o8

## Questions

#### What is the role of React in software development?

#### What is React?

#### What is SPA(Single Page Application)?

#### What are the advantages of React?

#### What are disadvantages of React?

#### What is the difference between React and Angular?

#### What are React Components?

#### How to setup react project?

#### What is npm? What is the role of node_modules folder?

#### What is the role of public folder in React?

#### What is the role of src folder in React?

#### What is the role of index.html page in React?

#### What is  the role of App.js file in React?

#### What is the role of function and return inside App.js?

#### Can we have a function without return inside App.js?

#### What is the role of export default inside App.js?

#### What is the role of index.js file, ReactDOM and render method in React?

#### How React App load and display the components in browser?

#### What is JSX?

#### What are the advantages of JSX?

#### Can browser read a JSX File? What is Babel?

#### What is Transpiler?

#### Is it possible to use JSX without React?

#### What is fragment in React?

#### How do you iterate over a list in JSX? What I is the use of map method?

#### What are props n JSX?

#### What are spread operator?

#### What are the types conditional rendering in JSX?
