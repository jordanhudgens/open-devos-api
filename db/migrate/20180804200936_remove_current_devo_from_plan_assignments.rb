class RemoveCurrentDevoFromPlanAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :plan_assignments, :current_devo, :integer
  end
end
