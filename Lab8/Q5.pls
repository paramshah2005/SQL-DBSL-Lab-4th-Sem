DECLARE
    CURSOR c1 IS
        SELECT rollno, gpa
        FROM studenttable
        FOR UPDATE;

    grade VARCHAR2(2);
BEGIN
    FOR rec IN c1 LOOP

        IF rec.gpa < 4 THEN grade := 'F';
        ELSIF rec.gpa < 5 THEN grade := 'E';
        ELSIF rec.gpa < 6 THEN grade := 'D';
        ELSIF rec.gpa < 7 THEN grade := 'C';
        ELSIF rec.gpa < 8 THEN grade := 'B';
        ELSIF rec.gpa < 9 THEN grade := 'A';
        ELSE grade := 'A+';
        END IF;

        UPDATE studenttable
        SET lettergrade = grade
        WHERE CURRENT OF c1;

    END LOOP;
END;
/