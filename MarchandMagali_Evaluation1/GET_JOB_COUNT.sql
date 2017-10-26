CREATE OR REPLACE FUNCTION GET_JOB_COUNT (p_id_emp IN NUMBER)
RETURN NUMBER IS
    v_nb1 NUMBER;
    v_nb2 NUMBER;
    v_nb3 NUMBER;
    notfound_id EXCEPTION;
    CURSOR c1 IS SELECT distinct JOB_ID FROM JOB_HISTORY WHERE EMPLOYEE_ID = p_id_emp;
    CURSOR c2 IS SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = p_id_emp;
    CURSOR c3 IS SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = p_id_emp;

BEGIN
   OPEN c1;
   OPEN c2;
   OPEN c3;
   
   v_nb1 := 0;
   v_nb2 := 0;
   v_nb3 := 0;
   
   WHILE c1%FOUND LOOP
    v_nb1 := v_nb1 + 1;
   END LOOP;
   
   IF c1%NOTFOUND THEN
    v_nb1 := 0;
   END IF;
   
   IF c2%FOUND THEN
   v_nb2 := 1;
   else IF c2%NOTFOUND THEN
    v_nb2 := 0;
   END IF;
   
   IF c3%NOTFOUND THEN
    RAISE notfound_id;
   END IF;
   
   v_nb3 := v_nb1 + v_nb2;
   
 EXCEPTION
 WHEN notfound_id THEN
  raise_application_error (-20001,'Cet id employe ne se trouve pas dans la base de donnees.');

   CLOSE c1;
   CLOSE c2;
   CLOSE c3;
RETURN v_nb3;
END;
