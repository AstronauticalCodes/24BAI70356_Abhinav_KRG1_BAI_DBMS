CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);

INSERT INTO employees VALUES (1, 'Amit', 30000);
INSERT INTO employees VALUES (2, 'Riya', 40000);
INSERT INTO employees VALUES (3, 'John', 50000);

COMMIT;

CREATE OR REPLACE PACKAGE emp_package AS
    -- Procedure to display all employee details
    PROCEDURE show_employees;

    -- Procedure to display employee by ID
    PROCEDURE get_employee(p_id NUMBER);
END emp_package;
/

CREATE OR REPLACE PACKAGE BODY emp_package AS

    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary FROM employees;

 
    PROCEDURE show_employees IS
    BEGIN
        FOR rec IN emp_cursor LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.emp_id ||
                                 ' Name: ' || rec.emp_name ||
                                 ' Salary: ' || rec.salary);
        END LOOP;
    END;

 
    PROCEDURE get_employee(p_id NUMBER) IS
    BEGIN
        FOR rec IN emp_cursor LOOP
            IF rec.emp_id = p_id THEN
                DBMS_OUTPUT.PUT_LINE('Employee Found -> ID: ' || rec.emp_id ||
                                     ' Name: ' || rec.emp_name ||
                                     ' Salary: ' || rec.salary);
            END IF;
        END LOOP;
    END;

END emp_package;
/


SET SERVEROUTPUT ON;


BEGIN
    emp_package.show_employees;
END;
/


BEGIN
    emp_package.get_employee(2);
END;
/