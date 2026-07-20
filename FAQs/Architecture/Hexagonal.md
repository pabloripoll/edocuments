# Hexagonal Arquitechture

https://www.youtube.com/watch?v=th4AgBcrEHA

https://en.wikipedia.org/wiki/Alistair_Cockburn
https://www.youtube.com/watch?v=yQPMQJyX3rU
https://www.youtube.com/watch?v=AOIWUPjal60

https://www.nirmitee.io/blogs/hexagonal-architecture-what-you-get-out-of-it

https://www.youtube.com/watch?v=bDWApqAUjEI

https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)

The hexagonal architecture, or ports and adapters architecture, is an architectural pattern used in software design. It aims at creating loosely coupled application components that can be easily connected to their software environment by means of ports and adapters. This makes components exchangeable at any level and facilitates test automation.

https://herbertograca.files.wordpress.com/2018/11/100-explicit-architecture-svg.png

## Origins
The hexagonal architecture was invented by Alistair Cockburn in an attempt to avoid known structural pitfalls in object-oriented software design, such as undesired dependencies between layers and contamination of user interface code with business logic, and published in 2005.

The term "hexagonal" comes from the graphical conventions that shows the application component like a hexagonal cell. The purpose was not to suggest that there would be six borders/ports, but to leave enough space to represent the different interfaces needed between the component and the external world.

## Priciples
The hexagonal architecture divides a system into several loosely-coupled interchangeable components, such as the application core, the database, the user interface, test scripts and interfaces with other systems. This approach is an alternative to the traditional layered architecture.

Each component is connected to the others through a number of exposed "ports". Communication through these ports follow a given protocol depending on their purpose. Ports and protocols define an abstract API that can be implemented by any suitable technical means (e.g. method invocation in an object-oriented language, remote procedure calls, or Web services).

The granularity of the ports and their number is not constrained:

- a single port could in some case be sufficient (e.g. in the case of a simple service consumer) ;
- typically, there are ports for event sources (user interface, automatic feeding), notifications (outgoing notifications), database (in order to interface the component with any suitable DBMS), and administration (for controlling the component);
- in an extreme case, there could be a different port for every use case, if needed.

Adapters are the glue between components and the outside world. They tailor the exchanges between the external world and the ports that represent the requirements of the inside of the application component. There can be several adapters for one port, for example, data can be provided by a user through a GUI or a command-line interface, by an automated data source, or by test scripts.

## Notes
According to some authors, the hexagonal architecture is at the origin of the microservices architecture.

## Variants
The onion architecture proposed by Jeffrey Palermo in 2008 is similar to the hexagonal architecture: it also externalizes the infrastructure with interfaces to ensure loose coupling between the application and the database. It decomposes further the application core into several concentric rings using inversion of control.

The clean architecture proposed by Robert C. Martin in 2012 combines the principles of the hexagonal architecture, the onion architecture and several other variants; It provides additional levels of detail of the component, which are presented as concentric rings. It isolates adapters and interfaces (user interface, databases, external systems, devices) in the outer rings of the architecture and leaves the inner rings for use cases and entities. The clean architecture uses the principle of dependency inversion with the strict rule that dependencies shall only exist between an outer ring to an inner ring and never the contrary.

## Example Images
https://www.happycoders.eu/wp-content/uploads/2023/01/hexagonal-architecture-with-control-flow.v4-800x474.png \
https://miro.medium.com/v2/resize:fit:1170/1*aD3zDFzcF5Y2_27dvU213Q.png \
https://blog.allegro.tech/img/articles/2020-05-21-hexagonal-architecture-by-example/ha_example.png

## Drawbacks
https://blog.jdriven.com/2022/10/why-you-should-not-use-hexagonal-architecture/ \
https://www.linkedin.com/pulse/isnt-hexagonal-architecture-just-3-tier-new-dress-richard-smith/ \
https://medium.com/@gara.mohamed/hexagonal-architectures-common-misconceptions-9aa2380c13c0 \
https://www.jamesmichaelhickey.com/clean-architecture/

## Other links
https://medium.com/ssense-tech/hexagonal-architecture-there-are-always-two-sides-to-every-story-bc0780ed7d9c \
https://alistair.cockburn.us/hexagonal-architecture/ \
