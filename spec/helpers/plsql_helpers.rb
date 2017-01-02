# Patch ruby-plsql to deal with synonym chains correctly
PLSQL::Schema.class_eval do
  private

  def find_database_object(name, override_schema_name = nil)
    object_schema_name = override_schema_name || schema_name
    object_name = name.to_s.upcase
    if row = select_first(
        "SELECT o.object_type, o.object_id, o.status,
        (CASE WHEN o.object_type = 'PACKAGE'
        THEN (SELECT ob.status FROM all_objects ob
        WHERE ob.owner = o.owner AND ob.object_name = o.object_name AND ob.object_type = 'PACKAGE BODY')
        ELSE NULL END) body_status
        FROM all_objects o
        WHERE owner = :owner AND object_name = :object_name
        AND object_type IN ('PROCEDURE','FUNCTION','PACKAGE','TABLE','VIEW','SEQUENCE','TYPE')
        UNION ALL
        SELECT 'SYNONYM', NULL, NULL, NULL
        FROM all_synonyms
        WHERE owner = :owner AND synonym_name = :object_name",
        object_schema_name, object_name, object_schema_name, object_name)
      object_type, object_id, status, body_status = row
      raise ArgumentError, "Database object '#{object_schema_name}.#{object_name}' is not in valid status\n#{
        _errors(object_schema_name, object_name, object_type)}" if status == 'INVALID'
      raise ArgumentError, "Package '#{object_schema_name}.#{object_name}' body is not in valid status\n#{
        _errors(object_schema_name, object_name, 'PACKAGE BODY')}" if body_status == 'INVALID'
      case object_type
      when 'PROCEDURE', 'FUNCTION'
        if (connection.database_version <=> [11, 1, 0, 0]) >= 0
          row = select_first(
            "SELECT p.object_id FROM all_procedures p
             WHERE p.owner = :owner
               AND p.object_name = :object_name
               AND p.object_type = :object_type",
             object_schema_name, object_name, object_type)
          object_id = row[0]
        end
        PLSQL::Procedure.new(self, name, nil, override_schema_name, object_id)
      when 'PACKAGE'
        PLSQL::Package.new(self, name, override_schema_name)
      when 'TABLE'
        PLSQL::Table.new(self, name, override_schema_name)
      when 'VIEW'
        PLSQL::View.new(self, name, override_schema_name)
      when 'SEQUENCE'
        PLSQL::Sequence.new(self, name, override_schema_name)
      when 'TYPE'
        PLSQL::Type.new(self, name, override_schema_name)
      when 'SYNONYM'
        target_schema_name, target_object_name = @connection.describe_synonym(object_schema_name, object_name)
        find_database_object(target_object_name, target_schema_name)
      end
    end
  end
end
