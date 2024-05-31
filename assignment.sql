-- Active: 1709012072080@@127.0.0.1@5432@company_db

-- creating department table.
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- creating employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR UNIQUE,
    department_id INT REFERENCES departments (department_id),
    salary NUMERIC,
    status VARCHAR(255)
);

-- Inserting values in department table

INSERT INTO
    departments (department_name)
VALUES ('Engineering'),
    ('Marketing'),
    ('Finance');

-- inserting values into employees table
INSERT INTO
    employees (
        employee_name,
        age,
        email,
        department_id,
        salary,
        status
    )
VALUES (
        'Alice',
        30,
        'alice@example.com',
        1,
        60000,
        NULL
    ),
    (
        'Bob',
        35,
        'bob@example.net',
        2,
        65000,
        NULL
    ),
    (
        'Charlie',
        28,
        'charlie@google.com',
        1,
        55000,
        NULL
    ),
    (
        'David',
        33,
        'david@yahoo.com',
        2,
        62000,
        NULL
    ),
    (
        'Eve',
        31,
        'eve@example.net',
        3,
        58000,
        NULL
    ),
    (
        'Frank',
        29,
        'frank@example.com',
        1,
        59000,
        NULL
    ),
    (
        'Grace',
        34,
        'grace@google.com',
        2,
        63000,
        NULL
    ),
    (
        'Henry',
        32,
        'henry@yahoo.com',
        3,
        57000,
        NULL
    ),
    (
        'Ivy',
        27,
        'ivy@gmail.com',
        1,
        56000,
        NULL
    ),
    (
        'Jack',
        36,
        'jack@example.net',
        2,
        64000,
        NULL
    ),
    (
        'Karen',
        29,
        'karen@gmail.com',
        3,
        60000,
        NULL
    ),
    (
        'Liam',
        33,
        'liam@gmail.com',
        1,
        59000,
        NULL
    ),
    (
        'Mia',
        31,
        'mia@yahoo.com',
        2,
        62000,
        NULL
    ),
    (
        'Nora',
        28,
        'nora@yahoo.com',
        3,
        57000,
        NULL
    ),
    (
        'Oliver',
        35,
        'oliver@example.net',
        1,
        61000,
        NULL
    ),
    (
        'Penelope',
        30,
        'penelope@google.com',
        2,
        63000,
        NULL
    ),
    (
        'Quinn',
        32,
        'quinn@google.com',
        3,
        59000,
        NULL
    ),
    (
        'Rachel',
        27,
        'rachel@gmail.com',
        1,
        55000,
        NULL
    ),
    (
        'Sam',
        34,
        'sam@example.net',
        2,
        64000,
        NULL
    ),
    (
        'Taylor',
        31,
        'taylor@yahoo.com',
        3,
        58000,
        NULL
    );

-- all queries started

-- query 1: Retrieve all employees with a salary greater than 60000

SELECT *
from employees
WHERE
    salary > 60000
    -- query 1 ended
    ---------------------------
    ---------------------------

-- query 2: Retrieve the names of employees using a limit of 2, starting from the 3rd employee.

SELECT employee_name FROM employees LIMIT 2 OFFSET 2;
--query 2 ended
-------------------------------
-------------------------------
-- query 3: Calculate and display the average age of all employees.
SELECT AVG(age)
from employees
    -- query 3 ended
    -- --------------------------
    -- --------------------------
-- query 4: Retrieve the names of employees whose email addresses contain 'example.com', 'example.net', or 'google.com'.


SELECT employee_name
FROM employees
WHERE
    email LIKE '%example.com'
    OR email LIKE '%example.net'
    OR email LIKE '%google.com';
-- query 4 ended
-------------------
--query 5: Retrieve the names of all employees who belong to the department titled 'Engineering'.

SELECT employee_name
from employees
    JOIN departments ON employees.department_id = departments.department_id
WHERE
    department_name = 'Engineering'
    --query 5 ended
-- -------------------

--query 6: Update the status of the employee with the highest salary to 'Promoted'


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

-- -------------------
-- query 7: Retrieve the department name and the average salary of employees in each department

SELECT department_name, AVG(salary) AS avg
FROM employees
    JOIN departments ON employees.department_id = departments.department_id
GROUP BY
    department_name;

-- query 7 ended
--------------------------