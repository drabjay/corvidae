CREATE OR REPLACE PACKAGE varchar2_utl
AS

/******************************************************************************\
\******************************************************************************/
  gt_maximum                     VARCHAR2(32767);
  SUBTYPE t_maximum IS gt_maximum%TYPE;

/******************************************************************************\
\******************************************************************************/
FUNCTION nsv
RETURN VARCHAR2
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_nsv
  (p_varchar2                     IN     VARCHAR2)
RETURN BOOLEAN
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION nvl
  (p_varchar2_1                   IN     VARCHAR2
  ,p_varchar2_2                   IN     VARCHAR2)
RETURN VARCHAR2
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_boolean
  (p_varchar2                     IN     VARCHAR2)
RETURN BOOLEAN
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_date
  (p_varchar2                     IN     VARCHAR2
  ,p_format_model                 IN     VARCHAR2 DEFAULT NULL
  ,p_nls_parameters               IN     VARCHAR2 DEFAULT NULL)
RETURN DATE;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_number
  (p_varchar2                     IN     VARCHAR2
  ,p_format_model                 IN     VARCHAR2 DEFAULT NULL
  ,p_nls_parameters               IN     VARCHAR2 DEFAULT NULL)
RETURN NUMBER;

END varchar2_utl;
/
