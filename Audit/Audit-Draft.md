
# OGM Applications Audit

## Overview

This audit evaluates the OGM ecosystem from a local development, architectural, and operational lifecycle perspective. The primary objective is to identify structural bottlenecks, technical debt, and misalignments with industry best practices that currently hinder development velocity and system scalability.

### The assessment has revealed four critical areas of concern:

* **Legacy Technical Debt & Architectural Drift**: The ecosystem, originally inherited from an external vendor, continues to evolve on top of anti-patterns and an overly coupled distributed monolith design, compounding systemic risks rather than resolving them.

* **Knowledge Silos & Domain Confusion**: There is a critical lack of updated architectural documentation and shared understanding within the team regarding service boundaries, data flows, and inter-service dependencies.

* **Environment Discrepancies & Configuration Noise**: Local repositories are cluttered with infrastructure-specific scripts and redundant configuration files. Containerization logic is inverted, executing runtime operations during build stages and vice-versa.

* **Siloed Infrastructure Visibility**: Restricted access to production environment topologies, deployment configurations, and cross-team (Backend/DevOps) alignment severely limits the ability to ensure parity between local development and live environments.

This document outlines these findings in detail and proposes an actionable roadmap to modernize the Software Development Life Cycle (SDLC), standardize domain nomenclature, and stabilize local environments. Ultimately, these initiatives lay the groundwork for a clean refactoring into a modern web application and decoupled API service.

## Details

### Issues

