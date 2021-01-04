class AddHeadlineToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :headline, :string, limit: 55
  end
end
