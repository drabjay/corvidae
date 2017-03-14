ALTER TABLE logs
ADD CONSTRAINT log_tab0001
PRIMARY KEY
  (log_id)
USING INDEX
TABLESPACE apps
STORAGE
  (INITIAL 16K
   NEXT 16K
   MINEXTENTS 1
   MAXEXTENTS UNLIMITED
   PCTINCREASE 0
   FREELISTS 1
   FREELIST GROUPS 1)
PCTFREE 5
INITRANS 2
MAXTRANS 255;