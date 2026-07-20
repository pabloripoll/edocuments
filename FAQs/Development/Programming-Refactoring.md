# Refactoring
Refactoring is a systematic process of improving code without creating new functionality that can transform a mess into clean code and simple design.

### Dirty Code
Dirty code is result of inexperience multiplied by tight deadlines, mismanagement, and nasty shortcuts taken during the development process.

### Clean Code
Clean code is code that is easy to read, understand and maintain. Clean code makes software development predictable and increases the quality of a resulting product.

### Code Smells
Code smells are indicators of problems that can be addressed during refactoring. Code smells are easy to spot and fix, but they may be just symptoms of a deeper problem with code.

### Refactoring Process
Performing refactoring step-by-step and running tests after each change are key elements of refactoring that make it predictable and safe.

### Refactoring Technics
Refactoring technics describe actual refactoring steps. Most refactoring techniques have their pros and cons. Therefore, each refactoring should be properly motivated and applied with coution.

## What is refactoring?

### Clean code
The main purpose of refactoring is to fight technical debt. It transforms a mess into clean code and simple design. Here are some of its features:

* Clean code is obvious for other programmers. \
And I’m not talking about super sophisticated algorithms. Poor variable naming, bloated classes and methods, magic numbers -you name it- all of that makes code sloppy and difficult to grasp.

* Clean code doesn’t contain duplication. \
Each time you have to make a change in a duplicate code, you have to remember to make the same change to every instance. This increases the cognitive load and slows down the progress.

* Clean code contains a minimal number of classes and other moving parts. \
Less code is less stuff to keep in your head. Less code is less maintenance. Less code is fewer bugs. Code is liability, keep it short and simple.

* Clean code passes all tests. \
You know your code is dirty when only 95% of your tests passed. You know you’re screwed when your test coverage is 0%.

* Clean code is easier and cheaper to maintain!