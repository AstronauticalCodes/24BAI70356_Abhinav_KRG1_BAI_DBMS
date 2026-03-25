CREATE TABLE depts(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(20)
);

CREATE TABLE emps(
emp_id INT PRIMARY KEY,
name VARCHAR(20),
dept_id INT REFERENCES depts(dept_id),
salary NUMERIC
);

INSERT INTO depts VALUES(1, 'IT'), (2, 'HR'), (3, 'SALES');
INSERT INTO emps VALUES(101, 'Mary', 1, 95000);
INSERT INTO emps VALUES(102, 'Amit', 1, 85000);
INSERT INTO emps VALUES(103, 'Sarah', 2, 70000);
INSERT INTO emps VALUES(104, 'John', 2, 65000);
INSERT INTO emps VALUES(105, 'Jack', 3, 55000);
INSERT INTO emps VALUES(106, 'Rohan', 1, 88000);

CREATE VIEW V_SIMPLE AS
SELECT name, salary FROM emps WHERE salary>75000;

SELECT * FROM V_SIMPLE;

CREATE VIEW V_COMPLEX AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emps e JOIN depts d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_COMPLEX;

CREATE MATERIALIZED VIEW V_MATERIALIZED AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emps e JOIN depts d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_MATERIALIZED;

REFRESH MATERIALIZED VIEW V_MATERIALIZED;

EXPLAIN ANALYZE SELECT * FROM V_SIMPLE;
EXPLAIN ANALYZE SELECT * FROM V_COMPLEX;
EXPLAIN ANALYZE SELECT * FROM V_MATERIALIZED;