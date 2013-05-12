class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :page_id
      t.integer :pos_x
      t.integer :pos_y
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
