class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true

      t.integer :status, default: 0

      t.timestamps
    end
  end
end
