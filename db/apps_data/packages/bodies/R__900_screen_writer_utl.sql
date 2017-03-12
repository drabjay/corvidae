CREATE OR REPLACE PACKAGE BODY screen_writer_utl
AS

/******************************************************************************\
\******************************************************************************/
PROCEDURE sopen
IS
BEGIN
  dbms_output.enable;
END sopen;

/******************************************************************************\
\******************************************************************************/
PROCEDURE sclose
IS
BEGIN
  dbms_output.disable;
END sclose;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write
  (p_varchar2                     IN     VARCHAR2)
IS
BEGIN
  dbms_output.put(p_varchar2);
END write;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_line
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
BEGIN
  dbms_output.put_line(p_varchar2);
END write_line;

END screen_writer_utl;
/
