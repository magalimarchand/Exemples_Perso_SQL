create or replace procedure AJOUT_FONCT (p_id_job in VARCHAR2, p_title_job in VARCHAR2) is
begin

INSERT INTO JOBS(JOB_ID,JOB_TITLE)
values(p_id_job,p_title_job);

end;