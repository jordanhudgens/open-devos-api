class RemoveRequiredFromDataStore < ActiveRecord::Migration[6.1]
  def change
    change_column :data_stores, :user_id, :bigint, null: true
  end
end
