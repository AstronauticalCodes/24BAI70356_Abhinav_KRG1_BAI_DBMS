CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50)
);

CREATE SEQUENCE emp_seq
START 1;

CREATE OR REPLACE FUNCTION auto_emp_id()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.emp_id IS NULL THEN
        NEW.emp_id := nextval('emp_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_auto_emp_id
BEFORE INSERT ON employees
FOR EACH ROW
EXECUTE FUNCTION auto_emp_id();


INSERT INTO employees (emp_name, department)
VALUES ('Alice', 'HR');

INSERT INTO employees (emp_name, department)
VALUES ('Bob', 'IT');

SELECT * FROM employees;