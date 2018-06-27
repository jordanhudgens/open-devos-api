class Devo < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_term, against: [:title, :content],
    using: {
      tsearch: {
        any_word: true,
        prefix: true
      }
    }

  has_one_attached :devo_image

  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :plan

  enum status: {
    draft: 0,
    published: 1
  }

  validates_presence_of :title, :content, :position, :plan_id

  def last_published
    self.updated_at
  end

  def featured_image
    self.devo_image.attachment.service_url
  end
end
