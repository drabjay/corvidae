CREATE OR REPLACE PACKAGE varchar2_utl
AS

/******************************************************************************\
\******************************************************************************/
  gt_database_object            VARCHAR2(30);
  gt_maximum                    VARCHAR2(32767);
  gt_plsql_module               VARCHAR2(61); -- Allows for '<PACKAGE>.<MODULE>' value
  gt_plsql_object               VARCHAR2(30);
  gt_single_character           VARCHAR2(1);
  SUBTYPE t_database_object IS gt_database_object%TYPE;
  SUBTYPE t_maximum IS gt_maximum%TYPE;
  SUBTYPE t_plsql_module IS gt_plsql_module%TYPE;
  SUBTYPE t_plsql_object IS gt_plsql_object%TYPE;
  SUBTYPE t_single_character IS gt_single_character%TYPE;

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
