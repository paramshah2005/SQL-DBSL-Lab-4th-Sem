CREATE OR REPLACE PACKAGE dept_pkg AS
    PROCEDURE list_instructors(dept VARCHAR2);
    FUNCTION max_salary(dept VARCHAR2)
    RETURN NUMBER;
END dept_pkg;
/

CREATE OR REPLACE PACKAGE BODY dept_pkg AS

    PROCEDURE list_instructors(dept VARCHAR2) IS
    BEGIN
        FOR i IN (SELECT name FROM instructor WHERE dept_name = dept)
        LOOP
            DBMS_OUTPUT.PUT_LINE(i.name);
        END LOOP;
    END;

    FUNCTION max_salary(dept VARCHAR2)
    RETURN NUMBER
    IS
        sal NUMBER;
    BEGIN
        SELECT MAX(salary) INTO sal
        FROM instructor
        WHERE dept_name = dept;

        RETURN sal;
    END;

END dept_pkg;
/


DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- INSTRUCTORS ---');
    FOR d IN (SELECT dept_name FROM department)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Department: ' || d.dept_name);
        dept_pkg.list_instructors(d.dept_name);
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--- MAX SALARY ---');
    FOR d IN (SELECT dept_name FROM department)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Department: ' || d.dept_name ||
                             ' -> Max Salary: ' ||
                             dept_pkg.max_salary(d.dept_name));
    END LOOP;

END;
/