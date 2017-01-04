CREATE OR REPLACE PACKAGE BODY date_utl
AS

/******************************************************************************\
\******************************************************************************/
  c_nsv                          CONSTANT DATE := canonical_utl.to_date('0000365:43994');

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

/******************************************************************************\
\******************************************************************************/
FUNCTION to_char
  (p_date                         IN     DATE
  ,p_format_model                 IN     VARCHAR2 DEFAULT NULL
  ,p_nls_parameters               IN     VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2
IS
  l_char                         varchar2_utl.t_maximum;
BEGIN
  IF p_nls_parameters IS NULL THEN
    l_char := standard.to_char(p_date, p_format_model);
  ELSE
    l_char := standard.to_char(p_date, p_format_model, p_nls_parameters);
  END IF;
  RETURN l_char;
END to_char;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_canonical
  (p_date                         IN     DATE)
RETURN VARCHAR2
DETERMINISTIC
IS
BEGIN
  RETURN standard.to_char(p_date, canonical_utl.date_format_model);
END to_canonical;

END date_utl;
/
