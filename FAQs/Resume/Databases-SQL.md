# Databases

- DBMS: stores either in either a navigational or hierarchical form.
- RDBMS: uses tabular structures to store data. In table headers are the column names and the rows contains corresponding values.
- NoSQL: uses to store data in structured, semi-structured and unstructured forms.

## DBMS vs RBDMS
What is the Difference between DBMS and RDBMS? DBMS stands for Database Management System, and RDBMS is the acronym for the Relational Database Management system. In DBMS, the data is stored as a file, whereas in RDBMS, data is stored in the form of tables.

## RDBMS - Relational Database Structure
https://www.ibm.com/docs/en/mam/7.6.0?topic=design-relational-database-structure

- Entity: is the value recorded in a table row.
- Model: is an object representation of a table.
- Record: is both model and entity persistance representation.
- Persistance:

### SELECT CASE

### JOINS

- **INNER JOIN** keyword selects records that have matching values in both tables.
- **LEFT JOIN** keyword returns all records from the left and the matching records from the right. No results from the right side, if there is no match.
- **RIGHT JOIN** keyword returns all records from the right nd the matching records from the left. No results from the left side, if there is no match.
- **FULL OUTER JOIN** keyword returns all records when there is a match in left table1 or right table2 table records.
- **SELF JOIN** is a regular join, but the table is joined with itself.

#### Type of Relationship
https://www.ibm.com/docs/en/mam/7.6.0?topic=structure-database-relationships

**One-to-one**
Both tables can have only one record on each side of the relationship. Each primary key value relates to none or only one record in the related table. Most one-to-one relationships are forced by business rules and do not flow naturally from the data. Without such a rule, you can typically combine both tables without breaking any normalization rules.

**One-to-many**
The primary key table contains only one record that relates to none, one, or many records in the related table.

**Many-to-many**
Each record in both tables can relate to none or any number of records in the other table. These relationships require a third table, called an associate or linking table, because relational systems cannot directly accommodate the relationship.

## ACID
ACID is an acronym that stands for atomicity, consistency, isolation, and durability. Together, these ACID properties ensure that a set of database operations (grouped together in a transaction) leave the database in a valid state even in the event of unexpected errors.

- Atomicy: All transactions must be succesfully or nothing *(Rollback)*.
- Consistency: Preservvs database invariants where transaction can be cancelled if any consistency is violated.
- Isolation: Any concurrent transaction is isolated from each other until previous transaction is commited.
- Durability: Data is persisted after transaction is commited in a system failure. It depends on system design.

## CQRS ???
CQRS stands for Command and Query Responsibility Segregation, a pattern that separates read from create and update operations for a data store. Implementing CQRS in an application can maximize its performance, scalability, and security.

### CQRS
Command query responsibility segregation (CQRS) is a programming design pattern that treats retrieving data and changing data differently. CQRS uses command handlers to simplify the query process and hide complex, multi-system changes.

The design pattern was developed by Bertrand Meyer as a way to ensure that a method working with data is only allowed to perform one of two tasks. A method can either retrieve information or it can modify it, but it can't do both. In object-oriented terms, this paradigm separates responsibilities into two different classes -- one for read and the other for delete, create and update.

When CQRS is combined with event sourcing, it guarantees an audit log of changes to the database that maintains transactional consistency.

https://www.techtarget.com/searchapparchitecture/definition/CQRS-command-query-responsibility-segregation

https://learn.microsoft.com/en-us/azure/architecture/patterns/cqrs

## Sources
Roadmap for Learning SQL: https://www.youtube.com/watch?v=yMqldbY2AAg
https://www.w3schools.com/sql/sql_join.asp
https://stackoverflow.com/questions/2726657/inner-join-vs-left-join-performance-in-sql-server