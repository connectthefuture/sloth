class AddComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :page_version_id
      t.text :body
      t.integer :pos_x
      t.integer :pos_y
      
      t.timestamps
    end
    
    add_index :comments, :created_at
    add_index :comments, :user_id
    add_index :comments, :page_version_id
  end

  def down
    drop_table :comments
  end
end
