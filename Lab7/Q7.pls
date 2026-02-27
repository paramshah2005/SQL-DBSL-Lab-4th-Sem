DECLARE
    v_rollno NUMBER := 1;
    v_gpa    NUMBER;
    v_grade  VARCHAR2(2);
BEGIN
<<start_loop>>

    IF v_rollno > 5 THEN
        GOTO end_loop;
    END IF;

    SELECT GPA INTO v_gpa
    FROM StudentTable
    WHERE RollNo = v_rollno;

    IF v_gpa < 4 THEN v_grade := 'F';
    ELSIF v_gpa < 5 THEN v_grade := 'E';
    ELSIF v_gpa < 6 THEN v_grade := 'D';
    ELSIF v_gpa < 7 THEN v_grade := 'C';
    ELSIF v_gpa < 8 THEN v_grade := 'B';
    ELSIF v_gpa < 9 THEN v_grade := 'A';
    ELSE v_grade := 'A+';
    END IF;

    DBMS_OUTPUT.PUT_LINE('RollNo: ' || v_rollno ||
                         ' Grade: ' || v_grade);

    v_rollno := v_rollno + 1;

    GOTO start_loop;

<<end_loop>>
    NULL;
END;
/