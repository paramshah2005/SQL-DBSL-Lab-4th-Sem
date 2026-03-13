CREATE OR REPLACE PROCEDURE good_day_proc IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Good Day to You');
END;
/

BEGIN
    good_day_proc;
END;
/