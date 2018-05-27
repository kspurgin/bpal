class AddDecisionToScent < ActiveRecord::Migration[5.2]
  def change
    add_column :scents, :decision, :integer, default: 0
  end
end
