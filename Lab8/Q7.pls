DECLARE
    CURSOR c1 IS
        SELECT s.name, t.course_id
        FROM student s
        JOIN advisor a ON s.id = a.s_id
        JOIN teaches t ON a.i_id = t.id
        JOIN takes tk ON s.id = tk.id
        WHERE tk.course_id = t.course_id;

BEGIN
    FOR rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name||' ======> '|| rec.course_id);
    END LOOP;
END;
/