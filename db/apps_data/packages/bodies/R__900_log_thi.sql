CREATE OR REPLACE PACKAGE BODY log_thi
AS

/******************************************************************************\
\******************************************************************************/
  c_log_text_max_length          CONSTANT NUMBER := 2000;
  c_module_name_max_length       CONSTANT NUMBER := 61;
  c_error_backtrace_max_length   CONSTANT NUMBER := 2000;

/******************************************************************************\
\******************************************************************************/
PROCEDURE create_entry
  (p_log_level                    IN     NUMBER
  ,p_log_text                     IN     VARCHAR2
  ,p_module_name                  IN     VARCHAR2      DEFAULT NULL
  ,p_section_number               IN     NUMBER        DEFAULT NULL
  ,p_variables                    IN     variables_tbl DEFAULT variables_tbl())
IS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  INSERT INTO logs
    (log_id
    ,log_date
    ,username
    ,session_id
    ,log_level
    ,log_text
    ,module_name
    ,section_number
    ,error_backtrace
    ,variables)
  VALUES
    (logs_s.nextval
    ,systimestamp
    ,sys_context('USERENV', 'SESSION_USER')
    ,sys_context('USERENV', 'SESSIONID')
    ,p_log_level
    ,substr(p_log_text, 1, c_log_text_max_length)
    ,substr(nvl(p_module_name, 'NULL'), 1, c_module_name_max_length)
    ,nvl(p_section_number, 0)
    ,substr(dbms_utility.format_error_backtrace, 1, c_error_backtrace_max_length)
    ,p_variables);
  COMMIT;
END create_entry;

/******************************************************************************\
\******************************************************************************/
PROCEDURE delete_entry
  (p_log_id                       IN     NUMBER)
IS
BEGIN
  DELETE FROM logs l
  WHERE l.log_id = p_log_id;
END delete_entry;

/******************************************************************************\
\******************************************************************************/
PROCEDURE delete_entries
  (p_username                     IN     VARCHAR2 DEFAULT NULL
  ,p_session_id                   IN     NUMBER   DEFAULT NULL
  ,p_log_date                     IN     DATE     DEFAULT NULL)
IS
BEGIN
  DELETE FROM logs l
   WHERE (  p_username IS NULL
         OR l.username = p_username)
     AND (  p_session_id IS NULL
         OR l.session_id = p_session_id)
     AND (  p_log_date IS NULL
         OR l.log_date <= p_log_date);
END delete_entries;

END log_thi;
/
