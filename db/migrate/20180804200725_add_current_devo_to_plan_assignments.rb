class AddCurrentDevoToPlanAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :plan_assignments, :current_devo, :integer, default: 0
  end
end
