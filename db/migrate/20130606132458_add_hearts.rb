class AddHearts < ActiveRecord::Migration
  def up
    create_table :hearts do |t|
      t.integer :heartable_id
      t.string :heartable_type
      t.integer :user_id

      t.timestamps
    end
    
    add_index :hearts, [:heartable_id, :heartable_type]
    add_index :hearts, :heartable_id
    add_index :hearts, :heartable_type
    add_index :hearts, :user_id
    
    create_table :views do |t|
      t.integer :viewable_id
      t.string :viewable_type
      t.integer :user_id

      t.timestamps
    end
    
    add_index :views, [:viewable_id, :viewable_type]
    add_index :views, :viewable_id
    add_index :views, :viewable_type
    add_index :views, :user_id
  end
  
  def down
    drop_table :hearts
    drop_table :views
  end
end
