class CreateBibleVerses < ActiveRecord::Migration[6.1]
  def change
    create_table :bible_verses do |t|
      t.integer :verse_number
      t.text :content
      t.references :bible_chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
