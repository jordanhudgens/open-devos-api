class CreateDevos < ActiveRecord::Migration[5.2]
  def change
    create_table :devos do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.integer :position
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
