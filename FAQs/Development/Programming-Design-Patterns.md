# Programming Design Pattern
There are three main groups: Creational, structural and behavioral. Every pattern has its context to solve a particullary problem.

# Design Patterns

A software design pattern is a general, reusable solution to a commonly occurring problem within a given context in software design. They are like pre-made blueprints that can be customized to solve a recurring design problem in an application development. Through the several patterns they can be divided into 3 main families patterns.

https://refactoring.guru/design-patterns/creational-patterns
https://refactoring.guru/refactoring/techniques
https://refactoring.guru/refactoring/what-is-refactoring
https://refactoring.guru/refactoring/technical-debt

10 Design Patterns Explained in 10 Minutes : https://www.youtube.com/watch?v=tv-_1er1mWI

**CREATIONAL PATTERNS**
• Factory Method Provides an interface for creating objects in a super-class, but allows sub-classes to alter the type of objects that will be created. \
• Abstract Factory produce families of related objects without specifying their concrete classes. \
• Builder constructs complex objects step by step. The pattern allows to produce different types and representations of an object using the same construction code. \
• Prototype copy existing objects without making its code dependent on their classes. The common use of this pattern is on unit testings. \
• Singleton ensure that a class has only one instance, while providing a global access point to this instance. \

**STRUCTURAL PATTERNS**
• Adapter allows objects with incompatible interfaces to collaborate. \
• Bridge splits a large class or a set of closely related classes into two separate hierarchies, abstraction and implementation, which can be developed independently of each other. \
• Composite compose objects into tree structures and then work with these structures as if they were individual objects. \
• Decorator attaches new behaviors to objects by placing these objects inside special wrapper objects that contain the behaviors. \
• Facade provides a simplified interface to a library, a framework, or any other complex set of classes. \
• Flyweight fits more objects into the available amount of RAM by sharing state common parts between multiple objects instead of keeping all of the data in each object. \
• Proxy provides a substitute or placeholder for another object. A proxy controls access to the original object, allowing you to perform something either before or after the request gets through to the original object. \

**BEHAVIORAL PATTERNS**
• Chain of Responsibility passes requests along a chain of handlers. Upon receiving a request, each handler decides either to process the request or to pass it to the next handler in the chain. \
• Iterator traverses elements of a collection without exposing its underlying representation (list, stack, tree, etc.) \
• Memento saves and restore the previous state of an object without revealing the details of its implementation. \
• State lets an object alter its behavior when its internal state changes. It appears as if the object changed its class. \
• Template Method defines the skeleton of an algorithm in the super-class but lets sub-classes override specific steps of the algorithm without changing its structure. \
• Command turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request's execution, and support undo-able operations. \
• Mediator reduces chaotic dependencies between objects. The pattern restricts direct communications between the objects and forces them to collaborate only via a mediator object. \
• Observer defines a subscription mechanism to notify multiple objects about any events that happen to the object they're observing. \
• Strategy defines a family of algorithms, put each of them into a separate class, and make their objects interchangeable. \
• Visitor separates algorithms from the objects on which they operate. \


## Dependency Injection & Inversion of Control
https://www.youtube.com/watch?v=EPv9-cHEmQw

## What Are Microservices Really All About? (And When Not To Use It)
https://www.youtube.com/watch?v=lTAcCNbJ7KE



## Creational ----------------------------------------------------------------------------------------------------------------------------------------------------

### Dependency Injection (DI)
In software engineering, dependency injection is a programming technique in which an object or function receives other objects or functions that it requires, as opposed to creating them internally. https://en.wikipedia.org/wiki/Dependency_injection
```php
use Dependency;

class SomeAction
{
    protected $injection;

    public function _constructor(Dependency $dependency)
    {
        $this->injection = $dependency;
    }

    public static function getDependency(): object // for e.g.
    {
        return $this->injection;
    }
}
```
Dependency injection is often used to keep code in-line with the dependency inversion principle.

Dependency Injection & Inversion of Control: https://www.youtube.com/watch?v=EPv9-cHEmQw

### Inversion of Control (IoC)
Objects do not create other objects on which they rely to do their work. Instead, they get the objects that they need from an outside source.
Dependency Injection & DI Containers - Full PHP 8 Tutorial: https://www.youtube.com/watch?v=igx3bIl1T_c

#### Two minute programming: Dependency Injection in PHP
https://www.youtube.com/watch?v=JK7Imc3j8iY

### Singleton
The Singleton pattern is used when a class in your program should have just a single instance available to be called; for example, a single database object shared by different parts of the program. \
The Singleton pattern disables all other means of creating objects of a class except for the special creation method. This method either creates a new object or returns an existing one if it has already been created. \
The singleton object is initialized only when it’s requested for the first time: https://refactoring.guru/design-patterns/singleton/php/example \
Violates the Single Responsibility Principle. The pattern solves two problems at the time.

```php
final class Singleton
{
    private static ?Singleton $instance = null;

    public static function getInstance(): Singleton // It can be only instanciate as Singleton::getInstance()
    {
        return ! self::$instance instanceof self ? new self() : static::$instance;
    }

    private function __construct() {} // is not allowed to call from outside to prevent from creating multiple instances

    private function __clone() {} // prevent the instance from being cloned (which would create a second instance of it)

    private function __wakeup() {} // prevent from being unserialized (which would create a second instance of it)
}
```

