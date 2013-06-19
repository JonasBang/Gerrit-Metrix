class ChangeIndexNameForRolesNameAndResources < ActiveRecord::Migration
  def up
    remove_index "roles", ["name", "resource_type", "resource_id"]
    add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resources"
  end

  def down
    remove_index "roles", ["name", "resource_type", "resource_id"]
    add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  end
end
