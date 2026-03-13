DECLARE
    cid course.course_id%TYPE;

    CURSOR c1(c course.course_id%TYPE) IS
        SELECT i.id, i.name
        FROM instructor i
        JOIN teaches t ON i.id = t.id
        WHERE t.course_id = c;

BEGIN
    cid := '&Enter_Course_ID';

    FOR rec IN c1(cid)
    LOOP
        DBMS_OUTPUT.PUT_LINE(
        'Instructor ID: ' || rec.id ||
        ' Name: ' || rec.name);
    END LOOP;

END;
/