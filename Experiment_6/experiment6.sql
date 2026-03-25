CREATE TABLE Employees(
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR(20),
    role VARCHAR(20),
    salary NUMBER
);

INSERT INTO Employees VALUES (101, 'Mary', 'Engineer', 85000);
INSERT INTO Employees VALUES (102, 'Amit', 'Analyst', 45000);
INSERT INTO Employees VALUES (103, 'Sara', 'Engineer', 90000);
INSERT INTO Employees VALUES (104, 'Sam', 'Analyst', 80000);
COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_target_id NUMBER :=101;

BEGIN 
    UPDATE Employees 
    SET salary = salary*1.10
    WHERE emp_id = v_target_id;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ATTRIBUTE SQL%FOUND TRUE');
        DBMS_OUTPUT.PUT_LINE('ROW(S) UPDATED '||SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO ROW UPDATED');
    END IF;

END;

DECLARE
    CURSOR c_engg IS SELECT name, role FROM Employees WHERE role = 'Engineer';
    v_name Employees.name%TYPE;
    v_role Employees.role%TYPE;

BEGIN

    OPEN c_engg;

    IF c_engg%ISOPEN THEN
    DBMS_OUTPUT.PUT_LINE('CURSOR IS OPEN');
    END IF;

    LOOP
        FETCH c_engg INTO v_name, v_role;

        IF c_engg%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('%NOTFOUND IS TRUE, NO MORE RECORDS');
            EXIT;
        END IF;

        DBMS_OUTPUT.PUT_LINE('ENGINEER # '||c_engg%ROWCOUNT|| ': ' 
        || v_name || ' | ' || v_role);
    
    END LOOP;

    CLOSE c_engg;

    IF NOT c_engg%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED SUCCESSFULLY');
    END IF;
END;