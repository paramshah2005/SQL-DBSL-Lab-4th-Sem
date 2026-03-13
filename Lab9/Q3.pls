CREATE OR REPLACE PROCEDURE course_popular(p_dept_name IN VARCHAR2) IS

    max_count NUMBER;

    CURSOR c_popular IS
        SELECT t.course_id, COUNT(*) cnt
        FROM takes t, course c
        WHERE t.course_id = c.course_id
        AND c.dept_name = p_dept_name
        GROUP BY t.course_id
        HAVING COUNT(*) = max_count;

BEGIN
    SELECT MAX(cnt) INTO max_count
    FROM (
        SELECT COUNT(*) cnt
        FROM takes t, course c
        WHERE t.course_id = c.course_id
        AND c.dept_name = p_dept_name
        GROUP BY t.course_id
    );

    DBMS_OUTPUT.PUT_LINE('Department: ' || p_dept_name);

    FOR rec IN c_popular LOOP
        DBMS_OUTPUT.PUT_LINE('Most Popular Course: ' || rec.course_id ||
                             ' Students: ' || rec.cnt);
    END LOOP;

END;
/

DECLARE
    CURSOR dept_cur IS
        SELECT dept_name FROM department;
BEGIN
    FOR d IN dept_cur LOOP
        course_popular(d.dept_name);
    END LOOP;
END;
/

