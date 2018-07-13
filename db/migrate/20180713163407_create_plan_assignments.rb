class CreatePlanAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_assignments do |t|
      t.references :plan, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
