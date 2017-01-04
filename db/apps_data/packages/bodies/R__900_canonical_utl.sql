CREATE OR REPLACE PACKAGE BODY canonical_utl
AS

/******************************************************************************\
\******************************************************************************/
  c_date_format_model            CONSTANT t_format_model := 'J:SSSSS';
  c_number_format_model          CONSTANT t_format_model := 'FM99999999999999999999999999999999999990.099999999999999999999999';

/******************************************************************************\
\******************************************************************************/
FUNCTION date_format_model
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN c_date_format_model;
END date_format_model;

/******************************************************************************\
\******************************************************************************/
FUNCTION number_format_model
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN c_number_format_model;
END number_format_model;

END canonical_utl;
/
