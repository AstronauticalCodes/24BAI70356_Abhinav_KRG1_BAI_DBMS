# Experiment 7

## Aim
To design and implement a materialised view and to compare and analyse execution time and performance differences between simple views, complex views, and materialised views, thereby understanding their impact on query optimisation and system performance.

---

## Objectives
* To create simple views, complex views, and materialised views, and to evaluate their performance by comparing query execution time for each, highlighting the advantages of materialised views in enterprise-level applications.

---

## Practical/Experiment Steps
* Relational Schema Construction: Developed the depts and emps tables, establishing a primary-foreign key relationship to simulate an enterprise organizational structure.
* Simple View Implementation: Created a standard virtual view (V_SIMPLE) to filter specific columns and rows from a single table based on salary thresholds.
* Complex Logic Aggregation: Designed a complex view (V_COMPLEX) that integrates multi-table joins and aggregate functions like SUM() and AVG() for departmental budgeting.
* Materialized Storage Configuration: Implemented a Materialized View (V_MATERIALIZED) to physically store precomputed query results, reducing the overhead of real-time calculations.
* Performance Benchmark Analysis: Utilized the EXPLAIN ANALYZE utility to measure and compare the execution costs and retrieval times across all three view types.
* Data Refresh Synchronisation: Executed the REFRESH MATERIALIZED VIEW command to ensure the stored data reflects the most recent updates from the underlying base tables.


---

## Procedure
1. Initialized the PostgreSQL environment via pgAdmin and established a connection to the local database server.
2. Executed the DDL scripts to create the depts and emps tables and populated them with representative organizational data.
3. Defined a Simple View to extract high-salary employee names and verified the output with a basic SELECT statement.
4. Constructed a Complex View using an INNER JOIN and GROUP BY clause to calculate total and average salaries by department.
5. Created a Materialized View using the same logic as the complex view to demonstrate how results are persisted in storage.
6. Simulated a data update scenario and practiced the REFRESH command to synchronize the materialized view with the base tables.
7. Conducted an execution time analysis by running EXPLAIN ANALYZE on each view to observe the differences in query planning and execution speed.
8. Evaluated the performance metrics, noting the shift from real-time computation in complex views to direct data retrieval in materialized views.
9. Saved the execution logs and performance reports to document the efficiency gains achieved through materialized caching.



---

## I/O Analysis

**1. Input:**
```sql
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
```

**Output:**


![Output](Exp7_Images/1.png)



**2. Input:**
```sql
INSERT INTO depts VALUES(1, 'IT'), (2, 'HR'), (3, 'SALES');
INSERT INTO emps VALUES(101, 'Mary', 1, 95000);
INSERT INTO emps VALUES(102, 'Amit', 1, 85000);
INSERT INTO emps VALUES(103, 'Sarah', 2, 70000);
INSERT INTO emps VALUES(104, 'John', 2, 65000);
INSERT INTO emps VALUES(105, 'Jack', 3, 55000);
INSERT INTO emps VALUES(106, 'Rohan', 1, 88000);
```

**Output:**


![Output](Exp7_Images/2.png)



**3. Input:**
```sql
CREATE VIEW V_SIMPLE AS
SELECT name, salary FROM emps WHERE salary>75000;

SELECT * FROM V_SIMPLE;
```

**Output:**


![Output](Exp7_Images/3.png)



**4. Input:**
```sql
CREATE VIEW V_COMPLEX AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emps e JOIN depts d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_COMPLEX;
```

**Output:**


![Output](Exp7_Images/4.png)



**5. Input:**
```sql
CREATE MATERIALIZED VIEW V_MATERIALIZED AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emps e JOIN depts d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_MATERIALIZED;
```

**Output:**


![Output](Exp7_Images/5.png)



**6. Input:**
```sql
REFRESH MATERIALIZED VIEW V_MATERIALIZED;
```

**Output:**


![Output](Exp7_Images/6.png)



**7. Input:**
```sql
EXPLAIN ANALYZE SELECT * FROM V_SIMPLE;
```

**Output:**


![Output](Exp7_Images/7.png)



**8. Input:**
```sql
EXPLAIN ANALYZE SELECT * FROM V_COMPLEX;
```

**Output:**


![Output](Exp7_Images/8.png)



**9. Input:**
```sql
EXPLAIN ANALYZE SELECT * FROM V_MATERIALIZED;
```

**Output:**


![Output](Exp7_Images/9.png)

---

## Learning Outcomes
* Gained proficiency in differentiating between virtual simple/complex views and physically stored materialized views.
* Gained the ability to use EXPLAIN ANALYZE to interpret query plans and identify performance bottlenecks.
* Learned the lifecycle of materialized views, including creation, storage benefits, and manual refresh mechanisms.
* Understanding how precomputing results in materialized views supports high-performance requirements for companies like SanDisk and PayPal.
