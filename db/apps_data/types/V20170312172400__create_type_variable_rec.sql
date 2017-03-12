CREATE OR REPLACE TYPE variable_rec
AS OBJECT
  (variable_name                  VARCHAR2(30)
  ,variable_type                  VARCHAR2(1)
  ,variable_value                 VARCHAR2(2000));
