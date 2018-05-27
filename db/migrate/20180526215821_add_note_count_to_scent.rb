class AddNoteCountToScent < ActiveRecord::Migration[5.2]
  def change
    add_column :scents, :notes_count, :integer, default: 0
  end
end
