class BibleChapter < ApplicationRecord
  belongs_to :bible_book

  validates_presence_of :chapter_number
end
