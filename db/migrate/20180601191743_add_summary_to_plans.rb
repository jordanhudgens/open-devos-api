class AddSummaryToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :summary, :text
  end
end
