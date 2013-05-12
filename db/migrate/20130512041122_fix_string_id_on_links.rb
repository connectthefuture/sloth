class FixStringIdOnLinks < ActiveRecord::Migration
  def up
    remove_column :links, :page_id
    add_column :links, :page_id, :integer
    add_index :links, :page_id
  end

  def down
    remove_column :links, :page_id
    add_column :links, :page_id, :string
    add_index :links, :page_id
  end
end
