class CreateScents < ActiveRecord::Migration[5.2]
  def change
    create_table :scents do |t|
      t.string :name
      t.text :description
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
