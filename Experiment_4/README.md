# Database Programming Exercise 4

## Purpose
This practical focuses on building decision-making logic in procedural database code using conditional branching techniques. The goal is to create programs that evaluate conditions and execute specific code paths based on variable values and establish problem-solving skills with complex nested decision trees.

---

## Goals
* Build working PL/SQL routines with multiple branching scenarios (IF-ELSE, ELSIF chains, CASE).

---

## Implementation Approach
* Procedural Flow Analysis: Created multiple executable blocks to exercise various branching patterns and understand control path selection.
* Numerical Classification: Built IF-ELSE and ELSIF chains to test numerical inputs and partition them into meaningful categories.
* Value Mapping: Applied CASE expressions as an efficient lookup mechanism for converting numeric codes into readable labels.
* Output Generation: Structured programs to produce formatted messages that reflect the logical decisions made by each block.
* Testing Methodology: Ran each program with different input values to confirm the correct decision path was followed.


---

## Implementation Method
1. Configured the database session to display output from procedural blocks.
2. Built a simple decision block to test a numeric value for sign classification.
3. Wrote an IF-ELSIF-ELSE routine to assign performance ratings based on score thresholds.
4. Developed a multi-level conditional structure to map numeric results into descriptive performance categories.
5. Wrote a CASE lookup block to convert numeric identifiers to textual representations.
6. Set up test data with various edge cases and boundary values.
7. Packaged each routine in standard BEGIN...END executable blocks.
8. Ran all programs and captured console output.
9. Reviewed output against expected results from the logic.
10. Verified each decision branch executed with the appropriate test inputs.


---

## Results and Analysis

**Program 1: Sign Detection**
```sql
DECLARE
    val NUMBER := -21;
BEGIN
    IF val < 1 THEN
        DBMS_OUTPUT.PUT_LINE('Value is zero or negative');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Value is greater than zero');
    END IF;
END;
```

**Execution Output:**

![Console Results 1](output_screenshots/run_1.png)

![Console Results 1](output_screenshots/run_2.png)


**Program 2: Score Evaluation**
```sql
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
```

**Execution Output:**

![Console Results 2](output_screenshots/run_3.png)

![Console Results 2](output_screenshots/run_4.png)


**Program 3: Classification by Range**
```sql
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
```

**Execution Output:**

![Console Results 3](output_screenshots/run_5.png)

![Console Results 3](output_screenshots/run_6.png)


**Program 4: Lookup Table Translation**
```sql
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
```

**Execution Output:**

![Console Results 4](output_screenshots/run_7.png)

![Console Results 4](output_screenshots/run_8.png)


---

## Key Takeaways
* Conditional branching enables dynamic behavior and decision automation within database procedures.
* IF-ELSIF chains handle complex multi-way decisions with clear logical precedence.
* CASE expressions provide cleaner syntax for value lookups and enumeration mapping.
* Proper threshold definition is critical for correct classification logic.
* Input validation and boundary testing ensure robust procedural behavior.