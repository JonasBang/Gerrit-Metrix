class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name, :null => false
      t.string :url, :null => false
      t.string :username, :null => false
      t.string :password, :null => false

      t.timestamps
    end

    add_index :servers, :name, :unique => true
    add_index :servers, :url, :unique => true
  end
end
