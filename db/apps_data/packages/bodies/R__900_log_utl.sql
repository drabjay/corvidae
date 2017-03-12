CREATE OR REPLACE PACKAGE BODY log_utl
AS

/******************************************************************************\
\******************************************************************************/
  c_loff                         CONSTANT NUMBER := 0;
  c_lfatal                       CONSTANT NUMBER := 10;
  c_lerror                       CONSTANT NUMBER := 20;
  c_lwarning                     CONSTANT NUMBER := 30;
  c_linfo                        CONSTANT NUMBER := 40;
  c_ldebug                       CONSTANT NUMBER := 50;
  c_lall                         CONSTANT NUMBER := 60;

  g_level                        NUMBER := c_loff;

  g_to_alert                     BOOLEAN := FALSE;
  g_to_dbtable                   BOOLEAN := TRUE;
  g_to_screen                    BOOLEAN := FALSE;
  g_to_trace                     BOOLEAN := FALSE;
  g_to_vsession                  BOOLEAN := FALSE;

/******************************************************************************\
\******************************************************************************/
FUNCTION loff
RETURN NUMBER
IS
BEGIN
  RETURN c_loff;
END loff;

/******************************************************************************\
\******************************************************************************/
FUNCTION lfatal
RETURN NUMBER
IS
BEGIN
  RETURN c_lfatal;
END lfatal;

/******************************************************************************\
\******************************************************************************/
FUNCTION lerror
RETURN NUMBER
IS
BEGIN
  RETURN c_lerror;
END lerror;

/******************************************************************************\
\******************************************************************************/
FUNCTION lwarning
RETURN NUMBER
IS
BEGIN
  RETURN c_lwarning;
END lwarning;

/******************************************************************************\
\******************************************************************************/
FUNCTION linfo
RETURN NUMBER
IS
BEGIN
  RETURN c_linfo;
END linfo;

/******************************************************************************\
\******************************************************************************/
FUNCTION ldebug
RETURN NUMBER
IS
BEGIN
  RETURN c_ldebug;
END ldebug;

/******************************************************************************\
\******************************************************************************/
FUNCTION lall
RETURN NUMBER
IS
BEGIN
  RETURN c_lall;
END lall;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_level
  (p_level                        IN     NUMBER)
IS
BEGIN
  IF p_level IN (loff, lfatal, lerror, lwarning, linfo, ldebug, lall) THEN
    g_level := p_level;
  END IF;
END set_level;

/******************************************************************************\
\******************************************************************************/
FUNCTION level
RETURN NUMBER
IS
BEGIN
  RETURN g_level;
END level;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_fatal
RETURN BOOLEAN
IS
BEGIN
  RETURN level >= lfatal;
END is_fatal;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_error
RETURN BOOLEAN
IS
BEGIN
  RETURN level >= lerror;
END is_error;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_warning
RETURN BOOLEAN
IS
BEGIN
  RETURN level >= lwarning;
END is_warning;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_info
RETURN BOOLEAN
IS
BEGIN
  RETURN level >= linfo;
END is_info;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_debug
RETURN BOOLEAN
IS
BEGIN
  RETURN level >= ldebug;
END is_debug;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_all
RETURN BOOLEAN
IS
BEGIN
  RETURN level >= lall;
END is_all;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_alert
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF (p_logging IS NOT NULL) THEN
    g_to_alert := p_logging;
  END IF;
END set_to_alert;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_dbtable
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF (p_logging IS NOT NULL) THEN
    g_to_dbtable := p_logging;
  END IF;
END set_to_dbtable;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_screen
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF (p_logging IS NOT NULL) THEN
    g_to_screen := p_logging;
  END IF;
END set_to_screen;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_trace
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF (p_logging IS NOT NULL) THEN
    g_to_trace := p_logging;
  END IF;
END set_to_trace;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_vsession
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF (p_logging IS NOT NULL) THEN
    g_to_vsession := p_logging;
  END IF;
END set_to_vsession;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_to_alert
RETURN BOOLEAN
IS
BEGIN
  RETURN g_to_alert;
END is_to_alert;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_to_dbtable
RETURN BOOLEAN
IS
BEGIN
  RETURN g_to_dbtable;
END is_to_dbtable;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_to_screen
RETURN BOOLEAN
IS
BEGIN
  RETURN g_to_screen;
END is_to_screen;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_to_trace
RETURN BOOLEAN
IS
BEGIN
  RETURN g_to_trace;
END is_to_trace;

/******************************************************************************\
\******************************************************************************/
FUNCTION is_to_vsession
RETURN BOOLEAN
IS
BEGIN
  RETURN g_to_vsession;
END is_to_vsession;

END log_utl;
/
