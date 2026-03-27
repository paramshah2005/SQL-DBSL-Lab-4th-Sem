CREATE OR REPLACE PROCEDURE interest_calc(
    p IN NUMBER,        
    r IN NUMBER,        
    t IN NUMBER,        
    si OUT NUMBER,      
    ci OUT NUMBER,      
    total IN OUT NUMBER 
)
IS
BEGIN
    si := (p * r * t) / 100;
    ci := p * POWER((1 + r/100), t) - p;
    total := p + ci;
END;
/

DECLARE
    p NUMBER := &principal;
    r NUMBER := &rate;
    t NUMBER := &time;

    si NUMBER;
    ci NUMBER;
    total NUMBER;
BEGIN
    interest_calc(p, r, t, si, ci, total);
    DBMS_OUTPUT.PUT_LINE('Simple Interest: ' || si);
    DBMS_OUTPUT.PUT_LINE('Compound Interest: ' || ci);
    DBMS_OUTPUT.PUT_LINE('Total Amount: ' || total);
END;
/