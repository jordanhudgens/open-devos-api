class AddDevReferenceToPlanAssignments < ActiveRecord::Migration[5.2]
  def change
    add_reference :plan_assignments, :devo, foreign_key: true
  end
end
