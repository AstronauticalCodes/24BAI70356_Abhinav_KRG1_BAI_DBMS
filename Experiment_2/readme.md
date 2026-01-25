Experiment 2: Advanced Data Aggregation and Filtering

1. Aim of the Session
   The aim of this practical is to implement and analyze Group Functions and Conditional Filtering in SQL. The session focuses on using GROUP BY, HAVING, and ORDER BY clauses to extract meaningful insights from an employee dataset.
2. Objective of the Session
   By completing this practical, I have achieved the following:
   • Developed a schema for employee management using appropriate data types like NUMERIC and DATE.
   • Mastered the use of Aggregate Functions (specifically AVG) to perform calculations on data groups.
   • Learned to differentiate between the WHERE clause (row-level filtering) and the HAVING clause (group-level filtering).
   • Gained proficiency in sorting aggregated results using the ORDER BY clause.
3. Practical / Experiment Steps
   The following implementation tasks were completed:
4. Schema Definition: Created the employee table with constraints and precise numeric scaling for salaries.
5. Data Population: Inserted diverse records representing various departments (IT, HR, Sales, Finance) and salary ranges.
6. Basic Aggregation: Calculated the average salary per department using the GROUP BY clause.
7. Advanced Filtering: Applied the HAVING clause to filter out departments where the average salary did not meet a specific threshold.
8. Complex Querying: Combined WHERE, GROUP BY, HAVING, and ORDER BY into a single query to refine results based on individual salaries and group averages simultaneously.
9. Procedure of the Practical
   The experiment was conducted following these sequential steps:
10. System Initialization: Logged into the PostgreSQL environment via pgAdmin 4 using localhost as the host server.
11. Table Construction: Executed the CREATE TABLE command to define the structure for the employee dataset.
12. Data Insertion: Ran multiple INSERT statements to populate the table with the provided employee data.
13. Initial Verification: Used SELECT \* to confirm that all employee records were correctly stored and formatted.
14. Group Analysis: Executed a GROUP BY query to observe the distribution of average salaries across different departments.
15. Applying Group Filters: Integrated the HAVING clause to restrict the output to high-paying departments (Average > 30,000).
16. Final Refinement: Executed a comprehensive query that filtered individual employees (Salary > 20,000), grouped them by department, and sorted the results in descending order.
17. Output Recording: Captured screenshots of the query results and saved the final SQL script for documentation.
18. I/O Analysis (Input / Output Analysis)
    Input Queries
    SQL
    -- Table creation
    CREATE TABLE employee(
    emp_id NUMERIC PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    joining_date DATE
    );

-- Advanced Aggregation Query
SELECT department, AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC;
Output Details
• Aggregate Results: The system successfully grouped employees by department. ![alt text](<Screenshot 2026-01-21 at 8.42.38 PM.png>)
• Filtering Logic: The WHERE clause correctly excluded employees with salaries under 20,000 (like Sara and Vikram) before calculating averages.![alt text](<Screenshot 2026-01-21 at 8.42.54 PM.png>)
• Group Filtering: The HAVING clause ensured only departments with an average salary exceeding 30,000 were displayed in the final output.
• Sorting: The ORDER BY clause successfully sorted the final results from highest to lowest average salary. ![alt text](<Screenshot 2026-01-21 at 8.43.10 PM.png>) 6. Learning Outcome
Through this session, I have developed the following competencies:
• Analytical Skills: Gained the ability to transform raw row-level data into high-level summary reports using aggregation.
• Query Logic: Understood the logical execution order of SQL clauses: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY.
• Practical Exposure: Experienced handling real-world data scenarios, such as department-wise salary analysis and performance-based filtering in a professional database environment.
