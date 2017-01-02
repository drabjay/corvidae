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

END number_utl;
/