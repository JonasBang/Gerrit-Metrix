class AddNullFalseToRoles < ActiveRecord::Migration
  def up
    change_column :roles, :name, :string, :null => false
    remove_index :roles, :name
    add_index :roles, :name, :unique => true
  end
  def down
    change_column :roles, :name, :string , :null => true
    remove_index :roles, :name
    add_index :roles, :name
  end
end
