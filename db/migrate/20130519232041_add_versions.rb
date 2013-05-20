class AddVersions < ActiveRecord::Migration
  def up
    create_table :page_versions do |t|
      t.integer :version
      t.integer :page_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
    
    add_index :page_versions, :version
    add_index :page_versions, :page_id
    
    remove_column :pages, :image_file_name
    remove_column :pages, :image_content_type
    remove_column :pages, :image_file_size
    remove_column :pages, :image_updated_at
    
    remove_column :links, :page_id
    
    add_column :links, :page_version_id, :integer
    
    add_index :links, :page_version_id
  end

  def down
    drop_table :page_versions
    
    add_column :pages, :image_file_name, :string
    add_column :pages, :image_content_type, :string
    add_column :pages, :image_file_size, :integer
    add_column :pages, :image_updated_at, :datetime
    
    add_column :links, :page_id, :integer
    add_index :links, :page_id
    
    remove_column :links, :page_version_id
  end
end
