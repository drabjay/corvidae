CREATE OR REPLACE PACKAGE BODY varchar2_utl
AS

/******************************************************************************\
\******************************************************************************/
  c_nsv                          CONSTANT VARCHAR2(10) := '$$$Null$$$';

/******************************************************************************\
\******************************************************************************/
FUNCTION nsv
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN c_nsv;
END nsv;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_nsv
  (p_varchar2                     IN     VARCHAR2)
RETURN BOOLEAN
DETERMINISTIC
IS
BEGIN
  IF p_varchar2 = c_nsv THEN
    RETURN TRUE;
  END IF;
  RETURN FALSE;
END is_nsv;

/******************************************************************************\
\******************************************************************************/
FUNCTION nvl
  (p_varchar2_1                   IN     VARCHAR2
  ,p_varchar2_2                   IN     VARCHAR2)
RETURN VARCHAR2
DETERMINISTIC
IS
  l_varchar2                     t_maximum;
BEGIN
  l_varchar2 := p_varchar2_1;
  IF is_nsv(p_varchar2_1) THEN
    l_varchar2 := p_varchar2_2;
  END IF;
  RETURN l_varchar2;
END nvl;

END varchar2_utl;
/
