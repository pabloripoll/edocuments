# Listing Tutorial Priorities

FE - Pruebas unitarias y funcionales con frameworks como Jest, Jasmine, Karma o Cypress

Java Desarrollar con stack reactivo (Spring WebFlux, Reactor Netty, RXJava...).

https://blog.bytebytego.com/p/domain-name-system-the-internets

- https://dev.to/rock_win_c053fa5fb2399067/industry-wide-folder-packaging-structures-in-spring-boot-1hon
- [10 Backend Concepts You MUST Know to Crack Any Tech Interview](https://www.youtube.com/shorts/Yd7BX0u2Zvg)
- [Every Frontend Architecture Pattern Explained in 23 Minutes](https://www.youtube.com/watch?v=9-r0RuX0pqk)
- [99% of Developers Don't Get PostgreSQL](https://www.youtube.com/watch?v=P8rrhZTPEAQ)



## Other

- Ecuación de la circunsferencia: https://www.youtube.com/shorts/1c6AqvzlvUw
- Pasta para soldar: https://www.youtube.com/shorts/ImI88Qqp7Vs

Tree the project: https://gist.github.com/genadyp/ffc112df6c8b368127e3cbb37465d452
```bash
#!/bin/bash

#File: tree-md

tree=$(tree -tf --noreport -I '*~' --charset ascii $1 |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')

printf "# Project tree\n\n${tree}"
```
