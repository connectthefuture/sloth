class AddPermalinkToPrototype < ActiveRecord::Migration
  def up
    add_column :prototypes, :permalink, :string
    add_index :prototypes, :permalink
  end
  
  def down
    remove_column :prototypes, :permalink
  end
end
