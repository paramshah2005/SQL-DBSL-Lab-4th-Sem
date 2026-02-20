DECLARE
    v_rollno StudentTable.RollNo%TYPE := &input_rollno;
    v_gpa StudentTable.GPA%TYPE;
BEGIN
    SELECT GPA INTO v_gpa
    FROM StudentTable
    WHERE RollNo = v_rollno; 
    DBMS_OUTPUT.PUT_LINE('GPA is ' || v_gpa);
END;
/