class AddSlugToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :slug, :string
  end
end
