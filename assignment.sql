-- Active: 1709012072080@@127.0.0.1@5432@company_db

-- creating table by simple create command
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY, department_name VARCHAR(255) NOT NULL
);

-- insert values into table
INSERT INTO
    departments (department_name)
VALUES ('Engineering'),
    ('Marketing'),
    ('Finance');

-- create table same as previously created
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY, employee_name VARCHAR(255) NOT NULL, age INT NOT NULL, email VARCHAR UNIQUE, department_id INT REFERENCES departments (department_id), salary NUMERIC, status VARCHAR(255)
);

-- simply insert values by using insert
INSERT INTO
    employees (
        employee_name, age, email, department_id, salary, status
    )
VALUES (
        'Alice', 30, 'alice@example.com', 1, 60000, NULL
    ),
    (
        'Bob', 35, 'bob@example.net', 2, 65000, NULL
    ),
    (
        'Charlie', 28, 'charlie@google.com', 1, 55000, NULL
    ),
    (
        'David', 33, 'david@yahoo.com', 2, 62000, NULL
    ),
    (
        'Eve', 31, 'eve@example.net', 3, 58000, NULL
    ),
    (
        'Frank', 29, 'frank@example.com', 1, 59000, NULL
    ),
    (
        'Grace', 34, 'grace@google.com', 2, 63000, NULL
    ),
    (
        'Henry', 32, 'henry@yahoo.com', 3, 57000, NULL
    ),
    (
        'Ivy', 27, 'ivy@gmail.com', 1, 56000, NULL
    ),
    (
        'Jack', 36, 'jack@example.net', 2, 64000, NULL
    ),
    (
        'Karen', 29, 'karen@gmail.com', 3, 60000, NULL
    ),
    (
        'Liam', 33, 'liam@gmail.com', 1, 59000, NULL
    ),
    (
        'Mia', 31, 'mia@yahoo.com', 2, 62000, NULL
    ),
    (
        'Nora', 28, 'nora@yahoo.com', 3, 57000, NULL
    ),
    (
        'Oliver', 35, 'oliver@example.net', 1, 61000, NULL
    ),
    (
        'Penelope', 30, 'penelope@google.com', 2, 63000, NULL
    ),
    (
        'Quinn', 32, 'quinn@google.com', 3, 59000, NULL
    ),
    (
        'Rachel', 27, 'rachel@gmail.com', 1, 55000, NULL
    ),
    (
        'Sam', 34, 'sam@example.net', 2, 64000, NULL
    ),
    (
        'Taylor', 31, 'taylor@yahoo.com', 3, 58000, NULL
    );

-- select all employees who have salary above 60k
SELECT * from employees WHERE salary > 60000


-- using limit to ensure how many item to retrieve and and offset to from which column the items retrieve
SELECT * from employees LIMIt 2 OFFSET 3

-- select average age of all employees using avg
SELECT AVG(age) from employees


-- retrieve all employees names whose email includes the required text.
SELECT employee_name
FROM employees
WHERE
    email LIKE '%example.com'
    OR email LIKE '%example.net'
    OR email LIKE '%google.com';


-- getting the employee that has highest salary by desc order and then update his status.
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

