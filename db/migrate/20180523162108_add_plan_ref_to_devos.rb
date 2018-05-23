class AddPlanRefToDevos < ActiveRecord::Migration[5.2]
  def change
    add_reference :devos, :plan, foreign_key: true
  end
end
