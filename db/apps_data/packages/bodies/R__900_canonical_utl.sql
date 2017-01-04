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
FUNCTION to_date
  (p_canonical                    IN     VARCHAR2)
RETURN DATE
DETERMINISTIC
IS
BEGIN
  RETURN standard.to_date(p_canonical, date_format_model);
END to_date;

/******************************************************************************\
\******************************************************************************/
FUNCTION number_format_model
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN c_number_format_model;
END number_format_model;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_number
  (p_canonical                    IN     VARCHAR2)
RETURN NUMBER
DETERMINISTIC
IS
BEGIN
  RETURN standard.to_number(p_canonical, number_format_model);
END to_number;

END canonical_utl;
/
