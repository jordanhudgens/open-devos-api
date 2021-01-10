class BibleBook < ApplicationRecord
  belongs_to :bible

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :position

  has_many :bible_chapters, dependent: :destroy
end
