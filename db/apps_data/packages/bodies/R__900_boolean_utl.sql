CREATE OR REPLACE PACKAGE BODY boolean_utl
AS

/******************************************************************************\
\******************************************************************************/
  c_true_varchar2                CONSTANT t_varchar2 := 'TRUE';
  c_false_varchar2               CONSTANT t_varchar2 := 'FALSE';
  c_null_varchar2                CONSTANT t_varchar2 := 'NULL';
  c_true_number                  CONSTANT NUMBER := 1;
  c_false_number                 CONSTANT NUMBER := 0;
  c_null_number                  CONSTANT NUMBER := NULL;

/******************************************************************************\
\******************************************************************************/
FUNCTION true_varchar2
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN c_true_varchar2;
END true_varchar2;

/******************************************************************************\
\******************************************************************************/
FUNCTION false_varchar2
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN c_false_varchar2;
END false_varchar2;

/******************************************************************************\
\******************************************************************************/
FUNCTION null_varchar2
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN c_null_varchar2;
END null_varchar2;

/******************************************************************************\
\******************************************************************************/
FUNCTION true_number
RETURN NUMBER
DETERMINISTIC
IS
BEGIN
  RETURN c_true_number;
END true_number;

/******************************************************************************\
\******************************************************************************/
FUNCTION false_number
RETURN NUMBER
DETERMINISTIC
IS
BEGIN
  RETURN c_false_number;
END false_number;

/******************************************************************************\
\******************************************************************************/
FUNCTION null_number
RETURN NUMBER
DETERMINISTIC
IS
BEGIN
  RETURN c_null_number;
END null_number;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_char
  (p_boolean                      IN     BOOLEAN)
RETURN VARCHAR2
DETERMINISTIC
IS
  l_varchar2                     t_varchar2;
BEGIN
  IF p_boolean THEN
    l_varchar2 := true_varchar2;
  ELSIF NOT p_boolean THEN
    l_varchar2 := false_varchar2;
  ELSE
    l_varchar2 := null_varchar2;
  END IF;
  RETURN l_varchar2;
END to_char;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_number
  (p_boolean                      IN     BOOLEAN)
RETURN NUMBER
DETERMINISTIC
IS
  l_number                       NUMBER;
BEGIN
  IF p_boolean THEN
    l_number := true_number;
  ELSIF NOT p_boolean THEN
    l_number := false_number;
  ELSE
    l_number := null_number;
  END IF;
  RETURN l_number;
END to_number;

END boolean_utl;
/
