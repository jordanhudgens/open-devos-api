class Bible < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name

  has_many :bible_books, dependent: :destroy
end
