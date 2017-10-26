CREATE OR REPLACE TRIGGER unique_president
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
DECLARE
   nb_pres NUMBER;
BEGIN
   select count(JOB_ID) into nb_pres from EMPLOYEES where JOB_ID = 'AD_PRES';
    if nb_pres = 1 then
    Raise_application_error (-20222, 'Il existe deja un president dans la table des employes');
    
  end if;
END;
