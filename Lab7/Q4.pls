DECLARE
    v_rollno NUMBER := 1;
    v_gpa    StudentTable.GPA%TYPE;
BEGIN
    LOOP
        SELECT GPA INTO v_gpa
        FROM StudentTable
        WHERE RollNo = v_rollno;

        IF v_gpa >= 0 AND v_gpa < 4 THEN
            DBMS_OUTPUT.PUT_LINE('Grade: F');

        ELSIF v_gpa >= 4 AND v_gpa < 5 THEN
            DBMS_OUTPUT.PUT_LINE('Grade: E');

        ELSIF v_gpa >= 5 AND v_gpa < 6 THEN
            DBMS_OUTPUT.PUT_LINE('Grade: D');

        ELSIF v_gpa >= 6 AND v_gpa < 7 THEN
            DBMS_OUTPUT.PUT_LINE('Grade: C');

        ELSIF v_gpa >= 7 AND v_gpa < 8 THEN
            DBMS_OUTPUT.PUT_LINE('Grade: B');

        ELSIF v_gpa >= 8 AND v_gpa < 9 THEN
            DBMS_OUTPUT.PUT_LINE('Grade: A');

        ELSE
            DBMS_OUTPUT.PUT_LINE('Grade: A+');
        END IF;

        v_rollno := v_rollno + 1;

        EXIT WHEN v_rollno > 5;
    END LOOP;
END;
/