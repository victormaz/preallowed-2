# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 11) do

  create_table "clients", :force => true do |t|
    t.column "name",       :string
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  create_table "log_records", :force => true do |t|
    t.column "subject_id",  :integer,  :null => false
    t.column "scope_id",    :integer,  :null => false
    t.column "resource_id", :integer,  :null => false
    t.column "granted",     :boolean
    t.column "notes",       :string
    t.column "created_at",  :datetime, :null => false
    t.column "updated_at",  :datetime, :null => false
  end

  add_index "log_records", ["subject_id"], :name => "fk_log_records_subject"
  add_index "log_records", ["scope_id"], :name => "fk_log_records_scope"
  add_index "log_records", ["resource_id"], :name => "fk_log_records_resource"

  create_table "principal_types", :force => true do |t|
    t.column "name",       :string
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  create_table "principals", :force => true do |t|
    t.column "value",             :string
    t.column "principal_type_id", :integer,  :null => false
    t.column "subject_id",        :integer,  :null => false
    t.column "created_at",        :datetime, :null => false
    t.column "updated_at",        :datetime, :null => false
  end

  add_index "principals", ["subject_id"], :name => "fk_principals_subject"
  add_index "principals", ["principal_type_id"], :name => "fk_principals_principal_type"

  create_table "resource_types", :force => true do |t|
    t.column "name",       :string
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  create_table "resources", :force => true do |t|
    t.column "name",             :string
    t.column "resource_type_id", :integer,  :null => false
    t.column "scope_id",         :integer,  :null => false
    t.column "created_at",       :datetime, :null => false
    t.column "updated_at",       :datetime, :null => false
  end

  add_index "resources", ["scope_id"], :name => "fk_resources_scope"
  add_index "resources", ["resource_type_id"], :name => "fk_resources_resource_type"

  create_table "resources_roles", :id => false, :force => true do |t|
    t.column "resource_id", :integer,  :null => false
    t.column "role_id",     :integer,  :null => false
    t.column "created_at",  :datetime, :null => false
    t.column "updated_at",  :datetime, :null => false
  end

  add_index "resources_roles", ["resource_id", "role_id"], :name => "index_resources_roles_on_resource_id_and_role_id"
  add_index "resources_roles", ["role_id"], :name => "fk_resources_roles_role"

  create_table "roles", :force => true do |t|
    t.column "name",       :string
    t.column "client_id",  :integer,  :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  add_index "roles", ["client_id"], :name => "fk_roles_client"

  create_table "roles_subjects", :id => false, :force => true do |t|
    t.column "role_id",    :integer,  :null => false
    t.column "subject_id", :integer,  :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  add_index "roles_subjects", ["role_id", "subject_id"], :name => "index_roles_subjects_on_role_id_and_subject_id"
  add_index "roles_subjects", ["subject_id"], :name => "fk_roles_subjects_subject"

  create_table "scopes", :force => true do |t|
    t.column "name",       :string
    t.column "client_id",  :integer,  :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  add_index "scopes", ["client_id"], :name => "fk_scopes_client"

  create_table "subjects", :force => true do |t|
    t.column "name",       :string
    t.column "client_id",  :integer,  :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
  end

  add_index "subjects", ["client_id"], :name => "fk_subjects_client"

end
