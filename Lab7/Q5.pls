DECLARE
    v_rollno NUMBER := 1;
    v_gpa    StudentTable.GPA%TYPE;
    v_grade  VARCHAR2(2);
BEGIN
    WHILE v_rollno <= 5 LOOP

        SELECT GPA INTO v_gpa
        FROM StudentTable
        WHERE RollNo = v_rollno;

        IF v_gpa >= 0 AND v_gpa < 4 THEN
            v_grade := 'F';

        ELSIF v_gpa >= 4 AND v_gpa < 5 THEN
            v_grade := 'E';

        ELSIF v_gpa >= 5 AND v_gpa < 6 THEN
            v_grade := 'D';

        ELSIF v_gpa >= 6 AND v_gpa < 7 THEN
            v_grade := 'C';

        ELSIF v_gpa >= 7 AND v_gpa < 8 THEN
            v_grade := 'B';

        ELSIF v_gpa >= 8 AND v_gpa < 9 THEN
            v_grade := 'A';

        ELSE
            v_grade := 'A+';
        END IF;

        UPDATE StudentTable
        SET LetterGrade = v_grade
        WHERE RollNo = v_rollno;

        v_rollno := v_rollno + 1;

    END LOOP;
END;
/