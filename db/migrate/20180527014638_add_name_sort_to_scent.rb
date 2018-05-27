class AddNameSortToScent < ActiveRecord::Migration[5.2]
  def change
    add_column :scents, :name_sort, :string
  end
end
