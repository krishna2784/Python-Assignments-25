use company;

-- 1. Write an SQL query to determine the 5th highest salary without using top or limit method.

SELECT DISTINCT salary
FROM worker w1
WHERE 4 = (
    SELECT COUNT(DISTINCT salary)
    FROM worker w2
    WHERE w2.salary > w1.salary
);

-- 2. Write an SQL query to fetch the list of employees with the same salary.

SELECT salary, GROUP_CONCAT(first_name SEPARATOR ',') AS worker_name
FROM worker
GROUP BY salary
HAVING COUNT(*) > 1;

-- 3. Write an SQL query to fetch intersecting records of two tables.

SELECT w1.first_name, w1.salary, w2.first_name
FROM worker w1
INNER JOIN workerDetails w2
ON w1.worker_id = w2.worker_id;

-- 4. Write an SQL query to show records from one table that another table does not have.

SELECT w1.worker_id, w1.first_name
FROM worker w1
LEFT JOIN workerDetails w2
ON w1.worker_id = w2.worker_id
WHERE w2.worker_id IS NULL;

-- 5. Write an SQL query to clone a new table from worker table.

CREATE TABLE new_table LIKE worker;
INSERT INTO new_table SELECT * FROM worker;
SELECT * FROM new_table;

-- 6. Write an SQL query to fetch duplicate records having matching data in some fields of table.

SELECT first_name, department, count(*)
FROM worker
GROUP BY first_name, department
HAVING count(*) > 1;