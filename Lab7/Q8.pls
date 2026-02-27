DECLARE
    v_name      INSTRUCTOR.NAME%TYPE := '&name';
    v_id        INSTRUCTOR.ID%TYPE;
    v_dept      INSTRUCTOR.DEPT_NAME%TYPE;
    v_salary    INSTRUCTOR.SALARY%TYPE;

BEGIN
    SELECT ID, DEPT_NAME, SALARY
    INTO v_id, v_dept, v_salary
    FROM INSTRUCTOR
    WHERE NAME = v_name;

    DBMS_OUTPUT.PUT_LINE('Instructor Details:');
    DBMS_OUTPUT.PUT_LINE('ID        : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Department: ' || v_dept);
    DBMS_OUTPUT.PUT_LINE('Salary    : ' || v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No instructor found with the given name.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Multiple instructors found with the same name.');

END;
/