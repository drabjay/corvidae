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

END log_utl;
/
