DECLARE
    CURSOR c_student IS
        SELECT ID, name, dept_name, tot_cred
        FROM student
        ORDER BY tot_cred ASC;

    v_rec c_student%ROWTYPE;

BEGIN
    OPEN c_student;

    LOOP
        FETCH c_student INTO v_rec;

        EXIT WHEN c_student%NOTFOUND OR c_student%ROWCOUNT > 10;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_rec.ID ||
            ' Name: ' || v_rec.name ||
            ' Dept: ' || v_rec.dept_name ||
            ' Credits: ' || v_rec.tot_cred
        );
    END LOOP;

    CLOSE c_student;
END;
/