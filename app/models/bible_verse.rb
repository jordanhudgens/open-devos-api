class BibleVerse < ApplicationRecord
  belongs_to :bible_chapter
  validates_presence_of :content, :verse_number
end
