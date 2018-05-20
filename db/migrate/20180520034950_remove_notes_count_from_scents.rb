class RemoveNotesCountFromScents < ActiveRecord::Migration[5.2]
  def change
    remove_column :scents, :notes_count, :integer
  end
end
