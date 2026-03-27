CREATE OR REPLACE PROCEDURE dept_student_course(p_dept_name IN VARCHAR2) IS

    CURSOR student_cur IS
        SELECT name
        FROM student
        WHERE dept_name = p_dept_name;

    CURSOR course_cur IS
        SELECT title
        FROM course
        WHERE dept_name = p_dept_name;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Department: ' || p_dept_name);

    DBMS_OUTPUT.PUT_LINE('Students:');
    FOR s IN student_cur LOOP
        DBMS_OUTPUT.PUT_LINE(s.name);
    END LOOP;

    DBMS_OUTPUT.NEW_LINE;

    DBMS_OUTPUT.PUT_LINE('Courses:');
    FOR c IN course_cur LOOP
        DBMS_OUTPUT.PUT_LINE(c.title);
    END LOOP;

END;
/

DECLARE
    dept VARCHAR2(30);
BEGIN
    dept := '&dept_name'; 
    dept_student_course(dept);
END;
/