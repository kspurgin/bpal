class RemoveNoteCountFromScent < ActiveRecord::Migration[5.2]
  def change
    remove_column :scents, :note_count, :integer
  end
end
