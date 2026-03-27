CREATE OR REPLACE FUNCTION department_highest(dept IN VARCHAR2)
RETURN VARCHAR2
AS
    ans VARCHAR2(50);
BEGIN
    SELECT name INTO ans
    FROM instructor
    WHERE dept_name = dept
    AND salary = (
        SELECT MAX(salary)
        FROM instructor
        WHERE dept_name = dept
    );

    RETURN ans;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No Instructor';
END;
/

DECLARE
BEGIN
    FOR d IN (SELECT dept_name FROM department)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Department: ' || d.dept_name ||
                             ' -> Highest Paid Instructor: ' ||
                             department_highest(d.dept_name));
    END LOOP;
END;
/