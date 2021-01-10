class CreateBibleBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :bible_books do |t|
      t.string :name, null: false
      t.integer :position, null: false
      t.references :bible, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
    add_index :bible_books, :slug, unique: true
  end
end
