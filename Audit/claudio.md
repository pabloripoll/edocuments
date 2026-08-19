# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**assets-db** is the main backend REST API service for the OnConnect Gateway Management system. It's a Symfony 4.4 application that manages all asset data including equipment, sites, components, hosts, and master data. This service is the central data repository accessed by assets-portal, assets-supervision, and other services.

## Key Responsibilities

- RESTful API for equipment, sites, components, and hosts (CRUD operations)
- Master Data Management (MDM): clients, contracts, agencies, platforms
- Reference data management (types, statuses, costs)
- Business intelligence statistics and supervision data
- File management and attachments
- CSV/Excel data import and export
- Remote operations on equipment (firmware updates, SMS)
- Integration with RabbitMQ for async messaging

## ⚠️ CRITICAL WARNINGS - READ BEFORE CODING

### Security - NEVER Do This

1. **NEVER commit secrets to version control**
   - No API keys, tokens, passwords in code
   - Use environment variables only
   - Check `.gitignore` includes `.env.local`

2. **NEVER use string concatenation in SQL queries**
   ```php
   // ❌ WRONG - SQL Injection vulnerability
   $query = "SELECT * FROM users WHERE id = " . $userId;

   // ✅ CORRECT - Use parameterized queries
   $query = $em->createQuery('SELECT u FROM User u WHERE u.id = :id')
             ->setParameter('id', $userId);
   ```

3. **ALWAYS validate and sanitize user input**
   - File uploads: check MIME type, size, content
   - Form data: use Symfony Validator
   - Output: escape for XSS prevention

4. **ALWAYS handle HTTP client errors**
   ```php
   // ❌ WRONG - No error handling
   $response = $guzzle->get($url);

   // ✅ CORRECT - Wrap in try-catch
   try {
       $response = $guzzle->get($url);
   } catch (GuzzleException $e) {
       $this->logger->error('API call failed', ['error' => $e->getMessage()]);
       throw new ServiceUnavailableException();
   }
   ```

### Performance - ALWAYS Do This

1. **ALWAYS use batch processing for imports**
   ```php
   // ❌ WRONG - Flush per row
   foreach ($rows as $row) {
       $em->persist($entity);
       $em->flush();  // Very slow!
   }

   // ✅ CORRECT - Batch processing
   foreach ($rows as $i => $row) {
       $em->persist($entity);
       if (($i % 500) === 0) {
           $em->flush();
           $em->clear();  // Free memory!
       }
   }
   $em->flush();  // Final flush
   ```

2. **ALWAYS add database indexes for lookups**
   ```php
   // Add to entity annotations:
   /**
    * @ORM\Table(name="equipment", indexes={
    *     @ORM\Index(name="idx_identifier", columns={"identifier_string"}),
    *     @ORM\Index(name="idx_type", columns={"equipment_type"})
    * })
    */
   ```

3. **NEVER allow N+1 queries**
   - Use `JOIN FETCH` in DQL for related entities
   - Preload relationships outside loops
   - Use QueryBuilder instead of individual finds

### Code Quality - Standards

1. **Controller maximum: 300 lines**
   - Extract business logic to Managers/Services
   - Controllers should only handle HTTP concerns

2. **NEVER access repositories directly from controllers**
   ```php
   // ❌ WRONG
   $entity = $this->getDoctrine()->getRepository(Entity::class)->find($id);

   // ✅ CORRECT
   $entity = $this->entityManager->find($id);  // Inject manager
   ```

3. **ALWAYS write tests for new code**
   - Minimum 60% coverage for new features
   - Unit tests for managers/services
   - Integration tests for controllers

## 🛡️ Database Security & Performance

### SQL Injection Prevention
- ✅ ALWAYS use Doctrine QueryBuilder or DQL
- ✅ ALWAYS use parameterized queries
- ❌ NEVER concatenate user input into queries
- ❌ NEVER use raw SQL with untrusted input

### Required Database Indexes
When adding entities, ALWAYS add indexes for:
- Foreign keys
- Frequently queried columns (name, identifier, type)
- Composite indexes for multi-column lookups

