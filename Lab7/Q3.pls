DECLARE
    v_issue  DATE := TO_DATE('&issue_date','DD-MM-YYYY');
    v_return DATE := TO_DATE('&return_date','DD-MM-YYYY');
    v_days   NUMBER;
    v_fine   NUMBER;
BEGIN
    v_days := v_return - v_issue;

    IF v_days <= 7 THEN
        v_fine := 0;

    ELSIF v_days BETWEEN 8 AND 15 THEN
        v_fine := v_days * 1;

    ELSIF v_days BETWEEN 16 AND 30 THEN
        v_fine := v_days * 2;

    ELSE
        v_fine := 5;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Late days: ' || v_days);
    DBMS_OUTPUT.PUT_LINE('Fine is Rs. ' || v_fine);
END;
/