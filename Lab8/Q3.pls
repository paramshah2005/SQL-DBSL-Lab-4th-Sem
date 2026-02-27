BEGIN
    FOR rec IN (
        SELECT c.course_id,
               c.title,
               c.dept_name,
               c.credits,
               i.name AS instructor_name,
               s.building,
               s.room_number,
               s.time_slot_id,
               COUNT(t.ID) AS tot_student_no
        FROM course c
        JOIN section s
             ON c.course_id = s.course_id
        LEFT JOIN teaches te
             ON s.course_id = te.course_id
             AND s.sec_id = te.sec_id
             AND s.semester = te.semester
             AND s.year = te.year
        LEFT JOIN instructor i
             ON te.ID = i.ID
        LEFT JOIN takes t
             ON s.course_id = t.course_id
             AND s.sec_id = t.sec_id
             AND s.semester = t.semester
             AND s.year = t.year
        GROUP BY c.course_id, c.title, c.dept_name,
                 c.credits, i.name,
                 s.building, s.room_number, s.time_slot_id
        ORDER BY c.course_id
    ) LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Course: ' || rec.course_id ||
            ' | Title: ' || rec.title ||
            ' | Dept: ' || rec.dept_name ||
            ' | Credits: ' || rec.credits ||
            ' | Instructor: ' || rec.instructor_name ||
            ' | Room: ' || rec.building || '-' || rec.room_number ||
            ' | Slot: ' || rec.time_slot_id ||
            ' | Students: ' || rec.tot_student_no
        );
	DBMS_OUTPUT.NEW_LINE;

    END LOOP;
END;
/