class AddSortToPage < ActiveRecord::Migration
  def change
    add_column :pages, :sort, :integer
  end
end
