# Metro Food

Demonstrable experience in handling back-end development solutions such as Spring Boot, JPA, Hibernate, Liquibase and Jasper Reports, and database management with PL SQL and Postgre.

# A

## 1. JPA vs. Hibernate vs. Liquibase

While they all "touch" the database, they don't do the same thing. Think of them as a team:

* JPA (Java Persistence API): This is a specification (a set of rules and interfaces). It defines how Java objects should be mapped to database tables. You don't "run" JPA; you use it to write code that is standard across different systems.
* Hibernate: This is the implementation of JPA. It is the engine that actually does the work of converting your Java queries into SQL. It's an Object-Relational Mapping (ORM) tool.
* Liquibase: This is a migration tool. While Hibernate can create tables, it’s not safe for production because it doesn't track history. Liquibase keeps a "changelog" (version control for your database) so you can safely apply, roll back, and track every change to your schema across different environments (Dev, Test, Prod). [1, 2, 3, 4, 5, 6, 7, 8]

## 2. What is Jasper Reports?

Jasper Reports is an open-source Java reporting engine. If a client needs a professional-looking PDF invoice, a monthly sales chart in Excel, or a printable HTML summary, you use Jasper. [9, 10]

* How it works: You design a template (a .jrxml file) using a visual tool called [Jaspersoft Studio](https://community.jaspersoft.com/project/jaspersoft-studio). In your Java code, you pass data (from your database or Java objects) into this template to "fill" the report and export it to PDF, XLS, or CSV. [11, 12, 13, 14]

## 3. Common PL/SQL Interview Questions

PL/SQL is Oracle's procedural extension to SQL. Here are the "must-know" concepts for an interview: [15, 16, 17]

- What is the difference between SQL and PL/SQL?
    - Answer: SQL is a declarative language (you say what you want). PL/SQL is procedural (it includes loops, variables, and "if-then" logic to say how to do it).
- What are Cursors?
    - Answer: A cursor is a pointer to a private memory area that contains the result set of a query. You use them to process multiple rows one by one.
- Explain the difference between a Trigger and a Stored Procedure.
    - Answer: A Stored Procedure must be called explicitly by a user or application. A Trigger is automatically executed (fired) by the database when a specific event occurs (like an INSERT or DELETE on a table).
- What is a Package in PL/SQL?
    - Answer: A package is a container that groups related functions, procedures, and variables together. It helps with code organization, security, and performance (the whole package is loaded into memory at once). [18, 19, 20, 21, 22]

Pro-tip for tomorrow: If they ask how these work together, you can say: "We use Liquibase to manage the database schema, Spring Data JPA (with Hibernate) to interact with that data in the code, and Jasper Reports to present that data to the end user in a professional format."

# B

## Explain a time you solved a database performance issue

It’s common to forget specific details because when things work well, we don’t think about them. For an interview, you don’t need a complex story—you just need a clear one that shows you understand the tools and the fix.

The most classic "solid" answer for Java/Hibernate developers is the N+1 Query Problem. It’s impressive because it shows you understand how the code (Hibernate) interacts with the database (SQL).

## The Story: Fixing the "N+1" Performance Bug

Use the S.T.A.R. method (Situation, Task, Action, Result) to keep it concise:

* Situation: "In a previous project, we had a page that loaded a list of Orders, and each order showed the Customer name. As our database grew, the page became extremely slow, taking 5+ seconds to load."
* Task: "I needed to figure out why a simple list was dragging down performance."
* Action:
1. "I turned on SQL logging in our dev environment (show-sql: true) to see what Hibernate was doing."
2. "I discovered the N+1 problem: Hibernate was running 1 query to get all orders, and then N additional queries to get the customer for each individual order."
3. "I fixed this by changing the repository query to use a JOIN FETCH (or an @EntityGraph), which forced Hibernate to get all orders and their customers in one single SQL query."
* Result: "The page load time dropped from over 5 seconds to under 200 milliseconds, and it significantly reduced the load on our database." [1]

## Alternative: The "Missing Index" Story

If you want to focus more on the SQL/DB side:

* Situation: "We had a PL/SQL report that was timing out when users filtered by 'Transaction Date' over a 3-year range."
* Action: "I used the Execution Plan (EXPLAIN PLAN) in the database and saw it was doing a 'Full Table Scan' on a table with millions of rows."
* Fix: "I worked with the team to add a Non-Clustered Index on the transaction_date column using Liquibase to ensure the change was tracked across all environments."
* Result: "The report that was timing out now runs in under 2 seconds." [2]

## Why these work:

* They mention Hibernate/JPA specifics (logging, JOIN FETCH).
* They mention Liquibase (shows you know how to deploy DB changes).
* They use numbers (5 seconds down to 200ms) which interviewers love. [3]

Would you like to try refining one of these with a specific detail from a project you've actually worked on?

###

The N+1 problem happens because Hibernate, by default, is "lazy." It tries to be efficient by not loading data you haven't asked for yet, but this backfires when you loop through a list.

1. The Problem (The "N+1" behavior)If you try to list 100 orders and print the customer names using standard methods:
```java

@Entity
public class Customer {
    @Id
    private Long id;
    private String name;
}

// Query 1: "SELECT * FROM orders" (This is the '1')
List<Order> orders = orderRepository.findAll();

for (Order order : orders) {
    // Queries 2 through 101: "SELECT * FROM customer WHERE id = ?"
    // Hibernate fires a NEW query for EVERY single order to get the name. (This is the 'N')
    // Query 2, 3, 4... N: SELECT * FROM customers WHERE id = ?;
    System.out.println(order.getCustomer().getName());
}
```
Total Queries: 1 (for orders) + 100 (one for each customer) = 101 queries.

2. The Setup (Entities) You have an Order that belongs to a Customer.
```java
@Entity
public class Order {
    @Id
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY) // This tells Hibernate: don't load Customer yet
    @JoinColumn(name = "customer_id")
    private Customer customer;
}
```

3. The Solution (JOIN FETCH) You solve this by telling Hibernate to get everything in one single trip to the database using a JOIN FETCH in your repository:
```java
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT o FROM Order o JOIN FETCH o.customer")
    List<Order> findAllWithCustomer();
}
```
Total Queries: 1. Hibernate performs a SQL JOIN, fetching both the Order and Customer data in a single result set.

Why this is a great interview answer:
- It's technical: You’re talking about FetchType.LAZY, JOIN FETCH, and database round-trips.
- It's practical: Every senior dev has dealt with this.
- It shows optimization: You moved from 101 queries to 1.

Do you want to see how to solve this using an @EntityGraph instead, which is the more modern Spring Data JPA way?Show Code


# C

Can you guess the fruit? *reference: Still More Java Puzzles / Joshua Bloch & Neal Gafter (Google)*
```java
public class fruitnvegs {
    private static Random rnd = new Random();

    public static void main(String[] args) {
        StringBuffer word = null;

        switch(rnd.nextInt(2)) {
            case 1: fruit = new StringBuffer('B');
            case 2: fruit = new StringBuffer('X');
            default: fruit = new StringBuffer('F');
        }

        fruit.append('e');
        fruit.append('r');
        fruit.append('r');
        fruit.append('y');

        System.out.println(fruit);
    }
}
```

- Option A: Berry, Xerry or Ferry (randomly).
- Option B: Berry or Xerry (randomly).
- Option C: Ferry (always).
- Option D: None of the above.

### Answer

- The correct answer is "None of the above":
- Why: there are two errors on the code. (1) switch without break. This would always return the default value, "Ferry"; however, (2) the StringBuffer takes a string as input and not a char type. So, in this case fruit is not correctly initialized.

Fix:
```java
import java.util.Random;

public class FruitNVegs { // Fixed: Class names should be PascalCase
    private static Random rnd = new Random();

    public static void main(String[] args) {
        // 1. Fixed: Declare the variable 'fruit' and match the type (StringBuffer)
        StringBuffer fruit;

        // 2. Fixed: Random range. nextInt(3) gives 0, 1, or 2.
        switch(rnd.nextInt(3)) {
            case 0:
                // 3. Fixed: Use String "" not char '' to avoid capacity bug
                fruit = new StringBuffer("B");
                break; // 4. Fixed: Added break to prevent fallthrough
            case 1:
                fruit = new StringBuffer("X");
                break;
            default:
                fruit = new StringBuffer("F");
                // No break needed for the last case
        }

        fruit.append('e');
        fruit.append('r');
        fruit.append('r');
        fruit.append('y');

        System.out.println(fruit);
    }
}
```

--- A

[1] [https://www.youtube.com](https://www.youtube.com/watch?v=a1vGvdYKP2Y)
[2] [https://rathod-ajay.medium.com](https://rathod-ajay.medium.com/top-hibernate-jpa-interview-question-for-experienced-candidates-df38c89581c9)
[3] [https://rathod-ajay.medium.com](https://rathod-ajay.medium.com/top-hibernate-jpa-interview-question-for-experienced-candidates-df38c89581c9)
[4] [https://www.digitalocean.com](https://www.digitalocean.com/community/tutorials/hibernate-interview-questions-and-answers)
[5] [https://lemon.io](https://lemon.io/answers/liquibase/what-is-the-difference-between-liquibase-and-hibernate/#:~:text=The%20question%20is%20about%20Liquibase.%20Answer:%20Liquibase,whereas%20Hibernate%20manages%20data%20access%20and%20relationships.)
[6] [https://stackoverflow.com](https://stackoverflow.com/questions/72318044/what-is-the-difference-between-liquibase-and-hibernate)
[7] [https://www.youtube.com](https://www.youtube.com/watch?v=26qri-FIwWo&t=5)
[8] [https://cortance.com](https://cortance.com/answers/liquibase/what-is-the-difference-between-liquibase-and-hibernate)
[9] [https://intellipaat.com](https://intellipaat.com/blog/interview-question/jaspersoft-interview-questions/)
[10] [https://javatechnologycenter.com](https://javatechnologycenter.com/question/jasper/jasper1.php)
[11] [https://www.spiritsofts.com](https://www.spiritsofts.com/jaspersoft-interview-questions/)
[12] [https://www.youtube.com](https://www.youtube.com/watch?v=Dc5Ra5okUMc)
[13] [https://www.youtube.com](https://www.youtube.com/watch?v=MVW0B6ZaopQ&t=5)
[14] [https://www.acte.in](https://www.acte.in/jaspersoft-interview-questions-and-answers)
[15] [https://mindmajix.com](https://mindmajix.com/oracle-pl-sql-interview-questions#:~:text=43%29%20What%20is%20PL/SQL%2C%20Why%20do%20we,extension%20with%20SQL%20Language.%20Oracle%20introduced%20PL/SQL)
[16] [https://www.vervecopilot.com](https://www.vervecopilot.com/interview-questions/why-pl-sql-developer-might-be-the-secret-weapon-for-acing-your-next-technical-interview#:~:text=PL/SQL%20is%20Oracle%27s%20procedural%20extension%20to%20SQL%2C,the%20programming%20capabilities%20of%20a%20procedural%20language.)
[17] [https://www.vervecopilot.com](https://www.vervecopilot.com/hot-blogs/pl-sql-interview-questions#:~:text=Define%20PL/SQL%20as%20Oracle%27s%20procedural%20extension%20to,ability%20to%20combine%20procedural%20logic%20with%20SQL.)
[18] [https://in.indeed.com](https://in.indeed.com/career-advice/interviewing/oracle-pl-sql-developer-interview-questions)
[19] [https://www.wecreateproblems.com](https://www.wecreateproblems.com/interview-questions/pl-sql-interview-questions)
[20] [https://sg.indeed.com](https://sg.indeed.com/career-advice/interviewing/pl-sql-interview-questions)
[21] [https://www.youtube.com](https://www.youtube.com/watch?v=Jbt2y8ckRck&t=2)
[22] [https://global-uploads.webflow.com](https://global-uploads.webflow.com/5d0dc87aac109e1ffdbe379c/61b8aa48deda35589e609719_PL%20SQL%20Interview%20Questions.pdf)
[23] [https://www.devopsschool.com](https://www.devopsschool.com/blog/what-is-liquibase-and-use-cases-of-liquibase/#:~:text=Database%20Change%20Management:%0A%0ALiquibase%20provides%20a%20centralized%20platform,of%20errors%20introduced%20by%20manual%20database%20modifications.)

--- B

[1] [https://www.youtube.com](https://www.youtube.com/watch?v=zwF5ADW6eKs&t=15)
[2] [https://medium.com](https://medium.com/@gaddamnaveen192/performance-related-problem-solving-questions-in-springboot-part-1-43c74b44de6f)
[3] [https://www.youtube.com](https://www.youtube.com/watch?v=_6Ni_wxfoyI)
