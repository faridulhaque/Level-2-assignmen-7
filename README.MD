(1) What is PostgreSQL?
- PostgreSQL is SQL Database which is getting popular nowadays among developers.


(2) What is the purpose of a database schema in PostgreSQL?
- Schema is a logical representation of the database which helps us handle the data more logically and efficiently.

(3) Explain the primary key and foreign key concepts.
- Primary Key is a unique key in the database which is used as a representative for any specific item from table to run an operation for this particular item.
When a primary key is used in another table and builds connection between different items from different table, then it is called foreign key.

(4) What is the difference between the VARCHAR and CHAR data types?
- Char stores data statically and takes bytes depends on the declared length while varchar stores data dynamically and takes the bytes of the value length.

(5) Explain the purpose of the WHERE clause in a SELECT statement.
- where inside a select statement is used to find specific data based on its parameters. For example, if you set like this: where: {id: 1}, it returns all items which id matches 1.

(6) What are the LIMIT and OFFSET clauses used for?
- Limit and offset can be used for pagination concept. Limit ensures that how many items should be returned at a time and offset ensures where the data retrieve starting from.

(7) How can you perform data modification using UPDATE statements?
- To modify data, we can use update statement with select and where like this:
UPDATE employees
SET
    status = 'Promoted'
WHERE
    employee_id = (
        SELECT employee_id
        FROM employees
        ORDER BY salary DESC
        LIMIT 1
    );


(8) What is the significance of the JOIN operation, and how does it work in PostgreSQL?
- Join is an important part of sql database, since we can't modify data structure in sql, we can use join to create relations between the tables. There are multiple JOIN operations which are: innerJoin, leftJoin

(9) explain the GROUP BY clause and its role in aggregation operations.
- Group by is used to get data based on same category column.

(10) How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
- here is the example of count, sum and avg in postgresql.
SELECT AVG(age) from employees
SELECT COUNT(age) from employees
SELECT SUM(age) from employees


(12) Explain the concept of a PostgreSQL view and how it differs from a table.
- A view is used to perform the same operation without repeating the code.