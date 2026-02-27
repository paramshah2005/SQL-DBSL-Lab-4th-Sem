DECLARE
    v_max_gpa NUMBER := 0;
    v_rollno  NUMBER;
BEGIN
    FOR rec IN (SELECT RollNo, GPA FROM StudentTable) LOOP
        IF rec.GPA > v_max_gpa THEN
            v_max_gpa := rec.GPA;
            v_rollno := rec.RollNo;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Top Student');
    DBMS_OUTPUT.PUT_LINE('RollNo: ' || v_rollno);
    DBMS_OUTPUT.PUT_LINE('GPA: ' || v_max_gpa);
END;
/