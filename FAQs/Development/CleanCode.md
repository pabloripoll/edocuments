# Clean Code

The concept of clean code can be traced back to Robert Cecil Martin and his book *”Clean Code: A Handbook of Agile Software Craftsmanship” Released August 2008.* where it was presented as a term for cleanly written code. However, the principles of clean code are much older and did not actually originated in software development.

Clean code is not a set of strict rules. It is a set of principles for writing code that is easy to understand and modify. In this case, “understandable” means that the code can be immediately understood by any experienced developer. The following characteristics of clean code are what make it easy to read:

* The entire application’s order of execution is logical and clearly structured.
* The connection between different parts of the code is quite obvious.
* The task or role of each class, function, method, and variable is immediately understandable.

Code is easy to modify if it can be adapted and extended. This also makes it easier to correct errors in the code. Clean code is thus very easy to maintain. Easily modifiable code has the following characteristics:

* Classes and methods are small and only have one single task.
* Classes and methods are predictable, work as expected, and are publicly available through well-documented APIs (interfaces).
* The code uses unit tests.

The advantages of this kind of programming are obvious. Clean code does not depend on the original developer. In principle, any programmer can work with the code. This prevents problems that may occur when working with legacy code, for example. It is also easier to maintain the code because bugs can be identified and fixed more easily.

Code is clean if it can be understood easily – by everyone on the team. Clean code can be read and enhanced by a developer other than its original author. With understandability comes readability, changeability, extensibility and maintainability.

* Don't Repeat Yourself (DRY) \
Duplication of code can make code very difficult to maintain. Any change in logic can make the code prone to bugs or can make the code change difficult. This can be fixed by doing code reuse (DRY Principle). \
The DRY principle is stated as "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system". \
The way to achieve DRY is by creating functions and classes to make sure that any logic should be written in only one place.

* Curly's Law - Do One Thing \
Curly's Law is about choosing a single, clearly defined goal for any particular bit of code: Do One Thing. \
An entity (class, function, variable) should mean one thing, and one thing only. It should not mean one thing in one circumstance and carry a different value from a different domain some other time. It should not mean two things at once. It should mean One Thing and should mean it all of the time.

* Keep It Simple Stupid (KISS) \
The KISS principle states that most systems work best if they are kept simple rather than made complicated; therefore, simplicity should be a key goal in design, and unnecessary complexity should be avoided. \
Simple code has the following benefits: \
less time to write. \
less chances of bugs. \
easier to understand, debug and modify. \
Do the simplest thing that could possibly work. \
Don't make me think. \
Code should be easy to read and understand without much thinking. If it isn't then there is a prospect of simplification.

* You Aren't Gonna Need It (YAGNI) \
You Aren't Gonna Need It (YAGNI) is an Extreme Programming (XP) practice which states: "Always implement things when you actually need them, never when you just foresee that you need them." \
Even if you're totally, totally, totally sure that you'll need a feature, later on, don't implement it now. Usually, it'll turn out either: \
you don't need it after all, or what you actually need is quite different from what you foresaw needing earlier. \
This doesn't mean you should avoid building flexibility into your code. It means you shouldn't overengineer something based on what you think you might need later on. \
There are two main reasons to practice YAGNI: \
You save time because you avoid writing code that you turn out not to need. Your code is better because you avoid polluting it with 'guesses' that turn out to be more or less wrong but stick around anyway.

* Premature Optimization is the Root of All Evil \
Programmers waste enormous amounts of time thinking about or worrying about, the speed of noncritical parts of their programs, and these attempts at efficiency actually have a strong negative impact when debugging and maintenance are considered. \
We should forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil. Yet we should not pass up our opportunities in that critical 3%. - Donald Knuth

* Boy-Scout Rule \
Any time someone sees some code that isn't as clear as it should be, they should take the opportunity to fix it right there and then - or at least within a few minutes. \
This opportunistic refactoring is referred to by Uncle Bob as following the boy-scout rule - always leave the code behind in a better state than you found it. \
The code quality tends to degrade with each change. This results in technical debt. The Boy-Scout Principle saves us from that.

* Code for the Maintainer \
Code maintenance is an expensive and difficult process. Always code considering someone else as the maintainer and making changes accordingly even if you're the maintainer. After a while, you'll remember the code as much as a stranger. \
Always code as if the person who ends up maintaining your code is a violent psychopath who knows where you live.

* Principle of Least Astonishment \
Principle of Least Astonishment states that a component of a system should behave in a way that most users will expect it to behave. The behavior should not astonish or surprise users. \
Code should do what the name and comments suggest. Conventions should be followed. Surprising side effects should be avoided as much as possible.

## General rules
1. Follow standard conventions.
2. (KISS) Keep it simple stupid. Simpler is always better. Reduce complexity as much as possible.
3. Boy scout rule. Leave the campground cleaner than you found it.
4. Always find root cause. Always look for the root cause of a problem.

## Design rules
1. Keep configurable data at high levels.
2. Prefer polymorphism to if/else or switch/case.
3. Separate multi-threading code.
4. Prevent over-configurability.
5. Use dependency injection.
6. Follow Law of Demeter. A class should know only its direct dependencies.

## Understandability tips
1. Be consistent. If you do something a certain way, do all similar things in the same way.
2. Use explanatory variables.
3. Encapsulate boundary conditions. Boundary conditions are hard to keep track of. Put the processing for them in one place.
4. Prefer dedicated value objects to primitive type.
5. Avoid logical dependency. Don't write methods which works correctly depending on something else in the same class.
6. Avoid negative conditionals.

## Names rules
1. Choose descriptive and unambiguous names.
2. Make meaningful distinction.
3. Use pronounceable names.
4. Use searchable names.
5. Replace magic numbers with named constants.
6. Avoid encodings. Don't append prefixes or type information.

## Functions rules
1. Small.
2. Do one thing.
3. Use descriptive names.
4. Prefer fewer arguments.
5. Have no side effects.
6. Don't use flag arguments. Split method into several independent methods that can be called from the client without the flag.

## Comments rules
1. Always try to explain yourself in code.
2. Don't be redundant.
3. Don't add obvious noise.
4. Don't use closing brace comments.
5. Don't comment out code. Just remove.
6. Use as explanation of intent.
7. Use as clarification of code.
8. Use as warning of consequences.

## Source code structure
1. Separate concepts vertically.
2. Related code should appear vertically dense.
3. Declare variables close to their usage.
4. Dependent functions should be close.
5. Similar functions should be close.
6. Place functions in the downward direction.
7. Keep lines short.
8. Don't use horizontal alignment.
9. Use white space to associate related things and disassociate weakly related.
10. Don't break indentation.

## Objects and data structures
1. Hide internal structure.
2. Prefer data structures.
3. Avoid hybrids structures (half object and half data).
4. Should be small.
5. Do one thing.
6. Small number of instance variables.
7. Base class should know nothing about their derivatives.
8. Better to have many functions than to pass some code into a function to select a behavior.
9. Prefer non-static methods to static methods.

## Tests
1. One assert per test.
2. Readable.
3. Fast.
4. Independent.
5. Repeatable.

## Code smells
1. Rigidity. The software is difficult to change. A small change causes a cascade of subsequent changes.
2. Fragility. The software breaks in many places due to a single change.
3. Immobility. You cannot reuse parts of the code in other projects because of involved risks and high effort.
4. Needless Complexity.
5. Needless Repetition.
6. Opacity. The code is hard to understand.
