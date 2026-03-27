CREATE OR REPLACE FUNCTION square_num(n IN NUMBER)
RETURN NUMBER
as ANS NUMBER;
BEGIN
    ANS:= n * n;
    RETURN ANS;
END;
/

DECLARE
    num NUMBER := &num; 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Square is: ' || square_num(num));
END;
/