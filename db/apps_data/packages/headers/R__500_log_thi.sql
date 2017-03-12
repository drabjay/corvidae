CREATE OR REPLACE PACKAGE log_thi
AS

/******************************************************************************\
\******************************************************************************/
PROCEDURE create_entry
  (p_log_level                    IN     NUMBER
  ,p_log_text                     IN     VARCHAR2
  ,p_module_name                  IN     VARCHAR2      DEFAULT NULL
  ,p_section_number               IN     NUMBER        DEFAULT NULL
  ,p_variables                    IN     variables_tbl DEFAULT variables_tbl());

/******************************************************************************\
\******************************************************************************/
PROCEDURE delete_entry
  (p_log_id                       IN     NUMBER);

/******************************************************************************\
\******************************************************************************/
PROCEDURE delete_entries
  (p_username                     IN     VARCHAR2 DEFAULT NULL
  ,p_session_id                   IN     NUMBER   DEFAULT NULL
  ,p_log_date                     IN     DATE     DEFAULT NULL);

END log_thi;
/
