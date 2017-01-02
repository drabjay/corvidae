CREATE OR REPLACE PACKAGE varchar2_utl
AS

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

END varchar2_utl;
/
