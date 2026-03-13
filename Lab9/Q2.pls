CREATE OR REPLACE PROCEDURE dept_details(p_dept_name IN VARCHAR2) IS

    CURSOR inst_cur IS
        SELECT name
        FROM instructor
        WHERE dept_name = p_dept_name;

    CURSOR course_cur IS
        SELECT title
        FROM course
        WHERE dept_name = p_dept_name;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Instructors in Department: ' || p_dept_name);

    FOR i IN inst_cur LOOP
        DBMS_OUTPUT.PUT_LINE('Instructor: ' || i.name);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Courses offered by Department: ' || p_dept_name);

    FOR c IN course_cur LOOP
        DBMS_OUTPUT.PUT_LINE('Course: ' || c.title);
    END LOOP;

END;
/


BEGIN
    dept_details('Biology');
END;
/