Example:
```php
/**
 * @ORM\Table(name="equipment", indexes={
 *     @ORM\Index(columns={"identifier_string"}),
 *     @ORM\Index(columns={"equipment_type", "status"})
 * })
 */
```

## 🚀 Import/Export Performance

### CRITICAL: Batch Processing Pattern
```php
public function import(string $filePath): void
{
    $batchSize = 500;
    $i = 0;

    // Disable SQL logging to save memory
    $this->em->getConnection()->getConfiguration()->setSQLLogger(null);

    foreach ($this->readFile($filePath) as $row) {
        $entity = $this->createEntity($row);
        $this->em->persist($entity);

        if (($i % $batchSize) === 0) {
            $this->em->flush();
            $this->em->clear();  // CRITICAL: Free memory!
            gc_collect_cycles();
        }
        $i++;
    }

    $this->em->flush();
    $this->em->clear();
}
```

### CRITICAL: Large File Streaming
```php
// ❌ WRONG - Loads entire file into memory
$data = $worksheet->rangeToArray('A1:Z10000');

// ✅ CORRECT - Stream rows
foreach ($worksheet->getRowIterator() as $row) {
    // Process one row at a time
}
```

### Memory Limits
- PHP ini: `memory_limit = 512M` minimum for imports
- Max execution time: `max_execution_time = 300` for large imports
- Use `ini_set()` at command start if needed

## ❌ Import/Export Anti-Patterns to Avoid

1. **NEVER flush inside loop without batching**
2. **NEVER load entire Excel file with `rangeToArray()`**
3. **NEVER fetch all records at once** - use pagination/streaming
4. **NEVER forget to call `$em->clear()`** after batch flush
5. **ALWAYS log import progress** (every 1000 records)

## Architecture

### Domain-Driven Design

The application is organized into three main domains:

1. **Assetsdb**: Core asset management (Equipment, Site, Component, Host)
2. **MDM**: Master data management (Client, Contract, Agency)
3. **Referential**: Reference data (Types, Statuses, Costs)

### Layer Architecture

```
Controllers (HTTP/REST handlers)
    ↓
Managers (Business logic orchestration)
    ↓
Services (Specialized operations: Import/Export/Compute)
    ↓
Repositories (Data access)
    ↓
Entities (Domain models)
```

### REST API Design

- Built with FOSRestBundle for RESTful conventions
- Swagger/OpenAPI documentation at `/docs`
- JSON/XML response formats via content negotiation
- HATEOAS links for resource navigation
- Pagerfanta for pagination

## Development Commands

### Docker Container Access

```bash
# Connect to the container
docker exec -it assets-db bash

# Inside container, you're in /var/www/html
```

### PHP/Symfony Commands (inside container)

```bash
# Install dependencies
composer install

# Clear cache
php bin/console cache:clear

# Run database migrations
php bin/console doctrine:migrations:migrate

# Force schema update (if migrations fail)
php bin/console doctrine:schema:update --force

# List all console commands
php bin/console list

# Run PHPUnit tests
php bin/phpunit

# Run specific test
php bin/phpunit tests/Manager/Assetsdb/EquipmentManagerTest.php
```

### Import/Export Commands

```bash
# Equipment imports (G1/G2 gateway generations)
php bin/console import:equipment:g1
php bin/console import:equipment:g2

# Cost imports
php bin/console import:equipment:cost
php bin/console import:intervention:cost

# Site/Patrimony imports
php bin/console import:patrimony:all
php bin/console import:site:files

# Component imports
php bin/console import:components:versions
php bin/console import:sim-card:phone-number

# Contact import
php bin/console import:contact

# Criticality imports
php bin/console import:criticality
php bin/console import:aqualogy:criticality

# MDM imports
php bin/console import:mdm:client
php bin/console import:mdm:contract
php bin/console import:mdm:agency
php bin/console import:mdm:subcontractor
php bin/console import:mdm:platform

# Exports
php bin/console export:equipment:state
php bin/console export:equipment:availability
php bin/console export:site
```

### Operational Commands