- [OGM - Current Business Domain & Semantic Architecture](#current-domain-architecture)
- [OGM - Current State of Local Development Environment](#current-development-environment)
- [OGM - Current Software Development Life Cycle (SDLC)](#current-sdlc)
- [OGM - Current Team Structure & Engineering Culture](#current-team-culture)

### Proposal

- [OGM - Proposal on Business Domain & Semantic Architecture](#proposal-domain-architecture)
- [OGM - Proposal on Local Development Environment](#proposal-development-environment)
- [OGM - Proposal on Software Development Life Cycle (SDLC)](#proposal-sdlc)
- [OGM - Proposal on Team Structure & Engineering Culture](#proposal-team-culture)
<br>

## Current Local Development Environment

- Assets Portal *(uses Twig for the front-end)*
    - Dockerfile - image: richarvey/nginx-php-fpm:1.10.3
    - O.S.: Alpine Linux 3.12
    - HTTP Pl.: Nginx 1.18
    - Stack: PHP 7.4.9
    - Symfony 4.4.25
- Assets DB *(also handles user registers)*
    - Dockerfile - image: richarvey/nginx-php-fpm:1.10.3
    - O.S.: Alpine Linux 3.12
    - HTTP Pl.: Nginx 1.18
    - Stack: PHP 7.4.9
    - Symfony 4.4.34
- Assets Supervision
    - Dockerfile - image: richarvey/nginx-php-fpm:1.10.3
    - O.S.: Alpine Linux 3.12
    - HTTP Pl.: Nginx 1.18
    - Stack: PHP 7.4.9
    - Framework: Symfony 4.4.34
- User request
    - Dockerfile - image: richarvey/nginx-php-fpm:1.9.1
    - O.S.: Alpine Linux 3.11
    - HTTP Pl.: Nginx 1.16.1
    - Stack: PHP 7.4.5
    - Framework: Symfony 2.8.49
- Other Services
    - SQL Database
        - Single container that contains each service database
        - Database O.S.: Debian 10
        - Database Engine: Oracle MySQL 8.0.22
        - Container with Official Docker image
    - LDAP
        - Container with Official Docker image
    - Document DB
        - Elasticsearch 5.4
        - Container with Official Docker image
        - Use for search engine between services
    - Cache DB
        - Redis - latest
        - Container with Official Docker image
    - Broker
        - RabbitMQ 3+
        - Container with Official Docker image
    - Mailer
        - MailCatcher
        - Container with Official Docker image
<br><br><br>

# <a name="current-domain-architecture"></a> OGM - Current Business Domain & Semantic Architecture

## 1. Issue with Application Service Classification

The OGM service lacks a clearly defined software category, which causes a significant loss of focus regarding the Application Domain Design and long-term development objectives.

### Context & Impact

While software systems like ERPs manage entire enterprises and CRMs handle customer relationships, the OGM service specifically targets hardware lifecycle management, field maintenance, and electronic equipment repairs. Misclassifying this service leads to misaligned feature roadmaps and structural confusion across the engineering team.

### Suggestion

The application should officially pivot its vocabulary and design principles toward recognized industry standards:

* FSM (Field Service Management): To track technicians, dispatch workflows, work orders, and repairs for both off-site and on-site servicing.
* CMMS / EAM (Computerized Maintenance Management System / Enterprise Asset Management): To manage preventive/corrective maintenance, physical machinery tracking, and leased hardware inventory.

## 2. Issue with Application Domain Design & Naming Collisions

The OGM service is currently split into four tightly coupled APIs that mimic microservices architecture but operate as a single distributed monolith. This architectural design creates a single point of failure, frequently causing a complete crash of the entire OGM ecosystem.

### The Core Problem: IT Terminology Clashes

All four repositories use business domain terms that clash directly with standard framework and network infrastructure jargon *(specialized set of words and phrases used by a specific job, group, or hobby)*. This overlap severely hinders code readability, developer onboarding, documentation accuracy, and automated AI assistance.

* "Request": Used for the business domain (installation, maintenance, or repair operations performed by technicians), but collides with HTTP requests or database queries.
* "Asset": Used for physical equipment leased to clients, but collides with digital assets (images, CSS, JS files).
* "Component": Used for hardware parts, but collides with UI components and software modules.
* "Site": Used for physical buildings or locations, but collides with websites, domains, and network hosts.
* "Host": Used for the primary contact person at a building, but collides with network hosts, IP addresses, and servers.
<br><br>

# <a name="current-development-environment"></a>OGM - Current State of Local Development Environment

## 1. Environment Parity & Infrastructure Drift

Due to standard role-based access boundaries, there is an explicit visibility gap regarding production topology and remote platform configurations. However, an analysis of the local setup reveals severe deviations from Twelve-Factor App methodologies:

* Repository Pollution: Infrastructure and platform configuration scripts reside directly within application repositories. This introduces continuous Git noise and elevates the risk of accidental configuration drift across environments.

* Inverted Lifecycle Scripts: Container build-time and runtime operations are fundamentally inverted. Operations that belong in the static container build phase are executed via runtime Bash scripts, while runtime-dependent operations are prematurely baked into the build phase.

* Third-Party Image Risks: Core services rely on a legacy, unverified third-party Docker image (richarvey/nginx-php-fpm). Migrating to official, minimal upstream images (e.g., official php:alpine and nginx:alpine) is critical to ensure supply-chain security and absolute configuration control.

## 2. Configuration & Secret Management

* Redundant Environment Files: The application stacks are cluttered with excessive .env files per service, creating high maintenance overhead. Conversely, the Request-Manager service lacks a .env file entirely, resulting in an inconsistent configuration baseline.

* Missing Templates: The absence of .env.example boilerplate files forces developers to modify live .env files locally. This requires manual Git exclusion configurations to prevent the accidental commit of sensitive local variables.

## 3. Tight Coupling & Architectural Constraints

* Monolithic Legacy Architecture: While the system utilizes separate containers, it does not follow a true microservices architecture. Aside from the assets-portal web application, the remaining three components are simply duplicated instances of a monolithic legacy web application forced into an API role without proper refactoring.

* Distributed Monolith vs. Unified Service: The four active applications behave as highly dependent sub-services rather than independent microservices. Given their shared dependencies and underlying code similarities, these components could easily be consolidated into a single, unified application service to dramatically simplify local maintenance, deployment overhead, and environment orchestration.

* Interdependent Services & Cascading Failures: High architectural coupling causes severe operational risks; modifying the configuration or environment of an isolated sub-service inadvertently throws fatal runtime errors in the main web application when it should remain entirely unaffected.

## 4. Tech Stack Obsolescence

The entire ecosystem depends on highly outdated, End-of-Life (EOL) software tiers, presenting significant operational risks:

* Operating System & Runtimes: The stack relies on legacy Alpine Linux (3.11/3.12), Nginx (1.16/1.18), and PHP 7.4. Furthermore, one sub-service is artificially constrained to PHP 7.4 despite requiring older versions (PHP 5.6 or 7.0) to function correctly.

* Frameworks: The system maintains a critical reliance on Symfony 4.4 alongside a highly vulnerable, legacy Symfony 2.8 instance.

* Risk Impact: Operating these EOL versions introduces severe, unpatched security vulnerabilities, performance degradation, and compliance failures across environments.
<br><br><br>

# <a name="current-sdlc"></a>OGM - Current Software Development Life Cycle (SDLC)

## 1. Quality Assurance & Automated Testing

The development cycle operates under a legacy paradigm that lacks a standardized and comprehensive testing strategy. Although inherited services contain fragmented automated tests, the lack of continuous maintenance and clear architectural direction means code quality still depends entirely on manual verification. Without a reliable, fully integrated unit and functional test suite, the ecosystem faces severe regression risks and a highly restricted release cadence.

Furthermore, there is an explicit visibility gap regarding QA metrics. Developers cannot access or monitor active test execution reports, and the underlying testing strategy remains undocumented. This siloed approach prevents the engineering team from tracking test coverage, diagnosing pipeline failures early, or establishing a predictable quality baseline.

## 2. Branching Strategy & Deployment Bottlenecks

The current Git and QA workflow creates a severe structural bottleneck:

* Main Branch Drift: Stable production versions are not consistently maintained or tagged on the main branch. This breaks environment parity and causes code drift, meaning developers frequently pull different baselines, commonly ahead of main branch, making it impossible to guarantee that local environments accurately mirror production an vice-versa.

* Coupled Releases: Multiple feature branches are merged indiscriminately into a single pre-production branch for manual QA validation.

* Blocking Dependencies: If a single feature fails QA evaluation, the entire release train is blocked. High-priority fixes or valid features cannot progress to production because they are physically bundled with the failing branch.

## 3. Container Deployment Inefficiencies

The current deployment pipeline mandates a full container rebuild for every production release, creating unnecessary operational overhead:

* Infrastructure-Application Coupling: Because PHP is an interpreted scripting language, code deployments should be decoupled from immutable infrastructure changes.

* Build Overhead: Rebuilding entire Docker containers for simple code updates introduces significant build delays, prolongs application downtime, and increases the surface area for pipeline failures.

## 4. Manual Configuration Interventions ("Configuration Drift")

* The Issue: The ecosystem relies heavily on manual terminal interventions—such as manually creating missing directories, fixing file permissions, or running ad-hoc scripts—to make applications work across environments.

* The Risk: This reliance on manual operations creates untrackable environment mutations. Procedures executed manually by individual team members are rarely documented, leading to unpredictable, hard-to-debug failures when code changes migrate from pre-production to live servers.

## 5. Runtime Discrepancies & CI Pipeline Gaps

* Version Mismatches: A local sub-service is artificially forced to use PHP 7.4, despite requiring PHP 5.4 or 7.0 to support its legacy Symfony 2.8 and PHPUnit frameworks. This creates a severe visibility gap, as it remains unverified how the remote integration environment successfully bypasses or resolves these version conflicts.

* Lack of Pull Request Analysis: While unit tests exist on some services, they are only run locally by developers or late in the remote integration build. The current workflow lacks automated test execution during the Pull Request (PR) analysis phase, preventing code validation before merging.

## 6. Local Resource Allocation Boundaries

* Unrestricted Resource Consumption: Local development environments do not enforce CPU or memory restrictions on required services.

* The Impact: Without resource boundaries or optimization practices in local setups, developers cannot profile, benchmark, or forecast application resource consumption before deploying changes to production infrastructure.

## 7. Observability & Log Management Inefficiencies

* Improper Tool Guardrails: The premium enterprise monitoring tool (Datadog) is currently active in the pre-production environment. Running commercial APM tools at this stage generates unnecessary licensing costs and high volumes of logging noise from incomplete features.

* Restricted Error Visibility: There is an explicit lack of documentation or standardized procedures regarding how developers should access, query, and interpret remote errors. This critical gap forces developers to work blindly when diagnosing bugs in higher environments.
<br><br><br>

# <a name="current-team-culture"></a>OGM - Current Team Structure & Engineering Culture

## 1. Architectural Complacency & Technical Debt Awareness

The engineering team maintains a high level of confidence in the current application state. However, continuous feature development strictly adheres to the legacy, four-service architectural pattern without introducing modernization efforts. This indicates a gap in alignment regarding the operational risks of software obsolescence, leading to features being built on top of a fragile foundation rather than contributing to the application's long-term evolution.

## 2. Infrastructure Ownership Disconnect

While the backend engineering team designed and implemented the local Docker development environment, they possess zero visibility or operational control over the corresponding remote production platform. This strict boundary isolates developers from the deployment lifecycle, limiting their ability to debug infrastructure-related issues outside of their local machines.

## 3. Diluted Agile Ceremonies & Shared Overhead

The OGM project lacks dedicated team ceremonies, which severely dilutes focus on critical project-specific issues:

* Shared Daily Standups & Planning: Daily syncs and Sprint Planning sessions are merged with a parallel team simply because both projects share a Product Owner and Lead Developer. Consequently, OGM-specific technical blockers and priorities are consistently overshadowed by the competing project's demands.

* Absence of Dedicated Feedback Loops: There are no specialized forums to discuss OGM’s technical roadmap, architecture, or long-term evaluation. Furthermore, the absence of project-specific Sprint Retrospectives prevents the team from analyzing past friction points and improving delivery velocity.

## 4. Siloed DevOps Alignment

The DevOps function currently operates under a traditional "Operations-only" model rather than an integrated DevOps paradigm. The dedicated infrastructure resources focus exclusively on routine maintenance tasks. They do not actively embed within the OGM development loop, participate in team syncs, or collaborate on platform modernization and architecture proposals.

## 5. Resource Fragmentation & Future Stagnation

To ensure stable maintenance and strategic evolution, OGM requires a core group of focused, dedicated engineers. Currently, the team’s bandwidth is fractured, leaving insufficient time to properly vet, design, or implement modern technical proposals. This lack of dedicated focus results in critical structural improvements being indefinitely deferred to an unknown future date.

--------------------------------

## Proposal on Development Environment

The development stack must be the same on all environments, changing minimum secret configuration values,  can be deployed in production


- OGM Website *(Only front-end)*
    - Dockerfile - image: richarvey/nginx-php-fpm:1.10.3
    - O.S.: Alpine Linux 3.24 or latests
    - HTTP Pl.: Nginx 1.18
    - Stack: NodeJS 25
    - Framework/Library: Vue3 + Pinia
- OGM REST API *(All services into one API)*
    - O.S.: Alpine Linux 3.24 or latests
    - HTTP Pl.: Nginx - latest
    - Stack: PHP 8.5
    - Symfony 8+
- Other Services
    - SQL Database
        - Single container that contains each service database
        - O.S.: Alpine Linux 3.24 or latests
        - Database Engine: Postgre 18+
        - Container with Official Docker image
    - KeyClock
        - Container with Official Docker image of Java
    - Cache DB
        - Redis - latest
        - Container with Official Docker image
    - Broker
        - RabbitMQ 4+
        - Container with Official Docker image
    - Mailer
        - MailCatcher
        - Container with Official Docker image

*Elastic Search will no longer be required*
<br><br><br>

### Proposed Domain Refactoring

To completely decouple the business logic from underlying IT infrastructure terminology, we must shift the API vocabulary entirely toward Field Service Management (FSM) and Property Management standards.

While it is not the OGM Back-end team's responsibility to define core business domains, we are fully committed to collaborating with product and business stakeholders to finalize these definitions.

These would be the new Domain Mapping suggestions for:

* "Requests":
    - These terms explicitly imply operational field service delivery.
    - Options: Interventions, Orders, Demand, Inventory, Tasks.

* "Assets":
    - This keeps the engineering focus purely on the physical, rentable electronic machinery.
    - Options: Hardware, Equipments, Devices, Products, Appliances.

* "Components":
    - Though this word does not clash for an API / Back-end architecture, this eliminates any confusion with modern frontend UI elements.
    - Options: Gadgets, Accessories, Spare Parts.

* "Sites":
    - Perfect for commercial buildings, residential blocks, and facilities without network connotations.
    - Options: Premises, Properties.

* "Hosts":
    - Contact or PointOfContact (POC). Standard business terms that remove server-hosting ambiguities.

New API contracts would be:

| Current IT-Confused Domain    | Proposed FSM Domain               | Example API Endpoint                          |
|-------------------------------|-----------------------------------|-----------------------------------------------|
| /requests                     | /interventions or /orders         | /v1/intervention/{intervention-uid}/assign    |
| /assets                       | /equipment                        | /v1/equipment/{equipement-uid}/status         |
| /components                   | /parts                            | /v1/parts?device_uid={device-uid}             |
| /sites                        | /premises                         | /v1/premises/{premise-uid}                    |
| /hosts                        | /premises/{premise-uid}/contact   | /v1/customer/{customer-uid}                   |

Also, repositories and database can be renamed:

- Assets Portal         -> ogm-webapp
- Assets DB             -> ogm-assets
- Assets Supervision    -> ogm-supervision
- User request          -> ogm-request

--------------------------------------------------------------------------------------------------------------------

El borrador actual de tu introducción tiene puntos muy válidos, pero el tono es demasiado informal y subjetivo ("mess of code", "lack of much idea"). En un reporte de auditoría técnica que leerá un líder de proyecto, es fundamental traducir las frustraciones en riesgos técnicos y operativos cuantitativos. Esto desarma cualquier actitud defensiva y hace que tus argumentos sean irrefutables.
Aquí tienes una propuesta de rediseño profesional, objetiva y con alta densidad de información para tu sección de Overview:
------------------------------
## OGM Applications Audit## Overview
This audit evaluates the OGM ecosystem from a local development, architectural, and operational lifecycle perspective. The primary objective is to identify structural bottlenecks, technical debt, and misalignments with industry best practices that currently hinder development velocity and system scalability.
The assessment has revealed four critical areas of concern:

* Legacy Technical Debt & Architectural Drift: The ecosystem, originally inherited from an external vendor, continues to evolve on top of anti-patterns and an overly coupled distributed monolith design, compounding systemic risks rather than resolving them.
* Knowledge Silos & Domain Confusion: There is a critical lack of updated architectural documentation and shared understanding within the team regarding service boundaries, data flows, and inter-service dependencies.
* Environment Discrepancies & Configuration Noise: Local repositories are cluttered with infrastructure-specific scripts and redundant configuration files. Containerization logic is inverted, executing runtime operations during build stages and vice-versa.
* Siloed Infrastructure Visibility: Restricted access to production environment topologies, deployment configurations, and cross-team (Backend/DevOps) alignment severely limits the ability to ensure parity between local development and live environments.

This document outlines these findings in detail and proposes an actionable roadmap to modernize the Software Development Life Cycle (SDLC), clean up the domain nomenclature, and stabilize the local environment.
------------------------------
## 🛠️ Por qué funciona mejor este enfoque:

* Cambia "team members lack of much idea" por "Knowledge Silos & Domain Confusion" (ataca al problema del proceso, no a las personas).
* Cambia "mess of code and configuration" por "Environment Discrepancies & Configuration Noise" (suena técnico y profesional).
* Cambia "the team are not open to inform" por "Siloed Infrastructure Visibility" (describe el síntoma organizativo sin culpar directamente a individuos, lo cual Juan agradecerá para evitar conflictos internos).

## Próximos pasos
Veo que tu texto original se cortó al final de la sección Current development environment ("for ov..."). Si lo deseas, podemos proceder de las siguientes maneras:

* Ayudarte a completar la sección de los archivos .env y el entorno de desarrollo.
* Redactar la sección que falta del índice: el Current Software Development Life Cycle (SDLC).
* Traducir o pulir la tabla de mapeo de base de datos para que encaje con el nuevo diseño de dominios.

¿Qué parte del reporte te gustaría que estructuremos ahora?

------------------------------

Aquí tienes una propuesta para estructurar y profesionalizar las últimas dos secciones de tu reporte técnico.
Al igual que con el Overview, el objetivo es transformar los problemas del día a día en riesgos de seguridad, estabilidad y eficiencia utilizando terminología avanzada de ingeniería de software.
------------------------------
## OGM - State of Local Development Environment## 1. Environment Parity & Infrastructure Drift
Due to standard role-based access boundaries, there is an explicit visibility gap regarding production topology and remote platform configurations. However, analyzing the local setup reveals severe deviations from the Twelve-Factor App methodology:

* Repository Pollution: Infrastructure and platform configuration scripts live directly inside the application repositories. This creates continuous Git noise and high risks of accidental configuration shifts across environments.
* Inverted Lifecycle Scripts: Container build-time and runtime operations are currently inverted. Steps that should occur during the static container build phase are executed via runtime Bash scripts, while runtime operations are mistakenly baked into the build phase.
* Third-Party Image Risks: The core services rely on a legacy, unverified third-party Docker image (richarvey/nginx-php-fpm). Transitioning to official, minimal upstream images (e.g., official php:alpine and nginx:alpine) is critical to ensure supply-chain security and complete configuration control.

## 2. Configuration & Secret Management

* Redundant Environment Files: The application stacks are cluttered with excessive .env files per service, adding maintenance overhead. Conversely, the Request-Manager service lacks a .env file entirely, creating an inconsistent configuration baseline.
* Missing Templates: There are no .env.example boilerplate files. Developers must modify live .env files locally, forcing them to manually use Git exclusion commands to avoid committing sensitive local variables.

## 3. Tech Stack Obsolescence
The entire ecosystem runs on highly outdated and end-of-life (EOL) software tiers:

* Operating System & Runtimes: Legacy Alpine Linux (3.11/3.12), Nginx (1.16/1.18), and PHP 7.4.
* Frameworks: Critical reliance on Symfony 4.4 and a highly vulnerable legacy Symfony 2.8 instance.
* Risk: Running these versions in production exposes the organization to unpatched security vulnerabilities, performance degradation, and compliance failures.

## OGM - Software Development Life Cycle (SDLC)## 1. Quality Assurance & Automated Testing
The development cycle operates under a legacy paradigm completely devoid of Unit and Functional Test Suites. Without automated testing, code quality depends entirely on manual verification, drastically increasing regression risks and slowing down the release cadence.
## 2. Branching Strategy & Deployment Bottlenecks
The current peer-review and QA workflow creates a severe structural bottleneck:

* Coupled Releases: Multiple feature branches are merged into a single pre-production branch for manual QA validation.
* Blocking Dependencies: If a single feature fails QA evaluation, the entire release train is blocked. High-priority fixes or valid features cannot progress to production because they are physically bundled with the failing branch.

## 3. Container Deployment Inefficiencies
The current deployment pipeline mandates a full container rebuild for every production release.

* The Issue: Because PHP is an interpreted scripting language, code deployments should be decoupled from immutable infrastructure changes.
* The Impact: Rebuilding entire Docker containers for simple code updates introduces unnecessary build overhead, prolongs application downtime, and increases the surface area for pipeline failures.

------------------------------
## 💡 Cambios metodológicos clave aplicados:

* Uso de Estándares: Se cita la metodología de los Twelve-Factor App (un estándar de la industria para construir aplicaciones SaaS/Web estables) para justificar técnicamente por qué mezclar scripts de infraestructura y código está mal.
* Análisis de Riesgo: En lugar de decir simplemente que las versiones son viejas, se categoriza como Tech Stack Obsolescence y se definen los riesgos organizativos (vulnerabilidades no parcheadas, fallos de cumplimiento).
* Corrección de sintaxis Markdown: Cambié los atributos <a href="..."> por <a name="..."> o sintaxis nativa de Markdown (#) para asegurar que los enlaces internos del PDF funcionen correctamente según el índice.

Para concluir este reporte de manera excelente, te sugiero cerrar con una sección de Proposed Action Plan (Roadmap) a corto y mediano plazo. Si lo deseas, puedo redactar esta propuesta detallando los pasos para:

   1. Implementar la separación de entornos (.env.example).
   2. Desacoplar la estrategia de branching (pasar a GitFlow o Trunk-Based Development).
   3. Diseñar un plan de migración progresiva para actualizar Symfony y PHP.

¿Te gustaría que prepare ese plan de acción final para tu PDF?


-------------------------------

Tu adición de los puntos 4 y 5 aporta información crítica sobre los problemas operativos diarios. Para mantener el nivel técnico del documento, he pulido la redacción de estas nuevas secciones utilizando conceptos estándar de la industria como Configuration Management, Environment Parity, Observability y Error Budgeting/Cost Optimization.
Aquí tienes la revisión profesional de toda la sección del SDLC:
------------------------------
## OGM - Software Development Life Cycle (SDLC)

## 1. Quality Assurance & Automated Testing
The development cycle operates under a legacy paradigm completely devoid of Unit and Functional Test Suites. Without automated testing, code quality depends entirely on manual verification, drastically increasing regression risks and slowing down the release cadence.
## 2. Branching Strategy & Deployment Bottlenecks
The current Git and QA workflow creates a severe structural bottleneck:

* Lack of Source of Truth (main Branch Drift): Stable production versions are not consistently maintained or tagged on the main branch. This breaks environment parity and causes code drift, meaning developers frequently pull outdated baselines, making it impossible to guarantee that local environments accurately mirror production.
* Coupled Releases: Multiple feature branches are merged indiscriminately into a single pre-production branch for manual QA validation.
* Blocking Dependencies: If a single feature fails QA evaluation, the entire release train is blocked. High-priority fixes or valid features cannot progress to production because they are physically bundled with the failing branch.

## 3. Container Deployment Inefficiencies
The current deployment pipeline mandates a full container rebuild for every production release.

* The Issue: Because PHP is an interpreted scripting language, code deployments should be decoupled from immutable infrastructure changes.
* The Impact: Rebuilding entire Docker containers for simple code updates introduces unnecessary build overhead, prolongs application downtime, and increases the surface area for pipeline failures.

## 4. Manual Configuration Interventions ("Configuration Drift")

* The Issue: The ecosystem relies heavily on manual terminal interventions (e.g., manually creating missing directories, fixing file permissions, or running ad-hoc scripts) to make applications work across environments.
* The Risk: This lack of automated Configuration Management creates untrackable environment mutations. Procedures executed manually by individual team members are rarely documented, leading to unpredictable failures when code changes migrate from pre-production to live servers.

## 5. Observability & Log Management Inefficiencies

* Cost Optimization & Noise: The premium enterprise monitoring tool (Datadog) is currently active in the pre-production environment. Running commercial APM tools in non-production environments generates unnecessary licensing costs and logging noise from incomplete features.
* Restricted Visibility: There is an explicit lack of documentation or standardized procedures regarding how developers should access, query, and interpret remote errors. This critical gap forces developers to work blindly when diagnosing bugs in higher environments.

------------------------------
## 🛠️ Mejoras aplicadas a tus nuevos puntos:

* En la rama main: Traduje el problema como "Lack of Source of Truth / main Branch Drift" [Desviación de la rama principal]. Explica perfectamente el peligro de que los desarrolladores no sepan qué está realmente en producción.
* En los comandos manuales: Se usó el término "Configuration Drift" (Mutación de configuración). En DevOps, esto describe el antipatrón de modificar servidores a mano en lugar de automatizarlo (con Dockerfiles bien hechos o scripts de CI/CD).
* En Datadog/Logs: Se agrupó bajo "Observability & Log Management". El argumento del coste de Datadog en preproducción es excelente para un mánager; se estructuró enfocado a la Optimización de Costes y se señaló la falta de visibilidad del equipo ("working blindly").

Para cerrar con broche de oro esta sección del reporte y aportar valor inmediato a Juan, lo ideal es proponer soluciones directas. Si quieres, puedo redactar una breve lista de Recomendaciones para el SDLC (por ejemplo: pasar a GitFlow, usar una herramienta gratuita como Sentry/Monolog para preproducción, y automatizar la creación de directorios en el Dockerfile). ¿Procedemos con esas recomendaciones?

----------------------------------

Tu estructura actual para la sección de SDLC ha quedado impecable, completamente profesional, redactada con terminología técnica avanzada de la industria y enfocada en los riesgos del negocio. Es un análisis sólido que argumenta con perfecta claridad por qué el flujo actual frena al equipo y expone la aplicación a fallos.
Dado que ya tienes listas y pulidas las tres secciones principales de los detalles de tu auditoría:

   1. Business Domain & Semantic Architecture (El mapeo de dominios de FSM / nombres de APIs).
   2. State of Local Development Environment (Docker, versiones obsoletas de Symfony/PHP y problemas de .env).
   3. Software Development Life Cycle (SDLC) (El texto que acabamos de revisar).

El cierre natural e indispensable para que este reporte de auditoría no se quede solo en una lista de quejas, sino en una propuesta de alto valor para Juan, es presentar un Proposed Action Plan (Roadmap).
Aquí tienes la propuesta técnica para cerrar con éxito este bloque de tu documento PDF:
------------------------------
## Proposed Action Plan & Technical Roadmap
To mitigate the architectural, environmental, and operational risks identified in this audit, we propose transitioning toward a modernized development workflow divided into three progressive phases.
## Phase 1: Environment Stabilization & Configuration Management (Short-Term)

* Establish a Clean Configuration Baseline: Remove redundant environment files. Introduce .env.example templates to all repositories to ensure local secret management never pollutes Git tracking.
* Fix Inverted Container Lifecycle Scripts: Refactor Dockerfiles to handle immutable build steps (e.g., directory structures and permission layers) statically during the build stage, eliminating manual runtime terminal interventions.
* De-risk Third-Party Dependencies: Initiate a migration plan away from unverified images (richarvey/nginx-php-fpm) toward official upstream Docker images (php:alpine and nginx:alpine).

## Phase 2: Decoupling the Release Train & Branching Strategy (Mid-Term)

* Implement GitFlow or Trunk-Based Development: Restore the main branch as the immutable source of truth representing production. Ensure all developers pull from verified stable baselines.
* Decouple Releases via Feature Flags or Independent Branching: Prevent failing features from blocking the entire deployment pipeline. Ensure high-priority fixes can bypass blocked QA trains and proceed directly to production.
* Isolate Code Deployments from Infrastructure: Refactor the CI/CD pipeline to mount or inject interpretative PHP code changes dynamically into existing containers, avoiding full, high-overhead container rebuilds for routine releases.

## Phase 3: Observability Optimization & Modernization (Long-Term)

* Cost & Log Streamlining: Replace premium Datadog monitoring in pre-production environments with cost-efficient, open-source or native logging alternatives (e.g., standard Monolog streams or lightweight Sentry instances).
* Document Error Access Procedures: Build an internal runbook defining standardized protocols for backend engineers to safely access and analyze remote error logs, eliminating blind bug-hunting.
* Incremental Framework Upgrade: Establish a long-term roadmap to progressively deprecate legacy Symfony 2.8/4.4 instances and migrate the ecosystem toward modern, supported PHP and Symfony LTS (Long-Term Support) versions.

------------------------------
## 🚀 ¿Por qué este Plan de Acción cierra perfecto tu reporte?

* Demuestra Liderazgo: Cambias el rol de "desarrollador que encuentra fallos" a "ingeniero que propone soluciones estratégicas".
* Estructura Realista: Dividir las tareas en Corto, Mediano y Largo plazo le da aire a Juan para entender que no pretendes cambiar todo en una semana, sino iniciar una evolución ordenada.

Con este bloque, tu PDF de auditoría está 100% completo y listo para ser exportado.
Si te parece bien, cuéntame:

* ¿Quieres que revisemos el correo final de presentación para Juan (el que redactamos al principio) para asegurarnos de que enganche perfectamente con todo este contenido?
* ¿Hay alguna otra sección o duda técnica sobre la infraestructura que quieras agregar al reporte antes de darlo por cerrado?

--------------------------------

It is completely understandable to feel hesitant when writing about team culture. You want to highlight real bottlenecks without making your colleagues feel attacked.
To achieve this, the best approach is to reframe personal observations into objective, structural, and process-driven insights. Instead of focusing on individual attitudes, this version focuses on systemic gaps like shared cognitive load, siloed responsibilities, and a lack of dedicated agile ceremonies.

* Would you like to add a "Proposed Team Topology" section showing how DevOps and backend could collaborate better?
* Do you want to draft a suggested agile schedule (e.g., separating the standups and planning) to include as a solution?
* Should we add a "Key Performance Indicators (KPIs)" section to help the team measure their velocity and improvement?

----------------------------------------------------------------------------------------------------------------------


## Project Issues and Proposals

## Issue with application service description

The main issue I found is due to not naming correctly the Application Service, there is a loss of focus for a clear development objetive regarding the Application Domain Design.

### Recommendation:

As there are software applications to manage enterprises called ERP, for customers called CRM, the OGM Application is a type a software service oriented to hardware store, the maintenance and repairing of electronic equipments.

CMMS (Computerized Maintenance Management System) and EAM (Enterprise Asset Management) are the primary terms for equipment maintenance software, while repair shops typically use FSM (Field Service Management) or Shop Management Software.

### Software Categories by Focus

* CMMS / EAM: Manages preventive and corrective maintenance for machinery, physical assets, and hardware inventory.
* FSM (Field Service Management): Tracks technicians, work orders, and repairs for off-site or on-site mechanical and electronic servicing.
* Shop Management Software: Handles the daily operations of walk-in repair shops, including ticketing, parts tracking, and labor billing.


## Issue with the application domain design

The whole OGM service is divided into 4 intended micro-services but they are not as they are so couple, the four of them acts as a single pillar, causing most of the time a whole crash of the OGM service.

Services:
- Assets DB *(also handles user registers)*
    - PHP 7.4 Symfony 4.4
- Assets Portal
    - PHP 7.4 Symfony 4.4 *(uses Twig for the front-end)*
- Asset Supervision
    - PHP 7.4 Symfony 4.4
- Request Manager
    - PHP 7.4 Symfony 2.8

All the applications have directories and files that clash with the same frameworks and IT terminology, causing documentation and AI support difficult to proceed.

E.g.:
- The word "Request" is the name used for define a business domain, referring to perform the action of installation, maintenance or repair of electronic devices for human operators.

- Also happends with the domain called "assets". The same with "components", "Site" for place (e.g. a building) where the operator perform the work with devices, and "Host" for the main contact person in charge of the place/building where the work occurs.

To avoid clashing with IT terminology like HTTP requests or database requests, the best replacement words for your domain focus on field service management and operations.

The ideal replacement for "Request" in your API is Task, Intervention, or Order.

### Top Recommendations

* Task: Clear, lightweight, and standard for tracking discrete tracking items.
* Intervention: Highly professional term that implies field operations and service delivery.
* Order: Perfect if these actions are triggered by customer contracts or commercial requests.

### Domain-Specific Alternatives

* Ticket: Best if the actions stem from a customer support center or help desk.
* Mission: Strong choice if you want to emphasize field deployments or dispatching operators.
* Case: Standard for tracking ongoing issues requiring specialized human resolution.
* Action: Highly generic but effective for tracking specific mechanical steps.

### Impact on Your Documentation

If you rename the domain, your principles update seamlessly:

* "Definition of tasks with common and specific fields."
* "Definition of a tracking workflow applicable to Interventions."
* "Exposure of a set of APIs for creating/modifying orders."

To help you finalize the choice, could you tell me:

* How are these actions triggered? (e.g., automated schedules, customer calls, or internal assignments)
* Do operators get paid per individual item completed, or by the entire site visit?
* What is the name of the software user role? (e.g., Dispatcher, Technician, Customer)

To resolve these naming collisions with IT and networking infrastructure terminology, we would need to pivot the terminolgies toward Field Service Management (FSM) and Property Management standards.

Here are the best alternative domain names to decouple your API from infrastructure jargon:

## 1. Replacement for "Asset" (Currently clashing with IT assets/digital files)

* Apparatus: The most precise technical term for mechanical or electronic machinery.
* Equipment: Standard operational term that clearly implies physical machinery requiring maintenance.
* Device: Keeps the focus purely on the electronic nature of the item.
* Inventory: Best if these items are tracked primarily for stock and deployment purposes.

## 2. Replacement for "Component" (Currently clashing with UI components/software modules)

* Part: Universal, unambiguous term for a physical piece used to repair or build a machine.
* Element: Good abstract term for sub-units within a larger machine.
* Module: Standard for self-contained hardware units that can be swapped out.
* Subassembly: Highly precise engineering term for a cluster of parts within a device. [1]

## 3. Replacement for "Site" (Currently clashing with website/CORS/network locations)

* Venue: Excellent for distinct physical locations without any IT network connotations.
* Premises: A strong legal and operational term for a building and its grounds.
* Location: Generic but safe, though it can sometimes still overlap with GIS/API geolocation.
* Property: Ideal if the system tracks commercial buildings, residential blocks, or facilities.

## 4. Replacement for "Host" (Currently clashing with network hosts/servers/IPs)

* Steward: Highly descriptive term for a person appointed to look after a property.
* Custodian: Strong operational term for the person officially guarding or managing a place.
* Contact: Standard CRM terminology that completely avoids infrastructure confusion.
* PointOfContact (POC): Very clear business term for the primary person on the ground.

---

- [https://www.docuwriter.ai](https://www.docuwriter.ai/posts/what-is-api-documentation)
- [https://www.startertutorials.com](https://www.startertutorials.com/uml/components.html)
- [https://www.beamcontent.co](https://www.beamcontent.co/resources/expert-driven-content)


-------------------------------------------------------------------------------------------------------------

You are completely right.

Hacking vendor files (DocParser.php), manually patching web server buffers on active containers, and force-updating database schemas directly via command lines is an unstable way to manage an enterprise-grade business application.

These steps were emergency diagnostic bypasses to identify why the application broke when processing real data. Now that we know exactly what is wrong, you need a structured engineering report to address the debt permanently.

Here is a professional outline and content structure you can use for your technical report to management or your development team.

------------------------------

# Technical Debt & Environment Discrepancy Report

## 1. Executive Summary

Following the import of pre-production database records into the local environment, the assets-portal dashboard suffered critical execution failures (HTTP 500 errors). Investigation revealed significant architecture mismatches between the legacy codebase and modern container infrastructure configurations. Temporary patches were applied to restore local service, but a permanent platform normalization is required.

## 2. Root Cause Analysis (RCA)

### Issue 1: Language & Dependency Incompatibility (PHP 7.4 vs. Legacy Doctrine)

* Symptom: ContextErrorException: Notice: Trying to access array offset on value of type null in DocParser.php.
* The Cause: The user_request microservice container was upgraded to PHP 7.4, but the application dependencies (doctrine/annotations) were left on a legacy version built for PHP 7.3. PHP 7.4 treats invalid array offsets as severe notices, causing the framework to crash.
* Impact: Any data query utilizing complex entity annotation maps fails immediately.

### Issue 2: Infrastructure Configuration Mismatch (Low HTTP / FastCGI Buffers)

* Symptom: Silent HTTP 500 errors with empty 5-byte payload lengths.
* The Cause: Pre-production data profiles link single users to dozens of distinct entities (e.g., 14 active platforms simultaneously). This causes Guzzle to build massive URL query strings. Local Nginx and PHP-FPM default configurations were set too low (max_input_vars = 1000, nesting levels = 64, standard 4k memory buffers), causing the web server to discard or choke on the request before processing.

### Issue 3: Divergent Environment Configuration Tracking

* Symptom: Database connection crashes and Elasticsearch/RabbitMQ host configuration failures.
* The Cause: Local parameters were split across un-synchronized environment profiles (parameters_dev.yml vs parameters_docker.yml). Hardcoded legacy container aliases (like ur_elasticsearch) did not match the actual running local Docker composition names.

------------------------------

## 3. Immediate Workarounds Applied (Local Development Only)

To restore local testing operations, the following temporary modifications were completed:

   1. Hardcoded parameters inside DocParser.php to account for PHP 7.4 null checks.
   2. Injected larger buffers (client_header_buffer_size 64k, max_input_vars = 5000) into container runtimes.
   3. Synchronized database column parameters directly within the req_manager_dev schema.

------------------------------

## 4. Strategic Recommendations for Permanent Resolution

### Action 1: Upgrade Core Project Dependencies

Instead of maintaining a patched vendor folder, the composer.json file for the user_request service must be updated to pull stable, PHP 7.4-compatible versions of Doctrine.

* Target: Update doctrine/annotations to ^1.10 or higher, which includes native compatibility patches for strict array operations.

### Action 2: Standardize Gateway Protocols (Refactor GET to POST)

The reporting query string is too large to safely send via an HTTP GET request without risking URL truncation or proxy buffer failures.

* Target: Refactor RequestManager::getIcons to use a POST request payload. Moving the parameters into a JSON body removes URL length restrictions entirely and eliminates the need for non-standard web server buffer tuning.

### Action 3: Modernize Docker Environment Variables Mapping

Eliminate static files like parameters_dev.yml and migrate fully to Symfony's modern environment variable parameter format (%env(DATABASE_URL)%). This guarantees that configuration values are driven strictly by the orchestrator (docker-compose or Kubernetes manifests) rather than hardcoded internal files.



------------------------------------------------------------------------------------------


## Assets Portal

When I first start up the API, I found the following:
- First migration of tusers_tsms does not exists -> ADD table IF NOT EXISTS
- Application migration has missed many tusers_tsms columns, as e.g. "username" and some others
- Part of the code has 9 years old
- Synfony Maker Bundle is not installed


## Request Manager / User Request

*Request/s* means

Request Manager allows users for the creation of an infinite number of requests or reports, right up to their processing.

Key principles:

- Definition of requests with common and specific fields.
- Definition of a tracking workflow applicable to requests.
- Possible integration of processing at each workflow step change.
- Exposure of a set of APIs for creating/modifying requests.
- (Not implemented) Definition of the graphical display of requests.
- (Not implemented) Graphical interface for interacting with Request Manager.

## Proposal

### Naming collition

- QA Testing branch

- Changes on naming
	- Assets -> Hardware, Device, Gadget, Parts
	- Request -> Demand, Inventory
	- Equipment -> Product, Appliances

- Knowledge of production databases size

- Site name -> Place, Location

The most common environments in the Software Development Life Cycle (SDLC) follow the DTAP framework: Development (Dev), Testing/QA (Test), Staging (Stg), and Production (Prod). [1, 2]

## The Core SDLC Environments

* Development (DEV):
* Purpose: The primary workspace where engineers write, debug, and experiment with new code.
   * Setup: Often hosted locally on individual developer laptops or in shared cloud sandboxes.
   * Focus: Rapid iteration, unit testing, and initial feature building. [2, 3, 4, 5, 6]
* Testing / Quality Assurance (TEST / QA):
* Purpose: A dedicated space isolated from development where testers and automated pipelines validate functionality.
   * Setup: Centralized servers running automated CI/CD suites.
   * Focus: Integration testing, system testing, regression testing, and bug hunting. [1, 2, 5, 7, 8]
* Staging / Pre-Production (STAGE / STG / PRE-PROD):
* Purpose: A full-scale replica of the production environment used to guarantee the software behaves correctly at scale.
   * Setup: Mirrors live infrastructure, hardware, architecture, and configuration as closely as possible.
   * Focus: User Acceptance Testing (UAT), load/performance testing, and final deployment rehearsal. [5, 7, 9, 10, 11]
* Production (PROD):
* Purpose: The live, public-facing environment where real customers use the software.
   * Setup: Highly secure, monitored, optimized for speed, and backed up with high availability.
   * Focus: Stability, security, and processing live business data. [5, 8, 12, 13, 14]

## Specialized & Advanced Environments

Depending on the size of the company and compliance requirements, teams often introduce these additional layers: [2, 4]

* Integration / CI Environment: Sits directly after Dev; used strictly to merge code from multiple developers to catch merge conflicts early. [2, 5, 15, 16, 17]

* User Acceptance Testing (UAT): Sometimes separated from Staging; dedicated purely for client sign-offs, business stakeholders, and product managers to approve new features. [1, 10, 18, 19, 20]
* Disaster Recovery (DR): A mirrored copy of Production kept in a standby state to take over instantly if the live system suffers a catastrophic failure. [2, 21]

* Security / Compliance (SEC): A locked-down environment specifically isolated for third-party penetration testing and vulnerability scanning. [2, 22]

Are you trying to design a branch deployment strategy (like GitFlow), or do you need help choosing which environments to set up for a specific project scale?

[1] [https://softwareengineering.stackexchange.com](https://softwareengineering.stackexchange.com/questions/377055/what-is-the-origin-of-deployment-environments-dev-test-staging-prod)
[2] [https://medium.com](https://medium.com/@anujguptaninja/how-many-environments-should-exist-to-cover-the-sdlc-from-requirements-to-release-61d7d523194a)
[3] [https://www.unitrends.com](https://www.unitrends.com/blog/development-test-environments/)
[4] [https://dreamproit.com](https://dreamproit.com/blog/2024-04-09-understanding-different-environments-development-testing-production/index.html)
[5] [https://medium.com](https://medium.com/@raveenpanditha/what-are-environments-in-the-context-of-software-development-87c184f82655)
[6] [https://www.topcoder.com](https://www.topcoder.com/thrive/articles/staging-vs-testing-environments-understanding-the-core-differences)
[7] [https://www.reddit.com](https://www.reddit.com/r/node/comments/zle4pf/ideally_what_happens_in_each_environment_dev_qa/)
[8] [https://www.youtube.com](https://www.youtube.com/shorts/5C5tUXoQbuY)
[9] [https://www.abtasty.com](https://www.abtasty.com/blog/test-environment/)
[10] [https://oroinc.com](https://oroinc.com/b2b-ecommerce/blog/testing-and-staging-environments-in-ecommerce-implementation/)
[11] [https://medium.com](https://medium.com/@basitjawaid123/understanding-devops-environments-a-journey-through-the-software-development-pipeline-5e1156020aa8)
[12] [https://dev.to](https://dev.to/gajus/testing-in-production-vs-staging-5dgj)
[13] [https://medium.com](https://medium.com/@mwacharomwanyolo/understanding-testing-staging-and-production-environments-in-software-development-5bd877ee8d21)
[14] [https://www.reddit.com](https://www.reddit.com/r/devops/comments/7kidwg/in_what_ways_does_a_production_environment_differ/)
[15] [https://ops42.org](https://ops42.org/2019/12/24/Essential-Components-of-CICD.html)
[16] [https://webflow.com](https://webflow.com/blog/staging-environment)
[17] [https://medium.com](https://medium.com/@anujguptaninja/how-many-environments-should-exist-to-cover-the-sdlc-from-requirements-to-release-61d7d523194a)
[18] [https://community.dynamics.com](https://community.dynamics.com/blogs/post/?postid=b21baef3-af14-4439-b0b4-69ae0df75baa)
[19] [https://fiveriverstech.com](https://fiveriverstech.com/what-is-the-difference-between-staging-and-the-uat-environment)
[20] [https://www.digitalapi.ai](https://www.digitalapi.ai/blogs/sandbox-vs-test-environment-what-s-the-real-difference)
[21] [https://aqua-cloud.io](https://aqua-cloud.io/test-environment-transitions/)
[22] [https://medium.com](https://medium.com/@anujguptaninja/how-many-environments-should-exist-to-cover-the-sdlc-from-requirements-to-release-61d7d523194a)



