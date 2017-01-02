CREATE OR REPLACE PACKAGE BODY number_utl
AS

/******************************************************************************\
\******************************************************************************/
  c_nsv                          CONSTANT NUMBER := -789456123;

/******************************************************************************\
\******************************************************************************/
FUNCTION nsv
RETURN NUMBER
DETERMINISTIC
IS
BEGIN
  RETURN c_nsv;
END nsv;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_nsv
  (p_number                       IN     NUMBER)
RETURN BOOLEAN
DETERMINISTIC
IS
BEGIN
  IF p_number = c_nsv THEN
    RETURN TRUE;
  END IF;
  RETURN FALSE;
END is_nsv;

/******************************************************************************\
\******************************************************************************/
FUNCTION nvl
  (p_number_1                     IN     NUMBER
  ,p_number_2                     IN     NUMBER)
RETURN NUMBER
DETERMINISTIC
IS
  l_number                       NUMBER;
BEGIN
  l_number := p_number_1;
  IF is_nsv(p_number_1) THEN
    l_number := p_number_2;
  END IF;
  RETURN l_number;
END nvl;

END number_utl;
/
