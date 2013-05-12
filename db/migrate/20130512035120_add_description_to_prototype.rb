class AddDescriptionToPrototype < ActiveRecord::Migration
  def up
    add_column :prototypes, :description, :text
    
    add_index :prototypes, :user_id
    add_index :pages, :prototype_id
    add_index :pages, :sort
    add_index :links, :page_id
    add_index :users, :uid
  end
  
  def down
    remove_column :prototypes, :description
    
    remove_index :prototypes, :user_id
    remove_index :pages, :prototype_id
    remove_index :pages, :sort
    remove_index :links, :page_id
    remove_index :users, :uid
  end
end