```bash
# Check firmware version requests
php bin/console check:firmware-versions-requests

# Check data model version requests
php bin/console check:datamodel-versions-requests

# Update equipment intervention levels
php bin/console update:equipments:intervention-level

# Recap service state
php bin/console recap:service:state
```

## Project Structure

### Backend Structure

```
src/
├── Entity/                      # Domain models (75 entities)
│   ├── Assetsdb/               # Asset entities
│   │   ├── Equipment.php       # Main equipment entity
│   │   ├── Site.php           # Installation sites
│   │   ├── Component.php      # Equipment components
│   │   ├── Host.php           # Site hosts/containers
│   │   ├── Contact.php        # Site contacts
│   │   ├── Accessories.php    # Equipment accessories
│   │   ├── File.php           # File attachments
│   │   └── *StatusHistory.php # State tracking
│   ├── Referential/           # Reference data
│   │   ├── *Type.php          # Type definitions
│   │   ├── *Status.php        # Status definitions
│   │   └── *Cost.php          # Cost structures
│   ├── Mdm/                   # Master data
│   │   ├── Client.php         # Clients
│   │   ├── Contract.php       # Contracts
│   │   ├── Agency.php         # Agencies
│   │   └── City.php, Region.php, etc.
│   └── BI/                    # Business intelligence
├── Controller/                 # REST API endpoints (49 controllers)
│   ├── Assetsdb/              # Asset controllers
│   │   ├── EquipmentController.php
│   │   ├── SiteController.php
│   │   ├── ComponentController.php
│   │   ├── HostController.php
│   │   ├── FileController.php
│   │   ├── AccessoryController.php
│   │   └── RemoteOperationController.php
│   ├── Referential/           # Reference data controllers
│   └── Mdm/                   # MDM controllers
├── Manager/                    # Business logic (42 managers)
│   ├── Assetsdb/
│   │   ├── EquipmentManager.php
│   │   ├── ComponentManager.php
│   │   ├── SiteManager.php
│   │   ├── HostManager.php
│   │   └── RemoteOperationManager.php
│   └── Mdm/
│       ├── ContractManager.php
│       └── AgencyManager.php
├── Service/                    # Specialized services
│   ├── Assetsdb/
│   │   ├── Importer/          # Data importers (10+ importers)
│   │   ├── Exporter/          # Data exporters
│   │   ├── Computer/          # Business logic computation
│   │   ├── BI/                # Statistics services
│   │   ├── Recap/             # Service state computation
│   │   ├── Converter/         # Data conversion
│   │   ├── QueryResolver/     # Dynamic filtering
│   │   └── Sms/               # SMS services
│   └── Mdm/                   # MDM services
├── Repository/                 # Data access (35 repositories)
│   ├── Assetsdb/
│   ├── Referential/
│   ├── Mdm/
│   └── BI/
├── Command/                    # Console commands (30+ commands)
├── Form/                       # Symfony form types
├── Security/                   # API key authentication
│   └── ApiKey/
├── Exception/                  # Custom exceptions (33 exceptions)
└── Resources/                  # XSD schemas, templates
```

### Configuration

```
config/
├── packages/
│   ├── security.yaml          # API authentication
│   ├── doctrine.yaml          # Database configuration
│   ├── fos_rest.yaml          # REST API settings
│   ├── jms_serializer.yaml    # Serialization rules
│   ├── bazinga_hateoas.yaml   # HATEOAS configuration
│   ├── old_sound_rabbit_mq.yaml  # RabbitMQ
│   └── oneup_flysystem.yaml   # File system abstraction
├── routes/
│   └── annotations.yaml        # Controller routing
├── serializer/                 # JMS serializer metadata
└── services.yaml               # DI container (16KB)
```

## Key Technical Details

### Technology Stack

- **Framework**: Symfony 4.4 LTS
- **PHP**: 7.4.8+
- **Database**: MySQL/Percona with Doctrine ORM 2.7+
- **API**: FOSRestBundle 3.0, Swagger/OpenAPI 3.2
- **Serialization**: JMS Serializer 3.6, HATEOAS 2.2
- **Messaging**: RabbitMQ Bundle 2.8
- **File Handling**: OneUp Flysystem 4.0, League CSV 9.7
- **Security**: FOSUserBundle 2.0, API Key authentication
- **Testing**: PHPUnit 9.5

