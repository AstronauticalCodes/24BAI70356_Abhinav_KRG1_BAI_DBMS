CREATE TABLE EMPLOYEES(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(20),
gender VARCHAR(20),
salary NUMERIC(10, 2)
);

INSERT INTO employees (emp_id, emp_name, gender, salary) VALUES
(101, 'Amit', 'Male', 30000),
(102, 'Sarah', 'Female', 55000),
(103, 'Riya', 'Female', 45000),
(104, 'Arjun', 'Male', 59000),
(105, 'Anjali', 'Female', 66000);

CREATE OR REPLACE PROCEDURE get_employee_count_by_gender (IN IN_GENDER VARCHAR(20), OUT OUT_COUNT INT, INOUT STATUS VARCHAR(20))
AS
$$
BEGIN
	SELECT COUNT(*) INTO OUT_COUNT FROM employees WHERE gender = IN_GENDER;
	STATUS:='SUCCESS';
END;
$$ LANGUAGE PLPGSQL;

DO
$$
DECLARE
GEN VARCHAR(20):='Female';
COUNT_OF_EMPLOYEES INT;
STATUS VARCHAR:='PENDING';

BEGIN
	CALL get_employee_count_by_gender(GEN, COUNT_OF_EMPLOYEES, STATUS);
	RAISE NOTICE 'COUNT OF % EMPLOYEES IS % AND STATUS IS %', GEN, COUNT_OF_EMPLOYEES, STATUS;
END;
$$
