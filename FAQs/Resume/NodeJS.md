# NodeJS
https://nodejs.org/en

It is used in Chrome and in Node.js, among others.

NodeJS is a javascript run time built on Chrome V8 Javascript engine which is Google’s open source high-performance JavaScript and WebAssembly engine [https://v8.dev/](https://v8.dev/), written in C++ implementing ECMAScript and WebAssembly, and runs on Windows, macOS, and Linux systems that use x64, IA-32, or ARM processors, thus V8 can be embedded into any C++ application.

It allows to run Javascript development on the server side being highly efficient and suitable for buildind scalable network applications services and micro-services.

## NodeJS Characteristics

- Non-Blocking processor
- Single threaded

### Event loop:
```
Request -> register callback -> Intensive operation (filesystem, database, computation)
Operation completed -> Trigger callback -> Response
```

## NodeJS Usage

- API's:
- Microservices:
- Server-rendered apps:
- Real-time apps: chats
- Command Line Tools:
- Bots:
- Web Scraping:
- Web Server:

*Not good for CPU-intensive tasks*

Once NodeJS is installed, in most cases it will be required to create a project directory and startup setting the main properties using NPM *Node Package Manager* with the following command to create `package.json` file
```bash
$ npm init
```

It can be tested creating a index.js file
```js
console.log(`Hello World!`);
```

NodeJS will execute a main JS file by default that is set in `package.js` and though is commonly set the file with its extension it can be without too.
```bash
$ node index

Hellow World!
```

## As Backend application

### ExpresJS
Express is a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications. APIs.

## As Frontend application

Introduction to browser APIs

Browser APIs are APIs that are built into the browser and provide native features that can also be used in a web app. These can also be called web APIs.

With the use of web APIs, we can easily implement certain features with fewer lines of code, such as:

- making network requests
- managing client-side storage
- retrieving device media streams, etc.

### Categories of browser APIs

Web APIs can be grouped into different categories depending on the functions they perform.

- Fetch API: These are capable of making HTTP requests to a web server. The response can be in JSON, plain text, or XML format. The fetch API is a modern replacement for XHR. It was introduced in browsers recently to make asynchronous HTTP requests easier.

- APIs for manipulating document structure: APIs such as the DOM (Document Object Model) API can be placed in this category. This allows you to manipulate HTML and CSS in creating, removing, and also dynamically applying new styles to your page.

- Device APIs: These are APIs that give mobile functionality to web apps. Many APIs have been developed to help extend and shape the functionality of the web to match the capabilities of modern devices. A good example is the Geolocation API, which is used to get the geographical position of a user. It takes advantage of the device’s capability to pinpoint the user’s location that can then be used in the web app.

- APIs for drawing graphics: Modern web browsers today now support the creation of graphics on the web. One of the APIs is the Canvas API. It provides a means for drawing graphics using JavaScript and HTML. Different shapes, objects, and styles can be created using this API. The Canvas API is solely based on 2D graphics, currently.

- Storage APIs: These APIs give the ability to store data on the client-side, which is very useful for storing certain user data for some time. One of which is the Web Storage API. These can either be the sessionStorage, which keeps data for the duration of the session, or the localStorage, which retains the data even after the browser is closed.

- Audio and Video APIs: These APIs can manage, display, and create different media types. Some of which are:

The Web Audio API provides a platform for controlling audio and allowing developers to choose audio sources, add effects to audio, and much more.

The WebRTC (Web Real-Time Communication) API makes it possible to stream live audio and video, as well as transfer arbitrary data between two peers over the internet without requiring an intermediary.

The HTML Media Element uses HTML elements with properties and methods needed to support basic media-related capabilities that are common to audio and video.

You can also capture local media using local cameras and microphones via the Media Capture and Streams API.

### Note
One major limitation of using a browser API is that most of them are not standardized yet. This means the support for a web API may differ from one web browser to another. For example, an API may work with the Chrome browser that is not yet supported by Firefox or Edge browsers.