class AddPrototypeIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :prototype_id, :integer
  end
end
