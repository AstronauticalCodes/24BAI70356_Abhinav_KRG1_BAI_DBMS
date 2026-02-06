DECLARE
    val NUMBER := -21;
BEGIN
    IF val < 1 THEN
        DBMS_OUTPUT.PUT_LINE('Value is zero or negative');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Value is greater than zero');
    END IF;
END;


DECLARE
    score NUMBER := 68;
    letter CHAR(1);
BEGIN
    CASE
        WHEN score >= 90 THEN letter := 'A';
        WHEN score >= 80 THEN letter := 'B';
        WHEN score >= 70 THEN letter := 'C';
        WHEN score >= 60 THEN letter := 'D';
        ELSE letter := 'E';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Score: ' || score || ' | Grade: ' || letter);
END;


DECLARE
    result NUMBER := 38;
    category VARCHAR2(25);
BEGIN
    IF result >= 75 THEN
        category := 'Honours';
    ELSIF result >= 60 THEN
        category := 'Merit';
    ELSIF result >= 50 THEN
        category := 'Average';
    ELSIF result >= 35 THEN
        category := 'Satisfactory';
    ELSE
        category := 'Unsuccessful';
    END IF;
    DBMS_OUTPUT.PUT_LINE('Result: ' || result || ' - Category: ' || category);
END;
    
    
DECLARE
    weekday_num NUMBER := 3;
    weekday_name VARCHAR2(15);
BEGIN
    weekday_name := CASE weekday_num
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
        ELSE 'Not a valid weekday'
    END;
    DBMS_OUTPUT.PUT_LINE('Day: ' || weekday_name);
END;