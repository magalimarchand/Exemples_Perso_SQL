create or replace function GET_SERVICE_YRS (F_Emp in number) 
return number is 
v_anciennete number;
v_loop      PLS_INTEGER:=0;
cursor c is select (to_number (to_char (END_DATE, 'YYYY')))
       	- to_number (to_char (START_DATE, 'YYYY')) 
from HR_JOB_HISTORY  where EMPLOYEE_ID = F_Emp;
curs number;

begin
	open c;
	v_anciennete := 0;

	for v_loop in (select EMPLOYEE_ID 
    from HR_JOB_HISTORY  where EMPLOYEE_ID = F_Emp)
  loop
    fetch c into curs;
    v_anciennete := v_anciennete  + curs;
    IF c%NOTFOUND THEN
       v_anciennete := -1;
       DBMS_OUTPUT.PUT_LINE('Il n y a pas d employe a ce nom');
end if;
  end loop;

close c;
return v_anciennete;
end GET_SERVICE_YRS;
