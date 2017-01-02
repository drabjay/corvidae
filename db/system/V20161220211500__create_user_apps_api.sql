DECLARE
  l_password VARCHAR2(30);
BEGIN
  l_password := dbms_random.string('A', 30);
  EXECUTE IMMEDIATE
    'CREATE USER apps_api' ||
   ' IDENTIFIED BY ' || l_password ||
   ' DEFAULT TABLESPACE apps' ||
   ' QUOTA UNLIMITED ON apps' ||
   ' TEMPORARY TABLESPACE temp' ||
   ' PROFILE default' ||
   ' ACCOUNT UNLOCK';
END;
/
