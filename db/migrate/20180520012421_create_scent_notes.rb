class CreateScentNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :scent_notes do |t|
      t.references :scent, foreign_key: true
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
