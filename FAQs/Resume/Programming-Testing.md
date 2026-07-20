# Testing
Software testing is an organizational process within software development in which business-critical software is verified for correctness, quality, and performance. Comprehensive test coverage is essential for improving quality and reducing incidents for teams practicing DevOps.

Tests can be manual or automated, and include the following types of tests: unit tests, integration tests, functional tests, end-to-end tests, acceptance tests, performance tests, and smoke tests.

## Manual Testing
It's important to make the distinction between manual and automated tests. Manual testing is done in person, by clicking through the application or interacting with the software and APIs with the appropriate tooling. This is very expensive since it requires someone to setup an environment and execute the tests themselves, and it can be prone to human errors as the tester might make typos or omit steps in the test script.
But there's still value in doing some manual testing with what is also called exploratory testing.

## Automated Testing
Automated tests, on the other hand, are performed by a machine that executes a test script that was written in advanced. These tests can vary in complexity, from checking a single method in a class making sure that performing a sequence of complex actions in the UI leads to the same results.
It's much more robust and reliable than manual tests – but the quality of the automated tests depends on how well the test scripts have been written.

Automated testing is a key component of continuous integration and continuous delivery because it's a great way to scale the Quality Assurance processes adding new features to the application.

## The different types of tests

### Unit tests
Unit tests are very low level and close to the source of an application. They consist in testing individual methods and functions of the classes, components, or modules used by your software. Unit tests are generally quite cheap to automate and can run very quickly by a continuous integration server.

### Integration tests
Integration tests verify that different modules or services used by your application work well together. For example, it can be testing the interaction with the database or making sure that microservices work together as expected. These types of tests are more expensive to run as they require multiple parts of the application to be up and running.

### Functional tests
Functional tests focus on the business requirements of an application. They only verify the output of an action and do not check the intermediate states of the system when performing that action.

There is sometimes a confusion between integration tests and functional tests as they both require multiple components to interact with each other. The difference is that an integration test may simply verify that you can query the database while a functional test would expect to get a specific value from the database as defined by the product requirements.

### End-to-end tests
End-to-end testing replicates a user behavior with the software in a complete application environment. It verifies that various user flows work as expected and can be as simple as loading a web page or logging in or much more complex scenarios verifying email notifications, online payments, etc...

End-to-end tests are very useful, but they're expensive to perform and can be hard to maintain when they're automated. It is recommended to have a few key end-to-end tests and rely more on lower level types of testing (unit and integration tests) to be able to quickly identify breaking changes.

### Acceptance testing
Acceptance tests are formal tests that verify if a system satisfies business requirements. They require the entire application to be running while testing and focus on replicating user behaviors. But they can also go further and measure the performance of the system and reject changes if certain goals are not met.

### Performance testing
Performance tests evaluate how a system performs under a particular workload. These tests help to measure the reliability, speed, scalability, and responsiveness of an application. For instance, a performance test can observe response times when executing a high number of requests, or determine how a system behaves with a significant amount of data. It can determine if an application meets performance requirements, locate bottlenecks, measure stability during peak traffic, and more.

### Smoke testing
Smoke tests are basic tests that check the basic functionality of an application. They are meant to be quick to execute, and their goal is to give you the assurance that the major features of your system are working as expected.

Smoke tests can be useful right after a new build is made to decide whether or not you can run more expensive tests, or right after a deployment to make sure that they application is running properly in the newly deployed environment.

## Test Driven Methodologies

There are 3 testing methods or practices like Behavioral Driven Development (BDD), Test-Driven Development (TDD), and Acceptance Test-Driven Development (ATDD).

### Test-Driven Development (TDD)
Test-Driven Development is a testing methodology or a programming practice implemented from a developer’s perspective. In this technique, a QA engineer starts designing and writing test cases for every small functionality of an application. This technique attempts to answer a simple question – Is the code valid?

The main intention of this technique is to modify or write a fresh code only when the test fails. Hence it results in lesser duplication of test scripts. This technique is prevalent mainly in agile development ecosystems. In a TDD approach, automated test scripts are written before functional pieces of code. The TDD methodology involves the following steps:

- A developer writes an automated test case based on the requirements specified in the documents.
- These tests are executed, and in some cases, they fail as they are developed before the development of an actual feature.
- The development team then re-factors the code for the test to pass successfully.
- TDD can be done by a single developer while writing both tests and application code side by side to complete a feature.

