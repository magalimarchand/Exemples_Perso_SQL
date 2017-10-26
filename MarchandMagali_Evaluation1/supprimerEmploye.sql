create or replace procedure supprimerEmploye (f_no_Emp IN NUMBER) is
begin

DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID = f_no_Emp;

end;