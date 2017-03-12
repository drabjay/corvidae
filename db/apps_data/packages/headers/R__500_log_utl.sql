CREATE OR REPLACE PACKAGE log_utl
AS

/******************************************************************************\
\******************************************************************************/
FUNCTION loff
RETURN NUMBER;

FUNCTION lfatal
RETURN NUMBER;

FUNCTION lerror
RETURN NUMBER;

FUNCTION lwarning
RETURN NUMBER;

FUNCTION linfo
RETURN NUMBER;

FUNCTION ldebug
RETURN NUMBER;

FUNCTION lall
RETURN NUMBER;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_level
  (p_level                        IN     NUMBER);

/******************************************************************************\
\******************************************************************************/
FUNCTION level
RETURN NUMBER;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_fatal
RETURN BOOLEAN;

FUNCTION is_error
RETURN BOOLEAN;

FUNCTION is_warning
RETURN BOOLEAN;

FUNCTION is_info
RETURN BOOLEAN;

FUNCTION is_debug
RETURN BOOLEAN;

FUNCTION is_all
RETURN BOOLEAN;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_alert
  (p_logging                      IN     BOOLEAN);

PROCEDURE set_to_dbtable
  (p_logging                      IN     BOOLEAN);

PROCEDURE set_to_screen
  (p_logging                      IN     BOOLEAN);

PROCEDURE set_to_trace
  (p_logging                      IN     BOOLEAN);

PROCEDURE set_to_vsession
  (p_logging                      IN     BOOLEAN);

/******************************************************************************\
\******************************************************************************/
FUNCTION is_to_alert
RETURN BOOLEAN;

FUNCTION is_to_dbtable
RETURN BOOLEAN;

FUNCTION is_to_screen
RETURN BOOLEAN;

FUNCTION is_to_trace
RETURN BOOLEAN;

FUNCTION is_to_vsession
RETURN BOOLEAN;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_line
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL);

PROCEDURE write_fatal
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL);

PROCEDURE write_error
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL);

PROCEDURE write_warning
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL);

PROCEDURE write_info
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL);

PROCEDURE write_debug
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL);

END log_utl;
/