Benefits of TDD
- Reduces the amount of time required for rework
- Explores bugs or errors very quickly
- Faster feedback
- Encourages the development of cleaner and better designs
- Enhances the productivity of the programmer
- Allows any team member to start working on the code without a specific team member. This encourages knowledge-sharing and collaboration.
- It gives the programmer confidence to change an application’s large architecture quickly.
- Results in the creation of extensive code that is flexible and easy to maintain

### Behavioral-Driven Development (BDD)?
Behavioral-Driven Development (BDD) is a testing approach derived from the Test-Driven Development (TDD) methodology. In BDD, tests are mainly based on systems behavior. This approach defines various ways to develop a feature based on its behavior. In most cases, the Given-When-Then approach is used for writing test cases. Let’s take an example for a better understanding of TDD vs BDD:

- Given the user has entered valid login credentials
- When a user clicks on the login button
- Then display the successful validation message

Key benefits of BDD
- Helps reach a wider audience through the usage of non-technical language
- Focuses on how the system should behave from the customer’s and the developer’s perspective
- BDD is a cost-effective technique
- Reduces efforts needed to verify any post-deployment defects

### Acceptance Test-Driven development?
In the Acceptance Test-Driven Development (ATDD) technique, a single acceptance test is written from the user’s perspective, mainly focusing on satisfying the system’s functional behavior. This technique attempts to answer the question – Is the code working as expected?

Acceptance Test-Driven Development is very similar to Behavioral-Driven Development. However, a key difference between them is: BDD focuses more on the behavior of the feature, whereas ATDD focuses on capturing the precise requirements.
This technique enhances collaboration among developers, users, and QAs with a shared focus on defining the acceptance criteria. The following are some of the key practices in ATDD:

- Analyzing and discussing the real-world scenarios
- Deciding the acceptance criteria for those test scenarios
- Automating the acceptance of test cases
- Focusing on the development of those requirement cases

Benefits of ATDD
- Requirements are very clearly analyzed without any ambiguity
- Encourages collaboration among cross-team members
- The acceptance test serves as a guide for the software development process

## Sources
https://www.atlassian.com/devops/what-is-devops/devops-best-practices \
https://www.atlassian.com/continuous-delivery/continuous-integration/how-to-get-to-continuous-integration \
https://www.atlassian.com/continuous-delivery/principles/pipeline \
https://www.browserstack.com/guide/tdd-vs-bdd-vs-atdd \
https://www.atlassian.com/continuous-delivery/software-testing/types-of-software-testing

## What is Test Driven Development (TDD)?

Test Driven Development (TDD) is a software development approach where tests are written before the actual code. It revolves around a short, repetitive development cycle designed to ensure that the code meets specified requirements and is free of bugs. TDD can play a vital role in improving code quality, reducing bugs, and increasing developer productivity.

One of the most important measures of development team productivity is deployment frequency. One of the primary obstacles to continuous delivery is the fear of change. TDD helps to reduce this fear by ensuring that the code is always in a deployable state. This makes it easier to deploy new features and bug fixes, which in turn increases deployment frequency.

Testing first has many benefits over testing after:

- Better Code Coverage: Tests are more likely to cover all edge cases when they are written first.
- Improved API Design: Tests force you to think about the API design before you write the code, which helps avoid leaking implementation details into the API.
- Fewer Bugs: Testing first helps you catch bugs earlier in the development process, when they are easier to fix.
- Better Code Quality: Testing first forces you to write modular, loosely coupled code, which is easier to maintain and reuse.

Another feature of TDD is about writing in a modular and clean architected code.

Key Steps in TDD:

- Write a Test: This test will fail initially, as the corresponding functionality does not yet exist.
- Write the Implementation: Just enough to make the test pass.
- Refactor with Confidence: Once the test passes, the code can be refactored with confidence. Refactoring is the process of restructuring existing code without changing its external behavior. Its purpose is to clean up the code, improve readability, and reduce complexity. With the test in place, if you make a mistake, you will be alerted to it immediately by the test failure.

### Repeat:
The cycle repeats for each functional requirement, gradually building up the software while ensuring that all tests continue to pass.

Challenges:

- Learning Curve: TDD is a skill and discipline that can take considerable time to develop. After 6 months of TDD, you may still feel like TDD is difficult and gets in the way of productivity. However, after 2 years with TDD, you will likely find that it has become second nature, and that you are more productive than ever before.

- Time-Consuming: Writing tests for every small functionality can feel time-consuming initially, though it usually pays off in the long term with reduced bugs and easier maintenance. I often tell people, “if you think you don’t have time for TDD, you really don’t have time to skip TDD.”

#### 5 Types of Testing Software Every Developer Needs to Know!
https://www.youtube.com/watch?v=YaXJeUkBe4Y