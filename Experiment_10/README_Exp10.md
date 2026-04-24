# Experiment 10

## Aim
To design a trigger that automatically implements the functionality of a primary key, ensuring unique identification of records without manual intervention.

---

## Objectives
* To create a database trigger that automatically enforces primary key constraints or generates unique key values, replicating the functionality of a stored procedure.

---

## Practical/Experiment Steps
* Schema Provisioning: Created the employees table with a structured format for personal and departmental data, specifically focusing on the emp_id as the unique identifier.
* Sequence Generation: Established an independent Database Sequence (emp_seq) to provide a continuous and reliable stream of unique numerical values.
* Trigger Function Development: Authored a PL/pgSQL function designed to intercept incoming data and check for the presence of a primary key value.
* Automated Logic Injection: Configured the function to automatically fetch the next value from the sequence using nextval() whenever a record is inserted without an ID.
* Before-Insert Activation: Bound the function to the table using a BEFORE INSERT trigger, ensuring that identity assignment occurs prior to data storage to prevent null constraint violations.
* Validation Testing: Conducted multiple insertions without specifying IDs to verify the trigger’s ability to maintain data integrity automatically.


---

## Procedure
1. Logged into the PostgreSQL environment and initialized the database session for the experiment.
2. Executed the CREATE TABLE command to define the employee structure.
3. Initialized a Sequence starting at 1 to serve as the source for automated ID generation.
4. Defined the auto_emp_id() trigger function to act as the primary key generator.
5. Implemented conditional logic within the function to ensure that if a user does not provide an emp_id, the system assigns one dynamically.
6. Created the trg_auto_emp_id trigger and attached it to the employees table for each row.
7. Performed test insertions by providing only the name and department, leaving the primary key field blank.
8. Executed a SELECT * query to verify that the system successfully assigned sequential IDs (1, 2, etc.) to the new records.
9. Documented the results to demonstrate how the trigger replicates the functionality of auto-incrementing fields used in companies like Amazon and Oracle.


---

## I/O Analysis

**1. Input:**
```sql
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50)
);
```

**Output:**


![Output](Exp10_Images/1.png)



**2. Input:**
```sql
CREATE SEQUENCE emp_seq
START 1;
```

**Output:**


![Output](Exp10_Images/2.png)



**3. Input:**
```sql
CREATE OR REPLACE FUNCTION auto_emp_id()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.emp_id IS NULL THEN
        NEW.emp_id := nextval('emp_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

**Output:**


![Output](Exp10_Images/3.png)



**4. Input:**
```sql
CREATE TRIGGER trg_auto_emp_id
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION auto_emp_id();
```

**Output:**


![Output](Exp10_Images/4.png)



**5. Input:**
```sql
INSERT INTO employees (emp_name, department)
VALUES ('Alice', 'HR');

INSERT INTO employees (emp_name, department)
VALUES ('Bob', 'IT');
```

**Output:**


![Output](Exp10_Images/5.png)



**5. Input:**
```sql
SELECT * FROM employees;
```

**Output:**


![Output](Exp10_Images/6.png)


---

## Learning Outcomes
* Trigger-Based Automation: Proficiency in designing triggers that eliminate the need for manual primary key assignment during data entry.
* Sequence Management: Understanding how to create and utilize database sequences for generating guaranteed unique identifiers.
* Data Integrity Enforcement: Mastery of ‘Before-Action’ triggers to intercept and validate records before they are committed to the database.
* Backend Logic Encapsulation: Gained the ability to implement enterprise-level automation where the database handles identity management independently of the application layer.
