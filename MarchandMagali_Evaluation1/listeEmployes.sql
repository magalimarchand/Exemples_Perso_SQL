CREATE OR REPLACE PROCEDURE listeEmployes
IS 
 
    v_prenom VARCHAR2(20 BYTE);
    v_nom VARCHAR2(25 BYTE);
    v_salaire NUMBER(8,2);
    CURSOR c1 IS SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES 
    WHERE JOB_ID = 'IT_PROG';
BEGIN
   OPEN c1;
   WHILE c1%FOUND LOOP
   FETCH c1 INTO v_prenom, v_nom, v_salaire;
   DBMS_OUTPUT.PU_LINE('Employe: ' || v_prenom || 'Nom: ' || v_nom || 'Salaire: ' || v_salaire);
   END LOOP;
   CLOSE c1;

END;
