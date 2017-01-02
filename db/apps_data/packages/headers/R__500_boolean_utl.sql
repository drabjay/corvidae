CREATE OR REPLACE PACKAGE boolean_utl
AS

/******************************************************************************\
\******************************************************************************/
  gt_varchar2                    VARCHAR2(5);
  SUBTYPE t_varchar2 IS gt_varchar2%TYPE;

/******************************************************************************\
\******************************************************************************/
FUNCTION true_varchar2
RETURN VARCHAR2
DETERMINISTIC;

FUNCTION false_varchar2
RETURN VARCHAR2
DETERMINISTIC;

FUNCTION null_varchar2
RETURN VARCHAR2
DETERMINISTIC;

/******************************************************************************\
\******************************************************************************/
FUNCTION true_number
RETURN NUMBER
DETERMINISTIC;

FUNCTION false_number
RETURN NUMBER
DETERMINISTIC;

FUNCTION null_number
RETURN NUMBER
DETERMINISTIC;

END boolean_utl;
/
