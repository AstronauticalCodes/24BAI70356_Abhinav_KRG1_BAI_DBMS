DECLARE
    v_id NUMBER := 202;
    v_name VARCHAR2(30) := 'PRIYA';
    v_income NUMBER := 42000;
    v_hra NUMBER;
BEGIN
    v_hra := v_income * 0.35;
    DBMS_OUTPUT.PUT_LINE('--- Employee Details ---');
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Monthly Income: Rs. ' || v_income);
    DBMS_OUTPUT.PUT_LINE('HRA (35%): Rs. ' || v_hra);
    IF v_income >= 50000 THEN
        DBMS_OUTPUT.PUT_LINE('Tax Status: Taxable');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Tax Status: Not Taxable');
    END IF;
    DBMS_OUTPUT.PUT_LINE('------------------------');
END;