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

/******************************************************************************\
\******************************************************************************/
FUNCTION to_boolean
  (p_varchar2                     IN     VARCHAR2)
RETURN BOOLEAN
DETERMINISTIC
IS
  l_boolean                      BOOLEAN;
BEGIN
  IF p_varchar2 = boolean_utl.false_varchar2 THEN
    l_boolean := FALSE;
  ELSIF p_varchar2 = boolean_utl.null_varchar2 THEN
    l_boolean := NULL;
  ELSIF p_varchar2 = boolean_utl.true_varchar2 THEN
    l_boolean := TRUE;
  ELSE
    RAISE value_error;
  END IF;
  RETURN l_boolean;
END to_boolean;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_date
  (p_varchar2                     IN     VARCHAR2
  ,p_format_model                 IN     VARCHAR2 DEFAULT NULL
  ,p_nls_parameters               IN     VARCHAR2 DEFAULT NULL)
RETURN DATE
IS
  l_date                         DATE;
BEGIN
  IF p_nls_parameters IS NULL THEN
    l_date := standard.to_date(p_varchar2, p_format_model);
  ELSE
    l_date := standard.to_date(p_varchar2, p_format_model, p_nls_parameters);
  END IF;
  RETURN l_date;
END to_date;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_number
  (p_varchar2                     IN     VARCHAR2
  ,p_format_model                 IN     VARCHAR2 DEFAULT NULL
  ,p_nls_parameters               IN     VARCHAR2 DEFAULT NULL)
RETURN NUMBER
IS
  l_number                       NUMBER;
BEGIN
  IF p_nls_parameters IS NULL THEN
    l_number := standard.to_number(p_varchar2, p_format_model);
  ELSE
    l_number := standard.to_number(p_varchar2, p_format_model, p_nls_parameters);
  END IF;
  RETURN l_number;
END to_number;

END varchar2_utl;
/