### Core Entities

**Equipment (Assetsdb/Equipment.php)**
- Central entity for gateway/equipment management
- Relationships: Site (many-to-one), Components (one-to-many), EquipmentType
- Status tracking with EquipmentStatusHistory
- Cost tracking with EquipmentCost
- Supports accessories attachment

**Site (Assetsdb/Site.php)**
- Physical installation locations
- Contains equipment, hosts, contacts, files
- Geographic information (address, coordinates)
- Site type, status, nature, access information

**Component (Assetsdb/Component.php)**
- Parts of equipment (antennas, modems, SIM cards, etc.)
- Versioning support (ComponentVersion)
- Type-specific attributes (ComponentTypeAttribute)
- Cost tracking (AccessoryCost)

**Host (Assetsdb/Host.php)**
- Container/grouping for sites
- Host type classification

**MDM Entities**
- Client, Contract, Agency, Platform, Subcontractor
- Application, Service, Activity
- Geographic: City, County, Region, District

### REST API Patterns

**Routing Convention:**
```
GET    /assets/equipment              # List equipment
GET    /assets/equipment/{id}         # Get single equipment
POST   /assets/equipment              # Create equipment
PUT    /assets/equipment/{id}         # Update equipment
DELETE /assets/equipment/{id}         # Delete equipment
```

**Response Format:**
```json
{
  "data": { ... },
  "_links": {
    "self": { "href": "/assets/equipment/123" },
    "components": { "href": "/assets/equipment/123/components" }
  }
}
```

**Pagination:**
```
GET /assets/equipment?page=1&limit=20
```

**Filtering:**
```
GET /assets/equipment?filters[status]=active&filters[site]=123
```

### Authentication

API Key authentication via HTTP header:

```http
Authorization: ApiKey your-api-key-here
```

Configured in [config/packages/security.yaml](config/packages/security.yaml) using custom authenticator.

### Manager Pattern

Managers contain complex business logic that shouldn't be in controllers:

**Example: EquipmentManager**
- `find($id)` - Retrieve equipment
- `findAll($filters)` - List with filtering
- `create($data)` - Create new equipment
- `update($id, $data)` - Update equipment
- `delete($id)` - Delete equipment
- `updateStatus($id, $status)` - Change operational state
- `importFromCSV($file)` - Import equipment data

### Import/Export Services

Located in [src/Service/Assetsdb/Importer/](src/Service/Assetsdb/Importer/) and [src/Service/Assetsdb/Exporter/](src/Service/Assetsdb/Exporter/):

**Importers:**
- Equipment G1/G2 importers (different gateway generations)
- Cost importers (equipment, intervention, accessory)
- Criticality importers
- Site/patrimony importers
- Component version importers
- Contact importers
- MDM importers (client, contract, agency, etc.)

**Exporters:**
- Equipment state exporter
- Equipment availability exporter
- Site exporter

**Data Formats Supported:**
- CSV (League CSV)
- Excel (PHPSpreadsheet)
- XML (Patrimony via XSD schemas)
- JSON (REST API)

### File Management

OneUp Flysystem abstracts file storage:

```yaml
# config/packages/oneup_flysystem.yaml
oneup_flysystem:
  adapters:
    equipment_adapter:
      local:
        directory: '%kernel.project_dir%/data/files/equipment'
    sites_adapter:
      local:
        directory: '%kernel.project_dir%/data/files/sites'
```

Supported filesystem types: equipment, sites, SMS, contracts, etc.

### RabbitMQ Integration

Publishes events for async processing:

**Notification Producer:**
- Equipment state changes
- Data updates
- Alert notifications

Configuration in [config/packages/old_sound_rabbit_mq.yaml](config/packages/old_sound_rabbit_mq.yaml).

### Remote Operations

