CREATE OR REPLACE FUNCTION trouverEmploye (f_no_Emp IN NUMBER)
RETURN BOOLEAN IS
    v_Emp BOOLEAN;
    CURSOR c1 IS SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = f_no_Emp;
BEGIN
   OPEN c1;
   FETCH c1 INTO v_no_Emp;
   v_Emp := TRUE;
   IF c1%NOTFOUND THEN
       v_Emp := FALSE;
       DBMS_OUTPUT.PUT_LINE('Il n y a pas d employe a ce nom');
   END IF;
   CLOSE c1;
RETURN v_Emp;
END;
