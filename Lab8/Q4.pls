declare
    cursor c1 IS
        select id
        from takes
        where course_id = 'CS101'
        for update;

    credits number;
BEGIN
    FOR rec IN c1 LOOP

        SELECT tot_cred
        INTO credits
        FROM student
        WHERE id = rec.id;

        IF credits < 30 THEN
            DELETE FROM takes
            WHERE CURRENT OF c1;
        END IF;

    END LOOP;

    COMMIT;
END;
/