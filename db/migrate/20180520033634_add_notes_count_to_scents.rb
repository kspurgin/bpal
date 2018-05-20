class AddNotesCountToScents < ActiveRecord::Migration[5.2]
  def change
    add_column :scents, :notes_count, :integer
  end
end
