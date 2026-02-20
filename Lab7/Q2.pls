DECLARE
    v_rollno StudentTable.RollNo%TYPE := &input_rollno;
    v_gpa StudentTable.GPA%TYPE;
BEGIN
    SELECT GPA INTO v_gpa
    FROM StudentTable
    WHERE RollNo = v_rollno; 
IF v_gpa>9 and v_gpa<10  THEN 
    DBMS_OUTPUT.PUT_LINE('Grade is A+'); 
ELSIF v_gpa>8 and v_gpa<9 THEN 
    DBMS_OUTPUT.PUT_LINE('Grade is A'); 
ELSIF v_gpa>7 and v_gpa<8 THEN 
    DBMS_OUTPUT.PUT_LINE('Grade is B'); 
ELSIF v_gpa>6 and v_gpa<7 THEN 
    DBMS_OUTPUT.PUT_LINE('Grade is C'); 
ELSIF v_gpa>5 and v_gpa<6 THEN 
    DBMS_OUTPUT.PUT_LINE('Grade is D'); 
ELSIF v_gpa>4 and v_gpa<5 THEN 
    DBMS_OUTPUT.PUT_LINE('Grade is E'); 
ELSE
    DBMS_OUTPUT.PUT_LINE('Grade is F'); 
END IF;
END;
/