[src/Controller/Assetsdb/RemoteOperationController.php](src/Controller/Assetsdb/RemoteOperationController.php) handles:
- Firmware update requests
- Data model version updates
- SMS operations
- Equipment reboots

## Testing

### PHPUnit Tests

Located in [tests/](tests/) directory:

```bash
# Run all tests
php bin/phpunit

# Run specific test suite
php bin/phpunit tests/Manager/Assetsdb/

# Run single test file
php bin/phpunit tests/Manager/Assetsdb/EquipmentManagerTest.php

# With coverage
php bin/phpunit --coverage-html coverage/
```

**Test Structure:**
- `tests/Manager/` - Manager logic tests
- `tests/Service/` - Service tests
- `tests/Controller/` - API endpoint tests

### Test Configuration

- Bootstrap: [tests/bootstrap.php](tests/bootstrap.php)
- Test environment packages in [config/packages/test/](config/packages/test/)

## API Documentation

### Swagger/OpenAPI

Access interactive API documentation:
- **Local**: http://localhost:8091/docs
- **Container**: http://assets-db/docs

Documentation generated from annotations:
```php
/**
 * @OA\Get(
 *     path="/assets/equipment/{id}",
 *     tags={"Equipment"},
 *     @OA\Response(response="200", description="Equipment details")
 * )
 */
```

## Common Development Tasks

### Adding a New Entity

1. Create entity in [src/Entity/Assetsdb/](src/Entity/Assetsdb/)
2. Create repository in [src/Repository/Assetsdb/](src/Repository/Assetsdb/)
3. Create migration: `php bin/console doctrine:migrations:diff`
4. Run migration: `php bin/console doctrine:migrations:migrate`
5. Add JMS serializer metadata in [config/serializer/](config/serializer/) (if needed)

### Adding a REST Endpoint

1. Create/update controller in [src/Controller/](src/Controller/)
2. Add business logic in Manager
3. Use `@Route()` and `@OA\` annotations
4. Return views with FOSRest: `return $this->view($data, Response::HTTP_OK)`

### Adding an Import Command

1. Create importer service in [src/Service/Assetsdb/Importer/](src/Service/Assetsdb/Importer/)
2. Create command in [src/Command/](src/Command/) extending `Command`
3. Inject importer service via dependency injection
4. Define command name and options
5. Register in [config/services.yaml](config/services.yaml) (auto-wired)

### Working with Repositories

Custom queries go in Repository classes:

```php
// src/Repository/Assetsdb/EquipmentRepository.php
public function findActiveEquipment(): array
{
    return $this->createQueryBuilder('e')
        ->where('e.status = :status')
        ->setParameter('status', 'active')
        ->getQuery()
        ->getResult();
}
```

## Environment Variables

Key variables in `.env`:

```bash
APP_ENV=dev
APP_DEBUG=true
DATABASE_URL=mysql://user:pass@percona-server-service:3306/assets_db
RABBITMQ_HOST=rabbit
RABBITMQ_PORT=5672
RABBITMQ_USER=rabbitmq
RABBITMQ_PASSWORD=rabbitmq
```

## Database Migrations

200+ migrations in [migrations/](migrations/) directory spanning 2017-present.

**Migration workflow:**
```bash
# Generate migration from entity changes
php bin/console doctrine:migrations:diff

# Review generated migration file
# Edit if needed

# Execute migration
php bin/console doctrine:migrations:migrate

# Rollback if needed
php bin/console doctrine:migrations:migrate prev
```

## Important Notes

- This is a **Symfony 4.4** application (use `bin/console`, not `app/console`)
- All API responses use **JMS Serializer** - configure exclusion groups in metadata
- Use **Managers** for business logic, not Controllers
- **Repositories** only for data access queries
- Services in [src/Service/](src/Service/) are for specialized operations (import/export/compute)
- API authentication uses **API Key** header, not sessions
- REST responses support **JSON and XML** via Accept header
- Use **HATEOAS links** for resource navigation
- **Pagination** is handled by Pagerfanta
- File storage uses **Flysystem** for abstraction - never use direct file operations
