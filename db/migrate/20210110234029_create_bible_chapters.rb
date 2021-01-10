class CreateBibleChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :bible_chapters do |t|
      t.references :bible, null: false, foreign_key: true
      t.integer :chapter_number

      t.timestamps
    end
  end
end
