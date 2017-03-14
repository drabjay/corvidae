CREATE TABLE logs
  (log_id                         NUMBER(10)     CONSTRAINT log_chr0001 NOT NULL
  ,log_date                       TIMESTAMP(9)   CONSTRAINT log_chr0002 NOT NULL
  ,username                       VARCHAR2(30)   CONSTRAINT log_chr0003 NOT NULL
  ,session_id                     NUMBER         CONSTRAINT log_chr0004 NOT NULL
  ,log_level                      NUMBER(2)      CONSTRAINT log_chr0005 NOT NULL
  ,log_text                       VARCHAR2(2000) CONSTRAINT log_chr0006 NOT NULL
  ,module_name                    VARCHAR2(61)   CONSTRAINT log_chr0007 NOT NULL
  ,section_number                 NUMBER(4)      CONSTRAINT log_chr0008 NOT NULL
  ,error_backtrace                VARCHAR2(2000)
  ,variables                      variables_tbl)
  TABLESPACE apps
  PCTFREE 10
  PCTUSED 40
  INITRANS 1
  STORAGE
    (INITIAL 1M
     NEXT 1M
     MINEXTENTS 1
     MAXEXTENTS UNLIMITED
     PCTINCREASE 0
     FREELISTS 1
     FREELIST GROUPS 1)
  LOGGING
  NESTED TABLE variables
    STORE AS log_variables
      (TABLESPACE apps
       PCTFREE 10
       PCTUSED 40
       INITRANS 1
       STORAGE
        (INITIAL 1M
         NEXT 1M
         MINEXTENTS 1
         MAXEXTENTS UNLIMITED
         PCTINCREASE 0
         FREELISTS 1
         FREELIST GROUPS 1)
      LOGGING);
