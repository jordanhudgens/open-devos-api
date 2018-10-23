class AddPlanAssignmentsCountToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :plan_assignments_count, :integer, default: 0
  end
end
