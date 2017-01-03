CREATE OR REPLACE PACKAGE number_utl
AS

/******************************************************************************\
\******************************************************************************/
FUNCTION nsv
RETURN NUMBER
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_nsv
  (p_number                       IN     NUMBER)
RETURN BOOLEAN
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION nvl
  (p_number_1                     IN     NUMBER
  ,p_number_2                     IN     NUMBER)
RETURN NUMBER
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_boolean
  (p_number                       IN     NUMBER)
RETURN BOOLEAN
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION to_char
  (p_number                       IN     NUMBER
  ,p_format_model                 IN     VARCHAR2 DEFAULT NULL
  ,p_nls_parameters               IN     VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2;

END number_utl;
/
