CREATE OR REPLACE PACKAGE BODY date_utl
AS

/******************************************************************************\
\******************************************************************************/
  c_nsv                          CONSTANT DATE := to_date('0000365:43994', 'J:SSSSS');

/******************************************************************************\
\******************************************************************************/
FUNCTION nsv
RETURN DATE
DETERMINISTIC
IS
BEGIN
  RETURN c_nsv;
END nsv;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_nsv
  (p_date                         IN     DATE)
RETURN BOOLEAN
DETERMINISTIC
IS
BEGIN
  IF p_date = c_nsv THEN
    RETURN TRUE;
  END IF;
  RETURN FALSE;
END is_nsv;

/******************************************************************************\
\******************************************************************************/
FUNCTION nvl
  (p_date_1                       IN     DATE
  ,p_date_2                       IN     DATE)
RETURN DATE
DETERMINISTIC
IS
  l_date                         DATE;
BEGIN
  l_date := p_date_1;
  IF is_nsv(p_date_1) THEN
    l_date := p_date_2;
  END IF;
  RETURN l_date;
END nvl;

END date_utl;
/
