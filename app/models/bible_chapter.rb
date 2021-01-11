class BibleChapter < ApplicationRecord
  belongs_to :bible_book

  has_many :bible_verses, dependent: :destroy

  validates_presence_of :chapter_number
end
