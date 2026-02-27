DECLARE
    v_dept        instructor.dept_name%TYPE := '&dept_name';
    v_raise_amt   NUMBER(10,2);

    CURSOR c_inst IS
        SELECT ID, salary
        FROM instructor
        WHERE dept_name = v_dept
        FOR UPDATE;

    v_id      instructor.ID%TYPE;
    v_salary  instructor.salary%TYPE;

BEGIN
    OPEN c_inst;

    IF c_inst%ISOPEN THEN
        LOOP
            FETCH c_inst INTO v_id, v_salary;

            EXIT WHEN c_inst%NOTFOUND;

            v_raise_amt := v_salary * 0.05;

            UPDATE instructor
            SET salary = salary + v_raise_amt
            WHERE CURRENT OF c_inst;

            INSERT INTO salary_raise
            VALUES (v_id, SYSDATE, v_raise_amt);

        END LOOP;
    END IF;

    CLOSE c_inst;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

END;
/