### Prototype / Clone
Allows cloning objects, even complex ones, without coupling to their specific classes. All prototype classes should have a common interface that makes it possible to copy objects even if their concrete classes are unknown. Prototype objects can produce full copies since objects of the same class can access each other’s private fields. \
The Prototype pattern provides a convenient way of replicating existing objects instead of trying to reconstruct the objects by copying all of their fields directly. The direct approach not only couples you to the classes of the objects being cloned, but also doesn’t allow you to copy the contents of the private fields. \
The Prototype pattern lets you perform the cloning within the context of the cloned class, where the access to the class’ private fields isn’t restricted. \
https://refactoring.guru/design-patterns/prototype \
https://refactoring.guru/design-patterns/prototype/php/example

### Builder
To construct complex objects step by step this pattern allows you to produce different types and representations of an object output using the same construction code. Unlike other creational patterns, Builder doesn’t require products to have a common interface. That makes it possible to produce different products using the same construction process. https://refactoring.guru/design-patterns/builder

### Factory
Enables dynamic class creation. Promotes loose or flexible coupling.
```php

class Plan()
{
    public function starterPlan(string $plan="basic"): Plan
    {
        $planClass = "App\\Plans\\".ucwords($plan)."\\Plan";

        if (! class_exists($planClass)) {
            trow new \Exception("Class $planClass doesn't exist.");
        }

        return new $planClass;
    }
}

```

## Structural ----------------------------------------------------------------------------------------------------------------------------------------------------

### Facade
Provides a simplified (but limited) interface to a complex system of classes, library or framework. A facade is a class that provides a simple interface to a complex subsystem which contains lots of moving parts. A facade might provide limited functionality in comparison to working with the subsystem directly. However, it includes only those features that clients really care about. \
Having a facade is handy when you need to integrate your app with a sophisticated library that has dozens of features, but you just need a tiny bit of its functionality.

* The Facade class provides a simple interface to the complex logic of one or
* several subsystems. The Facade delegates the client requests to the
* appropriate objects within the subsystem. The Facade is also responsible for
* managing their lifecycle. All of this shields the client from the undesired
* complexity of the subsystem.

```php
namespace App\Facade\Subsystem;

class Facade
{
    protected $subsystem;

    public function __construct(Subsystem $subsystem)
    {
        $this->subsystem = $subsystem ? : new Subsystem();
    }

    public function operation(): string
    {
        $result = "Facade initializes subsystems:\n";
        $result .= $this->subsystem->operation();

        return $result;
    }
}
```

### Proxy
Provides an object that acts as a substitute for a real service object used by a client. A proxy receives client requests, does some work (access control, caching, etc.) and then passes the request to a service object. \
The proxy object has the same interface as a service, which makes it interchangeable with a real object when passed to a client. \
https://refactoring.guru/design-patterns/proxy/php/example

### Adapter
Alows incompatible objects to collaborate acting as a wrapper between two objects. It catches calls for one object and transforms them to format and interface recognizable by the second object. \
It’s very often used in systems based on some legacy code. In such cases, Adapters make legacy code work with modern classes or in common cases to support each 3rd-party service such as Slack, Facebook, SMS or (you-name-it), you can create a set of special wrappers that adapt calls from your app to an interface and format required by each 3rd-party class. \
https://refactoring.guru/design-patterns/adapter/php/example

## Behavioral ----------------------------------------------------------------------------------------------------------------------------------------------------

### State

### Iterator

### Decorator

### Observer

### Mediator

### State


***
## Refactoring
https://en.wikipedia.org/wiki/Code_refactoring

## List of patterns
https://www.tutorialspoint.com/design_pattern/index.htm



## Facade
https://en.wikipedia.org/wiki/Facade_pattern

## Encapsulation
https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)

## Filter
https://www.tutorialspoint.com/design_pattern/filter_pattern.htm

## Designing Event-Driven Systems
https://www.confluent.io/designing-event-driven-systems/?utm_medium=sem&utm_source=google&utm_campaign=ch.sem_br.nonbrand_tp.prs_tgt.what-is-it_mt.xct_rgn.emea_lng.eng_dv.all_con.event-sourcing&utm_term=event%20sourcing&creative=&device=c&placement=

## CQRS pattern
https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs#:~:text=CQRS%20stands%20for%20Command%20and,operations%20for%20a%20data%20store.&text=The%20flexibility%20created%20by%20migrating,conflicts%20at%20the%20domain%20level.

## Laravel - Desing Patterns
The main idea to use Repository Pattern in a Laravel application is to create a bridge between models and controllers. In other words, to decouple the hard dependencies of models from the controllers. The model should not be responsible for communicating with or extracting data from the database.

https://laracasts.com/discuss/channels/laravel/what-design-patterns-used-for-laravel-framework

https://asperbrothers.com/blog/implement-repository-pattern-in-laravel/


## 10 Design Patterns Explained in 10 Minutes
https://www.youtube.com/watch?v=tv-_1er1mWI