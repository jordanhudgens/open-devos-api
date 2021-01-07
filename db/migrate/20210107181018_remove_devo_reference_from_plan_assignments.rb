class RemoveDevoReferenceFromPlanAssignments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :plan_assignments, :devo
  end
end
