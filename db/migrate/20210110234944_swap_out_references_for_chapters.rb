class SwapOutReferencesForChapters < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bible_chapters, :bible, index: true, foreign_key: true
    add_reference :bible_chapters, :bible_book
  end
end
