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

  g_format_model                 varchar2_utl.t_maximum := 'YYYY-MM-DD:HH24:MI:SS';

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
  IF p_logging IS NOT NULL THEN
    g_to_alert := p_logging;
  END IF;
END set_to_alert;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_dbtable
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF p_logging IS NOT NULL THEN
    g_to_dbtable := p_logging;
  END IF;
END set_to_dbtable;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_screen
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF p_logging IS NOT NULL THEN
    g_to_screen := p_logging;
  END IF;
END set_to_screen;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_trace
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF p_logging IS NOT NULL THEN
    g_to_trace := p_logging;
  END IF;
END set_to_trace;

/******************************************************************************\
\******************************************************************************/
PROCEDURE set_to_vsession
  (p_logging                      IN     BOOLEAN)
IS
BEGIN
  IF p_logging IS NOT NULL THEN
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

/******************************************************************************\
\******************************************************************************/
FUNCTION formatted_varchar2
  (p_level                        IN     NUMBER
  ,p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2
IS
  l_varchar2                     varchar2_utl.t_maximum;
BEGIN
  l_varchar2 := l_varchar2 || '[' || date_utl.to_char(sysdate, g_format_model) || ']';
  l_varchar2 := l_varchar2 || '[' || user || ']';
  l_varchar2 := l_varchar2 || '[' || number_utl.to_char(p_level, '00') || ']';
  -- l_varchar2 := l_varchar2 || '[' || module_utl.present || ':' || module_utl.section || ']';
  l_varchar2 := l_varchar2 || '[' || p_varchar2 || ']';
  RETURN l_varchar2;
END formatted_varchar2;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_line
  (p_level                        IN     NUMBER
  ,p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
  l_varchar2                     varchar2_utl.t_maximum;
BEGIN
  IF is_to_alert OR is_to_trace OR is_to_screen THEN
    l_varchar2 := formatted_varchar2(p_level, p_varchar2);
    IF is_to_alert THEN
      dbms_system.ksdwrt(2, l_varchar2);
    END IF;
    IF is_to_trace THEN
      dbms_system.ksdwrt(1, l_varchar2);
    END IF;
    IF is_to_screen THEN
      screen_writer_utl.write_line(l_varchar2);
    END IF;
  END IF;
  IF is_to_dbtable THEN
    log_thi.create_entry
      (p_log_level                    => p_level
      ,p_log_text                     => p_varchar2);
--      ,p_module_name                  => module_utl.present
--      ,p_section_number               => module_utl.section
--      ,p_variables                    => module_utl.variables);
  END IF;
  IF is_to_vsession THEN
    dbms_application_info.set_client_info(p_varchar2);
  END IF;
END write_line;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_line
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
BEGIN
  write_line(loff, p_varchar2);
END write_line;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_fatal
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
BEGIN
  IF is_fatal THEN
    write_line(lfatal, p_varchar2);
  END IF;
END write_fatal;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_error
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
BEGIN
  IF is_error THEN
    write_line(lerror, p_varchar2);
  END IF;
END write_error;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_warning
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
BEGIN
  IF is_warning THEN
    write_line(lwarning, p_varchar2);
  END IF;
END write_warning;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_info
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
BEGIN
  IF is_info THEN
    write_line(linfo, p_varchar2);
  END IF;
END write_info;

/******************************************************************************\
\******************************************************************************/
PROCEDURE write_debug
  (p_varchar2                     IN     VARCHAR2 DEFAULT NULL)
IS
BEGIN
  IF is_debug THEN
    write_line(ldebug, p_varchar2);
  END IF;
END write_debug;

END log_utl;
/
