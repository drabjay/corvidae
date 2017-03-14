CREATE OR REPLACE PACKAGE BODY exception_utl
AS

/******************************************************************************\
\******************************************************************************/
  -- Numbers must match PRAGMA EXCEPTION_INIT numbers in package specification
  c_application_error_number    CONSTANT NUMBER := -20001;
  g_message_code                varchar2_utl.t_database_object;
  g_message                     varchar2_utl.t_maximum;

/******************************************************************************\
\******************************************************************************/
PROCEDURE evoke
  (p_message_code                 IN     VARCHAR2)
IS
BEGIN
  set_message(p_message_code);
  evoke;
END evoke;

/******************************************************************************\
\******************************************************************************/
PROCEDURE evoke
IS
BEGIN
  raise_application_error(application_error_number, g_message);
END evoke;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_message
  (p_message_code                 IN     VARCHAR2)
IS
BEGIN
  g_message_code := p_message_code;
  g_message := p_message_code;
END set_message;

/******************************************************************************\
\******************************************************************************/
FUNCTION application_error_number
RETURN NUMBER
DETERMINISTIC
IS
BEGIN
  RETURN c_application_error_number;
END application_error_number;

END exception_utl;
/
