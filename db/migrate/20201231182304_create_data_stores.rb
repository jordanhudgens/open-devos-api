class CreateDataStores < ActiveRecord::Migration[6.1]
  def change
    create_table :data_stores do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :name, default: 0, null: false
      t.datetime :version_date, null: false
      t.jsonb :payload, null: false

      t.timestamps
    end
  end
end
