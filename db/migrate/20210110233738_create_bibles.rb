class CreateBibles < ActiveRecord::Migration[6.1]
  def change
    create_table :bibles do |t|
      t.string :name
      t.string :slug, unique: true, index: true

      t.timestamps
    end
  end
end
